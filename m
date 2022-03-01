Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759784C8D3D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:04:42 +0100 (CET)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP37J-0006lB-By
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:04:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zq-00066Z-7h; Tue, 01 Mar 2022 08:56:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zl-00024K-Un; Tue, 01 Mar 2022 08:56:57 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DheWK024677; 
 Tue, 1 Mar 2022 13:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Cxw05pZC0POTOxV1un4vnRXNHBkCKylf2CuzNl0z5AI=;
 b=nrDCiM1RYPe4Fgh3rL/WXkdVgRU6lm5mYUjo/DVIJrDP86kPFwZ2Eti2FLiEq42KDj0S
 4a93BwpMQ0r1KnEajYGGeyErOCymZDWwAkpYyfeKzYJLIxPxFCRi2/N2lldQnmslUwfY
 1Ci67q82Rn3sK6ZT6fF02XGp3fq4Lnp8QZHw3P23M6tLOPeyG0Hf2+7IVkAV+yn9HJeY
 B8T9jZwgvyGvUcGAm8zNEBa1N/hOSI3lcm8uf6/0WCXFgxpChrbdo4GKXfck2Z6NtWRu
 0jmTGXA8Ys7aHDqODSAYap3OfKbUKU6lZBGbFhS/X56OlGzs/UjCc1EMYNKDNitOLc0+ Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmmh08a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:41 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DkVeg031652;
 Tue, 1 Mar 2022 13:56:40 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmmh089h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:40 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtmGw030100;
 Tue, 1 Mar 2022 13:56:39 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 3efbu9w0uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DucxC24052204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD6CABE05A;
 Tue,  1 Mar 2022 13:56:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34C01BE058;
 Tue,  1 Mar 2022 13:56:36 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] target/ppc: Move 7xx CPUs code to their own file
Date: Tue,  1 Mar 2022 10:56:08 -0300
Message-Id: <20220301135620.2411952-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Efjx-DU8lETL44mScdVr6h4ctBOrwFg9
X-Proofpoint-ORIG-GUID: W_7GB98h-XNUxCj6MnXUYeDKDpDDbhT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010074
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

Affects the 740, 750, 750cl, 750cx, 750fx, 750gx, 745 and 755.

This moves init_proc, init_excp and register_*sprs functions that are
related to the 7xx CPUs into a separate file.

The same comments from 6xx apply:

- the inclusion of sysemu/hw_accel.h is because of the DABR definition
  that comes from linux-headers kvm.h;

- I'm copying check_pow_hid0 instead of moving it to avoid having to
  keep it exposed in a header file.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_7xx.c   | 896 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c  | 873 ---------------------------------------
 target/ppc/meson.build |   1 +
 3 files changed, 897 insertions(+), 873 deletions(-)
 create mode 100644 target/ppc/cpu_7xx.c

