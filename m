Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101742A958
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:24:15 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKZa-0000VU-7N
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXX-000622-6k
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:07 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXV-000421-I7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:06 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q19so7046pfl.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I0CzIZRWI2JoSPxoR4xs5SpApEcqlDWMcO9xYzu4ImA=;
 b=mQJrLDzhp0gZbCexglYPxxeFkQ5aVC1sjae3pU8U6mVcqKtiqderx+PAPGHJaAXzeG
 09tAHgycMXQhvKHKA6KRH8a2EG2EZr1miTa957J2gL6X5XVdXJUyF6ddnqOKT/8q2ZuJ
 3fKQ6lcXg3PROtOR3/JMrpguM3wzQIYr3rANx28NFLgP4IvsL6I+X/bxzh5hoIlleVFW
 vLXA9ulcwHlNQjJEDsZ7C3BYf0r70PUGOzzpAjzWKemqGw+qq4VEH94SOejfAXkb/wB8
 FecYD37txqawSPr180zmKLa3hWHeNjYFfEE1brmcsxl+P7iGwCFzofULE0Ph+WQWA5TD
 OSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0CzIZRWI2JoSPxoR4xs5SpApEcqlDWMcO9xYzu4ImA=;
 b=4zC7vNTnztyHSbHUzrHLK45xqeP9P+eBODyJQXpo2KywgSa8bhEIkSMs+8fPiELlC/
 +cfz03BLJWXdzO3kbRxNaPni0q28jJZpDBO2MWyVkuM9cWWAe0UQJ7D+U2Bp1+G0YS5P
 HE5hWNbmLRI0ph1OA06JBlXRSKx7dIq2AM5qpL5dRZMDWreoKc884CJ860RToBKOEqGt
 VujEs6uV8DH8oMLIb4/l9q18RKQzFdDXQZLQS2GvLoE27Sx3LUDQYZ5tVOzlM6FkXfWu
 XAdH4zc5qf8NKic6FG3/zbD2/WorTAMC07M0BvgFd/reJVg7/zNKa6fV2TEpwTJv4V/O
 vbCQ==
X-Gm-Message-State: AOAM5300KrAEmu0gf2vAU2m24fIJmDzYu9qB5M/NWrK137sSjUJ/j31e
 3yOI6nlvY+oxMZNytJJa1cZ1hWTHrQ50Jg==
X-Google-Smtp-Source: ABdhPJza6bjSCxCEGQJ9DRpTm8b0+ejOsDuqEezHq6yHoVy3ObBdX3rLSob7+YheYmlgUbSZrKD09Q==
X-Received: by 2002:aa7:9517:0:b0:44c:7b4a:8073 with SMTP id
 b23-20020aa79517000000b0044c7b4a8073mr32584159pfp.24.1634055724147; 
 Tue, 12 Oct 2021 09:22:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/23] target/cris: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:40 -0700
Message-Id: <20211012162159.471406-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/cris/translate.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a84b753349..59325b388a 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3249,22 +3249,6 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         }
     }
 
-    if (unlikely(dc->base.singlestep_enabled)) {
-        switch (is_jmp) {
-        case DISAS_TOO_MANY:
-        case DISAS_UPDATE_NEXT:
-            tcg_gen_movi_tl(env_pc, npc);
-            /* fall through */
-        case DISAS_JUMP:
-        case DISAS_UPDATE:
-            t_gen_raise_exception(EXCP_DEBUG);
-            return;
-        default:
-            break;
-        }
-        g_assert_not_reached();
-    }
-
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         gen_goto_tb(dc, 0, npc);
-- 
2.25.1


