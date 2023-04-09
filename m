Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42096DC066
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:43:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plWFz-0005Qn-ND; Sun, 09 Apr 2023 10:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hoo.linux@gmail.com>)
 id 1plWE1-0003eU-G7
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:41:02 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.hoo.linux@gmail.com>)
 id 1plWDz-0000fu-BR
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:41:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id j8so353928pjy.4
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681051257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hZQ5EbAGhVUB35LozcJIt4zsyAn0UnxD9yILop/3N5I=;
 b=B1yQSANJ70L0d2eOZgBZqFwmQUy2m97CSJmcmtymMzsS2Ge2Z9hAL3Sc+01PlKXzbd
 RtMhlG6HJDv2tooJHsg1Gf2fohRIikXrSuAkwDOoEC2MqCzCYE4YJwMQjkNo4mmHz4wL
 w5P8JlneIbwv2OI8awP4nwlFz33177Jn3YFt9BJii61tnngTgEgMlnHh1PVPh/DTKUAn
 o3zvQkQM0hfD9QwbFwDWriv7LVUQYUxoOQg1v6ZRp52itbU+oPgyKvxSXsJHUrzFlYYI
 H7yAt5Uvl9Byhfi/T2YNY+nrc6KDWJRwkEsi1bwgzfptfMbYCQ8AIhE4tWI1m5ERQ/Uf
 jpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681051257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hZQ5EbAGhVUB35LozcJIt4zsyAn0UnxD9yILop/3N5I=;
 b=p7jRr0bARDhM9QhubWu1uIgNvdgY+3nlnrLIY2FBxaGOlN+PfbWA2uRjwcAcJxgTLQ
 7dI3hFnky2oT5LnjNANP5R0w91ouaFSBeE03KfiS8p5M/G47DFKHbJkhdVjk10bwX3Z/
 nbW3+nS126kqA+/oRFFBVmULLVpjzP+VRgfiNI4oSnYgqShx0DEMsTpPmIa8Epo45y/w
 99yIf1LZDUqBTIHAnJHMpJZf2l6zteQD41BRW9v8rNbviufIoC6OsnZf2XOjXtuy0Noa
 SbNd+N3mzrTkKQNF4Elm6447vtFhNuvBdKHDg2t8SCMaZTZ88NfvxDZjuui9HVWIaL2+
 uzQQ==
X-Gm-Message-State: AAQBX9cdpXGDqZkcJ1vgwU5jhHClIoHGQcKontL3PXSYp6FT1VjSUEmq
 /1DDKwODV3Mo+p9BUcynDXc=
X-Google-Smtp-Source: AKy350bSdWGYsomWLOvkF1ydjNA3B5cc22wo8klZe60C+vcJqWYg7martpVIXesGgfYFDdrsdGdHpg==
X-Received: by 2002:a17:902:e292:b0:1a0:75fe:cd66 with SMTP id
 o18-20020a170902e29200b001a075fecd66mr8094439plc.50.1681051257374; 
 Sun, 09 Apr 2023 07:40:57 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-18-162-55-96.ap-east-1.compute.amazonaws.com. [18.162.55.96])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a1709028f9800b0019aeddce6casm4371185plo.205.2023.04.09.07.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 07:40:57 -0700 (PDT)
From: Robert Hoo <robert.hoo.linux@gmail.com>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: Robert Hoo <robert.hoo.linux@gmail.com>
Subject: [PATCH] accel/kvm: Don't use KVM maximum support number to alloc user
 memslots
Date: Sun,  9 Apr 2023 22:40:15 +0800
Message-Id: <20230409144015.1610-1-robert.hoo.linux@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=robert.hoo.linux@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 Apr 2023 10:43:01 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch corrects QEMU to properly use what KVM_CAP_NR_MEMSLOTS means,
i.e. the maximum user memslots KVM supports.
1. Rename KVMState::nr_slots --> max_slots.
2. Remember nr_slots in each KML. This also decouples each KML, e.g. x86's
   two KMLs don't need to have same size of slots[].
3. Change back initial slot[] size to 32, increase it dynamically
   (exponentially) until the maximum number KVM supports. 32 should suites
   almost all normal guests.

