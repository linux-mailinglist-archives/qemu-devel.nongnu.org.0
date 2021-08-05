Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4193E182E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:38:36 +0200 (CEST)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfS8-0004DU-1W
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIs-0008AY-SA
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBfIq-0006hP-SU
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628177340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozgRCk7/GehiGafSvgo/OixGhLxJ6JOZHiH9cRAyBuQ=;
 b=X0+ciFb1qGISOrgGSWQlB7ecGn9/TYyPuCatHbSzx/43P2Ow7lVOFtzbMRABI45DSmiKeJ
 y8l/DycxemMlwnyqwN36JGB0BMuQmo1+/5MKEY3Y+7XYjnP95V7VUb15K8kLAIP4vukcmZ
 V4fY5xAVW1tR8NhYB0L5/qtNiWIgXA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-fhibWDGaMQOjNnXnD5ktBg-1; Thu, 05 Aug 2021 11:28:59 -0400
X-MC-Unique: fhibWDGaMQOjNnXnD5ktBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AA9E1006C80;
 Thu,  5 Aug 2021 15:28:57 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3642C3CC7;
 Thu,  5 Aug 2021 15:28:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/12] hw/s390x/s390-skeys: lazy storage key enablement
 under TCG
Date: Thu,  5 Aug 2021 17:28:04 +0200
Message-Id: <20210805152804.100333-13-david@redhat.com>
In-Reply-To: <20210805152804.100333-1-david@redhat.com>
References: <20210805152804.100333-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/s390x/s390-skeys.c           | 51 +++++++++++++++++++++-----
 include/hw/s390x/storage-keys.h | 63 +++++++++++++++++++++++++++++++++
 target/s390x/mmu_helper.c       |  8 +++++
 target/s390x/tcg/mem_helper.c   |  9 +++++
 4 files changed, 123 insertions(+), 8 deletions(-)

diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
index 53e16f1b9c..579bdf1d8a 100644
--- a/hw/s390x/s390-skeys.c
+++ b/hw/s390x/s390-skeys.c
@@ -190,18 +190,45 @@ out:
     fclose(f);
 }
 
-static void qemu_s390_skeys_init(Object *obj)
+static int qemu_s390_skeys_enabled(S390SKeysState *ss)
 {
-    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(obj);
-    MachineState *machine = MACHINE(qdev_get_machine());
+    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
 
-    skeys->key_count = machine->ram_size / TARGET_PAGE_SIZE;
-    skeys->keydata = g_malloc0(skeys->key_count);
+    /* Lockless check is sufficient. */
+    return !!skeys->keydata;
 }
 
-static int qemu_s390_skeys_enabled(S390SKeysState *ss)
+static int qemu_s390_skeys_enable(S390SKeysState *ss)
 {
-    return 1;
+    QEMUS390SKeysState *skeys = QEMU_S390_SKEYS(ss);
+    static gsize initialized;
+
+    if (likely(skeys->keydata)) {
+        return 1;
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
+    return 0;
 }
 
 static int qemu_s390_skeys_set(S390SKeysState *ss, uint64_t start_gfn,
@@ -250,6 +277,7 @@ static void qemu_s390_skeys_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     skeyclass->skeys_enabled = qemu_s390_skeys_enabled;
+    skeyclass->skeys_enable = qemu_s390_skeys_enable;
     skeyclass->get_skeys = qemu_s390_skeys_get;
     skeyclass->set_skeys = qemu_s390_skeys_set;
 
@@ -260,7 +288,6 @@ static void qemu_s390_skeys_class_init(ObjectClass *oc, void *data)
 static const TypeInfo qemu_s390_skeys_info = {
     .name          = TYPE_QEMU_S390_SKEYS,
     .parent        = TYPE_S390_SKEYS,
-    .instance_init = qemu_s390_skeys_init,
     .instance_size = sizeof(QEMUS390SKeysState),
     .class_init    = qemu_s390_skeys_class_init,
     .class_size    = sizeof(S390SKeysClass),
@@ -340,6 +367,14 @@ static int s390_storage_keys_load(QEMUFile *f, void *opaque, int version_id)
     S390SKeysClass *skeyclass = S390_SKEYS_GET_CLASS(ss);
     int ret = 0;
 
+    /*
+     * Make sure to lazy-enable if required to be done explicitly. No need to
+     * flush any TLB as the VM is not running yet.
+     */
+    if (skeyclass->skeys_enable) {
+        skeyclass->skeys_enable(ss);
+    }
+
     while (!ret) {
         ram_addr_t addr;
         int flags;
diff --git a/include/hw/s390x/storage-keys.h b/include/hw/s390x/storage-keys.h
index 2888d42d0b..8b15809716 100644
--- a/include/hw/s390x/storage-keys.h
+++ b/include/hw/s390x/storage-keys.h
@@ -28,9 +28,72 @@ struct S390SKeysState {
 
 struct S390SKeysClass {
     DeviceClass parent_class;
+
+    /**
+     * @skeys_enabled:
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
+     * Returns 0 if not enabled and 1 if enabled.
+     */
     int (*skeys_enabled)(S390SKeysState *ks);
+
+    /**
+     * @skeys_enable:
+     *
+     * Lazily enable storage keys. If this function is not implemented,
+     * setting a storage key will lazily enable storage keys implicitly
+     * instead. TCG guests have to make sure to flush the TLB of all CPUs
+     * if storage keys were not enabled before this call.
+     *
+     * @ks: the #S390SKeysState
+     *
+     * Returns 0 if storage keys were not enabled before this call and 1 if
+     * they were already enabled.
+     */
+    int (*skeys_enable)(S390SKeysState *ks);
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
index 0c2c39a970..41bb256ea8 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -313,6 +313,14 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
         skeyclass = S390_SKEYS_GET_CLASS(ss);
     }
 
+    /*
+     * Don't enable storage keys if they are still disabled, i.e., no actual
+     * storage key instruction was issued yet.
+     */
+    if (!skeyclass->skeys_enabled(ss)) {
+        return;
+    }
+
     /*
      * Whenever we create a new TLB entry, we set the storage key reference
      * bit. In case we allow write accesses, we set the storage key change
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 9c1b9c7d06..0b318c6178 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2186,6 +2186,9 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
     if (unlikely(!ss)) {
         ss = s390_get_skeys_device();
         skeyclass = S390_SKEYS_GET_CLASS(ss);
+        if (skeyclass->skeys_enable && !skeyclass->skeys_enable(ss)) {
+            tlb_flush_all_cpus_synced(env_cpu(env));
+        }
     }
 
     rc = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
@@ -2213,6 +2216,9 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
     if (unlikely(!ss)) {
         ss = s390_get_skeys_device();
         skeyclass = S390_SKEYS_GET_CLASS(ss);
+        if (skeyclass->skeys_enable && !skeyclass->skeys_enable(ss)) {
+            tlb_flush_all_cpus_synced(env_cpu(env));
+        }
     }
 
     key = r1 & 0xfe;
@@ -2245,6 +2251,9 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
     if (unlikely(!ss)) {
         ss = s390_get_skeys_device();
         skeyclass = S390_SKEYS_GET_CLASS(ss);
+        if (skeyclass->skeys_enable && !skeyclass->skeys_enable(ss)) {
+            tlb_flush_all_cpus_synced(env_cpu(env));
+        }
     }
 
     rc = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
-- 
2.31.1


