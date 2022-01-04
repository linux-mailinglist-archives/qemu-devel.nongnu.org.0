Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04D484835
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 20:06:12 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4p8M-0004yZ-SH
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 14:06:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4p7D-0004HY-17
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 14:04:59 -0500
Received: from [2607:f8b0:4864:20::1029] (port=45032
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4p7B-00040S-FV
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 14:04:58 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so4115040pji.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7lUdTNoTHxnRTzjvvQ4J1IabVe3mjQyphI5j6AoRnhQ=;
 b=Fz9PXuCF9iCDVMiHrOUAzB2qP+Raz7uceAXYruB7dTzto61XYSqKAX3HJ9HH1QY9Pq
 mn6bmNd2qKMrFXIJdL0IxfqHiXkrtpnlneqs4wkWB5S206v31A9imxyMG6isYdWZ/Vt5
 gI+MoGYTZSMGT65gCUz30e2cb0wqyMjEP739Lp10yPVvm2QnPYHQiVW13hSWKSXhGcJ3
 H2sjvwuKpxwSODeBZQRwRfT2BafXG7W69lzpX6BYBfvMbtPrX/+rImh3YATdvO0o7I4Z
 oNDge3vBpi8lonv/cll8BieGkdCTxexMGvSJqrz1ZhmfK1p9xYFu2+Cfowq9HsOuzSjF
 ezgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7lUdTNoTHxnRTzjvvQ4J1IabVe3mjQyphI5j6AoRnhQ=;
 b=gbWRRDi+Y+nD2QHBJtMbBGQT4iwKGx+utaP/Ql7dosZAc226Wxpj/2Fn721BMV6peg
 +gAEIDhi/ntFosshAs0S7kiD/IwlijW5LwVvmHyxq5mupDPoqm26aeH6Eo9gSsSg040v
 7iiBuKENzyE6fGzzWQhuUAY1DTMKvjxPRTR7y3ljAT498j4jE2qzOjsjE183SJcri2QJ
 qyh0AAGQWuRLPGpekeSbgQ88JdOpqwr+gxW+tK+CeFHxujw56w5HrXR6yVwpMHmrzdyk
 A7tPtKQxABUvb+XtVrKqdguAbtJ/JK3xY7ozBQOZ8NbYFuwXlmQF2N/Nx/tYxhYhk4KU
 beCQ==
X-Gm-Message-State: AOAM531zUWRMgnF6CLHIFp+Og0n3ZN3beFO1IwfXSaAYFEdv5osCUVwA
 oF24yRcC/lDox6assgsy6CyF3IUYujPmcQ==
X-Google-Smtp-Source: ABdhPJz4q5ZwDodJEKFfiOD5WLEO9Df4+F1YVa3RURCeQ7BX5XsudWDK+xYCxY6CbLbZrB/vEOaNog==
X-Received: by 2002:a17:902:d509:b0:149:4493:ffe8 with SMTP id
 b9-20020a170902d50900b001494493ffe8mr49158923plg.36.1641323095871; 
 Tue, 04 Jan 2022 11:04:55 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g66sm41503573pfb.64.2022.01.04.11.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 11:04:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] common-user: Fix tail calls to safe_syscall_set_errno_tail
Date: Tue,  4 Jan 2022 11:04:54 -0800
Message-Id: <20220104190454.542225-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the ABIs in which the syscall return register is not
also the first function argument register, move the errno
value into the correct place.

Fixes: a3310c0397e2
Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/i386/safe-syscall.inc.S   | 1 +
 common-user/host/mips/safe-syscall.inc.S   | 1 +
 common-user/host/x86_64/safe-syscall.inc.S | 1 +
 3 files changed, 3 insertions(+)

diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i386/safe-syscall.inc.S
index baf5400a29..9c45e56e48 100644
--- a/common-user/host/i386/safe-syscall.inc.S
+++ b/common-user/host/i386/safe-syscall.inc.S
@@ -120,6 +120,7 @@ safe_syscall_end:
         pop     %ebp
         .cfi_adjust_cfa_offset -4
         .cfi_restore ebp
+        mov     %eax, (%esp)
         jmp     safe_syscall_set_errno_tail
 
         .cfi_endproc
diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mips/safe-syscall.inc.S
index fc75a337d1..6a44614970 100644
--- a/common-user/host/mips/safe-syscall.inc.S
+++ b/common-user/host/mips/safe-syscall.inc.S
@@ -141,6 +141,7 @@ safe_syscall_end:
 1:      USE_ALT_CP(t0)
         SETUP_GPX(t1)
         SETUP_GPX64(t0, t1)
+        move    a0, v0
         PTR_LA  t9, safe_syscall_set_errno_tail
         jr      t9
 
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/x86_64/safe-syscall.inc.S
index a20927a783..d1a67a303a 100644
--- a/common-user/host/x86_64/safe-syscall.inc.S
+++ b/common-user/host/x86_64/safe-syscall.inc.S
@@ -99,6 +99,7 @@ safe_syscall_end:
 1:      pop     %rbp
         .cfi_def_cfa_offset 8
         .cfi_restore rbp
+        mov     %eax, %edi
         jmp     safe_syscall_set_errno_tail
         .cfi_endproc
 
-- 
2.25.1


