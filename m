Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD164719E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:24:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3HoO-0003jr-Ir; Thu, 08 Dec 2022 09:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hny-0003cu-Pg
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hnw-0000fL-ON
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670509395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJ0zivdehtiQHg/ydxt4oRt66UPbthkD1hdhBDqfinI=;
 b=ZMhtUhIEWHpYv5ufau2YuSlAbqu+4EtsRLiTqpzuNdbgH28iOOFG6nTx1UI5JlbZV1uAOH
 c9yPxi8hy1pZYQXL3pP4LGCfkkcV+R/k8PkvwU3+MsrKUCW7oiVdMLDjmv9CxtR0/sP+PT
 ImEjIIcANwp2UWev55ict5VUU8nV7KY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-iVK0dh3MOw-uhX-Jw2dhlw-1; Thu, 08 Dec 2022 09:23:14 -0500
X-MC-Unique: iVK0dh3MOw-uhX-Jw2dhlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8D89805AC5
 for <qemu-devel@nongnu.org>; Thu,  8 Dec 2022 14:23:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54D77492B04;
 Thu,  8 Dec 2022 14:23:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A0C821E66CB; Thu,  8 Dec 2022 15:23:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 4/4] coroutine: Break inclusion loop
Date: Thu,  8 Dec 2022 15:23:06 +0100
Message-Id: <20221208142306.2642640-5-armbru@redhat.com>
In-Reply-To: <20221208142306.2642640-1-armbru@redhat.com>
References: <20221208142306.2642640-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

qemu/coroutine.h and qemu/lockable.h include each other.  Neither
header actually needs the other one.

Drop #include "qemu/coroutine.h" from qemu/lockable.h to break the
loop.  All users of lockable.h actually need qemu/coroutine.h, so
adjust their #include directives.

I'm not dropping the #include "qemu/lockable" from qemu/coroutine.h,
because that would require adding it back next to #include
"qemu/coroutine.h" all over the place.  It's in an unusual place,
though.  Move it to the usual place, next to the other #include
directives.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qemu/coroutine.h    | 3 +--
 include/qemu/lockable.h     | 1 -
 include/qemu/ratelimit.h    | 2 +-
 include/qemu/seqlock.h      | 2 +-
 linux-user/fd-trans.h       | 2 +-
 backends/tpm/tpm_emulator.c | 2 +-
 cpus-common.c               | 2 +-
 hw/hyperv/hyperv.c          | 2 +-
 hw/usb/ccid-card-emulated.c | 2 +-
 hw/vfio/platform.c          | 2 +-
 plugins/core.c              | 2 +-
 plugins/loader.c            | 2 +-
 ui/spice-display.c          | 2 +-
 util/log.c                  | 2 +-
 util/qemu-timer.c           | 2 +-
 util/rcu.c                  | 2 +-
 util/vfio-helpers.c         | 2 +-
 util/yank.c                 | 2 +-
 18 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 2496a4f4ef..2504d4757f 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -15,6 +15,7 @@
 #ifndef QEMU_COROUTINE_H
 #define QEMU_COROUTINE_H
 
+#include "qemu/lockable.h"
 #include "qemu/queue.h"
 #include "qemu/timer.h"
 
@@ -376,8 +377,6 @@ void qemu_coroutine_inc_pool_size(unsigned int additional_pool_size);
  */
 void qemu_coroutine_dec_pool_size(unsigned int additional_pool_size);
 
