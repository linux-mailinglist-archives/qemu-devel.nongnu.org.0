Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EAB15AA5E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:49:54 +0100 (CET)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1sOn-00081U-S4
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j1sIW-0006SO-26
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j1sIR-0003gR-6W
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47158
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j1sIQ-0003ff-TH
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581514998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNuQlSgldSAkpIuDIJbk/zpSbtxwoK8DXhH4/lGJbpk=;
 b=BSZhPomigrkX+nu0cr+P3CyJMgYtPp/c9iAHxHKYUZ7zGrQmRvP4nMRvIxHonHbHojDFj9
 6hNbWvd+a/UqcGLx+5bawFFCHFn7G/6D46R1+Ix8KtLiZZmEPqiDBYZYI7DP6NpFArQg98
 2DJB/00AbVElwKpouEh/B1VqymT7MLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-DP7iRCqnOeOoOXvupSnS5Q-1; Wed, 12 Feb 2020 08:43:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0F0A801E67;
 Wed, 12 Feb 2020 13:43:15 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-92.ams2.redhat.com [10.36.117.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75F601001B07;
 Wed, 12 Feb 2020 13:43:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 fixed 02/16] util: vfio-helpers: Fix qemu_vfio_close()
Date: Wed, 12 Feb 2020 14:42:40 +0100
Message-Id: <20200212134254.11073-3-david@redhat.com>
In-Reply-To: <20200212134254.11073-1-david@redhat.com>
References: <20200212134254.11073-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: DP7iRCqnOeOoOXvupSnS5Q-1
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
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfio_undo_mapping() will decrement the number of mappings and
reshuffle the array elements to fit into the reduced size.

Iterating over all elements like this does not work as expected, let's make
sure to remove all mappings properly.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/vfio-helpers.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 71e02e7f35..d6332522c1 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -694,13 +694,11 @@ static void qemu_vfio_reset(QEMUVFIOState *s)
 /* Close and free the VFIO resources. */
 void qemu_vfio_close(QEMUVFIOState *s)
 {
-    int i;
-
     if (!s) {
         return;
     }
-    for (i =3D 0; i < s->nr_mappings; ++i) {
-        qemu_vfio_undo_mapping(s, &s->mappings[i], NULL);
+    while (s->nr_mappings) {
+        qemu_vfio_undo_mapping(s, &s->mappings[s->nr_mappings - 1], NULL);
     }
     ram_block_notifier_remove(&s->ram_notifier);
     qemu_vfio_reset(s);
--=20
2.24.1


