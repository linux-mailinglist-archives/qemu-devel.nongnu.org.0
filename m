Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E5F4C8D26
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:00:05 +0100 (CET)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP32q-0000u1-3v
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:00:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zm-0005xB-6s; Tue, 01 Mar 2022 08:56:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zi-00023t-3X; Tue, 01 Mar 2022 08:56:53 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DhbgZ024619; 
 Tue, 1 Mar 2022 13:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=typ68s94trfFbZw4LrpwiVud+345gkPCG4USD76bDec=;
 b=AK1LjvO97eIGchujh+wU+DM8I8vXoBipp26vSeV68OCs1QR5mRr7Gmr2w4xztMLaVhLT
 JNm4oi5Zj30zw4surjRnLAjciqF1LagNrH7jr23rHu5tI1BTSJVVU4eWWbqE8rXSIciy
 sYHLKYu0s0Dmx3eQjCyCVQHElGyqp67DomfG4PjTJp61tkuVEFVk6fymqDvdqC1sFmQ+
 eNy9H9dIA1m2G0nR7IhCnwFvx3hY0EHuoqxETnPb/iXhMIdLsyk44zHeyAzRIM4AdNtu
 W1AWHOZM9qjXk7QMHn9YmU5u6JQbSyG78LJh5NX0ufoVeznZe+IaZfdMUwDnIcvbqWoG cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmmh08b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:43 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DrDNR026013;
 Tue, 1 Mar 2022 13:56:42 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehmmh08ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:42 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Du2fH010374;
 Tue, 1 Mar 2022 13:56:41 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3efbua50q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuejU28115372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:40 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E574FBE056;
 Tue,  1 Mar 2022 13:56:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B249BE053;
 Tue,  1 Mar 2022 13:56:38 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] target/ppc: Move 74xx CPUs code to their own file
Date: Tue,  1 Mar 2022 10:56:09 -0300
Message-Id: <20220301135620.2411952-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cyu3hc8OQJoWi9GLyb5zSVuEd5fodt4f
X-Proofpoint-ORIG-GUID: k6g3nkYeWoovE-UxcCmzqclQ1DrCTX3-
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

Affects the 7400, 7410, 7440, 7450, 7445, 7455, 7457 and e600.

This moves init_proc, init_excp and register_*sprs functions that are
related to the 74xx CPUs into a separate file.

- the inclusion of sysemu/hw_accel.h is because of the DABR definition
  that comes from linux-headers kvm.h;

- I'm copying check_pow_hid0 instead of moving it to avoid having to
  keep it exposed in a header file;

- I'm also copying vscr_init to avoid having to include
  fpu/softfloat.h (due to set_float_rounding_mode) from elsewhere.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_74xx.c  | 1167 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c  | 1136 --------------------------------------
 target/ppc/meson.build |    1 +
 3 files changed, 1168 insertions(+), 1136 deletions(-)
 create mode 100644 target/ppc/cpu_74xx.c

