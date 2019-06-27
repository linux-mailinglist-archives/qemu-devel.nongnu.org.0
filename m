Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741425810F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 13:00:46 +0200 (CEST)
Received: from localhost ([::1]:48598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgS8z-0004o3-Ln
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 07:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55842)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hgS5x-0001yu-H4
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hgS5v-0001hq-MX
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:57:37 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:36521 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1hgS5v-0001gG-Cv
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 06:57:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 64EC01A4567;
 Thu, 27 Jun 2019 12:56:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 28FBB1A45A9;
 Thu, 27 Jun 2019 12:56:30 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 12:56:25 +0200
Message-Id: <1561632985-24866-14-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561632985-24866-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1561632985-24866-1-git-send-email-stefan.brankovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v4 13/13] target/ppc: convert vmrgl
 instructions to vector operations
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
Cc: stefan.brankovic@rt-rk.com, hsp.cat7@gmail.com,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/helper.h                 | 3 ---
 target/ppc/int_helper.c             | 9 ---------
 target/ppc/translate/vmx-impl.inc.c | 6 +++---
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9a7721f..0f10657 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -161,9 +161,6 @@ DEF_HELPER_4(vcmpeqfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp_dot, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpbfp_dot, void, env, avr, avr, avr)
-DEF_HELPER_3(vmrglb, void, avr, avr, avr)
-DEF_HELPER_3(vmrglh, void, avr, avr, avr)
-DEF_HELPER_3(vmrglw, void, avr, avr, avr)
 DEF_HELPER_3(vmulesb, void, avr, avr, avr)
 DEF_HELPER_3(vmulesh, void, avr, avr, avr)
 DEF_HELPER_3(vmulesw, void, avr, avr, avr)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 00e6e02..4b6e074 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -946,15 +946,6 @@ void helper_vmladduhm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
         *r = result;                                                         \
     }
 
-#define VMRG(suffix, element, access)          \
-    VMRG_DO(mrgl##suffix, element, access, half)   \
-
-VMRG(b, u8, VsrB)
-VMRG(h, u16, VsrH)
-VMRG(w, u32, VsrW)
-#undef VMRG_DO
-#undef VMRG
-
 void helper_vmsummbm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                      ppc_avr_t *b, ppc_avr_t *c)
 {
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/vmx-impl.inc.c
index e02390f..12f41af 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -449,9 +449,9 @@ GEN_VXFORM(vavgsw, 1, 22);
 GEN_VXFORM_V(vmrghb, MO_8, tcg_gen_gvec_vmrgh, 6, 0);
 GEN_VXFORM_V(vmrghh, MO_16, tcg_gen_gvec_vmrgh, 6, 1);
 GEN_VXFORM_V(vmrghw, MO_32, tcg_gen_gvec_vmrgh, 6, 2);
-GEN_VXFORM(vmrglb, 6, 4);
-GEN_VXFORM(vmrglh, 6, 5);
-GEN_VXFORM(vmrglw, 6, 6);
+GEN_VXFORM_V(vmrglb, MO_8, tcg_gen_gvec_vmrgl, 6, 4);
+GEN_VXFORM_V(vmrglh, MO_16, tcg_gen_gvec_vmrgl, 6, 5);
+GEN_VXFORM_V(vmrglw, MO_32, tcg_gen_gvec_vmrgl, 6, 6);
 
 static void trans_vmrgew(DisasContext *ctx)
 {
-- 
2.7.4


