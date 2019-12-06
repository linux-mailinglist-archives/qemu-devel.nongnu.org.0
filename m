Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD95115471
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 16:40:34 +0100 (CET)
Received: from localhost ([::1]:39908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idFia-0001gi-SH
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 10:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1idEmW-0001tv-Kh
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:40:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1idEmS-0003Gd-9e
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:40:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43844
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1idEmS-0003CA-4e
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575643222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A8XuLceambYefBTSCkdnVkXxIIwIoRAKWan0w0FFCBM=;
 b=Xx8vKtxv0q1eJcKM1GNrT3iHaTV37Y6SyPN856xpl26RAPvTfA3lrcVs9IfAzkmAwdwAQM
 0wRPxlBWcrDRPmTV0R4gig868CfDbUQoNbHD8sHQaOZ4uK5pPbHmfH2Xh9bdWyh0QOfXZ3
 2H7QJ98mtaaS41SGOJGYGV3bSFTNXzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-Y4MFc_RlNHim89MriW5y7w-1; Fri, 06 Dec 2019 01:36:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0603D800D5A
 for <qemu-devel@nongnu.org>; Fri,  6 Dec 2019 06:36:48 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-97.bne.redhat.com
 [10.64.54.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA38E5D9C9;
 Fri,  6 Dec 2019 06:36:46 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/core: Fix data type in do_nmi()
Date: Fri,  6 Dec 2019 17:36:42 +1100
Message-Id: <20191206063642.40942-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Y4MFc_RlNHim89MriW5y7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

object_dynamic_cast() should return machine (or GPIO) state instad of NMI
state in do_nmi(). So it's wrong to convert it to NMI state unconditionally=
.

This changes the prototype of NMIClass::nmi_monitor_handler() to accept
the parent object of NMI state instead of itself. With this, he parent obje=
ct
is passed to the function, to avoid potential data corruption.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/nmi.c              | 8 ++++----
 hw/i386/x86.c              | 2 +-
 hw/misc/macio/gpio.c       | 6 +++---
 hw/ppc/spapr.c             | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 include/hw/nmi.h           | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/core/nmi.c b/hw/core/nmi.c
index 481c4b3c7e..554708d0db 100644
--- a/hw/core/nmi.c
+++ b/hw/core/nmi.c
@@ -37,13 +37,13 @@ static void nmi_children(Object *o, struct do_nmi_s *ns=
);
 static int do_nmi(Object *o, void *opaque)
 {
     struct do_nmi_s *ns =3D opaque;
-    NMIState *n =3D (NMIState *) object_dynamic_cast(o, TYPE_NMI);
+    Object *parent =3D object_dynamic_cast(o, TYPE_NMI);
=20
-    if (n) {
-        NMIClass *nc =3D NMI_GET_CLASS(n);
+    if (parent) {
+        NMIClass *nc =3D NMI_GET_CLASS(parent);
=20
         ns->handled =3D true;
-        nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err);
+        nc->nmi_monitor_handler(parent, ns->cpu_index, &ns->err);
         if (ns->err) {
             return -1;
         }
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 394edc2f72..b98204f104 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -190,7 +190,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineS=
tate *ms)
     return ms->possible_cpus;
 }
=20
-static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
+static void x86_nmi(Object *parent, int cpu_index, Error **errp)
 {
     /* cpu index isn't used */
     CPUState *cs;
diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
index 6cca6b27d6..6b4dfcc188 100644
--- a/hw/misc/macio/gpio.c
+++ b/hw/misc/macio/gpio.c
@@ -196,10 +196,10 @@ static void macio_gpio_reset(DeviceState *dev)
     macio_set_gpio(s, 1, true);
 }
=20
-static void macio_gpio_nmi(NMIState *n, int cpu_index, Error **errp)
+static void macio_gpio_nmi(Object *parent, int cpu_index, Error **errp)
 {
-    macio_set_gpio(MACIO_GPIO(n), 9, true);
-    macio_set_gpio(MACIO_GPIO(n), 9, false);
+    macio_set_gpio(MACIO_GPIO(parent), 9, true);
+    macio_set_gpio(MACIO_GPIO(parent), 9, false);
 }
=20
 static void macio_gpio_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e076f6023c..3b92e4013d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3377,7 +3377,7 @@ void spapr_do_system_reset_on_cpu(CPUState *cs, run_o=
n_cpu_data arg)
     ppc_cpu_do_system_reset(cs);
 }
=20
-static void spapr_nmi(NMIState *n, int cpu_index, Error **errp)
+static void spapr_nmi(Object *parent, int cpu_index, Error **errp)
 {
     CPUState *cs;
=20
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index d3edeef0ad..a49952a8b9 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -431,7 +431,7 @@ static void s390_hot_add_cpu(MachineState *machine,
     s390x_new_cpu(object_class_get_name(oc), id, errp);
 }
=20
-static void s390_nmi(NMIState *n, int cpu_index, Error **errp)
+static void s390_nmi(Object *parent, int cpu_index, Error **errp)
 {
     CPUState *cs =3D qemu_get_cpu(cpu_index);
=20
diff --git a/include/hw/nmi.h b/include/hw/nmi.h
index a1e128724e..75afa67790 100644
--- a/include/hw/nmi.h
+++ b/include/hw/nmi.h
@@ -38,7 +38,7 @@ typedef struct NMIState NMIState;
 typedef struct NMIClass {
     InterfaceClass parent_class;
=20
-    void (*nmi_monitor_handler)(NMIState *n, int cpu_index, Error **errp);
+    void (*nmi_monitor_handler)(Object *parent, int cpu_index, Error **err=
p);
 } NMIClass;
=20
 void nmi_monitor_handle(int cpu_index, Error **errp);
--=20
2.23.0