diff --git a/target/ppc/cpu_74xx.c b/target/ppc/cpu_74xx.c
new file mode 100644
index 0000000000..cc530cc405
--- /dev/null
+++ b/target/ppc/cpu_74xx.c
@@ -0,0 +1,1167 @@
+/*
+ * CPU initialization for PowerPC 74xx CPUs
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
+#include "fpu/softfloat.h"
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
+static int check_pow_hid0_74xx(CPUPPCState *env)
+{
+    if (env->spr[SPR_HID0] & 0x00600000) {
+        return 1;
+    }
+
+    return 0;
+}
+
+static inline void vscr_init(CPUPPCState *env, uint32_t val)
+{
+    /* Altivec always uses round-to-nearest */
+    set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
+    ppc_store_vscr(env, val);
+}
+
+static void register_74xx_sprs(CPUPPCState *env)
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
+    /* Processor identification */
+    spr_register(env, SPR_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+
+    spr_register(env, SPR_74XX_MMCR2, "MMCR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_74XX_UMMCR2, "UMMCR2",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_BAMR, "BAMR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MSSCR0, "MSSCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
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
+    /* Altivec */
+    spr_register(env, SPR_VRSAVE, "VRSAVE",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_L2CR, "L2CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, spr_access_nop,
+                 0x00000000);
+}
+
+static void register_l3_ctrl(CPUPPCState *env)
+{
+    /* L3CR */
+    spr_register(env, SPR_L3CR, "L3CR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3ITCR0 */
+    spr_register(env, SPR_L3ITCR0, "L3ITCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3PM */
+    spr_register(env, SPR_L3PM, "L3PM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void init_excp_7400(CPUPPCState *env)
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
+    env->excp_vectors[POWERPC_EXCP_VPU]      = 0x00000F20;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
+    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
+    env->excp_vectors[POWERPC_EXCP_VPUA]     = 0x00001600;
+    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_excp_7450(CPUPPCState *env)
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
+    env->excp_vectors[POWERPC_EXCP_VPU]      = 0x00000F20;
+    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
+    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
+    env->excp_vectors[POWERPC_EXCP_VPUA]     = 0x00001600;
+    /* Hardware reset vector */
+    env->hreset_vector = 0x00000100UL;
+#endif
+}
+
+static void init_proc_7400(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+
+    spr_register(env, SPR_UBAMR, "UBAMR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_MSSCR1, "MSSCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Thermal management */
+    register_thrm_sprs(env);
+    /* Memory management */
+    register_low_BATs(env);
+    init_excp_7400(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_7410(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+
+    spr_register(env, SPR_UBAMR, "UBAMR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* Thermal management */
+    register_thrm_sprs(env);
+    /* L2PMCR */
+
+    spr_register(env, SPR_L2PMCR, "L2PMCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* LDSTDB */
+
+    spr_register(env, SPR_LDSTDB, "LDSTDB",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    init_excp_7400(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_7440(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+
+    spr_register(env, SPR_UBAMR, "UBAMR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* LDSTCR */
+    spr_register(env, SPR_LDSTCR, "LDSTCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* ICTRL */
+    spr_register(env, SPR_ICTRL, "ICTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* MSSSR0 */
+    spr_register(env, SPR_MSSSR0, "MSSSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* PMC */
+    spr_register(env, SPR_7XX_PMC5, "PMC5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC6, "PMC6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    init_excp_7450(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_7450(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+    /* Level 3 cache control */
+    register_l3_ctrl(env);
+    /* L3ITCR1 */
+    spr_register(env, SPR_L3ITCR1, "L3ITCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3ITCR2 */
+    spr_register(env, SPR_L3ITCR2, "L3ITCR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3ITCR3 */
+    spr_register(env, SPR_L3ITCR3, "L3ITCR3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3OHCR */
+    spr_register(env, SPR_L3OHCR, "L3OHCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_UBAMR, "UBAMR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* LDSTCR */
+    spr_register(env, SPR_LDSTCR, "LDSTCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* ICTRL */
+    spr_register(env, SPR_ICTRL, "ICTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* MSSSR0 */
+    spr_register(env, SPR_MSSSR0, "MSSSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* PMC */
+    spr_register(env, SPR_7XX_PMC5, "PMC5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC6, "PMC6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    init_excp_7450(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_7445(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+    /* LDSTCR */
+    spr_register(env, SPR_LDSTCR, "LDSTCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* ICTRL */
+    spr_register(env, SPR_ICTRL, "ICTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* MSSSR0 */
+    spr_register(env, SPR_MSSSR0, "MSSSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* PMC */
+    spr_register(env, SPR_7XX_PMC5, "PMC5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC6, "PMC6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* SPRGs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG4, "USPRG4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG5, "USPRG5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG6, "USPRG6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG7, "USPRG7",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    register_high_BATs(env);
+    init_excp_7450(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_7455(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+    /* Level 3 cache control */
+    register_l3_ctrl(env);
+    /* LDSTCR */
+    spr_register(env, SPR_LDSTCR, "LDSTCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* ICTRL */
+    spr_register(env, SPR_ICTRL, "ICTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* MSSSR0 */
+    spr_register(env, SPR_MSSSR0, "MSSSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* PMC */
+    spr_register(env, SPR_7XX_PMC5, "PMC5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC6, "PMC6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* SPRGs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG4, "USPRG4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG5, "USPRG5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG6, "USPRG6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG7, "USPRG7",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    register_high_BATs(env);
+    init_excp_7450(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_7457(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+    /* Level 3 cache control */
+    register_l3_ctrl(env);
+    /* L3ITCR1 */
+    spr_register(env, SPR_L3ITCR1, "L3ITCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3ITCR2 */
+    spr_register(env, SPR_L3ITCR2, "L3ITCR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3ITCR3 */
+    spr_register(env, SPR_L3ITCR3, "L3ITCR3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* L3OHCR */
+    spr_register(env, SPR_L3OHCR, "L3OHCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* LDSTCR */
+    spr_register(env, SPR_LDSTCR, "LDSTCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* ICTRL */
+    spr_register(env, SPR_ICTRL, "ICTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* MSSSR0 */
+    spr_register(env, SPR_MSSSR0, "MSSSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* PMC */
+    spr_register(env, SPR_7XX_PMC5, "PMC5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC6, "PMC6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* SPRGs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG4, "USPRG4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG5, "USPRG5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG6, "USPRG6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG7, "USPRG7",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    register_high_BATs(env);
+    init_excp_7450(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+static void init_proc_e600(CPUPPCState *env)
+{
+    register_non_embedded_sprs(env);
+    register_sdr1_sprs(env);
+    register_74xx_sprs(env);
+    vscr_init(env, 0x00010000);
+
+    spr_register(env, SPR_UBAMR, "UBAMR",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_LDSTCR, "LDSTCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_ICTRL, "ICTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MSSSR0, "MSSSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC5, "PMC5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_PMC6, "PMC6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* SPRGs */
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG4, "USPRG4",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG5, "USPRG5",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG6, "USPRG6",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_USPRG7, "USPRG7",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    /* Memory management */
+    register_low_BATs(env);
+    register_high_BATs(env);
+    init_excp_7450(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc6xx_irq_init(env_archcpu(env));
+}
+
+POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 7400 (aka G4)";
+    pcc->init_proc = init_proc_7400;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 7410 (aka G4)";
+    pcc->init_proc = init_proc_7410;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 7440 (aka G4)";
+    pcc->init_proc = init_proc_7440;
+    pcc->check_pow = check_pow_hid0_74xx;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 7450 (aka G4)";
+    pcc->init_proc = init_proc_7450;
+    pcc->check_pow = check_pow_hid0_74xx;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 7445 (aka G4)";
+    pcc->init_proc = init_proc_7445;
+    pcc->check_pow = check_pow_hid0_74xx;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 7455 (aka G4)";
+    pcc->init_proc = init_proc_7455;
+    pcc->check_pow = check_pow_hid0_74xx;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 7457 (aka G4)";
+    pcc->init_proc = init_proc_7457;
+    pcc->check_pow = check_pow_hid0_74xx;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC e600";
+    pcc->init_proc = init_proc_e600;
+    pcc->check_pow = check_pow_hid0_74xx;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIA |
+                       PPC_SEGMENT | PPC_EXTERN |
+                       PPC_ALTIVEC;
+    pcc->insns_flags2 = PPC_NONE;
+    pcc->msr_mask = (1ull << MSR_VR) |
+                    (1ull << MSR_POW) |
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
+    pcc->excp_model = POWERPC_EXCP_74xx;
+    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
+    pcc->bfd_mach = bfd_mach_ppc_7400;
+    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
+                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
+                 POWERPC_FLAG_BUS_CLK;
+}
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c9a5e020b1..397a93aa4b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -102,165 +102,6 @@ static void register_iamr_sprs(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
 
-static void register_74xx_sprs(CPUPPCState *env)
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
-    /* Processor identification */
-    spr_register(env, SPR_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-
-    spr_register(env, SPR_74XX_MMCR2, "MMCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_74XX_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_BAMR, "BAMR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MSSCR0, "MSSCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
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
-    /* Altivec */
-    spr_register(env, SPR_VRSAVE, "VRSAVE",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_L2CR, "L2CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, spr_access_nop,
-                 0x00000000);
-}
-
-static void register_l3_ctrl(CPUPPCState *env)
-{
-    /* L3CR */
-    spr_register(env, SPR_L3CR, "L3CR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3ITCR0 */
-    spr_register(env, SPR_L3ITCR0, "L3ITCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3PM */
-    spr_register(env, SPR_L3PM, "L3PM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
 /* PowerPC BookE SPR */
 static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
 {
@@ -790,55 +631,6 @@ static void init_excp_BookE(CPUPPCState *env)
 #endif
 }
 
-static void init_excp_7400(CPUPPCState *env)
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
-    env->excp_vectors[POWERPC_EXCP_VPU]      = 0x00000F20;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
-    env->excp_vectors[POWERPC_EXCP_VPUA]     = 0x00001600;
-    env->excp_vectors[POWERPC_EXCP_THERM]    = 0x00001700;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
-static void init_excp_7450(CPUPPCState *env)
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
-    env->excp_vectors[POWERPC_EXCP_VPU]      = 0x00000F20;
-    env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
-    env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
-    env->excp_vectors[POWERPC_EXCP_VPUA]     = 0x00001600;
-    /* Hardware reset vector */
-    env->hreset_vector = 0x00000100UL;
-#endif
-}
-
 #if defined(TARGET_PPC64)
 static void init_excp_970(CPUPPCState *env)
 {
@@ -939,15 +731,6 @@ static int check_pow_hid0(CPUPPCState *env)
     return 0;
 }
 
-static int check_pow_hid0_74xx(CPUPPCState *env)
-{
-    if (env->spr[SPR_HID0] & 0x00600000) {
-        return 1;
-    }
-
-    return 0;
-}
-
 static void init_proc_440EP(CPUPPCState *env)
 {
     register_BookE_sprs(env, 0x000000000000FFFFULL);
@@ -1851,925 +1634,6 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
 
 #endif
 
-static void init_proc_7400(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_MSSCR1, "MSSCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Thermal management */
-    register_thrm_sprs(env);
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_7400(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 7400 (aka G4)";
-    pcc->init_proc = init_proc_7400;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_7410(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* Thermal management */
-    register_thrm_sprs(env);
-    /* L2PMCR */
-
-    spr_register(env, SPR_L2PMCR, "L2PMCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* LDSTDB */
-
-    spr_register(env, SPR_LDSTDB, "LDSTDB",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_7400(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 7410 (aka G4)";
-    pcc->init_proc = init_proc_7410;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_7440(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* LDSTCR */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* ICTRL */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* MSSSR0 */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* PMC */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_7450(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 7440 (aka G4)";
-    pcc->init_proc = init_proc_7440;
-    pcc->check_pow = check_pow_hid0_74xx;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_7450(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-    /* Level 3 cache control */
-    register_l3_ctrl(env);
-    /* L3ITCR1 */
-    spr_register(env, SPR_L3ITCR1, "L3ITCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3ITCR2 */
-    spr_register(env, SPR_L3ITCR2, "L3ITCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3ITCR3 */
-    spr_register(env, SPR_L3ITCR3, "L3ITCR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3OHCR */
-    spr_register(env, SPR_L3OHCR, "L3OHCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* LDSTCR */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* ICTRL */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* MSSSR0 */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* PMC */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    init_excp_7450(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 7450 (aka G4)";
-    pcc->init_proc = init_proc_7450;
-    pcc->check_pow = check_pow_hid0_74xx;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_7445(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-    /* LDSTCR */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* ICTRL */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* MSSSR0 */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* PMC */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    init_excp_7450(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 7445 (aka G4)";
-    pcc->init_proc = init_proc_7445;
-    pcc->check_pow = check_pow_hid0_74xx;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_7455(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-    /* Level 3 cache control */
-    register_l3_ctrl(env);
-    /* LDSTCR */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* ICTRL */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* MSSSR0 */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* PMC */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    init_excp_7450(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 7455 (aka G4)";
-    pcc->init_proc = init_proc_7455;
-    pcc->check_pow = check_pow_hid0_74xx;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_7457(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-    /* Level 3 cache control */
-    register_l3_ctrl(env);
-    /* L3ITCR1 */
-    spr_register(env, SPR_L3ITCR1, "L3ITCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3ITCR2 */
-    spr_register(env, SPR_L3ITCR2, "L3ITCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3ITCR3 */
-    spr_register(env, SPR_L3ITCR3, "L3ITCR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* L3OHCR */
-    spr_register(env, SPR_L3OHCR, "L3OHCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* LDSTCR */
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* ICTRL */
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* MSSSR0 */
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* PMC */
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    init_excp_7450(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 7457 (aka G4)";
-    pcc->init_proc = init_proc_7457;
-    pcc->check_pow = check_pow_hid0_74xx;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_e600(CPUPPCState *env)
-{
-    register_non_embedded_sprs(env);
-    register_sdr1_sprs(env);
-    register_74xx_sprs(env);
-    vscr_init(env, 0x00010000);
-
-    spr_register(env, SPR_UBAMR, "UBAMR",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_LDSTCR, "LDSTCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_ICTRL, "ICTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MSSSR0, "MSSSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC5, "PMC5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_PMC6, "PMC6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_7XX_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* SPRGs */
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG4, "USPRG4",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG5, "USPRG5",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG6, "USPRG6",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_USPRG7, "USPRG7",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    /* Memory management */
-    register_low_BATs(env);
-    register_high_BATs(env);
-    init_excp_7450(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc6xx_irq_init(env_archcpu(env));
-}
-
-POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC e600";
-    pcc->init_proc = init_proc_e600;
-    pcc->check_pow = check_pow_hid0_74xx;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
-                       PPC_MEM_TLBIA |
-                       PPC_SEGMENT | PPC_EXTERN |
-                       PPC_ALTIVEC;
-    pcc->insns_flags2 = PPC_NONE;
-    pcc->msr_mask = (1ull << MSR_VR) |
-                    (1ull << MSR_POW) |
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
-    pcc->excp_model = POWERPC_EXCP_74xx;
-    pcc->bus_model = PPC_FLAGS_INPUT_6xx;
-    pcc->bfd_mach = bfd_mach_ppc_7400;
-    pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-                 POWERPC_FLAG_BE | POWERPC_FLAG_PMM |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
 #if defined(TARGET_PPC64)
 #if defined(CONFIG_USER_ONLY)
 #define POWERPC970_HID5_INIT 0x00000080
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index f665802d5e..aae1c2051e 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -6,6 +6,7 @@ ppc_ss.add(files(
   'cpu_40x.c',
   'cpu_6xx.c',
   'cpu_7xx.c',
+  'cpu_74xx.c',
   'excp_helper.c',
   'gdbstub.c',
   'helper_regs.c',
-- 
2.34.1


