Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C044D2A6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:46:12 +0100 (CET)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4mh-0007HX-Tv
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:46:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d6-0003f6-41
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:16 -0500
Received: from [2a00:1450:4864:20::535] (port=45989
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d2-00079B-H2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:15 -0500
Received: by mail-ed1-x535.google.com with SMTP id f4so20549349edx.12
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iA8vB4TfqWHRgjLEj3itlzFwZkdkH8YIgO+YxnoGWAo=;
 b=XwM4fEyrzBLX4JUQPx4bpU7Bgs4vA7GVWppSHfcs2NkUoGrps5QmvdvfwJYU1Kgd0a
 CkWDNoA3s2RTUjvdVfINB+15oQLzHgYh+g3z/3r+3tXddYhSox0MeuabcgB5OZ5BHLDr
 HDP/D2rkxrrlqe4Is7XZh4e0Zo0uhuJr/GrCes7ZOZ9mZtGNn+htJe7o5oTvM2m4hR/c
 j4vZmEPgzn/zL7cWuZX6+fwjZRbDUAhAfifd85Z4gj2WI1XXj7eFFXyAnOtzEHDtx/nR
 YB8pfA235Bo3PQDHD/fYPEb0JDSjqHI2F+H1MYtCJbsEuKEx+s8cQLHgG/jPBo7hMLRa
 yDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iA8vB4TfqWHRgjLEj3itlzFwZkdkH8YIgO+YxnoGWAo=;
 b=AnGszSqfHlHz9ChqPJGPmlzkSGcC0FV3QreqpEVjFBDHTf107NqgG0Qut7QWiLRV2Y
 Jzwa7B8iqF/HgVa45fXY37lKe+g3zsQg8HnwTmtfpGx2vqK2GoYWu1IdGcNprvxuRWAK
 MXEoi8PeO1/hiEKdXZOgqcS9cchLJQXwi7oNCoR9fj0g83pJBKYIXiqiyi0vKDBFXlQd
 lrRB9HaN/KucY9RFccZyku8qT0N2D5gh53HfCVarQl3bRorpplBqB7FlYLsjMt+a86uB
 ibhcZWqbLIRh6vbdYxoa0F//wtgnzUW5fxwFz+FIqoNuHac9dknJWWO+uK/pll3xhxrN
 nA8A==
X-Gm-Message-State: AOAM533y5I2I1Ubu7h3lFihM/93stdVvv2QIiaa4l7O2rBCDG8bAO3vV
 KtfTej7d3ycRNmGN16bO3i0kHKZeco0=
X-Google-Smtp-Source: ABdhPJyPENLq0q1xzQBHKViFdnQO6HiDGeFs7YfDF9bMUD/6gC41EdOnQhUpVVRJq9Vo1mMkbExFoQ==
X-Received: by 2002:a05:6402:1744:: with SMTP id
 v4mr7294297edx.366.1636616170474; 
 Wed, 10 Nov 2021 23:36:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w1sm1062098edd.49.2021.11.10.23.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 23:36:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] rcu: Introduce force_rcu notifier
Date: Thu, 11 Nov 2021 08:36:04 +0100
Message-Id: <20211111073607.195697-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111073607.195697-1-pbonzini@redhat.com>
References: <20211111073607.195697-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The drain_rcu_call() function can be blocked as long as an RCU reader
stays in a read-side critical section. This is typically what happens
when a TCG vCPU is executing a busy loop. It can deadlock the QEMU
monitor as reported in https://gitlab.com/qemu-project/qemu/-/issues/650 .

This can be avoided by allowing drain_rcu_call() to enforce an RCU grace
period. Since each reader might need to do specific actions to end a
read-side critical section, do it with notifiers.

Prepare ground for this by adding a notifier list to the RCU reader
struct and use it in wait_for_readers() if drain_rcu_call() is in
progress. An API is added for readers to register their notifiers.

This is largely based on a draft from Paolo Bonzini.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211109183523.47726-2-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/rcu.h | 15 +++++++++++++++
 util/rcu.c         | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 515d327cf1..e69efbd47f 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -27,6 +27,7 @@
 #include "qemu/thread.h"
 #include "qemu/queue.h"
 #include "qemu/atomic.h"
+#include "qemu/notify.h"
 #include "qemu/sys_membarrier.h"
 
 #ifdef __cplusplus
@@ -66,6 +67,13 @@ struct rcu_reader_data {
 
     /* Data used for registry, protected by rcu_registry_lock */
     QLIST_ENTRY(rcu_reader_data) node;
+
+    /*
+     * NotifierList used to force an RCU grace period.  Accessed under
+     * rcu_registry_lock.  Note that the notifier is called _outside_
+     * the thread!
+     */
+    NotifierList force_rcu;
 };
 
 extern __thread struct rcu_reader_data rcu_reader;
@@ -180,6 +188,13 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_auto_unlock)
 #define RCU_READ_LOCK_GUARD() \
     g_autoptr(RCUReadAuto) _rcu_read_auto __attribute__((unused)) = rcu_read_auto_lock()
 
+/*
+ * Force-RCU notifiers tell readers that they should exit their
+ * read-side critical section.
+ */
+void rcu_add_force_rcu_notifier(Notifier *n);
+void rcu_remove_force_rcu_notifier(Notifier *n);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/rcu.c b/util/rcu.c
index 13ac0f75cb..c91da9f137 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -46,6 +46,7 @@
 unsigned long rcu_gp_ctr = RCU_GP_LOCKED;
 
 QemuEvent rcu_gp_event;
+static int in_drain_call_rcu;
 static QemuMutex rcu_registry_lock;
 static QemuMutex rcu_sync_lock;
 
@@ -107,6 +108,8 @@ static void wait_for_readers(void)
                  * get some extra futex wakeups.
                  */
                 qatomic_set(&index->waiting, false);
+            } else if (qatomic_read(&in_drain_call_rcu)) {
+                notifier_list_notify(&index->force_rcu, NULL);
             }
         }
 
@@ -339,8 +342,10 @@ void drain_call_rcu(void)
      * assumed.
      */
 
+    qatomic_inc(&in_drain_call_rcu);
     call_rcu1(&rcu_drain.rcu, drain_rcu_callback);
     qemu_event_wait(&rcu_drain.drain_complete_event);
+    qatomic_dec(&in_drain_call_rcu);
 
     if (locked) {
         qemu_mutex_lock_iothread();
@@ -363,6 +368,20 @@ void rcu_unregister_thread(void)
     qemu_mutex_unlock(&rcu_registry_lock);
 }
 
+void rcu_add_force_rcu_notifier(Notifier *n)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    notifier_list_add(&rcu_reader.force_rcu, n);
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
+void rcu_remove_force_rcu_notifier(Notifier *n)
+{
+    qemu_mutex_lock(&rcu_registry_lock);
+    notifier_remove(n);
+    qemu_mutex_unlock(&rcu_registry_lock);
+}
+
 static void rcu_init_complete(void)
 {
     QemuThread thread;
-- 
2.33.1



