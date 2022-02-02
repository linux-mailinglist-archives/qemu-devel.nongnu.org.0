Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92364A7A78
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 22:30:18 +0100 (CET)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFNCj-0001QO-HK
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 16:30:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nFJpR-0000Bp-1q
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nFJpN-0003QM-Eh
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 12:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643824436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CNTCgH0KA2d0hMHKCy/nfIP6QylX36svPrT1gmcQwEI=;
 b=FPfYgM12P9i1LCHxz6lYnte+SsVDTydyBK8FU1MdomFyURWUfwZ1QmpFMFUkblZak/8k7N
 Z8gVPeZ8hLp+rzv3aneoqoRIP/Yz8q8LCTtzdpUHqHBPOQVY4hP8uI9/NzkprnyUAB6ax+
 SCK57wehH/cKBDZ9Tha+o1Wh2QcrllI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-zJUDLDqhNu67tPfRLZKNwA-1; Wed, 02 Feb 2022 12:52:45 -0500
X-MC-Unique: zJUDLDqhNu67tPfRLZKNwA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so93829wml.1
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 09:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNTCgH0KA2d0hMHKCy/nfIP6QylX36svPrT1gmcQwEI=;
 b=gh90ntnaMMi71K0ng9N5Y8a3rkjDmF06WfyLsiv6QAk+E/GkIcKkF3HtY0x1igVX5x
 pC8Fp9c02JLEXe+iOXq1+GXfHxQhsf2C154hF4F6k6MFtrl4MfV+0FOh1XHAyKStw4zW
 o/iYoTZPmvTwG5CIpgVfOWtvcuHqq1HiNOZJJAA3LarQJNV97nrCG8eO6CGDk1XVb2Ct
 TO+3F1sn2GiQ0vmn6+0wUfpxxe2yRI+YoNqEr29oq+vdNi3vnvU782qozGqAwyJRCVwO
 AUg7gUpa9Sw580msM7B887pRh0chvWTR0DPQtmgcbkEeNGOjuQjSRoLzn7sVT368MYtO
 7VoQ==
X-Gm-Message-State: AOAM533e43TO4ZLas0c/ADuQbD5zeLOM/VfczFOEkxP0f3z2cRbOBrts
 B1+a+64gGHqYsFoWHGNU/ERBwqdXv+a85viEkEVl1uvnD857H/piInTNA9Jtq/8EB96QeYUNVqN
 GcRwv484w9vpVYe4=
X-Received: by 2002:a5d:5049:: with SMTP id h9mr26327607wrt.502.1643824363433; 
 Wed, 02 Feb 2022 09:52:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmRrgQmMQAUb3fleGNov8Av5rBX+lN6JH4Z2fGdoUOfrNSg9adZyRx6Sge7jffd6ApkZ0ltQ==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr26327584wrt.502.1643824363009; 
 Wed, 02 Feb 2022 09:52:43 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1e09:d600:637e:7f1b:a4a0:fc92])
 by smtp.gmail.com with ESMTPSA id p11sm11920906wro.77.2022.02.02.09.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 09:52:42 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	hreitz@redhat.com,
	pbonzini@redhat.com
Subject: [RFC] thread-pool: Add option to fix the pool size
Date: Wed,  2 Feb 2022 18:52:34 +0100
Message-Id: <20220202175234.656711-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 02 Feb 2022 16:28:51 -0500
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
Cc: Nicolas Saenz Julienne <nsaenzju@redhat.com>, mtosatti@redhat.com,
 stefanha@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The thread pool regulates itself: when idle, it kills threads until
empty, when in demand, it creates new threads until full. This behaviour
doesn't play well with latency sensitive workloads where the price of
creating a new thread is too high. For example, when paired with qemu's
'-mlock', or using safety features like SafeStack, creating a new thread
has been measured take multiple milliseconds.

In order to mitigate this let's introduce a new option to set a fixed
pool size. The threads will be created during the pool's initialization,
remain available during its lifetime regardless of demand, and destroyed
upon freeing it. A properly characterized workload will then be able to
configure the pool to avoid any latency spike.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>

---

The fix I propose here works for my specific use-case, but I'm pretty
sure it'll need to be a bit more versatile to accommodate other
use-cases.

Some questions:

- Is unanimously setting these parameters for any pool instance too
  limiting? It'd make sense to move the options into the AioContext the
  pool belongs to. IIUC, for the general block use-case, this would be
  'qemu_aio_context' as initialized in qemu_init_main_loop().

- Currently I'm setting two pool properties through a single qemu
  option. The pool's size and dynamic behaviour, or lack thereof. I
  think it'd be better to split them into separate options. I thought of
  different ways of expressing this (min/max-size where static happens
  when min-size=max-size, size and static/dynamic, etc..), but you might
  have ideas on what could be useful to other use-cases.

Some background on my workload: I'm using IDE emulation, the guest is an
old RTOS that doesn't support virtio, using 'aio=native' isn't possible
either (unaligned IO accesses).

Thanks!

 include/block/thread-pool.h |  2 ++
 qemu-options.hx             | 21 +++++++++++++++++++++
 softmmu/vl.c                | 28 ++++++++++++++++++++++++++++
 util/thread-pool.c          | 20 +++++++++++++++++---
 4 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/include/block/thread-pool.h b/include/block/thread-pool.h
index 7dd7d730a0..3337971669 100644
--- a/include/block/thread-pool.h
+++ b/include/block/thread-pool.h
@@ -23,6 +23,8 @@
 typedef int ThreadPoolFunc(void *opaque);
 
 typedef struct ThreadPool ThreadPool;
