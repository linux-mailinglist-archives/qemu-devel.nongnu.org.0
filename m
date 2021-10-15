Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78A42F681
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 17:03:24 +0200 (CEST)
Received: from localhost ([::1]:49662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOjz-0006qG-B4
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 11:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOW6-0000Qr-CU
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:49:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOW3-0001ur-I1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8NgaoS/6FUlz1Bfu3oED2X8dHK5VGWFshCwedcXjso=;
 b=Mkxp07Vn4IRff2XTYxkpVkY2ilvqS0mUTSWsuq/u+BBpwDdU5Z8uMXBzTSwtqfapCTgr9G
 wp93dj1VmP3rnnj4WcqHV2olMJdrK4fL7XWh9ohNSAnG1Bl1Te4PJEqh5jXl4mvINWY8UV
 iWiDtMU4jt6+xQBJKEM7sNs4sH9Rq5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Ue26zDhoMR-6YzrX11g2Iw-1; Fri, 15 Oct 2021 10:48:55 -0400
X-MC-Unique: Ue26zDhoMR-6YzrX11g2Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9AD1927800
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:55 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 739F91948C;
 Fri, 15 Oct 2021 14:48:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] virtio-net: Avoid QemuOpts in
 failover_find_primary_device()
Date: Fri, 15 Oct 2021 16:46:38 +0200
Message-Id: <20211015144640.198044-14-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't go through the global QemuOptsList, it is state of the legacy
command line parser and we will create devices that are not contained
in it. It is also just the command line configuration and not
necessarily the current runtime state.

Instead, look at the qdev device tree which has the current state of all
existing devices.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211008133442.141332-14-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/net/virtio-net.c | 52 +++++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ed9a9012e9..f503f28c00 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -796,48 +796,34 @@ static inline uint64_t virtio_net_supported_guest_offloads(VirtIONet *n)
 
 typedef struct {
     VirtIONet *n;
-    char *id;
-} FailoverId;
+    DeviceState *dev;
+} FailoverDevice;
 
 /**
- * Set the id of the failover primary device
+ * Set the failover primary device
  *
  * @opaque: FailoverId to setup
  * @opts: opts for device we are handling
  * @errp: returns an error if this function fails
  */
-static int failover_set_primary(void *opaque, QemuOpts *opts, Error **errp)
+static int failover_set_primary(DeviceState *dev, void *opaque)
 {
-    FailoverId *fid = opaque;
-    const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
+    FailoverDevice *fdev = opaque;
+    PCIDevice *pci_dev = (PCIDevice *)
+        object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE);
 
-    if (g_strcmp0(standby_id, fid->n->netclient_name) == 0) {
-        fid->id = g_strdup(opts->id);
+    if (!pci_dev) {
+        return 0;
+    }
+
+    if (!g_strcmp0(pci_dev->failover_pair_id, fdev->n->netclient_name)) {
+        fdev->dev = dev;
         return 1;
     }
 
     return 0;
 }
 
-/**
- * Find the primary device id for this failover virtio-net
- *
- * @n: VirtIONet device
- * @errp: returns an error if this function fails
- */
-static char *failover_find_primary_device_id(VirtIONet *n)
-{
-    Error *err = NULL;
-    FailoverId fid;
-
-    fid.n = n;
-    if (!qemu_opts_foreach(qemu_find_opts("device"),
-                           failover_set_primary, &fid, &err)) {
-        return NULL;
-    }
-    return fid.id;
-}
-
 /**
  * Find the primary device for this failover virtio-net
  *
@@ -846,13 +832,13 @@ static char *failover_find_primary_device_id(VirtIONet *n)
  */
 static DeviceState *failover_find_primary_device(VirtIONet *n)
 {
-    char *id = failover_find_primary_device_id(n);
-
-    if (!id) {
-        return NULL;
-    }
+    FailoverDevice fdev = {
+        .n = n,
+    };
 
-    return qdev_find_recursive(sysbus_get_default(), id);
+    qbus_walk_children(sysbus_get_default(), failover_set_primary, NULL,
+                       NULL, NULL, &fdev);
+    return fdev.dev;
 }
 
 static void failover_add_primary(VirtIONet *n, Error **errp)
-- 
2.31.1


