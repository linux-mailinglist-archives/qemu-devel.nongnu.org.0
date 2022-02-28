Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916474C6F00
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:10:05 +0100 (CET)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgiy-00026m-BG
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:10:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn7-0001Yv-6c; Mon, 28 Feb 2022 01:45:53 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn5-0003JJ-9c; Mon, 28 Feb 2022 01:45:52 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 70DFD11EF53;
 Mon, 28 Feb 2022 06:45:46 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 09:41:52 +0800
Subject: [PATCH qemu 6/7] hvf: add a lock for memory related functions
Message-ID: <164603074537.20094.1732342403585879912-6@git.sr.ht>
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

We follow how KVM accel does in its memory listener (kvm-all.c) and add
a lock for the memory related functions.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index b8d8bf6799..4948578adf 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -43,6 +43,7 @@ typedef struct HVFSlot {
 } HVFSlot;
=20
 static HVFSlot memslots[HVF_NUM_SLOTS];
+static QemuMutex memlock;
=20
 static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
@@ -140,6 +141,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section=
, bool add)
         readonly =3D memory_region_is_rom(area) || memory_region_is_romd(are=
a);
=20
         /* setup a slot */
+        qemu_mutex_lock(&memlock);
+
         slot =3D hvf_find_free_slot();
         if (!slot) {
             error_report("No free slots");
@@ -169,8 +172,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *sectio=
n, bool add)
=20
         ret =3D hv_vm_map(host_addr, start, size, flags);
         assert_hvf_ok(ret);
+
+        qemu_mutex_unlock(&memlock);
     } else {
         /* remove memory region */
+        qemu_mutex_lock(&memlock);
+
         slot =3D hvf_find_overlap_slot(start, size);
=20
         if (slot) {
@@ -179,6 +186,8 @@ static void hvf_set_phys_mem(MemoryRegionSection *section=
, bool add)
=20
             slot->size =3D 0;
         }
+
+        qemu_mutex_unlock(&memlock);
     }
 }
=20
@@ -186,6 +195,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *s=
ection, bool on)
 {
     HVFSlot *slot;
=20
+    qemu_mutex_lock(&memlock);
+
     slot =3D hvf_find_overlap_slot(
             section->offset_within_address_space,
             int128_get64(section->size));
@@ -201,6 +212,8 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *s=
ection, bool on)
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
                       HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
     }
+
+    qemu_mutex_unlock(&memlock);
 }
=20
 static void hvf_log_start(MemoryListener *listener,
@@ -271,10 +284,13 @@ bool hvf_access_memory(hwaddr address, bool write)
     hv_return_t ret;
     hwaddr start, size;
=20
+    qemu_mutex_lock(&memlock);
+
     slot =3D hvf_find_overlap_slot(address, 1);
=20
     if (!slot || (write && slot->flags & HVF_SLOT_READONLY)) {
         /* MMIO or unmapped area, return false */
+        qemu_mutex_unlock(&memlock);
         return false;
     }
=20
@@ -290,10 +306,12 @@ bool hvf_access_memory(hwaddr address, bool write)
         assert_hvf_ok(ret);
     }
=20
+    qemu_mutex_unlock(&memlock);
     return true;
 }
=20
 void hvf_init_memslots(void)
 {
+    qemu_mutex_init(&memlock);
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
 }
--=20
2.34.1


