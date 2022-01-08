Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57148825C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:30:10 +0100 (CET)
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66Tz-0007ow-Mu
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:49:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ia-0005JZ-NQ
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:03 -0500
Received: from [2607:f8b0:4864:20::d31] (port=45624
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66IV-0003Ko-7w
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:37:58 -0500
Received: by mail-io1-xd31.google.com with SMTP id i14so10073925ioj.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0CJ1Uc7NVwXMrqtZuM2QHU3pj5pozei2EyzxXFFoWco=;
 b=SHfDJFDUazC125ItvH8AGmqOx7Uay+jM5nMBTaXg8PB/gTZkdNfm74nUWe5QXVBaX+
 PZQuUZg14bf56BL3OTFpHw7oUdA3exKbY+fxb/0CACoumPcUsd70AlL30ONYxC47sbPS
 w2TR3JtiFzgDD40OVLzGwAEIZIEwo40ZKYVj5gpr5o8elxfvWLpeHSiqCMc/de8+7DDt
 jxbYVC41yyFwbu513SJx6jXjxiNv9m3/0UX7DtHjFMEFSW1qGgi902ikv7Q+bXny2XfU
 T9bvXLY6TEcf8XTvDpfY0ujEx+5OB/vDovmNFKRNFSbormy2hoxIQPoy0jAuAEbj4MbW
 7NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0CJ1Uc7NVwXMrqtZuM2QHU3pj5pozei2EyzxXFFoWco=;
 b=RKSJraRmW9ylMpMY/xm0j2w8U4H7HOH0M/QusXZ0Y1x30wkR4NpsiaRIc6zuccNvRT
 I1dP9+D1Uhrz+YJ0hCVv9dAjxKFH0kpLBH1WG/4AQIEiGnCXCZ9ROzlVl2LX6sD8IOUC
 1paGteHEXqQ/R9vcmSkgu601k3W8h4y1nXMokQA/z//CGTcUpqFy46hGKeNTrshFVJFh
 sUJwJ9QCBce4J84CXU/zaNkU/1KGWfAlU2mP6HmuXTcxMK0RhehKsDmfubLq3g0acP7s
 lwc1xDrrN//Bbl0fiv4q/AP6MWzwnIreddxubEiQBKUbUE6RhtKTvgoLXGqu0SKYNr4Q
 eivA==
X-Gm-Message-State: AOAM532RVTuSsdc3XCaKWhMhbTrhdEdfxHgjaw9+2T6BeLd9w5IHWAKz
 M6PvDptHFfCDbEYTJVlTuSc/Q+diqwBV81+q
X-Google-Smtp-Source: ABdhPJwQXjIoM8U1AntRSkZ8gob+PzHWpdo/JZsiLTcDLPnFVRYR0+d0gNFntGW82OZ02r56eaL+gA==
X-Received: by 2002:a05:6602:2c4b:: with SMTP id
 x11mr5978442iov.12.1641627469062; 
 Fri, 07 Jan 2022 23:37:49 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:37:48 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/37] bsd-user/i386/target_arch_signal.h: Update mcontext_t to
 match FreeBSD
Date: Sat,  8 Jan 2022 00:37:06 -0700
Message-Id: <20220108073737.5959-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Cc: qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
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
index bf7263c4f8d..701c6f964f8 100644
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
2.33.1