diff --git a/target/ppc/cpu_7xx.c b/target/ppc/cpu_7xx.c
new file mode 100644
index 0000000000..423f4cb97a
--- /dev/null
+++ b/target/ppc/cpu_7xx.c
@@ -0,0 +1,896 @@
+/*
+ * CPU initialization for PowerPC 7xx CPUs
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
+static void register_745_sprs(CPUPPCState *env)
+{
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
+
+    /* Hardware implementation registers */
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
+}
+
+static void register_755_sprs(CPUPPCState *env)
+{
+    /* L2 cache control */
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+
+    spr_register(env, SPR_L2PMCR, "L2PMCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+/* SPR common to all 7xx PowerPC implementations */
+static void register_7xx_sprs(CPUPPCState *env)
+{
+    /* Breakpoints */
+    spr_register_kvm(env, SPR_DABR, "DABR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     KVM_REG_PPC_DABR, 0x00000000);
+
+    spr_register(env, SPR_IABR, "IABR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Cache management */
+    spr_register(env, SPR_ICTC, "ICTC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Performance monitors */
+    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
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
+    spr_register(env, SPR_7XX_PMC3, "PMC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC4, "PMC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_SIAR, "SIAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC1, "UPMC1",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC2, "UPMC2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC3, "UPMC3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC4, "UPMC4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_USIAR, "USIAR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
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
+
+    spr_register(env, SPR_HID1, "HID1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void init_excp_7x0(CPUPPCState *env)
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
+    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_excp_750cl(CPUPPCState *env)
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
+static void init_excp_750cx(CPUPPCState *env)
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
+    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+/* XXX: Check if this is correct */
+static void init_excp_7x5(CPUPPCState *env)
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
+    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
+    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
+    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
+    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
+    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_proc_740(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+    /* Thermal management */
+    register_thrm_sprs(env);
+
+    /* Memory management */
+    register_low_BATs(env);
+    init_excp_7x0(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_750(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+    /* Thermal management */
+    register_thrm_sprs(env);
+
+    /* Memory management */
+    register_low_BATs(env);
+    /*
+     * XXX: high BATs are also present but are known to be bugged on
+     *      die version 1.x
+     */
+    init_excp_7x0(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_750cl(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+    /* Thermal management */
+    /* Those registers are fake on 750CL */
+    spr_register(env, SPR_THRM1, "THRM1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_THRM2, "THRM2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_THRM3, "THRM3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_TDCL, "TDCL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_750_TDCH, "TDCH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* DMA */
+    spr_register(env, SPR_750_WPAR, "WPAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_750_DMAL, "DMAL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_750_DMAU, "DMAU",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Hardware implementation registers */
+    spr_register(env, SPR_750CL_HID2, "HID2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750CL_HID4, "HID4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Quantization registers */
+    spr_register(env, SPR_750_GQR0, "GQR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_GQR1, "GQR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_GQR2, "GQR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_GQR3, "GQR3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_GQR4, "GQR4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_GQR5, "GQR5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_GQR6, "GQR6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_750_GQR7, "GQR7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    /* PowerPC 750cl has 8 DBATs and 8 IBATs */
+    register_high_BATs(env);
+    init_excp_750cl(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_750cx(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+    /* Thermal management */
+    register_thrm_sprs(env);
+
+    spr_register(env, SPR_SDA, "SDA",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    /* Memory management */
+    register_low_BATs(env);
+    /* PowerPC 750cx has 8 DBATs and 8 IBATs */
+    register_high_BATs(env);
+    init_excp_750cx(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_750fx(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+    /* Thermal management */
+    register_thrm_sprs(env);
+
+    spr_register(env, SPR_750_THRM4, "THRM4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Hardware implementation registers */
+    spr_register(env, SPR_750FX_HID2, "HID2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
+    register_high_BATs(env);
+    init_excp_7x0(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_750gx(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+    /* Thermal management */
+    register_thrm_sprs(env);
+
+    spr_register(env, SPR_750_THRM4, "THRM4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Hardware implementation registers */
+    spr_register(env, SPR_750FX_HID2, "HID2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
+    register_high_BATs(env);
+    init_excp_7x0(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_745(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_7xx_sprs(env);
+    register_745_sprs(env);
+    /* Thermal management */
+    register_thrm_sprs(env);
+
+    /* Memory management */
+    register_low_BATs(env);
+    register_high_BATs(env);
+    register_6xx_7xx_soft_tlb(env, 64, 2);
+    init_excp_7x5(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_755(CPUPPCState *env)
+{
+    init_proc_745(env);
+    register_755_sprs(env);
+}
+
+POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 740";
+    pcc->init_proc = init_proc_740;
+    pcc->check_pow = check_pow_hid0;
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
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 750";
+    pcc->init_proc = init_proc_750;
+    pcc->check_pow = check_pow_hid0;
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
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 750 CL";
+    pcc->init_proc = init_proc_750cl;
+    pcc->check_pow = check_pow_hid0;
+    /*
+     * XXX: not implemented:
+     * cache lock instructions:
+     * dcbz_l
+     * floating point paired instructions
+     * psq_lux
+     * psq_lx
+     * psq_stux
+     * psq_stx
+     * ps_abs
+     * ps_add
+     * ps_cmpo0
+     * ps_cmpo1
+     * ps_cmpu0
+     * ps_cmpu1
+     * ps_div
+     * ps_madd
+     * ps_madds0
+     * ps_madds1
+     * ps_merge00
+     * ps_merge01
+     * ps_merge10
+     * ps_merge11
+     * ps_mr
+     * ps_msub
+     * ps_mul
+     * ps_muls0
+     * ps_muls1
+     * ps_nabs
+     * ps_neg
+     * ps_nmadd
+     * ps_nmsub
+     * ps_res
+     * ps_rsqrte
+     * ps_sel
+     * ps_sub
+     * ps_sum0
+     * ps_sum1
+     */
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
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 750CX";
+    pcc->init_proc = init_proc_750cx;
+    pcc->check_pow = check_pow_hid0;
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
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 750FX";
+    pcc->init_proc = init_proc_750fx;
+    pcc->check_pow = check_pow_hid0;
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
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 750GX";
+    pcc->init_proc = init_proc_750gx;
+    pcc->check_pow = check_pow_hid0;
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
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 745";
+    pcc->init_proc = init_proc_745;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
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
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 755";
+    pcc->init_proc = init_proc_755;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
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
+    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
+    pcc->excp_model = POWERPC_EXCP_7xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_750;
+    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b828dc1e88..c9a5e020b1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -57,163 +57,6 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
     ppc_store_vscr(env, val);
 }
 
-static void register_745_sprs(CPUPPCState *env)
-{
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
-
-    /* Hardware implementation registers */
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
-}
-
-static void register_755_sprs(CPUPPCState *env)
-{
-    /* L2 cache control */
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-
-    spr_register(env, SPR_L2PMCR, "L2PMCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-/* SPR common to all 7xx PowerPC implementations */
-static void register_7xx_sprs(CPUPPCState *env)
-{
-    /* Breakpoints */
-    spr_register_kvm(env, SPR_DABR, "DABR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     KVM_REG_PPC_DABR, 0x00000000);
-
-    spr_register(env, SPR_IABR, "IABR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Cache management */
-    spr_register(env, SPR_ICTC, "ICTC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Performance monitors */
-    spr_register(env, SPR_7XX_MMCR0, "MMCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_MMCR1, "MMCR1",
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
-    spr_register(env, SPR_7XX_PMC3, "PMC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC4, "PMC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_SIAR, "SIAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UMMCR1, "UMMCR1",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_USIAR, "USIAR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
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
-
-    spr_register(env, SPR_HID1, "HID1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
 #ifdef TARGET_PPC64
 static void register_amr_sprs(CPUPPCState *env)
 {
@@ -947,100 +790,6 @@ static void init_excp_BookE(CPUPPCState *env)
 #endif
 }
 
-static void init_excp_7x0(CPUPPCState *env)
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
-    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
-static void init_excp_750cl(CPUPPCState *env)
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
-static void init_excp_750cx(CPUPPCState *env)
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
-    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
-/* XXX: Check if this is correct */
-static void init_excp_7x5(CPUPPCState *env)
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
-    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
-    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
 static void init_excp_7400(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -2102,628 +1851,6 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
 
 #endif
 
-static void init_proc_740(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    /* Thermal management */
-    register_thrm_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_7x0(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 740";
-    pcc->init_proc = init_proc_740;
-    pcc->check_pow = check_pow_hid0;
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
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_750(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-    /* Thermal management */
-    register_thrm_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    /*
-     * XXX: high BATs are also present but are known to be bugged on
-     *      die version 1.x
-     */
-    init_excp_7x0(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 750";
-    pcc->init_proc = init_proc_750;
-    pcc->check_pow = check_pow_hid0;
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
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_750cl(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-    /* Thermal management */
-    /* Those registers are fake on 750CL */
-    spr_register(env, SPR_THRM1, "THRM1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_THRM2, "THRM2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_THRM3, "THRM3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_TDCL, "TDCL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_750_TDCH, "TDCH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* DMA */
-    spr_register(env, SPR_750_WPAR, "WPAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_750_DMAL, "DMAL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_750_DMAU, "DMAU",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Hardware implementation registers */
-    spr_register(env, SPR_750CL_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750CL_HID4, "HID4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Quantization registers */
-    spr_register(env, SPR_750_GQR0, "GQR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_GQR1, "GQR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_GQR2, "GQR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_GQR3, "GQR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_GQR4, "GQR4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_GQR5, "GQR5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_GQR6, "GQR6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_750_GQR7, "GQR7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    /* PowerPC 750cl has 8 DBATs and 8 IBATs */
-    register_high_BATs(env);
-    init_excp_750cl(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 750 CL";
-    pcc->init_proc = init_proc_750cl;
-    pcc->check_pow = check_pow_hid0;
-    /*
-     * XXX: not implemented:
-     * cache lock instructions:
-     * dcbz_l
-     * floating point paired instructions
-     * psq_lux
-     * psq_lx
-     * psq_stux
-     * psq_stx
-     * ps_abs
-     * ps_add
-     * ps_cmpo0
-     * ps_cmpo1
-     * ps_cmpu0
-     * ps_cmpu1
-     * ps_div
-     * ps_madd
-     * ps_madds0
-     * ps_madds1
-     * ps_merge00
-     * ps_merge01
-     * ps_merge10
-     * ps_merge11
-     * ps_mr
-     * ps_msub
-     * ps_mul
-     * ps_muls0
-     * ps_muls1
-     * ps_nabs
-     * ps_neg
-     * ps_nmadd
-     * ps_nmsub
-     * ps_res
-     * ps_rsqrte
-     * ps_sel
-     * ps_sub
-     * ps_sum0
-     * ps_sum1
-     */
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
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_750cx(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-    /* Thermal management */
-    register_thrm_sprs(env);
-
-    spr_register(env, SPR_SDA, "SDA",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    /* Memory management */
-    register_low_BATs(env);
-    /* PowerPC 750cx has 8 DBATs and 8 IBATs */
-    register_high_BATs(env);
-    init_excp_750cx(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 750CX";
-    pcc->init_proc = init_proc_750cx;
-    pcc->check_pow = check_pow_hid0;
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
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_750fx(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-    /* Thermal management */
-    register_thrm_sprs(env);
-
-    spr_register(env, SPR_750_THRM4, "THRM4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Hardware implementation registers */
-    spr_register(env, SPR_750FX_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
-    register_high_BATs(env);
-    init_excp_7x0(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 750FX";
-    pcc->init_proc = init_proc_750fx;
-    pcc->check_pow = check_pow_hid0;
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
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_750gx(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-    /* Thermal management */
-    register_thrm_sprs(env);
-
-    spr_register(env, SPR_750_THRM4, "THRM4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Hardware implementation registers */
-    spr_register(env, SPR_750FX_HID2, "HID2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    /* PowerPC 750fx & 750gx has 8 DBATs and 8 IBATs */
-    register_high_BATs(env);
-    init_excp_7x0(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 750GX";
-    pcc->init_proc = init_proc_750gx;
-    pcc->check_pow = check_pow_hid0;
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
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_745(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_7xx_sprs(env);
-    register_745_sprs(env);
-    /* Thermal management */
-    register_thrm_sprs(env);
-
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    register_6xx_7xx_soft_tlb(env, 64, 2);
-    init_excp_7x5(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 745";
-    pcc->init_proc = init_proc_745;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
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
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_755(CPUPPCState *env)
-{
-    init_proc_745(env);
-    register_755_sprs(env);
-}
-
-POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 755";
-    pcc->init_proc = init_proc_755;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC | PPC_6xx_TLB |
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
-    pcc->mmu_model = POWERPC_MMU_SOFT_6xx;
-    pcc->excp_model = POWERPC_EXCP_7xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_750;
-    pcc->flags = POWERPC_FLAG_SE | POWERPC_FLAG_BE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
 static void init_proc_7400(CPUPPCState *env)
 {
     register_non_embedded_sprs(env);
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index f4ded2ecdc..f665802d5e 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -5,6 +5,7 @@ ppc_ss.add(files(
   'cpu_init.c',
   'cpu_40x.c',
   'cpu_6xx.c',
+  'cpu_7xx.c',
   'excp_helper.c',
   'gdbstub.c',
   'helper_regs.c',
-- 
2.34.1


