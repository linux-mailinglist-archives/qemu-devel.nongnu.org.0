Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE6637208
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 06:54:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy5AJ-0007ix-TZ; Thu, 24 Nov 2022 00:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1oy5AH-0007hc-3f; Thu, 24 Nov 2022 00:52:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1oy5AE-0006CZ-9z; Thu, 24 Nov 2022 00:52:48 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO42H5B014186; Thu, 24 Nov 2022 05:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bqkaor24aMqb22W17tXV1jHV242EVNaBP7Q9defYAs4=;
 b=pydQJaJDSHf2qNJ7UZz9aVAlHCqRaIOeTsPpx8I37+bAR0p2RZahsNyR1FRoznSnpNyF
 iymJvDbHNM7515vQ/LXfkDiv0K88kN04k34FPCyheqLUzYDgoUVJOEUfNgLqCN0Lm/7K
 4DutYS40UpCQdRo8r8uaTU20iE7b4bBd9txikeRXZpx+643IE++4z13GwDxn1goXPjxi
 w72Wv/7dOd/jLAJo2rV6ZnoJmsYoZ62ZMf82FHQNREz+my583egcZWK0SXu76zCdL2t0
 frg5I5P5aA7MLWYGDgNrgfS+mk19M+WAJsgEnIiH/hKWjYKGFLHnVgXJUpfXwdMrDmzI vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m1153grt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:52:33 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AO5ew92000643;
 Thu, 24 Nov 2022 05:52:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m1153grse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:52:32 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AO5p80x012057;
 Thu, 24 Nov 2022 05:52:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3kxps8ymvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:52:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AO5qSJO33489458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Nov 2022 05:52:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35AFE4203F;
 Thu, 24 Nov 2022 05:52:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8984442045;
 Thu, 24 Nov 2022 05:52:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Nov 2022 05:52:27 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E424F6040B;
 Thu, 24 Nov 2022 16:52:21 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PATCH 1/2] target/ppc: Implement the DEXCR and HDEXCR
Date: Thu, 24 Nov 2022 05:51:42 +0000
Message-Id: <20221124055143.752601-2-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124055143.752601-1-nicholas@linux.ibm.com>
References: <20221124055143.752601-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bSNRXuFHA17MMkzZeMKorA7qh6aKd_zh
X-Proofpoint-GUID: vVOspvyplEwJuyCm6RX9Jxnr9-51xf3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_03,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211240041
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=nicholas@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Define the DEXCR and HDEXCR as special purpose registers.

Each register occupies two SPR indicies, one which can be read in an
unprivileged state and one which can be modified in the appropriate
priviliged state, however both indicies refer to the same underlying
value.

Note that the ISA uses the abbreviation UDEXCR in two different
contexts: the userspace DEXCR, the SPR index which can be read from
userspace (implemented in this patch), and the ultravisor DEXCR, the
equivalent register for the ultravisor state (not implemented).

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 target/ppc/cpu.h        | 19 +++++++++++++++++++
 target/ppc/cpu_init.c   | 25 +++++++++++++++++++++++++
 target/ppc/spr_common.h |  1 +
 target/ppc/translate.c  |  9 +++++++++
 4 files changed, 54 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 81d4263a07..0ed9f2ae35 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1068,6 +1068,21 @@ struct ppc_radix_page_info {
     uint32_t entries[PPC_PAGE_SIZES_MAX_SZ];
 };
 
+/*****************************************************************************/
+/* Dynamic Execution Control Register */
+
+#define DEXCR_ASPECT(name, num)                    \
+FIELD(DEXCR, PNH_##name, PPC_BIT_NR(num), 1)       \
+FIELD(DEXCR, PRO_##name, PPC_BIT_NR(num + 32), 1)  \
+FIELD(HDEXCR, HNU_##name, PPC_BIT_NR(num), 1)      \
+FIELD(HDEXCR, ENF_##name, PPC_BIT_NR(num + 32), 1) \
+
+DEXCR_ASPECT(SBHE, 0)
+DEXCR_ASPECT(IDRTPB, 1)
+DEXCR_ASPECT(SRAPD, 4)
+DEXCR_ASPECT(NPHIE, 5)
+DEXCR_ASPECT(PHIE, 6)
+
 /*****************************************************************************/
 /* The whole PowerPC CPU context */
 
@@ -1674,9 +1689,11 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_BOOKE_GIVOR13     (0x1BC)
 #define SPR_BOOKE_GIVOR14     (0x1BD)
 #define SPR_TIR               (0x1BE)
+#define SPR_UHDEXCR           (0x1C7)
 #define SPR_PTCR              (0x1D0)
 #define SPR_HASHKEYR          (0x1D4)
 #define SPR_HASHPKEYR         (0x1D5)
+#define SPR_HDEXCR            (0x1D7)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
@@ -1865,8 +1882,10 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_RCPU_L2U_RA2      (0x32A)
 #define SPR_MPC_MD_DBRAM1     (0x32A)
 #define SPR_RCPU_L2U_RA3      (0x32B)
+#define SPR_UDEXCR            (0x32C)
 #define SPR_TAR               (0x32F)
 #define SPR_ASDR              (0x330)
+#define SPR_DEXCR             (0x33C)
 #define SPR_IC                (0x350)
 #define SPR_VTB               (0x351)
 #define SPR_MMCRC             (0x353)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index cbf0081374..d6b950feb6 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5727,6 +5727,30 @@ static void register_power10_hash_sprs(CPUPPCState *env)
             hashpkeyr_initial_value);
 }
 
+static void register_power10_dexcr_sprs(CPUPPCState *env)
+{
+    spr_register(env, SPR_DEXCR, "DEXCR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_dexcr,
+            0);
+
+    spr_register(env, SPR_UDEXCR, "DEXCR",
+            &spr_read_generic, SPR_NOACCESS,
+            &spr_read_generic, SPR_NOACCESS,
+            0);
+
+    spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_dexcr,
+            0);
+
+    spr_register(env, SPR_UHDEXCR, "HDEXCR",
+            &spr_read_generic, SPR_NOACCESS,
+            &spr_read_generic, SPR_NOACCESS,
+            0);
+}
+
 /*
  * Initialize PMU counter overflow timers for Power8 and
  * newer Power chips when using TCG.
@@ -6402,6 +6426,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power8_rpr_sprs(env);
     register_power9_mmu_sprs(env);
     register_power10_hash_sprs(env);
+    register_power10_dexcr_sprs(env);
 
     /* FIXME: Filter fields properly based on privilege level */
     spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
diff --git a/target/ppc/spr_common.h b/target/ppc/spr_common.h
index b5a5bc6895..3cfa500250 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -195,6 +195,7 @@ void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
 void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
 void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
 void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_dexcr(DisasContext *ctx, int sprn, int gprn);
 #endif
 
 void register_low_BATs(CPUPPCState *env);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 19c1d17cb0..24e9e2fece 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1249,6 +1249,15 @@ void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
     spr_write_prev_upper32(ctx, sprn, gprn);
 }
+
+void spr_write_dexcr(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 = tcg_temp_new();
+    spr_write_generic(ctx, sprn, gprn);
+    tcg_gen_ext32u_tl(t0, cpu_gpr[gprn]);
+    gen_store_spr(sprn - 16, t0);
+    tcg_temp_free(t0);
+}
 #endif
 
 #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \
-- 
2.34.1


