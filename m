Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057402DE125
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:36:47 +0100 (CET)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD7t-0003P4-Vq
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5Z-0000uz-Sn
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:21 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:53990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqD5V-00020M-HH
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:34:21 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-LGMM8i7LN8Ovh-JGaMoIig-1; Fri, 18 Dec 2020 05:34:12 -0500
X-MC-Unique: LGMM8i7LN8Ovh-JGaMoIig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 848C2800479;
 Fri, 18 Dec 2020 10:34:11 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B0E560C47;
 Fri, 18 Dec 2020 10:34:10 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] spapr: Model DR connectors as simple objects
Date: Fri, 18 Dec 2020 11:34:00 +0100
Message-Id: <20201218103400.689660-7-groug@kaod.org>
In-Reply-To: <20201218103400.689660-1-groug@kaod.org>
References: <20201218103400.689660-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modeling DR connectors as individual devices raises some
concerns, as already discussed a year ago in this thread:

https://patchew.org/QEMU/20191017205953.13122-1-cheloha@linux.vnet.ibm.com/

First, high maxmem settings creates too many DRC devices.
This causes scalability issues. It severely increase boot
time because the multiple traversals of the DRC list that
are performed during machine setup are quadratic operations.
This is directly related to the fact that DRCs are modeled
as individual devices and added to the composition tree.

Second, DR connectors are really an internal concept of
PAPR. They aren't something that the user or management
layer can manipulate in any way. We already don't allow
their creation with device_add by clearing user_creatable.

DR connectors don't even need to be modeled as actual
devices since they don't sit in a bus. They just need
to be associated to an 'owner' object and to have the
equivalent of realize/unrealize functions.

Downgrade them to be simple objects. Convert the existing
realize() and unrealize() to be methods of the DR connector
base class. Also have the base class to inherit from the
vmstate_if interface directly. The get_id() hook simply
returns NULL, just as device_vmstate_if_get_id() does for
devices that don't sit in a bus. The DR connector is no
longer made a child object. This means that it must be
explicitely freed when no longer needed. This is only
required for PHBs and PCI bridges actually : have them to
free the DRC with spapr_dr_connector_free() instead of
object_unparent().

No longer add the DRCs to the QOM composition tree. Track
them with a glib hash table using the global DRC index as
the key instead. This makes traversal a linear operation.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr_drc.h |   8 +-
 hw/ppc/spapr_drc.c         | 166 ++++++++++++++-----------------------
 hw/ppc/spapr_pci.c         |   2 +-
 3 files changed, 69 insertions(+), 107 deletions(-)

diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 8982927d5c24..a26aa8b9d4c3 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -170,7 +170,7 @@ typedef enum {
=20
 typedef struct SpaprDrc {
     /*< private >*/
-    DeviceState parent;
+    Object parent;
=20
     uint32_t id;
     Object *owner;
@@ -193,7 +193,7 @@ struct SpaprMachineState;
=20
 typedef struct SpaprDrcClass {
     /*< private >*/
-    DeviceClass parent;
+    ObjectClass parent;
     SpaprDrcState empty_state;
     SpaprDrcState ready_state;
=20
@@ -209,6 +209,9 @@ typedef struct SpaprDrcClass {
=20
     int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
                        void *fdt, int *fdt_start_offset, Error **errp);
+
+    void (*realize)(SpaprDrc *drc);
+    void (*unrealize)(SpaprDrc *drc);
 } SpaprDrcClass;
=20
 typedef struct SpaprDrcPhysical {
@@ -232,6 +235,7 @@ SpaprDrcType spapr_drc_type(SpaprDrc *drc);
=20
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
                                          uint32_t id);
+void spapr_dr_connector_free(SpaprDrc *drc);
 SpaprDrc *spapr_drc_by_index(uint32_t index);
 SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id);
 int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_m=
ask);
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8571d5bafe4e..e26763f8b5a4 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -27,7 +27,6 @@
 #include "sysemu/reset.h"
 #include "trace.h"
=20
-#define DRC_CONTAINER_PATH "/dr-connector"
 #define DRC_INDEX_TYPE_SHIFT 28
 #define DRC_INDEX_ID_MASK ((1ULL << DRC_INDEX_TYPE_SHIFT) - 1)
=20
@@ -503,65 +502,56 @@ static const VMStateDescription vmstate_spapr_drc =3D=
 {
     }
 };
