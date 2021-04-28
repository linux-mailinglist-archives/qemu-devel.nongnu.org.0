Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342FA36DF96
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:37:23 +0200 (CEST)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpzt-0007RK-Nc
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpws-0005nX-46
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:14 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpwp-0004Zw-Iv
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:13 -0400
Received: by mail-pl1-x62a.google.com with SMTP id s15so5014107plg.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cKz59LBlWyL1B0Sl0FJSvMv7AA4rumd2kHEJJnx9oPw=;
 b=BBh+gQyEFs9zbVokzSXc6j6ynMGK2MJKeeCf7GjU0gWKfCp1t+l5GATZD5hK2UAfXS
 0vMIJc+3Al+9HYrL+cnl1Rw2UH5gAnSKOJMSkUWTqcAaEs81+FmwzmoxMF6ZxCps8MEO
 Y8Y32tpjXJmiD0PZ3RHteR463o/IlkpEfs4dTNSE2Jgi0VjMUT7cY+nMsUXPph5cdwf8
 7ddHJpWCJYFVjxsZCaRr2TB4MTu/d56tgIs7f9G1X5Ts2/Bfwn64Dew0CyxQS+LmCeIA
 7FaQ54ScMGHcUzhr5CBwykluNTi4AEbCBon4+IX6ZcaWG0RB7FB+iLoHkxl19beAfmDl
 GJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cKz59LBlWyL1B0Sl0FJSvMv7AA4rumd2kHEJJnx9oPw=;
 b=rXd4E/EmPNIPKJDtQXo7Zd18hLFmG3B+/R6pI8xOiEp7+AiGsQTtZ8RE7FC1BJC3eB
 jnGnQU59cKpktcx8Vo5Lr8sU38fjrAuFdwCKhuPiVXv3Azy5Q2k788pdyz6wTCVcvOu2
 xN6/qwA56wx+0ZeDuKvRCdfFWYQIdXuVPR57moU01+yng2JFDRfP2KU98QnrBmMWwY6b
 EmniXyIYyd20pHX9CrWUglc84/lvKfT5gx/lf+7lP5Q4V2gtP8JK0p3lEcKY8VEhuBUI
 bGyMkj2T0WMamOeHQA6yzPiUIAxnvlIJIe9nqXNUb3Xi7+Aeeap+YRWinz6HtVa2qIiP
 YOsA==
X-Gm-Message-State: AOAM530KfQsvU4tXNoXRwGBTfZWPe5I+Zv0ALW3DRX56EIzv5p8Y52pP
 Weal8fTPYZ9JS/oJIz4jNpxBhPD8pkitmQ==
X-Google-Smtp-Source: ABdhPJzBrWBBjML0Lg9Z2x6gbM9XQxjlQ4DFhgbjUjeGNwFNqaGowt570LbvWWgYZYuADzqrxXFGvw==
X-Received: by 2002:a17:902:b494:b029:e7:36be:9ce7 with SMTP id
 y20-20020a170902b494b02900e736be9ce7mr31689532plr.43.1619638450051; 
 Wed, 28 Apr 2021 12:34:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] linux-user/s390x: Fix sigframe types
Date: Wed, 28 Apr 2021 12:33:54 -0700
Message-Id: <20210428193408.233706-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Noticed via gitlab clang-user job:

  TEST    signals on s390x
../linux-user/s390x/signal.c:258:9: runtime error: \
  1.84467e+19 is outside the range of representable values of \
  type 'unsigned long'

Which points to the fact that we were performing a double-to-uint64_t
conversion while storing the fp registers, instead of just copying
the data across.

Turns out there are several errors:

target_ulong is the size of the target register, whereas abi_ulong
is the target 'unsigned long' type.  Not a big deal here, since we
only support 64-bit s390x, but not correct either.

In target_sigcontext and target ucontext, we used a host pointer
instead of a target pointer, aka abi_ulong.

Fixing this allows the removal of a cast to __put_user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index b68b44ae7e..707fb603d7 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -37,13 +37,14 @@
 
 typedef struct {
     target_psw_t psw;
-    target_ulong gprs[__NUM_GPRS];
-    unsigned int acrs[__NUM_ACRS];
+    abi_ulong gprs[__NUM_GPRS];
+    abi_uint acrs[__NUM_ACRS];
 } target_s390_regs_common;
 
 typedef struct {
-    unsigned int fpc;
-    double   fprs[__NUM_FPRS];
+    uint32_t fpc;
+    uint32_t pad;
+    uint64_t fprs[__NUM_FPRS];
 } target_s390_fp_regs;
 
 typedef struct {
@@ -51,22 +52,22 @@ typedef struct {
     target_s390_fp_regs     fpregs;
 } target_sigregs;
 
-struct target_sigcontext {
-    target_ulong   oldmask[_SIGCONTEXT_NSIG_WORDS];
-    target_sigregs *sregs;
-};
+typedef struct {
+    abi_ulong oldmask[_SIGCONTEXT_NSIG_WORDS];
+    abi_ulong sregs;
+} target_sigcontext;
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    struct target_sigcontext sc;
+    target_sigcontext sc;
     target_sigregs sregs;
     int signo;
     uint8_t retcode[S390_SYSCALL_SIZE];
 } sigframe;
 
 struct target_ucontext {
-    target_ulong tuc_flags;
-    struct target_ucontext *tuc_link;
+    abi_ulong tuc_flags;
+    abi_ulong tuc_link;
     target_stack_t tuc_stack;
     target_sigregs tuc_mcontext;
     target_sigset_t tuc_sigmask;   /* mask last for extensibility */
@@ -143,8 +144,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     save_sigregs(env, &frame->sregs);
 
-    __put_user((abi_ulong)(unsigned long)&frame->sregs,
-               (abi_ulong *)&frame->sc.sregs);
+    __put_user((abi_ulong)(unsigned long)&frame->sregs, &frame->sc.sregs);
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-- 
2.25.1


