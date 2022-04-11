Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6894FB463
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 09:10:36 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndoC3-0007Pa-Gw
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 03:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo11-0008OL-V3
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo10-00076s-AJ
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvDhijDYqHS0XYn4GNOx/lJXFpjH0PMuUN97yxxGGRY=;
 b=JKgM0RureOa/rGOyVcqiPDI2HkYa/yGKI6xYjL651meD8G//0a90Nr9CL6M/ZmdYKreSbB
 zDF9LPVLDJO6ch9LnR/+f41kUuxV55rT0PjEWKvulCGmMKZXQpQmI9dDlG/ULpUIspWCig
 dYcIrvsqhAPyZO4Klu9/4j2EKPmznn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-wsi95zUcNcqt7nTWpmNhhw-1; Mon, 11 Apr 2022 02:59:05 -0400
X-MC-Unique: wsi95zUcNcqt7nTWpmNhhw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CA703C14101;
 Mon, 11 Apr 2022 06:59:05 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED4824029AD;
 Mon, 11 Apr 2022 06:59:00 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/5] target/arm/hvf: Indirect addressing for coprocessor
 register storage
Date: Mon, 11 Apr 2022 14:58:39 +0800
Message-Id: <20220411065842.63880-3-gshan@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 target/arm/hvf/hvf.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8c34f86792..8cca26a59c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -334,6 +334,7 @@ int hvf_get_registers(CPUState *cpu)
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
     hv_return_t ret;
+    uint32_t value_index;
     uint64_t val;
     hv_simd_fp_uchar16_t fpval;
     int i;
@@ -373,7 +374,8 @@ int hvf_get_registers(CPUState *cpu)
         ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
         assert_hvf_ok(ret);
 
-        arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
+        value_index = arm_cpu->cpreg_value_indexes[hvf_sreg_match[i].cp_idx];
+        arm_cpu->cpreg_values[value_index] = val;
     }
     assert(write_list_to_cpustate(arm_cpu));
 
@@ -387,6 +389,7 @@ int hvf_put_registers(CPUState *cpu)
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
     hv_return_t ret;
+    uint32_t value_index;
     uint64_t val;
     hv_simd_fp_uchar16_t fpval;
     int i;
@@ -421,7 +424,8 @@ int hvf_put_registers(CPUState *cpu)
             continue;
         }
 
-        val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
+        value_index = arm_cpu->cpreg_value_indexes[hvf_sreg_match[i].cp_idx];
+        val = arm_cpu->cpreg_values[value_index];
         ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, val);
         assert_hvf_ok(ret);
     }
@@ -573,12 +577,18 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                                      sregs_match_len);
     arm_cpu->cpreg_values = g_renew(uint64_t, arm_cpu->cpreg_values,
                                     sregs_match_len);
+    arm_cpu->cpreg_value_indexes =
+        g_renew(uint32_t, arm_cpu->cpreg_value_indexes,
+                sregs_match_len);
     arm_cpu->cpreg_vmstate_indexes = g_renew(uint64_t,
                                              arm_cpu->cpreg_vmstate_indexes,
                                              sregs_match_len);
     arm_cpu->cpreg_vmstate_values = g_renew(uint64_t,
                                             arm_cpu->cpreg_vmstate_values,
                                             sregs_match_len);
+    arm_cpu->cpreg_vmstate_value_indexes =
+        g_renew(uint32_t, arm_cpu->cpreg_vmstate_value_indexes,
+                sregs_match_len);
 
     memset(arm_cpu->cpreg_values, 0, sregs_match_len * sizeof(uint64_t));
 
@@ -591,13 +601,17 @@ int hvf_arch_init_vcpu(CPUState *cpu)
         if (ri) {
             assert(!(ri->type & ARM_CP_NO_RAW));
             hvf_sreg_match[i].cp_idx = sregs_cnt;
-            arm_cpu->cpreg_indexes[sregs_cnt++] = cpreg_to_kvm_id(key);
+            arm_cpu->cpreg_indexes[sregs_cnt] = cpreg_to_kvm_id(key);
+            arm_cpu->cpreg_value_indexes[sregs_cnt] = sregs_cnt;
+            sregs_cnt++;
         } else {
             hvf_sreg_match[i].cp_idx = -1;
         }
     }
     arm_cpu->cpreg_array_len = sregs_cnt;
+    arm_cpu->cpreg_value_array_len = sregs_cnt;
     arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
+    arm_cpu->cpreg_vmstate_value_array_len = sregs_cnt;
 
     assert(write_cpustate_to_list(arm_cpu, false));
 
-- 
2.23.0


