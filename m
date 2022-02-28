Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CC4C6F3A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:22:45 +0100 (CET)
Received: from localhost ([::1]:59466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgvF-0007Bu-40
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn9-0001af-4i; Mon, 28 Feb 2022 01:45:55 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn6-0003Ji-Ma; Mon, 28 Feb 2022 01:45:54 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 97B9E11EF54;
 Mon, 28 Feb 2022 06:45:46 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 09:47:25 +0800
Subject: [PATCH qemu 7/7] hvf: use GTree to store memory slots instead of
 fixed-size array
Message-ID: <164603074537.20094.1732342403585879912-7@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:40 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Yan-Jie Wang <ubzeme@gmail.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yan-Jie Wang <ubzeme@gmail.com>

Currently, there are only 32 memory slots in the fixed size array.
It is not scalable. Instead of using fixed size array, use GTree
(from glib library) and dynamically-allocated structures to store
memory slots.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 63 +++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 4948578adf..2f70ceb307 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -28,8 +28,6 @@
=20
 /* Memory slots */
=20
-#define HVF_NUM_SLOTS 32
-
 /* HVFSlot flags */
 #define HVF_SLOT_LOG (1 << 0)
 #define HVF_SLOT_READONLY (1 << 1)
@@ -42,35 +40,24 @@ typedef struct HVFSlot {
     MemoryRegion *region;
 } HVFSlot;
=20
-static HVFSlot memslots[HVF_NUM_SLOTS];
+static GTree *memslots;
 static QemuMutex memlock;
=20
 static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
-    HVFSlot *slot;
-    int x;
-    for (x =3D 0; x < HVF_NUM_SLOTS; ++x) {
-        slot =3D &memslots[x];
-        if (slot->size && start < (slot->start + slot->size) &&
-            (start + size) > slot->start) {
-            return slot;
-        }
-    }
-    return NULL;
+    HVFSlot key =3D {.start =3D start, .size =3D 1};
+    return g_tree_lookup(memslots, &key);
 }
=20
-static HVFSlot *hvf_find_free_slot(void)
+static void hvf_insert_slot(HVFSlot *slot)
 {
-    HVFSlot *slot;
-    int x;
-    for (x =3D 0; x < HVF_NUM_SLOTS; x++) {
-        slot =3D &memslots[x];
-        if (!slot->size) {
-            return slot;
-        }
-    }
+    g_tree_insert(memslots, slot, slot);
+}
=20
-    return slot;
+static bool hvf_remove_slot(hwaddr start)
+{
+    HVFSlot key =3D {.start =3D start, .size =3D 1};
+    return g_tree_remove(memslots, &key);
 }
=20
 /*
@@ -141,9 +128,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *section=
, bool add)
         readonly =3D memory_region_is_rom(area) || memory_region_is_romd(are=
a);
=20
         /* setup a slot */
-        qemu_mutex_lock(&memlock);
-
-        slot =3D hvf_find_free_slot();
+        slot =3D g_new0(HVFSlot, 1);
         if (!slot) {
             error_report("No free slots");
             abort();
@@ -170,6 +155,10 @@ static void hvf_set_phys_mem(MemoryRegionSection *sectio=
n, bool add)
             flags =3D HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
         }
=20
+        qemu_mutex_lock(&memlock);
+
+        hvf_insert_slot(slot);
+
         ret =3D hv_vm_map(host_addr, start, size, flags);
         assert_hvf_ok(ret);
=20
@@ -178,13 +167,9 @@ static void hvf_set_phys_mem(MemoryRegionSection *sectio=
n, bool add)
         /* remove memory region */
         qemu_mutex_lock(&memlock);
=20
-        slot =3D hvf_find_overlap_slot(start, size);
-
-        if (slot) {
+        if (hvf_remove_slot(start)) {
             ret =3D hv_vm_unmap(start, size);
             assert_hvf_ok(ret);
-
-            slot->size =3D 0;
         }
=20
         qemu_mutex_unlock(&memlock);
@@ -310,8 +295,24 @@ bool hvf_access_memory(hwaddr address, bool write)
     return true;
 }
=20
+/* compare function for GTree */
+static gint _hvf_slot_compare(gconstpointer a, gconstpointer b, gpointer dat=
a)
+{
+    const HVFSlot *m1 =3D (const HVFSlot *)a;
+    const HVFSlot *m2 =3D (const HVFSlot *)b;
+
+    if (m2->start >=3D m1->start + m1->size) {
+        return -1;
+    } else if (m1->start >=3D m2->start + m2->size) {
+        return 1;
+    }
+
+    return 0;
+}
+
 void hvf_init_memslots(void)
 {
     qemu_mutex_init(&memlock);
+    memslots =3D g_tree_new_full(_hvf_slot_compare, NULL, g_free, NULL);
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
--=20
2.34.1

