Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBAE7E9A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 03:42:40 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPHSw-00073C-Sh
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 22:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1iPHPR-0004jN-Hf
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 22:39:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1iPHOT-0002cA-I5
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 22:38:02 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32100
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1iPHOT-0002by-Ee
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 22:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572316681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YSk/UNDQ3IMUq5qBNZYXL7t/7GeCkHSvp0PM70NGWVY=;
 b=jM0R4K79JPT8a3Z6OmbOe2aENwqtYjCSFJjfG5q+15GnlzpkJN1Bz2qIsdGNGqyKbNlIH+
 vqUSXT4xnnFJ3ngbQspz3efu5M60sfjeK0BFaTi5Zs53523C9r/KFfXtPdMec4okOsez88
 pYuMq4Gq5PQXdwRmGdeHrxKY6xgvrCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-6OFoYa-NMGSat4I1v87j4A-1; Mon, 28 Oct 2019 22:37:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2FC5E6;
 Tue, 29 Oct 2019 02:37:56 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-230.pek2.redhat.com
 [10.72.12.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7C7419C77;
 Tue, 29 Oct 2019 02:37:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 3/4] virtio-net: prevent offloads reset on migration
Date: Tue, 29 Oct 2019 10:37:40 +0800
Message-Id: <1572316661-20043-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1572316661-20043-1-git-send-email-jasowang@redhat.com>
References: <1572316661-20043-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 6OFoYa-NMGSat4I1v87j4A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>

Currently offloads disabled by guest via the VIRTIO_NET_CTRL_GUEST_OFFLOADS=
_SET
command are not preserved on VM migration.
Instead all offloads reported by guest features (via VIRTIO_PCI_GUEST_FEATU=
RES)
get enabled.
What happens is: first the VirtIONet::curr_guest_offloads gets restored and=
 offloads
are getting set correctly:

 #0  qemu_set_offload (nc=3D0x555556a11400, csum=3D1, tso4=3D0, tso6=3D0, e=
cn=3D0, ufo=3D0) at net/net.c:474
 #1  virtio_net_apply_guest_offloads (n=3D0x555557701ca0) at hw/net/virtio-=
net.c:720
 #2  virtio_net_post_load_device (opaque=3D0x555557701ca0, version_id=3D11)=
 at hw/net/virtio-net.c:2334
 #3  vmstate_load_state (f=3D0x5555569dc010, vmsd=3D0x555556577c80 <vmstate=
_virtio_net_device>, opaque=3D0x555557701ca0, version_id=3D11)
     at migration/vmstate.c:168
 #4  virtio_load (vdev=3D0x555557701ca0, f=3D0x5555569dc010, version_id=3D1=
1) at hw/virtio/virtio.c:2197
 #5  virtio_device_get (f=3D0x5555569dc010, opaque=3D0x555557701ca0, size=
=3D0, field=3D0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:=
2036
 #6  vmstate_load_state (f=3D0x5555569dc010, vmsd=3D0x555556577ce0 <vmstate=
_virtio_net>, opaque=3D0x555557701ca0, version_id=3D11) at migration/vmstat=
e.c:143
 #7  vmstate_load (f=3D0x5555569dc010, se=3D0x5555578189e0) at migration/sa=
vevm.c:829
 #8  qemu_loadvm_section_start_full (f=3D0x5555569dc010, mis=3D0x5555569eee=
20) at migration/savevm.c:2211
 #9  qemu_loadvm_state_main (f=3D0x5555569dc010, mis=3D0x5555569eee20) at m=
igration/savevm.c:2395
 #10 qemu_loadvm_state (f=3D0x5555569dc010) at migration/savevm.c:2467
 #11 process_incoming_migration_co (opaque=3D0x0) at migration/migration.c:=
449

However later on the features are getting restored, and offloads get reset =
to
everything supported by features:

 #0  qemu_set_offload (nc=3D0x555556a11400, csum=3D1, tso4=3D1, tso6=3D1, e=
cn=3D0, ufo=3D0) at net/net.c:474
 #1  virtio_net_apply_guest_offloads (n=3D0x555557701ca0) at hw/net/virtio-=
