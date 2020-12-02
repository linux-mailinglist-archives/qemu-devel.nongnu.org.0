Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104B2CB77E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:45:01 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNky-0004SU-Jx
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCf-0003FX-La
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCI-0003hj-JE
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjoEbg/0RgU7dmywMkQ/ZgZlTHMo1pdSQ4JkBIJSJ1w=;
 b=OiaQpb57tB11sAvz5u3FWfJqUZ+NjlNixOAKIOr+sbNpoCzqQ9UJTWrJEMN+lwKW66g1BL
 O+QGEWpUj1Fz6KL8D91WZGe4YG0jvHuXCci9EOTBe1kdoPSG/INAzIVK3pVu7ZFrT/JrZT
 uI2g6Pv7VOWdi7A9alkLjH77g+jCMLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-I0Ct96QFORqIijgCmbOZlw-1; Wed, 02 Dec 2020 03:09:08 -0500
X-MC-Unique: I0Ct96QFORqIijgCmbOZlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 380F5185E490
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 062F71346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 047/113] s390x: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:43 -0500
Message-Id: <20201202080849.4125477-48-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the machine properties instead.

Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/ipl.c             | 10 ++++++----
 hw/s390x/s390-skeys.c      |  6 ++++--
 hw/s390x/s390-virtio-ccw.c |  4 +++-
 target/s390x/excp_helper.c |  3 ++-
 target/s390x/mem_helper.c  | 10 +++++++---
 target/s390x/mmu_helper.c  |  4 +++-
 6 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 61e8c967d3..bddbaffac6 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -112,6 +112,7 @@ static uint64_t bios_translate_addr(void *opaque, uint64_t srcaddr)
 
 static void s390_ipl_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     S390IPLState *ipl = S390_IPL(dev);
     uint32_t *ipl_psw;
     uint64_t pentry;
