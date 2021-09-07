Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1C4403103
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:26:31 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjXy-0007iT-4j
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2n-0006YU-Ht
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:17 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:38873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2l-0001AU-Ab
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:17 -0400
Received: by mail-io1-xd30.google.com with SMTP id a13so465091iol.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CxhQtk7C61C53+7/JcUhiUB/ovxqI2TDiE1M4q5e7Do=;
 b=uLBx45n3Mk4FSjFHzeH+rkffSE3x/a0KGg3Z6tPQG3iC8LvrOlMlH/9E0Hs1cxDFk5
 WMAG3rvETHODxyAzR0O07dX89chsI59C0QRTPExvVNeOeVq7pIytwx1u9vcY7PrdXZcO
 EoPtYnX0AcWa5h2UnpSiPe8lBdDUa8MuodRoyS5ky+YZQNqKzfAXRODbFGjeNwsgfR8a
 YkJZsUh8VXv9Qbfb80/vxx06yGOy2dvWKOPSIARQCHkL/4FQM21ILkgvNbom18hu0WWh
 MIhw8hcLgi2jlgYTLhXha8HEy/q8kFCk4X4CjnnLmC7ft1sVHjTeM0hY0JXg2oiTunqm
 xU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CxhQtk7C61C53+7/JcUhiUB/ovxqI2TDiE1M4q5e7Do=;
 b=PwOrS9juurzp4B1XpEeW2e6BfYPGi6umE8UMw7yQyiq5XSgSn06IqPtfjrlTXX0Tpj
 v/pj6gPru7En6gpfgiacUnbB7jINm62er0FpwJF2i8ISXgIxewn/FpJoqOvvMeZlTogw
 Ja9T1zcVphGSGuBf5HzoiKSezk1iQDH+wx3l4QSko1be88EEuOAv/vOnMEEVVtFLoDDF
 +QTZT9miLl/not/Nj8AUq/w+tFfalcvPsH/ML4at2UFzyuRbJkAIwvm1twPurNN+5T18
 Fm0weD3WZfVqfQaMzJmkVbdf1+/Wz7w+INiVCllPL6NnRSE5IVmtgany4YOeCOsbT+pc
 nuXA==
X-Gm-Message-State: AOAM5300zRcFjRQL2B2hP3G7f0s85pbWHD7gmMIrMaSFKdua8xwW+jEQ
 nKm9ZMYAKZk14a2OO20I0ELChP9vj+qIJf/8gSU=
X-Google-Smtp-Source: ABdhPJx1F3U3eOZaCytAdJUUzH/43Aie9yZqOzzQsVr6NPa294uiP9GCN5DBs8uuWmvoEYM31n0QyQ==
X-Received: by 2002:a02:90d0:: with SMTP id c16mr468011jag.106.1631051654110; 
 Tue, 07 Sep 2021 14:54:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:13 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 40/42] bsd-user: Implement interlock for atomic operations
Date: Tue,  7 Sep 2021 15:53:30 -0600
Message-Id: <20210907215332.30737-41-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
index 768f4ee41e..659dd2b512 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -69,15 +69,39 @@ unsigned long target_dflssiz = TARGET_DFLSSIZ;   /* initial data size limit */
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


