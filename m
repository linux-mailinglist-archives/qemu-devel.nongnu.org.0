Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C154029BA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:31:11 +0200 (CEST)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbBu-0002ke-AT
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNaxB-0003sv-QM
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNax8-0002kD-Co
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rq2h0Jbsv6qAY22a65KCNwEpXVf48w2nQbNi+D7kbEQ=;
 b=gZiM28LesTBWqENePwGBsRAPr1Q1dwDq+vyxEUEXJnCiPOcKTW2xW4wLcVYUiVtP2YJYu7
 T/37ftVJMglHwM7Xvd/VTE4m9kk21B94lfXxL90n8grTB6WH6Mz36mLxYR4iSY8BYkl1NG
 iw3K2iJeK4HcL2oDEjzOiBQzckANlvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-vOyUKt-GN_uWgSw_BExCtQ-1; Tue, 07 Sep 2021 09:15:51 -0400
X-MC-Unique: vOyUKt-GN_uWgSw_BExCtQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73C39107ACCA;
 Tue,  7 Sep 2021 13:15:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BD385C3DF;
 Tue,  7 Sep 2021 13:15:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 18/20] hw/s390x/s390-skeys: lazy storage key enablement under
 TCG
Date: Tue,  7 Sep 2021 15:14:47 +0200
Message-Id: <20210907131449.493875-19-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's enable storage keys lazily under TCG, just as we do under KVM.
Only fairly old Linux versions actually make use of storage keys, so it
can be kind of wasteful to allocate quite some memory and track
changes and references if nobody cares.

We have to make sure to flush the TLB when enabling storage keys after
the VM was already running: otherwise it might happen that we don't
catch references or modifications afterwards.

Add proper documentation to all callbacks.

The kvm-unit-tests skey tests keeps on working with this change.

Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903155514.44772-14-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-skeys.c           | 65 ++++++++++++++++++++++++++-------
 include/hw/s390x/storage-keys.h | 63 ++++++++++++++++++++++++++++++++
 target/s390x/mmu_helper.c       |  8 ++++
 target/s390x/tcg/mem_helper.c   |  9 +++++
 4 files changed, 131 insertions(+), 14 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 9e994a5582..5024faf411 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -191,18 +191,45 @@ out:
     fclose(f);
 }
 
-static void qemu_s390_skeys_init(Object *obj)
+static bool qemu_s390_skeys_are_enabled(S390SKeysState *ss)
 {
-    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(obj);
-    MachineState *machine = MACHINE(qdev_get_machine());
+    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
 
-    skeys->key_count = machine->ram_size / TARGET_PAGE_SIZE;
-    skeys->keydata = g_malloc0(skeys->key_count);
+    /* Lockless check is sufficient. */
+    return !!skeys->keydata;
 }
 
