Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1C311F141
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 10:55:12 +0100 (CET)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ig48l-0007C6-1F
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 04:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ig406-0004zw-Vd
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ig405-0005wa-Ny
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45315
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ig405-0005sp-Gf
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576316772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQR2sdSqZ9cEX9aPchrW/IDdW8VYKLN4r4CJI+RiiHM=;
 b=FBqGh+guGnHNQn4zO1dtdYMumJUA7RpdnGKuPu1gAZy7Y7ig6RRsBjJHx4YxXqLOWRZmK4
 GnKiaCnIWuFEpEiOSQ/caSzeTXAgjoee2NtxOcZvwt7agrT405ABZwSA4o42aEZ17ta6D2
 +wtgWAVLcu+3DHrgNKToTpgFz9lfjqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-vadwplfWN7OrIK47VM9irw-1; Sat, 14 Dec 2019 04:46:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 632AA1800D63;
 Sat, 14 Dec 2019 09:46:08 +0000 (UTC)
Received: from localhost (ovpn-116-90.ams2.redhat.com [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 801B45C28C;
 Sat, 14 Dec 2019 09:46:05 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 10/16] s390x/event-facility: Fix realize() error API
 violations
Date: Sat, 14 Dec 2019 10:45:20 +0100
Message-Id: <20191214094526.8698-11-cohuck@redhat.com>
In-Reply-To: <20191214094526.8698-1-cohuck@redhat.com>
References: <20191214094526.8698-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: vadwplfWN7OrIK47VM9irw-1
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

sclp_events_bus_realize() dereferences @errp when
object_property_set_bool() fails.  That's wrong; see the big comment
in error.h.  Introduced in commit f6102c329c "s390/sclp: rework sclp
event facility initialization + device realization".

No caller actually passes null.

Fix anyway: splice in a local Error *err, and error_propagate().

Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20191204093625.14836-12-armbru@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/event-facility.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index 66205697ae75..cdcf9154c49e 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -339,14 +339,16 @@ out:
=20
 static void sclp_events_bus_realize(BusState *bus, Error **errp)
 {
+    Error *err =3D NULL;
     BusChild *kid;
=20
     /* TODO: recursive realization has to be done in common code */
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         DeviceState *dev =3D kid->child;
=20
-        object_property_set_bool(OBJECT(dev), true, "realized", errp);
-        if (*errp) {
+        object_property_set_bool(OBJECT(dev), true, "realized", &err);
+        if (errp) {
+            error_propagate(errp, err);
             return;
         }
     }
--=20
2.21.0


