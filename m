Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716044C3548
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:05:04 +0100 (CET)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJQF-0006JP-GB
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:05:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJK3-0005cu-ML; Thu, 24 Feb 2022 13:58:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJK1-0006Q3-7p; Thu, 24 Feb 2022 13:58:39 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OIGYUv010089; 
 Thu, 24 Feb 2022 18:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iTMRQi/iweOfP4GiDnHB9q6xHW8rySQdndGuWXp0vtQ=;
 b=ZCeXYk2lQgGepFGx3Ls32rbKwvRNgvN8iVquyPodnP+zqSYUsD/6jPKsmExUPcZ8NjQK
 04kNzfZR7OHN5qsRdgcyDR9/t2qU+3PufWY77LaaYc8TV/9esl2iYrZCgV4YpGzlNAyI
 qWRKi1Bf7g3sgoZBld5qD+uq0g0h5zzIe8MKLeeZXtwCP88WitamMQb6ZRQVH3H3BMcN
 Eda/Trhc+NIM776bod5DVELpyEOPquR/T90NV0o2KUXAX/F0zNcC8W1RlIjffUaA5ik7
 TPOPT4SXxURmQkaRpa+G1kubj0i8KRGyVU7cAMGCRnIjXTVmB7K1pnUx68WMDinJqIEn gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edq0k17hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:30 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21OIkS0T002199;
 Thu, 24 Feb 2022 18:58:29 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edq0k17h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:29 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21OIcYVd017175;
 Thu, 24 Feb 2022 18:58:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3edr92v7ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21OIwRqu30277946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 18:58:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BF7CC6055;
 Thu, 24 Feb 2022 18:58:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9930AC6065;
 Thu, 24 Feb 2022 18:58:25 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.135.43])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 18:58:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] target/ppc: TCG: Migrate tb_offset and decr
Date: Thu, 24 Feb 2022 15:58:14 -0300
Message-Id: <20220224185817.2207228-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224185817.2207228-1-farosas@linux.ibm.com>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8Rk_D-S0RRxv-yGdPSEAFjOrBhOMjan1
X-Proofpoint-GUID: d0uEoR33GiE0mVkOwmm-3QXo0mNYtsr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_03,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 spamscore=0 mlxlogscore=955 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202240104
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, npiggin@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two were not migrated so the remote end was starting with the
decrementer expired.

I am seeing less frequent crashes with this patch (tested with -smp 4
and -smp 32). It certainly doesn't fix all issues but it looks like it
helps.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/machine.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 1b63146ed1..7ee1984500 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -9,6 +9,7 @@
 #include "qemu/main-loop.h"
 #include "kvm_ppc.h"
 #include "power8-pmu.h"
+#include "hw/ppc/ppc.h"
 
 static void post_load_update_msr(CPUPPCState *env)
 {
@@ -666,6 +667,18 @@ static const VMStateDescription vmstate_compat = {
     }
 };
 
+static const VMStateDescription vmstate_tb_env = {
+    .name = "cpu/env/tb_env",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT64(tb_offset, ppc_tb_t),
+        VMSTATE_UINT64(decr_next, ppc_tb_t),
+        VMSTATE_TIMER_PTR(decr_timer, ppc_tb_t),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_ppc_cpu = {
     .name = "cpu",
     .version_id = 5,
@@ -696,12 +709,16 @@ const VMStateDescription vmstate_ppc_cpu = {
         /* Backward compatible internal state */
         VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
 
+        VMSTATE_STRUCT_POINTER_V(env.tb_env, PowerPCCPU, 1,
+                                 vmstate_tb_env, ppc_tb_t),
+
         /* Sanity checking */
         VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migration),
         VMSTATE_UINT64_TEST(mig_insns_flags, PowerPCCPU, cpu_pre_2_8_migration),
         VMSTATE_UINT64_TEST(mig_insns_flags2, PowerPCCPU,
                             cpu_pre_2_8_migration),
         VMSTATE_UINT32_TEST(mig_nb_BATs, PowerPCCPU, cpu_pre_2_8_migration),
+
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
-- 
2.34.1


