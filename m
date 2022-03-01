Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D387B4C8D49
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:06:47 +0100 (CET)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP39K-0000iu-PN
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zp-00062x-1L; Tue, 01 Mar 2022 08:56:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zk-00024B-Ig; Tue, 01 Mar 2022 08:56:56 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221Dm0Ma002611; 
 Tue, 1 Mar 2022 13:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yfO/43Kx0ET4YFyIzGIJElmtTI1DK9sbtaK6izICAEw=;
 b=n+tPWKRPXA6ulTORfDhr7CuNEcrhthZXRum/BuaW8VS+gUDZ78hNlp2YuvEHkdY0uvem
 cOuaRVUIrREoUkkkUUPx8vBLyfi4+ilyaZgpnPECKgwgyWpWCIYIEyhukxiwnYPlwzR4
 1/MWXhvuh/VS5k3XBa2/jkqZnJoPLmbFKLNHwqenowZ5RgtLKt8Q70fm5ZCiwtziqu6P
 5ClDJ2ajD4rB/GQ0vTqYTLzxMA0EVmzgmblbgP/1YStLF717d6WJqhVPvOVr+9JVQ1LQ
 p5m+rmLaoCcGgKQbnHHXtHwh4AlFbvw+++Au7y1tevzCwJcD2T7+cyCpIaaVVkngHkgf aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehgc6pha7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:39 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221CqgXw022577;
 Tue, 1 Mar 2022 13:56:38 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehgc6ph9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:38 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Dtwso002084;
 Tue, 1 Mar 2022 13:56:37 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3efbu9v52x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:37 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuZYt11993442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7105BE053;
 Tue,  1 Mar 2022 13:56:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC9D1BE04F;
 Tue,  1 Mar 2022 13:56:33 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:33 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] target/ppc: Move 6xx CPUs code to their own file
Date: Tue,  1 Mar 2022 10:56:07 -0300
Message-Id: <20220301135620.2411952-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gKOg4rhtT691Jbxo76fyBGErB0kc1kGj
X-Proofpoint-ORIG-GUID: FnkzMOzxI7FDUBOFI5VrCHV-oI7CIlDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010074
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

Affects the MPC5xx, MPC8xx, G2, G2LE, 603, 603e, e300, 604 and 604e.

This moves init_proc, init_excp and register_*sprs functions that are
related to the 6xx CPUs into a separate file.

Some points:

- the inclusion of sysemu/hw_accel.h is because of the DABR definition
  that comes from linux-headers kvm.h;

- I'm copying check_pow_hid0 instead of moving it to avoid having to
  keep it exposed in a header file.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_6xx.c   | 1146 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c  | 1129 ---------------------------------------
 target/ppc/meson.build |    1 +
 3 files changed, 1147 insertions(+), 1129 deletions(-)
 create mode 100644 target/ppc/cpu_6xx.c

