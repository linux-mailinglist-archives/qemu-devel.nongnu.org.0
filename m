Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD042A961
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:27:27 +0200 (CEST)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKcg-00069I-Pa
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXX-00063P-MT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:07 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXW-00042T-3d
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id y7so8458945pfg.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0oIDXf4AcZ4FiRCcBJuMG/3pVjCeVFNh0lkYAhoInys=;
 b=gzXi/2lafNAwmoi57xY8GyMNDa6VAek8d1XdVMzuPXlJw9yNXy7PsHJs60jT8qVLoh
 LzECky88jIfgSg3lEv5K1Hm9TYpWMubo61PzxPa7en6hwRVy96Vapaa9ewkHb4rp1nDp
 yXgfSvrbWDaoJzt6FHrjU+jtGi84hxpgC2F6lde21EhcqsDLHobtVJR8T3lEngm5zGdU
 OrS2Dbmqyad5ka+vyq5HFJHVbBFcjw3xU1QuWugUwe/KR6YjPjDi0Lhf0c4CjsypjhWy
 nSANDKLqZ2BUMezcIcu+HoZv3eQ4FYer9EV6b++KbvLKAu1EBhjtV22J5CHBJddBVf+M
 iz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oIDXf4AcZ4FiRCcBJuMG/3pVjCeVFNh0lkYAhoInys=;
 b=YZigBZWqpCHly0sAqgGq3zAPSw8uYq/vjNVi3U3NTzpz+uRKZtTsg94al1KMMeQcE/
 Jza/Fohv8hCio/Jk32NEaZymiMGvKd2ItxP7S43D0iue5iuL5R+7SLixzbWwT+cpA6or
 hXD26/xzxNooiW3Cqs3NefkqfGvy3yetbEkYi3GJvjnqJtxAj/yen9KDsD/5sO5vQHyS
 wm2nk7zI0ZM0D41EV1ncWoTuyap9xrKq8Xs0xJuMkQ60IsuPrg4joMfeGBssPfkL0uRr
 uiZ9oczblYFJhioLkayfhz1yHKeN4V77cH4KZbOn8auutHSad977163VMvAg58dXaOuc
 qnKg==
X-Gm-Message-State: AOAM533YgdT5lgjUxOKAp3lLHq3CxyHwrKcuKrdy208vfFsTf9K3YIEF
 ULmpk5OwOcJOyJZJmZa7z0K4Z2J3JmWhfA==
X-Google-Smtp-Source: ABdhPJwV7sZmrJNJxkIQTWsD0w7gKnhyX2EiDzYH3fOdfWHsCENr12YQzfgYhiBLmaLZEsoaf+ToyA==
X-Received: by 2002:a63:b341:: with SMTP id x1mr23858247pgt.69.1634055724704; 
 Tue, 12 Oct 2021 09:22:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/23] target/hexagon: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:41 -0700
Message-Id: <20211012162159.471406-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/translate.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 4f05ce3388..159931e8ee 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -69,11 +69,7 @@ static void gen_end_tb(DisasContext *ctx)
 {
     gen_exec_counters(ctx);
     tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
-    if (ctx->base.singlestep_enabled) {
-        gen_exception_raw(EXCP_DEBUG);
-    } else {
-        tcg_gen_exit_tb(NULL, 0);
-    }
+    tcg_gen_exit_tb(NULL, 0);
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -614,11 +610,7 @@ static void hexagon_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_TOO_MANY:
         gen_exec_counters(ctx);
         tcg_gen_movi_tl(hex_gpr[HEX_REG_PC], ctx->base.pc_next);
-        if (ctx->base.singlestep_enabled) {
-            gen_exception_raw(EXCP_DEBUG);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     case DISAS_NORETURN:
         break;
-- 
2.25.1


