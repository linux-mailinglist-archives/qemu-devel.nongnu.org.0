Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFD4FB46B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 09:14:38 +0200 (CEST)
Received: from localhost ([::1]:58066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndoFs-0002LM-3h
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 03:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo17-0000DK-8V
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo14-00077L-HQ
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gny9dwMz29Kkjo+gzDLlsFFvN9RIIvPV3i4WkFwjFKY=;
 b=T1gvel5lj8qlhWk3DwQLTkzGj7OJ9QqclwakRCl0KK+NjSoax8HVqpjQE0MCEmnllLYGKJ
 hcNh40KwB7HAXDPgKhC5Rt0am/BZjAp+3hh8FY0IugBASq1z4fgzBgl0zEV58Dk2YwNHWL
 aXBmLkaItgofBBfx+pQsyIkQNnlXxJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-aIDmxVv2PrSbsIZfPOOHsA-1; Mon, 11 Apr 2022 02:59:10 -0400
X-MC-Unique: aIDmxVv2PrSbsIZfPOOHsA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F58D80005D;
 Mon, 11 Apr 2022 06:59:10 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06CDF4029AD;
 Mon, 11 Apr 2022 06:59:05 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 3/5] target/arm/kvm: Indirect addressing for coprocessor
 register storage
Date: Mon, 11 Apr 2022 14:58:40 +0800
Message-Id: <20220411065842.63880-4-gshan@redhat.com>
In-Reply-To: <20220411065842.63880-1-gshan@redhat.com>
References: <20220411065842.63880-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, agraf@csgraf.de,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to what we did for TCG, this uses @cpreg_value_indexes[] to
track the storage space for the corresponding coprocessor register.
As all coprocessor register have fixed 8 bytes storage space, so
the indirect and direct addressing mechanisms can co-exist and
interchangeable, even in migration circumstance.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/kvm.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index bbf1ce7ba3..5d1ce431b0 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -429,12 +429,14 @@ static int compare_u64(const void *a, const void *b)
 static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
 {
     uint64_t *res;
+    uint32_t value_index;
 
     res = bsearch(&regidx, cpu->cpreg_indexes, cpu->cpreg_array_len,
                   sizeof(uint64_t), compare_u64);
     assert(res);
 
-    return &cpu->cpreg_values[res - cpu->cpreg_indexes];
+    value_index = cpu->cpreg_value_indexes[res - cpu->cpreg_indexes];
+    return &cpu->cpreg_values[value_index];
 }
 
 /* Initialize the ARMCPU cpreg list according to the kernel's
@@ -445,7 +447,7 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
 {
     struct kvm_reg_list rl;
     struct kvm_reg_list *rlp;
-    int i, ret, arraylen;
+    int i, ret, arraylen, value_arraylen;
     CPUState *cs = CPU(cpu);
 
     rl.n = 0;
@@ -464,7 +466,7 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
      */
     qsort(&rlp->reg, rlp->n, sizeof(rlp->reg[0]), compare_u64);
 
-    for (i = 0, arraylen = 0; i < rlp->n; i++) {
+    for (i = 0, arraylen = 0, value_arraylen = 0; i < rlp->n; i++) {
         if (!kvm_arm_reg_syncs_via_cpreg_list(rlp->reg[i])) {
             continue;
         }
@@ -479,26 +481,36 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         }
 
         arraylen++;
+        value_arraylen++;
     }
 
     cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
-    cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, arraylen);
+    cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, value_arraylen);
+    cpu->cpreg_value_indexes = g_renew(uint32_t, cpu->cpreg_value_indexes,
+                                       arraylen);
     cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
                                          arraylen);
     cpu->cpreg_vmstate_values = g_renew(uint64_t, cpu->cpreg_vmstate_values,
-                                        arraylen);
+                                        value_arraylen);
+    cpu->cpreg_vmstate_value_indexes =
+        g_renew(uint32_t, cpu->cpreg_vmstate_value_indexes, arraylen);
     cpu->cpreg_array_len = arraylen;
+    cpu->cpreg_value_array_len = value_arraylen;
     cpu->cpreg_vmstate_array_len = arraylen;
+    cpu->cpreg_vmstate_value_array_len = value_arraylen;
 
-    for (i = 0, arraylen = 0; i < rlp->n; i++) {
+    for (i = 0, arraylen = 0, value_arraylen = 0; i < rlp->n; i++) {
         uint64_t regidx = rlp->reg[i];
         if (!kvm_arm_reg_syncs_via_cpreg_list(regidx)) {
             continue;
         }
         cpu->cpreg_indexes[arraylen] = regidx;
+        cpu->cpreg_value_indexes[arraylen] = value_arraylen;
         arraylen++;
+        value_arraylen++;
     }
     assert(cpu->cpreg_array_len == arraylen);
+    assert(cpu->cpreg_value_array_len == value_arraylen);
 
     if (!write_kvmstate_to_list(cpu)) {
         /* Shouldn't happen unless kernel is inconsistent about
@@ -533,11 +545,12 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
             r.addr = (uintptr_t)&v32;
             ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
             if (!ret) {
-                cpu->cpreg_values[i] = v32;
+                cpu->cpreg_values[cpu->cpreg_value_indexes[i]] = v32;
             }
             break;
         case KVM_REG_SIZE_U64:
-            r.addr = (uintptr_t)(cpu->cpreg_values + i);
+            r.addr = (uintptr_t)(cpu->cpreg_values +
+                                 cpu->cpreg_value_indexes[i]);
             ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
             break;
         default:
@@ -569,11 +582,12 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
         r.id = regidx;
         switch (regidx & KVM_REG_SIZE_MASK) {
         case KVM_REG_SIZE_U32:
-            v32 = cpu->cpreg_values[i];
+            v32 = cpu->cpreg_values[cpu->cpreg_value_indexes[i]];
             r.addr = (uintptr_t)&v32;
             break;
         case KVM_REG_SIZE_U64:
-            r.addr = (uintptr_t)(cpu->cpreg_values + i);
+            r.addr = (uintptr_t)(cpu->cpreg_values +
+                                 cpu->cpreg_value_indexes[i]);
             break;
         default:
             abort();
-- 
2.23.0


