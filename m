Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E90492414
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:48:39 +0100 (CET)
Received: from localhost ([::1]:47350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9m2Y-0000OR-VH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:48:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9lwK-00038a-2r; Tue, 18 Jan 2022 05:42:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59978
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9lwI-0001nN-BG; Tue, 18 Jan 2022 05:42:11 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20I9crcc022233; 
 Tue, 18 Jan 2022 10:41:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnqv4ds52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 10:41:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IAZ3Np010733;
 Tue, 18 Jan 2022 10:41:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3dknw9k218-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 10:41:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IAfrxv25690622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 10:41:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24EE852071;
 Tue, 18 Jan 2022 10:41:53 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id DCF265206C;
 Tue, 18 Jan 2022 10:41:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 41DBE2201DC;
 Tue, 18 Jan 2022 11:41:52 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] target/ppc: Remove last user of .load_state_old 
Date: Tue, 18 Jan 2022 11:41:49 +0100
Message-Id: <20220118104150.1899661-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118104150.1899661-1-clg@kaod.org>
References: <20220118104150.1899661-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xZACB8Rwljx314Zg7JBZdgIte21eThwI
X-Proofpoint-ORIG-GUID: xZACB8Rwljx314Zg7JBZdgIte21eThwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_02,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=813
 suspectscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180064
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This breaks migration compatibility from (very) old versions of
QEMU. This should not be a problem for the pseries machine for which
migration is only supported on recent QEMUs ( > 2.x). There is no
clear status on what is supported or not for the other machines. Let's
move forward and remove the .load_state_old handler.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/machine.c | 112 -------------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 756d8de5d8dd..df547385ff1e 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -23,117 +23,6 @@ static void post_load_update_msr(CPUPPCState *env)
     pmu_update_summaries(env);
 }
=20
-static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
-{
-    PowerPCCPU *cpu =3D opaque;
-    CPUPPCState *env =3D &cpu->env;
-    unsigned int i, j;
-    target_ulong sdr1;
-    uint32_t fpscr, vscr;
-#if defined(TARGET_PPC64)
-    int32_t slb_nr;
-#endif
-    target_ulong xer;
-
-    for (i =3D 0; i < 32; i++) {
-        qemu_get_betls(f, &env->gpr[i]);
-    }
-#if !defined(TARGET_PPC64)
-    for (i =3D 0; i < 32; i++) {
-        qemu_get_betls(f, &env->gprh[i]);
-    }
-#endif
-    qemu_get_betls(f, &env->lr);
-    qemu_get_betls(f, &env->ctr);
-    for (i =3D 0; i < 8; i++) {
-        qemu_get_be32s(f, &env->crf[i]);
-    }
-    qemu_get_betls(f, &xer);
-    cpu_write_xer(env, xer);
-    qemu_get_betls(f, &env->reserve_addr);
-    qemu_get_betls(f, &env->msr);
-    for (i =3D 0; i < 4; i++) {
-        qemu_get_betls(f, &env->tgpr[i]);
-    }
-    for (i =3D 0; i < 32; i++) {
-        union {
-            float64 d;
-            uint64_t l;
-        } u;
-        u.l =3D qemu_get_be64(f);
-        *cpu_fpr_ptr(env, i) =3D u.d;
-    }
-    qemu_get_be32s(f, &fpscr);
-    env->fpscr =3D fpscr;
-    qemu_get_sbe32s(f, &env->access_type);
-#if defined(TARGET_PPC64)
-    qemu_get_betls(f, &env->spr[SPR_ASR]);
-    qemu_get_sbe32s(f, &slb_nr);
-#endif
-    qemu_get_betls(f, &sdr1);
-    for (i =3D 0; i < 32; i++) {
-        qemu_get_betls(f, &env->sr[i]);
-    }
-    for (i =3D 0; i < 2; i++) {
-        for (j =3D 0; j < 8; j++) {
-            qemu_get_betls(f, &env->DBAT[i][j]);
-        }
-    }
-    for (i =3D 0; i < 2; i++) {
-        for (j =3D 0; j < 8; j++) {
-            qemu_get_betls(f, &env->IBAT[i][j]);
-        }
-    }
-    qemu_get_sbe32s(f, &env->nb_tlb);
-    qemu_get_sbe32s(f, &env->tlb_per_way);
-    qemu_get_sbe32s(f, &env->nb_ways);
-    qemu_get_sbe32s(f, &env->last_way);
-    qemu_get_sbe32s(f, &env->id_tlbs);
-    qemu_get_sbe32s(f, &env->nb_pids);
-    if (env->tlb.tlb6) {
-        /* XXX assumes 6xx */
-        for (i =3D 0; i < env->nb_tlb; i++) {
-            qemu_get_betls(f, &env->tlb.tlb6[i].pte0);
-            qemu_get_betls(f, &env->tlb.tlb6[i].pte1);
-            qemu_get_betls(f, &env->tlb.tlb6[i].EPN);
-        }
-    }
-    for (i =3D 0; i < 4; i++) {
-        qemu_get_betls(f, &env->pb[i]);
-    }
-    for (i =3D 0; i < 1024; i++) {
-        qemu_get_betls(f, &env->spr[i]);
-    }
-    if (!cpu->vhyp) {
-        ppc_store_sdr1(env, sdr1);
-    }
-    qemu_get_be32s(f, &vscr);
-    ppc_store_vscr(env, vscr);
-    qemu_get_be64s(f, &env->spe_acc);
-    qemu_get_be32s(f, &env->spe_fscr);
-    qemu_get_betls(f, &env->msr_mask);
-    qemu_get_be32s(f, &env->flags);
-    qemu_get_sbe32s(f, &env->error_code);
-    qemu_get_be32s(f, &env->pending_interrupts);
-    qemu_get_be32s(f, &env->irq_input_state);
-    for (i =3D 0; i < POWERPC_EXCP_NB; i++) {
-        qemu_get_betls(f, &env->excp_vectors[i]);
-    }
-    qemu_get_betls(f, &env->excp_prefix);
-    qemu_get_betls(f, &env->ivor_mask);
-    qemu_get_betls(f, &env->ivpr_mask);
-    qemu_get_betls(f, &env->hreset_vector);
-    qemu_get_betls(f, &env->nip);
-    qemu_get_sbetl(f); /* Discard unused hflags */
-    qemu_get_sbetl(f); /* Discard unused hflags_nmsr */
-    qemu_get_sbe32(f); /* Discard unused mmu_idx */
-    qemu_get_sbe32(f); /* Discard unused power_mode */
-
-    post_load_update_msr(env);
-
-    return 0;
-}
-
 static int get_avr(QEMUFile *f, void *pv, size_t size,
                    const VMStateField *field)
 {
@@ -808,7 +697,6 @@ const VMStateDescription vmstate_ppc_cpu =3D {
     .version_id =3D 5,
     .minimum_version_id =3D 5,
     .minimum_version_id_old =3D 4,
-    .load_state_old =3D cpu_load_old,
     .pre_save =3D cpu_pre_save,
     .post_load =3D cpu_post_load,
     .fields =3D (VMStateField[]) {
--=20
2.31.1


