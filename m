Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE610EC56
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 16:34:03 +0100 (CET)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibni6-0003HL-Sb
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 10:34:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ibncH-0006cU-MU
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:28:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ibncF-0002Fo-QM
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:28:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37236)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ibncE-0002EP-2s
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575300475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBDdCfk4cP0KSIRSYmwSzNaOEU53KBS+MmKZTAiNTAo=;
 b=dZyE/y/BvXyv9rG/gqvKMX3XeUDgQ8NRNys6zHZtS4BcnSlVoPCeCy2Kk6JRL1u93wc1B0
 PyQXET+ZTX1S+kLyeJ2zF5UGJH3ZS32OLMIbhHGQwc/MAUbvHAzYkKRgw2TO9xAnvq9yMW
 CzfB0qWP2DLwkAmxKnACPW/dP/3hzUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-pTZlL3tmNpWCqLTeWifk4Q-1; Mon, 02 Dec 2019 10:27:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E525D803B62
 for <qemu-devel@nongnu.org>; Mon,  2 Dec 2019 15:27:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE93760C05;
 Mon,  2 Dec 2019 15:27:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2467711366CC; Mon,  2 Dec 2019 16:27:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL for-4.2 2/3] net/virtio: Fix failover error handling crash bugs
Date: Mon,  2 Dec 2019 16:27:45 +0100
Message-Id: <20191202152746.32292-3-armbru@redhat.com>
In-Reply-To: <20191202152746.32292-1-armbru@redhat.com>
References: <20191202152746.32292-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: pTZlL3tmNpWCqLTeWifk4Q-1
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
Cc: Jens Freimann <jfreimann@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Functions that take an Error ** parameter to pass an error to the
caller expect the parameter to point to null.
failover_replug_primary() violates this precondition in several
places:

* After qemu_opts_from_qdict() failed, *errp is no longer null.
  Passing it to error_setg() is wrong, and will trip the assertion in
  error_setv().  Messed up in commit 150ab54aa6 "net/virtio: fix
  re-plugging of primary device".  Simply drop the error_setg().

* Passing @errp to qemu_opt_set_bool(), hotplug_handler_pre_plug(),
  and hotplug_handler_plug() is wrong.  If one of the first two fails,
  *errp is no longer null.  Risks tripping the same assertion.
  Moreover, continuing after such errors is unsafe.  Messed up in
  commit 9711cd0dfc "net/virtio: add failover support".  Fix by
  handling each error properly.

failover_replug_primary() crashes when passed a null @errp.  Also
messed up in commit 9711cd0dfc.  This bug can't bite as no caller
actually passes null.  Fix it anyway.

Fixes: 9711cd0dfc3fa414f7f64935713c07134ae67971
Fixes: 150ab54aa6934583180f88a2bd540bc6fc4fbff3
Cc: Jens Freimann <jfreimann@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191130194240.10517-3-armbru@redhat.com>
Reviewed-by: Jens Freimann <jfreimann@redhat.com>
---
 hw/net/virtio-net.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 87088ba374..db3d7c38e6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2795,6 +2795,7 @@ static bool failover_unplug_primary(VirtIONet *n)
=20
 static bool failover_replug_primary(VirtIONet *n, Error **errp)
 {
+    Error *err =3D NULL;
     HotplugHandler *hotplug_ctrl;
     PCIDevice *pdev =3D PCI_DEVICE(n->primary_dev);
=20
@@ -2806,27 +2807,33 @@ static bool failover_replug_primary(VirtIONet *n, E=
rror **errp)
                 qemu_find_opts("device"),
                 n->primary_device_dict, errp);
         if (!n->primary_device_opts) {
-            error_setg(errp, "virtio_net: couldn't find primary device opt=
s");
-            goto out;
+            return false;
         }
     }
     n->primary_bus =3D n->primary_dev->parent_bus;
     if (!n->primary_bus) {
         error_setg(errp, "virtio_net: couldn't find primary bus");
-        goto out;
+        return false;
     }
     qdev_set_parent_bus(n->primary_dev, n->primary_bus);
     n->primary_should_be_hidden =3D false;
     qemu_opt_set_bool(n->primary_device_opts,
-                      "partially_hotplugged", true, errp);
+                      "partially_hotplugged", true, &err);
+    if (err) {
+        goto out;
+    }
     hotplug_ctrl =3D qdev_get_hotplug_handler(n->primary_dev);
     if (hotplug_ctrl) {
-        hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, errp);
+        hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
+        if (err) {
+            goto out;
+        }
         hotplug_handler_plug(hotplug_ctrl, n->primary_dev, errp);
     }
=20
 out:
-    return *errp =3D=3D NULL;
+    error_propagate(errp, err);
+    return !err;
 }
=20
 static void virtio_net_handle_migration_primary(VirtIONet *n,
--=20
2.21.0


