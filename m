Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC4B47C4D3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:17:00 +0100 (CET)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzil2-0007n3-1m
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJA-00010j-NX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:12 -0500
Received: from [2607:f8b0:4864:20::42b] (port=43923
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ3-0007fY-OH
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 196so8740052pfw.10
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NXitDDn0ZGVh6q/FUUAQ/qESIDgx/GkwWKwAawsJ6kU=;
 b=iCcO7UI8hnnozrRaBK3DoglDt43UlLzkBXfI5I4+Br0Ci7iPj4Y2LvyPlwtDIDNgO5
 XC+p2lIaP9h0jjXtb91E/5cIi/2uqX8/nHyxXG8zRqKvz8JZIiMra/WzwdULGxZBlTpn
 T1jMo+SFwOwGyH+dRuMDBKFrifBqP0Ojus7tg8p1qfGRmQu/mDzqAxmlqVcWSiop2j3G
 kE1s7JMnVaN/IKbUTg0Q8OVvWbNjZ4ROKATzmMXmfDMvXsJMdxUItRn/pXb38t1ljOQE
 o7Ih4DcmhhBZTvvkKaIQMTViOn9YtxfHbisE+B/vuDYr79SUx4hvPuKAkuRO44It2XC6
 ITOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXitDDn0ZGVh6q/FUUAQ/qESIDgx/GkwWKwAawsJ6kU=;
 b=7KDj6iHVwqOHHT2XuiLYMbUgQCYgX3h7Rb9ezi23gzifqCUtigsbUVEgjatCi5Ywtu
 21x2UTHAyx5J8E3PJHsYQ0lZRdU6gF1OK5SYv8Ps5O1oXJ0whXZR2DGx9IByVeaMGWlN
 W5TJnV9qVgvtWLUzV+RNDCeyiFqb8z8dLTW92Z6j2TYmmKD+nTXzJWwrA2V51VhHVFdv
 BcTiHX6xlF9F3dvbZ2YZCwgJA6bIgtDi+C97zj4+JQoLb26FhZgyYoUb7FxKS5Ldm7g4
 xDABXONJI73bJiIuBCISf363os8s8XJd7KqfvmD2gwIyOo+mau690YAYQ55NkCS1BE2e
 QKEg==
X-Gm-Message-State: AOAM531IEUEzHcyxO6WHvs0Qwt4N4kWRQRWqUN3lzVuzyUDMZUIDusLl
 W+xhO/iZKA8Qy84LOeNSNglbwEQwjX/XBQ==
X-Google-Smtp-Source: ABdhPJwA4ufav5t8FdOOyABRqLSKODzYCzGi3fSAL//tPmKi5OIWK8S6HiXvAzTR5EM6qBZKJtrc8g==
X-Received: by 2002:a63:1158:: with SMTP id 24mr3655380pgr.193.1640105284430; 
 Tue, 21 Dec 2021 08:48:04 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/31] common-user: Add safe syscall handling for loongarch64
 hosts
Date: Tue, 21 Dec 2021 08:47:34 -0800
Message-Id: <20211221164737.1076007-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-29-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../host/loongarch64/safe-syscall.inc.S       | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S

diff --git a/common-user/host/loongarch64/safe-syscall.inc.S b/common-user/host/loongarch64/safe-syscall.inc.S
new file mode 100644
index 0000000000..b88a069c45
--- /dev/null
+++ b/common-user/host/loongarch64/safe-syscall.inc.S
@@ -0,0 +1,90 @@
+/*
+ * safe-syscall.inc.S : host-specific assembly fragment
+ * to handle signals occurring at the same time as system calls.
+ * This is intended to be included by common-user/safe-syscall.S
+ *
+ * Ported to LoongArch by WANG Xuerui <git@xen0n.name>
+ *
+ * Based on safe-syscall.inc.S code for RISC-V,
+ * originally written by Richard Henderson <rth@twiddle.net>
+ * Copyright (C) 2018 Linaro, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+        .global safe_syscall_base
+        .global safe_syscall_start
+        .global safe_syscall_end
+        .type   safe_syscall_base, @function
+        .type   safe_syscall_start, @function
+        .type   safe_syscall_end, @function
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
+         * The syscall calling convention is nearly the same as C:
+         * we enter with a0 == &signal_pending
+         *               a1 == syscall number
+         *               a2 ... a7 == syscall arguments
+         *               and return the result in a0
+         * and the syscall instruction needs
+         *               a7 == syscall number
+         *               a0 ... a5 == syscall arguments
+         *               and returns the result in a0
+         * Shuffle everything around appropriately.
+         */
+        move    $t0, $a0        /* signal_pending pointer */
+        move    $t1, $a1        /* syscall number */
+        move    $a0, $a2        /* syscall arguments */
+        move    $a1, $a3
+        move    $a2, $a4
+        move    $a3, $a5
+        move    $a4, $a6
+        move    $a5, $a7
+        move    $a7, $t1
+
+        /*
+         * We need to preserve the signal_pending pointer but t0 is
+         * clobbered by syscalls on LoongArch, so we need to move it
+         * somewhere else, ideally both preserved across syscalls and
+         * clobbered by procedure calls so we don't have to allocate a
+         * stack frame; a6 is just the register we want here.
+         */
+        move    $a6, $t0
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
+        /* If signal_pending is non-zero, don't do the call */
+        ld.w    $t1, $a6, 0
+        bnez    $t1, 2f
+        syscall 0
+safe_syscall_end:
+        /* code path for having successfully executed the syscall */
+        li.w    $t2, -4096
+        bgtu    $a0, $t2, 0f
+        jr      $ra
+
+        /* code path setting errno */
+0:      sub.d   $a0, $zero, $a0
+        b       safe_syscall_set_errno_tail
+
+        /* code path when we didn't execute the syscall */
+2:      li.w    $a0, QEMU_ERESTARTSYS
+        b       safe_syscall_set_errno_tail
+        .cfi_endproc
+        .size   safe_syscall_base, .-safe_syscall_base
-- 
2.25.1


