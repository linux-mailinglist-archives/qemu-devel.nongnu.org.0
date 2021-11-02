Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ABE443962
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:14:30 +0100 (CET)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2z6-0007fG-P2
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f6-0007co-L7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:48 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2f2-0002t5-LI
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:48 -0400
Received: by mail-il1-x130.google.com with SMTP id y17so641528ilb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+r01BN2RKWDgyocvJBPU5Kji19m/VGVQeGkX/VmFsS8=;
 b=JStp4w00RfzOkx0uDorl99c+l/aYTj4LwDf6dNSwDDneQhTGojjqE1yXijXgX+wCJ0
 X8TXMuIHzC1ICNzuBwmUNXvygyzs1ZDt9vX0jBl7OG289nbSuhEsg+hC+d9Kr77GbDSy
 kdrSVSARdIITrmiwvo9jQ2nK3ZzBKK4dkDFAqUv8UnDYmR9fLZcoRERxgaeTPFbttBUK
 jZtC7nCMR+PV0dOBoed/FJ1YJfSLcUg8PP0LecUnkEnrMTx66DxEFebutsogTx2j2AfE
 QbotXse/bw39ZPARZJO7WkBZbi3NLj959DYzHIcAnLekR3hR9SEAD0fOOWYEZdrJSUUb
 IQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+r01BN2RKWDgyocvJBPU5Kji19m/VGVQeGkX/VmFsS8=;
 b=qg9iyRLsyl/qeLDV113kfSF5UgIJ7qQ1eDKvs4y6xw9I+MrkLwTVnSsLuZ5HmEtbnd
 YluudnKEIBo59hzlujZ1lHy1juuw7fqy5O5xkhVbc/g+xoU8pyrvge+IP1nr8KZvw8NJ
 IxD+3Bsm9leUhnkc9S1SAR6JmNvZwu7+oM3LxBvulL2FL3hpafxaqZyhqLP1tnefX95k
 W1iKkJaubhqpWZJXe3JegQ5FC9y/eUA6GRh0zz+J8nbZ5ShVU3ShxGo3W22qEFg9DYU/
 E8aE209dwM0EUZFQ7JVwJfLF/mCkOlt5WTWaAu/tVLpd6+2o6aMk8f/mhzoyl1+/djh6
 Olsw==
X-Gm-Message-State: AOAM532vPT3v43tss7Thi2ZscZQFdmFXn5xpfCpAVFxiGBtR/v7PRIBR
 sRGJ9+xYUaslaFbwaPuYyS/LP080IwLHKw==
X-Google-Smtp-Source: ABdhPJy4eWfcJATw1ghGx+/PutfwVFhsLhZe384iRFNY7TFxO5VgJv3sqH6MPm9N4Mbqx1GXub/k8w==
X-Received: by 2002:a92:cda2:: with SMTP id g2mr17147699ild.2.1635893623411;
 Tue, 02 Nov 2021 15:53:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:43 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/30] bsd-user/arm/target_arch_signal.h: arm get_mcontext
Date: Tue,  2 Nov 2021 16:52:41 -0600
Message-Id: <20211102225248.52999-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_signal.h | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 61440b51b4..b42d08402f 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -129,4 +129,54 @@ set_sigtramp_args(CPUARMState *env, int sig, struct target_sigframe *frame,
     return 0;
 }
 
+/*
+ * Compare to arm/arm/machdep.c get_mcontext()
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+static inline abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp,
+        int flags)
+{
+    int err = 0;
+    uint32_t *gr = mcp->__gregs;
+
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_size != sizeof(target_mcontext_vfp_t)) {
+        return -TARGET_EINVAL;
+    }
+
+    gr[TARGET_REG_CPSR] = tswap32(cpsr_read(env));
+    if (flags & TARGET_MC_GET_CLEAR_RET) {
+        gr[TARGET_REG_R0] = 0;
+        gr[TARGET_REG_CPSR] &= ~CPSR_C;
+    } else {
+        gr[TARGET_REG_R0] = tswap32(env->regs[0]);
+    }
+
+    gr[TARGET_REG_R1] = tswap32(env->regs[1]);
+    gr[TARGET_REG_R2] = tswap32(env->regs[2]);
+    gr[TARGET_REG_R3] = tswap32(env->regs[3]);
+    gr[TARGET_REG_R4] = tswap32(env->regs[4]);
+    gr[TARGET_REG_R5] = tswap32(env->regs[5]);
+    gr[TARGET_REG_R6] = tswap32(env->regs[6]);
+    gr[TARGET_REG_R7] = tswap32(env->regs[7]);
+    gr[TARGET_REG_R8] = tswap32(env->regs[8]);
+    gr[TARGET_REG_R9] = tswap32(env->regs[9]);
+    gr[TARGET_REG_R10] = tswap32(env->regs[10]);
+    gr[TARGET_REG_R11] = tswap32(env->regs[11]);
+    gr[TARGET_REG_R12] = tswap32(env->regs[12]);
+
+    gr[TARGET_REG_SP] = tswap32(env->regs[13]);
+    gr[TARGET_REG_LR] = tswap32(env->regs[14]);
+    gr[TARGET_REG_PC] = tswap32(env->regs[15]);
+
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != NULL) {
+        /* see get_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp = (target_mcontext_vfp_t *)mcp->mc_vfp_ptr;
+        for (int i = 0; i < 32; i++) {
+            vfp->mcv_reg[i] = tswap64(*aa32_vfp_dreg(env, i));
+        }
+        vfp->mcv_fpscr = tswap32(vfp_get_fpscr(env));
+    }
+    return err;
+}
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.33.0