+extern int thread_pool_max_threads;
+extern bool thread_pool_fixed_size;
 
 ThreadPool *thread_pool_new(struct AioContext *ctx);
 void thread_pool_free(ThreadPool *pool);
diff --git a/qemu-options.hx b/qemu-options.hx
index ba3ae6a42a..cb8f50db66 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4627,6 +4627,27 @@ SRST
     user-provided config files on sysconfdir.
 ERST
 
+DEF("thread-pool", HAS_ARG, QEMU_OPTION_threadpool,
+    "-thread-pool fixed-size=[n]\n"
+    "               Sets the number of threads always available in the pool.\n",
+    QEMU_ARCH_ALL)
+SRST
+``-thread-pool fixed-size=[n]``
+    The ``fixed-size=value`` option sets the number of readily available
+    threads in the pool. When set, the pool will create the threads during
+    initialization and will abstain from growing or shrinking during runtime.
+    This moves the burden of properly sizing the pool to the user in exchange
+    for a more deterministic thread pool behaviour. The number of threads has
+    to be greater than 0.
+
+    When not used, the thread pool size will change dynamically based on
+    demand: converging to being empty when idle and maxing out at 64 threads.
+
+    This option targets real-time systems sensitive to the latency introduced
+    by creating new threads during runtime. Performance sensitive use-cases are
+    better-off not using this.
+ERST
+
 DEF("trace", HAS_ARG, QEMU_OPTION_trace,
     "-trace [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
     "                specify tracing options\n",
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e1b35ba48..6a44cc1818 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -72,6 +72,7 @@
 #include "qemu/log.h"
 #include "sysemu/blockdev.h"
 #include "hw/block/block.h"
+#include "block/thread-pool.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
 #include "migration/misc.h"
@@ -496,6 +497,19 @@ static QemuOptsList qemu_action_opts = {
     },
 };
 
+static QemuOptsList qemu_thread_pool_opts = {
+    .name = "thread-pool",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_thread_pool_opts.head),
+    .desc = {
+        {
+            .name = "fixed-size",
+            .type = QEMU_OPT_NUMBER,
+            .help = "Sets the number of threads available in the pool",
+        },
+        { /* end of list */ }
+    },
+};
+
 const char *qemu_get_vm_name(void)
 {
     return qemu_name;
@@ -2809,6 +2823,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_semihosting_config_opts);
     qemu_add_opts(&qemu_fw_cfg_opts);
     qemu_add_opts(&qemu_action_opts);
+    qemu_add_opts(&qemu_thread_pool_opts);
     module_call_init(MODULE_INIT_OPTS);
 
     error_init(argv[0]);
@@ -3658,6 +3673,19 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_nouserconfig:
                 /* Nothing to be parsed here. Especially, do not error out below. */
                 break;
+            case QEMU_OPTION_threadpool:
+                opts = qemu_opts_parse_noisily(qemu_find_opts("thread-pool"),
+                                               optarg, false);
+                if (!opts) {
+                    exit(1);
+                }
+                thread_pool_max_threads = qemu_opt_get_number(opts, "fixed-size", 0);
+                if (thread_pool_max_threads <= 0) {
+                    error_report("fixed-size is invalid");
+                    exit(1);
+                }
+                thread_pool_fixed_size = true;
+                break;
             default:
                 if (os_parse_cmd_args(popt->index, optarg)) {
                     error_report("Option not supported in this build");
diff --git a/util/thread-pool.c b/util/thread-pool.c
index d763cea505..3081f502ff 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -25,6 +25,8 @@
 static void do_spawn_thread(ThreadPool *pool);
 
 typedef struct ThreadPoolElement ThreadPoolElement;
+int thread_pool_max_threads = 64;
+bool thread_pool_fixed_size;
 
 enum ThreadState {
     THREAD_QUEUED,
@@ -59,6 +61,7 @@ struct ThreadPool {
     QemuCond worker_stopped;
     QemuSemaphore sem;
     int max_threads;
+    bool fixed_size;
     QEMUBH *new_thread_bh;
 
     /* The following variables are only accessed from one AioContext. */
@@ -83,12 +86,16 @@ static void *worker_thread(void *opaque)
 
     while (!pool->stopping) {
         ThreadPoolElement *req;
-        int ret;
+        int ret = 0;
 
         do {
             pool->idle_threads++;
             qemu_mutex_unlock(&pool->lock);
-            ret = qemu_sem_timedwait(&pool->sem, 10000);
+            if (pool->fixed_size) {
+                qemu_sem_wait(&pool->sem);
+            } else {
+                ret = qemu_sem_timedwait(&pool->sem, 10000);
+            }
             qemu_mutex_lock(&pool->lock);
             pool->idle_threads--;
         } while (ret == -1 && !QTAILQ_EMPTY(&pool->request_list));
@@ -306,11 +313,18 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
     qemu_sem_init(&pool->sem, 0);
-    pool->max_threads = 64;
+    pool->max_threads = thread_pool_max_threads;
+    pool->fixed_size = thread_pool_fixed_size;
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
     QLIST_INIT(&pool->head);
     QTAILQ_INIT(&pool->request_list);
+
+    for (int i = 0; pool->fixed_size && i < pool->max_threads; i++) {
+        qemu_mutex_lock(&pool->lock);
+        spawn_thread(pool);
+        qemu_mutex_unlock(&pool->lock);
+    }
 }
 
 ThreadPool *thread_pool_new(AioContext *ctx)
-- 
2.34.1


