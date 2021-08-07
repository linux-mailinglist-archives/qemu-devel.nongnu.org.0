Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD753E3745
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:56:34 +0200 (CEST)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUIt-0006bz-TB
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6W-0000Hm-Nt
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:41 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6V-0005TW-8l
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:40 -0400
Received: by mail-io1-xd36.google.com with SMTP id s184so20004188ios.2
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vOkvP8eW9FaZE+oQEicIqxiTibF7uC5PjljIsjV9a8M=;
 b=pt7nvL/ZCuALCKXK9QCWkULpi8bP2R1yY6mbnJ86xJcIp+TM8DWJqnKHE9Wxeg6+RB
 LzoCw9IcbROaNTgXtFmFixG4OZObypc9USuDOsIqQZL4yctxGlCyN/98IrWaOp5+sHg/
 mQ6RNKwC4iKOItVfpSAJtkJKHfhkGbn2Nye6+IRKConI0RiLcdPa7cE3s3EicwU9BsOr
 v4dmzx2roU69snDlSowdGTVXnqPiorHnHbdqb9hIuUTThcYlMHb68UCR1FiV0CQmd+08
 cGfKOyHmC5tqCGv5CfkvY2F6P/hPhvNOVaPD4/GKQNXqJFqM2CnUMV1M5XhFrPVkDwTi
 hcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vOkvP8eW9FaZE+oQEicIqxiTibF7uC5PjljIsjV9a8M=;
 b=XMeBV6qX63VEj+a+i7mrJGj7s2tRUaSd48XxNGeWk2gG8PadhkPMhwfqZ9EDexagYk
 Cq++SaQQ4s7ShzIzdrI7Pb6iHd6aSPcigx4bn9EBvVSPjC0ogdZEFzhj+sunLK7CynFq
 5eexiovxF165x8qGDBQp3qSUSEwhVQNNI5JamtA853o6XFA7aeVjV1NivX9cypqxCPpa
 +9O6uF0VWPLctviLcB+W2qBqj88FOUm7wlSTjqdbESyoumlPPqVF1/PjbhqEYnQ7SQK3
 1Bw3TuL1ptODHzd8COrQOLILXrn+feHPelbE+Imfdx2sANdN38PiEHUgGwE10DEcJK2k
 jfVA==
X-Gm-Message-State: AOAM532YfPTXlXEio79a9gqId54gig7lNpKipRoRRhI11pPn8oYVZR0t
 +3Qe3F9LV5Py01y6V/0u+87Eb3/oD1Z/BXQG
X-Google-Smtp-Source: ABdhPJyLS0HAPdm3PRC9VMokH1qbPaBdW2FiNXAg7BPjmkQsz6NcnN3w4QGLhJTjuqCaJL0Zp63Guw==
X-Received: by 2002:a05:6e02:1aa3:: with SMTP id
 l3mr23292ilv.299.1628372618046; 
 Sat, 07 Aug 2021 14:43:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 47/49] bsd-user: Implement interlock for atomic
 operations
Date: Sat,  7 Aug 2021 15:42:40 -0600
Message-Id: <20210807214242.82385-48-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Implement the internlock in fork_start() and fork_end() to properly cope
with atomic operations and to safely keep state for parent and child
processes.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 7ba616a995..2b0716d245 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -85,15 +85,38 @@ unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
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
+         * Child processes created by fork() only have a single thread.
+         * Discard information about the parent threads.
+         */
+        CPU_FOREACH_SAFE(cpu, next_cpu) {
+            if (cpu != thread_cpu) {
+                QTAILQ_REMOVE_RCU(&cpus, cpu, node);
+            }
+        }
+        mmap_fork_end(child);
+        /* qemu_init_cpu_list() takes care of reinitializing the
+         * exclusive state, so we don't need to end_exclusive() here.
+         */
+	qemu_init_cpu_list();
         gdbserver_fork(thread_cpu);
+    } else {
+        mmap_fork_end(child);
+	cpu_list_unlock();
+        end_exclusive();
     }
 }
 
-- 
2.32.0


