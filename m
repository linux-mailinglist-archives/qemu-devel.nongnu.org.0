Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0C3D093D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:54:04 +0200 (CEST)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m667H-0006lk-Us
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vm-00057b-4I
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:10 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vk-0005Ui-Ke
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:09 -0400
Received: by mail-pj1-x1033.google.com with SMTP id gx2so1085949pjb.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CKMyfEupmGKlxmCLNCm/wefn2vfKhH3KArdazgmADL0=;
 b=GyprLExTVZcofwcCl4l5uOHBBiMxCWEFZ3Z29WRxjE3m5SPR7bPOKAqMhd47AiQcgp
 z9FkqfLJ5cYs+OjmPxnpHGnH1Iva8KAZhojuV0uh2dMB+jGzhXl3V+ozGAYO6zV3wXJE
 I5vL23tzckPeRkWNqmJ9r5v+elfgxhk8NQucnhAmiVIYa7wo9oaet2zEJuffeHaLNBAA
 YzO6+Co1QrEWnUragfDbfN7+dg9Atxzq5xJ9ic7knz2mpbjinhGySccL8NqUqOGriywk
 Lu2sSWmKVxZrzdhLBbnDCyEnwz7Fk/6mN8fyADBphEUzT56JIZiUGgIQkX6XS1yh9Gmd
 xRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CKMyfEupmGKlxmCLNCm/wefn2vfKhH3KArdazgmADL0=;
 b=aO/KQ56lO+/4JEX4KXVezelRyHORKGRgEW6EjXWIQDPzWouxr8gJWNNAA8AOFzCv1F
 1Aiv7o812DxRGGf8RV4TicTkl1eH4gBi1oTdzNGGgl/BcimeU4YCUrkKn4ZfBmxmScSb
 i97orOioUy+rzwOqGAcfEIWFFlOkx//XYbN81Jhg5jejEEcv7YIujbKwHbdikWECUE0h
 yji49gUsqrZMGGV6qCUYCq4jMRpvlsYkxfZ+2EqvkGJf+5ykNOSDq1i8dKertUpSiCy0
 kqwKRLoX5cgD23BIEFBflOt3PWQtSNBWe03lpJgOW/OUSy9ivGXjpy9xKd1sBKWZQIVJ
 No0A==
X-Gm-Message-State: AOAM532jNU96i9EWk00RX5ByZzp9Em7HMPT8XwpymYwOX+3rSegEHLYN
 Fqpg9ofqQUDAxTAklM/JsWoPDTSrAIE5yQ==
X-Google-Smtp-Source: ABdhPJzfPyhT+u2QTlw0niwOLKndOFcXjPmAvgKPxYmuMFM9vGRP3arkU5hAc8hW+nJl6IwerCFL8w==
X-Received: by 2002:a17:902:9b87:b029:11b:e66e:a1b3 with SMTP id
 y7-20020a1709029b87b029011be66ea1b3mr27070888plp.33.1626849727420; 
 Tue, 20 Jul 2021 23:42:07 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/23] target/i386: Drop check for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:41 -1000
Message-Id: <20210721064155.645508-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 target/i386/helper.h          | 1 -
 target/i386/tcg/misc_helper.c | 8 --------
 target/i386/tcg/translate.c   | 4 +---
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 574ff75615..ac3b4d1ee3 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -56,7 +56,6 @@ DEF_HELPER_2(syscall, void, env, int)
 DEF_HELPER_2(sysret, void, env, int)
 #endif
 DEF_HELPER_FLAGS_2(pause, TCG_CALL_NO_WG, noreturn, env, int)
-DEF_HELPER_FLAGS_1(debug, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(reset_rf, void, env)
 DEF_HELPER_FLAGS_3(raise_interrupt, TCG_CALL_NO_WG, noreturn, env, int, int)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, int)
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index baffa5d7ba..5769db5ace 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -110,14 +110,6 @@ void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
     do_pause(env);
 }
 
-void QEMU_NORETURN helper_debug(CPUX86State *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_DEBUG;
-    cpu_loop_exit(cs);
-}
-
 uint64_t helper_rdpkru(CPUX86State *env, uint32_t ecx)
 {
     if ((env->cr[4] & CR4_PKE_MASK) == 0) {
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4bd947cf86..0a200d2f68 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2660,9 +2660,7 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
     if (s->base.tb->flags & HF_RF_MASK) {
         gen_helper_reset_rf(cpu_env);
     }
-    if (s->base.singlestep_enabled) {
-        gen_helper_debug(cpu_env);
-    } else if (recheck_tf) {
+    if (recheck_tf) {
         gen_helper_rechecking_single_step(cpu_env);
         tcg_gen_exit_tb(NULL, 0);
     } else if (s->flags & HF_TF_MASK) {
-- 
2.25.1


