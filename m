Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBDE4B8E95
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:53:25 +0100 (CET)
Received: from localhost ([::1]:41222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNYR-0004Yl-RZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN8F-0003VR-TZ; Wed, 16 Feb 2022 11:26:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7w-0001Z8-Rm; Wed, 16 Feb 2022 11:26:10 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGHLA0021459; 
 Wed, 16 Feb 2022 16:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FR8bVCTJupn/bHkin8BNpqAGpE84lpQ+tUM9z0eZGeE=;
 b=j75guUR7Zm1YKCJJPruQNp49X3qkxe/dhdeXgJ/AGWouFYZRaoJfMbq+TSzefYOuuhxC
 7lYkpuBZMJ6pV9WKrqcot9KvMu/XFDi2jTJ+SlEfhQiGTH9rLY6Xuhf8CKjvIeEFw0+T
 LqOKikyMM5EE06FD2M5xaz3Jd7HIZH6GngwWnTzvC4Mw4CpDL1EAF/qnb2Wgsyc71AoK
 VexFIkm+pMeOSZ94iuUxG4Klo1Q8AD2JItJ/lMNu6fZBW/k633DxoBBOm1LbEi0LsFIo
 Zp/NuMuMoxIYuXFU2I8aAsgSV6gHoXXDq3FXdOfYBGVBh4D0aZVzJa3guLOite5atSt6 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94nj8447-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:23 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGJR1I024272;
 Wed, 16 Feb 2022 16:25:22 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94nj843u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:22 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjfA020845;
 Wed, 16 Feb 2022 16:25:21 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 3e91f6e9km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:21 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGPKEc36962690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3786378072;
 Wed, 16 Feb 2022 16:25:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5D2D78070;
 Wed, 16 Feb 2022 16:25:18 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:18 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/27] target/ppc: cpu_init: Expose some SPR registration
 helpers
Date: Wed, 16 Feb 2022 13:24:23 -0300
Message-Id: <20220216162426.1885923-25-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wWwzi8hbs0iRdlaEG_GdPYd9nRhSx53x
X-Proofpoint-ORIG-GUID: gUMvTfylo0p62TgxuBJSugquNFTvVfjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
register_6xx_7xx_soft_tlb  | only 3 callers, but it helps to
                             keep the soft TLB code consistent.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c   | 14 +++++++-------
 target/ppc/spr_common.h |  8 ++++++++
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 17f12aceb6..cfabf25040 100644
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
-static void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
+void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
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
diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index 5aec76ade4..329b7e91a2 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -141,4 +141,12 @@ void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
 void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
 #endif
 
+void register_low_BATs(CPUPPCState *env);
+void register_high_BATs(CPUPPCState *env);
+void register_sdr1_sprs(CPUPPCState *env);
+void register_thrm_sprs(CPUPPCState *env);
+void register_usprgh_sprs(CPUPPCState *env);
+void register_non_embedded_sprs(CPUPPCState *env);
+void register_6xx_7xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways);
+
 #endif
-- 
2.34.1