=20
-static void drc_realize(DeviceState *d, Error **errp)
+static GHashTable *drc_hash_table(void)
 {
-    SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
-    Object *root_container;
-    gchar *link_name;
-    const char *child_name;
+    static GHashTable *dht;
=20
+    if (!dht) {
+        dht =3D g_hash_table_new(NULL, NULL);
+    }
+
+    return dht;
+}
+
+
+static void drc_realize(SpaprDrc *drc)
+{
     trace_spapr_drc_realize(spapr_drc_index(drc));
-    /* NOTE: we do this as part of realize/unrealize due to the fact
-     * that the guest will communicate with the DRC via RTAS calls
-     * referencing the global DRC index. By unlinking the DRC
-     * from DRC_CONTAINER_PATH/<drc_index> we effectively make it
-     * inaccessible by the guest, since lookups rely on this path
-     * existing in the composition tree
-     */
-    root_container =3D container_get(object_get_root(), DRC_CONTAINER_PATH=
);
-    link_name =3D g_strdup_printf("%x", spapr_drc_index(drc));
-    child_name =3D object_get_canonical_path_component(OBJECT(drc));
-    trace_spapr_drc_realize_child(spapr_drc_index(drc), child_name);
-    object_property_add_alias(root_container, link_name,
-                              drc->owner, child_name);
-    g_free(link_name);
+
+    g_hash_table_insert(drc_hash_table(),
+                        GUINT_TO_POINTER(spapr_drc_index(drc)), drc);
     vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr=
_drc,
                      drc);
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
 }
=20
-static void drc_unrealize(DeviceState *d)
+static void drc_unrealize(SpaprDrc *drc)
 {
-    SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
-    Object *root_container;
-    gchar *name;
-
     trace_spapr_drc_unrealize(spapr_drc_index(drc));
     vmstate_unregister(VMSTATE_IF(drc), &vmstate_spapr_drc, drc);
-    root_container =3D container_get(object_get_root(), DRC_CONTAINER_PATH=
);
-    name =3D g_strdup_printf("%x", spapr_drc_index(drc));
-    object_property_del(root_container, name);
-    g_free(name);
+    g_hash_table_remove(drc_hash_table(),
+                        GUINT_TO_POINTER(spapr_drc_index(drc)));
 }
=20
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
                                          uint32_t id)
 {
     SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(object_new(type));
-    char *prop_name;
=20
     drc->id =3D id;
-    drc->owner =3D owner;
-    prop_name =3D g_strdup_printf("dr-connector[%"PRIu32"]",
-                                spapr_drc_index(drc));
-    object_property_add_child(owner, prop_name, OBJECT(drc));
-    object_unref(OBJECT(drc));
-    qdev_realize(DEVICE(drc), NULL, NULL);
-    g_free(prop_name);
+    drc->owner =3D object_ref(owner);
+    SPAPR_DR_CONNECTOR_GET_CLASS(drc)->realize(drc);
=20
     return drc;
 }
=20
+void spapr_dr_connector_free(SpaprDrc *drc)
+{
+    SPAPR_DR_CONNECTOR_GET_CLASS(drc)->unrealize(drc);
+    object_unref(drc->owner);
+    object_unref(drc);
+}
+
 static void spapr_dr_connector_instance_init(Object *obj)
 {
     SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(obj);
@@ -575,17 +565,19 @@ static void spapr_dr_connector_instance_init(Object *=
obj)
     drc->state =3D drck->empty_state;
 }
=20
+static char *drc_vmstate_if_get_id(VMStateIf *obj)
+{
+    return NULL;
+}
+
 static void spapr_dr_connector_class_init(ObjectClass *k, void *data)
 {
-    DeviceClass *dk =3D DEVICE_CLASS(k);
+    SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_CLASS(k);
+    VMStateIfClass *vc =3D VMSTATE_IF_CLASS(k);
=20
-    dk->realize =3D drc_realize;
-    dk->unrealize =3D drc_unrealize;
-    /*
-     * Reason: DR connector needs to be wired to either the machine or to =
a
-     * PHB in spapr_dr_connector_new().
-     */
-    dk->user_creatable =3D false;
+    drck->realize =3D drc_realize;
+    drck->unrealize =3D drc_unrealize;
+    vc->get_id =3D drc_vmstate_if_get_id;
 }
=20
 static bool drc_physical_needed(void *opaque)
@@ -623,39 +615,32 @@ static void drc_physical_reset(void *opaque)
     }
 }
=20
-static void realize_physical(DeviceState *d, Error **errp)
+static void realize_physical(SpaprDrc *drc)
 {
-    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
-    Error *local_err =3D NULL;
-
-    drc_realize(d, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(drc);
=20
+    drc_realize(drc);
     vmstate_register(VMSTATE_IF(drcp),
                      spapr_drc_index(SPAPR_DR_CONNECTOR(drcp)),
                      &vmstate_spapr_drc_physical, drcp);
     qemu_register_reset(drc_physical_reset, drcp);
 }
=20
-static void unrealize_physical(DeviceState *d)
+static void unrealize_physical(SpaprDrc *drc)
 {
-    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
+    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(drc);
=20
-    drc_unrealize(d);
-    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp=
);
     qemu_unregister_reset(drc_physical_reset, drcp);
+    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp=
);
+    drc_unrealize(drc);
 }
