Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D55146D26
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:44:15 +0100 (CET)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iueeT-0006Ac-Sg
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iucXO-0005AP-CV
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:28:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iucXM-0003kL-AE
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:28:46 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:56778)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iucXL-0003i9-Tg; Thu, 23 Jan 2020 08:28:44 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8AE5E96F57;
 Thu, 23 Jan 2020 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1579786122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpG3bEyKxlDGkxhXvLPUc+N219RsO/RjbVlSpwqV9AI=;
 b=yNUakn05Bnh7X1Rq9BDFzqyQQRlsFaoCktGyFP9SxjAagkCo2UjZNDLUf716/lKzEZjGT6
 pBMvYBuP3kaiuuHieHA0/FkJNUWBKJb8AAQWqNS1nfe9Ws4y1t8kinjiIGdCB27wgq9V7d
 ouX/PrIFexP0wKW7iaN4+49KaxILd6I=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/11] hw/core: deprecate old reset functions and introduce
 new ones
Date: Thu, 23 Jan 2020 14:28:20 +0100
Message-Id: <20200123132823.1117486-9-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123132823.1117486-1-damien.hedde@greensocs.com>
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1579786122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FpG3bEyKxlDGkxhXvLPUc+N219RsO/RjbVlSpwqV9AI=;
 b=xlY0OUaBzx7RqOVbBo4SKDEI7ozjjOktzcZRDfQvSZFOGPEalLmNted1WpbDUkiWcIuMOa
 bWoVGitS5cJlEbVesVeo/ZEqgdfhDCLzwQvYNfBSqV8g8VdOWmMOGMtgmRc3mpk+7TIFMy
 7m6rDWcfh7SpBD5iqfPFKuvDb2qkqH8=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1579786122; a=rsa-sha256; cv=none;
 b=4O7q/MVpCYtDU1DXRd7AwrLkkPWgf8Y9DMUKNqFCo1YFaLi9gl7giUL/K7OE4Dg6GHErB/
 WhHXrU3opiSbpk5w5rxo9vxFF8dVpKDMtVY1RVqses1SynJ9lXw6JdVDfVr0tjgtUnI6wP
 ksSn6LMMt+yvyT2B9Y2AEP44bKPc7SU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, cohuck@redhat.com,
 mark.burton@greensocs.com, qemu-s390x@nongnu.org, edgari@xilinx.com,
 pbonzini@redhat.com, philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Deprecate device_legacy_reset(), qdev_reset_all() and
qbus_reset_all() to be replaced by new functions
device_cold_reset() and bus_cold_reset() which uses resettable API.

Also introduce resettable_cold_reset_fn() which may be used as a
replacement for qdev_reset_all_fn and qbus_reset_all_fn().

Following patches will be needed to look at legacy reset call sites
and switch to resettable api. The legacy functions will be removed
when unused.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/qdev-core.h  | 27 +++++++++++++++++++++++++++
 include/hw/resettable.h |  9 +++++++++
 hw/core/bus.c           |  5 +++++
 hw/core/qdev.c          |  5 +++++
 hw/core/resettable.c    |  5 +++++
 5 files changed, 51 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 1b4b420617..b84fcc32bf 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -406,6 +406,13 @@ int qdev_walk_children(DeviceState *dev,
                        qdev_walkerfn *post_devfn, qbus_walkerfn *post_bu=
sfn,
                        void *opaque);
=20
+/**
+ * @qdev_reset_all:
+ * Reset @dev. See @qbus_reset_all() for more details.
+ *
+ * Note: This function is deprecated and will be removed when it becomes=
 unused.
+ * Please use device_cold_reset() now.
+ */
 void qdev_reset_all(DeviceState *dev);
 void qdev_reset_all_fn(void *opaque);
=20
@@ -418,10 +425,28 @@ void qdev_reset_all_fn(void *opaque);
  * hard reset means that qbus_reset_all will reset all state of the devi=
ce.
  * For PCI devices, for example, this will include the base address regi=
sters
  * or configuration space.
+ *
+ * Note: This function is deprecated and will be removed when it becomes=
 unused.
+ * Please use bus_cold_reset() now.
  */
 void qbus_reset_all(BusState *bus);
 void qbus_reset_all_fn(void *opaque);
=20
+/**
+ * device_cold_reset:
+ * Reset device @dev and perform a recursive processing using the resett=
able
+ * interface. It triggers a RESET_TYPE_COLD.
+ */
+void device_cold_reset(DeviceState *dev);
+
+/**
+ * bus_cold_reset:
+ *
+ * Reset bus @bus and perform a recursive processing using the resettabl=
e
+ * interface. It triggers a RESET_TYPE_COLD.
+ */
+void bus_cold_reset(BusState *bus);
+
 /**
  * device_is_in_reset:
  * Return true if the device @dev is currently being reset.
@@ -452,6 +477,8 @@ void qdev_machine_init(void);
  * device_legacy_reset:
  *
  * Reset a single device (by calling the reset method).
+ * Note: This function is deprecated and will be removed when it becomes=
 unused.
+ * Please use device_cold_reset() now.
  */
 void device_legacy_reset(DeviceState *dev);
=20
diff --git a/include/hw/resettable.h b/include/hw/resettable.h
index 5e215d94e4..f4c4bab0ef 100644
--- a/include/hw/resettable.h
+++ b/include/hw/resettable.h
@@ -221,6 +221,15 @@ bool resettable_is_in_reset(Object *obj);
  */
 void resettable_change_parent(Object *obj, Object *newp, Object *oldp);
=20
+/**
+ * resettable_cold_reset_fn:
+ * Helper to call resettable_reset((Object *) opaque, RESET_TYPE_COLD).
+ *
+ * This function is typically useful to register a reset handler with
+ * qemu_register_reset.
+ */
+void resettable_cold_reset_fn(void *opaque);
+
 /**
  * resettable_class_set_parent_phases:
  *
diff --git a/hw/core/bus.c b/hw/core/bus.c
index 2698f715bd..3dc0a825f0 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -68,6 +68,11 @@ int qbus_walk_children(BusState *bus,
     return 0;
 }
=20
+void bus_cold_reset(BusState *bus)
+{
+    resettable_reset(OBJECT(bus), RESET_TYPE_COLD);
+}
+
 bool bus_is_in_reset(BusState *bus)
 {
     return resettable_is_in_reset(OBJECT(bus));
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 36bfcbc697..7e6017fb3d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -361,6 +361,11 @@ void qbus_reset_all_fn(void *opaque)
     qbus_reset_all(bus);
 }
=20
+void device_cold_reset(DeviceState *dev)
+{
+    resettable_reset(OBJECT(dev), RESET_TYPE_COLD);
+}
+
 bool device_is_in_reset(DeviceState *dev)
 {
     return resettable_is_in_reset(OBJECT(dev));
diff --git a/hw/core/resettable.c b/hw/core/resettable.c
index 6e0b0f492f..96a99ce39e 100644
--- a/hw/core/resettable.c
+++ b/hw/core/resettable.c
@@ -264,6 +264,11 @@ void resettable_change_parent(Object *obj, Object *n=
ewp, Object *oldp)
     }
 }
=20
+void resettable_cold_reset_fn(void *opaque)
+{
+    resettable_reset((Object *) opaque, RESET_TYPE_COLD);
+}
+
 void resettable_class_set_parent_phases(ResettableClass *rc,
                                         ResettableEnterPhase enter,
                                         ResettableHoldPhase hold,
--=20
2.24.1


