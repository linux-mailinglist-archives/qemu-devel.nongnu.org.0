Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB542F667
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:57:20 +0200 (CEST)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOe7-0005d1-Jl
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOW3-0000Ps-Qy
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:49:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOW0-0001uO-Uk
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cf3g4DavlMCv8IuMpwdtON8zkZEilGWM8yTJqPKhOTU=;
 b=OCuGt3Wn5cdwxLELxa2zDFqODyOEmR0q04kgZdoX0VJkpz7bZvZgRqxGDlT1+xk//X8IFR
 4ihUMTGwVCxEoxNMMcpcA5S81l7sr+sh9PbtfGFcVwCC0BM2/YuJ9lSZcmBe552PtgWIQQ
 IisnOZuV86EPBOC5bJdwTPpVTsiTEhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-MF19g5KKPZqhbtgJtrk9Dg-1; Fri, 15 Oct 2021 10:48:54 -0400
X-MC-Unique: MF19g5KKPZqhbtgJtrk9Dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9DBDF8A0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:54 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3590F1973B;
 Fri, 15 Oct 2021 14:48:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] virtio-net: Store failover primary opts pointer locally
Date: Fri, 15 Oct 2021 16:46:37 +0200
Message-Id: <20211015144640.198044-13-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Message-Id: <20211008133442.141332-13-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
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