diff --git a/target/ppc/cpu_6xx.c b/target/ppc/cpu_6xx.c
new file mode 100644
index 0000000000..a909f79e87
--- /dev/null
+++ b/target/ppc/cpu_6xx.c
@@ -0,0 +1,1146 @@
+/*
+ * CPU initialization for PowerPC 6xx CPUs
+ *
+ *  Copyright IBM Corp. 2022
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/hw_accel.h"
+#include "hw/ppc/ppc.h"
+#include "cpu.h"
+#include "spr_common.h"
+
+static int check_pow_hid0(CPUPPCState *env)
+{
+    if (env->spr[SPR_HID0] & 0x00E00000) {
+        return 1;
+    }
+
+    return 0;
+}
+
+static void register_5xx_8xx_sprs(CPUPPCState *env)
+{
+    /* Exception processing */
+    spr_register_kvm(env, SPR_DSISR, "DSISR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DSISR, 0x00000000);
+    spr_register_kvm(env, SPR_DAR, "DAR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DAR, 0x00000000);
+    /* Timer */
+    spr_register(env, SPR_DECR, "DECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_decr, &spr_write_decr,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_EIE, "EIE",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_EID, "EID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_NRI, "NRI",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPA, "CMPA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPB, "CMPB",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPC, "CMPC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPD, "CMPD",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_ECR, "ECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_DER, "DER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_COUNTA, "COUNTA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_COUNTB, "COUNTB",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPE, "CMPE",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPF, "CMPF",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPG, "CMPG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_CMPH, "CMPH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_LCTRL1, "LCTRL1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_LCTRL2, "LCTRL2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_BAR, "BAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_DPDR, "DPDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_IMMR, "IMMR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void register_5xx_sprs(CPUPPCState *env)
+{
+    spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_GRA, "L2U_GRA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RPCU_BBCMCR, "L2U_BBCMCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_MCR, "L2U_MCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RBA0, "MI_RBA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RBA1, "MI_RBA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RBA2, "MI_RBA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RBA3, "MI_RBA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RBA0, "L2U_RBA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RBA1, "L2U_RBA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RBA2, "L2U_RBA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RBA3, "L2U_RBA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RA0, "MI_RA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RA1, "MI_RA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RA2, "MI_RA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_MI_RA3, "MI_RA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RA0, "L2U_RA0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RA1, "L2U_RA1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RA2, "L2U_RA2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_L2U_RA3, "L2U_RA3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_RCPU_FPECR, "FPECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void register_8xx_sprs(CPUPPCState *env)
+{
+
+    spr_register(env, SPR_MPC_IC_CST, "IC_CST",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_IC_ADR, "IC_ADR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_IC_DAT, "IC_DAT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_DC_CST, "DC_CST",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_DC_ADR, "DC_ADR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_DC_DAT, "DC_DAT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_CTR, "MI_CTR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_AP, "MI_AP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_EPN, "MI_EPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_TWC, "MI_TWC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_RPN, "MI_RPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_DBCAM, "MI_DBCAM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_DBRAM0, "MI_DBRAM0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MI_DBRAM1, "MI_DBRAM1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_CTR, "MD_CTR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_CASID, "MD_CASID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_AP, "MD_AP",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_EPN, "MD_EPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_TWB, "MD_TWB",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_TWC, "MD_TWC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_RPN, "MD_RPN",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_TW, "MD_TW",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_DBCAM, "MD_DBCAM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_DBRAM0, "MD_DBRAM0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MPC_MD_DBRAM1, "MD_DBRAM1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void register_G2_sprs(CPUPPCState *env)
+{
+    /* Memory base address */
+    /* MBAR */
+    spr_register(env, SPR_MBAR, "MBAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Exception processing */
+    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Breakpoints */
+    spr_register(env, SPR_DABR, "DABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_DABR2, "DABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_IABR2, "IABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_IBCR, "IBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_DBCR, "DBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    /* External access control */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Hardware implementation register */
+    spr_register(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_HID1, "HID1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_HID2, "HID2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    /* SGPRs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void register_603_sprs(CPUPPCState *env)
+{
+    /* External access control */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Breakpoints */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_HID1, "HID1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void register_e300_sprs(CPUPPCState *env)
+{
+    /* hardware implementation registers */
+    spr_register(env, SPR_HID2, "HID2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Breakpoints */
+    spr_register(env, SPR_DABR, "DABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_DABR2, "DABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_IABR2, "IABR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_IBCR, "IBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_DBCR, "DBCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void register_604_sprs(CPUPPCState *env)
+{
+    /* Processor identification */
+    spr_register(env, SPR_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+    /* Breakpoints */
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register_kvm(env, SPR_DABR, "DABR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABR, 0x00000000);
+    /* Performance counters */
+    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC1, "PMC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC2, "PMC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_SIAR, "SIAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_SDA, "SDA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* External access control */
+    spr_register(env, SPR_EAR, "EAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    /* Hardware implementation registers */
+    spr_register(env, SPR_HID0, "HID0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void register_604e_sprs(CPUPPCState *env)
+{
+    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC3, "PMC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC4, "PMC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Hardware implementation registers */
+    spr_register(env, SPR_HID1, "HID1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void init_excp_MPC5xx(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
+    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
+    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
+    env->excp_vectors[POWERPC_EXCP_FPA]      = 0x00000E00;
+    env->excp_vectors[POWERPC_EXCP_EMUL]     = 0x00001000;
+    env->excp_vectors[POWERPC_EXCP_DABR]     = 0x00001C00;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001C00;
+    env->excp_vectors[POWERPC_EXCP_MEXTBR]   = 0x00001E00;
+    env->excp_vectors[POWERPC_EXCP_NMEXTBR]  = 0x00001F00;
+    env->ivor_mask = 0x0000FFF0UL;
+    env->ivpr_mask = 0xFFFF0000UL;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_excp_MPC8xx(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
+    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
+    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
+    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
+    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
+    env->excp_vectors[POWERPC_EXCP_FPA]      = 0x00000E00;
+    env->excp_vectors[POWERPC_EXCP_EMUL]     = 0x00001000;
+    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00001100;
+    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00001200;
+    env->excp_vectors[POWERPC_EXCP_ITLBE]    = 0x00001300;
+    env->excp_vectors[POWERPC_EXCP_DTLBE]    = 0x00001400;
+    env->excp_vectors[POWERPC_EXCP_DABR]     = 0x00001C00;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001C00;
+    env->excp_vectors[POWERPC_EXCP_MEXTBR]   = 0x00001E00;
+    env->excp_vectors[POWERPC_EXCP_NMEXTBR]  = 0x00001F00;
+    env->ivor_mask = 0x0000FFF0UL;
+    env->ivpr_mask = 0xFFFF0000UL;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_excp_G2(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
+    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
+    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
+    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000A00;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
+    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
+    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
+    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
+    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
+    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_excp_603(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
+    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
+    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
+    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
+    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
+    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
+    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
+    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
+    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_excp_604(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
+    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
+    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
+    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
+    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
+    env->excp_vectors[POWERPC_EXCP_PERFM]    = 0x00000F00;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
+    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_proc_MPC5xx(CPUPPCState *env)
+{
+    register_5xx_8xx_sprs(env);
+    register_5xx_sprs(env);
+    init_excp_MPC5xx(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* XXX: TODO: allocate internal IRQ controller */
+}
+
+static void init_proc_MPC8xx(CPUPPCState *env)
+{
+    register_5xx_8xx_sprs(env);
+    register_8xx_sprs(env);
+    init_excp_MPC8xx(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* XXX: TODO: allocate internal IRQ controller */
+}
+
+static void init_proc_G2(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_G2_sprs(env);
+
+    /* Memory management */
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
+    init_excp_G2(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_603(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_603_sprs(env);
+
+    /* Memory management */
+    register_low_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
+    init_excp_603(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_e300(CPUPPCState *env)
+{
+    init_proc_603(env);
+    register_e300_sprs(env);
+}
+
+static void init_proc_604(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_604_sprs(env);
+
+    /* Memory management */
+    register_low_BATs(env);
+    init_excp_604(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_604E(CPUPPCState *env)
+{
+    init_proc_604(env);
+    register_604e_sprs(env);
+}
+
+POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "Freescale 5xx cores (aka RCPU)";
+    pcc->init_proc = init_proc_MPC5xx;
+    pcc->check_pow = check_pow_none;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
+                       PPC_MEM_EIEIO | PPC_MEM_SYNC |
+                       PPC_CACHE_ICBI | PPC_FLOAT | PPC_FLOAT_STFIWX |
+                       PPC_MFTB;
+    pcc->msr_mask = (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_REAL;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_RCPU;
+    pcc->bfd_mach = bfd_mach_ppc_505;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "Freescale 8xx cores (aka PowerQUICC)";
+    pcc->init_proc = init_proc_MPC8xx;
+    pcc->check_pow = check_pow_none;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING  |
+                       PPC_MEM_EIEIO | PPC_MEM_SYNC |
+                       PPC_CACHE_ICBI | PPC_MFTB;
+    pcc->msr_mask = (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_MPC8xx;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_RCPU;
+    pcc->bfd_mach = bfd_mach_ppc_860;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC G2";
+    pcc->init_proc = init_proc_G2;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_TGPR) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_AL) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_RI);
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_ec603e;
+    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC G2LE";
+    pcc->init_proc = init_proc_G2;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_TGPR) |
+                    (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_AL) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_ec603e;
+    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 603";
+    pcc->init_proc = init_proc_603;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_TGPR) |
+                    (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_603;
+    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 603e";
+    pcc->init_proc = init_proc_603;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_TGPR) |
+                    (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_ec603e;
+    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e300 core";
+    pcc->init_proc = init_proc_e300;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_TGPR) |
+                    (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_AL) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_603;
+    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 604";
+    pcc->init_proc = init_proc_604;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_PMM) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_32B;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_604;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 604E";
+    pcc->init_proc = init_proc_604E;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_SEGMENT | PPC_EXTERN;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_ILE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_SE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_EP) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_PMM) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_LE);
+    pcc->mmu_model = POWERPC_MMU_32B;
+    pcc->excp_model = POWERPC_EXCP_6xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_604;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 28c017b048..b828dc1e88 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -259,233 +259,6 @@ static void register_iamr_sprs(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
 
-/* SPR specific to PowerPC 604 implementation */
-static void register_604_sprs(CPUPPCState *env)
-{
-    /* Processor identification */
-    spr_register(env, SPR_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-    /* Breakpoints */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register_kvm(env, SPR_DABR, "DABR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DABR, 0x00000000);
-    /* Performance counters */
-    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC1, "PMC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC2, "PMC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_SIAR, "SIAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_SDA, "SDA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* External access control */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    /* Hardware implementation registers */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void register_604e_sprs(CPUPPCState *env)
-{
-    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC3, "PMC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC4, "PMC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Hardware implementation registers */
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 603 implementation */
-static void register_603_sprs(CPUPPCState *env)
-{
-    /* External access control */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Breakpoints */
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void register_e300_sprs(CPUPPCState *env)
-{
-    /* hardware implementation registers */
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Breakpoints */
-    spr_register(env, SPR_DABR, "DABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_DABR2, "DABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_IABR2, "IABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_IBCR, "IBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_DBCR, "DBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC G2 implementation */
-static void register_G2_sprs(CPUPPCState *env)
-{
-    /* Memory base address */
-    /* MBAR */
-    spr_register(env, SPR_MBAR, "MBAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Exception processing */
-    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Breakpoints */
-    spr_register(env, SPR_DABR, "DABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_DABR2, "DABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_IABR2, "IABR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_IBCR, "IBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_DBCR, "DBCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    /* External access control */
-    spr_register(env, SPR_EAR, "EAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Hardware implementation register */
-    spr_register(env, SPR_HID0, "HID0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    /* SGPRs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
 static void register_74xx_sprs(CPUPPCState *env)
 {
     /* Breakpoints */
@@ -1081,361 +854,6 @@ static void register_440_sprs(CPUPPCState *env)
                  0x00000000);
 }
 
-static void register_5xx_8xx_sprs(CPUPPCState *env)
-{
-    /* Exception processing */
-    spr_register_kvm(env, SPR_DSISR, "DSISR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DSISR, 0x00000000);
-    spr_register_kvm(env, SPR_DAR, "DAR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DAR, 0x00000000);
-    /* Timer */
-    spr_register(env, SPR_DECR, "DECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_decr, &spr_write_decr,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_EIE, "EIE",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_EID, "EID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_NRI, "NRI",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPA, "CMPA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPB, "CMPB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPC, "CMPC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPD, "CMPD",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_ECR, "ECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_DER, "DER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_COUNTA, "COUNTA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_COUNTB, "COUNTB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPE, "CMPE",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPF, "CMPF",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPG, "CMPG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_CMPH, "CMPH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_LCTRL1, "LCTRL1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_LCTRL2, "LCTRL2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_BAR, "BAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_DPDR, "DPDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_IMMR, "IMMR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void register_5xx_sprs(CPUPPCState *env)
-{
-    spr_register(env, SPR_RCPU_MI_GRA, "MI_GRA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_GRA, "L2U_GRA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RPCU_BBCMCR, "L2U_BBCMCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_MCR, "L2U_MCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RBA0, "MI_RBA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RBA1, "MI_RBA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RBA2, "MI_RBA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RBA3, "MI_RBA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RBA0, "L2U_RBA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RBA1, "L2U_RBA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RBA2, "L2U_RBA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RBA3, "L2U_RBA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RA0, "MI_RA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RA1, "MI_RA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RA2, "MI_RA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_MI_RA3, "MI_RA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RA0, "L2U_RA0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RA1, "L2U_RA1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RA2, "L2U_RA2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_L2U_RA3, "L2U_RA3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_RCPU_FPECR, "FPECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-static void register_8xx_sprs(CPUPPCState *env)
-{
-
-    spr_register(env, SPR_MPC_IC_CST, "IC_CST",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_IC_ADR, "IC_ADR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_IC_DAT, "IC_DAT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_DC_CST, "DC_CST",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_DC_ADR, "DC_ADR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_DC_DAT, "DC_DAT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_CTR, "MI_CTR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_AP, "MI_AP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_EPN, "MI_EPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_TWC, "MI_TWC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_RPN, "MI_RPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_DBCAM, "MI_DBCAM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_DBRAM0, "MI_DBRAM0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MI_DBRAM1, "MI_DBRAM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_CTR, "MD_CTR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_CASID, "MD_CASID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_AP, "MD_AP",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_EPN, "MD_EPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_TWB, "MD_TWB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_TWC, "MD_TWC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_RPN, "MD_RPN",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_TW, "MD_TW",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_DBCAM, "MD_DBCAM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_DBRAM0, "MD_DBRAM0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MPC_MD_DBRAM1, "MD_DBRAM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
 /*
  * AMR     => SPR 29 (Power 2.04)
  * CTRL    => SPR 136 (Power 2.04)
@@ -1467,87 +885,6 @@ static void register_8xx_sprs(CPUPPCState *env)
 /*****************************************************************************/
 /* Exception vectors models                                                  */
 
-static void init_excp_MPC5xx(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
-    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
-    env->excp_vectors[POWERPC_EXCP_FPA]      = 0x00000E00;
-    env->excp_vectors[POWERPC_EXCP_EMUL]     = 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_DABR]     = 0x00001C00;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001C00;
-    env->excp_vectors[POWERPC_EXCP_MEXTBR]   = 0x00001E00;
-    env->excp_vectors[POWERPC_EXCP_NMEXTBR]  = 0x00001F00;
-    env->ivor_mask = 0x0000FFF0UL;
-    env->ivpr_mask = 0xFFFF0000UL;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
-static void init_excp_MPC8xx(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
-    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
-    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
-    env->excp_vectors[POWERPC_EXCP_FPA]      = 0x00000E00;
-    env->excp_vectors[POWERPC_EXCP_EMUL]     = 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00001200;
-    env->excp_vectors[POWERPC_EXCP_ITLBE]    = 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_DTLBE]    = 0x00001400;
-    env->excp_vectors[POWERPC_EXCP_DABR]     = 0x00001C00;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001C00;
-    env->excp_vectors[POWERPC_EXCP_MEXTBR]   = 0x00001E00;
-    env->excp_vectors[POWERPC_EXCP_NMEXTBR]  = 0x00001F00;
-    env->ivor_mask = 0x0000FFF0UL;
-    env->ivpr_mask = 0xFFFF0000UL;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
-static void init_excp_G2(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
-    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
-    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
-    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000A00;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
-    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
 static void init_excp_e200(CPUPPCState *env, target_ulong ivpr_mask)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1610,52 +947,6 @@ static void init_excp_BookE(CPUPPCState *env)
 #endif
 }
 
-static void init_excp_603(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
-    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
-    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
-    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
-static void init_excp_604(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
-    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
-    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
-    env->excp_vectors[POWERPC_EXCP_PERFM]    = 0x00000F00;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
 static void init_excp_7x0(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -2192,186 +1483,6 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
 }
 
-static void init_proc_MPC5xx(CPUPPCState *env)
-{
-    register_5xx_8xx_sprs(env);
-    register_5xx_sprs(env);
-    init_excp_MPC5xx(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* XXX: TODO: allocate internal IRQ controller */
-}
-
-POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "Freescale 5xx cores (aka RCPU)";
-    pcc->init_proc = init_proc_MPC5xx;
-    pcc->check_pow = check_pow_none;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
-                       PPC_MEM_EIEIO | PPC_MEM_SYNC |
-                       PPC_CACHE_ICBI | PPC_FLOAT | PPC_FLOAT_STFIWX |
-                       PPC_MFTB;
-    pcc->msr_mask = (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_REAL;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_RCPU;
-    pcc->bfd_mach = bfd_mach_ppc_505;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_MPC8xx(CPUPPCState *env)
-{
-    register_5xx_8xx_sprs(env);
-    register_8xx_sprs(env);
-    init_excp_MPC8xx(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* XXX: TODO: allocate internal IRQ controller */
-}
-
-POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "Freescale 8xx cores (aka PowerQUICC)";
-    pcc->init_proc = init_proc_MPC8xx;
-    pcc->check_pow = check_pow_none;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING  |
-                       PPC_MEM_EIEIO | PPC_MEM_SYNC |
-                       PPC_CACHE_ICBI | PPC_MFTB;
-    pcc->msr_mask = (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_MPC8xx;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_RCPU;
-    pcc->bfd_mach = bfd_mach_ppc_860;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-/* Freescale 82xx cores (aka PowerQUICC-II)                                  */
-
-static void init_proc_G2(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_G2_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
-    init_excp_G2(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC G2";
-    pcc->init_proc = init_proc_G2;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_TGPR) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_AL) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI);
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_ec603e;
-    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
-}
-
-POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC G2LE";
-    pcc->init_proc = init_proc_G2;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_TGPR) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_AL) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_ec603e;
-    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
-}
-
 static void init_proc_e200(CPUPPCState *env)
 {
     register_BookE_sprs(env, 0x000000070000FFFFULL);
@@ -2991,246 +2102,6 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
 
 #endif
 
-/* Non-embedded PowerPC                                                      */
-static void init_proc_603(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_603_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
-    init_excp_603(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 603";
-    pcc->init_proc = init_proc_603;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_TGPR) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_603;
-    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
-}
-
-POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 603e";
-    pcc->init_proc = init_proc_603;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_TGPR) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_ec603e;
-    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_e300(CPUPPCState *env)
-{
-    init_proc_603(env);
-    register_e300_sprs(env);
-}
-
-POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e300 core";
-    pcc->init_proc = init_proc_e300;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_TGPR) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_AL) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_603;
-    pcc->flags = POWERPC_FLAG_TGPR | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_604(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_604_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_604(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 604";
-    pcc->init_proc = init_proc_604;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_PMM) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_604;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_604E(CPUPPCState *env)
-{
-    init_proc_604(env);
-    register_604e_sprs(env);
-}
-
-POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 604E";
-    pcc->init_proc = init_proc_604E;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_SEGMENT | PPC_EXTERN;
-    pcc->msr_mask = (1ull << MSR_POW) |
-                    (1ull << MSR_ILE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_SE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_EP) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_PMM) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_LE);
-    pcc->mmu_model = POWERPC_MMU_32B;
-    pcc->excp_model = POWERPC_EXCP_6xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_604;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
 static void init_proc_740(CPUPPCState *env)
 {
     register_non_embedded_sprs(env);
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 45f7802da5..f4ded2ecdc 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -4,6 +4,7 @@ ppc_ss.add(files(
   'cpu.c',
   'cpu_init.c',
   'cpu_40x.c',
+  'cpu_6xx.c',
   'excp_helper.c',
   'gdbstub.c',
   'helper_regs.c',
-- 
2.34.1