-static bool qemu_s390_skeys_are_enabled(S390SKeysState *ss)
+static bool qemu_s390_enable_skeys(S390SKeysState *ss)
 {
-    return true;
+    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
+    static gsize initialized;
+
+    if (likely(skeys->keydata)) {
+        return true;
+    }
+
+    /*
+     * TODO: Modern Linux doesn't use storage keys unless running KVM guests
+     *       that use storage keys. Therefore, we keep it simple for now.
+     *
+     * 1) We should initialize to "referenced+changed" for an initial
+     *    over-indication. Let's avoid touching megabytes of data for now and
+     *    assume that any sane user will issue a storage key instruction before
+     *    actually relying on this data.
+     * 2) Relying on ram_size and allocating a big array is ugly. We should
+     *    allocate and manage storage key data per RAMBlock or optimally using
+     *    some sparse data structure.
+     * 3) We only ever have a single S390SKeysState, so relying on
+     *    g_once_init_enter() is good enough.
+     */
+    if (g_once_init_enter(&initialized)) {
+        MachineState *machine = MACHINE(qdev_get_machine());
+
+        skeys->key_count = machine->ram_size / TARGET_PAGE_SIZE;
+        skeys->keydata = g_malloc0(skeys->key_count);
+        g_once_init_leave(&initialized, 1);
+    }
+    return false;
 }
 
 static int qemu_s390_skeys_set(S390SKeysState *ss, uint64_t start_gfn,
@@ -212,9 +239,10 @@ static int qemu_s390_skeys_set(S390SKeysState *ss, uint64_t start_gfn,
     int i;
 
     /* Check for uint64 overflow and access beyond end of key data */
-    if (start_gfn + count > skeydev->key_count || start_gfn + count < count) {
-        error_report("Error: Setting storage keys for page beyond the end "
-                     "of memory: gfn=%" PRIx64 " count=%" PRId64,
+    if (unlikely(!skeydev->keydata || start_gfn + count > skeydev->key_count ||
+                  start_gfn + count < count)) {
+        error_report("Error: Setting storage keys for pages with unallocated "
+                     "storage key memory: gfn=%" PRIx64 " count=%" PRId64,
                      start_gfn, count);
         return -EINVAL;
     }
@@ -232,9 +260,10 @@ static int qemu_s390_skeys_get(S390SKeysState *ss, uint64_t start_gfn,
     int i;
 
     /* Check for uint64 overflow and access beyond end of key data */
-    if (start_gfn + count > skeydev->key_count || start_gfn + count < count) {
-        error_report("Error: Getting storage keys for page beyond the end "
-                     "of memory: gfn=%" PRIx64 " count=%" PRId64,
+    if (unlikely(!skeydev->keydata || start_gfn + count > skeydev->key_count ||
+                  start_gfn + count < count)) {
+        error_report("Error: Getting storage keys for pages with unallocated "
+                     "storage key memory: gfn=%" PRIx64 " count=%" PRId64,
                      start_gfn, count);
         return -EINVAL;
     }
@@ -251,6 +280,7 @@ static void qemu_s390_skeys_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     skeyclass->skeys_are_enabled = qemu_s390_skeys_are_enabled;
+    skeyclass->enable_skeys = qemu_s390_enable_skeys;
     skeyclass->get_skeys = qemu_s390_skeys_get;
     skeyclass->set_skeys = qemu_s390_skeys_set;
 
@@ -261,7 +291,6 @@ static void qemu_s390_skeys_class_init(ObjectClass *oc, void *data)
 static const TypeInfo qemu_s390_skeys_info = {
     .name          = TYPE_QEMU_S390_SKEYS,
     .parent        = TYPE_S390_SKEYS,
-    .instance_init = qemu_s390_skeys_init,
     .instance_size = sizeof(QEMUS390SKeysState),
     .class_init    = qemu_s390_skeys_class_init,
     .class_size    = sizeof(S390SKeysClass),
@@ -341,6 +370,14 @@ static int s390_storage_keys_load(QEMUFile *f, void *opaque, int version_id)
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
     int ret = 0;
 
+    /*
+     * Make sure to lazy-enable if required to be done explicitly. No need to
+     * flush any TLB as the VM is not running yet.
+     */
+    if (skeyclass->enable_skeys) {
+        skeyclass->enable_skeys(ss);
+    }
+
     while (!ret) {
         ram_addr_t addr;
         int flags;
diff --git a/include/hw/s390x/storage-keys.h b/include/hw/s390x/storage-keys.h
index eb091842c8..aa2ec2aae5 100644
--- a/include/hw/s390x/storage-keys.h
+++ b/include/hw/s390x/storage-keys.h
@@ -28,9 +28,72 @@ struct S390SKeysState {
 
 struct S390SKeysClass {
     DeviceClass parent_class;
+
+    /**
+     * @skeys_are_enabled:
+     *
+     * Check whether storage keys are enabled. If not enabled, they were not
+     * enabled lazily either by the guest via a storage key instruction or
+     * by the host during migration.
+     *
+     * If disabled, everything not explicitly triggered by the guest,
+     * such as outgoing migration or dirty/change tracking, should not touch
+     * storage keys and should not lazily enable it.
+     *
+     * @ks: the #S390SKeysState
+     *
+     * Returns false if not enabled and true if enabled.
+     */
     bool (*skeys_are_enabled)(S390SKeysState *ks);
+
+    /**
+     * @enable_skeys:
+     *
+     * Lazily enable storage keys. If this function is not implemented,
+     * setting a storage key will lazily enable storage keys implicitly
+     * instead. TCG guests have to make sure to flush the TLB of all CPUs
+     * if storage keys were not enabled before this call.
+     *
+     * @ks: the #S390SKeysState
+     *
+     * Returns false if not enabled before this call, and true if already
+     * enabled.
+     */
+    bool (*enable_skeys)(S390SKeysState *ks);
+
+    /**
+     * @get_skeys:
+     *
+     * Get storage keys for the given PFN range. This call will fail if
+     * storage keys have not been lazily enabled yet.
+     *
+     * Callers have to validate that a GFN is valid before this call.
+     *
+     * @ks: the #S390SKeysState
+     * @start_gfn: the start GFN to get storage keys for
+     * @count: the number of storage keys to get
+     * @keys: the byte array where storage keys will be stored to
+     *
+     * Returns 0 on success, returns an error if getting a storage key failed.
+     */
     int (*get_skeys)(S390SKeysState *ks, uint64_t start_gfn, uint64_t count,
                      uint8_t *keys);
+    /**
+     * @set_skeys:
+     *
+     * Set storage keys for the given PFN range. This call will fail if
+     * storage keys have not been lazily enabled yet and implicit
+     * enablement is not supported.
+     *
+     * Callers have to validate that a GFN is valid before this call.
+     *
+     * @ks: the #S390SKeysState
+     * @start_gfn: the start GFN to set storage keys for
+     * @count: the number of storage keys to set
+     * @keys: the byte array where storage keys will be read from
+     *
+     * Returns 0 on success, returns an error if setting a storage key failed.
+     */
     int (*set_skeys)(S390SKeysState *ks, uint64_t start_gfn, uint64_t count,
                      uint8_t *keys);
 };
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index e2b372efd9..b04b57c235 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -313,6 +313,14 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
         skeyclass = S390_SKEYS_GET_CLASS(ss);
     }
 
+    /*
+     * Don't enable storage keys if they are still disabled, i.e., no actual
+     * storage key instruction was issued yet.
+     */
+    if (!skeyclass->skeys_are_enabled(ss)) {
+        return;
+    }
+
     /*
      * Whenever we create a new TLB entry, we set the storage key reference
      * bit. In case we allow write accesses, we set the storage key change
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 4f9f3e1f63..0bf775a37d 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2186,6 +2186,9 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
     if (unlikely(!ss)) {
         ss = s390_get_skeys_device();
         skeyclass = S390_SKEYS_GET_CLASS(ss);
+        if (skeyclass->enable_skeys && !skeyclass->enable_skeys(ss)) {
+            tlb_flush_all_cpus_synced(env_cpu(env));
+        }
     }
 
     rc = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
@@ -2213,6 +2216,9 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
     if (unlikely(!ss)) {
         ss = s390_get_skeys_device();
         skeyclass = S390_SKEYS_GET_CLASS(ss);
+        if (skeyclass->enable_skeys && !skeyclass->enable_skeys(ss)) {
+            tlb_flush_all_cpus_synced(env_cpu(env));
+        }
     }
 
     key = r1 & 0xfe;
@@ -2244,6 +2250,9 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     if (unlikely(!ss)) {
         ss = s390_get_skeys_device();
         skeyclass = S390_SKEYS_GET_CLASS(ss);
+        if (skeyclass->enable_skeys && !skeyclass->enable_skeys(ss)) {
+            tlb_flush_all_cpus_synced(env_cpu(env));
+        }
     }
 
     rc = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
-- 
2.27.0


