Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A603F2E0C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:26:20 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5TQ-00064h-2F
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5O4-0005Cu-Lc
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:20:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5O3-0004m8-5t
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629469246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PgsFhKrV4P3UC0y8hyk6i1r5oG9AJ4gSCcr1bV9pCf8=;
 b=GHrsLhNBYn29a8gvmfJIusLDb9w2fzPc+U83Yikj3y3ylzyHrCPSeRSHShlqCidDpdesHJ
 cPqsvVN9Zw8FIpeVLn6v8rN8ZLz8mftkpnzErDq66VgWypGmxR7a3sYtxT0SqZ5wxKLo1X
 d+rSm1Z1sYwpjowBdkidQGjNBXQDBrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-XTWE8e02PQ2C7Otbqgt72Q-1; Fri, 20 Aug 2021 10:20:45 -0400
X-MC-Unique: XTWE8e02PQ2C7Otbqgt72Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 245FD100F765;
 Fri, 20 Aug 2021 14:20:44 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5DBF6F97F;
 Fri, 20 Aug 2021 14:20:41 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/8] failover: hide the PCI device if the virtio-net
 device is not present
Date: Fri, 20 Aug 2021 16:19:59 +0200
Message-Id: <20210820142002.152994-6-lvivier@redhat.com>
In-Reply-To: <20210820142002.152994-1-lvivier@redhat.com>
References: <20210820142002.152994-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can plug either the virtio-net device first or the PCI device
first.

If we plug the PCI device first, QEMU checks the failover_pair_id
but doesn't hide the device if the virtio-net device is not present.

This is a problem because if the virtio-net device is not plugged
and the machine is migrated the VFIO device doesn't prevent anymore
the migration and the machine is migrated with the VFIO device.

And of course, on destination the guest reboots because VFIO device
cannot be migrated.

We can fix the problem by hiding the PCI device with a failover_pair_id
device that is not present. In this case, if the machine is migrated the
VFIO device is not migrated, and if the virtio-net device is plugged, the
PCI device is plugged and can be migrated using the failover mechanism.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/pci/pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index f849945e2819..dd5e95216abf 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2244,10 +2244,11 @@ static bool pci_dev_hide_device(DeviceListener *listener,
         d =  qdev_find_recursive(sysbus_get_default(), opt);
         if (d == NULL) {
             /*
-             * if the the virtio-net device is not plugged it can be
-             * plugged later, and this device will be added to the failover
+             * PCI device has a pair id, but the virtio-net device is not
+             * plugged: hide it, it will be plugged later when the virtio-net
+             * device will be plugged
              */
-            return false;
+            return true;
         }
 
         if (runstate_check(RUN_STATE_PRELAUNCH)) {
-- 
2.31.1


