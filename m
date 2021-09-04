Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A8B400D2C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:46:28 +0200 (CEST)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdUZ-0003oI-Ta
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdL2-00051H-9c
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdL0-000132-EU
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkIr8cglWhMVi64rmTTfudlfUFh3v3LmM0D5ITWVaqM=;
 b=dVd6EfN5QtBt3BlnFUdr/A1eFFzyUuUpMNQrWiA6ZYN29mFFWSvHzKCyLikEseurPZ+P2H
 QltafH12vShDOxu8dzgo4X1XWCXGCc7pn5BbvpQfB1byqUCNnLZGZmdIzFosjZ7H+1aNS/
 EQmUgg5utrYk8n4PEqezX5hxQcu/+uc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-cNlMuN9UPU2y45g7ZHe14Q-1; Sat, 04 Sep 2021 17:36:32 -0400
X-MC-Unique: cNlMuN9UPU2y45g7ZHe14Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 bf22-20020a0564021a5600b003c86b59e291so1352430edb.18
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mkIr8cglWhMVi64rmTTfudlfUFh3v3LmM0D5ITWVaqM=;
 b=U88VXcAMNVQJmVibo6Fx116L3nmIRHIVaXz4AA8mAZRNr3ePKtC2trVqoP0mWdEddR
 z01bwrXHn1YnDM5+C/au/78dQvFcYd6vX/NyKpzh2U01awZmH8+ZizqHvkRKbVP3UaOx
 udzqVQp5e0bPq2xVukq61JHhJomAKv9CwO+5ca5hlT/vrZrSlJLvfjDf9xJXEofsV+bu
 Q2ZXkw0bwSmTYe50dPkSzxx7UEi0R7jVTOHHcFdpcJfUsu/va3QUf9ZZriPumNA1HsZQ
 tA6BGiedCVG48qK9Mo02OMb7NLT8hxYWN6qwrSrTpeodqiztT5aX7JnfkFENaomV9nQw
 ztLQ==
X-Gm-Message-State: AOAM530GeUIzL0iJ6ieHpySAk4hDmeE68iFPXkmpLJEy2btiTB4M1/8L
 QMPosnhdMukrR5lRCKDovMiTQqFgWmabIY7xojLVITrSScYowVc3SMdhDHBKWDbZ46vjkHb/2I4
 eUQEYWflB+ipS9GFYEeloM+U1g8S23t+pa6Tktxlzmq1IOi58bNHsFn3UDInb
X-Received: by 2002:a50:c31e:: with SMTP id a30mr5860099edb.123.1630791390996; 
 Sat, 04 Sep 2021 14:36:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTSQZe9xZxhSIG7YZx5Lb7OrwKQ/iFK+7Ffsap/lhKIflmjcm2yw8J/IZDpByPVlVloE2DJg==
X-Received: by 2002:a50:c31e:: with SMTP id a30mr5860078edb.123.1630791390743; 
 Sat, 04 Sep 2021 14:36:30 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id d19sm1521623ejj.122.2021.09.04.14.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:30 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/35] virtio-balloon: don't start free page hinting if
 postcopy is possible
Message-ID: <20210904213506.486886-12-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-stable@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210708095339.20274-2-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
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
MST


