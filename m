Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3C14F01D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:49:38 +0100 (CET)
Received: from localhost ([::1]:55044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYY5-0003gC-Tq
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXzJ-0006PU-Oh
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXzI-0007HI-Fu
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:41 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49379
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXzI-0007Eg-BP
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFlJmEVcLwmk2kRmgYV4rlCnSFNVs2xVWMeGPm20hSY=;
 b=A6VmMBkRGFftYBtQaXoocbApeqboTZRiW/vjcL59SiolDGWs0OG9qjx/wMnoshN2PRNKwo
 wRgyqSajSJ7q9yfd5EPOnoIQppf43MQhHwvMXokbvIuLqqLucRtpSzOYHZUhhBxbGaD0ty
 Ahu0UlVgC8ucQKo4+afUqVjyP26L4VA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-27niGnmEP2i-1yf-w7f-6w-1; Fri, 31 Jan 2020 10:13:36 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47346800D48;
 Fri, 31 Jan 2020 15:13:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 168BC86C4B;
 Fri, 31 Jan 2020 15:13:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 74/80] exec: cleanup
 qemu_minrampagesize()/qemu_maxrampagesize()
Date: Fri, 31 Jan 2020 16:09:44 +0100
Message-Id: <1580483390-131164-75-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 27niGnmEP2i-1yf-w7f-6w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: thuth@redhat.com, aik@ozlabs.ru, mdroth@linux.vnet.ibm.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com, rth@twiddle.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all RAM is backed by hostmem backends, drop
global -mem-path invariant and simplify code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
v4:
  * fix access to uninitialized pagesize/hpsize
    (David Gibson <david@gibson.dropbear.id.au>)

CC: thuth@redhat.com
CC: aik@ozlabs.ru
CC: mdroth@linux.vnet.ibm.com
CC: david@gibson.dropbear.id.au
CC: qemu-ppc@nongnu.org
CC: pbonzini@redhat.com
CC: rth@twiddle.net
---
 exec.c | 49 ++++---------------------------------------------
 1 file changed, 4 insertions(+), 45 deletions(-)

diff --git a/exec.c b/exec.c
index 67e520d..9f5421c 100644
--- a/exec.c
+++ b/exec.c
@@ -1668,59 +1668,18 @@ static int find_max_backend_pagesize(Object *obj, v=
oid *opaque)
 long qemu_minrampagesize(void)
 {
     long hpsize =3D LONG_MAX;
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
+    Object *memdev_root =3D object_resolve_path("/objects", NULL);
=20
+    object_child_foreach(memdev_root, find_min_backend_pagesize, &hpsize);
     return hpsize;
 }
=20
 long qemu_maxrampagesize(void)
 {
-    long pagesize =3D qemu_mempath_getpagesize(mem_path);
+    long pagesize =3D 0;
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


