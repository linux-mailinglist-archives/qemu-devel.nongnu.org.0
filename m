Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CD45AA2A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:39:59 +0100 (CET)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpZlu-0006sv-QZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:39:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkE-00047B-T1
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:14 -0500
Received: from [2a00:1450:4864:20::333] (port=35761
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpZkD-000502-CO
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:38:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so3045067wme.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mT+zuzmDZjEjStGuNXpCAnb7RPXTMmCHpcEJ6vHxP1Y=;
 b=F0wzx/rHfAA1ekdil+cTekIST8Uv3FZ7jxcs0MO1ApCXuwwotMxuLjfHEsTKkI5Paw
 jWUwqvi5a3xMei6u/OJIeHraHA5hmVdflUKhV+DC+5FnsHSUU2x/4A+SEaxJoDjUtRjo
 6nf7x7qSwX72gjUIMsAXecpHjMmgIhHzb0g97ts7Mc916jJ6qjhgLtd60a/N3DNwGYzJ
 R924MPpnN8kdCp1oFigw3o72elKMnjIqNtKyZZls2pnlm77s36Z4aU8OwymnRhOsKGuZ
 I7KphvepL1FACEpL+ewGX3xyU3SHgKWhq9sNhs5ohRMXlykTgYu6RVGnEJI5s3FSRft3
 /7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mT+zuzmDZjEjStGuNXpCAnb7RPXTMmCHpcEJ6vHxP1Y=;
 b=v3pf5YoSJyeXKS5EWGJviTvPxacgu1zIBy6jJ2y/T6i38rMyp1HPvSybHpvrh3GTDd
 QFMYFPZyPVIbHyU575NG6RKkzonrlbE8MulzirRshOGX5L5aBonlSj61uASfsZaSvmSQ
 WFBa2YuF42WObKSiV01yjiLiys6i3jybH7GrZBiz0R/73YeMX3vY4zrmvPYCqu/OC5KZ
 fsZixwRy2x00A0SK9739KSU7xy0axfwn+VjpqRqhfT3tgZpHWwIRIAY8dsOqDiVVvfvQ
 RrE+m28c5K3dhq/4cXLQgUWh1ENgNDkckAEwdLVebQJdVLAUkA7ABcpD+5FS/9KFR2QX
 /fBw==
X-Gm-Message-State: AOAM531cGFp/+I1r2FUFBipHzIxMQOyirQTZ4BF6gbk6Uxwb/uoEobgV
 ryfYT+BbWofZgHEIcjVN7ZSpqg+rVZGFmPc782E=
X-Google-Smtp-Source: ABdhPJzfDkdDyNmfefuMotX2eN5bmkOB6Y8710lSND6l6g7+bYjMCCZ8judHrLcl3eFvCMQnE0PSVA==
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr5037876wmo.179.1637689090938; 
 Tue, 23 Nov 2021 09:38:10 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id n13sm13054883wrt.44.2021.11.23.09.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:38:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/16] linux-user/host/sparc64: Add safe-syscall.inc.S
Date: Tue, 23 Nov 2021 18:37:48 +0100
Message-Id: <20211123173759.1383510-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123173759.1383510-1-richard.henderson@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/sparc64/hostdep.h          |  3 +
 linux-user/host/sparc64/safe-syscall.inc.S | 89 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 linux-user/host/sparc64/safe-syscall.inc.S

diff --git a/linux-user/host/sparc64/hostdep.h b/linux-user/host/sparc64/hostdep.h
index ce3968fca0..d832868cb1 100644
--- a/linux-user/host/sparc64/hostdep.h
+++ b/linux-user/host/sparc64/hostdep.h
@@ -12,4 +12,7 @@
 #ifndef SPARC64_HOSTDEP_H
 #define SPARC64_HOSTDEP_H
 
+/* We have a safe-syscall.inc.S */
+#define HAVE_SAFE_SYSCALL
+
 #endif
diff --git a/linux-user/host/sparc64/safe-syscall.inc.S b/linux-user/host/sparc64/safe-syscall.inc.S
new file mode 100644
index 0000000000..bb35c64cfc
--- /dev/null
+++ b/linux-user/host/sparc64/safe-syscall.inc.S
@@ -0,0 +1,89 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by linux-user/safe-syscall.S
+ *
+ * Written by Richard Henderson <richard.henderson@linaro.org>
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+        .text
+        .balign 4
+
+        .register %g2, #scratch
+        .register %g3, #scratch
+
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
+        .type   safe_syscall_start, @function
+        .type   safe_syscall_end, @function
+
+#define STACK_BIAS  2047
+#define PARAM(N)    STACK_BIAS + N*8
+
+        /*
+         * This is the entry point for making a system call. The calling
+         * convention here is that of a C varargs function with the
+         * first argument an 'int *' to the signal_pending flag, the
+         * second one the system call number (as a 'long'), and all further
+         * arguments being syscall arguments (also 'long').
+         */
+safe_syscall_base:
+        .cfi_startproc
+        /*
+         * The syscall calling convention isn't the same as the C one:
+         * we enter with o0 == &signal_pending
+         *               o1 == syscall number
+         *               o2 ... o5, (stack) == syscall arguments
+         *               and return the result in x0
+         * and the syscall instruction needs
+         *               g1 == syscall number
+         *               o0 ... o5 == syscall arguments
+         *               and returns the result in o0
+         * Shuffle everything around appropriately.
+         */
+        mov     %o0, %g2                /* signal_pending pointer */
+        mov     %o1, %g1                /* syscall number */
+        mov     %o2, %o0                /* syscall arguments */
+        mov     %o3, %o1
+        mov     %o4, %o2
+        mov     %o5, %o3
+        ldx     [%sp + PARAM(6)], %o4
+        ldx     [%sp + PARAM(7)], %o5
+
+        /*
+         * This next sequence of code works in conjunction with the
+         * rewind_if_safe_syscall_function(). If a signal is taken
+         * and the interrupted PC is anywhere between 'safe_syscall_start'
+         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
+         * The code sequence must therefore be able to cope with this, and
+         * the syscall instruction must be the final one in the sequence.
+         */
+safe_syscall_start:
+        /* if signal_pending is non-zero, don't do the call */
+        lduw    [%g2], %g3
+        brnz,pn %g3, 2f
+         nop
+        ta      0x6d
+safe_syscall_end:
+        /* code path for having successfully executed the syscall */
+        bcs,pn  %xcc, 1f
+         nop
+        ret
+         nop
+
+        /* code path when we didn't execute the syscall */
+2:      set     TARGET_ERESTARTSYS, %o0
+
+        /* code path setting errno */
+1:      mov     %o7, %g1
+        call    safe_syscall_set_errno_tail
+         mov    %g1, %o7
+
+        .cfi_endproc
+        .size   safe_syscall_base, .-safe_syscall_base
-- 
2.25.1


