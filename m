Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7778C2D59F4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:05:34 +0100 (CET)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKhR-0000Sn-Fg
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR7-0001dG-37
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:41 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQu-00077l-3c
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id l9so5136504wrt.13
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sQHcIfjNr/dgviDAFuTlog+s/z+W0UmjgTML+ZZcH4k=;
 b=Sx4nfWSvlGz/kzltCMIQ29PrRN6Be8FKrfQEutu6WY2YB7bXXKsHel9AGytchwXMSN
 QxU6IvNPlG3RA0/hlv3Yn99T+GET8V3UNVU+4gceQPDxpP3fFlqILJ+LYVb9NV1gmlEa
 I6rHun8R51afVdihLnxBwft17fgZNst9NGTdG2aCapnOUSW1g8qVCKZB0nwMIh8Eu86h
 PqY0FzcqsIx+LOnKi+8ug1EHxoek80rmjPkyZLWPgQgTRHP+vKoqhEG00Ta1UnC7oShN
 Es3tVzH1Ktsqd5JABYm28PTlmpFxuAprm3tTWLjaSymK6lFKcomftEvub6AW4RtXFFj5
 fE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sQHcIfjNr/dgviDAFuTlog+s/z+W0UmjgTML+ZZcH4k=;
 b=sGoOyNPZLT+fI96hJc/YVqvRiDKM2isq4MdMwfd67WWX9gIPU7Y731DeYgC7UhLo8N
 Rcp7zoE2KzdpuhG2DFD3GV7K04sKM5zh/TpF6DmgU1IOdHtOmy26E6USM3HyqDm+ULlZ
 4TZkxZCDb6XmXIHvjRZKVrdeGUeYQujYuwnINnDOAufmL+a9edIEFnoulmQEV6+rXNxj
 5Uvfk4XP3obuMdogsGHKpXgLC0tujvBPO54h46yvVtYFmZlTtZ/CGZ/mEJZve2C6GAgJ
 Bx+1uslcvCY0+oGM336XBc9NB5gmsnc3ThbLDAROCSw1WCO/zBzxcBUbVCubtzwKL7SJ
 5zmA==
X-Gm-Message-State: AOAM533/bFoYzWCmGeUbG/UGhVPhc5YMa1HekdzmPZhvq+JQeXNRZWwe
 y+KSem059wrMK1kN+KgHqj43qQkUo4MfjA==
X-Google-Smtp-Source: ABdhPJzpOKGFEODjot4uKYvrlK7pKCYgG2SUEI+wNSmrHzXglfw+0jOTgg6bnvOQj6rkv7l6l78Wzg==
X-Received: by 2002:adf:f707:: with SMTP id r7mr8117922wrp.113.1607600905233; 
 Thu, 10 Dec 2020 03:48:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/36] target/arm: Factor out preserve-fp-state from
 full_vfp_access_check()
Date: Thu, 10 Dec 2020 11:47:43 +0000
Message-Id: <20201210114756.16501-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Factor out the code which handles M-profile lazy FP state preservation
from full_vfp_access_check(); accesses to the FPCXT_NS register are
a special case which need to do just this part (corresponding in the
pseudocode to the PreserveFPState() function), and not the full
set of actions matching the pseudocode ExecuteFPCheck() which
normal FP instructions need to do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201119215617.29887-13-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c.inc | 45 ++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index cd8d5b4f28b..bb1c41413e7 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -83,6 +83,32 @@ static inline long vfp_f16_offset(unsigned reg, bool top)
     return offs;
 }
 
+/*
+ * Generate code for M-profile lazy FP state preservation if needed;
+ * this corresponds to the pseudocode PreserveFPState() function.
+ */
+static void gen_preserve_fp_state(DisasContext *s)
+{
+    if (s->v7m_lspact) {
+        /*
+         * Lazy state saving affects external memory and also the NVIC,
+         * so we must mark it as an IO operation for icount (and cause
+         * this to be the last insn in the TB).
+         */
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            s->base.is_jmp = DISAS_UPDATE_EXIT;
+            gen_io_start();
+        }
+        gen_helper_v7m_preserve_fp_state(cpu_env);
+        /*
+         * If the preserve_fp_state helper doesn't throw an exception
+         * then it will clear LSPACT; we don't need to repeat this for
+         * any further FP insns in this TB.
+         */
+        s->v7m_lspact = false;
+    }
+}
+
 /*
  * Check that VFP access is enabled. If it is, do the necessary
  * M-profile lazy-FP handling and then return true.
@@ -113,24 +139,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         /* Handle M-profile lazy FP state mechanics */
 
         /* Trigger lazy-state preservation if necessary */
-        if (s->v7m_lspact) {
-            /*
-             * Lazy state saving affects external memory and also the NVIC,
-             * so we must mark it as an IO operation for icount (and cause
-             * this to be the last insn in the TB).
-             */
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                s->base.is_jmp = DISAS_UPDATE_EXIT;
-                gen_io_start();
-            }
-            gen_helper_v7m_preserve_fp_state(cpu_env);
-            /*
-             * If the preserve_fp_state helper doesn't throw an exception
-             * then it will clear LSPACT; we don't need to repeat this for
-             * any further FP insns in this TB.
-             */
-            s->v7m_lspact = false;
-        }
+        gen_preserve_fp_state(s);
 
         /* Update ownership of FP context: set FPCCR.S to match current state */
         if (s->v8m_fpccr_s_wrong) {
-- 
2.20.1


