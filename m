Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08F1714D1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 11:16:36 +0100 (CET)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7GDb-0005Fg-79
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 05:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j7GAd-0002aZ-ER
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j7GAc-0004vE-6A
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:13:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22256
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j7GAc-0004tR-2Q
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582798409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0oUugQEab4bqH2Kasf8WtgB6oPJtcM2uppzFCmdwZI8=;
 b=T4Jt+cjdzqr0fDnzdKSbrbzfmmls+PzSs+S3wNO+s5kf2TItRbn1ltceJXUmnGqCmhBrqj
 7ID3/kQea6eOHAr2akmxxc5K1qd3FgdIIO0+lL2IlliJJL2HS2xorRSlMnsEZfvYL5bd3m
 GyIrfUhG7tVqm6xize5aQz5/BUQe7ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-lBkRLhNaPR-4ljnd_s9wpg-1; Thu, 27 Feb 2020 05:13:27 -0500
X-MC-Unique: lBkRLhNaPR-4ljnd_s9wpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E43E6DBAD;
 Thu, 27 Feb 2020 10:13:25 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-116-36.ams2.redhat.com [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1822A6E3EE;
 Thu, 27 Feb 2020 10:13:10 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/15] util: vfio-helpers: Factor out removal from
 qemu_vfio_undo_mapping()
Date: Thu, 27 Feb 2020 11:11:53 +0100
Message-Id: <20200227101205.5616-4-david@redhat.com>
In-Reply-To: <20200227101205.5616-1-david@redhat.com>
References: <20200227101205.5616-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor it out and properly use it where applicable. Make
qemu_vfio_undo_mapping() look like qemu_vfio_do_mapping(), passing the
size and iova, not the mapping.

Reviewed-by: Peter Xu <peterx@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/vfio-helpers.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 7085ca702c..f0c77f0d69 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -518,6 +518,20 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOStat=
e *s,
     return insert;
 }
=20
+/**
+ * Remove the mapping from @s and free it.
+ */
+static void qemu_vfio_remove_mapping(QEMUVFIOState *s, IOVAMapping *mappin=
g)
+{
+    const int index =3D mapping - s->mappings;
+
+    assert(index >=3D 0 && index < s->nr_mappings);
+    memmove(mapping, &s->mappings[index + 1],
+            sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
+    s->nr_mappings--;
+    s->mappings =3D g_renew(IOVAMapping, s->mappings, s->nr_mappings);
+}
+
 /* Do the DMA mapping with VFIO. */
 static int qemu_vfio_do_mapping(QEMUVFIOState *s, void *host, size_t size,
                                 uint64_t iova)
@@ -539,29 +553,22 @@ static int qemu_vfio_do_mapping(QEMUVFIOState *s, voi=
d *host, size_t size,
 }
=20
 /**
- * Undo the DMA mapping from @s with VFIO, and remove from mapping list.
+ * Undo the DMA mapping from @s with VFIO.
  */
-static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IOVAMapping *mapping)
+static void qemu_vfio_undo_mapping(QEMUVFIOState *s, size_t size, uint64_t=
 iova)
 {
-    int index;
     struct vfio_iommu_type1_dma_unmap unmap =3D {
         .argsz =3D sizeof(unmap),
         .flags =3D 0,
-        .iova =3D mapping->iova,
-        .size =3D mapping->size,
+        .iova =3D iova,
+        .size =3D size,
     };
=20
-    index =3D mapping - s->mappings;
-    assert(mapping->size > 0);
-    assert(QEMU_IS_ALIGNED(mapping->size, qemu_real_host_page_size));
-    assert(index >=3D 0 && index < s->nr_mappings);
+    assert(size > 0);
+    assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));
     if (ioctl(s->container, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
     }
-    memmove(mapping, &s->mappings[index + 1],
-            sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
-    s->nr_mappings--;
-    s->mappings =3D g_renew(IOVAMapping, s->mappings, s->nr_mappings);
 }
=20
 /* Check if the mapping list is (ascending) ordered. */
@@ -621,7 +628,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, siz=
e_t size,
             assert(qemu_vfio_verify_mappings(s));
             ret =3D qemu_vfio_do_mapping(s, host, size, iova0);
             if (ret) {
-                qemu_vfio_undo_mapping(s, mapping);
+                qemu_vfio_remove_mapping(s, mapping);
                 goto out;
             }
             s->low_water_mark +=3D size;
@@ -681,7 +688,8 @@ void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host)
     if (!m) {
         goto out;
     }
-    qemu_vfio_undo_mapping(s, m);
+    qemu_vfio_undo_mapping(s, m->size, m->iova);
+    qemu_vfio_remove_mapping(s, m);
 out:
     qemu_mutex_unlock(&s->lock);
 }
@@ -698,7 +706,10 @@ void qemu_vfio_close(QEMUVFIOState *s)
         return;
     }
     while (s->nr_mappings) {
-        qemu_vfio_undo_mapping(s, &s->mappings[s->nr_mappings - 1]);
+        IOVAMapping *m =3D &s->mappings[s->nr_mappings - 1];
+
+        qemu_vfio_undo_mapping(s, m->size, m->iova);
+        qemu_vfio_remove_mapping(s, m);
     }
     ram_block_notifier_remove(&s->ram_notifier);
     qemu_vfio_reset(s);
--=20
2.24.1


