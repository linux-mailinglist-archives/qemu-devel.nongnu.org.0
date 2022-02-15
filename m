Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB794B7A24
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:02:04 +0100 (CET)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5tb-0000XV-Nl
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:02:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b4-0004Gq-2I; Tue, 15 Feb 2022 16:42:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5b1-0002d8-6X; Tue, 15 Feb 2022 16:42:53 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FKdMJG008410; 
 Tue, 15 Feb 2022 21:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x/mnYpBmH+8WVtnqklU7IQB88iSrbX0j5iMlUzBZ0UI=;
 b=aBrPu5GI8R0VC2tNOO6n6dX16H/IYjApG14fhXdX3SkfThw8HTk7LAZJIfBT8Kh3sa0D
 xxr6KkhvFcIwIKyM47jONIvrm2MJ7m0qxRVfTlM/GBIF/HDj972y4ZA/yUJbxsey4zV3
 Jbcvaua3EyEbWn/KoL7MxgZKUCNjLpY2RKs/x1QEpj4BZL4rkQWY7RfHdMdZqAP/H5q3
 03toupba8oGXKzdV7vnutokySljUaVADi2+UFmDol6NbplMANa+Qo6OhEGOHIbAuA2FY
 ZLA0CL7zUsfvq6HLzqIGELRBzg8reMrM2IM5ZvSs5usTwKaxyy8oNeO4ohvPt8x3Q7wB Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jreagd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:45 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLgj6f029466;
 Tue, 15 Feb 2022 21:42:45 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e8jreagcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:45 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLNoVA020274;
 Tue, 15 Feb 2022 21:42:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3e64hbttne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:42:44 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLghRT21168500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:42:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 740F6BE058;
 Tue, 15 Feb 2022 21:42:43 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0679CBE051;
 Tue, 15 Feb 2022 21:42:42 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:42:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/27] target/ppc: cpu_init: Expose some SPR registration
 helpers
Date: Tue, 15 Feb 2022 18:41:45 -0300
Message-Id: <20220215214148.1848266-25-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215214148.1848266-1-farosas@linux.ibm.com>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TD-PreRp74UGdmWlAmE4Fl1XmG8yelym
X-Proofpoint-ORIG-GUID: ZVz0A69UVYEZdOL0w0_T_jv9DOLMibCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=959 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202150122
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patches will move CPU-specific code into separate files,
so expose the most used SPR registration functions:

register_sdr1_sprs         | 22 callers
register_low_BATs          | 20 callers
register_non_embedded_sprs | 19 callers
register_high_BATs         | 10 callers
register_thrm_sprs         | 8 callers
register_usprgh_sprs       | 6 callers
register_soft_tlb_sprs     | only 3 callers, but it helps to
                             keep the soft TLB code consistent.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 14 +++++++-------
 target/ppc/spr_tcg.h  |  8 ++++++++
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 3585dc69bc..74e26f60dd 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -241,7 +241,7 @@ static void register_generic_sprs(PowerPCCPU *cpu)
                  0x00000000);
 }
 
-static void register_non_embedded_sprs(CPUPPCState *env)
+void register_non_embedded_sprs(CPUPPCState *env)
 {
     /* Exception processing */
     spr_register_kvm(env, SPR_DSISR, "DSISR",
@@ -260,7 +260,7 @@ static void register_non_embedded_sprs(CPUPPCState *env)
 }
 
 /* Storage Description Register 1 */
-static void register_sdr1_sprs(CPUPPCState *env)
+void register_sdr1_sprs(CPUPPCState *env)
 {
 #ifndef CONFIG_USER_ONLY
     if (env->has_hv_mode) {
@@ -283,7 +283,7 @@ static void register_sdr1_sprs(CPUPPCState *env)
 }
 
 /* BATs 0-3 */
-static void register_low_BATs(CPUPPCState *env)
+void register_low_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT0U, "IBAT0U",
@@ -355,7 +355,7 @@ static void register_low_BATs(CPUPPCState *env)
 }
 
 /* BATs 4-7 */
-static void register_high_BATs(CPUPPCState *env)
+void register_high_BATs(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     spr_register(env, SPR_IBAT4U, "IBAT4U",
@@ -427,7 +427,7 @@ static void register_high_BATs(CPUPPCState *env)
 }
 
 /* Softare table search registers */
-static void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways)
+void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways)
 {
 #if !defined(CONFIG_USER_ONLY)
     env->nb_tlb = nb_tlbs;
@@ -667,7 +667,7 @@ static void register_iamr_sprs(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
 
-static void register_thrm_sprs(CPUPPCState *env)
+void register_thrm_sprs(CPUPPCState *env)
 {
     /* Thermal management */
     spr_register(env, SPR_THRM1, "THRM1",
@@ -1072,7 +1072,7 @@ static void register_l3_ctrl(CPUPPCState *env)
                  0x00000000);
 }
 
-static void register_usprgh_sprs(CPUPPCState *env)
+void register_usprgh_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_USPRG4, "USPRG4",
                  &spr_read_ureg, SPR_NOACCESS,
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index df2abacc64..a4f912faa4 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -141,4 +141,12 @@ void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
 void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
 #endif
 
+void register_low_BATs(CPUPPCState *env);
+void register_high_BATs(CPUPPCState *env);
+void register_sdr1_sprs(CPUPPCState *env);
+void register_thrm_sprs(CPUPPCState *env);
+void register_usprgh_sprs(CPUPPCState *env);
+void register_non_embedded_sprs(CPUPPCState *env);
+void register_soft_tlb_sprs(CPUPPCState *env, int nb_tlbs, int nb_ways);
+
 #endif
-- 
2.34.1


