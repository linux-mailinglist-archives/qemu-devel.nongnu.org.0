Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98D4B8DF8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:28:25 +0100 (CET)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNAG-0004Wj-5N
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:28:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6p-00019K-37; Wed, 16 Feb 2022 11:24:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6l-0001BD-02; Wed, 16 Feb 2022 11:24:50 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGBqul032592; 
 Wed, 16 Feb 2022 16:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RqVSXv24yNdEuHsV1OZXAPvxPzSfsHONQWrQETqndD0=;
 b=bxz7zq9SxI7B3v2wiF5s4q26RdvoD6v7me85aHRr2i5fPzPuo+W2kaO13idptoW6BIPn
 Le5bFx3gqIzo+ugx+CnsdQLrefEQlPk3IeDSbewnePe3Td5w6vpzVCZnuy64HzLlkRv9
 KnlV1TzgjHLQYuMR6ZT8nrgRNCk1JWRBADl8XyhYgukZmh4wwk8G0L4n0maA9dCQ4GGw
 Z8MEdaqwrkKS3CBVIgpuTEdPsyWp5/VMk0Z5X59qoH0kdZEAmWpyEBpjgfstR1JkxzfK
 BSgo1gEZrnTCgb9cW8aJDClP0ViLjkJTKvbNNHeeSWDhfBWVDfdFHl+7RVRn4XT+OOr8 lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94jrg8u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:39 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGDeXv010745;
 Wed, 16 Feb 2022 16:24:38 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e94jrg8tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:38 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjuD020966;
 Wed, 16 Feb 2022 16:24:37 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3e91f6e93v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOa3T19464580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:36 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D09F78086;
 Wed, 16 Feb 2022 16:24:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08AFD78070;
 Wed, 16 Feb 2022 16:24:34 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:33 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/27] target/ppc: cpu_init: Remove not implemented comments
Date: Wed, 16 Feb 2022 13:24:00 -0300
Message-Id: <20220216162426.1885923-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QgiBgfrYAE7uTxNXwcQKN1aJxtQlQQKM
X-Proofpoint-ORIG-GUID: Z0a9Bfn1PbjNNl9Z7OaySxEjwq3pO6Y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 spamscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160095
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

The /* XXX : not implemented */ comments all over cpu_init are
confusing and ambiguous.