Background:
Since KVM commit 4fc096a99e01d ("KVM: Raise the maximum number of user
memslots"), KVM_CAP_NR_MEMSLOTS returns 32764 (SHRT_MAX - 3), which is a
huge increase from previous 509 (x86). This change based on the fact that
KVM alloc memslots dynamically. But QEMU allocates that huge number of user
memslots statically. This is indeed unwanted by both sides. It makes:

1. Memory waste. Allocates (SHRT_MAX - 3) * sizeof(KVMSlot), while a
typical VM needs far less, e.g. my VM just reached 9th as the highest mem
slot ever used. x86 further, has 2 kmls.
2. Time waste. Several KML Slot functions go through the whole
KML::slots[], (SHRT_MAX - 3) makes it far longer than necessary, e.g.
kvm_lookup_matching_slot(), kvm_physical_memory_addr_from_host(),
kvm_physical_log_clear(), kvm_log_sync_global().

Test:
Temporarily set KVM_DEF_NR_SLOTS = 8, let it go through slot[] dynamic
increase, VM launched and works well.

Signed-off-by: Robert Hoo <robert.hoo.linux@gmail.com>
---
 accel/kvm/kvm-all.c      | 57 +++++++++++++++++++++++++++++-----------
 include/sysemu/kvm_int.h |  4 ++-
 2 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index cf3a88d90e..708170139c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -178,22 +178,50 @@ int kvm_get_max_memslots(void)
 {
     KVMState *s = KVM_STATE(current_accel());
 
-    return s->nr_slots;
+    return s->max_slots;
 }
 
-/* Called with KVMMemoryListener.slots_lock held */
+/* Called with kvm_slots_lock()'ed */
 static KVMSlot *kvm_get_free_slot(KVMMemoryListener *kml)
 {
     KVMState *s = kvm_state;
+    KVMSlot *new_slots;
     int i;
+    int new_nr, old_nr;
 
-    for (i = 0; i < s->nr_slots; i++) {
+    for (i = 0; i < kml->nr_slots; i++) {
         if (kml->slots[i].memory_size == 0) {
             return &kml->slots[i];
         }
     }
 
-    return NULL;
+    /* Already reached maximum, no more can expand */
+    if (kml->nr_slots >= s->max_slots) {
+        return NULL;
+    }
+
+    new_nr = 2 * kml->nr_slots;
+    new_nr = MIN(new_nr, s->max_slots);
+    /* It might overflow */
+    if (new_nr < 0 || new_nr <= kml->nr_slots) {
+        return NULL;
+    }
+
+    new_slots = g_try_new0(KVMSlot, new_nr);
+    if (!new_slots) {
+        return NULL;
+    }
+
+    memcpy(new_slots, kml->slots, kml->nr_slots * sizeof(KVMSlot));
+    old_nr = kml->nr_slots;
+    kml->nr_slots = new_nr;
+    g_free(kml->slots);
+    kml->slots = new_slots;
+    for (i = old_nr; i < kml->nr_slots; i++) {
+        kml->slots[i].slot = i;
+    }
+
+    return &kml->slots[old_nr];
 }
 
 bool kvm_has_free_slot(MachineState *ms)
@@ -226,10 +254,9 @@ static KVMSlot *kvm_lookup_matching_slot(KVMMemoryListener *kml,
                                          hwaddr start_addr,
                                          hwaddr size)
 {
-    KVMState *s = kvm_state;
     int i;
 
-    for (i = 0; i < s->nr_slots; i++) {
+    for (i = 0; i < kml->nr_slots; i++) {
         KVMSlot *mem = &kml->slots[i];
 
         if (start_addr == mem->start_addr && size == mem->memory_size) {
@@ -271,7 +298,7 @@ int kvm_physical_memory_addr_from_host(KVMState *s, void *ram,
     int i, ret = 0;
 
     kvm_slots_lock();
-    for (i = 0; i < s->nr_slots; i++) {
+    for (i = 0; i < kml->nr_slots; i++) {
         KVMSlot *mem = &kml->slots[i];
 
         if (ram >= mem->ram && ram < mem->ram + mem->memory_size) {
@@ -1002,7 +1029,7 @@ static int kvm_physical_log_clear(KVMMemoryListener *kml,
 
     kvm_slots_lock();
 
-    for (i = 0; i < s->nr_slots; i++) {
+    for (i = 0; i < kml->nr_slots; i++) {
         mem = &kml->slots[i];
         /* Discard slots that are empty or do not overlap the section */
         if (!mem->memory_size ||
@@ -1566,7 +1593,6 @@ static void kvm_log_sync(MemoryListener *listener,
 static void kvm_log_sync_global(MemoryListener *l)
 {
     KVMMemoryListener *kml = container_of(l, KVMMemoryListener, listener);
-    KVMState *s = kvm_state;
     KVMSlot *mem;
     int i;
 
@@ -1578,7 +1604,7 @@ static void kvm_log_sync_global(MemoryListener *l)
      * only a few used slots (small VMs).
      */
     kvm_slots_lock();
-    for (i = 0; i < s->nr_slots; i++) {
+    for (i = 0; i < kml->nr_slots; i++) {
         mem = &kml->slots[i];
         if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
             kvm_slot_sync_dirty_pages(mem);
@@ -1687,10 +1713,11 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
 {
     int i;
 
-    kml->slots = g_new0(KVMSlot, s->nr_slots);
+    kml->slots = g_new0(KVMSlot, KVM_DEF_NR_SLOTS);
+    kml->nr_slots = KVM_DEF_NR_SLOTS;
     kml->as_id = as_id;
 
-    for (i = 0; i < s->nr_slots; i++) {
+    for (i = 0; i < kml->nr_slots; i++) {
         kml->slots[i].slot = i;
     }
 
@@ -2427,11 +2454,11 @@ static int kvm_init(MachineState *ms)
     }
 
     kvm_immediate_exit = kvm_check_extension(s, KVM_CAP_IMMEDIATE_EXIT);
-    s->nr_slots = kvm_check_extension(s, KVM_CAP_NR_MEMSLOTS);
+    s->max_slots = kvm_check_extension(s, KVM_CAP_NR_MEMSLOTS);
 
     /* If unspecified, use the default value */
-    if (!s->nr_slots) {
-        s->nr_slots = 32;
+    if (s->max_slots <= 0) {
+        s->max_slots = KVM_DEF_NR_SLOTS;
     }
 
     s->nr_as = kvm_check_extension(s, KVM_CAP_MULTI_ADDRESS_SPACE);
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index a641c974ea..38297ae366 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -37,8 +37,10 @@ typedef struct KVMMemoryUpdate {
     MemoryRegionSection section;
 } KVMMemoryUpdate;
 
+#define KVM_DEF_NR_SLOTS 32
 typedef struct KVMMemoryListener {
     MemoryListener listener;
+    int nr_slots;
     KVMSlot *slots;
     int as_id;
     QSIMPLEQ_HEAD(, KVMMemoryUpdate) transaction_add;
@@ -69,7 +71,7 @@ struct KVMState
 {
     AccelState parent_obj;
 
-    int nr_slots;
+    int max_slots;
     int fd;
     int vmfd;
     int coalesced_mmio;

base-commit: c6f3cbca32bde9ee94d9949aa63e8a7ef2d7bc5b
-- 
2.31.1


