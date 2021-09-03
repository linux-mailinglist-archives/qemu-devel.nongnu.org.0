Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635A4002C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:59:50 +0200 (CEST)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBbZ-0000qo-Eo
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXX-0000Wg-NZ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMBXV-0000Iu-Qp
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EKSvfu48NUed71hO7DcQnPxAfzEbQhk70Fn+7GGHcYY=;
 b=O95meegak9/ecFCr1o2ILyf+Rl6MpAqdWIaFLVtJAdE99jPoL8nfF4yUz1RQBV5p5BbpWt
 wQXUS2WZl16CM5Sahu80Nob44yNTyfzSoAMamn74O6KdrPPrw/bU81wQLp7d+hFcIyy5YS
 NEJ7kGap37p6z8hfw3mNO4OTigi3FUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-dui9xDT8OH6JOCzVKFzaFA-1; Fri, 03 Sep 2021 11:55:34 -0400
X-MC-Unique: dui9xDT8OH6JOCzVKFzaFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB9284A5E0;
 Fri,  3 Sep 2021 15:55:33 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B58860861;
 Fri,  3 Sep 2021 15:55:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] s390x/tcg: check for addressing exceptions for RRBE,
 SSKE and ISKE
Date: Fri,  3 Sep 2021 17:55:05 +0200
Message-Id: <20210903155514.44772-5-david@redhat.com>
In-Reply-To: <20210903155514.44772-1-david@redhat.com>
References: <20210903155514.44772-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's replace the ram_size check by a proper physical address space
check (for example, to prepare for memory hotplug), trigger addressing
exceptions and trace the return value of the storage key getter/setter.

Provide an helper mmu_absolute_addr_valid() to be used in other context
soon. Always test for "read" instead of "write" as we are not actually
modifying the page itself.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h         |  6 +++---
 target/s390x/mmu_helper.c     |  8 ++++++++
 target/s390x/s390x-internal.h |  1 +
 target/s390x/tcg/mem_helper.c | 36 ++++++++++++++++++++++-------------
 4 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 6215ca00bc..271b081e8c 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -336,9 +336,9 @@ DEF_HELPER_FLAGS_4(stctl, TCG_CALL_NO_WG, void, env, i32, i64, i32)
 DEF_HELPER_FLAGS_4(stctg, TCG_CALL_NO_WG, void, env, i32, i64, i32)
 DEF_HELPER_FLAGS_2(testblock, TCG_CALL_NO_WG, i32, env, i64)
 DEF_HELPER_FLAGS_3(tprot, TCG_CALL_NO_WG, i32, env, i64, i64)
-DEF_HELPER_FLAGS_2(iske, TCG_CALL_NO_RWG_SE, i64, env, i64)
-DEF_HELPER_FLAGS_3(sske, TCG_CALL_NO_RWG, void, env, i64, i64)
-DEF_HELPER_FLAGS_2(rrbe, TCG_CALL_NO_RWG, i32, env, i64)
+DEF_HELPER_2(iske, i64, env, i64)
+DEF_HELPER_3(sske, void, env, i64, i64)
+DEF_HELPER_2(rrbe, i32, env, i64)
 DEF_HELPER_4(mvcs, i32, env, i64, i64, i64)
 DEF_HELPER_4(mvcp, i32, env, i64, i64, i64)
 DEF_HELPER_4(sigp, i32, env, i64, i32, i32)
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index d779a9fc51..0620b1803e 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -94,6 +94,14 @@ target_ulong mmu_real2abs(CPUS390XState *env, target_ulong raddr)
     return raddr;
 }
 
+bool mmu_absolute_addr_valid(target_ulong addr, bool is_write)
+{
+    return address_space_access_valid(&address_space_memory,
+                                      addr & TARGET_PAGE_MASK,
+                                      TARGET_PAGE_SIZE, is_write,
+                                      MEMTXATTRS_UNSPECIFIED);
+}
+
 static inline bool read_table_entry(CPUS390XState *env, hwaddr gaddr,
                                     uint64_t *entry)
 {
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 5506f185e8..d246d26b04 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -373,6 +373,7 @@ void probe_write_access(CPUS390XState *env, uint64_t addr, uint64_t len,
 
 
 /* mmu_helper.c */
+bool mmu_absolute_addr_valid(target_ulong addr, bool is_write);
 int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
                   target_ulong *raddr, int *flags, uint64_t *tec);
 int mmu_translate_real(CPUS390XState *env, target_ulong raddr, int rw,
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index dd506d8d17..a44a107374 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -28,6 +28,7 @@
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 #include "tcg/tcg.h"
+#include "trace.h"
 
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/storage-keys.h"
@@ -2171,15 +2172,15 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
 /* insert storage key extended */
 uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
+    int rc;
 
     addr = mmu_real2abs(env, addr);
-    if (addr > ms->ram_size) {
-        return 0;
+    if (!mmu_absolute_addr_valid(addr, false)) {
+        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
     }
 
     if (unlikely(!ss)) {
@@ -2187,7 +2188,9 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
         skeyclass = S390_SKEYS_GET_CLASS(ss);
     }
 
-    if (skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
+    rc = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
+    if (rc) {
+        trace_get_skeys_nonzero(rc);
         return 0;
     }
     return key;
@@ -2196,15 +2199,15 @@ uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
 /* set storage key extended */
 void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint64_t addr = wrap_address(env, r2);
     uint8_t key;
+    int rc;
 
     addr = mmu_real2abs(env, addr);
-    if (addr > ms->ram_size) {
-        return;
+    if (!mmu_absolute_addr_valid(addr, false)) {
+        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
     }
 
     if (unlikely(!ss)) {
@@ -2213,7 +2216,10 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
     }
 
     key = r1 & 0xfe;
-    skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
+    rc = skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
+    if (rc) {
+        trace_set_skeys_nonzero(rc);
+    }
    /*
     * As we can only flush by virtual address and not all the entries
     * that point to a physical address we have to flush the whole TLB.
@@ -2224,15 +2230,15 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
 /* reset reference bit extended */
 uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     uint64_t addr = wrap_address(env, r2);
     static S390SKeysState *ss;
     static S390SKeysClass *skeyclass;
     uint8_t re, key;
+    int rc;
 
     addr = mmu_real2abs(env, addr);
-    if (addr > ms->ram_size) {
-        return 0;
+    if (!mmu_absolute_addr_valid(addr, false)) {
+        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
     }
 
     if (unlikely(!ss)) {
@@ -2240,14 +2246,18 @@ uint32_t HELPER(rrbe)(CPUS390XState *env, uint64_t r2)
         skeyclass = S390_SKEYS_GET_CLASS(ss);
     }
 
-    if (skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
+    rc = skeyclass->get_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
+    if (rc) {
+        trace_get_skeys_nonzero(rc);
         return 0;
     }
 
     re = key & (SK_R | SK_C);
     key &= ~SK_R;
 
-    if (skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key)) {
+    rc = skeyclass->set_skeys(ss, addr / TARGET_PAGE_SIZE, 1, &key);
+    if (rc) {
+        trace_set_skeys_nonzero(rc);
         return 0;
     }
    /*
-- 
2.31.1


