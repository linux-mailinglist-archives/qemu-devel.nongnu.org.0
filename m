Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7DC3FF84D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:16:30 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwsf-0007Be-Np
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRW-0007RC-Oz
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:26 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRU-0003I1-No
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:26 -0400
Received: by mail-il1-x12e.google.com with SMTP id v2so3549034ilg.12
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJdtUqmLYB1JaIrUZ7untsjS54rc3Nhd4Hgyfci22cs=;
 b=eBmlveu7cQ4uvFVENqBejItcGhR4HoDwDbraaXAvMDYBCpqd2m/wjanvLOqGKSc1qh
 l5T5xailpsE6DDINMpLV1lN1rlVq5CUFKzCO6QRbY465DhLmrIWlbEm8N0272MCeZP+0
 xndr02KfIJCUZc/abXzdMNaF5Sq25kqZuuXaprVZdPURsDMZQXu2GU2SwrTeLxKw5NYx
 vh1noAHZ64Yod410O/uk5YFU+Q1McleuApWo0fq7dp9RMzmJPQaNT2C2Ftuon/9WtCk+
 hp391m/rivGhtsHPBc7JvDr9c87naC8h9uCfFkya8vAqixE9NS82yYOy2VW6QRzhDny/
 wI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJdtUqmLYB1JaIrUZ7untsjS54rc3Nhd4Hgyfci22cs=;
 b=rm+fH5LMu37SGafshivY8K8ZmVVHwOp5F+XIHzstiaa6tZA37/7h6lVz4msSfQZ6OG
 QgFiXrZsL7mQW4fz8gFrhqhw1hr632VJe4HWLjxLRSJHILGeqLYIaUTmmoxEQqzK8bfF
 0sDP5QPmu/Z1IDSd4K6LRrodBqzjZFv1Y/InZgtNtm7GVEODZBdC1eforOCRN8mM+7Lu
 o1PdhGVLQBDSmv02/d6ehwDbk6GtvhT40nWcnxAHDuqoEIsdbT3ObDstRqoNEoatHeLd
 AiZv1uO+M0m4orCHBlR1xL3mUKpRPbAE+L3ISVryh61nFhBG8vUQ6AkgRfeFvwZjZKqY
 yQzA==
X-Gm-Message-State: AOAM5338cfe9kLMbupbp8BYhX5Dp9X7T2NM0ml/n1pBFndJNDBJ74jwH
 WXeN1qMPMiMFhOpxSyDH+2cS0yLZvpaOSQ==
X-Google-Smtp-Source: ABdhPJw09nCzLCgfUDOmBeuT2U1/nhz7fnZGBTKFj0m8tL4BRf1LeYNDzHrLYx2h4RbGa4w0XhqkXw==
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr536479ilq.220.1630626503266; 
 Thu, 02 Sep 2021 16:48:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:22 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 41/43] bsd-user: Implement interlock for atomic operations
Date: Thu,  2 Sep 2021 17:47:27 -0600
Message-Id: <20210902234729.76141-42-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Implement the internlock in fork_start() and fork_end() to properly cope
with atomic operations and to safely keep state for parent and child
processes.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 1de86ae493..88244eb8fe 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -71,15 +71,39 @@ unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
 unsigned long target_maxssiz = TARGET_MAXSSIZ;   /* max stack size */
 unsigned long target_sgrowsiz = TARGET_SGROWSIZ; /* amount to grow stack */
 
+/* Helper routines for implementing atomic operations. */
 
 void fork_start(void)
 {
+    start_exclusive();
+    cpu_list_lock();
+    mmap_fork_start();
 }
 
 void fork_end(int child)
 {
     if (child) {
+        CPUState *cpu, *next_cpu;
+        /*
+         * Child processes created by fork() only have a single thread.  Discard
+         * information about the parent threads.
+         */
+        CPU_FOREACH_SAFE(cpu, next_cpu) {
+            if (cpu != thread_cpu) {
+                QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+            }
+        }
+        mmap_fork_end(child);
+        /*
+         * qemu_init_cpu_list() takes care of reinitializing the exclusive
+         * state, so we don't need to end_exclusive() here.
+         */
+        qemu_init_cpu_list();
         gdbserver_fork(thread_cpu);
+    } else {
+        mmap_fork_end(child);
+        cpu_list_unlock();
+        end_exclusive();
     }
 }
 
-- 
2.32.0