=20
 static void spapr_drc_physical_class_init(ObjectClass *k, void *data)
 {
-    DeviceClass *dk =3D DEVICE_CLASS(k);
     SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_CLASS(k);
=20
-    dk->realize =3D realize_physical;
-    dk->unrealize =3D unrealize_physical;
+    drck->realize =3D realize_physical;
+    drck->unrealize =3D unrealize_physical;
     drck->dr_entity_sense =3D physical_entity_sense;
     drck->isolate =3D drc_isolate_physical;
     drck->unisolate =3D drc_unisolate_physical;
@@ -731,12 +716,16 @@ static void spapr_drc_pmem_class_init(ObjectClass *k,=
 void *data)
=20
 static const TypeInfo spapr_dr_connector_info =3D {
     .name          =3D TYPE_SPAPR_DR_CONNECTOR,
-    .parent        =3D TYPE_DEVICE,
+    .parent        =3D TYPE_OBJECT,
     .instance_size =3D sizeof(SpaprDrc),
     .instance_init =3D spapr_dr_connector_instance_init,
     .class_size    =3D sizeof(SpaprDrcClass),
     .class_init    =3D spapr_dr_connector_class_init,
     .abstract      =3D true,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_VMSTATE_IF },
+        { }
+    },
 };
=20
 static const TypeInfo spapr_drc_physical_info =3D {
@@ -789,14 +778,9 @@ static const TypeInfo spapr_drc_pmem_info =3D {
=20
 SpaprDrc *spapr_drc_by_index(uint32_t index)
 {
-    Object *obj;
-    gchar *name;
-
-    name =3D g_strdup_printf("%s/%x", DRC_CONTAINER_PATH, index);
-    obj =3D object_resolve_path(name, NULL);
-    g_free(name);
-
-    return !obj ? NULL : SPAPR_DR_CONNECTOR(obj);
+    return
+        SPAPR_DR_CONNECTOR(g_hash_table_lookup(drc_hash_table(),
+                                               GUINT_TO_POINTER(index)));
 }
=20
 SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id)
@@ -824,13 +808,12 @@ SpaprDrc *spapr_drc_by_id(const char *type, uint32_t =
id)
  */
 int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_m=
ask)
 {
-    Object *root_container;
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
+    GHashTableIter iter;
     uint32_t drc_count =3D 0;
     GArray *drc_indexes, *drc_power_domains;
     GString *drc_names, *drc_types;
     int ret;
+    SpaprDrc *drc;
=20
     /*
      * This should really be only called once per node since it overwrites
@@ -851,26 +834,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner=
, uint32_t drc_type_mask)
     drc_names =3D g_string_set_size(g_string_new(NULL), sizeof(uint32_t));
     drc_types =3D g_string_set_size(g_string_new(NULL), sizeof(uint32_t));
=20
-    /* aliases for all DRConnector objects will be rooted in QOM
-     * composition tree at DRC_CONTAINER_PATH
-     */
-    root_container =3D container_get(object_get_root(), DRC_CONTAINER_PATH=
);
-
-    object_property_iter_init(&iter, root_container);
-    while ((prop =3D object_property_iter_next(&iter))) {
-        Object *obj;
-        SpaprDrc *drc;
+    g_hash_table_iter_init(&iter, drc_hash_table());
+    while (g_hash_table_iter_next(&iter, NULL, (gpointer) &drc)) {
         SpaprDrcClass *drck;
         char *drc_name =3D NULL;
         uint32_t drc_index, drc_power_domain;
=20
-        if (!strstart(prop->type, "link<", NULL)) {
-            continue;
-        }
-
-        obj =3D object_property_get_link(root_container, prop->name,
-                                       &error_abort);
-        drc =3D SPAPR_DR_CONNECTOR(obj);
         drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
=20
         if (owner && (drc->owner !=3D owner)) {
@@ -951,23 +920,12 @@ out:
=20
 void spapr_drc_reset_all(SpaprMachineState *spapr)
 {
-    Object *drc_container;
-    ObjectProperty *prop;
-    ObjectPropertyIterator iter;
+    GHashTableIter iter;
+    SpaprDrc *drc;
=20
-    drc_container =3D container_get(object_get_root(), DRC_CONTAINER_PATH)=
;
 restart:
-    object_property_iter_init(&iter, drc_container);
-    while ((prop =3D object_property_iter_next(&iter))) {
-        SpaprDrc *drc;
-
-        if (!strstart(prop->type, "link<", NULL)) {
-            continue;
-        }
-        drc =3D SPAPR_DR_CONNECTOR(object_property_get_link(drc_container,
-                                                          prop->name,
-                                                          &error_abort));
-
+    g_hash_table_iter_init(&iter, drc_hash_table());
+    while (g_hash_table_iter_next(&iter, NULL, (gpointer) &drc)) {
         /*
          * This will complete any pending plug/unplug requests.
          * In case of a unplugged PHB or PCI bridge, this will
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 76d7c91e9c64..ca0cca664e3c 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -1262,7 +1262,7 @@ static void remove_drcs(SpaprPhbState *phb, PCIBus *b=
us)
         SpaprDrc *drc =3D drc_from_devfn(phb, chassis, i);
=20
         if (drc) {
-            object_unparent(OBJECT(drc));
+            spapr_dr_connector_free(drc);
         }
     }
 }
--=20
2.26.2