Do they mean not implemented by QEMU, not implemented in a specific
access mode? Not implemented by the CPU? Do they apply to just the
register right after or to a whole block? Do they mean we have an
action to take in the future to implement these?  Are they only
informative?

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c | 582 ++++++++++++++++++------------------------
 1 file changed, 253 insertions(+), 329 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 1d411b17ee..9bd5971c0c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -466,95 +466,91 @@ static void register_G2_755_sprs(CPUPPCState *env)
 static void register_7xx_sprs(CPUPPCState *env)
 {
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register_kvm(env, SPR_DABR, "DABR",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_generic,
                      KVM_REG_PPC_DABR, 0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Cache management */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTC, "ICTC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Performance monitors */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_MMCR0, "MMCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_MMCR1, "MMCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC1, "PMC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC2, "PMC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC3, "PMC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC4, "PMC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_SIAR, "SIAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC1, "UPMC1",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC2, "UPMC2",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC3, "UPMC3",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC4, "UPMC4",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_USIAR, "USIAR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -609,17 +605,16 @@ static void register_iamr_sprs(CPUPPCState *env)
 static void register_thrm_sprs(CPUPPCState *env)
 {
     /* Thermal management */
-    /* XXX : not implemented */
     spr_register(env, SPR_THRM1, "THRM1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_thrm, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_THRM2, "THRM2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_thrm, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_THRM3, "THRM3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_thrm, &spr_write_generic,
@@ -635,44 +630,41 @@ static void register_604_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register_kvm(env, SPR_DABR, "DABR",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_generic,
                      KVM_REG_PPC_DABR, 0x00000000);
     /* Performance counters */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_MMCR0, "MMCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC1, "PMC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC2, "PMC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_SIAR, "SIAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_SDA, "SDA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -683,13 +675,11 @@ static void register_604_sprs(CPUPPCState *env)
 static void register_603_sprs(CPUPPCState *env)
 {
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -702,7 +692,6 @@ static void register_G2_sprs(CPUPPCState *env)
 {
     /* Memory base address */
     /* MBAR */
-    /* XXX : not implemented */
     spr_register(env, SPR_MBAR, "MBAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -717,32 +706,31 @@ static void register_G2_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_DABR, "DABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DABR2, "DABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR, "IABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR2, "IABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IBCR, "IBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DBCR, "DBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -756,33 +744,32 @@ static void register_74xx_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_74XX_MMCR2, "MMCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_74XX_UMMCR2, "UMMCR2",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX: not implemented */
+
     spr_register(env, SPR_BAMR, "BAMR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MSSCR0, "MSSCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -792,7 +779,7 @@ static void register_74xx_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -802,19 +789,16 @@ static void register_74xx_sprs(CPUPPCState *env)
 static void register_l3_ctrl(CPUPPCState *env)
 {
     /* L3CR */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3CR, "L3CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR0, "L3ITCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3PM */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3PM, "L3PM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -901,37 +885,36 @@ static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Debug */
-    /* XXX : not implemented */
     spr_register(env, SPR_BOOKE_IAC1, "IAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC2, "IAC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DAC1, "DAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DAC2, "DAC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBCR0, "DBCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_40x_dbcr0,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBCR1, "DBCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBCR2, "DBCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -944,7 +927,7 @@ static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DBSR, "DBSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_clear,
@@ -1053,7 +1036,6 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
     int i;
 
     /* TLB assist registers */
-    /* XXX : not implemented */
     for (i = 0; i < 8; i++) {
         if (mas_mask & (1 << i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
@@ -1065,14 +1047,12 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
         }
     }
     if (env->nb_pids > 1) {
-        /* XXX : not implemented */
         spr_register(env, SPR_BOOKE_PID1, "PID1",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_booke_pid,
                      0x00000000);
     }
     if (env->nb_pids > 2) {
-        /* XXX : not implemented */
         spr_register(env, SPR_BOOKE_PID2, "PID2",
                      SPR_NOACCESS, SPR_NOACCESS,
                      &spr_read_generic, &spr_write_booke_pid,
@@ -1088,7 +1068,6 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
                  &spr_read_generic, &spr_write_epsc,
                  0x00000000);
 
-    /* XXX : not implemented */
     spr_register(env, SPR_MMUCFG, "MMUCFG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
@@ -1131,123 +1110,121 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
 static void register_440_sprs(CPUPPCState *env)
 {
     /* Cache control */
-    /* XXX : not implemented */
     spr_register(env, SPR_440_DNV0, "DNV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DNV1, "DNV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DNV2, "DNV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DNV3, "DNV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV0, "DTV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV1, "DTV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV2, "DTV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DTV3, "DTV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DVLIM, "DVLIM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV0, "INV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV1, "INV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV2, "INV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_INV3, "INV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV0, "ITV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV1, "ITV1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV2, "ITV2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_ITV3, "ITV3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_IVLIM, "IVLIM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Cache debug */
-    /* XXX : not implemented */
     spr_register(env, SPR_BOOKE_DCDBTRH, "DCDBTRH",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DCDBTRL, "DCDBTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_ICDBTRH, "ICDBTRH",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_ICDBTRL, "ICDBTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_DBDR, "DBDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1336,23 +1313,22 @@ static void register_405_sprs(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00700000);
     /* Debug interface */
-    /* XXX : not implemented */
     spr_register(env, SPR_40x_DBCR0, "DBCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_40x_dbcr0,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_DBCR1, "DBCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_40x_DBSR, "DBSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_clear,
                  /* Last reset was system reset */
                  0x00000300);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_40x_DAC1, "DAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1361,17 +1337,17 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_40x_IAC1, "IAC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1380,18 +1356,17 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Storage control */
-    /* XXX: TODO: not implemented */
     spr_register(env, SPR_405_SLER, "SLER",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_40x_sler,
@@ -1400,7 +1375,7 @@ static void register_405_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_405_SU0R, "SU0R",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1446,102 +1421,102 @@ static void register_5xx_8xx_sprs(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_decr, &spr_write_decr,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_EIE, "EIE",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_EID, "EID",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_NRI, "NRI",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPA, "CMPA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPB, "CMPB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPC, "CMPC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPD, "CMPD",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_ECR, "ECR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DER, "DER",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_COUNTA, "COUNTA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_COUNTB, "COUNTB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPE, "CMPE",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPF, "CMPF",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPG, "CMPG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_CMPH, "CMPH",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_LCTRL1, "LCTRL1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_LCTRL2, "LCTRL2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_BAR, "BAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DPDR, "DPDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IMMR, "IMMR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1550,107 +1525,106 @@ static void register_5xx_8xx_sprs(CPUPPCState *env)
 
 static void register_5xx_sprs(CPUPPCState *env)
 {
-    /* XXX : not implemented */
     spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_GRA, "L2U_GRA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RPCU_BBCMCR, "L2U_BBCMCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_MCR, "L2U_MCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA0, "MI_RBA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA1, "MI_RBA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA2, "MI_RBA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RBA3, "MI_RBA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA0, "L2U_RBA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA1, "L2U_RBA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA2, "L2U_RBA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RBA3, "L2U_RBA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA0, "MI_RA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA1, "MI_RA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA2, "MI_RA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_MI_RA3, "MI_RA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA0, "L2U_RA0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA1, "L2U_RA1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA2, "L2U_RA2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_L2U_RA3, "L2U_RA3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_RCPU_FPECR, "FPECR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -1659,127 +1633,127 @@ static void register_5xx_sprs(CPUPPCState *env)
 
 static void register_8xx_sprs(CPUPPCState *env)
 {
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IC_CST, "IC_CST",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IC_ADR, "IC_ADR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_IC_DAT, "IC_DAT",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DC_CST, "DC_CST",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DC_ADR, "DC_ADR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_DC_DAT, "DC_DAT",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_CTR, "MI_CTR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_AP, "MI_AP",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_EPN, "MI_EPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_TWC, "MI_TWC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_RPN, "MI_RPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_DBCAM, "MI_DBCAM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_DBRAM0, "MI_DBRAM0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MI_DBRAM1, "MI_DBRAM1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_CTR, "MD_CTR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_CASID, "MD_CASID",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_AP, "MD_AP",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_EPN, "MD_EPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_TWB, "MD_TWB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_TWC, "MD_TWC",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_RPN, "MD_RPN",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_TW, "MD_TW",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_DBCAM, "MD_DBCAM",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_DBRAM0, "MD_DBRAM0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MPC_MD_DBRAM1, "MD_DBRAM1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2397,27 +2371,27 @@ static void init_proc_440EP(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2430,7 +2404,7 @@ static void init_proc_440EP(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_CCR1, "CCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2539,22 +2513,22 @@ static void init_proc_440GP(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2622,27 +2596,27 @@ static void init_proc_440x5(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC1, "DVC1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_DVC2, "DVC2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2655,7 +2629,7 @@ static void init_proc_440x5(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_440_CCR1, "CCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2847,23 +2821,21 @@ static void init_proc_G2(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation register */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2926,23 +2898,21 @@ static void init_proc_G2LE(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* External access control */
-    /* XXX : not implemented */
     spr_register(env, SPR_EAR, "EAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation register */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3004,84 +2974,84 @@ static void init_proc_e200(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     register_BookE_sprs(env, 0x000000070000FFFFULL);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
                  &spr_read_spefscr, &spr_write_spefscr,
                  &spr_read_spefscr, &spr_write_spefscr,
                  0x00000000);
     /* Memory management */
     register_BookE206_sprs(env, 0x0000005D, NULL, 0);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_ALTCTXCR, "ALTCTXCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_CTXCR, "CTXCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_DBCNT, "DBCNT",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_DBCR3, "DBCR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
                  &spr_read_generic, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1FINV0, "L1FINV0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC3, "IAC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_IAC4, "IAC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MMUCSR0, "MMUCSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3162,43 +3132,41 @@ static void init_proc_e300(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Breakpoints */
-    /* XXX : not implemented */
     spr_register(env, SPR_DABR, "DABR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DABR2, "DABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IABR2, "IABR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_IBCR, "IBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_DBCR, "DBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3304,7 +3272,7 @@ static void init_proc_e500(CPUPPCState *env, int version)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_pir,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
                  &spr_read_spefscr, &spr_write_spefscr,
                  &spr_read_spefscr, &spr_write_spefscr,
@@ -3364,47 +3332,47 @@ static void init_proc_e500(CPUPPCState *env, int version)
                   env->spr[SPR_PVR]);
     }
     register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BBEAR, "BBEAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BBTAR, "BBTAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_MCAR, "MCAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_BOOKE_MCSR, "MCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_NPIDR, "NPIDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
                  &spr_read_generic, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
@@ -3724,12 +3692,11 @@ static void init_proc_603(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3830,7 +3797,6 @@ static void init_proc_604(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3888,17 +3854,17 @@ static void init_proc_604E(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_604_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_MMCR1, "MMCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC3, "PMC3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC4, "PMC4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3906,12 +3872,11 @@ static void init_proc_604E(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3974,12 +3939,11 @@ static void init_proc_740(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4037,7 +4001,7 @@ static void init_proc_750(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4047,12 +4011,11 @@ static void init_proc_750(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4114,7 +4077,7 @@ static void init_proc_750cl(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4135,7 +4098,7 @@ static void init_proc_750cl(CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX: not implemented */
+
     spr_register(env, SPR_750_TDCL, "TDCL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4145,7 +4108,6 @@ static void init_proc_750cl(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* DMA */
-    /* XXX : not implemented */
     spr_register(env, SPR_750_WPAR, "WPAR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4159,63 +4121,61 @@ static void init_proc_750cl(CPUPPCState *env)
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750CL_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750CL_HID4, "HID4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Quantization registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_750_GQR0, "GQR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR1, "GQR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR2, "GQR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR3, "GQR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR4, "GQR4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR5, "GQR5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR6, "GQR6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_GQR7, "GQR7",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4314,7 +4274,7 @@ static void init_proc_750cx(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4323,18 +4283,17 @@ static void init_proc_750cx(CPUPPCState *env)
     register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* This register is not implemented but is present for compatibility */
+
     spr_register(env, SPR_SDA, "SDA",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4394,7 +4353,7 @@ static void init_proc_750fx(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4403,23 +4362,22 @@ static void init_proc_750fx(CPUPPCState *env)
     register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_THRM4, "THRM4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750FX_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4479,7 +4437,7 @@ static void init_proc_750gx(CPUPPCState *env)
     register_ne_601_sprs(env);
     register_sdr1_sprs(env);
     register_7xx_sprs(env);
-    /* XXX : not implemented (XXX: different from 750fx) */
+
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
@@ -4488,23 +4446,22 @@ static void init_proc_750gx(CPUPPCState *env)
     register_tbl(env);
     /* Thermal management */
     register_thrm_sprs(env);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_750_THRM4, "THRM4",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* Hardware implementation registers */
-    /* XXX : not implemented (XXX: different from 750fx) */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented (XXX: different from 750fx) */
+
     spr_register(env, SPR_750FX_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4570,17 +4527,16 @@ static void init_proc_745(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4644,12 +4600,11 @@ static void init_proc_755(CPUPPCState *env)
     /* Time base */
     register_tbl(env);
     /* L2 cache control */
-    /* XXX : not implemented */
     spr_register(env, SPR_L2CR, "L2CR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, spr_access_nop,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2PMCR, "L2PMCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4657,17 +4612,16 @@ static void init_proc_755(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID1, "HID1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_HID2, "HID2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4732,13 +4686,12 @@ static void init_proc_7400(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX: this seems not implemented on all revisions. */
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MSSCR1, "MSSCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4809,7 +4762,7 @@ static void init_proc_7410(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -4817,13 +4770,13 @@ static void init_proc_7410(CPUPPCState *env)
     /* Thermal management */
     register_thrm_sprs(env);
     /* L2PMCR */
-    /* XXX : not implemented */
+
     spr_register(env, SPR_L2PMCR, "L2PMCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* LDSTDB */
-    /* XXX : not implemented */
+
     spr_register(env, SPR_LDSTDB, "LDSTDB",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -4892,46 +4845,42 @@ static void init_proc_7440(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5003,69 +4952,61 @@ static void init_proc_7450(CPUPPCState *env)
     /* Level 3 cache control */
     register_l3_ctrl(env);
     /* L3ITCR1 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR1, "L3ITCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR2 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR2, "L3ITCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR3 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR3, "L3ITCR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3OHCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3OHCR, "L3OHCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5135,40 +5076,36 @@ static void init_proc_7445(CPUPPCState *env)
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5274,40 +5211,36 @@ static void init_proc_7455(CPUPPCState *env)
     /* Level 3 cache control */
     register_l3_ctrl(env);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5413,64 +5346,56 @@ static void init_proc_7457(CPUPPCState *env)
     /* Level 3 cache control */
     register_l3_ctrl(env);
     /* L3ITCR1 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR1, "L3ITCR1",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR2 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR2, "L3ITCR2",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3ITCR3 */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3ITCR3, "L3ITCR3",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* L3OHCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_L3OHCR, "L3OHCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* LDSTCR */
-    /* XXX : not implemented */
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* ICTRL */
-    /* XXX : not implemented */
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* MSSSR0 */
-    /* XXX : not implemented */
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
     /* PMC */
-    /* XXX : not implemented */
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5573,42 +5498,42 @@ static void init_proc_e600(CPUPPCState *env)
     /* 74xx specific SPR */
     register_74xx_sprs(env);
     vscr_init(env, 0x00010000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_UBAMR, "UBAMR",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_LDSTCR, "LDSTCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_ICTRL, "ICTRL",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_MSSSR0, "MSSSR0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC5, "PMC5",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC5, "UPMC5",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_PMC6, "PMC6",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* XXX : not implemented */
+
     spr_register(env, SPR_7XX_UPMC6, "UPMC6",
                  &spr_read_ureg, SPR_NOACCESS,
                  &spr_read_ureg, SPR_NOACCESS,
@@ -5721,7 +5646,6 @@ static int check_pow_970(CPUPPCState *env)
 static void register_970_hid_sprs(CPUPPCState *env)
 {
     /* Hardware implementation registers */
-    /* XXX : not implemented */
     spr_register(env, SPR_HID0, "HID0",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_clear,
-- 
2.34.1


