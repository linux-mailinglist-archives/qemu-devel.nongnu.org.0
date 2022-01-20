Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7634952F4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:13:53 +0100 (CET)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAb0R-0008GS-8k
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWbU-0002Au-Me; Thu, 20 Jan 2022 07:31:48 -0500
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAWbR-0000z6-NH; Thu, 20 Jan 2022 07:31:48 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436795|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0540385-0.000931329-0.94503;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfxQutw_1642681900; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfxQutw_1642681900)
 by smtp.aliyun-inc.com(10.147.43.95); Thu, 20 Jan 2022 20:31:40 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 19/23] target/riscv: Adjust vector address with mask
Date: Thu, 20 Jan 2022 20:20:46 +0800
Message-Id: <20220120122050.41546-20-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
References: <20220120122050.41546-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.145; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-145.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: guoren@linux.alibaba.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mask comes from the pointer masking extension, or the max value
corresponding to XLEN bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index efb3129532..020d2e841f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -139,6 +139,11 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
     return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
 
+static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
+{
+    return (addr & env->cur_pmmask) | env->cur_pmbase;
+}
+
 /*
  * This function checks watchpoint before real load operation.
  *
@@ -156,12 +161,12 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
     target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
     target_ulong curlen = MIN(pagelen, len);
 
-    probe_access(env, addr, curlen, access_type,
+    probe_access(env, adjust_addr(env, addr), curlen, access_type,
                  cpu_mmu_index(env, false), ra);
     if (len > curlen) {
         addr += curlen;
         curlen = len - curlen;
-        probe_access(env, addr, curlen, access_type,
+        probe_access(env, adjust_addr(env, addr), curlen, access_type,
                      cpu_mmu_index(env, false), ra);
     }
 }
@@ -239,7 +244,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + stride * i + (k << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -295,7 +300,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -409,7 +414,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         k = 0;
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + (k << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -488,7 +493,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr = base + i * (nf << esz);
+        addr = adjust_addr(env, base + i * (nf << esz));
         if (i == 0) {
             probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
         } else {
@@ -515,7 +520,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                     break;
                 }
                 remain -= offset;
-                addr += offset;
+                addr = adjust_addr(env, addr + offset);
             }
         }
     }
@@ -531,7 +536,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -585,7 +590,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         /* load/store rest of elements of current segment pointed by vstart */
         for (pos = off; pos < max_elems; pos++, env->vstart++) {
             target_ulong addr = base + ((pos + k * max_elems) << esz);
-            ldst_elem(env, addr, pos + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd, ra);
         }
         k++;
     }
@@ -594,7 +599,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     for (; k < nf; k++) {
         for (i = 0; i < max_elems; i++, env->vstart++) {
             target_ulong addr = base + ((i + k * max_elems) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
         }
     }
 
-- 
2.25.1


