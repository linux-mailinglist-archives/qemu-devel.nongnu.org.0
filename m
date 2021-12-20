Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9168547B148
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:39:08 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLgp-0005Jf-AC
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:39:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mzKIP-0006Uv-At
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mzKIE-0000sj-8L
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640012949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zhi9HmceCFKdI1APR6v0X2uyKebt54OwC3yWkemXPX8=;
 b=OWG656p4ay7r/ptYF4kEUkPGpgRQm0XpUPqDUbExFdYE6ZW253QguXE2hFxmf/l4lk9FG5
 HWPwLPmX6ypRweRrSc8FDqtqWahnL0Pt4Yt2CwhzWaPXArprrVJmsuwcAQd/irTi1MdvBU
 vaI7vLZmrtmoLJoTDQVKeAUxppOhU34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-uwzy2xPxMSKdfS5wG2yDIA-1; Mon, 20 Dec 2021 09:53:40 -0500
X-MC-Unique: uwzy2xPxMSKdfS5wG2yDIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747C9190D340
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 14:53:39 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 417D110589C3;
 Mon, 20 Dec 2021 14:53:15 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] failover: Silence warning messages during qtest
Date: Mon, 20 Dec 2021 15:53:14 +0100
Message-Id: <20211220145314.390697-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-net-failover test tries several device combinations that produces
some expected warnings.
These warning can be confusing, so we disable them during the qtest
sequence.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c   | 3 ++-
 migration/migration.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f2014d5ea0b3..c64a6b9d1745 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -44,6 +44,7 @@
 #include "hw/pci/pci.h"
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
+#include "sysemu/qtest.h"
 
 #define VIRTIO_NET_VM_VERSION    11
 
@@ -925,7 +926,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qapi_event_send_failover_negotiated(n->netclient_name);
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
-        if (err) {
+        if (err && !qtest_enabled()) {
             warn_report_err(err);
         }
     }
diff --git a/migration/migration.c b/migration/migration.c
index 3de11ae921e0..065216561063 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -60,6 +60,7 @@
 #include "qemu/yank.h"
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
+#include "sysemu/qtest.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -3766,7 +3767,8 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
             while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
                 qemu_sem_timedwait(&s->wait_unplug_sem, 250);
             }
-            if (qemu_savevm_state_guest_unplug_pending()) {
+            if (qemu_savevm_state_guest_unplug_pending() &&
+                !qtest_enabled()) {
                 warn_report("migration: partially unplugged device on "
                             "failure");
             }
-- 
2.33.1