-#include "qemu/lockable.h"
-
 /**
  * Sends a (part of) iovec down a socket, yielding when the socket is full, or
  * Receives data into a (part of) iovec from a socket,
diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index 86db7cb04c..7d6cdeb750 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -13,7 +13,6 @@
 #ifndef QEMU_LOCKABLE_H
 #define QEMU_LOCKABLE_H
 
-#include "qemu/coroutine.h"
 #include "qemu/thread.h"
 
 typedef void QemuLockUnlockFunc(void *);
diff --git a/include/qemu/ratelimit.h b/include/qemu/ratelimit.h
index 48bf59e857..4e07e1e2a4 100644
--- a/include/qemu/ratelimit.h
+++ b/include/qemu/ratelimit.h
@@ -14,7 +14,7 @@
 #ifndef QEMU_RATELIMIT_H
 #define QEMU_RATELIMIT_H
 
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/timer.h"
 
 typedef struct {
diff --git a/include/qemu/seqlock.h b/include/qemu/seqlock.h
index ecb7d2c864..79a0af625b 100644
--- a/include/qemu/seqlock.h
+++ b/include/qemu/seqlock.h
@@ -16,7 +16,7 @@
 
 #include "qemu/atomic.h"
 #include "qemu/thread.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 
 typedef struct QemuSeqLock QemuSeqLock;
 
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
index 1b9fa2041c..e662d644bc 100644
--- a/linux-user/fd-trans.h
+++ b/linux-user/fd-trans.h
@@ -16,7 +16,7 @@
 #ifndef FD_TRANS_H
 #define FD_TRANS_H
 
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 
 typedef abi_long (*TargetFdDataFunc)(void *, size_t);
 typedef abi_long (*TargetFdAddrFunc)(void *, abi_ulong, socklen_t);
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 49cc3d749d..f364b089ad 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -30,7 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "io/channel-socket.h"
 #include "sysemu/runstate.h"
 #include "sysemu/tpm_backend.h"
diff --git a/cpus-common.c b/cpus-common.c
index 793364dc0e..1b1f8f75c9 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -22,7 +22,7 @@
 #include "exec/cpu-common.h"
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index 57b402b956..41f3e9f1ca 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -15,7 +15,7 @@
 #include "sysemu/kvm.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/queue.h"
 #include "qemu/rcu.h"
 #include "qemu/rcu_queue.h"
diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
index ee41a81801..6962143c29 100644
--- a/hw/usb/ccid-card-emulated.c
+++ b/hw/usb/ccid-card-emulated.c
@@ -30,7 +30,7 @@
 #include <libcacard.h>
 
 #include "qemu/thread.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "ccid.h"
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index 5af73f9287..e252edc04a 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -22,7 +22,7 @@
 #include "hw/vfio/vfio-platform.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/range.h"
diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..313a631ecf 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -15,7 +15,7 @@
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
 #include "qapi/error.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/option.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/xxhash.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d..0e0a19730e 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -19,7 +19,7 @@
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
 #include "qapi/error.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/option.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/qht.h"
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 494168e7fe..8e2245309e 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -18,7 +18,7 @@
 #include "qemu/osdep.h"
 #include "ui/qemu-spice.h"
 #include "qemu/timer.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
 #include "qemu/queue.h"
diff --git a/util/log.c b/util/log.c
index c2198badf2..157c25f0b5 100644
--- a/util/log.c
+++ b/util/log.c
@@ -25,7 +25,7 @@
 #include "qemu/cutils.h"
 #include "trace/control.h"
 #include "qemu/thread.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qemu/rcu.h"
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 6a0de33dd2..6d5d21cb92 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
 #include "sysemu/cpus.h"
diff --git a/util/rcu.c b/util/rcu.c
index b6d6c71cff..013700bb5c 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -31,7 +31,7 @@
 #include "qemu/atomic.h"
 #include "qemu/thread.h"
 #include "qemu/main-loop.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #if defined(CONFIG_MALLOC_TRIM)
 #include <malloc.h>
 #endif
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 0d1520caac..8584db8416 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -22,7 +22,7 @@
 #include "standard-headers/linux/pci_regs.h"
 #include "qemu/event_notifier.h"
 #include "qemu/vfio-helpers.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "trace.h"
 
 #define QEMU_VFIO_DEBUG 0
diff --git a/util/yank.c b/util/yank.c
index abf47c346d..1fd3e550c1 100644
--- a/util/yank.c
+++ b/util/yank.c
@@ -11,7 +11,7 @@
 #include "qapi/error.h"
 #include "qemu/thread.h"
 #include "qemu/queue.h"
-#include "qemu/lockable.h"
+#include "qemu/coroutine.h"
 #include "qapi/qapi-commands-yank.h"
 #include "qapi/qapi-visit-yank.h"
 #include "qapi/clone-visitor.h"
-- 
2.37.3