net.c:720
 #2  virtio_net_set_features (vdev=3D0x555557701ca0, features=3D5104441767)=
 at hw/net/virtio-net.c:773
 #3  virtio_set_features_nocheck (vdev=3D0x555557701ca0, val=3D5104441767) =
at hw/virtio/virtio.c:2052
 #4  virtio_load (vdev=3D0x555557701ca0, f=3D0x5555569dc010, version_id=3D1=
1) at hw/virtio/virtio.c:2220
 #5  virtio_device_get (f=3D0x5555569dc010, opaque=3D0x555557701ca0, size=
=3D0, field=3D0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:=
2036
 #6  vmstate_load_state (f=3D0x5555569dc010, vmsd=3D0x555556577ce0 <vmstate=
_virtio_net>, opaque=3D0x555557701ca0, version_id=3D11) at migration/vmstat=
e.c:143
 #7  vmstate_load (f=3D0x5555569dc010, se=3D0x5555578189e0) at migration/sa=
vevm.c:829
 #8  qemu_loadvm_section_start_full (f=3D0x5555569dc010, mis=3D0x5555569eee=
20) at migration/savevm.c:2211
 #9  qemu_loadvm_state_main (f=3D0x5555569dc010, mis=3D0x5555569eee20) at m=
igration/savevm.c:2395
 #10 qemu_loadvm_state (f=3D0x5555569dc010) at migration/savevm.c:2467
 #11 process_incoming_migration_co (opaque=3D0x0) at migration/migration.c:=
449

Fix this by preserving the state in saved_guest_offloads field and
pushing out offload initialization to the new post load hook.

Cc: qemu-stable@nongnu.org
Signed-off-by: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c            | 27 ++++++++++++++++++++++++---
 include/hw/virtio/virtio-net.h |  2 ++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9f11422..9d64619 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2333,9 +2333,13 @@ static int virtio_net_post_load_device(void *opaque,=
 int version_id)
         n->curr_guest_offloads =3D virtio_net_supported_guest_offloads(n);
     }
=20
-    if (peer_has_vnet_hdr(n)) {
-        virtio_net_apply_guest_offloads(n);
-    }
+    /*
+     * curr_guest_offloads will be later overwritten by the
+     * virtio_set_features_nocheck call done from the virtio_load.
+     * Here we make sure it is preserved and restored accordingly
+     * in the virtio_net_post_load_virtio callback.
+     */
+    n->saved_guest_offloads =3D n->curr_guest_offloads;
=20
     virtio_net_set_queues(n);
=20
@@ -2370,6 +2374,22 @@ static int virtio_net_post_load_device(void *opaque,=
 int version_id)
     return 0;
 }
=20
+static int virtio_net_post_load_virtio(VirtIODevice *vdev)
+{
+    VirtIONet *n =3D VIRTIO_NET(vdev);
+    /*
+     * The actual needed state is now in saved_guest_offloads,
+     * see virtio_net_post_load_device for detail.
+     * Restore it back and apply the desired offloads.
+     */
+    n->curr_guest_offloads =3D n->saved_guest_offloads;
+    if (peer_has_vnet_hdr(n)) {
+        virtio_net_apply_guest_offloads(n);
+    }
+
+    return 0;
+}
+
 /* tx_waiting field of a VirtIONetQueue */
 static const VMStateDescription vmstate_virtio_net_queue_tx_waiting =3D {
     .name =3D "virtio-net-queue-tx_waiting",
@@ -2912,6 +2932,7 @@ static void virtio_net_class_init(ObjectClass *klass,=
 void *data)
     vdc->guest_notifier_mask =3D virtio_net_guest_notifier_mask;
     vdc->guest_notifier_pending =3D virtio_net_guest_notifier_pending;
     vdc->legacy_features |=3D (0x1 << VIRTIO_NET_F_GSO);
+    vdc->post_load =3D virtio_net_post_load_virtio;
     vdc->vmsd =3D &vmstate_virtio_net_device;
 }
=20
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.=
h
index b96f0c6..07a9319 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -182,6 +182,8 @@ struct VirtIONet {
     char *netclient_name;
     char *netclient_type;
     uint64_t curr_guest_offloads;
+    /* used on saved state restore phase to preserve the curr_guest_offloa=
ds */
+    uint64_t saved_guest_offloads;
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
--=20
2.5.0


