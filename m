Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B7C516C16
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 10:34:23 +0200 (CEST)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlRVe-0003Fd-1k
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 04:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlRNe-0000NT-5O
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlRNc-0004mD-7q
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651479963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hX8AOsfCmCWINRrXluzEmAGUgLsbFqyw+RaR1sSekHE=;
 b=CBdFSXVa3v5Cu5P7t2YI0IWl9MCiY+XIydSgszlzAmcY+LjJDDMcGlZSOMXJpdDL9OaoVm
 b5t7oCyW0E+U4utSuhop1et4UUHaUd2eZuqYHOCz083mPb+DnsrNRdRXZeAApwVDTxnzoL
 a6suKUvmu1YqipdRJK4spzInVRHPtsw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-HZ4rbXr6MWKqE-n8v3K6MQ-1; Mon, 02 May 2022 04:26:02 -0400
X-MC-Unique: HZ4rbXr6MWKqE-n8v3K6MQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED2FF29AB405;
 Mon,  2 May 2022 08:26:01 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0700B407E1C0;
 Mon,  2 May 2022 08:26:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH] target/s390x: Check storage keys in the TPROT instruction
Date: Mon,  2 May 2022 10:25:59 +0200
Message-Id: <20220502082559.76167-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TPROT allows to specify an access key that should be used for checking
with the storage key of the destination page, to see whether an access
is allowed or not. Honor this storage key checking now in the emulated
TPROT instruction, too.

Since we need the absolute address of the page (for getting the storage
key), we are now also calling mmu_translate() directly instead of
going via s390_cpu_virt_mem_check_write/read() - since we're only
interested in one page, and since mmu_translate() does not try to inject
excetions directly (it reports them via the return code instead), this
is likely the better function to use in TPROT anyway.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 This fixes the new TPROT-related storage key checks in this new
 kvm-unit-tests patch:
 https://lore.kernel.org/kvm/20220425161731.1575742-1-scgl@linux.ibm.com/

 target/s390x/cpu.h            |  1 +
 target/s390x/tcg/mem_helper.c | 61 ++++++++++++++++++++++++++++-------
 2 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..348950239f 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -328,6 +328,7 @@ extern const VMStateDescription vmstate_s390_cpu;
 /* Control register 0 bits */
 #define CR0_LOWPROT             0x0000000010000000ULL
 #define CR0_SECONDARY           0x0000000004000000ULL
+#define CR0_STOR_PROT_OVERRIDE  0x0000000001000000ULL
 #define CR0_EDAT                0x0000000000800000ULL
 #define CR0_AFP                 0x0000000000040000ULL
 #define CR0_VECTOR              0x0000000000020000ULL
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index fc52aa128b..1e0309bbe8 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2141,43 +2141,80 @@ uint32_t HELPER(testblock)(CPUS390XState *env, uint64_t real_addr)
     return 0;
 }
 
+static uint8_t get_skey(target_ulong real_addr)
+{
+    static S390SKeysClass *skeyclass;
+    static S390SKeysState *skeystate;
+    uint8_t skey = 0;
+
+    if (unlikely(!skeystate)) {
+        skeystate = s390_get_skeys_device();
+        skeyclass = S390_SKEYS_GET_CLASS(skeystate);
+    }
+
+    if (skeyclass->skeys_are_enabled(skeystate)) {
+        skeyclass->get_skeys(skeystate, real_addr / TARGET_PAGE_SIZE, 1, &skey);
+    }
+
+    return skey;
+}
+
 uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
 {
     S390CPU *cpu = env_archcpu(env);
-    CPUState *cs = env_cpu(env);
+    const int tp_acc = (a2 & SK_ACC_MASK) >> 4;
+    uint8_t skey;
+    int acc, pgm_code, pflags;
+    target_ulong abs_addr;
+    uint64_t asc = cpu->env.psw.mask & PSW_MASK_ASC;
+    uint64_t tec;
 
     /*
      * TODO: we currently don't handle all access protection types
-     * (including access-list and key-controlled) as well as AR mode.
+     * (including access-list) as well as AR mode.
      */
-    if (!s390_cpu_virt_mem_check_write(cpu, a1, 0, 1)) {
-        /* Fetching permitted; storing permitted */
+    pgm_code = mmu_translate(env, a1, true, asc, &abs_addr, &pflags, &tec);
+    if (!pgm_code) {
+        /* Fetching permitted; storing permitted - but still check skeys */
+        skey = get_skey(abs_addr);
+        acc = (skey & SK_ACC_MASK) >> 4;
+        if (tp_acc != 0 && tp_acc != acc &&
+            !((env->cregs[0] & CR0_STOR_PROT_OVERRIDE) && acc == 9)) {
+            if (skey & SK_F) {
+                return 2;
+            } else {
+                return 1;
+            }
+        }
         return 0;
     }
 
-    if (env->int_pgm_code == PGM_PROTECTION) {
+    if (pgm_code == PGM_PROTECTION) {
         /* retry if reading is possible */
-        cs->exception_index = -1;
-        if (!s390_cpu_virt_mem_check_read(cpu, a1, 0, 1)) {
+        pgm_code = mmu_translate(env, a1, false, asc, &abs_addr, &pflags, &tec);
+        if (!pgm_code) {
             /* Fetching permitted; storing not permitted */
+            skey = get_skey(abs_addr);
+            acc = (skey & SK_ACC_MASK) >> 4;
+            if ((skey & SK_F) && tp_acc != 0 && tp_acc != acc &&
+                !((env->cregs[0] & CR0_STOR_PROT_OVERRIDE) && acc == 9)) {
+                return 2;
+            }
             return 1;
         }
     }
 
-    switch (env->int_pgm_code) {
+    switch (pgm_code) {
     case PGM_PROTECTION:
         /* Fetching not permitted; storing not permitted */
-        cs->exception_index = -1;
         return 2;
     case PGM_ADDRESSING:
     case PGM_TRANS_SPEC:
         /* exceptions forwarded to the guest */
-        s390_cpu_virt_mem_handle_exc(cpu, GETPC());
-        return 0;
+        tcg_s390_program_interrupt(env, pgm_code, GETPC());
     }
 
     /* Translation not available */
-    cs->exception_index = -1;
     return 3;
 }
 
-- 
2.27.0


