Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252764C8D3E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:04:49 +0100 (CET)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP37Q-0006ve-6l
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:04:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zq-00066I-4h; Tue, 01 Mar 2022 08:56:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zl-00024G-Ds; Tue, 01 Mar 2022 08:56:57 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221C0Vv4018318; 
 Tue, 1 Mar 2022 13:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tjzvQXSm0s4giTINa6XLCEvuAGDVSC+pY2sow9C55gQ=;
 b=hvVx/0TxeUkFDAOw9fOxtqd/Tnwi4WeOTNHsCkBCptR7J3FPMVWlOTjdDrRlwG/aCN0A
 UZHLZaOwslivb+zQxekyDyvQpryJdUT6CmcSQgT6FnWuaDPfjxtSnanXFaBDLmhYq2w9
 MoJPWG5XaS0AdnBklMgXQxag9DLjSCi4N6EJiLD83wDvGRB9HxFza7pzAOadx+n8ZK6F
 8ZOUUqP/AGTan9nTajMQv3NftLCDUlRK1tebOnUwYBoSa5JQxAcN9T9e6e2z0qiq+uUi
 DVZI9v9w4whVjVO/CYNpVljB6RVB1qQJQ435ldLP7++quFF1ABdNYj7LpUeGDaOJjyoN Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehfrufnwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:46 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221CrHhr012477;
 Tue, 1 Mar 2022 13:56:45 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehfrufnvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:45 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Dtd21030041;
 Tue, 1 Mar 2022 13:56:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3efbu9w0v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221Dug4l34865580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE97CBE05D;
 Tue,  1 Mar 2022 13:56:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 668CCBE056;
 Tue,  1 Mar 2022 13:56:40 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:40 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/17] target/ppc: Move BookE CPUs code to their own file
Date: Tue,  1 Mar 2022 10:56:10 -0300
Message-Id: <20220301135620.2411952-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8TQ85L_5mfKDmDHrfUjApLTepjwV5wnt
X-Proofpoint-GUID: kMmjRESLti2k5THQrLOyPrjHot7IEWQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Affects the 440EP, 460EX, 440GP, 440x5, e200, e500v1, e500v2, e500mc,
e5500 and e6500.

This moves init_proc, init_excp and register_*sprs functions that are
related to the BookE CPUs into a separate file.

- I'm copying check_pow_hid0 instead of moving it to avoid having to
  keep it exposed in a header file;

- Differently from the previous files, this one contains both 32-bit
  and 64-bit code.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_booke.c | 1422 ++++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c  | 1410 ---------------------------------------
 target/ppc/meson.build |    1 +
 3 files changed, 1423 insertions(+), 1410 deletions(-)
 create mode 100644 target/ppc/cpu_booke.c

