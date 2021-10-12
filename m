Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7F142A957
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:24:14 +0200 (CEST)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKZZ-0000Rv-3R
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXW-000606-GZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:06 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXU-000418-Tj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:06 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r2so14317846pgl.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=krNZ+k36Q7kVN35RCh7k4261FBntNustDkikqfFBngI=;
 b=McshbjtBY9IGbVlSC3pO77/bHbXzdPkUeyc7qu4ETA1+Dp0H02kXIMOsB3UdDUCgFu
 8T7Z19rGOlHhV9m94GPf3ZhLjRvI1t7A0yE6dEz+9WnEDSU4uQMS561cWkVMyeZ+BOi8
 SHQVaoT6+qNCymU7HyLpJv/D1oBlG9PpWtdNVG6WnUSEgLwori/B54LU2IKIKAJbwlHy
 q5M/IrwwwNsnQdlQbUndr2MOy1ymPvRqPxaZ1hpWrHU9Bjw9Wf96iSOwMnqVWlipu+v+
 zTfDNQUx31bkRP55xjn2tgEQJ0thUl9n2k89vUAGkkrDVty3pRgKlogzRsEEAYv3cb1b
 m2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=krNZ+k36Q7kVN35RCh7k4261FBntNustDkikqfFBngI=;
 b=ZzRulj6GktSIEcp0sZrhiNBl5K0awMfiCCIUGSTbgcY4lMBWQ26OiXXxcmKg9e2ZVi
 psgKGOnYysc9hJ9HehTmrAoMK6Muugs7r/2qUkWoHSWUxNC7b+Fh1VjxUbM55Lyvm5uM
 QniQPF1YXEXILOQMlm0+C7DVgSKaL7l4Em+Nw026fP7Dyp/2pbizYEShLCr30kqdSRaW
 C/EKrGmVbhQwKw5pT+UFsdeEr3Le41yL/WZpkJ9xieGOCgFpqU639LD8IpKx+eXSeZVz
 TZuvS2HXToc1vm8LM+QcpJ34tz9i7FpbG7HnihiMv+X1rECmbRnDN3mKD1QGItd4QWqR
 Tjzw==
X-Gm-Message-State: AOAM531IsX5L5qQsBGn5D31Ls/3Fv5GxiyuDLwjiwApE0OQYlhODTzA1
 jDQQIAqjBziwFKutxNZc4thmksNGjvyzaQ==
X-Google-Smtp-Source: ABdhPJzbbIzsMzp0CfPW40q2plM39t5OTXyWEJaCTl0STOC8pI2a0fxHM/gVFKrMp9cRrs/MQZYHMw==
X-Received: by 2002:aa7:8298:0:b029:338:340:a085 with SMTP id
 s24-20020aa782980000b02903380340a085mr32895426pfm.46.1634055723546; 
 Tue, 12 Oct 2021 09:22:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/23] target/avr: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:39 -0700
Message-Id: <20211012162159.471406-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Tested-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 438e7b13c1..af8a3e0f9c 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1087,11 +1087,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
@@ -3009,17 +3005,10 @@ static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         tcg_gen_movi_tl(cpu_pc, ctx->npc);
         /* fall through */
     case DISAS_LOOKUP:
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        }
-        /* fall through */
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_EXIT:
-        if (ctx->base.singlestep_enabled) {
-            gen_helper_debug(cpu_env);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


