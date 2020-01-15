Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321F13C924
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 17:22:50 +0100 (CET)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irlRR-00083f-8B
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 11:22:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkLA-0001Em-OC
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkL9-0000bC-52
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:16 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24219
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkL9-0000b1-0H
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:12:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3VFt3pNsNQjMhU9HjOQrUIHUzKUWbqZkz88Kdfo05k=;
 b=L0JaEk1D6KITOETXfmHD8lca/Njs9fjQ3cYnY5FXM4GGhGfi1tJR+dBe24zcy1kjpV8+80
 uqJG6LsLZYHJq+J4J8LkaCMJ9+j8drbCYITNuNwQuHNBU3AZD0h7hlFdvKL6MySP+JAalk
 9qbxB0DuFmYGsBUQN3sK9DahHZ4aLE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-IZurhFSkNRax7X24pxmvFw-1; Wed, 15 Jan 2020 10:12:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47942114291A;
 Wed, 15 Jan 2020 15:12:12 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7323119757;
 Wed, 15 Jan 2020 15:12:11 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 77/86] exec: cleanup
 qemu_minrampagesize()/qemu_maxrampagesize()
Date: Wed, 15 Jan 2020 16:07:32 +0100
Message-Id: <1579100861-73692-78-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: IZurhFSkNRax7X24pxmvFw-1
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
Cc: pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all RAM is backed by hostmem backends, drop
global -mem-path invariant and simplify code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: pbonzini@redhat.com
CC: rth@twiddle.net
---
 exec.c | 51 +++++----------------------------------------------
 1 file changed, 5 insertions(+), 46 deletions(-)

diff --git a/exec.c b/exec.c
index d4b769d..7b6e376 100644
--- a/exec.c
+++ b/exec.c
@@ -1667,60 +1667,19 @@ static int find_max_backend_pagesize(Object *obj, v=
oid *opaque)
  */
 long qemu_minrampagesize(void)
 {
-    long hpsize =3D LONG_MAX;
-    long mainrampagesize;
-    Object *memdev_root;
-    MachineState *ms =3D MACHINE(qdev_get_machine());
-
-    mainrampagesize =3D qemu_mempath_getpagesize(mem_path);
-
-    /* it's possible we have memory-backend objects with
-     * hugepage-backed RAM. these may get mapped into system
-     * address space via -numa parameters or memory hotplug
-     * hooks. we want to take these into account, but we
-     * also want to make sure these supported hugepage
-     * sizes are applicable across the entire range of memory
-     * we may boot from, so we take the min across all
-     * backends, and assume normal pages in cases where a
-     * backend isn't backed by hugepages.
-     */
-    memdev_root =3D object_resolve_path("/objects", NULL);
-    if (memdev_root) {
-        object_child_foreach(memdev_root, find_min_backend_pagesize, &hpsi=
ze);
-    }
-    if (hpsize =3D=3D LONG_MAX) {
-        /* No additional memory regions found =3D=3D> Report main RAM page=
 size */
-        return mainrampagesize;
-    }
-
-    /* If NUMA is disabled or the NUMA nodes are not backed with a
-     * memory-backend, then there is at least one node using "normal" RAM,
-     * so if its page size is smaller we have got to report that size inst=
ead.
-     */
-    if (hpsize > mainrampagesize &&
-        (ms->numa_state =3D=3D NULL ||
-         ms->numa_state->num_nodes =3D=3D 0 ||
-         ms->numa_state->nodes[0].node_memdev =3D=3D NULL)) {
-        static bool warned;
-        if (!warned) {
-            error_report("Huge page support disabled (n/a for main memory)=
.");
-            warned =3D true;
-        }
-        return mainrampagesize;
-    }
+    long hpsize;
+    Object *memdev_root =3D object_resolve_path("/objects", NULL);
=20
+    object_child_foreach(memdev_root, find_min_backend_pagesize, &hpsize);
     return hpsize;
 }
=20
 long qemu_maxrampagesize(void)
 {
-    long pagesize =3D qemu_mempath_getpagesize(mem_path);
+    long pagesize;
     Object *memdev_root =3D object_resolve_path("/objects", NULL);
=20
-    if (memdev_root) {
-        object_child_foreach(memdev_root, find_max_backend_pagesize,
-                             &pagesize);
-    }
+    object_child_foreach(memdev_root, find_max_backend_pagesize, &pagesize=
);
     return pagesize;
 }
 #else
--=20
2.7.4


