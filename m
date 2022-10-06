Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302465F5FC3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:48:58 +0200 (CEST)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHsX-0007iY-94
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHit-00032s-4h
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:59 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHip-0002u9-V0
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id z20so555057plb.10
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
 b=ZM23Fyhg+rzcP0voVzKaW06aK/aMM2HZkml+J0N0D84Tiv+Xw0ag4HI5xzcYmUCMRl
 1oEjyrnGROuOkdlsZcPJ3jDGXQsJzqKrWRJ69P9Ay6D0ln4EurhCBA8mE5BqcX/jtOou
 DQjh1WItNvyuY+/J2zTr27/elDZeCRBuoARQisTbRSJFC6eSmK+vs1PKQFVYMW4xJzaI
 JvuR26GLmc/z23MIHt7z4QGYb5puvHW9VpXDjjjFTXckkZaZgzDKpcfQ5G0gYy01wmpW
 p1Z6nazIm6zcKLhz/spW/4xOFj+YRuJMwYz7dlfcvoQ+sw3VLs14ehhbHyeXn49fj7B8
 65vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=apBe+xOEG/yN097g7gF2sx0rQ+06LZSBxstARnEgFm4=;
 b=r7F69ASHWGSMlXyV1gUpj9geehi9GK9ph1XB3NVOkFwFCBHR0yEtK8ws0xdVg7u+Fg
 7HO7Q7a0LsUXy8BJ8YyNhcszvUtCNrPqpXbsfaKQQjR4tvXW25/YVb63Xjv0TJ0SJzB+
 FIADyvQGGhWvFDdU+ZhzPO94pMFiSiFj7ZTzWiX/HtLgVyQStZKIHI/W8799GMKUnszF
 FopepY33PR9qQQlu05V53JnQ3XZAae6NoJWI05R4LXUqH8SGhFvjnlY1LJtvzbH2iDxg
 ZjC04sjhnJp92Z305ociYUl5CAATsDuM+20JtQZ9w9CaT1XFtarc8QBUUMwdxCvKVcfq
 z69g==
X-Gm-Message-State: ACrzQf2QxW44lmpPmAAN5tMpVKd1nkdJWwssyBraqZVTrOVXJLjunsZl
 AgsAvokQAvCyIbhHTMeA3PzmHhxXfe/VlA==
X-Google-Smtp-Source: AMsMyM6kVPkR05I+1Ic+7lvlMe7xAo9ZXYsDiB1bnuEBLGtDuhPezpODnt5vB6uzFe3Jzi4mTtH+7Q==
X-Received: by 2002:a17:902:b942:b0:178:be25:203f with SMTP id
 h2-20020a170902b94200b00178be25203fmr2474122pls.101.1665027528568; 
 Wed, 05 Oct 2022 20:38:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 1/9] target/arm: Introduce curr_insn_len
Date: Wed,  5 Oct 2022 20:38:38 -0700
Message-Id: <20221006033846.1178422-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006033846.1178422-1-richard.henderson@linaro.org>
References: <20221006033846.1178422-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

A simple helper to retrieve the length of the current insn.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 5 +++++
 target/arm/translate-vfp.c | 2 +-
 target/arm/translate.c     | 5 ++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index af5d4a7086..90bf7c57fc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -226,6 +226,11 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start = NULL;
 }
 
+static inline int curr_insn_len(DisasContext *s)
+{
+    return s->base.pc_next - s->pc_curr;
+}
+
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 /* CPU state was modified dynamically; exit to main loop for interrupts. */
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index bd5ae27d09..94cc1e4b77 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -242,7 +242,7 @@ static bool vfp_access_check_a(DisasContext *s, bool ignore_vfp_enabled)
     if (s->sme_trap_nonstreaming) {
         gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming,
-                                       s->base.pc_next - s->pc_curr == 2));
+                                       curr_insn_len(s) == 2));
         return false;
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5aaccbbf71..42e11102f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6654,7 +6654,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
-        if (s->base.pc_next - s->pc_curr == 2) {
+        if (curr_insn_len(s) == 2) {
             ret |= ISSIs16Bit;
         }
     } else {
@@ -9817,8 +9817,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env,
-                           tcg_constant_i32(dc->base.pc_next - dc->pc_curr));
+            gen_helper_wfi(cpu_env, tcg_constant_i32(curr_insn_len(dc)));
             /*
              * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
-- 
2.34.1