@@ -126,7 +127,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
      * even if an external kernel has been defined.
      */
     if (!ipl->kernel || ipl->enforce_bios) {
-        uint64_t fwbase = (MIN(ram_size, 0x80000000U) - 0x200000) & ~0xffffUL;
+        uint64_t fwbase = (MIN(ms->ram_size, 0x80000000U) - 0x200000) & ~0xffffUL;
 
         bios_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, ipl->firmware);
         if (bios_filename == NULL) {
@@ -163,7 +164,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
                                &pentry, NULL,
                                NULL, NULL, 1, EM_S390, 0, 0);
         if (kernel_size < 0) {
-            kernel_size = load_image_targphys(ipl->kernel, 0, ram_size);
+            kernel_size = load_image_targphys(ipl->kernel, 0, ms->ram_size);
             if (kernel_size < 0) {
                 error_setg(errp, "could not load kernel '%s'", ipl->kernel);
                 return;
@@ -210,7 +211,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
                 initrd_offset += 0x100000;
             }
             initrd_size = load_image_targphys(ipl->initrd, initrd_offset,
-                                              ram_size - initrd_offset);
+                                              ms->ram_size - initrd_offset);
             if (initrd_size == -1) {
                 error_setg(errp, "could not load initrd '%s'", ipl->initrd);
                 return;
@@ -448,6 +449,7 @@ int s390_ipl_set_loadparm(uint8_t *loadparm)
 
 static int load_netboot_image(Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     S390IPLState *ipl = get_ipl_device();
     char *netboot_filename;
     MemoryRegion *sysmem =  get_system_memory();
@@ -480,7 +482,7 @@ static int load_netboot_image(Error **errp)
                             false);
 
     if (img_size < 0) {
-        img_size = load_image_size(netboot_filename, ram_ptr, ram_size);
+        img_size = load_image_size(netboot_filename, ram_ptr, ms->ram_size);
         ipl->start_addr = KERN_IMAGE_START;
     }
 
diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 5cc559fe4c..9a8d60d1d9 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -109,7 +109,8 @@ void qmp_dump_skeys(const char *filename, Error **errp)
 {
     S390SKeysState *ss = s390_get_skeys_device();
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
-    const uint64_t total_count = ram_size / TARGET_PAGE_SIZE;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    const uint64_t total_count = ms->ram_size / TARGET_PAGE_SIZE;
     uint64_t handled_count = 0, cur_count;
     Error *lerr = NULL;
     vaddr cur_gfn = 0;
@@ -256,7 +257,8 @@ static void s390_storage_keys_save(QEMUFile *f, void *opaque)
 {
     S390SKeysState *ss = S390_SKEYS(opaque);
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
-    uint64_t pages_left = ram_size / TARGET_PAGE_SIZE;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    uint64_t pages_left = ms->ram_size / TARGET_PAGE_SIZE;
     uint64_t read_count, eos = S390_SKEYS_SAVE_FLAG_EOS;
     vaddr cur_gfn = 0;
     int error = 0;
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 538229713a..fdfb386314 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -17,6 +17,7 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "exec/ram_addr.h"
+#include "hw/boards.h"
 #include "hw/s390x/s390-virtio-hcall.h"
 #include "hw/s390x/sclp.h"
 #include "hw/s390x/s390_flic.h"
@@ -142,8 +143,9 @@ static int virtio_ccw_hcall_notify(const uint64_t *args)
 static int virtio_ccw_hcall_early_printk(const uint64_t *args)
 {
     uint64_t mem = args[0];
+    MachineState *ms = MACHINE(qdev_get_machine());
 
-    if (mem < ram_size) {
+    if (mem < ms->ram_size) {
         /* Early printk */
         return 0;
     }
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 0adfbbda27..9cf66d3690 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -156,9 +156,10 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         !address_space_access_valid(&address_space_memory, raddr,
                                     TARGET_PAGE_SIZE, access_type,
                                     MEMTXATTRS_UNSPECIFIED)) {
+        MachineState *ms = MACHINE(qdev_get_machine());
         qemu_log_mask(CPU_LOG_MMU,
                       "%s: raddr %" PRIx64 " > ram_size %" PRIx64 "\n",
-                      __func__, (uint64_t)raddr, (uint64_t)ram_size);
+                      __func__, (uint64_t)raddr, (uint64_t)ms->ram_size);
         excp = PGM_ADDRESSING;
         tec = 0; /* unused */
     }
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index bd25eed3e8..0108611cc9 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -31,6 +31,7 @@
 
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/storage-keys.h"
+#include "hw/boards.h"
 #endif
 
 /*****************************************************************************/
@@ -2075,12 +2076,13 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
 /* insert storage key extended */
 uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
-    if (addr > ram_size) {
+    if (addr > ms->ram_size) {
         return 0;
     }
 
@@ -2098,12 +2100,13 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
 /* set storage key extended */
 void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
 
-    if (addr > ram_size) {
+    if (addr > ms->ram_size) {
         return;
     }
 
@@ -2124,11 +2127,12 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 /* reset reference bit extended */
 uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint8_t re, key;
 
-    if (r2 > ram_size) {
+    if (r2 > ms->ram_size) {
         return 0;
     }
 
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 7d9f3059cd..d492b23a17 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -27,6 +27,7 @@
 #include "trace.h"
 #include "hw/hw.h"
 #include "hw/s390x/storage-keys.h"
+#include "hw/boards.h"
 
 /* Fetch/store bits in the translation exception code: */
 #define FS_READ  0x800
@@ -292,10 +293,11 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
 {
     static S390SKeysClass *skeyclass;
     static S390SKeysState *ss;
+    MachineState *ms = MACHINE(qdev_get_machine());
     uint8_t key;
     int rc;
 
-    if (unlikely(addr >= ram_size)) {
+    if (unlikely(addr >= ms->ram_size)) {
         return;
     }
 
-- 
2.26.2



