Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925E426BFA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:52:17 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYqIK-0001Nc-0b
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq4b-00048D-6L
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:38:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq4Y-0005jf-7p
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vY4a62ePc63cIuS7orJe5ZWW2RAAJqboKAPLP4+Fe1w=;
 b=VODfza8G/yHxu64F6rCYYiaaLoiBbsdHdhr1e98vrwA/69MpspzAZO8jAdj/sX6dpT80Rw
 g5DH9ESF1YhROlE1rqcdqVZCtLgEK0UvLpLmPVtBjItdhiMx1P+GmMITc8ivdDJuooPp7w
 Uf3mWnl1yTF8uePEXvIVYRqc1I47/u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-byeo_HV_PLK4pUdxSldCvA-1; Fri, 08 Oct 2021 09:38:00 -0400
X-MC-Unique: byeo_HV_PLK4pUdxSldCvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E7692935;
 Fri,  8 Oct 2021 13:37:01 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37CBF2708F;
 Fri,  8 Oct 2021 13:36:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] virtio-net: Store failover primary opts pointer
 locally
Date: Fri,  8 Oct 2021 15:34:39 +0200
Message-Id: <20211008133442.141332-13-kwolf@redhat.com>
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of accessing the global QemuOptsList, which really belong to the
command line parser and shouldn't be accessed from devices, store a
pointer to the QemuOpts in a new VirtIONet field.

This is not the final state, but just an intermediate step to get rid of
QemuOpts in devices. It will later be replaced with an options QDict.

Before this patch, two "primary" devices could be hidden for the same
standby device, but only one of them would actually be enabled and the
other one would be kept hidden forever, so this doesn't make sense.
After this patch, configuring a second primary device is an error.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 +
 hw/net/virtio-net.c            | 26 ++++++++++++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 824a69c23f..d118c95f69 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -209,6 +209,7 @@ struct VirtIONet {
     bool failover_primary_hidden;
     bool failover;
     DeviceListener primary_listener;
+    QemuOpts *primary_opts;
     Notifier migration_state;
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index a17d5739fc..ed9a9012e9 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -858,27 +858,24 @@ static DeviceState *failover_find_primary_device(VirtIONet *n)
 static void failover_add_primary(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
-    QemuOpts *opts;
-    char *id;
     DeviceState *dev = failover_find_primary_device(n);
 
     if (dev) {
         return;
     }
 
-    id = failover_find_primary_device_id(n);
-    if (!id) {
+    if (!n->primary_opts) {
         error_setg(errp, "Primary device not found");
         error_append_hint(errp, "Virtio-net failover will not work. Make "
                           "sure primary device has parameter"
                           " failover_pair_id=%s\n", n->netclient_name);
         return;
     }
-    opts = qemu_opts_find(qemu_find_opts("device"), id);
-    g_assert(opts); /* cannot be NULL because id was found using opts list */
-    dev = qdev_device_add(opts, &err);
+
+    dev = qdev_device_add(n->primary_opts, &err);
     if (err) {
-        qemu_opts_del(opts);
+        qemu_opts_del(n->primary_opts);
+        n->primary_opts = NULL;
     } else {
         object_unref(OBJECT(dev));
     }
@@ -3317,6 +3314,19 @@ static bool failover_hide_primary_device(DeviceListener *listener,
         return false;
     }
 
+    if (n->primary_opts) {
+        error_setg(errp, "Cannot attach more than one primary device to '%s'",
+                   n->netclient_name);
+        return false;
+    }
+
+    /*
+     * Having a weak reference here should be okay because a device can't be
+     * deleted while it's hidden. This will be replaced soon with a QDict that
+     * has a clearer ownership model.
+     */
+    n->primary_opts = device_opts;
+
     /* failover_primary_hidden is set during feature negotiation */
     return qatomic_read(&n->failover_primary_hidden);
 }
-- 
2.31.1


