Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CB6519F7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 05:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7UAw-0000fU-Lr; Mon, 19 Dec 2022 23:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p7UAj-0000dB-1q; Mon, 19 Dec 2022 23:24:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1p7UAf-0002hi-Ti; Mon, 19 Dec 2022 23:24:08 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BK4E0NC013836; Tue, 20 Dec 2022 04:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RpPNYKJK+4s6gwhQm2AunQMcStb1vYsnm7FIWCOYM10=;
 b=k5IEBEzabPof9CLcpXxX/NgvPnHONY7n8iXVnUvKd3u50+HWadUjNG0dd6nU8zD4XW79
 An/gPTKhj67qIuTs5YtQqAs4VnDHU32aDl7LtPwOAqms0S3ZYy1jwqIw8PZkJ9UNdU0B
 kATAL6aBCoHdT6QEfxsO8JAUcWFr9a86pWoWlfF6merrvJ446lbG55lfIGO+rf1PKPgH
 gYB2qweat4eCkRUIb9tJn8N6xlcLURdqx9MDLtM2OvuAbeE2hxoiGCjVa91MQnSK1xPw
 LXCcEAHf9pLvQmCYehcq9Moug+5rOvOTDlTgEkudvpGr57rk6akAoIRiowpjXrjUY2dy Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk5u985vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:49 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BK4NnND015596;
 Tue, 20 Dec 2022 04:23:49 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mk5u985v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:49 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJB9XOA026099;
 Tue, 20 Dec 2022 04:23:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mh6yxjfw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Dec 2022 04:23:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BK4Nir637487094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Dec 2022 04:23:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9371C20040;
 Tue, 20 Dec 2022 04:23:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AE4D20049;
 Tue, 20 Dec 2022 04:23:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 20 Dec 2022 04:23:43 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 66117604A7;
 Tue, 20 Dec 2022 15:23:41 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PATCH v3 1/2] target/ppc: Implement the DEXCR and HDEXCR
Date: Tue, 20 Dec 2022 04:23:29 +0000
Message-Id: <20221220042330.2387944-2-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220042330.2387944-1-nicholas@linux.ibm.com>
References: <20221220042330.2387944-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b1uYK_UoAIotIjsGLJnZyBhnW6fgaNth
X-Proofpoint-GUID: l_0dtzFplS9a-4Qpt4APx5GjEG4RQ4gd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200034
Received-SPF: pass client-ip=148.163.158.5;
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
v2: Clearing of upper 32 bits of DEXCR is now performed on read from
problem state rather than on write in privileged state.
v3: Fix typos
---
 target/ppc/cpu.h        | 19 +++++++++++++++++++
 target/ppc/cpu_init.c   | 25 +++++++++++++++++++++++++
 target/ppc/spr_common.h |  1 +
 target/ppc/translate.c  | 19 +++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 81d4263a07..3923f174f8 100644
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
+DEXCR_ASPECT(IBRTPD, 1)
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
index cbf0081374..6433f4fdfd 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5727,6 +5727,30 @@ static void register_power10_hash_sprs(CPUPPCState *env)
             hashpkeyr_initial_value);
 }
 
+static void register_power10_dexcr_sprs(CPUPPCState *env)
+{
+    spr_register(env, SPR_DEXCR, "DEXCR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            0);
+
+    spr_register(env, SPR_UDEXCR, "DEXCR",
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
+            0);
+
+    spr_register_hv(env, SPR_HDEXCR, "HDEXCR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            0);
+
+    spr_register(env, SPR_UHDEXCR, "HDEXCR",
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
+            &spr_read_dexcr_ureg, SPR_NOACCESS,
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
index b5a5bc6895..8437eb0340 100644
--- a/target/ppc/spr_common.h
+++ b/target/ppc/spr_common.h
@@ -195,6 +195,7 @@ void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
 void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
 void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
 void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
+void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn);
 #endif
 
 void register_low_BATs(CPUPPCState *env);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 19c1d17cb0..0e4cabcf54 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1249,6 +1249,25 @@ void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn)
     gen_fscr_facility_check(ctx, SPR_FSCR, FSCR_EBB, sprn, FSCR_IC_EBB);
     spr_write_prev_upper32(ctx, sprn, gprn);
 }
+
+void spr_read_dexcr_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    /*
+     * Access to the (H)DEXCR in problem state is done using seperate 
+     * SPR indexes which are 16 below the SPR indexes which have full
+     * access to the (H)DEXCR in privileged state. Problem state can
+     * only read bits 32:63, bits 0:31 return 0.
+     *
+     * See section 9.3.1-9.3.2 of PowerISA v3.1B
+     */
+
+    gen_load_spr(t0, sprn + 16);
+    tcg_gen_ext32u_tl(cpu_gpr[gprn], t0);
+
+    tcg_temp_free(t0);
+}
 #endif
 
 #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \
-- 
2.34.1


