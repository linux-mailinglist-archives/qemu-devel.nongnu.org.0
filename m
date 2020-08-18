Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC055247D7A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 06:26:06 +0200 (CEST)
Received: from localhost ([::1]:49498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7tCH-00013s-Vd
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 00:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t6B-0007VC-D2; Tue, 18 Aug 2020 00:19:47 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56647 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k7t69-0006MS-GZ; Tue, 18 Aug 2020 00:19:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BVyNb0msVz9sVF; Tue, 18 Aug 2020 14:19:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1597724367;
 bh=Vecwsc8w/Gi+tSL1ZQRvRrUML/0AnOdY4NFin78A5MY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OlPL+R6v2rWCzi6N3wqwpMSPEsV3mr1CjDl3obHR7G6WN1bEln0yUUmOxFKOGrS/q
 1nFfX7dIPE93uNWsdxX96752XVg+ymd9hDcm9bijb3O7kPIJEEfnw+VXKSzVuscnat
 u4RCoozCgBAkztqxGGIZ0Tc4rzWAOFdNU+bQ8HIE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/40] target/ppc: add vmulh{su}w instructions
Date: Tue, 18 Aug 2020 14:18:55 +1000
Message-Id: <20200818041922.251708-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818041922.251708-1-david@gibson.dropbear.id.au>
References: <20200818041922.251708-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Lijun Pan <ljp@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lijun Pan <ljp@linux.ibm.com>

vmulhsw: Vector Multiply High Signed Word
vmulhuw: Vector Multiply High Unsigned Word

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
Message-Id: <20200724045845.89976-4-ljp@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/helper.h                 |  2 ++
 target/ppc/int_helper.c             | 19 +++++++++++++++++++
 target/ppc/translate/vmx-impl.inc.c |  6 ++++++
 target/ppc/translate/vmx-ops.inc.c  |  4 ++--
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 032da717f7..c218bb13ec 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -184,6 +184,8 @@ DEF_HELPER_3(vmulosw, void, avr, avr, avr)
 DEF_HELPER_3(vmuloub, void, avr, avr, avr)
 DEF_HELPER_3(vmulouh, void, avr, avr, avr)
 DEF_HELPER_3(vmulouw, void, avr, avr, avr)
+DEF_HELPER_3(vmulhsw, void, avr, avr, avr)
+DEF_HELPER_3(vmulhuw, void, avr, avr, avr)
 DEF_HELPER_3(vslo, void, avr, avr, avr)
 DEF_HELPER_3(vsro, void, avr, avr, avr)
 DEF_HELPER_3(vsrv, void, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 263e899fe0..1e866b7d3b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1086,6 +1086,25 @@ VMUL(uw, u32, VsrW, VsrD, uint64_t)
 #undef VMUL_DO_ODD
 #undef VMUL
 
+void helper_vmulhsw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+{
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        r->s32[i] = (int32_t)(((int64_t)a->s32[i] * (int64_t)b->s32[i]) >> 32);
+    }
+}
+
+void helper_vmulhuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+{
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        r->u32[i] = (uint32_t)(((uint64_t)a->u32[i] *
+                               (uint64_t)b->u32[i]) >> 32);
+    }
+}
+
 void helper_vperm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
                   ppc_avr_t *c)
 {
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index f8e8b978ec..79631e56b4 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -811,9 +811,15 @@ GEN_VXFORM_V(vmulld, MO_64, tcg_gen_gvec_mul, 4, 7);
 GEN_VXFORM(vmuleub, 4, 8);
 GEN_VXFORM(vmuleuh, 4, 9);
 GEN_VXFORM(vmuleuw, 4, 10);
+GEN_VXFORM(vmulhuw, 4, 10);
+GEN_VXFORM_DUAL(vmuleuw, PPC_ALTIVEC, PPC_NONE,
+                vmulhuw, PPC_NONE, PPC2_ISA310);
 GEN_VXFORM(vmulesb, 4, 12);
 GEN_VXFORM(vmulesh, 4, 13);
 GEN_VXFORM(vmulesw, 4, 14);
+GEN_VXFORM(vmulhsw, 4, 14);
+GEN_VXFORM_DUAL(vmulesw, PPC_ALTIVEC, PPC_NONE,
+                vmulhsw, PPC_NONE, PPC2_ISA310);
 GEN_VXFORM_V(vslb, MO_8, tcg_gen_gvec_shlv, 2, 4);
 GEN_VXFORM_V(vslh, MO_16, tcg_gen_gvec_shlv, 2, 5);
 GEN_VXFORM_V(vslw, MO_32, tcg_gen_gvec_shlv, 2, 6);
diff --git a/target/ppc/translate/vmx-ops.inc.c b/target/ppc/translate/vmx-ops.inc.c
index b49787ac97..29701ad778 100644
--- a/target/ppc/translate/vmx-ops.inc.c
+++ b/target/ppc/translate/vmx-ops.inc.c
@@ -110,10 +110,10 @@ GEN_VXFORM_207(vmulosw, 4, 6),
 GEN_VXFORM_310(vmulld, 4, 7),
 GEN_VXFORM(vmuleub, 4, 8),
 GEN_VXFORM(vmuleuh, 4, 9),
-GEN_VXFORM_207(vmuleuw, 4, 10),
+GEN_VXFORM_DUAL(vmuleuw, vmulhuw, 4, 10, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM(vmulesb, 4, 12),
 GEN_VXFORM(vmulesh, 4, 13),
-GEN_VXFORM_207(vmulesw, 4, 14),
+GEN_VXFORM_DUAL(vmulesw, vmulhsw, 4, 14, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM(vslb, 2, 4),
 GEN_VXFORM(vslh, 2, 5),
 GEN_VXFORM_DUAL(vslw, vrlwnm, 2, 6, PPC_ALTIVEC, PPC_NONE),
-- 
2.26.2