diff --git a/target/ppc/cpu_booke.c b/target/ppc/cpu_booke.c
new file mode 100644
index 0000000000..18e16bd3bf
--- /dev/null
+++ b/target/ppc/cpu_booke.c
@@ -0,0 +1,1422 @@
+/*
+ * CPU initialization for PowerPC BookE CPUs
+ *
+ *  Copyright IBM Corp. 2022
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
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
+static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
+{
+    const char *ivor_names[64] = {
+        "IVOR0",  "IVOR1",  "IVOR2",  "IVOR3",
+        "IVOR4",  "IVOR5",  "IVOR6",  "IVOR7",
+        "IVOR8",  "IVOR9",  "IVOR10", "IVOR11",
+        "IVOR12", "IVOR13", "IVOR14", "IVOR15",
+        "IVOR16", "IVOR17", "IVOR18", "IVOR19",
+        "IVOR20", "IVOR21", "IVOR22", "IVOR23",
+        "IVOR24", "IVOR25", "IVOR26", "IVOR27",
+        "IVOR28", "IVOR29", "IVOR30", "IVOR31",
+        "IVOR32", "IVOR33", "IVOR34", "IVOR35",
+        "IVOR36", "IVOR37", "IVOR38", "IVOR39",
+        "IVOR40", "IVOR41", "IVOR42", "IVOR43",
+        "IVOR44", "IVOR45", "IVOR46", "IVOR47",
+        "IVOR48", "IVOR49", "IVOR50", "IVOR51",
+        "IVOR52", "IVOR53", "IVOR54", "IVOR55",
+        "IVOR56", "IVOR57", "IVOR58", "IVOR59",
+        "IVOR60", "IVOR61", "IVOR62", "IVOR63",
+    };
+#define SPR_BOOKE_IVORxx (-1)
+    int ivor_sprn[64] = {
+        SPR_BOOKE_IVOR0,  SPR_BOOKE_IVOR1,  SPR_BOOKE_IVOR2,  SPR_BOOKE_IVOR3,
+        SPR_BOOKE_IVOR4,  SPR_BOOKE_IVOR5,  SPR_BOOKE_IVOR6,  SPR_BOOKE_IVOR7,
+        SPR_BOOKE_IVOR8,  SPR_BOOKE_IVOR9,  SPR_BOOKE_IVOR10, SPR_BOOKE_IVOR11,
+        SPR_BOOKE_IVOR12, SPR_BOOKE_IVOR13, SPR_BOOKE_IVOR14, SPR_BOOKE_IVOR15,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVOR32, SPR_BOOKE_IVOR33, SPR_BOOKE_IVOR34, SPR_BOOKE_IVOR35,
+        SPR_BOOKE_IVOR36, SPR_BOOKE_IVOR37, SPR_BOOKE_IVOR38, SPR_BOOKE_IVOR39,
+        SPR_BOOKE_IVOR40, SPR_BOOKE_IVOR41, SPR_BOOKE_IVOR42, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
+    };
+    int i;
+
+    /* Interrupt processing */
+    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Debug */
+    spr_register(env, SPR_BOOKE_IAC1, "IAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_IAC2, "IAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DAC1, "DAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DAC2, "DAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DBCR0, "DBCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_dbcr0,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DBCR1, "DBCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DBCR2, "DBCR2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DSRR0, "DSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DSRR1, "DSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DBSR, "DBSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_clear,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DEAR, "DEAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_ESR, "ESR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_IVPR, "IVPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_excp_prefix,
+                 0x00000000);
+    /* Exception vectors */
+    for (i = 0; i < 64; i++) {
+        if (ivor_mask & (1ULL << i)) {
+            if (ivor_sprn[i] == SPR_BOOKE_IVORxx) {
+                fprintf(stderr, "ERROR: IVOR %d SPR is not defined\n", i);
+                exit(1);
+            }
+            spr_register(env, ivor_sprn[i], ivor_names[i],
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic, &spr_write_excp_vector,
+                         0x00000000);
+        }
+    }
+    spr_register(env, SPR_BOOKE_PID, "PID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_pid,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_TCR, "TCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_tcr,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_TSR, "TSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke_tsr,
+                 0x00000000);
+    /* Timer */
+    spr_register(env, SPR_DECR, "DECR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_decr, &spr_write_decr,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DECAR, "DECAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 SPR_NOACCESS, &spr_write_generic,
+                 0x00000000);
+    /* SPRGs */
+    spr_register(env, SPR_USPRG0, "USPRG0",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
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
+    spr_register(env, SPR_BOOKE_SPRG8, "SPRG8",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_SPRG9, "SPRG9",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+#if !defined(CONFIG_USER_ONLY)
+static inline uint32_t register_tlbncfg(uint32_t assoc, uint32_t minsize,
+                                   uint32_t maxsize, uint32_t flags,
+                                   uint32_t nentries)
+{
+    return (assoc << TLBnCFG_ASSOC_SHIFT) |
+           (minsize << TLBnCFG_MINSIZE_SHIFT) |
+           (maxsize << TLBnCFG_MAXSIZE_SHIFT) |
+           flags | nentries;
+}
+#endif /* !CONFIG_USER_ONLY */
+
+/* BookE 2.06 storage control registers */
+static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
+                             uint32_t *tlbncfg, uint32_t mmucfg)
+{
+#if !defined(CONFIG_USER_ONLY)
+    const char *mas_names[8] = {
+        "MAS0", "MAS1", "MAS2", "MAS3", "MAS4", "MAS5", "MAS6", "MAS7",
+    };
+    int mas_sprn[8] = {
+        SPR_BOOKE_MAS0, SPR_BOOKE_MAS1, SPR_BOOKE_MAS2, SPR_BOOKE_MAS3,
+        SPR_BOOKE_MAS4, SPR_BOOKE_MAS5, SPR_BOOKE_MAS6, SPR_BOOKE_MAS7,
+    };
+    int i;
+
+    /* TLB assist registers */
+    for (i = 0; i < 8; i++) {
+        if (mas_mask & (1 << i)) {
+            spr_register(env, mas_sprn[i], mas_names[i],
+                         SPR_NOACCESS, SPR_NOACCESS,
+                         &spr_read_generic,
+                         (i == 2 && (env->insns_flags & PPC_64B))
+                         ? &spr_write_generic : &spr_write_generic32,
+                         0x00000000);
+        }
+    }
+    if (env->nb_pids > 1) {
+        spr_register(env, SPR_BOOKE_PID1, "PID1",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_booke_pid,
+                     0x00000000);
+    }
+    if (env->nb_pids > 2) {
+        spr_register(env, SPR_BOOKE_PID2, "PID2",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_booke_pid,
+                     0x00000000);
+    }
+
+    spr_register(env, SPR_BOOKE_EPLC, "EPLC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_eplc,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_EPSC, "EPSC",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_epsc,
+                 0x00000000);
+
+    spr_register(env, SPR_MMUCFG, "MMUCFG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 mmucfg);
+    switch (env->nb_ways) {
+    case 4:
+        spr_register(env, SPR_BOOKE_TLB3CFG, "TLB3CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[3]);
+        /* Fallthru */
+    case 3:
+        spr_register(env, SPR_BOOKE_TLB2CFG, "TLB2CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[2]);
+        /* Fallthru */
+    case 2:
+        spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[1]);
+        /* Fallthru */
+    case 1:
+        spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     tlbncfg[0]);
+        /* Fallthru */
+    case 0:
+    default:
+        break;
+    }
+#endif
+}
+
+static void register_440_sprs(CPUPPCState *env)
+{
+    /* Cache control */
+    spr_register(env, SPR_440_DNV0, "DNV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DNV1, "DNV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DNV2, "DNV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DNV3, "DNV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DTV0, "DTV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DTV1, "DTV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DTV2, "DTV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DTV3, "DTV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DVLIM, "DVLIM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_INV0, "INV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_INV1, "INV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_INV2, "INV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_INV3, "INV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_ITV0, "ITV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_ITV1, "ITV1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_ITV2, "ITV2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_ITV3, "ITV3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_IVLIM, "IVLIM",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Cache debug */
+    spr_register(env, SPR_BOOKE_DCDBTRH, "DCDBTRH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DCDBTRL, "DCDBTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_ICDBTRH, "ICDBTRH",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_ICDBTRL, "ICDBTRL",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_440_DBDR, "DBDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Processor control */
+    spr_register(env, SPR_4xx_CCR0, "CCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_440_RSTCFG, "RSTCFG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* Storage control */
+    spr_register(env, SPR_440_MMUCR, "MMUCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    /* Processor identification */
+    spr_register(env, SPR_BOOKE_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void init_excp_e200(CPUPPCState *env, target_ulong ivpr_mask)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000FFC;
+    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_APU]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00000000;
+    /*
+     * These two are the same IVOR as POWERPC_EXCP_VPU and
+     * POWERPC_EXCP_VPUA. We deal with that when dispatching at
+     * powerpc_excp().
+     */
+    env->excp_vectors[POWERPC_EXCP_SPEU]     = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_EFPDI]    = 0x00000000;
+
+    env->excp_vectors[POWERPC_EXCP_EFPRI]    = 0x00000000;
+    env->ivor_mask = 0x0000FFF7UL;
+    env->ivpr_mask = ivpr_mask;
+    /* Hardware reset vector */
+    env->hreset_vector = 0xFFFFFFFCUL;
+#endif
+}
+
+static void init_excp_BookE(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_APU]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00000000;
+    env->ivor_mask = 0x0000FFF0UL;
+    env->ivpr_mask = 0xFFFF0000UL;
+    /* Hardware reset vector */
+    env->hreset_vector = 0xFFFFFFFCUL;
+#endif
+}
+
+static void init_proc_440EP(CPUPPCState *env)
+{
+    register_BookE_sprs(env, 0x000000000000FFFFULL);
+    register_440_sprs(env);
+    register_usprgh_sprs(env);
+
+    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_CCR1, "CCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Memory management */
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = 64;
+    env->nb_ways = 1;
+    env->id_tlbs = 0;
+    env->tlb_type = TLB_EMB;
+#endif
+    init_excp_BookE(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    ppc40x_irq_init(env_archcpu(env));
+
+    SET_FIT_PERIOD(12, 16, 20, 24);
+    SET_WDT_PERIOD(20, 24, 28, 32);
+}
+
+static void init_proc_440GP(CPUPPCState *env)
+{
+    register_BookE_sprs(env, 0x000000000000FFFFULL);
+    register_440_sprs(env);
+    register_usprgh_sprs(env);
+
+    /* Memory management */
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = 64;
+    env->nb_ways = 1;
+    env->id_tlbs = 0;
+    env->tlb_type = TLB_EMB;
+#endif
+    init_excp_BookE(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* XXX: TODO: allocate internal IRQ controller */
+
+    SET_FIT_PERIOD(12, 16, 20, 24);
+    SET_WDT_PERIOD(20, 24, 28, 32);
+}
+
+static void init_proc_440x5(CPUPPCState *env)
+{
+    register_BookE_sprs(env, 0x000000000000FFFFULL);
+    register_440_sprs(env);
+    register_usprgh_sprs(env);
+
+    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_440_CCR1, "CCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Memory management */
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = 64;
+    env->nb_ways = 1;
+    env->id_tlbs = 0;
+    env->tlb_type = TLB_EMB;
+#endif
+    init_excp_BookE(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    ppc40x_irq_init(env_archcpu(env));
+
+    SET_FIT_PERIOD(12, 16, 20, 24);
+    SET_WDT_PERIOD(20, 24, 28, 32);
+}
+
+static void init_proc_e200(CPUPPCState *env)
+{
+    register_BookE_sprs(env, 0x000000070000FFFFULL);
+
+    spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
+                 &spr_read_spefscr, &spr_write_spefscr,
+                 &spr_read_spefscr, &spr_write_spefscr,
+                 0x00000000);
+    /* Memory management */
+    register_BookE206_sprs(env, 0x0000005D, NULL, 0);
+    register_usprgh_sprs(env);
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
+
+    spr_register(env, SPR_Exxx_ALTCTXCR, "ALTCTXCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_CTXCR, "CTXCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_DBCNT, "DBCNT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_DBCR3, "DBCR3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
+                 &spr_read_generic, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_L1FINV0, "L1FINV0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_MMUCSR0, "MMUCSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000); /* TOFIX */
+    spr_register(env, SPR_BOOKE_DSRR0, "DSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_DSRR1, "DSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = 64;
+    env->nb_ways = 1;
+    env->id_tlbs = 0;
+    env->tlb_type = TLB_EMB;
+#endif
+    init_excp_e200(env, 0xFFFF0000UL);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* XXX: TODO: allocate internal IRQ controller */
+}
+
+enum fsl_e500_version {
+    fsl_e500v1,
+    fsl_e500v2,
+    fsl_e500mc,
+    fsl_e5500,
+    fsl_e6500,
+};
+
+static void init_proc_e500(CPUPPCState *env, int version)
+{
+    uint32_t tlbncfg[2];
+    uint64_t ivor_mask;
+    uint64_t ivpr_mask = 0xFFFF0000ULL;
+    uint32_t l1cfg0 = 0x3800  /* 8 ways */
+                    | 0x0020; /* 32 kb */
+    uint32_t l1cfg1 = 0x3800  /* 8 ways */
+                    | 0x0020; /* 32 kb */
+    uint32_t mmucfg = 0;
+#if !defined(CONFIG_USER_ONLY)
+    int i;
+#endif
+
+    /*
+     * XXX The e500 doesn't implement IVOR7 and IVOR9, but doesn't
+     *     complain when accessing them.
+     * register_BookE_sprs(env, 0x0000000F0000FD7FULL);
+     */
+    switch (version) {
+    case fsl_e500v1:
+    case fsl_e500v2:
+    default:
+        ivor_mask = 0x0000000F0000FFFFULL;
+        break;
+    case fsl_e500mc:
+    case fsl_e5500:
+        ivor_mask = 0x000003FE0000FFFFULL;
+        break;
+    case fsl_e6500:
+        ivor_mask = 0x000003FF0000FFFFULL;
+        break;
+    }
+    register_BookE_sprs(env, ivor_mask);
+
+    spr_register(env, SPR_USPRG3, "USPRG3",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+
+    /* Processor identification */
+    spr_register(env, SPR_BOOKE_PIR, "PIR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_pir,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
+                 &spr_read_spefscr, &spr_write_spefscr,
+                 &spr_read_spefscr, &spr_write_spefscr,
+                 0x00000000);
+#if !defined(CONFIG_USER_ONLY)
+    /* Memory management */
+    env->nb_pids = 3;
+    env->nb_ways = 2;
+    env->id_tlbs = 0;
+    switch (version) {
+    case fsl_e500v1:
+        tlbncfg[0] = register_tlbncfg(2, 1, 1, 0, 256);
+        tlbncfg[1] = register_tlbncfg(16, 1, 9, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
+        break;
+    case fsl_e500v2:
+        tlbncfg[0] = register_tlbncfg(4, 1, 1, 0, 512);
+        tlbncfg[1] = register_tlbncfg(16, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
+        break;
+    case fsl_e500mc:
+    case fsl_e5500:
+        tlbncfg[0] = register_tlbncfg(4, 1, 1, 0, 512);
+        tlbncfg[1] = register_tlbncfg(64, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 64);
+        break;
+    case fsl_e6500:
+        mmucfg = 0x6510B45;
+        env->nb_pids = 1;
+        tlbncfg[0] = 0x08052400;
+        tlbncfg[1] = 0x40028040;
+        break;
+    default:
+        cpu_abort(env_cpu(env), "Unknown CPU: " TARGET_FMT_lx "\n",
+                  env->spr[SPR_PVR]);
+    }
+#endif
+    /* Cache sizes */
+    switch (version) {
+    case fsl_e500v1:
+    case fsl_e500v2:
+        env->dcache_line_size = 32;
+        env->icache_line_size = 32;
+        break;
+    case fsl_e500mc:
+    case fsl_e5500:
+        env->dcache_line_size = 64;
+        env->icache_line_size = 64;
+        l1cfg0 |= 0x1000000; /* 64 byte cache block size */
+        l1cfg1 |= 0x1000000; /* 64 byte cache block size */
+        break;
+    case fsl_e6500:
+        env->dcache_line_size = 32;
+        env->icache_line_size = 32;
+        l1cfg0 |= 0x0F83820;
+        l1cfg1 |= 0x0B83820;
+        break;
+    default:
+        cpu_abort(env_cpu(env), "Unknown CPU: " TARGET_FMT_lx "\n",
+                  env->spr[SPR_PVR]);
+    }
+    register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
+    register_usprgh_sprs(env);
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
+
+    spr_register(env, SPR_Exxx_BBEAR, "BBEAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_BBTAR, "BBTAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_MCAR, "MCAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_NPIDR, "NPIDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
+                 &spr_read_generic, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 l1cfg0);
+    spr_register(env, SPR_Exxx_L1CFG1, "L1CFG1",
+                 &spr_read_generic, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 l1cfg1);
+    spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_e500_l1csr0,
+                 0x00000000);
+    spr_register(env, SPR_Exxx_L1CSR1, "L1CSR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_e500_l1csr1,
+                 0x00000000);
+    if (version != fsl_e500v1 && version != fsl_e500v2) {
+        spr_register(env, SPR_Exxx_L2CSR0, "L2CSR0",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_e500_l2csr0,
+                     0x00000000);
+    }
+    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_MMUCSR0, "MMUCSR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_booke206_mmucsr0,
+                 0x00000000);
+    spr_register(env, SPR_BOOKE_EPR, "EPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* XXX better abstract into Emb.xxx features */
+    if ((version == fsl_e5500) || (version == fsl_e6500)) {
+        spr_register(env, SPR_BOOKE_EPCR, "EPCR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, &spr_write_generic,
+                     0x00000000);
+        spr_register(env, SPR_BOOKE_MAS7_MAS3, "MAS7_MAS3",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_mas73, &spr_write_mas73,
+                     0x00000000);
+        ivpr_mask = (target_ulong)~0xFFFFULL;
+    }
+
+    if (version == fsl_e6500) {
+        /* Thread identification */
+        spr_register(env, SPR_TIR, "TIR",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     0x00000000);
+        spr_register(env, SPR_BOOKE_TLB0PS, "TLB0PS",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     0x00000004);
+        spr_register(env, SPR_BOOKE_TLB1PS, "TLB1PS",
+                     SPR_NOACCESS, SPR_NOACCESS,
+                     &spr_read_generic, SPR_NOACCESS,
+                     0x7FFFFFFC);
+    }
+
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = 0;
+    env->tlb_type = TLB_MAS;
+    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
+        env->nb_tlb += booke206_tlb_size(env, i);
+    }
+#endif
+
+    init_excp_e200(env, ivpr_mask);
+    /* Allocate hardware IRQ controller */
+    ppce500_irq_init(env_archcpu(env));
+}
+
+static void init_proc_e500v1(CPUPPCState *env)
+{
+    init_proc_e500(env, fsl_e500v1);
+}
+
+static void init_proc_e500v2(CPUPPCState *env)
+{
+    init_proc_e500(env, fsl_e500v2);
+}
+
+static void init_proc_e500mc(CPUPPCState *env)
+{
+    init_proc_e500(env, fsl_e500mc);
+}
+
+#ifdef TARGET_PPC64
+static void init_proc_e5500(CPUPPCState *env)
+{
+    init_proc_e500(env, fsl_e5500);
+}
+
+static void init_proc_e6500(CPUPPCState *env)
+{
+    init_proc_e500(env, fsl_e6500);
+}
+#endif
+
+POWERPC_FAMILY(440EP)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 440 EP";
+    pcc->init_proc = init_proc_440EP;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
+                       PPC_FLOAT | PPC_FLOAT_FRES | PPC_FLOAT_FSEL |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_DCR | PPC_WRTEE | PPC_RFMCI |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_MFTB |
+                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
+                       PPC_440_SPEC;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_403;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
+                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 460 EX";
+    pcc->init_proc = init_proc_440EP;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
+                       PPC_FLOAT | PPC_FLOAT_FRES | PPC_FLOAT_FSEL |
+                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
+                       PPC_FLOAT_STFIWX |
+                       PPC_DCR | PPC_DCRX | PPC_WRTEE | PPC_RFMCI |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_MFTB |
+                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
+                       PPC_440_SPEC;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_403;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
+                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 440 GP";
+    pcc->init_proc = init_proc_440GP;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
+                       PPC_DCR | PPC_DCRX | PPC_WRTEE | PPC_MFAPIDI |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_TLBIVA | PPC_MFTB |
+                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
+                       PPC_440_SPEC;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_403;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
+                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(440x5)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 440x5";
+    pcc->init_proc = init_proc_440x5;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
+                       PPC_DCR | PPC_WRTEE | PPC_RFMCI |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_MFTB |
+                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
+                       PPC_440_SPEC;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_403;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
+                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 440x5 with double precision FPU";
+    pcc->init_proc = init_proc_440x5;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
+                       PPC_FLOAT | PPC_FLOAT_FSQRT |
+                       PPC_FLOAT_STFIWX |
+                       PPC_DCR | PPC_WRTEE | PPC_RFMCI |
+                       PPC_CACHE | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_MFTB |
+                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
+                       PPC_440_SPEC;
+    pcc->insns_flags2 = PPC2_FP_CVT_S64;
+    pcc->msr_mask = (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_403;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
+                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e200 core";
+    pcc->init_proc = init_proc_e200;
+    pcc->check_pow = check_pow_hid0;
+    /*
+     * XXX: unimplemented instructions:
+     * dcblc
+     * dcbtlst
+     * dcbtstls
+     * icblc
+     * icbtls
+     * tlbivax
+     * all SPE multiply-accumulate instructions
+     */
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
+                       PPC_SPE | PPC_SPE_SINGLE |
+                       PPC_WRTEE | PPC_RFDI |
+                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_TLBIVAX |
+                       PPC_BOOKE;
+    pcc->msr_mask = (1ull << MSR_UCLE) |
+                    (1ull << MSR_SPE) |
+                    (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE206;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_860;
+    pcc->flags = POWERPC_FLAG_SPE | POWERPC_FLAG_CE |
+                 POWERPC_FLAG_UBLE | POWERPC_FLAG_DE |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(e500v1)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e500v1 core";
+    pcc->init_proc = init_proc_e500v1;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
+                       PPC_SPE | PPC_SPE_SINGLE |
+                       PPC_WRTEE | PPC_RFDI |
+                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC;
+    pcc->insns_flags2 = PPC2_BOOKE206;
+    pcc->msr_mask = (1ull << MSR_UCLE) |
+                    (1ull << MSR_SPE) |
+                    (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE206;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_860;
+    pcc->flags = POWERPC_FLAG_SPE | POWERPC_FLAG_CE |
+                 POWERPC_FLAG_UBLE | POWERPC_FLAG_DE |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(e500v2)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e500v2 core";
+    pcc->init_proc = init_proc_e500v2;
+    pcc->check_pow = check_pow_hid0;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
+                       PPC_SPE | PPC_SPE_SINGLE | PPC_SPE_DOUBLE |
+                       PPC_WRTEE | PPC_RFDI |
+                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC;
+    pcc->insns_flags2 = PPC2_BOOKE206;
+    pcc->msr_mask = (1ull << MSR_UCLE) |
+                    (1ull << MSR_SPE) |
+                    (1ull << MSR_POW) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE206;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_860;
+    pcc->flags = POWERPC_FLAG_SPE | POWERPC_FLAG_CE |
+                 POWERPC_FLAG_UBLE | POWERPC_FLAG_DE |
+                 POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(e500mc)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e500mc core";
+    pcc->init_proc = init_proc_e500mc;
+    pcc->check_pow = check_pow_none;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
+                       PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
+                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_FLOAT | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_FSEL |
+                       PPC_FLOAT_STFIWX | PPC_WAIT |
+                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC;
+    pcc->insns_flags2 = PPC2_BOOKE206 | PPC2_PRCNTL;
+    pcc->msr_mask = (1ull << MSR_GS) |
+                    (1ull << MSR_UCLE) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_PX) |
+                    (1ull << MSR_RI);
+    pcc->mmu_model = POWERPC_MMU_BOOKE206;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    /* FIXME: figure out the correct flag for e500mc */
+    pcc->bfd_mach = bfd_mach_ppc_e500;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+#ifdef TARGET_PPC64
+POWERPC_FAMILY(e5500)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e5500 core";
+    pcc->init_proc = init_proc_e5500;
+    pcc->check_pow = check_pow_none;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
+                       PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
+                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_FLOAT | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_FSEL |
+                       PPC_FLOAT_STFIWX | PPC_WAIT |
+                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC |
+                       PPC_64B | PPC_POPCNTB | PPC_POPCNTWD;
+    pcc->insns_flags2 = PPC2_BOOKE206 | PPC2_PRCNTL | PPC2_PERM_ISA206 |
+                        PPC2_FP_CVT_S64;
+    pcc->msr_mask = (1ull << MSR_CM) |
+                    (1ull << MSR_GS) |
+                    (1ull << MSR_UCLE) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR) |
+                    (1ull << MSR_PX) |
+                    (1ull << MSR_RI);
+    pcc->mmu_model = POWERPC_MMU_BOOKE206;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    /* FIXME: figure out the correct flag for e5500 */
+    pcc->bfd_mach = bfd_mach_ppc_e500;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
+}
+
+POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "e6500 core";
+    pcc->init_proc = init_proc_e6500;
+    pcc->check_pow = check_pow_none;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
+                       PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
+                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_FLOAT | PPC_FLOAT_FRES |
+                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_FSEL |
+                       PPC_FLOAT_STFIWX | PPC_WAIT |
+                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC |
+                       PPC_64B | PPC_POPCNTB | PPC_POPCNTWD | PPC_ALTIVEC;
+    pcc->insns_flags2 = PPC2_BOOKE206 | PPC2_PRCNTL | PPC2_PERM_ISA206 |
+                        PPC2_FP_CVT_S64 | PPC2_ATOMIC_ISA206;
+    pcc->msr_mask = (1ull << MSR_CM) |
+                    (1ull << MSR_GS) |
+                    (1ull << MSR_UCLE) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_FE0) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_FE1) |
+                    (1ull << MSR_IS) |
+                    (1ull << MSR_DS) |
+                    (1ull << MSR_PX) |
+                    (1ull << MSR_RI) |
+                    (1ull << MSR_VR);
+    pcc->mmu_model = POWERPC_MMU_BOOKE206;
+    pcc->excp_model = POWERPC_EXCP_BOOKE;
+    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
+    pcc->bfd_mach = bfd_mach_ppc_e500;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
+                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK | POWERPC_FLAG_VRE;
+}
+#endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 397a93aa4b..95e29e5e6b 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -102,442 +102,6 @@ static void register_iamr_sprs(CPUPPCState *env)
 }
 #endif /* TARGET_PPC64 */
 
-/* PowerPC BookE SPR */
-static void register_BookE_sprs(CPUPPCState *env, uint64_t ivor_mask)
-{
-    const char *ivor_names[64] = {
-        "IVOR0",  "IVOR1",  "IVOR2",  "IVOR3",
-        "IVOR4",  "IVOR5",  "IVOR6",  "IVOR7",
-        "IVOR8",  "IVOR9",  "IVOR10", "IVOR11",
-        "IVOR12", "IVOR13", "IVOR14", "IVOR15",
-        "IVOR16", "IVOR17", "IVOR18", "IVOR19",
-        "IVOR20", "IVOR21", "IVOR22", "IVOR23",
-        "IVOR24", "IVOR25", "IVOR26", "IVOR27",
-        "IVOR28", "IVOR29", "IVOR30", "IVOR31",
-        "IVOR32", "IVOR33", "IVOR34", "IVOR35",
-        "IVOR36", "IVOR37", "IVOR38", "IVOR39",
-        "IVOR40", "IVOR41", "IVOR42", "IVOR43",
-        "IVOR44", "IVOR45", "IVOR46", "IVOR47",
-        "IVOR48", "IVOR49", "IVOR50", "IVOR51",
-        "IVOR52", "IVOR53", "IVOR54", "IVOR55",
-        "IVOR56", "IVOR57", "IVOR58", "IVOR59",
-        "IVOR60", "IVOR61", "IVOR62", "IVOR63",
-    };
-#define SPR_BOOKE_IVORxx (-1)
-    int ivor_sprn[64] = {
-        SPR_BOOKE_IVOR0,  SPR_BOOKE_IVOR1,  SPR_BOOKE_IVOR2,  SPR_BOOKE_IVOR3,
-        SPR_BOOKE_IVOR4,  SPR_BOOKE_IVOR5,  SPR_BOOKE_IVOR6,  SPR_BOOKE_IVOR7,
-        SPR_BOOKE_IVOR8,  SPR_BOOKE_IVOR9,  SPR_BOOKE_IVOR10, SPR_BOOKE_IVOR11,
-        SPR_BOOKE_IVOR12, SPR_BOOKE_IVOR13, SPR_BOOKE_IVOR14, SPR_BOOKE_IVOR15,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVOR32, SPR_BOOKE_IVOR33, SPR_BOOKE_IVOR34, SPR_BOOKE_IVOR35,
-        SPR_BOOKE_IVOR36, SPR_BOOKE_IVOR37, SPR_BOOKE_IVOR38, SPR_BOOKE_IVOR39,
-        SPR_BOOKE_IVOR40, SPR_BOOKE_IVOR41, SPR_BOOKE_IVOR42, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-        SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx, SPR_BOOKE_IVORxx,
-    };
-    int i;
-
-    /* Interrupt processing */
-    spr_register(env, SPR_BOOKE_CSRR0, "CSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_CSRR1, "CSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Debug */
-    spr_register(env, SPR_BOOKE_IAC1, "IAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC2, "IAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DAC1, "DAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DAC2, "DAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DBCR0, "DBCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_dbcr0,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DBCR1, "DBCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DBCR2, "DBCR2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DSRR0, "DSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DSRR1, "DSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DBSR, "DBSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_clear,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DEAR, "DEAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_ESR, "ESR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_IVPR, "IVPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_excp_prefix,
-                 0x00000000);
-    /* Exception vectors */
-    for (i = 0; i < 64; i++) {
-        if (ivor_mask & (1ULL << i)) {
-            if (ivor_sprn[i] == SPR_BOOKE_IVORxx) {
-                fprintf(stderr, "ERROR: IVOR %d SPR is not defined\n", i);
-                exit(1);
-            }
-            spr_register(env, ivor_sprn[i], ivor_names[i],
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic, &spr_write_excp_vector,
-                         0x00000000);
-        }
-    }
-    spr_register(env, SPR_BOOKE_PID, "PID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_pid,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_TCR, "TCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tcr,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_TSR, "TSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke_tsr,
-                 0x00000000);
-    /* Timer */
-    spr_register(env, SPR_DECR, "DECR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_decr, &spr_write_decr,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DECAR, "DECAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 SPR_NOACCESS, &spr_write_generic,
-                 0x00000000);
-    /* SPRGs */
-    spr_register(env, SPR_USPRG0, "USPRG0",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
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
-    spr_register(env, SPR_BOOKE_SPRG8, "SPRG8",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_SPRG9, "SPRG9",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-#if !defined(CONFIG_USER_ONLY)
-static inline uint32_t register_tlbncfg(uint32_t assoc, uint32_t minsize,
-                                   uint32_t maxsize, uint32_t flags,
-                                   uint32_t nentries)
-{
-    return (assoc << TLBnCFG_ASSOC_SHIFT) |
-           (minsize << TLBnCFG_MINSIZE_SHIFT) |
-           (maxsize << TLBnCFG_MAXSIZE_SHIFT) |
-           flags | nentries;
-}
-#endif /* !CONFIG_USER_ONLY */
-
-/* BookE 2.06 storage control registers */
-static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
-                             uint32_t *tlbncfg, uint32_t mmucfg)
-{
-#if !defined(CONFIG_USER_ONLY)
-    const char *mas_names[8] = {
-        "MAS0", "MAS1", "MAS2", "MAS3", "MAS4", "MAS5", "MAS6", "MAS7",
-    };
-    int mas_sprn[8] = {
-        SPR_BOOKE_MAS0, SPR_BOOKE_MAS1, SPR_BOOKE_MAS2, SPR_BOOKE_MAS3,
-        SPR_BOOKE_MAS4, SPR_BOOKE_MAS5, SPR_BOOKE_MAS6, SPR_BOOKE_MAS7,
-    };
-    int i;
-
-    /* TLB assist registers */
-    for (i = 0; i < 8; i++) {
-        if (mas_mask & (1 << i)) {
-            spr_register(env, mas_sprn[i], mas_names[i],
-                         SPR_NOACCESS, SPR_NOACCESS,
-                         &spr_read_generic,
-                         (i == 2 && (env->insns_flags & PPC_64B))
-                         ? &spr_write_generic : &spr_write_generic32,
-                         0x00000000);
-        }
-    }
-    if (env->nb_pids > 1) {
-        spr_register(env, SPR_BOOKE_PID1, "PID1",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_booke_pid,
-                     0x00000000);
-    }
-    if (env->nb_pids > 2) {
-        spr_register(env, SPR_BOOKE_PID2, "PID2",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_booke_pid,
-                     0x00000000);
-    }
-
-    spr_register(env, SPR_BOOKE_EPLC, "EPLC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_eplc,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_EPSC, "EPSC",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_epsc,
-                 0x00000000);
-
-    spr_register(env, SPR_MMUCFG, "MMUCFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 mmucfg);
-    switch (env->nb_ways) {
-    case 4:
-        spr_register(env, SPR_BOOKE_TLB3CFG, "TLB3CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[3]);
-        /* Fallthru */
-    case 3:
-        spr_register(env, SPR_BOOKE_TLB2CFG, "TLB2CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[2]);
-        /* Fallthru */
-    case 2:
-        spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[1]);
-        /* Fallthru */
-    case 1:
-        spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     tlbncfg[0]);
-        /* Fallthru */
-    case 0:
-    default:
-        break;
-    }
-#endif
-}
-
-/* SPR specific to PowerPC 440 implementation */
-static void register_440_sprs(CPUPPCState *env)
-{
-    /* Cache control */
-    spr_register(env, SPR_440_DNV0, "DNV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DNV1, "DNV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DNV2, "DNV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DNV3, "DNV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DTV0, "DTV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DTV1, "DTV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DTV2, "DTV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DTV3, "DTV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DVLIM, "DVLIM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_INV0, "INV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_INV1, "INV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_INV2, "INV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_INV3, "INV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_ITV0, "ITV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_ITV1, "ITV1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_ITV2, "ITV2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_ITV3, "ITV3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_IVLIM, "IVLIM",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Cache debug */
-    spr_register(env, SPR_BOOKE_DCDBTRH, "DCDBTRH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DCDBTRL, "DCDBTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_ICDBTRH, "ICDBTRH",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_ICDBTRL, "ICDBTRL",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_440_DBDR, "DBDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Processor control */
-    spr_register(env, SPR_4xx_CCR0, "CCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_440_RSTCFG, "RSTCFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* Storage control */
-    spr_register(env, SPR_440_MMUCR, "MMUCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
 /*
  * AMR     => SPR 29 (Power 2.04)
  * CTRL    => SPR 136 (Power 2.04)
@@ -569,68 +133,6 @@ static void register_440_sprs(CPUPPCState *env)
 /*****************************************************************************/
 /* Exception vectors models                                                  */
 
-static void init_excp_e200(CPUPPCState *env, target_ulong ivpr_mask)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_RESET]    = 0x00000FFC;
-    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_APU]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00000000;
-    /*
-     * These two are the same IVOR as POWERPC_EXCP_VPU and
-     * POWERPC_EXCP_VPUA. We deal with that when dispatching at
-     * powerpc_excp().
-     */
-    env->excp_vectors[POWERPC_EXCP_SPEU]     = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_EFPDI]    = 0x00000000;
-
-    env->excp_vectors[POWERPC_EXCP_EFPRI]    = 0x00000000;
-    env->ivor_mask = 0x0000FFF7UL;
-    env->ivpr_mask = ivpr_mask;
-    /* Hardware reset vector */
-    env->hreset_vector = 0xFFFFFFFCUL;
-#endif
-}
-
-static void init_excp_BookE(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_APU]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00000000;
-    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00000000;
-    env->ivor_mask = 0x0000FFF0UL;
-    env->ivpr_mask = 0xFFFF0000UL;
-    /* Hardware reset vector */
-    env->hreset_vector = 0xFFFFFFFCUL;
-#endif
-}
-
 #if defined(TARGET_PPC64)
 static void init_excp_970(CPUPPCState *env)
 {
@@ -722,918 +224,6 @@ static void init_excp_POWER10(CPUPPCState *env)
 
 #endif
 
-static int check_pow_hid0(CPUPPCState *env)
-{
-    if (env->spr[SPR_HID0] & 0x00E00000) {
-        return 1;
-    }
-
-    return 0;
-}
-
-static void init_proc_440EP(CPUPPCState *env)
-{
-    register_BookE_sprs(env, 0x000000000000FFFFULL);
-    register_440_sprs(env);
-    register_usprgh_sprs(env);
-
-    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_CCR1, "CCR1",
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
-    ppc40x_irq_init(env_archcpu(env));
-
-    SET_FIT_PERIOD(12, 16, 20, 24);
-    SET_WDT_PERIOD(20, 24, 28, 32);
-}
-
-POWERPC_FAMILY(440EP)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 440 EP";
-    pcc->init_proc = init_proc_440EP;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
-                       PPC_FLOAT | PPC_FLOAT_FRES | PPC_FLOAT_FSEL |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_DCR | PPC_WRTEE | PPC_RFMCI |
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
-POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 460 EX";
-    pcc->init_proc = init_proc_440EP;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
-                       PPC_FLOAT | PPC_FLOAT_FRES | PPC_FLOAT_FSEL |
-                       PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
-                       PPC_FLOAT_STFIWX |
-                       PPC_DCR | PPC_DCRX | PPC_WRTEE | PPC_RFMCI |
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
-static void init_proc_440GP(CPUPPCState *env)
-{
-    register_BookE_sprs(env, 0x000000000000FFFFULL);
-    register_440_sprs(env);
-    register_usprgh_sprs(env);
-
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
-POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 440 GP";
-    pcc->init_proc = init_proc_440GP;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
-                       PPC_DCR | PPC_DCRX | PPC_WRTEE | PPC_MFAPIDI |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_MEM_TLBSYNC | PPC_TLBIVA | PPC_MFTB |
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
-static void init_proc_440x5(CPUPPCState *env)
-{
-    register_BookE_sprs(env, 0x000000000000FFFFULL);
-    register_440_sprs(env);
-    register_usprgh_sprs(env);
-
-    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_440_CCR1, "CCR1",
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
-    ppc40x_irq_init(env_archcpu(env));
-
-    SET_FIT_PERIOD(12, 16, 20, 24);
-    SET_WDT_PERIOD(20, 24, 28, 32);
-}
-
-POWERPC_FAMILY(440x5)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 440x5";
-    pcc->init_proc = init_proc_440x5;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
-                       PPC_DCR | PPC_WRTEE | PPC_RFMCI |
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
-POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 440x5 with double precision FPU";
-    pcc->init_proc = init_proc_440x5;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
-                       PPC_FLOAT | PPC_FLOAT_FSQRT |
-                       PPC_FLOAT_STFIWX |
-                       PPC_DCR | PPC_WRTEE | PPC_RFMCI |
-                       PPC_CACHE | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_MEM_TLBSYNC | PPC_MFTB |
-                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
-                       PPC_440_SPEC;
-    pcc->insns_flags2 = PPC2_FP_CVT_S64;
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
-static void init_proc_e200(CPUPPCState *env)
-{
-    register_BookE_sprs(env, 0x000000070000FFFFULL);
-
-    spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 0x00000000);
-    /* Memory management */
-    register_BookE206_sprs(env, 0x0000005D, NULL, 0);
-    register_usprgh_sprs(env);
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
-
-    spr_register(env, SPR_Exxx_ALTCTXCR, "ALTCTXCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_CTXCR, "CTXCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_DBCNT, "DBCNT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_DBCR3, "DBCR3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_L1FINV0, "L1FINV0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_TLB0CFG, "TLB0CFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_TLB1CFG, "TLB1CFG",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_MMUCSR0, "MMUCSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000); /* TOFIX */
-    spr_register(env, SPR_BOOKE_DSRR0, "DSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_DSRR1, "DSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = 64;
-    env->nb_ways = 1;
-    env->id_tlbs = 0;
-    env->tlb_type = TLB_EMB;
-#endif
-    init_excp_e200(env, 0xFFFF0000UL);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* XXX: TODO: allocate internal IRQ controller */
-}
-
-POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e200 core";
-    pcc->init_proc = init_proc_e200;
-    pcc->check_pow = check_pow_hid0;
-    /*
-     * XXX: unimplemented instructions:
-     * dcblc
-     * dcbtlst
-     * dcbtstls
-     * icblc
-     * icbtls
-     * tlbivax
-     * all SPE multiply-accumulate instructions
-     */
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
-                       PPC_SPE | PPC_SPE_SINGLE |
-                       PPC_WRTEE | PPC_RFDI |
-                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_MEM_TLBSYNC | PPC_TLBIVAX |
-                       PPC_BOOKE;
-    pcc->msr_mask = (1ull << MSR_UCLE) |
-                    (1ull << MSR_SPE) |
-                    (1ull << MSR_POW) |
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
-    pcc->mmu_model = POWERPC_MMU_BOOKE206;
-    pcc->excp_model = POWERPC_EXCP_BOOKE;
-    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
-    pcc->bfd_mach = bfd_mach_ppc_860;
-    pcc->flags = POWERPC_FLAG_SPE | POWERPC_FLAG_CE |
-                 POWERPC_FLAG_UBLE | POWERPC_FLAG_DE |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-enum fsl_e500_version {
-    fsl_e500v1,
-    fsl_e500v2,
-    fsl_e500mc,
-    fsl_e5500,
-    fsl_e6500,
-};
-
-static void init_proc_e500(CPUPPCState *env, int version)
-{
-    uint32_t tlbncfg[2];
-    uint64_t ivor_mask;
-    uint64_t ivpr_mask = 0xFFFF0000ULL;
-    uint32_t l1cfg0 = 0x3800  /* 8 ways */
-                    | 0x0020; /* 32 kb */
-    uint32_t l1cfg1 = 0x3800  /* 8 ways */
-                    | 0x0020; /* 32 kb */
-    uint32_t mmucfg = 0;
-#if !defined(CONFIG_USER_ONLY)
-    int i;
-#endif
-
-    /*
-     * XXX The e500 doesn't implement IVOR7 and IVOR9, but doesn't
-     *     complain when accessing them.
-     * register_BookE_sprs(env, 0x0000000F0000FD7FULL);
-     */
-    switch (version) {
-    case fsl_e500v1:
-    case fsl_e500v2:
-    default:
-        ivor_mask = 0x0000000F0000FFFFULL;
-        break;
-    case fsl_e500mc:
-    case fsl_e5500:
-        ivor_mask = 0x000003FE0000FFFFULL;
-        break;
-    case fsl_e6500:
-        ivor_mask = 0x000003FF0000FFFFULL;
-        break;
-    }
-    register_BookE_sprs(env, ivor_mask);
-
-    spr_register(env, SPR_USPRG3, "USPRG3",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-
-    /* Processor identification */
-    spr_register(env, SPR_BOOKE_PIR, "PIR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_pir,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_SPEFSCR, "SPEFSCR",
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 &spr_read_spefscr, &spr_write_spefscr,
-                 0x00000000);
-#if !defined(CONFIG_USER_ONLY)
-    /* Memory management */
-    env->nb_pids = 3;
-    env->nb_ways = 2;
-    env->id_tlbs = 0;
-    switch (version) {
-    case fsl_e500v1:
-        tlbncfg[0] = register_tlbncfg(2, 1, 1, 0, 256);
-        tlbncfg[1] = register_tlbncfg(16, 1, 9, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
-        break;
-    case fsl_e500v2:
-        tlbncfg[0] = register_tlbncfg(4, 1, 1, 0, 512);
-        tlbncfg[1] = register_tlbncfg(16, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 16);
-        break;
-    case fsl_e500mc:
-    case fsl_e5500:
-        tlbncfg[0] = register_tlbncfg(4, 1, 1, 0, 512);
-        tlbncfg[1] = register_tlbncfg(64, 1, 12, TLBnCFG_AVAIL | TLBnCFG_IPROT, 64);
-        break;
-    case fsl_e6500:
-        mmucfg = 0x6510B45;
-        env->nb_pids = 1;
-        tlbncfg[0] = 0x08052400;
-        tlbncfg[1] = 0x40028040;
-        break;
-    default:
-        cpu_abort(env_cpu(env), "Unknown CPU: " TARGET_FMT_lx "\n",
-                  env->spr[SPR_PVR]);
-    }
-#endif
-    /* Cache sizes */
-    switch (version) {
-    case fsl_e500v1:
-    case fsl_e500v2:
-        env->dcache_line_size = 32;
-        env->icache_line_size = 32;
-        break;
-    case fsl_e500mc:
-    case fsl_e5500:
-        env->dcache_line_size = 64;
-        env->icache_line_size = 64;
-        l1cfg0 |= 0x1000000; /* 64 byte cache block size */
-        l1cfg1 |= 0x1000000; /* 64 byte cache block size */
-        break;
-    case fsl_e6500:
-        env->dcache_line_size = 32;
-        env->icache_line_size = 32;
-        l1cfg0 |= 0x0F83820;
-        l1cfg1 |= 0x0B83820;
-        break;
-    default:
-        cpu_abort(env_cpu(env), "Unknown CPU: " TARGET_FMT_lx "\n",
-                  env->spr[SPR_PVR]);
-    }
-    register_BookE206_sprs(env, 0x000000DF, tlbncfg, mmucfg);
-    register_usprgh_sprs(env);
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
-
-    spr_register(env, SPR_Exxx_BBEAR, "BBEAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_BBTAR, "BBTAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_MCAR, "MCAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_BOOKE_MCSR, "MCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_NPIDR, "NPIDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_BUCSR, "BUCSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_Exxx_L1CFG0, "L1CFG0",
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 l1cfg0);
-    spr_register(env, SPR_Exxx_L1CFG1, "L1CFG1",
-                 &spr_read_generic, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 l1cfg1);
-    spr_register(env, SPR_Exxx_L1CSR0, "L1CSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_e500_l1csr0,
-                 0x00000000);
-    spr_register(env, SPR_Exxx_L1CSR1, "L1CSR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_e500_l1csr1,
-                 0x00000000);
-    if (version != fsl_e500v1 && version != fsl_e500v2) {
-        spr_register(env, SPR_Exxx_L2CSR0, "L2CSR0",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_e500_l2csr0,
-                     0x00000000);
-    }
-    spr_register(env, SPR_BOOKE_MCSRR0, "MCSRR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_MCSRR1, "MCSRR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_MMUCSR0, "MMUCSR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_booke206_mmucsr0,
-                 0x00000000);
-    spr_register(env, SPR_BOOKE_EPR, "EPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* XXX better abstract into Emb.xxx features */
-    if ((version == fsl_e5500) || (version == fsl_e6500)) {
-        spr_register(env, SPR_BOOKE_EPCR, "EPCR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
-                     0x00000000);
-        spr_register(env, SPR_BOOKE_MAS7_MAS3, "MAS7_MAS3",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_mas73, &spr_write_mas73,
-                     0x00000000);
-        ivpr_mask = (target_ulong)~0xFFFFULL;
-    }
-
-    if (version == fsl_e6500) {
-        /* Thread identification */
-        spr_register(env, SPR_TIR, "TIR",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     0x00000000);
-        spr_register(env, SPR_BOOKE_TLB0PS, "TLB0PS",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     0x00000004);
-        spr_register(env, SPR_BOOKE_TLB1PS, "TLB1PS",
-                     SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, SPR_NOACCESS,
-                     0x7FFFFFFC);
-    }
-
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = 0;
-    env->tlb_type = TLB_MAS;
-    for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
-        env->nb_tlb += booke206_tlb_size(env, i);
-    }
-#endif
-
-    init_excp_e200(env, ivpr_mask);
-    /* Allocate hardware IRQ controller */
-    ppce500_irq_init(env_archcpu(env));
-}
-
-static void init_proc_e500v1(CPUPPCState *env)
-{
-    init_proc_e500(env, fsl_e500v1);
-}
-
-POWERPC_FAMILY(e500v1)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e500v1 core";
-    pcc->init_proc = init_proc_e500v1;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
-                       PPC_SPE | PPC_SPE_SINGLE |
-                       PPC_WRTEE | PPC_RFDI |
-                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC;
-    pcc->insns_flags2 = PPC2_BOOKE206;
-    pcc->msr_mask = (1ull << MSR_UCLE) |
-                    (1ull << MSR_SPE) |
-                    (1ull << MSR_POW) |
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
-    pcc->mmu_model = POWERPC_MMU_BOOKE206;
-    pcc->excp_model = POWERPC_EXCP_BOOKE;
-    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
-    pcc->bfd_mach = bfd_mach_ppc_860;
-    pcc->flags = POWERPC_FLAG_SPE | POWERPC_FLAG_CE |
-                 POWERPC_FLAG_UBLE | POWERPC_FLAG_DE |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_e500v2(CPUPPCState *env)
-{
-    init_proc_e500(env, fsl_e500v2);
-}
-
-POWERPC_FAMILY(e500v2)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e500v2 core";
-    pcc->init_proc = init_proc_e500v2;
-    pcc->check_pow = check_pow_hid0;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
-                       PPC_SPE | PPC_SPE_SINGLE | PPC_SPE_DOUBLE |
-                       PPC_WRTEE | PPC_RFDI |
-                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC;
-    pcc->insns_flags2 = PPC2_BOOKE206;
-    pcc->msr_mask = (1ull << MSR_UCLE) |
-                    (1ull << MSR_SPE) |
-                    (1ull << MSR_POW) |
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
-    pcc->mmu_model = POWERPC_MMU_BOOKE206;
-    pcc->excp_model = POWERPC_EXCP_BOOKE;
-    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
-    pcc->bfd_mach = bfd_mach_ppc_860;
-    pcc->flags = POWERPC_FLAG_SPE | POWERPC_FLAG_CE |
-                 POWERPC_FLAG_UBLE | POWERPC_FLAG_DE |
-                 POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_e500mc(CPUPPCState *env)
-{
-    init_proc_e500(env, fsl_e500mc);
-}
-
-POWERPC_FAMILY(e500mc)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e500mc core";
-    pcc->init_proc = init_proc_e500mc;
-    pcc->check_pow = check_pow_none;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
-                       PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
-                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_FLOAT | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_FSEL |
-                       PPC_FLOAT_STFIWX | PPC_WAIT |
-                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC;
-    pcc->insns_flags2 = PPC2_BOOKE206 | PPC2_PRCNTL;
-    pcc->msr_mask = (1ull << MSR_GS) |
-                    (1ull << MSR_UCLE) |
-                    (1ull << MSR_CE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_PX) |
-                    (1ull << MSR_RI);
-    pcc->mmu_model = POWERPC_MMU_BOOKE206;
-    pcc->excp_model = POWERPC_EXCP_BOOKE;
-    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
-    /* FIXME: figure out the correct flag for e500mc */
-    pcc->bfd_mach = bfd_mach_ppc_e500;
-    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-#ifdef TARGET_PPC64
-static void init_proc_e5500(CPUPPCState *env)
-{
-    init_proc_e500(env, fsl_e5500);
-}
-
-POWERPC_FAMILY(e5500)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e5500 core";
-    pcc->init_proc = init_proc_e5500;
-    pcc->check_pow = check_pow_none;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
-                       PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
-                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_FLOAT | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_FSEL |
-                       PPC_FLOAT_STFIWX | PPC_WAIT |
-                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC |
-                       PPC_64B | PPC_POPCNTB | PPC_POPCNTWD;
-    pcc->insns_flags2 = PPC2_BOOKE206 | PPC2_PRCNTL | PPC2_PERM_ISA206 |
-                        PPC2_FP_CVT_S64;
-    pcc->msr_mask = (1ull << MSR_CM) |
-                    (1ull << MSR_GS) |
-                    (1ull << MSR_UCLE) |
-                    (1ull << MSR_CE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR) |
-                    (1ull << MSR_PX) |
-                    (1ull << MSR_RI);
-    pcc->mmu_model = POWERPC_MMU_BOOKE206;
-    pcc->excp_model = POWERPC_EXCP_BOOKE;
-    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
-    /* FIXME: figure out the correct flag for e5500 */
-    pcc->bfd_mach = bfd_mach_ppc_e500;
-    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK;
-}
-
-static void init_proc_e6500(CPUPPCState *env)
-{
-    init_proc_e500(env, fsl_e6500);
-}
-
-POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "e6500 core";
-    pcc->init_proc = init_proc_e6500;
-    pcc->check_pow = check_pow_none;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
-                       PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
-                       PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_FLOAT | PPC_FLOAT_FRES |
-                       PPC_FLOAT_FRSQRTE | PPC_FLOAT_FSEL |
-                       PPC_FLOAT_STFIWX | PPC_WAIT |
-                       PPC_MEM_TLBSYNC | PPC_TLBIVAX | PPC_MEM_SYNC |
-                       PPC_64B | PPC_POPCNTB | PPC_POPCNTWD | PPC_ALTIVEC;
-    pcc->insns_flags2 = PPC2_BOOKE206 | PPC2_PRCNTL | PPC2_PERM_ISA206 |
-                        PPC2_FP_CVT_S64 | PPC2_ATOMIC_ISA206;
-    pcc->msr_mask = (1ull << MSR_CM) |
-                    (1ull << MSR_GS) |
-                    (1ull << MSR_UCLE) |
-                    (1ull << MSR_CE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_FE0) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_FE1) |
-                    (1ull << MSR_IS) |
-                    (1ull << MSR_DS) |
-                    (1ull << MSR_PX) |
-                    (1ull << MSR_RI) |
-                    (1ull << MSR_VR);
-    pcc->mmu_model = POWERPC_MMU_BOOKE206;
-    pcc->excp_model = POWERPC_EXCP_BOOKE;
-    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
-    pcc->bfd_mach = bfd_mach_ppc_e500;
-    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DE |
-                 POWERPC_FLAG_PMM | POWERPC_FLAG_BUS_CLK | POWERPC_FLAG_VRE;
-}
-
-#endif
-
 #if defined(TARGET_PPC64)
 #if defined(CONFIG_USER_ONLY)
 #define POWERPC970_HID5_INIT 0x00000080
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index aae1c2051e..6383fb8ebd 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -7,6 +7,7 @@ ppc_ss.add(files(
   'cpu_6xx.c',
   'cpu_7xx.c',
   'cpu_74xx.c',
+  'cpu_booke.c',
   'excp_helper.c',
   'gdbstub.c',
   'helper_regs.c',
-- 
2.34.1


