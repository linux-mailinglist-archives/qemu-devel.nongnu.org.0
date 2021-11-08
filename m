Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30A5447900
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:56:21 +0100 (CET)
Received: from [::1] (port=45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvld-0005uR-0X
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhi-00067Y-GV
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:18 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=39487
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhg-0002pB-Lt
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:18 -0500
Received: by mail-io1-xd2d.google.com with SMTP id c3so3968512iob.6
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUnz5WHUhswb5q8XxN9w41FLyhOSulO5CBUbhPFGoI0=;
 b=qwGOMW1Dg8qR53+mqolKe8WLRXeTbR4ysvm4UEsn4kvfjsTss38GQrmu5bI5RzZHY3
 GCUzK7Cy5OoeuKDAxrj3MK33JVpt9k4ULMR0nOkVSRA+WZXJtPHXx+uA4YU9tXaBglGh
 Dj4FTsTkS5ajkSXdYlDFmzu1frDZjpkNbyiMZ60lE/fEvdiPoYN9cBlWKrYBAEVi0vDW
 qXI1T1sy6AuO3sWLHJlGaPxcbWhT9WOG6MXTSw/agW8Y+vjhJ1O7eBypdNuMvYJeVg1u
 7jlTw7QH1Tpm7jfH30yiZCBgdwLDDYtTf5AyJk1U6FztruO3cvFEPDhJIClM+Cb8VdlD
 IoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUnz5WHUhswb5q8XxN9w41FLyhOSulO5CBUbhPFGoI0=;
 b=dOzOiO3GsV7bm4Dq5WT9zvOPEUuUC8q6boqwnpinBXwc1zl6CW/EwYqEOReJupp0Kv
 7SIViyjgz3zZD2UUxrmwvrz3BweBBdQDX0a4ujKSreCkNuMCyWG9T04v7ho/4oVJU8Ju
 XC5y7czTFkXBODBeT4PsKN+nO9RnrDnvlo1zFzto6CK3L1fLEjsV6N08UyBuZGzvKUvj
 p6jems1e6oHMgS483EcQLiMbjSfsvcHNc+UhN+FDFjhUD7XkqOxN3q8nRis/rcg+oPaj
 9Nthzb+T6oxYF+Yz0X1vM5YdSxO75rcPkmDDrxutes8WR6UtiHME2paADsxYbO9n1+6c
 M2qg==
X-Gm-Message-State: AOAM532L2FSJoEsKOkv6/cK+ll+xNTXQiyl7FJmL5PCCuCKfn/vtw7PI
 SqwIGMIy8wHcZ9vn127ja+MYWQeKCXeQOQ==
X-Google-Smtp-Source: ABdhPJw6r2XM1yoZo5v44PkSWGYTA9Wgug1wVcwEu6uFokFY10hLPlQe08D01AmwmhMbQKV/2FtYQA==
X-Received: by 2002:a5d:8e07:: with SMTP id e7mr4648231iod.148.1636343535417; 
 Sun, 07 Nov 2021 19:52:15 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:15 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/37] bsd-user/i386/target_arch_signal.h: Update
 mcontext_t to match FreeBSD
Date: Sun,  7 Nov 2021 20:51:05 -0700
Message-Id: <20211108035136.43687-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill in target_mcontext_t to match the FreeBSD mcontex_t. Also tag the
current size of mcontext and ucontext to enable size checking for i386.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index bf7263c4f8..701c6f964f 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -28,8 +28,54 @@
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
 typedef struct target_mcontext {
+    abi_ulong   mc_onstack;     /* XXX - sigcontext compat. */
+    abi_ulong   mc_gs;          /* machine state (struct trapframe) */
+    abi_ulong   mc_fs;
+    abi_ulong   mc_es;
+    abi_ulong   mc_ds;
+    abi_ulong   mc_edi;
+    abi_ulong   mc_esi;
+    abi_ulong   mc_ebp;
+    abi_ulong   mc_isp;
+    abi_ulong   mc_ebx;
+    abi_ulong   mc_edx;
+    abi_ulong   mc_ecx;
+    abi_ulong   mc_eax;
+    abi_ulong   mc_trapno;
+    abi_ulong   mc_err;
+    abi_ulong   mc_eip;
+    abi_ulong   mc_cs;
+    abi_ulong   mc_eflags;
+    abi_ulong   mc_esp;
+    abi_ulong   mc_ss;
+
+    int32_t     mc_len;                 /* sizeof(mcontext_t) */
+#define _MC_FPFMT_NODEV         0x10000 /* device not present or configured */
+#define _MC_FPFMT_387           0x10001
+#define _MC_FPFMT_XMM           0x10002
+    int32_t     mc_fpformat;
+#define _MC_FPOWNED_NONE        0x20000 /* FP state not used */
+#define _MC_FPOWNED_FPU         0x20001 /* FP state came from FPU */
+#define _MC_FPOWNED_PCB         0x20002 /* FP state came from PCB */
+    int32_t     mc_ownedfp;
+    abi_ulong mc_flags;
+        /*
+         * See <machine/npx.h> for the internals of mc_fpstate[].
+         */
+    int32_t     mc_fpstate[128] __aligned(16);
+
+    abi_ulong mc_fsbase;
+    abi_ulong mc_gsbase;
+
+    abi_ulong mc_xfpustate;
+    abi_ulong mc_xfpustate_len;
+
+    int32_t     mc_spare2[4];
 } target_mcontext_t;
 
+#define TARGET_MCONTEXT_SIZE 640
+#define TARGET_UCONTEXT_SIZE 704
+
 #include "target_os_ucontext.h"
 
 struct target_sigframe {
-- 
2.33.0


