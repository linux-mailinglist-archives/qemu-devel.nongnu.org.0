Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93F3BF7D6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:56:00 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QlD-0002ci-4Q
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1QjL-0000Kz-Qs
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:54:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1QjI-0005I3-PV
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625738039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5c4BkJkeAWRDuOL6pIC49RBdHBvgH77WwaWtOu9mmU0=;
 b=Nrh00/+WjwaYhCi8Vmfx3mJztwYPy3JArBo2Pn/Dy+Eihvmvlynk3zOVQU3FKdaLbmpt1L
 bTtMislvBfJLatjHVOMP6Scrx2x0jVR6i7Vtf4BYHZrMgE+y6btYi0K7O2ssOffxKV2wyc
 q1Qk1pFGJBNodtMaTAid7yYLw/XSg2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-iZbQ6tUAOBWDI7NIPQvETA-1; Thu, 08 Jul 2021 05:53:58 -0400
X-MC-Unique: iZbQ6tUAOBWDI7NIPQvETA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3853F36319;
 Thu,  8 Jul 2021 09:53:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-130.ams2.redhat.com [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E83055D9DD;
 Thu,  8 Jul 2021 09:53:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] virtio-balloon: don't start free page hinting if
 postcopy is possible
Date: Thu,  8 Jul 2021 11:53:38 +0200
Message-Id: <20210708095339.20274-2-david@redhat.com>
In-Reply-To: <20210708095339.20274-1-david@redhat.com>
References: <20210708095339.20274-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

While we could fix 1) comparatively easily, 2) is harder to get right and
might require more involved RAM migration changes on source and destination
[1].

As it never worked properly, let's not start free page hinting in the
precopy notifier if the postcopy migration capability was enabled to fix
it easily. Capabilities cannot be enabled once migration is already
running.

Note 1: in the future we might either adjust migration code on the source
        to track pages that have actually been sent or adjust
        migration code on source and destination  to eventually send
        pages multiple times from the source and and deal with pages
        that are sent multiple times on the destination.

Note 2: virtio-mem has similar issues, however, access to "unplugged"
        memory by the guest is very rare and we would have to be very
        lucky for it to happen during migration. The spec states
        "The driver SHOULD NOT read from unplugged memory blocks ..."
        and "The driver MUST NOT write to unplugged memory blocks".
        virtio-mem will move away from virtio_balloon_free_page_done()
        soon and handle this case explicitly on the destination.

[1] https://lkml.kernel.org/r/e79fd18c-aa62-c1d8-c7f3-ba3fc2c25fc8@redhat.com

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
 hw/virtio/virtio-balloon.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 4b5d9e5e50..ae7867a8db 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -30,6 +30,7 @@
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "migration/misc.h"
+#include "migration/migration.h"
 
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
@@ -662,6 +663,18 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
         return 0;
     }
 
+    /*
+     * Pages hinted via qemu_guest_free_page_hint() are cleared from the dirty
+     * bitmap and will not get migrated, especially also not when the postcopy
+     * destination starts using them and requests migration from the source; the
+     * faulting thread will stall until postcopy migration finishes and
+     * all threads are woken up. Let's not start free page hinting if postcopy
+     * is possible.
+     */
+    if (migrate_postcopy_ram()) {
+        return 0;
+    }
+
     switch (pnd->reason) {
     case PRECOPY_NOTIFY_BEFORE_BITMAP_SYNC:
         virtio_balloon_free_page_stop(dev);
-- 
2.31.1


