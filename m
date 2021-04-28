Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C236D0E5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 05:33:42 +0200 (CEST)
Received: from localhost ([::1]:46978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbaxJ-0000t1-Li
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 23:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbavy-0007zo-2Z
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:18 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbavv-0008Uy-Sq
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 23:32:17 -0400
Received: by mail-pg1-x532.google.com with SMTP id m12so3038213pgr.9
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uu7E7D4g2MoU0eqIdSF7egrQbawxP33jY9TUWvyJdgc=;
 b=Y+yz7IZ1G0iZLUKL7PEMpyZNrEo3XH15xWe7Y6G8+n6+QyDDkAd/ji46fhGmKr12q/
 ePPxuiIomPpJlwlWynWR4f7feJ8qohiPIY8xtFawjlXW5CU2iR8ZqqMzBKOLDCIjf+aY
 O/VyzLsYAPTNjOHaAk4jyyRhEi6QRq5cIOL84gH9W0R2TVfMPuNxD4P4nu7NNAZCUA3T
 gfIbWzRg+NWXA9H+m7hDIa2RXjsZKZ+2AGqZP+hgBKQgai4xxiCd7CdZ3pbP+9pvROZo
 GgrUqb3o0MqtQUowEwpooUq7r+YrauT1ePRiSL/fFbAyCGhiAgXT03GxNrY+8FPSZK6x
 ULxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uu7E7D4g2MoU0eqIdSF7egrQbawxP33jY9TUWvyJdgc=;
 b=Iwl2t+uTO8eHCKd3V13LPaphS9zyypCakWpn0LV+ivxkf7zCHrLB38Mxkhvq0EB62W
 j7to5BWkfZiEAvtq3DxWtjQ7buHx1nLHX8tQ/vQCShmQ+vDGzULu0aAstyYqixQjvxBK
 LmCOXdIa/utvNkJEsy3FZaQi/bdljbGZ0rQLcEmM4cBUCmAOISLH9gXUb5nUTvKSdZQE
 HekQM4zCdVRjM5GOWVlHHXM9fSTNafRg7m465uNt4/KUskSfQ4iUeuBejANW/9y5/W+2
 O5+HfoYN4DsRvul1sWLXH4Zaavp6zRumY00NQpEvm53KQKVxxyvzhzjcH8LhDLWrd5sB
 jk1A==
X-Gm-Message-State: AOAM531/n+4TzfITGeE4N9m9FFBui0dncn2A4VqOIW/tl4o+0zJBmhrq
 WRBl9ulqcOB8f8S9cgh5z+DQgKvQuSbrIg==
X-Google-Smtp-Source: ABdhPJzadtlDlHAjGf1yB3CSlxcC+4rHeZtXkhY1pUSPTnEx7cg7rBgvkFyCQDDrGWy7IzaM9+DVEQ==
X-Received: by 2002:aa7:9a8d:0:b029:27c:a7c8:b7b0 with SMTP id
 w13-20020aa79a8d0000b029027ca7c8b7b0mr1941305pfi.17.1619580734634; 
 Tue, 27 Apr 2021 20:32:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 18sm3572335pji.30.2021.04.27.20.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 20:32:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] linux-user/s390x: Fix sigframe types
Date: Tue, 27 Apr 2021 20:32:02 -0700
Message-Id: <20210428033204.133471-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428033204.133471-1-richard.henderson@linaro.org>
References: <20210428033204.133471-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index b68b44ae7e..e5bc4f0358 100644
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
-- 
2.25.1


