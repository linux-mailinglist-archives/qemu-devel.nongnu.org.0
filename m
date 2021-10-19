Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D05F433D99
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:37:30 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mct3J-0002lE-EY
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsF9-0000N2-7r
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:40 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:33620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEv-0000UA-Pj
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:38 -0400
Received: by mail-il1-x132.google.com with SMTP id s3so19165409ild.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HXPyN7sGFhivdzz5mJ6Daz8wVt8XXk5Ml8ywJnJegc=;
 b=UXZ7hqN+dmpx2KuhX1N+KxNJxShm6CbC/FRyOwAHm8Q/kG+JJkLWtnervIE9Xldvf2
 0X8B4Mc4MQtYD7Um33X5+QXrLAZQK1KUdRsE0hhxXAmrGILSaS4x7FlrXgi8Lr5SJr1o
 WATYoicTWuySqmmIwVwNmHRNFRlRXbLUCbynpbJLn/GfsJzHzYzqYfBBMt+APkG+tYdQ
 zcxuRvxuCYCC/qAfPYI4DFLDINb6G0YkM1OU7+iloxaF20d1a/NAOw5d1aZR2nx6xSYj
 FVp75MarfUVpFk9G9isUu7suXRFwis7b6No1kWQRh6RgndpiF0sGnzprskSfE8DPMvTK
 GXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HXPyN7sGFhivdzz5mJ6Daz8wVt8XXk5Ml8ywJnJegc=;
 b=gmn8lBvxk5Ap11Dr++5xKmgf6y4r0ULB5e/8lydoLCA92tBGdNoOjF/kX4U6UyOYx7
 u/jCrSoPNfPL1BHfN+HdEp/2m4tODi2Y4uZLPuHjTr6ObtXXT7ca8mePJxOmonlkIi/g
 UpRpfRO3socsQLX4gYe1ZrQRoppww3Gti1AFmlCUUBDwr0Yk0jHkV0WMmvIr1i3hAlVr
 3N61PQ3RwBGUgVIESL4LQgxFM3A0LkVW1CXr30C+xpG8N9nMJcjauNwO3Ased5RD0rHf
 EaJSEUlLJdBRVUB9wYHM9I9+D1oiA8LZe6n/oiHdxgpUfa6aSFl7LcUSVTUQ6QR9gx2v
 9nqQ==
X-Gm-Message-State: AOAM531+p0ii3LJt5RrVvcaU/J+P77X1F1D7flZg1gDxAnmbxWSDMdqY
 2/bygYsj0ei0GXVFbB0wE/IIF7ceR/HpcA==
X-Google-Smtp-Source: ABdhPJz3xgfAnhjGe/QZaJ+TipiOxAJKzC+1Y3cbCUHg7WocS49X1WtiRMe97E5q72O0kdd/wS8OIg==
X-Received: by 2002:a05:6e02:194d:: with SMTP id
 x13mr19219455ilu.266.1634661924513; 
 Tue, 19 Oct 2021 09:45:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/24] bsd-user/arm/target_arch_signal.h: arm machine context
 for signals
Date: Tue, 19 Oct 2021 10:44:41 -0600
Message-Id: <20211019164447.16359-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211019164447.16359-1-imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Klye Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_signal.h | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
index 973183d99c..9fee58ca9c 100644
--- a/bsd-user/arm/target_arch_signal.h
+++ b/bsd-user/arm/target_arch_signal.h
@@ -54,4 +54,40 @@
 #define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
 #define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
 
+/* arm/arm/machdep.c */
+struct target_sigcontext {
+    target_sigset_t sc_mask;    /* signal mask to retstore */
+    int32_t     sc_onstack;     /* sigstack state to restore */
+    abi_long    sc_pc;          /* pc at time of signal */
+    abi_long    sc_reg[32];     /* processor regs 0 to 31 */
+    abi_long    mullo, mulhi;   /* mullo and mulhi registers */
+    int32_t     sc_fpused;      /* fp has been used */
+    abi_long    sc_fpregs[33];  /* fp regs 0 to 31 & csr */
+    abi_long    sc_fpc_eir;     /* fp exception instr reg */
+    /* int32_t reserved[8]; */
+};
+
+typedef struct {
+    uint32_t    __fp_fpsr;
+    struct {
+        uint32_t    __fp_exponent;
+        uint32_t    __fp_mantissa_hi;
+        uint32_t    __fp_mantissa_lo;
+    }       __fp_fr[8];
+} target__fpregset_t;
+
+typedef struct {
+    uint32_t    __vfp_fpscr;
+    uint32_t    __vfp_fstmx[33];
+    uint32_t    __vfp_fpsid;
+} target__vfpregset_t;
+
+typedef struct target_mcontext {
+    uint32_t        __gregs[TARGET__NGREG];
+    union {
+        target__fpregset_t  __fpregs;
+        target__vfpregset_t __vfpregs;
+    } __fpu;
+} target_mcontext_t;
+
 #endif /* !_TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


