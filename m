Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8224838B5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:10:28 +0100 (CET)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VX9-0007cp-Sz
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:10:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV4-0004mr-Oe; Mon, 03 Jan 2022 17:08:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45182
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV2-00021w-4b; Mon, 03 Jan 2022 17:08:17 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203LgkoO012015; 
 Mon, 3 Jan 2022 22:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kZp1kCUFzKZL0eDG2k8nvwubBX5WnH0dviksDQ75xvg=;
 b=NJ+RoVJ3I7jtmgC+T7vNYGBk+JNXzPAEPldPTIhbOJ7nhn0Lx8RsMZsSn6zGPcNMO1XI
 XA9Yp9XnsshRD0dbM1Ipfmgbj1flJx1/jP6qIUkHFLkc8B5XeArBifRzUyKxkmhaNfjs
 mssB9tmrxBMlVYXFhfuQCqf+ZGQeSgh3ChgCgDgZOQ/3i/KxVqTEpZzNIirTOZ/c4Xrm
 xNiNOXyLhexrlrHxaCJ+fWcdioNlYrPvrK/hqEI9Z3fHA0NgS6+0hbOffuPKJbOs+swx
 VH/0Cg1Y/1wv8EEuiKFWnVtiha4s/vv9wgM4d3p63o5JL0SPszATHH/ewTEjnyCrYS0j JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc9a4r95n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:04 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203M0sFp030386;
 Mon, 3 Jan 2022 22:08:03 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc9a4r95j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:03 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203LwUIu001137;
 Mon, 3 Jan 2022 22:08:03 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3daekar3v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M824k27066806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:08:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7CB97805E;
 Mon,  3 Jan 2022 22:08:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4559D78064;
 Mon,  3 Jan 2022 22:08:00 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:08:00 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] target/ppc: Add HV support to ppc_interrupts_little_endian
Date: Mon,  3 Jan 2022 19:07:41 -0300
Message-Id: <20220103220746.3916246-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xfWs36thQa23DgSaTw3UwDCUZTtDSmBH
X-Proofpoint-ORIG-GUID: ezmOxGJE_YcjZSQicmM_s9oGT1KQn3ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=877 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ppc_interrupts_little_endian function could be used for interrupts
delivered in Hypervisor mode, so add support for powernv8 and powernv9
to it.

Also drop the comment because it is inaccurate, all CPUs that can run
little endian can have interrupts in little endian. The point is
whether they can take interrupts in an endianness different from
MSR_LE.

This change has no functional impact.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/arch_dump.c   |  2 +-
 target/ppc/cpu.h         | 21 +++++++++++++--------
 target/ppc/excp_helper.c |  2 +-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index bb392f6d88..12cde198a3 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
 
-    if (ppc_interrupts_little_endian(cpu)) {
+    if (ppc_interrupts_little_endian(cpu, false)) {
         info->d_endian = ELFDATA2LSB;
     } else {
         info->d_endian = ELFDATA2MSB;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index fc66c3561d..a991da4e74 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2723,19 +2723,24 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
     return cpu->env.spr_cb[spr].name != NULL;
 }
 
-static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
+static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+    bool ile = false;
 
-    /*
-     * Only models that have an LPCR and know about LPCR_ILE can do little
-     * endian.
-     */
-    if (pcc->lpcr_mask & LPCR_ILE) {
-        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
+    if (hv) {
+        if (is_isa300(pcc)) {
+            ile = !!(env->spr[SPR_HID0] & HID0_POWER9_HILE);
+        } else {
+            ile = !!(env->spr[SPR_HID0] & HID0_HILE);
+        }
+
+    } else if (pcc->lpcr_mask & LPCR_ILE) {
+        ile = !!(env->spr[SPR_LPCR] & LPCR_ILE);
     }
 
-    return false;
+    return ile;
 }
 
 void dump_mmu(CPUPPCState *env);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 160e06e3a3..0dbadc5d07 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -997,7 +997,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
      */
     msr = (1ULL << MSR_ME);
     msr |= env->msr & (1ULL << MSR_SF);
-    if (ppc_interrupts_little_endian(cpu)) {
+    if (ppc_interrupts_little_endian(cpu, false)) {
         msr |= (1ULL << MSR_LE);
     }
 
-- 
2.33.1


