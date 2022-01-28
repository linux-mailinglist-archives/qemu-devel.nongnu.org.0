Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BC64A035C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 23:19:28 +0100 (CET)
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDZaZ-0007Jm-5n
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 17:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZXz-0006Os-0t; Fri, 28 Jan 2022 17:16:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZXw-0008Mu-Rx; Fri, 28 Jan 2022 17:16:46 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SLDPds024335; 
 Fri, 28 Jan 2022 22:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=gDAZuQLJV9MbWtFdriL1wPtYwYApH+xFgxnVNd07Vvw=;
 b=fLIrScIePTdbogfXTFXIW3WEgwFbVrPmkR2krOEeBq+dFxCQ4DPZjn6uHl7XQhYC1vjy
 PAoByBCHR+WzW3zRWrRstsAqdpPNebNBZMCBWbXtr20eiN+VXlUn7L04N8Qrh9/1oP0b
 SS3iOxRy9QN2TWLC7qfqQ8KQ1m0Yl6AtUpkv8oAj6C6duIRv0EXnn3r4ZiufLhKS2Ujq
 h852ZYZSxFApJcrkZKAk0i22l1FNdQ+iEDRSFdomv5EetqEtIwX3dKszgybzZD7ekfos
 umQcjAER9ZiG0drkHdBxj/x4Q3WXNBD/FE470IiwrTs4QWW6km7RzvoA2vA8KS9VQSjH HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvr7b909x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:16:22 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SLtP8l031567;
 Fri, 28 Jan 2022 22:16:22 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvr7b909r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:16:22 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SLr3FS016575;
 Fri, 28 Jan 2022 22:16:21 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 3dr9jdt1t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:16:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SMGJQ936569422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 22:16:19 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAF8EAE060;
 Fri, 28 Jan 2022 22:16:18 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2715AAE067;
 Fri, 28 Jan 2022 22:16:17 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.66.85])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 22:16:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Remove 440x4 CPU
Date: Fri, 28 Jan 2022 19:16:11 -0300
Message-Id: <20220128221611.1221715-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k8lpkPyvuBEC79sKBE1Lijt0YEfftesX
X-Proofpoint-ORIG-GUID: sffqcXE50C08eEoJ2T3nk706IDJGLl81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280124
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This CPU was partially removed due to lack of support in 2017 by commit
aef7796057 ("ppc: remove non implemented cpu models").

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 83 -------------------------------------------
 1 file changed, 83 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e30e86fe9d..f4a4f39419 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2777,89 +2777,6 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
 }
 
-static void init_proc_440x4(CPUPPCState *env)
-{
-    /* Time base */
-    register_tbl(env);
-    register_BookE_sprs(env, 0x000000000000FFFFULL);
-    register_440_sprs(env);
-    register_usprgh_sprs(env);
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* XXX : not implemented */
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = 64;
-    env->nb_ways = 1;
-    env->id_tlbs = 0;
-    env->tlb_type = TLB_EMB;
-#endif
-    init_excp_BookE(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* XXX: TODO: allocate internal IRQ controller */
-
-    SET_FIT_PERIOD(12, 16, 20, 24);
-    SET_WDT_PERIOD(20, 24, 28, 32);
-}
-
-POWERPC_FAMILY(440x4)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 440x4";
-    pcc->init_proc = init_proc_440x4;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
-                       PPC_DCR | PPC_WRTEE |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_MEM_TLBSYNC | PPC_MFTB |
-                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
-                       PPC_440_SPEC;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_CE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_DWE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR);
-    pcc->mmu_model = POWERPC_MMU_BOOKE;
-    pcc->excp_model = POWERPC_EXCP_BOOKE;
-    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
-    pcc->bfd_mach = bfd_mach_ppc_403;
-    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
-                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
-}
-
 static void init_proc_440x5(CPUPPCState *env)
 {
     /* Time base */
-- 
2.34.1


