Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D0426BD7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:42:39 +0200 (CEST)
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYq90-00020y-GT
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq37-0001FV-1p
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq35-0000yz-Ay
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aOjODVqE3mI7ZA3cSCIXOVZGgsm9P5SR8aFH2fWUDkU=;
 b=UmBrB23foLGm+KfigrHKagnZx4nkaWNQxI3h3s51TGcJdYVf2jW/OUtL5wiZrzxaAbkUgO
 XY5aLBVJuF05Ne/5HZFTXCs9ii1oMPH8mP7cfHKIDYIWeJNh5/Xzr87maDFokTy/qwnaDI
 5cCmdXjIX9dj/PAFLPFJJAno7xlKzxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-fIvvtwZlPKqXsdh2_rV0jg-1; Fri, 08 Oct 2021 09:36:28 -0400
X-MC-Unique: fIvvtwZlPKqXsdh2_rV0jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D99B08D63C4;
 Fri,  8 Oct 2021 13:35:11 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1D0A19729;
 Fri,  8 Oct 2021 13:35:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] net/vhost-vdpa: Fix device compatibility check
Date: Fri,  8 Oct 2021 15:34:30 +0200
Message-Id: <20211008133442.141332-4-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

vhost-vdpa works only with specific devices. At startup, it second
guesses what the command line option handling will do and error out if
it thinks a non-virtio device will attach to them.

This second guessing is not only ugly, it can lead to wrong error
messages ('-device floppy,netdev=foo' should complain about an unknown
property, not about the wrong kind of network device being attached) and
completely ignores hotplugging.

Drop the old checks and implement .check_peer_type() instead to fix
this. As a nice side effect, it also removes one more dependency on the
legacy QemuOpts infrastructure and even reduces the code size.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 net/vhost-vdpa.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 912686457c..6dc68d8677 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -147,12 +147,26 @@ static bool vhost_vdpa_has_ufo(NetClientState *nc)
 
 }
 
+static bool vhost_vdpa_check_peer_type(NetClientState *nc, ObjectClass *oc,
+                                       Error **errp)
+{
+    const char *driver = object_class_get_name(oc);
+
+    if (!g_str_has_prefix(driver, "virtio-net-")) {
+        error_setg(errp, "vhost-vdpa requires frontend driver virtio-net-*");
+        return false;
+    }
+
+    return true;
+}
+
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
         .cleanup = vhost_vdpa_cleanup,
         .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
         .has_ufo = vhost_vdpa_has_ufo,
+        .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
 static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
@@ -179,24 +193,6 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     return ret;
 }
 
-static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
-{
-    const char *name = opaque;
-    const char *driver, *netdev;
-
-    driver = qemu_opt_get(opts, "driver");
-    netdev = qemu_opt_get(opts, "netdev");
-    if (!driver || !netdev) {
-        return 0;
-    }
-    if (strcmp(netdev, name) == 0 &&
-        !g_str_has_prefix(driver, "virtio-net-")) {
-        error_setg(errp, "vhost-vdpa requires frontend driver virtio-net-*");
-        return -1;
-    }
-    return 0;
-}
-
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
@@ -204,10 +200,5 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
-    /* verify net frontend */
-    if (qemu_opts_foreach(qemu_find_opts("device"), net_vhost_check_net,
-                          (char *)name, errp)) {
-        return -1;
-    }
     return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
 }
-- 
2.31.1


