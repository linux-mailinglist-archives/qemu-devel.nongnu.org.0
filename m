Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17056166E11
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 04:49:32 +0100 (CET)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4zJj-0004rP-4Q
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 22:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z89-0002X2-1x
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4z87-0000LM-L1
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 22:37:32 -0500
Received: from ozlabs.org ([203.11.71.1]:32853)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4z87-0008Pi-9A; Thu, 20 Feb 2020 22:37:31 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NxwK5s2Gz9sSv; Fri, 21 Feb 2020 14:37:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582256225;
 bh=unz+97qOpd7aStQQgdkZVvhqZ5uuIVDfY9ETaB6X0Gg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KvNcgUIuftmFxHhjHtL0LjjK24gQcgJByqFdS0Et9d0DvVOMFbsgtt8pgawH1V9lc
 wW3ybB2X2NNT6m/R686thJSQOaN6F7mRMzKdKGXe6J9g+1Y3aJfg1cbAV8CN6W9IGn
 OGBx7Rk+PlIr2VWU6OQQGVa72ejnwgduVBnx0zTQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 19/20] spapr: Fix handling of unplugged devices during CAS and
 migration
Date: Fri, 21 Feb 2020 14:36:49 +1100
Message-Id: <20200221033650.444386-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221033650.444386-1-david@gibson.dropbear.id.au>
References: <20200221033650.444386-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

We already detect if a device is being hot plugged before CAS to trigger
a CAS reboot and during migration to migrate the state of the associated
DRC. But hot unplugging a device is also an asynchronous operation that
requires the guest to take action. This means that if the guest is migrat=
ed
after the hot unplug event was sent but before it could release the devic=
e
with RTAS, the destination QEMU doesn't know about the pending unplug
operation and doesn't actually remove the device when the guest finally
releases it.

Similarly, if the unplug request is fired before CAS, the guest isn't
notified of the change, just like with hotplug. It ends up booting with
the device still present in the DT and configures it, just like it was
never removed. Even weirder, since the event is still queued, it will
be eventually processed when some other unrelated event is posted to
the guest.

Enhance spapr_drc_transient() to also return true if an unplug request is
pending. This fixes the issue at CAS with a CAS reboot request and
causes the DRC state to be migrated. Some extra care is still needed to
inform the destination that an unplug request is pending : migrate the
unplug_requested field of the DRC in an optional subsection. This might
break backwards migration, but this is still better than ending with
an inconsistent guest.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <158169248798.3465937.1108351365840514270.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 4c35ce7c5c..e373d342eb 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -456,6 +456,22 @@ void spapr_drc_reset(SpaprDrc *drc)
     }
 }
=20
+static bool spapr_drc_unplug_requested_needed(void *opaque)
+{
+    return spapr_drc_unplug_requested(opaque);
+}
+
+static const VMStateDescription vmstate_spapr_drc_unplug_requested =3D {
+    .name =3D "spapr_drc/unplug_requested",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D spapr_drc_unplug_requested_needed,
+    .fields  =3D (VMStateField []) {
+        VMSTATE_BOOL(unplug_requested, SpaprDrc),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 bool spapr_drc_transient(SpaprDrc *drc)
 {
     SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
@@ -471,9 +487,10 @@ bool spapr_drc_transient(SpaprDrc *drc)
     /*
      * We need to reset the DRC at CAS or to migrate the DRC state if it=
's
      * not equal to the expected long-term state, which is the same as t=
he
-     * coldplugged initial state.
+     * coldplugged initial state, or if an unplug request is pending.
      */
-    return (drc->state !=3D drck->ready_state);
+    return drc->state !=3D drck->ready_state ||
+        spapr_drc_unplug_requested(drc);
 }
=20
 static bool spapr_drc_needed(void *opaque)
@@ -489,6 +506,10 @@ static const VMStateDescription vmstate_spapr_drc =3D=
 {
     .fields  =3D (VMStateField []) {
         VMSTATE_UINT32(state, SpaprDrc),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections =3D (const VMStateDescription * []) {
+        &vmstate_spapr_drc_unplug_requested,
+        NULL
     }
 };
=20
--=20
2.24.1


