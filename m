Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7C447903
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:56:40 +0100 (CET)
Received: from [::1] (port=46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvlv-0006Ho-6h
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:56:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhr-0006P3-Ce
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:27 -0500
Received: from [2607:f8b0:4864:20::d34] (port=46698
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhl-0002q1-Gi
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:23 -0500
Received: by mail-io1-xd34.google.com with SMTP id k22so4065414iol.13
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bx57Grx4Ho2QTHDmDapCkPzf47yXES68RJ3vL59z+xc=;
 b=aoulB3QOjs8yknezIbWDSAF18cLlLHCToc/1V9aY/NxM7excLnuhc87wAtLX11Snuh
 O/ILUsOPhr20pfZrb4lwOU5p1sqhg0NrRLw9X89R/8B1lQXiT3fkvcT7KNx2N8a46irA
 hnQEUyjqaAc5RvSf8cPDByHGLQOq7LifxS99Mx1BrWlN1R1JPl0iQeWaG6V1ovI9z70Y
 DDpwEnefOb6JcMw4gt4yuousMw9EaHh1SHUPxWwIf4pWVwrHCiJGdaofH6O9W7e6rMFN
 0FB0QnMjW/25eBCXOyMilT7+q31hB4/BpashbOCyD19f7tfYX8NPhJyeRzOkBX6UJql/
 kG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bx57Grx4Ho2QTHDmDapCkPzf47yXES68RJ3vL59z+xc=;
 b=6un/HlvUWe2UYdpHUZ99yxtPrWQqvvjhYAND+BoMNfNKHjDaajj9OL+5OuWkdvBh3G
 AnDtjXvXR0h6JMvD8gkDno5GAi/gm4dYOXvrmF0Zz35NTpaz5Nq59Sk9ScGJJbXOtjRD
 WLDgTSfkABxER6pfn2c717rYcQAQwy6xJwAzlGS8DH8viw/yZueKKT18mPyiP7LUv51G
 jue6yUEXZ8Z0QPj1771GAnfrKErBHuKLtJW9nlNX7sZGZTewQ38ppTnP0ojYn5WdFbdO
 CnAwG/aW6gx6sRGhjZ2uX/gJuoA64oxN8c16z3pjl5JC/79Vvvk0xVdkmV4YITAYttpj
 HeNQ==
X-Gm-Message-State: AOAM533oIPkJGq6zgKkYtCE63hqkulvqVg5OrfIOxhtZxJbYDXzIfodS
 nn0coqFf+WsryIOGlGWJjMzIm9Dy/cq99A==
X-Google-Smtp-Source: ABdhPJzllnn02z39wmWmK/372UBZwqeluNpy5OZCtOM0hBuiIrvdb+2UTZRXOdSFtMVhe6Kgod0cHg==
X-Received: by 2002:a05:6602:14d0:: with SMTP id
 b16mr8811887iow.181.1636343539251; 
 Sun, 07 Nov 2021 19:52:19 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:18 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/37] bsd-user/x86_64/target_arch_signal.h: Fill in
 mcontext_t
Date: Sun,  7 Nov 2021 20:51:09 -0700
Message-Id: <20211108035136.43687-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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

Fill in target_mcontext match the FreeBSD mcontext_t structure. Also
define the size correctly.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_signal.h | 54 ++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
index e84aff948c..720e3939c3 100644
--- a/bsd-user/x86_64/target_arch_signal.h
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -28,8 +28,62 @@
 #define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
 
 typedef struct target_mcontext {
+    abi_ulong   mc_onstack;     /* XXX - sigcontext compat. */
+    abi_ulong   mc_rdi;         /* machine state (struct trapframe) */
+    abi_ulong   mc_rsi;
+    abi_ulong   mc_rdx;
+    abi_ulong   mc_rcx;
+    abi_ulong   mc_r8;
+    abi_ulong   mc_r9;
+    abi_ulong   mc_rax;
+    abi_ulong   mc_rbx;
+    abi_ulong   mc_rbp;
+    abi_ulong   mc_r10;
+    abi_ulong   mc_r11;
+    abi_ulong   mc_r12;
+    abi_ulong   mc_r13;
+    abi_ulong   mc_r14;
+    abi_ulong   mc_r15;
+    uint32_t    mc_trapno;
+    uint16_t    mc_fs;
+    uint16_t    mc_gs;
+    abi_ulong   mc_addr;
+    uint32_t    mc_flags;
+    uint16_t    mc_es;
+    uint16_t    mc_ds;
+    abi_ulong   mc_err;
+    abi_ulong   mc_rip;
+    abi_ulong   mc_cs;
+    abi_ulong   mc_rflags;
+    abi_ulong   mc_rsp;
+    abi_ulong   mc_ss;
+
+    abi_long    mc_len;                 /* sizeof(mcontext_t) */
+
+#define _MC_FPFMT_NODEV         0x10000 /* device not present or configured */
+#define _MC_FPFMT_XMM           0x10002
+    abi_long    mc_fpformat;
+#define _MC_FPOWNED_NONE        0x20000 /* FP state not used */
+#define _MC_FPOWNED_FPU         0x20001 /* FP state came from FPU */
+#define _MC_FPOWNED_PCB         0x20002 /* FP state came from PCB */
+    abi_long    mc_ownedfp;
+    /*
+     * See <machine/fpu.h> for the internals of mc_fpstate[].
+     */
+    abi_long    mc_fpstate[64] __aligned(16);
+
+    abi_ulong   mc_fsbase;
+    abi_ulong   mc_gsbase;
+
+    abi_ulong   mc_xfpustate;
+    abi_ulong   mc_xfpustate_len;
+
+    abi_long    mc_spare[4];
 } target_mcontext_t;
 
+#define TARGET_MCONTEXT_SIZE 800
+#define TARGET_UCONTEXT_SIZE 880
+
 #include "target_os_ucontext.h"
 
 struct target_sigframe {
-- 
2.33.0


