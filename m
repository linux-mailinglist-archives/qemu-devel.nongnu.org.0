Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE43BE96A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:09:04 +0200 (CEST)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18EZ-0001uJ-P4
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m18Cx-0000Dd-US
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m18Cv-0000Fx-WC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625666841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tx8QqxrbBUhqMjhtl/HmEzuJlcz5ViTm1Q1Mnp4miBc=;
 b=JMHlkGOkz21INB5O3bRqwRLu5gEcnNtc2Uzrg3V5ep4o2XPj+0JlRgH4w8jvSIW2hW98C/
 GYh4HET3zymA+WxC5562r224irDwEw8esG+0SI80KrHXxvy0P/mbip4uTdGJZvdTHjJGlL
 oW5D2QpiSZEG9gd0uQkvKCL4cedIgVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-9RpO9ZLLPn-Yh3zxJpQqLA-1; Wed, 07 Jul 2021 10:07:18 -0400
X-MC-Unique: 9RpO9ZLLPn-Yh3zxJpQqLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3508E1023F41;
 Wed,  7 Jul 2021 14:07:17 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-110.ams2.redhat.com [10.36.114.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4C95D9FC;
 Wed,  7 Jul 2021 14:07:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Date: Wed,  7 Jul 2021 16:06:55 +0200
Message-Id: <20210707140655.30982-3-david@redhat.com>
In-Reply-To: <20210707140655.30982-1-david@redhat.com>
References: <20210707140655.30982-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Wei Wang <wei.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Postcopy never worked properly with 'free-page-hint=on', as there are
at least two issues:

1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
   and consequently won't release free pages back to the OS once
   migration finishes.

   The issue is that for postcopy, we won't do a final bitmap sync while
   the guest is stopped on the source and
   virtio_balloon_free_page_hint_notify() will only call
   virtio_balloon_free_page_done() on the source during
   PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
   the destination.

2) Once the VM touches a page on the destination that has been excluded
   from migration on the source via qemu_guest_free_page_hint() while
   postcopy is active, that thread will stall until postcopy finishes
   and all threads are woken up. (with older Linux kernels that won't
   retry faults when woken up via userfaultfd, we might actually get a
   SEGFAULT)

   The issue is that the source will refuse to migrate any pages that
   are not marked as dirty in the dirty bmap -- for example, because the
   page might just have been sent. Consequently, the faulting thread will
   stall, waiting for the page to be migrated -- which could take quite
   a while and result in guest OS issues.

While we could fix 1), for example, by calling
virtio_balloon_free_page_done() via pre_save callbacks of the
vmstate, 2) is mostly impossible to fix without additional tracking,
such that we can actually identify these hinted pages and handle
them accordingly.

As it never worked properly, let's disable it via the postcopy notifier on
the destination. Trying to set "migrate_set_capability postcopy-ram on"
on the destination now results in "virtio-balloon: 'free-page-hint' does
not support postcopy Error: Postcopy is not supported".

Note 1: We could let qemu_guest_free_page_hint() mark postcopy
        as broken once actually clearing bits on the source. However, it's
        harder to realize as we can race with users starting postcopy
        and we cannot produce an expressive error message easily.

Note 2: virtio-mem has similar issues, however, access to "unplugged"
        memory by the guest is very rare and we would have to be very
        lucky for it to happen during migration. The spec states
        "The driver SHOULD NOT read from unplugged memory blocks ..."
        and "The driver MUST NOT write to unplugged memory blocks".
        virtio-mem will move away from virtio_balloon_free_page_done()
        soon and handle this case explicitly on the destination.

Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Cc: qemu-stable@nongnu.org
Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c         | 26 ++++++++++++++++++++++++++
 include/hw/virtio/virtio-balloon.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 4b5d9e5e50..d0c9dc677c 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -30,6 +30,7 @@
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
+#include "migration/postcopy-ram.h"
 
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
@@ -692,6 +693,28 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
     return 0;
 }
 
+
+static int virtio_balloon_postcopy_notify(NotifierWithReturn *n, void *opaque)
+{
+    VirtIOBalloon *dev = container_of(n, VirtIOBalloon, postcopy_notifier);
+    PostcopyNotifyData *pnd = opaque;
+
+    /* We register the notifier only with 'free-page-hint=on' for now. */
+    g_assert(virtio_has_feature(dev->host_features,
+                                VIRTIO_BALLOON_F_FREE_PAGE_HINT));
+
+    /*
+     * Pages hinted via qemu_guest_free_page_hint() are cleared from the dirty
+     * bitmap and will not get migrated, especially also not when the postcopy
+     * destination starts using them and requests migration from the source; the
+     * faulting thread will stall until postcopy migration finishes and
+     * all threads are woken up.
+     */
+    error_setg(pnd->errp,
+               "virtio-balloon: 'free-page-hint' does not support postcopy");
+    return -ENOENT;
+}
+
 static size_t virtio_balloon_config_size(VirtIOBalloon *s)
 {
     uint64_t features = s->host_features;
@@ -911,6 +934,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
         s->free_page_vq = virtio_add_queue(vdev, VIRTQUEUE_MAX_SIZE,
                                            virtio_balloon_handle_free_page_vq);
         precopy_add_notifier(&s->free_page_hint_notify);
+        postcopy_add_notifier(&s->postcopy_notifier);
 
         object_ref(OBJECT(s->iothread));
         s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
@@ -935,6 +959,7 @@ static void virtio_balloon_device_unrealize(DeviceState *dev)
         object_unref(OBJECT(s->iothread));
         virtio_balloon_free_page_stop(s);
         precopy_remove_notifier(&s->free_page_hint_notify);
+        postcopy_remove_notifier(&s->postcopy_notifier);
     }
     balloon_stats_destroy_timer(s);
     qemu_remove_balloon_handler(s);
@@ -1008,6 +1033,7 @@ static void virtio_balloon_instance_init(Object *obj)
     qemu_cond_init(&s->free_page_cond);
     s->free_page_hint_cmd_id = VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN;
     s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
+    s->postcopy_notifier.notify = virtio_balloon_postcopy_notify;
 
     object_property_add(obj, "guest-stats", "guest statistics",
                         balloon_stats_get_all, NULL, NULL, s);
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
index 5139cf8ab6..d0d5b793b9 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -65,6 +65,7 @@ struct VirtIOBalloon {
      */
     bool block_iothread;
     NotifierWithReturn free_page_hint_notify;
+    NotifierWithReturn postcopy_notifier;
     int64_t stats_last_update;
     int64_t stats_poll_interval;
     uint32_t host_features;
-- 
2.31.1


