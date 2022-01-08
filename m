Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E204E488265
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:35:00 +0100 (CET)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67Bj-0002mD-A6
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:35:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Is-0005Tn-Rc
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:19 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=38513
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iq-0003VI-V3
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:18 -0500
Received: by mail-io1-xd2c.google.com with SMTP id u8so10107361iol.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=siiQROmFkgoyoci8mg+ev58BNz0SLHU/+j4/Xsy7h34=;
 b=o6Wthbmf9+gsuhvkJSA4DXYAhvjS7ynqhw6hv6P1PHN1GxKlqx21CB2GkxqAxGexMm
 uOlkjS2rHNI4FdMMmepBmeODOPDGyC0+r5kqlo7YzLqW/rlAJHb548Qa3tailb/AOWx8
 9Io0HRUHlfQHvENLvjxklBXyDG4YWhFVUhaChU2CDOLWF6GtwQQQ7seC8OzqF3CnLWZD
 8odHNispijxADcQTtFONsXph+FU5GD+DIBn//yjKM82uBxgN8R5CZJaM6w7RS3Nny8aS
 QPPjt7Tf0BsFBhcexJAtJnUNFipsIdX3SJRK0cnXMSSaDzJWZjjcDaBYdhAk/8G3XDEf
 O1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=siiQROmFkgoyoci8mg+ev58BNz0SLHU/+j4/Xsy7h34=;
 b=z3apfUWI0RWodLHHkiD3bTtUCuTVC3kSdZtbNQXxNkhqraOayBUi0MfdiDsHFK3rDn
 rdZrUVIWUF+9+y0lgTVriPqah6je+OWBXAGUcu5bMHNddJPI3TWpjmy7e48+TxhY00nf
 bwiw99UoUL3ADuG8NnA4xGrJsheilMBNrPuRfmEHr9gwOZto6SUfDWO9JRqZ4pp6/kB9
 /69GlJnanNCuGoa2LznwlPxdx2sOWfKaP+hmoYugwouCFsAv3PhFSG7mxaMelWTS77GO
 paS2njS2A/cg3wyudg8BGhzDBLdW7RCMO9KErkItZm9ptMWxrOGn17Z5end9DH7EwR36
 xcrw==
X-Gm-Message-State: AOAM5309TMivAJ30keORe74FiFRbdOKDwyZCagropL4nZmTwsxF+qoKX
 7+uXTSu1ITwEbXbtYIM0HXTROZ1DETmYCKSq
X-Google-Smtp-Source: ABdhPJx93hmzAsdzhG/Tc6Kq1VwakhGEGSKTT/qw8EBaC1MN/TdmucVhZmzbUS3npWOGb4ws6q50Ig==
X-Received: by 2002:a05:6638:2688:: with SMTP id
 o8mr30059038jat.118.1641627495227; 
 Fri, 07 Jan 2022 23:38:15 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:14 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/37] bsd-user/arm/signal.c: arm get_mcontext
Date: Sat,  8 Jan 2022 00:37:33 -0700
Message-Id: <20220108073737.5959-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Get the machine context from the CPU state.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 3c0db30a85e..93c9bfc0d37 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -58,3 +58,54 @@ abi_long set_sigtramp_args(CPUARMState *env, int sig,
 
     return 0;
 }
+
+/*
+ * Compare to arm/arm/machdep.c get_mcontext()
+ * Assumes that the memory is locked if mcp points to user memory.
+ */
+abi_long get_mcontext(CPUARMState *env, target_mcontext_t *mcp, int flags)
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
+    if (mcp->mc_vfp_size != 0 && mcp->mc_vfp_ptr != 0) {
+        /* see get_vfpcontext in sys/arm/arm/exec_machdep.c */
+        target_mcontext_vfp_t *vfp;
+        vfp = lock_user(VERIFY_WRITE, mcp->mc_vfp_ptr, sizeof(*vfp), 0);
+        for (int i = 0; i < 32; i++) {
+            vfp->mcv_reg[i] = tswap64(*aa32_vfp_dreg(env, i));
+        }
+        vfp->mcv_fpscr = tswap32(vfp_get_fpscr(env));
+        unlock_user(vfp, mcp->mc_vfp_ptr, sizeof(*vfp));
+    }
+    return err;
+}
-- 
2.33.1


