Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3B8663143
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRy-0003ND-JC; Mon, 09 Jan 2023 15:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRv-0003Lc-QY
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:51 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRu-0007dI-0z
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:51 -0500
Received: by mail-pl1-x634.google.com with SMTP id d15so10765064pls.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6a8SyY9eZgzz8AJukTfXtGKf9OCDu+smgkxjoQH9ksA=;
 b=CKutZpt7GvKGaNE9Cacl+mzJmQuG9z7hV6gNd93dFUJhjFoENkM1nnZvj2t4D1dNEX
 yu0NbyIQk8x3jRcLURk6S0eUyP6xtNbHfardxHxZ8r8BYKieVp0p4Moy4rJD9tHzMgIB
 ik1kT0RB4wz5Cd6KMvQT7oqBYk7ZvUkcOF0vqVzlQ45qu5DQGpaG5i0kWCW9qBBwKRT9
 glfjukXWn1qbSSLSVLtli/NraA7tSyzx8LI/pSQrk8HiHpy7Xb9hb7J8OS2iiyW8REiX
 gukRM5zUaWNpEBc72nwETHzVwtLLL2m0pyXIeSMDhdx1qXFKE4wfn0LCzneedBVI9WWE
 sO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6a8SyY9eZgzz8AJukTfXtGKf9OCDu+smgkxjoQH9ksA=;
 b=gKkFUPYXVeg/QKFT8/JTK/196xvnCMtQIP3VYYMuWBVyEGAoN2B18rQKc4KfXELEBE
 Dylg+NV6jCoQzPNpD4k2C4lt8+dm1579s45icq05x66HQoDEvwRYzXebsMqYFQAuGOsS
 3DsH6/ainOG8V0XpFMn4FEjIHJKbr/gFUgwpFORMae15/16Ccr93VAt6Jy7PYhILMLg0
 +fq8XDciq5vkJe7RcHIz/R17yHUaJEZfMpwY8fnUICIa90KhNPn8gvlMJiLtlwBIHuJ1
 dvjhfKDrb3ObnGh/hcuHWDr/HvmieZ68Po1UuLrejTznLrj62mlgK+7nRHoo+sd60WBb
 w1Zw==
X-Gm-Message-State: AFqh2kpb/U61XIZG9lSDkZUlTeK9B5cw36zC8Z4lUcRgTU5IrgjaPoul
 v5Ojb8pXR1TErcEOQsy1hC1ev4nWJJcZNi7q
X-Google-Smtp-Source: AMrXdXtAEOMO1PyyaCznZIgpBzofXYYZgh0XUI5NoxjgaFjz6NmcoIFshgAxmkRSsu1GFB/iMEzVog==
X-Received: by 2002:a17:90b:2645:b0:226:f523:28c5 with SMTP id
 pa5-20020a17090b264500b00226f52328c5mr8803915pjb.22.1673294928995; 
 Mon, 09 Jan 2023 12:08:48 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 25/27] tests/tcg/s390x: Add per.S
Date: Mon,  9 Jan 2023 12:08:17 -0800
Message-Id: <20230109200819.3916395-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to avoid regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221130174610.434590-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/per.S                   | 55 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 tests/tcg/s390x/per.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index d6ca8d7342..7ee69e78d8 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -9,3 +9,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 TESTS += unaligned-lowcore
 TESTS += bal
 TESTS += sam
+TESTS += per
diff --git a/tests/tcg/s390x/per.S b/tests/tcg/s390x/per.S
new file mode 100644
index 0000000000..02f8422c44
--- /dev/null
+++ b/tests/tcg/s390x/per.S
@@ -0,0 +1,55 @@
+#define N_ITERATIONS 10
+
+    .org 0x8d
+ilc:
+    .org 0x8e
+program_interruption_code:
+    .org 0x96
+per_code:
+    .org 0x150
+program_old_psw:
+    .org 0x1d0                         /* program new PSW */
+    .quad 0,pgm_handler
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lpswe per_on_psw
+start_per:
+    lghi %r0,N_ITERATIONS
+    xgr %r1,%r1
+    lctlg %c9,%c11,per_on_regs
+loop:
+    brct %r0,loop
+    lctlg %c9,%c11,per_off_regs
+    cgijne %r1,N_ITERATIONS-1,fail     /* expected number of events? */
+    lpswe success_psw
+fail:
+    lpswe failure_psw
+
+pgm_handler:
+    chhsi program_interruption_code,0x80         /* PER event? */
+    jne fail
+    cli per_code,0x80                  /* successful-branching event? */
+    jne fail
+    la %r1,1(%r1)                      /* increment event counter */
+    mvc return_psw(8),program_old_psw
+    lg %r3,program_old_psw+8
+    llgc %r2,ilc
+    sgr %r3,%r2                        /* rewind PSW */
+    stg %r3,return_psw+8
+    lpswe return_psw
+
+    .align 8
+per_on_psw:
+    .quad 0x4000000000000000,start_per
+per_on_regs:
+    .quad 0x80000000,0,-1              /* successful-branching everywhere */
+per_off_regs:
+    .quad 0,0,0
+return_psw:
+    .quad 0,0
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.34.1


