Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB7D4CA497
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:15:55 +0100 (CET)
Received: from localhost ([::1]:40352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNta-0004Xv-Jk
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrF-0001OD-7u; Wed, 02 Mar 2022 06:09:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrA-0001rp-Fy; Wed, 02 Mar 2022 06:09:24 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2229Lqik002259; 
 Wed, 2 Mar 2022 11:08:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5enu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:55 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222Agnh6016353;
 Wed, 2 Mar 2022 11:08:54 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej38v5ekv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:54 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2kaT027677;
 Wed, 2 Mar 2022 11:08:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8mU855640516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E85AA42045;
 Wed,  2 Mar 2022 11:08:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9112E4203F;
 Wed,  2 Mar 2022 11:08:47 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:08:47 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id C706D2201C1;
 Wed,  2 Mar 2022 12:08:46 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 58/87] ppc/pnv: Add a XIVE2 controller to the POWER10 chip
Date: Wed,  2 Mar 2022 12:07:34 +0100
Message-Id: <20220302110803.849505-59-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GlXlgyvrYVANRcDUeKia6hEv3EI-m-XV
X-Proofpoint-GUID: aXYhawSdRdgU-Dwp5kpz5PW6TsE5hh7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1034 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XIVE2 interrupt controller of the POWER10 processor follows the
same logic than on POWER9 but the HW interface has been largely
reviewed.  It has a new register interface, different BARs, extra
VSDs, new layout for the XIVE2 structures, and a set of new features
which are described below.

This is a model of the POWER10 XIVE2 interrupt controller for the
PowerNV machine. It focuses primarily on the needs of the skiboot
firmware but some initial hypervisor support is implemented for KVM
use (escalation).

Support for new features will be implemented in time and will require
new support from the OS.

* XIVE2 BARS

The interrupt controller BARs have a different layout outlined below.
Each sub-engine has now own its range and the indirect TIMA access was
replaced with a set of pages, one per CPU, under the IC BAR:

  - IC BAR (Interrupt Controller)
    . 4 pages, one per sub-engine
    . 128 indirect TIMA pages
  - TM BAR (Thread Interrupt Management Area)
    . 4 pages
  - ESB BAR (ESB pages for IPIs)
    . up to 1TB
  - END BAR (ESB pages for ENDs)
    . up to 2TB
  - NVC BAR (Notification Virtual Crowd)
    . up to 128
  - NVPG BAR (Notification Virtual Process and Group)
    . up to 1TB
  - Direct mapped Thread Context Area (reads & writes)

OPAL does not use the grouping and crowd capability.

* Virtual Structure Tables

XIVE2 adds new tables types and also changes the field layout of the END
and NVP Virtualization Structure Descriptors.

  - EAS
  - END new layout
  - NVT was splitted in :
    . NVP (Processor), 32B
    . NVG (Group), 32B
    . NVC (Crowd =3D=3D P9 block group) 32B
  - IC for remote configuration
  - SYNC for cache injection
  - ERQ for event input queue

The setup is slighly different on XIVE2 because the indexing has changed
for some of the tables, block ID or the chip topology ID can be used.

* XIVE2 features

SCOM and MMIO registers have a new layout and XIVE2 adds a new global
capability and configuration registers.

The lowlevel hardware offers a set of new features among which :

  - a configurable number of priorities : 1 - 8
  - StoreEOI with load-after-store ordering is activated by default
  - Gen2 TIMA layout
  - A P9-compat mode, or Gen1, TIMA toggle bit for SW compatibility
  - increase to 24bit for VP number

Other features will have some impact on the Hypervisor and guest OS
when activated, but this is not required for initial support of the
controller.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/intc/pnv_xive2_regs.h   |  428 ++++++++
 include/hw/ppc/pnv.h       |   22 +
 include/hw/ppc/pnv_xive.h  |   71 ++
 include/hw/ppc/pnv_xscom.h |    3 +
 hw/intc/pnv_xive2.c        | 2028 ++++++++++++++++++++++++++++++++++++
 hw/ppc/pnv.c               |   85 +-
 hw/intc/meson.build        |    2 +-
 7 files changed, 2635 insertions(+), 4 deletions(-)
 create mode 100644 hw/intc/pnv_xive2_regs.h
 create mode 100644 hw/intc/pnv_xive2.c

diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
new file mode 100644
index 000000000000..d45d17cedcca
--- /dev/null
+++ b/hw/intc/pnv_xive2_regs.h
@@ -0,0 +1,428 @@
+/*
+ * QEMU PowerPC XIVE2 interrupt controller model  (POWER10)
+ *
+ * Copyright (c) 2019-2022, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#ifndef PPC_PNV_XIVE2_REGS_H
+#define PPC_PNV_XIVE2_REGS_H
+
+/*
+ * CQ Common Queue (PowerBus bridge) Registers
+ */
+
+/* XIVE2 Capabilities */
+#define X_CQ_XIVE_CAP                           0x02
+#define CQ_XIVE_CAP                             0x010
+#define    CQ_XIVE_CAP_VERSION                  PPC_BITMASK(0, 3)
+/* 4:6 reserved */
+#define    CQ_XIVE_CAP_USER_INT_PRIO            PPC_BITMASK(8, 9)
+#define       CQ_XIVE_CAP_USER_INT_PRIO_1       0
+#define       CQ_XIVE_CAP_USER_INT_PRIO_1_2     1
+#define       CQ_XIVE_CAP_USER_INT_PRIO_1_4     2
+#define       CQ_XIVE_CAP_USER_INT_PRIO_1_8     3
+#define    CQ_XIVE_CAP_VP_INT_PRIO              PPC_BITMASK(10, 11)
+#define       CQ_XIVE_CAP_VP_INT_PRIO_1_8       0
+#define       CQ_XIVE_CAP_VP_INT_PRIO_2_8       1
+#define       CQ_XIVE_CAP_VP_INT_PRIO_4_8       2
+#define       CQ_XIVE_CAP_VP_INT_PRIO_8         3
+#define    CQ_XIVE_CAP_BLOCK_ID_WIDTH           PPC_BITMASK(12, 13)
+
+/* XIVE2 Configuration */
+#define X_CQ_XIVE_CFG                           0x03
+#define CQ_XIVE_CFG                             0x018
+
+/* 0:7 reserved */
+#define    CQ_XIVE_CFG_USER_INT_PRIO            PPC_BITMASK(8, 9)
+#define    CQ_XIVE_CFG_VP_INT_PRIO              PPC_BITMASK(10, 11)
+#define       CQ_XIVE_CFG_INT_PRIO_1            0
+#define       CQ_XIVE_CFG_INT_PRIO_2            1
+#define       CQ_XIVE_CFG_INT_PRIO_4            2
+#define       CQ_XIVE_CFG_INT_PRIO_8            3
+#define    CQ_XIVE_CFG_BLOCK_ID_WIDTH           PPC_BITMASK(12, 13)
+#define       CQ_XIVE_CFG_BLOCK_ID_4BITS        0
+#define       CQ_XIVE_CFG_BLOCK_ID_5BITS        1
+#define       CQ_XIVE_CFG_BLOCK_ID_6BITS        2
+#define       CQ_XIVE_CFG_BLOCK_ID_7BITS        3
+#define    CQ_XIVE_CFG_HYP_HARD_RANGE           PPC_BITMASK(14, 15)
+#define       CQ_XIVE_CFG_THREADID_7BITS        0
+#define       CQ_XIVE_CFG_THREADID_8BITS        1
+#define       CQ_XIVE_CFG_THREADID_9BITS        2
+#define       CQ_XIVE_CFG_THREADID_10BITs       3
+#define    CQ_XIVE_CFG_HYP_HARD_BLKID_OVERRIDE  PPC_BIT(16)
+#define    CQ_XIVE_CFG_HYP_HARD_BLOCK_ID        PPC_BITMASK(17, 23)
+
+/* Interrupt Controller Base Address Register - 512 pages (32M) */
+#define X_CQ_IC_BAR                             0x08
+#define CQ_IC_BAR                               0x040
+#define    CQ_IC_BAR_VALID                      PPC_BIT(0)
+#define    CQ_IC_BAR_64K                        PPC_BIT(1)
+/* 2:7 reserved */
+#define    CQ_IC_BAR_ADDR                       PPC_BITMASK(8, 42)
+/* 43:63 reserved */
+
+/* Thread Management Base Address Register - 4 pages */
+#define X_CQ_TM_BAR                             0x09
+#define CQ_TM_BAR                               0x048
+#define    CQ_TM_BAR_VALID                      PPC_BIT(0)
+#define    CQ_TM_BAR_64K                        PPC_BIT(1)
+#define    CQ_TM_BAR_ADDR                       PPC_BITMASK(8, 49)
+
+/* ESB Base Address Register */
+#define X_CQ_ESB_BAR                            0x0A
+#define CQ_ESB_BAR                              0x050
+#define    CQ_BAR_VALID                         PPC_BIT(0)
+#define    CQ_BAR_64K                           PPC_BIT(1)
+/* 2:7 reserved */
+#define    CQ_BAR_ADDR                          PPC_BITMASK(8, 39)
+#define    CQ_BAR_SET_DIV                       PPC_BITMASK(56, 58)
+#define    CQ_BAR_RANGE                         PPC_BITMASK(59, 63)
+                                                /* 0 (16M) - 16 (16T) */
+
+/* END Base Address Register */
+#define X_CQ_END_BAR                            0x0B
+#define CQ_END_BAR                              0x058
+
+/* NVPG Base Address Register */
+#define X_CQ_NVPG_BAR                           0x0C
+#define CQ_NVPG_BAR                             0x060
+
+/* NVC Base Address Register */
+#define X_CQ_NVC_BAR                            0x0D
+#define CQ_NVC_BAR                              0x068
+
+/* Table Address Register */
+#define X_CQ_TAR                                0x0E
+#define CQ_TAR                                  0x070
+#define     CQ_TAR_AUTOINC                      PPC_BIT(0)
+#define     CQ_TAR_SELECT                       PPC_BITMASK(12, 15)
+#define     CQ_TAR_ESB                          0       /* 0 - 15 */
+#define     CQ_TAR_END                          2       /* 0 - 15 */
+#define     CQ_TAR_NVPG                         3       /* 0 - 15 */
+#define     CQ_TAR_NVC                          5       /* 0 - 15 */
+#define     CQ_TAR_ENTRY_SELECT                 PPC_BITMASK(28, 31)
+
+/* Table Data Register */
+#define X_CQ_TDR                                0x0F
+#define CQ_TDR                                  0x078
+/* for the NVPG, NVC, ESB, END Set Translation Tables */
+#define     CQ_TDR_VALID                        PPC_BIT(0)
+#define     CQ_TDR_BLOCK_ID                     PPC_BITMASK(60, 63)
+
+/*
+ * Processor Cores Enabled for MsgSnd
+ * Identifies which of the 32 possible core chiplets are enabled and
+ * available to receive the MsgSnd command
+ */
+#define X_CQ_MSGSND                             0x10
+#define CQ_MSGSND                               0x080
+
+/* Interrupt Unit Reset Control */
+#define X_CQ_RST_CTL                            0x12
+#define CQ_RST_CTL                              0x090
+#define     CQ_RST_SYNC_RESET                   PPC_BIT(0)      /* Write=
 Only */
+#define     CQ_RST_QUIESCE_PB                   PPC_BIT(1)      /* RW */
+#define     CQ_RST_MASTER_IDLE                  PPC_BIT(2)      /* Read =
Only */
+#define     CQ_RST_SAVE_IDLE                    PPC_BIT(3)      /* Read =
Only */
+#define     CQ_RST_PB_BAR_RESET                 PPC_BIT(4)      /* Write=
 Only */
+
+/* PowerBus General Configuration */
+#define X_CQ_CFG_PB_GEN                         0x14
+#define CQ_CFG_PB_GEN                           0x0A0
+#define    CQ_CFG_PB_GEN_PB_INIT                PPC_BIT(45)
+
+/*
+ * FIR
+ *     (And-Mask)
+ *     (Or-Mask)
+ */
+#define X_CQ_FIR                                0x30
+#define X_CQ_FIR_AND                            0x31
+#define X_CQ_FIR_OR                             0x32
+#define CQ_FIR                                  0x180
+#define CQ_FIR_AND                              0x188
+#define CQ_FIR_OR                               0x190
+#define  CQ_FIR_PB_RCMDX_CI_ERR1                PPC_BIT(19)
+#define  CQ_FIR_VC_INFO_ERROR_0_2               PPC_BITMASK(61, 63)
+
+/*
+ * FIR Mask
+ *     (And-Mask)
+ *     (Or-Mask)
+ */
+#define X_CQ_FIRMASK                            0x33
+#define X_CQ_FIRMASK_AND                        0x34
+#define X_CQ_FIRMASK_OR                         0x35
+#define CQ_FIRMASK                              0x198
+#define CQ_FIRMASK_AND                          0x1A0
+#define CQ_FIRMASK_OR                           0x1A8
+
+/*
+ * VC0
+ */
+
+/* VSD table address */
+#define X_VC_VSD_TABLE_ADDR                     0x100
+#define VC_VSD_TABLE_ADDR                       0x000
+#define   VC_VSD_TABLE_AUTOINC                  PPC_BIT(0)
+#define   VC_VSD_TABLE_SELECT                   PPC_BITMASK(12, 15)
+#define   VC_VSD_TABLE_ADDRESS                  PPC_BITMASK(28, 31)
+
+/* VSD table data */
+#define X_VC_VSD_TABLE_DATA                     0x101
+#define VC_VSD_TABLE_DATA                       0x008
+
+/* AIB AT macro indirect kill */
+#define X_VC_AT_MACRO_KILL                      0x102
+#define VC_AT_MACRO_KILL                        0x010
+#define  VC_AT_MACRO_KILL_VALID                 PPC_BIT(0)
+#define  VC_AT_MACRO_KILL_VSD                   PPC_BITMASK(12, 15)
+#define  VC_AT_MACRO_KILL_BLOCK_ID              PPC_BITMASK(28, 31)
+#define  VC_AT_MACRO_KILL_OFFSET                PPC_BITMASK(48, 60)
+
+/* AIB AT macro indirect kill mask (same bit definitions) */
+#define X_VC_AT_MACRO_KILL_MASK                 0x103
+#define VC_AT_MACRO_KILL_MASK                   0x018
+
+/* Remote IRQs and ERQs configuration [n] (n =3D 0:6) */
+#define X_VC_QUEUES_CFG_REM0                    0x117
+
+#define VC_QUEUES_CFG_REM0                      0x0B8
+#define VC_QUEUES_CFG_REM1                      0x0C0
+#define VC_QUEUES_CFG_REM2                      0x0C8
+#define VC_QUEUES_CFG_REM3                      0x0D0
+#define VC_QUEUES_CFG_REM4                      0x0D8
+#define VC_QUEUES_CFG_REM5                      0x0E0
+#define VC_QUEUES_CFG_REM6                      0x0E8
+#define  VC_QUEUES_CFG_MEMB_EN                  PPC_BIT(38)
+#define  VC_QUEUES_CFG_MEMB_SZ                  PPC_BITMASK(42, 47)
+
+/*
+ * VC1
+ */
+
+/* ESBC cache flush control trigger */
+#define X_VC_ESBC_FLUSH_CTRL                    0x140
+#define VC_ESBC_FLUSH_CTRL                      0x200
+#define  VC_ESBC_FLUSH_CTRL_POLL_VALID          PPC_BIT(0)
+#define  VC_ESBC_FLUSH_CTRL_WANT_CACHE_DISABLE  PPC_BIT(2)
+
+/* ESBC cache flush poll trigger */
+#define X_VC_ESBC_FLUSH_POLL                    0x141
+#define VC_ESBC_FLUSH_POLL                      0x208
+#define  VC_ESBC_FLUSH_POLL_BLOCK_ID            PPC_BITMASK(0, 3)
+#define  VC_ESBC_FLUSH_POLL_OFFSET              PPC_BITMASK(4, 31)  /* 2=
8-bit */
+#define  VC_ESBC_FLUSH_POLL_BLOCK_ID_MASK       PPC_BITMASK(32, 35)
+#define  VC_ESBC_FLUSH_POLL_OFFSET_MASK         PPC_BITMASK(36, 63) /* 2=
8-bit */
+
+/* EASC flush control register */
+#define X_VC_EASC_FLUSH_CTRL                    0x160
+#define VC_EASC_FLUSH_CTRL                      0x300
+#define  VC_EASC_FLUSH_CTRL_POLL_VALID          PPC_BIT(0)
+#define  VC_EASC_FLUSH_CTRL_WANT_CACHE_DISABLE  PPC_BIT(2)
+
+/* EASC flush poll register */
+#define X_VC_EASC_FLUSH_POLL                    0x161
+#define VC_EASC_FLUSH_POLL                      0x308
+#define  VC_EASC_FLUSH_POLL_BLOCK_ID            PPC_BITMASK(0, 3)
+#define  VC_EASC_FLUSH_POLL_OFFSET              PPC_BITMASK(4, 31)  /* 2=
8-bit */
+#define  VC_EASC_FLUSH_POLL_BLOCK_ID_MASK       PPC_BITMASK(32, 35)
+#define  VC_EASC_FLUSH_POLL_OFFSET_MASK         PPC_BITMASK(36, 63) /* 2=
8-bit */
+
+/*
+ * VC2
+ */
+
+/* ENDC flush control register */
+#define X_VC_ENDC_FLUSH_CTRL                    0x180
+#define VC_ENDC_FLUSH_CTRL                      0x400
+#define  VC_ENDC_FLUSH_CTRL_POLL_VALID          PPC_BIT(0)
+#define  VC_ENDC_FLUSH_CTRL_WANT_CACHE_DISABLE  PPC_BIT(2)
+#define  VC_ENDC_FLUSH_CTRL_WANT_INVALIDATE     PPC_BIT(3)
+#define  VC_ENDC_FLUSH_CTRL_INJECT_INVALIDATE   PPC_BIT(7)
+
+/* ENDC flush poll register */
+#define X_VC_ENDC_FLUSH_POLL                    0x181
+#define VC_ENDC_FLUSH_POLL                      0x408
+#define  VC_ENDC_FLUSH_POLL_BLOCK_ID            PPC_BITMASK(4, 7)
+#define  VC_ENDC_FLUSH_POLL_OFFSET              PPC_BITMASK(8, 31)  /* 2=
4-bit */
+#define  VC_ENDC_FLUSH_POLL_BLOCK_ID_MASK       PPC_BITMASK(36, 39)
+#define  VC_ENDC_FLUSH_POLL_OFFSET_MASK         PPC_BITMASK(40, 63) /* 2=
4-bit */
+
+/* ENDC Sync done */
+#define X_VC_ENDC_SYNC_DONE                     0x184
+#define VC_ENDC_SYNC_DONE                       0x420
+#define   VC_ENDC_SYNC_POLL_DONE                PPC_BITMASK(0, 6)
+#define   VC_ENDC_SYNC_QUEUE_IPI                PPC_BIT(0)
+#define   VC_ENDC_SYNC_QUEUE_HWD                PPC_BIT(1)
+#define   VC_ENDC_SYNC_QUEUE_NXC                PPC_BIT(2)
+#define   VC_ENDC_SYNC_QUEUE_INT                PPC_BIT(3)
+#define   VC_ENDC_SYNC_QUEUE_OS                 PPC_BIT(4)
+#define   VC_ENDC_SYNC_QUEUE_POOL               PPC_BIT(5)
+#define   VC_ENDC_SYNC_QUEUE_HARD               PPC_BIT(6)
+#define   VC_QUEUE_COUNT                        7
+
+/* ENDC cache watch specification 0  */
+#define X_VC_ENDC_WATCH0_SPEC                   0x1A0
+#define VC_ENDC_WATCH0_SPEC                     0x500
+#define   VC_ENDC_WATCH_CONFLICT                PPC_BIT(0)
+#define   VC_ENDC_WATCH_FULL                    PPC_BIT(8)
+#define   VC_ENDC_WATCH_BLOCK_ID                PPC_BITMASK(28, 31)
+#define   VC_ENDC_WATCH_INDEX                   PPC_BITMASK(40, 63)
+
+/* ENDC cache watch data 0 */
+#define X_VC_ENDC_WATCH0_DATA0                  0x1A4
+#define X_VC_ENDC_WATCH0_DATA1                  0x1A5
+#define X_VC_ENDC_WATCH0_DATA2                  0x1A6
+#define X_VC_ENDC_WATCH0_DATA3                  0x1A7
+
+#define VC_ENDC_WATCH0_DATA0                    0x520
+#define VC_ENDC_WATCH0_DATA1                    0x528
+#define VC_ENDC_WATCH0_DATA2                    0x530
+#define VC_ENDC_WATCH0_DATA3                    0x538
+
+/*
+ * PC LSB1
+ */
+
+/* VSD table address register */
+#define X_PC_VSD_TABLE_ADDR                     0x200
+#define PC_VSD_TABLE_ADDR                       0x000
+#define   PC_VSD_TABLE_AUTOINC                  PPC_BIT(0)
+#define   PC_VSD_TABLE_SELECT                   PPC_BITMASK(12, 15)
+#define   PC_VSD_TABLE_ADDRESS                  PPC_BITMASK(28, 31)
+
+/* VSD table data register */
+#define X_PC_VSD_TABLE_DATA                     0x201
+#define PC_VSD_TABLE_DATA                       0x008
+
+/* AT indirect kill register */
+#define X_PC_AT_KILL                            0x202
+#define PC_AT_KILL                              0x010
+#define     PC_AT_KILL_VALID                    PPC_BIT(0)
+#define     PC_AT_KILL_VSD_TYPE                 PPC_BITMASK(24, 27)
+/* Only NVP, NVG, NVC */
+#define     PC_AT_KILL_BLOCK_ID                 PPC_BITMASK(28, 31)
+#define     PC_AT_KILL_OFFSET                   PPC_BITMASK(48, 60)
+
+/* AT indirect kill mask register */
+#define X_PC_AT_KILL_MASK                       0x203
+#define PC_AT_KILL_MASK                         0x018
+#define     PC_AT_KILL_MASK_VSD_TYPE            PPC_BITMASK(24, 27)
+#define     PC_AT_KILL_MASK_BLOCK_ID            PPC_BITMASK(28, 31)
+#define     PC_AT_KILL_MASK_OFFSET              PPC_BITMASK(48, 60)
+
+/*
+ * PC LSB2
+ */
+
+/* NxC Cache flush control */
+#define X_PC_NXC_FLUSH_CTRL                     0x280
+#define PC_NXC_FLUSH_CTRL                       0x400
+#define  PC_NXC_FLUSH_CTRL_POLL_VALID           PPC_BIT(0)
+#define  PC_NXC_FLUSH_CTRL_WANT_CACHE_DISABLE   PPC_BIT(2)
+#define  PC_NXC_FLUSH_CTRL_WANT_INVALIDATE      PPC_BIT(3)
+#define  PC_NXC_FLUSH_CTRL_INJECT_INVALIDATE    PPC_BIT(7)
+
+/* NxC Cache flush poll */
+#define X_PC_NXC_FLUSH_POLL                     0x281
+#define PC_NXC_FLUSH_POLL                       0x408
+#define  PC_NXC_FLUSH_POLL_NXC_TYPE             PPC_BITMASK(2, 3)
+#define    PC_NXC_FLUSH_POLL_NXC_TYPE_NVP       0
+#define    PC_NXC_FLUSH_POLL_NXC_TYPE_NVG       2
+#define    PC_NXC_FLUSH_POLL_NXC_TYPE_NVC       3
+#define  PC_NXC_FLUSH_POLL_BLOCK_ID             PPC_BITMASK(4, 7)
+#define  PC_NXC_FLUSH_POLL_OFFSET               PPC_BITMASK(8, 31)  /* 2=
4-bit */
+#define  PC_NXC_FLUSH_POLL_NXC_TYPE_MASK        PPC_BITMASK(34, 35) /* 0=
: Ign */
+#define  PC_NXC_FLUSH_POLL_BLOCK_ID_MASK        PPC_BITMASK(36, 39)
+#define  PC_NXC_FLUSH_POLL_OFFSET_MASK          PPC_BITMASK(40, 63) /* 2=
4-bit */
+
+/* NxC Cache Watch 0 Specification */
+#define X_PC_NXC_WATCH0_SPEC                    0x2A0
+#define PC_NXC_WATCH0_SPEC                      0x500
+#define   PC_NXC_WATCH_CONFLICT                 PPC_BIT(0)
+#define   PC_NXC_WATCH_FULL                     PPC_BIT(8)
+#define   PC_NXC_WATCH_NXC_TYPE                 PPC_BITMASK(26, 27)
+#define     PC_NXC_WATCH_NXC_NVP                0
+#define     PC_NXC_WATCH_NXC_NVG                2
+#define     PC_NXC_WATCH_NXC_NVC                3
+#define   PC_NXC_WATCH_BLOCK_ID                 PPC_BITMASK(28, 31)
+#define   PC_NXC_WATCH_INDEX                    PPC_BITMASK(40, 63)
+
+/* NxC Cache Watch 0 Data */
+#define X_PC_NXC_WATCH0_DATA0                   0x2A4
+#define X_PC_NXC_WATCH0_DATA1                   0x2A5
+#define X_PC_NXC_WATCH0_DATA2                   0x2A6
+#define X_PC_NXC_WATCH0_DATA3                   0x2A7
+
+#define PC_NXC_WATCH0_DATA0                     0x520
+#define PC_NXC_WATCH0_DATA1                     0x528
+#define PC_NXC_WATCH0_DATA2                     0x530
+#define PC_NXC_WATCH0_DATA3                     0x538
+
+/*
+ * TCTXT Registers
+ */
+
+/* Physical Thread Enable0 register */
+#define X_TCTXT_EN0                             0x300
+#define TCTXT_EN0                               0x000
+
+/* Physical Thread Enable0 Set register */
+#define X_TCTXT_EN0_SET                         0x302
+#define TCTXT_EN0_SET                           0x010
+
+/* Physical Thread Enable0 Reset register */
+#define X_TCTXT_EN0_RESET                       0x303
+#define TCTXT_EN0_RESET                         0x018
+
+/* Physical Thread Enable1 register */
+#define X_TCTXT_EN1                             0x304
+#define TCTXT_EN1                               0x020
+
+/* Physical Thread Enable1 Set register */
+#define X_TCTXT_EN1_SET                         0x306
+#define TCTXT_EN1_SET                           0x030
+
+/* Physical Thread Enable1 Reset register */
+#define X_TCTXT_EN1_RESET                       0x307
+#define TCTXT_EN1_RESET                         0x038
+
+/*
+ * VSD Tables
+ */
+#define VST_ESB                  0
+#define VST_EAS                  1 /* No used by PC */
+#define VST_END                  2
+#define VST_NVP                  3
+#define VST_NVG                  4
+#define VST_NVC                  5
+#define VST_IC                   6 /* No used by PC */
+#define VST_SYNC                 7
+#define VST_ERQ                  8 /* No used by PC */
+
+/*
+ * Bits in a VSD entry.
+ *
+ * Note: the address is naturally aligned, we don't use a PPC_BITMASK,
+ *       but just a mask to apply to the address before OR'ing it in.
+ *
+ * Note: VSD_FIRMWARE is a SW bit ! It hijacks an unused bit in the
+ *       VSD and is only meant to be used in indirect mode !
+ */
+#define VSD_MODE                PPC_BITMASK(0, 1)
+#define  VSD_MODE_SHARED        1
+#define  VSD_MODE_EXCLUSIVE     2
+#define  VSD_MODE_FORWARD       3
+#define VSD_FIRMWARE            PPC_BIT(2) /* Read warning */
+#define VSD_FIRMWARE2           PPC_BIT(3) /* unused */
+#define VSD_RESERVED            PPC_BITMASK(4, 7) /* P10 reserved */
+#define VSD_ADDRESS_MASK        0x00fffffffffff000ull
+#define VSD_MIGRATION_REG       PPC_BITMASK(52, 55)
+#define VSD_INDIRECT            PPC_BIT(56)
+#define VSD_TSIZE               PPC_BITMASK(59, 63)
+
+#endif /* PPC_PNV_XIVE2_REGS_H */
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 0e9e16544f30..6b3457b4495d 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -125,10 +125,14 @@ struct Pnv10Chip {
     PnvChip      parent_obj;
=20
     /*< public >*/
+    PnvXive2     xive;
     Pnv9Psi      psi;
     PnvLpcController lpc;
 };
=20
+#define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
+#define PNV10_PIR2CHIP(pir)      (((pir) >> 8) & 0x7f)
+
 struct PnvChipClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
@@ -329,10 +333,28 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
 #define PNV10_LPCM_SIZE             0x0000000100000000ull
 #define PNV10_LPCM_BASE(chip)       PNV10_CHIP_BASE(chip, 0x000603000000=
0000ull)
=20
+#define PNV10_XIVE2_IC_SIZE         0x0000000002000000ull
+#define PNV10_XIVE2_IC_BASE(chip)   PNV10_CHIP_BASE(chip, 0x000603020000=
0000ull)
+
 #define PNV10_PSIHB_ESB_SIZE        0x0000000000100000ull
 #define PNV10_PSIHB_ESB_BASE(chip)  PNV10_CHIP_BASE(chip, 0x000603020200=
0000ull)
=20
 #define PNV10_PSIHB_SIZE            0x0000000000100000ull
 #define PNV10_PSIHB_BASE(chip)      PNV10_CHIP_BASE(chip, 0x000603020300=
0000ull)
=20
+#define PNV10_XIVE2_TM_SIZE         0x0000000000040000ull
+#define PNV10_XIVE2_TM_BASE(chip)   PNV10_CHIP_BASE(chip, 0x000603020318=
0000ull)
+
+#define PNV10_XIVE2_NVC_SIZE        0x0000000008000000ull
+#define PNV10_XIVE2_NVC_BASE(chip)  PNV10_CHIP_BASE(chip, 0x000603020800=
0000ull)
+
+#define PNV10_XIVE2_NVPG_SIZE       0x0000010000000000ull
+#define PNV10_XIVE2_NVPG_BASE(chip) PNV10_CHIP_BASE(chip, 0x000604000000=
0000ull)
+
+#define PNV10_XIVE2_ESB_SIZE        0x0000010000000000ull
+#define PNV10_XIVE2_ESB_BASE(chip)  PNV10_CHIP_BASE(chip, 0x000605000000=
0000ull)
+
+#define PNV10_XIVE2_END_SIZE        0x0000020000000000ull
+#define PNV10_XIVE2_END_BASE(chip)  PNV10_CHIP_BASE(chip, 0x000606000000=
0000ull)
+
 #endif /* PPC_PNV_H */
diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
index 7928e279639a..b5d91505e53c 100644
--- a/include/hw/ppc/pnv_xive.h
+++ b/include/hw/ppc/pnv_xive.h
@@ -12,6 +12,7 @@
=20
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
+#include "hw/ppc/xive2.h"
=20
 struct PnvChip;
=20
@@ -95,4 +96,74 @@ struct PnvXiveClass {
=20
 void pnv_xive_pic_print_info(PnvXive *xive, Monitor *mon);
=20
+/*
+ * XIVE2 interrupt controller (POWER10)
+ */
+#define TYPE_PNV_XIVE2 "pnv-xive2"
+OBJECT_DECLARE_TYPE(PnvXive2, PnvXive2Class, PNV_XIVE2);
+
+typedef struct PnvXive2 {
+    Xive2Router   parent_obj;
+
+    /* Owning chip */
+    struct PnvChip *chip;
+
+    /* XSCOM addresses giving access to the controller registers */
+    MemoryRegion  xscom_regs;
+
+    MemoryRegion  ic_mmio;
+    MemoryRegion  ic_mmios[8];
+    MemoryRegion  esb_mmio;
+    MemoryRegion  end_mmio;
+    MemoryRegion  nvc_mmio;
+    MemoryRegion  nvpg_mmio;
+    MemoryRegion  tm_mmio;
+
+    /* Shortcut values for the Main MMIO regions */
+    hwaddr        ic_base;
+    uint32_t      ic_shift;
+    hwaddr        esb_base;
+    uint32_t      esb_shift;
+    hwaddr        end_base;
+    uint32_t      end_shift;
+    hwaddr        nvc_base;
+    uint32_t      nvc_shift;
+    hwaddr        nvpg_base;
+    uint32_t      nvpg_shift;
+    hwaddr        tm_base;
+    uint32_t      tm_shift;
+
+    /* Interrupt controller registers */
+    uint64_t      cq_regs[0x40];
+    uint64_t      vc_regs[0x100];
+    uint64_t      pc_regs[0x100];
+    uint64_t      tctxt_regs[0x30];
+
+    /* To change default behavior */
+    uint64_t      capabilities;
+    uint64_t      config;
+
+    /* Our XIVE source objects for IPIs and ENDs */
+    XiveSource    ipi_source;
+    Xive2EndSource end_source;
+
+    /*
+     * Virtual Structure Descriptor tables
+     * These are in a SRAM protected by ECC.
+     */
+    uint64_t      vsds[9][XIVE_BLOCK_MAX];
+
+    /* Translation tables */
+    uint64_t      tables[8][XIVE_BLOCK_MAX];
+
+} PnvXive2;
+
+typedef struct PnvXive2Class {
+    Xive2RouterClass parent_class;
+
+    DeviceRealize parent_realize;
+} PnvXive2Class;
+
+void pnv_xive2_pic_print_info(PnvXive2 *xive, Monitor *mon);
+
 #endif /* PPC_PNV_XIVE_H */
diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
index 2ff9f7a8d6fe..188da874a4b0 100644
--- a/include/hw/ppc/pnv_xscom.h
+++ b/include/hw/ppc/pnv_xscom.h
@@ -131,6 +131,9 @@ struct PnvXScomInterfaceClass {
 #define PNV10_XSCOM_PSIHB_BASE     0x3011D00
 #define PNV10_XSCOM_PSIHB_SIZE     0x100
=20
+#define PNV10_XSCOM_XIVE2_BASE     0x2010800
+#define PNV10_XSCOM_XIVE2_SIZE     0x400
+
 void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
 int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
                  uint64_t xscom_base, uint64_t xscom_size,
diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
new file mode 100644
index 000000000000..35a7f7ae4dd8
--- /dev/null
+++ b/hw/intc/pnv_xive2.c
@@ -0,0 +1,2028 @@
+/*
+ * QEMU PowerPC XIVE2 interrupt controller model  (POWER10)
+ *
+ * Copyright (c) 2019-2022, IBM Corporation.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "target/ppc/cpu.h"
+#include "sysemu/cpus.h"
+#include "sysemu/dma.h"
+#include "monitor/monitor.h"
+#include "hw/ppc/fdt.h"
+#include "hw/ppc/pnv.h"
+#include "hw/ppc/pnv_core.h"
+#include "hw/ppc/pnv_xscom.h"
+#include "hw/ppc/xive2.h"
+#include "hw/ppc/pnv_xive.h"
+#include "hw/ppc/xive_regs.h"
+#include "hw/ppc/xive2_regs.h"
+#include "hw/ppc/ppc.h"
+#include "hw/qdev-properties.h"
+#include "sysemu/reset.h"
+
+#include <libfdt.h>
+
+#include "pnv_xive2_regs.h"
+
+#undef XIVE2_DEBUG
+
+/*
+ * Virtual structures table (VST)
+ */
+#define SBE_PER_BYTE   4
+
+typedef struct XiveVstInfo {
+    const char *name;
+    uint32_t    size;
+    uint32_t    max_blocks;
+} XiveVstInfo;
+
+static const XiveVstInfo vst_infos[] =3D {
+
+    [VST_EAS]  =3D { "EAT",  sizeof(Xive2Eas),  16 },
+    [VST_ESB]  =3D { "ESB",  1,                  16 },
+    [VST_END]  =3D { "ENDT", sizeof(Xive2End),  16 },
+
+    [VST_NVP]  =3D { "NVPT", sizeof(Xive2Nvp),  16 },
+    [VST_NVG]  =3D { "NVGT", sizeof(Xive2Nvgc), 16 },
+    [VST_NVC]  =3D { "NVCT", sizeof(Xive2Nvgc), 16 },
+
+    [VST_IC]  =3D  { "IC",   1 /* ? */         , 16 }, /* Topology # */
+    [VST_SYNC] =3D { "SYNC", 1 /* ? */         , 16 }, /* Topology # */
+
+    /*
+     * This table contains the backing store pages for the interrupt
+     * fifos of the VC sub-engine in case of overflow.
+     *
+     * 0 - IPI,
+     * 1 - HWD,
+     * 2 - NxC,
+     * 3 - INT,
+     * 4 - OS-Queue,
+     * 5 - Pool-Queue,
+     * 6 - Hard-Queue
+     */
+    [VST_ERQ]  =3D { "ERQ",  1,                   VC_QUEUE_COUNT },
+};
+
+#define xive2_error(xive, fmt, ...)                                     =
 \
+    qemu_log_mask(LOG_GUEST_ERROR, "XIVE[%x] - " fmt "\n",              =
\
+                  (xive)->chip->chip_id, ## __VA_ARGS__);
+
+/*
+ * QEMU version of the GETFIELD/SETFIELD macros
+ *
+ * TODO: It might be better to use the existing extract64() and
+ * deposit64() but this means that all the register definitions will
+ * change and become incompatible with the ones found in skiboot.
+ *
+ * Keep it as it is for now until we find a common ground.
+ */
+static inline uint64_t GETFIELD(uint64_t mask, uint64_t word)
+{
+    return (word & mask) >> ctz64(mask);
+}
+
+static inline uint64_t SETFIELD(uint64_t mask, uint64_t word,
+                                uint64_t value)
+{
+    return (word & ~mask) | ((value << ctz64(mask)) & mask);
+}
+
+/*
+ * TODO: Document block id override
+ */
+static uint32_t pnv_xive2_block_id(PnvXive2 *xive)
+{
+    uint8_t blk =3D xive->chip->chip_id;
+    uint64_t cfg_val =3D xive->cq_regs[CQ_XIVE_CFG >> 3];
+
+    if (cfg_val & CQ_XIVE_CFG_HYP_HARD_BLKID_OVERRIDE) {
+        blk =3D GETFIELD(CQ_XIVE_CFG_HYP_HARD_BLOCK_ID, cfg_val);
+    }
+
+    return blk;
+}
+
+/*
+ * Remote access to controllers. HW uses MMIOs. For now, a simple scan
+ * of the chips is good enough.
+ *
+ * TODO: Block scope support
+ */
+static PnvXive2 *pnv_xive2_get_remote(uint8_t blk)
+{
+    PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
+    int i;
+
+    for (i =3D 0; i < pnv->num_chips; i++) {
+        Pnv10Chip *chip10 =3D PNV10_CHIP(pnv->chips[i]);
+        PnvXive2 *xive =3D &chip10->xive;
+
+        if (pnv_xive2_block_id(xive) =3D=3D blk) {
+            return xive;
+        }
+    }
+    return NULL;
+}
+
+/*
+ * VST accessors for ESB, EAT, ENDT, NVP
+ *
+ * Indirect VST tables are arrays of VSDs pointing to a page (of same
+ * size). Each page is a direct VST table.
+ */
+
+#define XIVE_VSD_SIZE 8
+
+/* Indirect page size can be 4K, 64K, 2M, 16M. */
+static uint64_t pnv_xive2_vst_page_size_allowed(uint32_t page_shift)
+{
+     return page_shift =3D=3D 12 || page_shift =3D=3D 16 ||
+         page_shift =3D=3D 21 || page_shift =3D=3D 24;
+}
+
+static uint64_t pnv_xive2_vst_addr_direct(PnvXive2 *xive, uint32_t type,
+                                          uint64_t vsd, uint32_t idx)
+{
+    const XiveVstInfo *info =3D &vst_infos[type];
+    uint64_t vst_addr =3D vsd & VSD_ADDRESS_MASK;
+    uint64_t vst_tsize =3D 1ull << (GETFIELD(VSD_TSIZE, vsd) + 12);
+    uint32_t idx_max;
+
+    idx_max =3D vst_tsize / info->size - 1;
+    if (idx > idx_max) {
+#ifdef XIVE2_DEBUG
+        xive2_error(xive, "VST: %s entry %x out of range [ 0 .. %x ] !?"=
,
+                   info->name, idx, idx_max);
+#endif
+        return 0;
+    }
+
+    return vst_addr + idx * info->size;
+}
+
+static uint64_t pnv_xive2_vst_addr_indirect(PnvXive2 *xive, uint32_t typ=
e,
+                                            uint64_t vsd, uint32_t idx)
+{
+    const XiveVstInfo *info =3D &vst_infos[type];
+    uint64_t vsd_addr;
+    uint32_t vsd_idx;
+    uint32_t page_shift;
+    uint32_t vst_per_page;
+
+    /* Get the page size of the indirect table. */
+    vsd_addr =3D vsd & VSD_ADDRESS_MASK;
+    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECI=
FIED);
+
+    if (!(vsd & VSD_ADDRESS_MASK)) {
+        xive2_error(xive, "VST: invalid %s entry %x !?", info->name, idx=
);
+        return 0;
+    }
+
+    page_shift =3D GETFIELD(VSD_TSIZE, vsd) + 12;
+
+    if (!pnv_xive2_vst_page_size_allowed(page_shift)) {
+        xive2_error(xive, "VST: invalid %s page shift %d", info->name,
+                   page_shift);
+        return 0;
+    }
+
+    vst_per_page =3D (1ull << page_shift) / info->size;
+    vsd_idx =3D idx / vst_per_page;
+
+    /* Load the VSD we are looking for, if not already done */
+    if (vsd_idx) {
+        vsd_addr =3D vsd_addr + vsd_idx * XIVE_VSD_SIZE;
+        ldq_be_dma(&address_space_memory, vsd_addr, &vsd,
+                   MEMTXATTRS_UNSPECIFIED);
+
+        if (!(vsd & VSD_ADDRESS_MASK)) {
+            xive2_error(xive, "VST: invalid %s entry %x !?", info->name,=
 idx);
+            return 0;
+        }
+
+        /*
+         * Check that the pages have a consistent size across the
+         * indirect table
+         */
+        if (page_shift !=3D GETFIELD(VSD_TSIZE, vsd) + 12) {
+            xive2_error(xive, "VST: %s entry %x indirect page size diffe=
r !?",
+                       info->name, idx);
+            return 0;
+        }
+    }
+
+    return pnv_xive2_vst_addr_direct(xive, type, vsd, (idx % vst_per_pag=
e));
+}
+
+static uint64_t pnv_xive2_vst_addr(PnvXive2 *xive, uint32_t type, uint8_=
t blk,
+                                   uint32_t idx)
+{
+    const XiveVstInfo *info =3D &vst_infos[type];
+    uint64_t vsd;
+
+    if (blk >=3D info->max_blocks) {
+        xive2_error(xive, "VST: invalid block id %d for VST %s %d !?",
+                   blk, info->name, idx);
+        return 0;
+    }
+
+    vsd =3D xive->vsds[type][blk];
+
+    /* Remote VST access */
+    if (GETFIELD(VSD_MODE, vsd) =3D=3D VSD_MODE_FORWARD) {
+        xive =3D pnv_xive2_get_remote(blk);
+
+        return xive ? pnv_xive2_vst_addr(xive, type, blk, idx) : 0;
+    }
+
+    if (VSD_INDIRECT & vsd) {
+        return pnv_xive2_vst_addr_indirect(xive, type, vsd, idx);
+    }
+
+    return pnv_xive2_vst_addr_direct(xive, type, vsd, idx);
+}
+
+static int pnv_xive2_vst_read(PnvXive2 *xive, uint32_t type, uint8_t blk=
,
+                             uint32_t idx, void *data)
+{
+    const XiveVstInfo *info =3D &vst_infos[type];
+    uint64_t addr =3D pnv_xive2_vst_addr(xive, type, blk, idx);
+
+    if (!addr) {
+        return -1;
+    }
+
+    cpu_physical_memory_read(addr, data, info->size);
+    return 0;
+}
+
+#define XIVE_VST_WORD_ALL -1
+
+static int pnv_xive2_vst_write(PnvXive2 *xive, uint32_t type, uint8_t bl=
k,
+                               uint32_t idx, void *data, uint32_t word_n=
umber)
+{
+    const XiveVstInfo *info =3D &vst_infos[type];
+    uint64_t addr =3D pnv_xive2_vst_addr(xive, type, blk, idx);
+
+    if (!addr) {
+        return -1;
+    }
+
+    if (word_number =3D=3D XIVE_VST_WORD_ALL) {
+        cpu_physical_memory_write(addr, data, info->size);
+    } else {
+        cpu_physical_memory_write(addr + word_number * 4,
+                                  data + word_number * 4, 4);
+    }
+    return 0;
+}
+
+static int pnv_xive2_get_end(Xive2Router *xrtr, uint8_t blk, uint32_t id=
x,
+                             Xive2End *end)
+{
+    return pnv_xive2_vst_read(PNV_XIVE2(xrtr), VST_END, blk, idx, end);
+}
+
+static int pnv_xive2_write_end(Xive2Router *xrtr, uint8_t blk, uint32_t =
idx,
+                               Xive2End *end, uint8_t word_number)
+{
+    return pnv_xive2_vst_write(PNV_XIVE2(xrtr), VST_END, blk, idx, end,
+                              word_number);
+}
+
+static int pnv_xive2_end_update(PnvXive2 *xive)
+{
+    uint8_t  blk =3D GETFIELD(VC_ENDC_WATCH_BLOCK_ID,
+                           xive->vc_regs[(VC_ENDC_WATCH0_SPEC >> 3)]);
+    uint32_t idx =3D GETFIELD(VC_ENDC_WATCH_INDEX,
+                           xive->vc_regs[(VC_ENDC_WATCH0_SPEC >> 3)]);
+    int i;
+    uint64_t endc_watch[4];
+
+    for (i =3D 0; i < ARRAY_SIZE(endc_watch); i++) {
+        endc_watch[i] =3D
+            cpu_to_be64(xive->vc_regs[(VC_ENDC_WATCH0_DATA0 >> 3) + i]);
+    }
+
+    return pnv_xive2_vst_write(xive, VST_END, blk, idx, endc_watch,
+                              XIVE_VST_WORD_ALL);
+}
+
+static void pnv_xive2_end_cache_load(PnvXive2 *xive)
+{
+    uint8_t  blk =3D GETFIELD(VC_ENDC_WATCH_BLOCK_ID,
+                           xive->vc_regs[(VC_ENDC_WATCH0_SPEC >> 3)]);
+    uint32_t idx =3D GETFIELD(VC_ENDC_WATCH_INDEX,
+                           xive->vc_regs[(VC_ENDC_WATCH0_SPEC >> 3)]);
+    uint64_t endc_watch[4] =3D { 0 };
+    int i;
+
+    if (pnv_xive2_vst_read(xive, VST_END, blk, idx, endc_watch)) {
+        xive2_error(xive, "VST: no END entry %x/%x !?", blk, idx);
+    }
+
+    for (i =3D 0; i < ARRAY_SIZE(endc_watch); i++) {
+        xive->vc_regs[(VC_ENDC_WATCH0_DATA0 >> 3) + i] =3D
+            be64_to_cpu(endc_watch[i]);
+    }
+}
+
+static int pnv_xive2_get_nvp(Xive2Router *xrtr, uint8_t blk, uint32_t id=
x,
+                             Xive2Nvp *nvp)
+{
+    return pnv_xive2_vst_read(PNV_XIVE2(xrtr), VST_NVP, blk, idx, nvp);
+}
+
+static int pnv_xive2_write_nvp(Xive2Router *xrtr, uint8_t blk, uint32_t =
idx,
+                               Xive2Nvp *nvp, uint8_t word_number)
+{
+    return pnv_xive2_vst_write(PNV_XIVE2(xrtr), VST_NVP, blk, idx, nvp,
+                              word_number);
+}
+
+static int pnv_xive2_nvp_update(PnvXive2 *xive)
+{
+    uint8_t  blk =3D GETFIELD(PC_NXC_WATCH_BLOCK_ID,
+                            xive->pc_regs[(PC_NXC_WATCH0_SPEC >> 3)]);
+    uint32_t idx =3D GETFIELD(PC_NXC_WATCH_INDEX,
+                            xive->pc_regs[(PC_NXC_WATCH0_SPEC >> 3)]);
+    int i;
+    uint64_t nxc_watch[4];
+
+    for (i =3D 0; i < ARRAY_SIZE(nxc_watch); i++) {
+        nxc_watch[i] =3D
+            cpu_to_be64(xive->pc_regs[(PC_NXC_WATCH0_DATA0 >> 3) + i]);
+    }
+
+    return pnv_xive2_vst_write(xive, VST_NVP, blk, idx, nxc_watch,
+                              XIVE_VST_WORD_ALL);
+}
+
+static void pnv_xive2_nvp_cache_load(PnvXive2 *xive)
+{
+    uint8_t  blk =3D GETFIELD(PC_NXC_WATCH_BLOCK_ID,
+                           xive->pc_regs[(PC_NXC_WATCH0_SPEC >> 3)]);
+    uint32_t idx =3D GETFIELD(PC_NXC_WATCH_INDEX,
+                           xive->pc_regs[(PC_NXC_WATCH0_SPEC >> 3)]);
+    uint64_t nxc_watch[4] =3D { 0 };
+    int i;
+
+    if (pnv_xive2_vst_read(xive, VST_NVP, blk, idx, nxc_watch)) {
+        xive2_error(xive, "VST: no NVP entry %x/%x !?", blk, idx);
+    }
+
+    for (i =3D 0; i < ARRAY_SIZE(nxc_watch); i++) {
+        xive->pc_regs[(PC_NXC_WATCH0_DATA0 >> 3) + i] =3D
+            be64_to_cpu(nxc_watch[i]);
+    }
+}
+
+static int pnv_xive2_get_eas(Xive2Router *xrtr, uint8_t blk, uint32_t id=
x,
+                            Xive2Eas *eas)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(xrtr);
+
+    if (pnv_xive2_block_id(xive) !=3D blk) {
+        xive2_error(xive, "VST: EAS %x is remote !?", XIVE_EAS(blk, idx)=
);
+        return -1;
+    }
+
+    return pnv_xive2_vst_read(xive, VST_EAS, blk, idx, eas);
+}
+
+static bool pnv_xive2_is_cpu_enabled(PnvXive2 *xive, PowerPCCPU *cpu)
+{
+    int pir =3D ppc_cpu_pir(cpu);
+    uint32_t fc =3D PNV10_PIR2FUSEDCORE(pir);
+    uint64_t reg =3D fc < 8 ? TCTXT_EN0 : TCTXT_EN1;
+    uint32_t bit =3D pir & 0x3f;
+
+    return xive->tctxt_regs[reg >> 3] & PPC_BIT(bit);
+}
+
+static int pnv_xive2_match_nvt(XivePresenter *xptr, uint8_t format,
+                               uint8_t nvt_blk, uint32_t nvt_idx,
+                               bool cam_ignore, uint8_t priority,
+                               uint32_t logic_serv, XiveTCTXMatch *match=
)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(xptr);
+    PnvChip *chip =3D xive->chip;
+    int count =3D 0;
+    int i, j;
+
+    for (i =3D 0; i < chip->nr_cores; i++) {
+        PnvCore *pc =3D chip->cores[i];
+        CPUCore *cc =3D CPU_CORE(pc);
+
+        for (j =3D 0; j < cc->nr_threads; j++) {
+            PowerPCCPU *cpu =3D pc->threads[j];
+            XiveTCTX *tctx;
+            int ring;
+
+            if (!pnv_xive2_is_cpu_enabled(xive, cpu)) {
+                continue;
+            }
+
+            tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+
+            ring =3D xive2_presenter_tctx_match(xptr, tctx, format, nvt_=
blk,
+                                              nvt_idx, cam_ignore,
+                                              logic_serv);
+
+            /*
+             * Save the context and follow on to catch duplicates,
+             * that we don't support yet.
+             */
+            if (ring !=3D -1) {
+                if (match->tctx) {
+                    qemu_log_mask(LOG_GUEST_ERROR, "XIVE: already found =
a "
+                                  "thread context NVT %x/%x\n",
+                                  nvt_blk, nvt_idx);
+                    return false;
+                }
+
+                match->ring =3D ring;
+                match->tctx =3D tctx;
+                count++;
+            }
+        }
+    }
+
+    return count;
+}
+
+static uint8_t pnv_xive2_get_block_id(Xive2Router *xrtr)
+{
+    return pnv_xive2_block_id(PNV_XIVE2(xrtr));
+}
+
+/*
+ * The TIMA MMIO space is shared among the chips and to identify the
+ * chip from which the access is being done, we extract the chip id
+ * from the PIR.
+ */
+static PnvXive2 *pnv_xive2_tm_get_xive(PowerPCCPU *cpu)
+{
+    int pir =3D ppc_cpu_pir(cpu);
+    XivePresenter *xptr =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc)->xptr;
+    PnvXive2 *xive =3D PNV_XIVE2(xptr);
+
+    if (!pnv_xive2_is_cpu_enabled(xive, cpu)) {
+        xive2_error(xive, "IC: CPU %x is not enabled", pir);
+    }
+    return xive;
+}
+
+/*
+ * The internal sources of the interrupt controller have no knowledge
+ * of the XIVE2 chip on which they reside. Encode the block id in the
+ * source interrupt number before forwarding the source event
+ * notification to the Router. This is required on a multichip system.
+ */
+static void pnv_xive2_notify(XiveNotifier *xn, uint32_t srcno)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(xn);
+    uint8_t blk =3D pnv_xive2_block_id(xive);
+
+    xive2_router_notify(xn, XIVE_EAS(blk, srcno));
+}
+
+/*
+ * Set Translation Tables
+ *
+ * TODO add support for multiple sets
+ */
+static int pnv_xive2_stt_set_data(PnvXive2 *xive, uint64_t val)
+{
+    uint8_t tsel =3D GETFIELD(CQ_TAR_SELECT, xive->cq_regs[CQ_TAR >> 3])=
;
+    uint8_t entry =3D GETFIELD(CQ_TAR_ENTRY_SELECT,
+                                  xive->cq_regs[CQ_TAR >> 3]);
+
+    switch (tsel) {
+    case CQ_TAR_NVPG:
+    case CQ_TAR_ESB:
+    case CQ_TAR_END:
+        xive->tables[tsel][entry] =3D val;
+        break;
+    default:
+        xive2_error(xive, "IC: unsupported table %d", tsel);
+        return -1;
+    }
+
+    if (xive->cq_regs[CQ_TAR >> 3] & CQ_TAR_AUTOINC) {
+        xive->cq_regs[CQ_TAR >> 3] =3D SETFIELD(CQ_TAR_ENTRY_SELECT,
+                     xive->cq_regs[CQ_TAR >> 3], ++entry);
+    }
+
+    return 0;
+}
+/*
+ * Virtual Structure Tables (VST) configuration
+ */
+static void pnv_xive2_vst_set_exclusive(PnvXive2 *xive, uint8_t type,
+                                        uint8_t blk, uint64_t vsd)
+{
+    Xive2EndSource *end_xsrc =3D &xive->end_source;
+    XiveSource *xsrc =3D &xive->ipi_source;
+    const XiveVstInfo *info =3D &vst_infos[type];
+    uint32_t page_shift =3D GETFIELD(VSD_TSIZE, vsd) + 12;
+    uint64_t vst_tsize =3D 1ull << page_shift;
+    uint64_t vst_addr =3D vsd & VSD_ADDRESS_MASK;
+
+    /* Basic checks */
+
+    if (VSD_INDIRECT & vsd) {
+        if (!pnv_xive2_vst_page_size_allowed(page_shift)) {
+            xive2_error(xive, "VST: invalid %s page shift %d", info->nam=
e,
+                       page_shift);
+            return;
+        }
+    }
+
+    if (!QEMU_IS_ALIGNED(vst_addr, 1ull << page_shift)) {
+        xive2_error(xive, "VST: %s table address 0x%"PRIx64
+                    " is not aligned with page shift %d",
+                    info->name, vst_addr, page_shift);
+        return;
+    }
+
+    /* Record the table configuration (in SRAM on HW) */
+    xive->vsds[type][blk] =3D vsd;
+
+    /* Now tune the models with the configuration provided by the FW */
+
+    switch (type) {
+    case VST_ESB:
+        /*
+         * Backing store pages for the source PQ bits. The model does
+         * not use these PQ bits backed in RAM because the XiveSource
+         * model has its own.
+         *
+         * If the table is direct, we can compute the number of PQ
+         * entries provisioned by FW (such as skiboot) and resize the
+         * ESB window accordingly.
+         */
+        if (!(VSD_INDIRECT & vsd)) {
+            memory_region_set_size(&xsrc->esb_mmio, vst_tsize * SBE_PER_=
BYTE
+                                   * (1ull << xsrc->esb_shift));
+        }
+
+        memory_region_add_subregion(&xive->esb_mmio, 0, &xsrc->esb_mmio)=
;
+        break;
+
+    case VST_EAS:  /* Nothing to be done */
+        break;
+
+    case VST_END:
+        /*
+         * Backing store pages for the END.
+         */
+        if (!(VSD_INDIRECT & vsd)) {
+            memory_region_set_size(&end_xsrc->esb_mmio, (vst_tsize / inf=
o->size)
+                                   * (1ull << end_xsrc->esb_shift));
+        }
+        memory_region_add_subregion(&xive->end_mmio, 0, &end_xsrc->esb_m=
mio);
+        break;
+
+    case VST_NVP:  /* Not modeled */
+    case VST_NVG:  /* Not modeled */
+    case VST_NVC:  /* Not modeled */
+    case VST_IC:   /* Not modeled */
+    case VST_SYNC: /* Not modeled */
+    case VST_ERQ:  /* Not modeled */
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/*
+ * Both PC and VC sub-engines are configured as each use the Virtual
+ * Structure Tables
+ */
+static void pnv_xive2_vst_set_data(PnvXive2 *xive, uint64_t vsd)
+{
+    uint8_t mode =3D GETFIELD(VSD_MODE, vsd);
+    uint8_t type =3D GETFIELD(VC_VSD_TABLE_SELECT,
+                            xive->vc_regs[VC_VSD_TABLE_ADDR >> 3]);
+    uint8_t blk =3D GETFIELD(VC_VSD_TABLE_ADDRESS,
+                           xive->vc_regs[VC_VSD_TABLE_ADDR >> 3]);
+    uint64_t vst_addr =3D vsd & VSD_ADDRESS_MASK;
+
+    if (type > VST_ERQ) {
+        xive2_error(xive, "VST: invalid table type %d", type);
+        return;
+    }
+
+    if (blk >=3D vst_infos[type].max_blocks) {
+        xive2_error(xive, "VST: invalid block id %d for"
+                      " %s table", blk, vst_infos[type].name);
+        return;
+    }
+
+    if (!vst_addr) {
+        xive2_error(xive, "VST: invalid %s table address",
+                   vst_infos[type].name);
+        return;
+    }
+
+    switch (mode) {
+    case VSD_MODE_FORWARD:
+        xive->vsds[type][blk] =3D vsd;
+        break;
+
+    case VSD_MODE_EXCLUSIVE:
+        pnv_xive2_vst_set_exclusive(xive, type, blk, vsd);
+        break;
+
+    default:
+        xive2_error(xive, "VST: unsupported table mode %d", mode);
+        return;
+    }
+}
+
+/*
+ * MMIO handlers
+ */
+
+
+/*
+ * IC BAR layout
+ *
+ * Page 0: Internal CQ register accesses (reads & writes)
+ * Page 1: Internal PC register accesses (reads & writes)
+ * Page 2: Internal VC register accesses (reads & writes)
+ * Page 3: Internal TCTXT (TIMA) reg accesses (read & writes)
+ * Page 4: Notify Port page (writes only, w/data),
+ * Page 5: Reserved
+ * Page 6: Sync Poll page (writes only, dataless)
+ * Page 7: Sync Inject page (writes only, dataless)
+ * Page 8: LSI Trigger page (writes only, dataless)
+ * Page 9: LSI SB Management page (reads & writes dataless)
+ * Pages 10-255: Reserved
+ * Pages 256-383: Direct mapped Thread Context Area (reads & writes)
+ *                covering the 128 threads in P10.
+ * Pages 384-511: Reserved
+ */
+typedef struct PnvXive2Region {
+    const char *name;
+    uint32_t pgoff;
+    uint32_t pgsize;
+    const MemoryRegionOps *ops;
+} PnvXive2Region;
+
+static const MemoryRegionOps pnv_xive2_ic_cq_ops;
+static const MemoryRegionOps pnv_xive2_ic_pc_ops;
+static const MemoryRegionOps pnv_xive2_ic_vc_ops;
+static const MemoryRegionOps pnv_xive2_ic_tctxt_ops;
+static const MemoryRegionOps pnv_xive2_ic_notify_ops;
+static const MemoryRegionOps pnv_xive2_ic_sync_ops;
+static const MemoryRegionOps pnv_xive2_ic_lsi_ops;
+static const MemoryRegionOps pnv_xive2_ic_tm_indirect_ops;
+
+/* 512 pages. 4K: 2M range, 64K: 32M range */
+static const PnvXive2Region pnv_xive2_ic_regions[] =3D {
+    { "xive-ic-cq",        0,   1,   &pnv_xive2_ic_cq_ops     },
+    { "xive-ic-vc",        1,   1,   &pnv_xive2_ic_vc_ops     },
+    { "xive-ic-pc",        2,   1,   &pnv_xive2_ic_pc_ops     },
+    { "xive-ic-tctxt",     3,   1,   &pnv_xive2_ic_tctxt_ops  },
+    { "xive-ic-notify",    4,   1,   &pnv_xive2_ic_notify_ops },
+    /* page 5 reserved */
+    { "xive-ic-sync",      6,   2,   &pnv_xive2_ic_sync_ops   },
+    { "xive-ic-lsi",       8,   2,   &pnv_xive2_ic_lsi_ops    },
+    /* pages 10-255 reserved */
+    { "xive-ic-tm-indirect", 256, 128, &pnv_xive2_ic_tm_indirect_ops  },
+    /* pages 384-511 reserved */
+};
+
+/*
+ * CQ operations
+ */
+
+static uint64_t pnv_xive2_ic_cq_read(void *opaque, hwaddr offset,
+                                        unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint32_t reg =3D offset >> 3;
+    uint64_t val =3D 0;
+
+    switch (offset) {
+    case CQ_XIVE_CAP: /* Set at reset */
+    case CQ_XIVE_CFG:
+        val =3D xive->cq_regs[reg];
+        break;
+    case CQ_MSGSND: /* TODO check the #cores of the machine */
+        val =3D 0xffffffff00000000;
+        break;
+    case CQ_CFG_PB_GEN:
+        val =3D CQ_CFG_PB_GEN_PB_INIT; /* TODO: fix CQ_CFG_PB_GEN defaul=
t value */
+        break;
+    default:
+        xive2_error(xive, "CQ: invalid read @%"HWADDR_PRIx, offset);
+    }
+
+    return val;
+}
+
+static uint64_t pnv_xive2_bar_size(uint64_t val)
+{
+    return 1ull << (GETFIELD(CQ_BAR_RANGE, val) + 24);
+}
+
+static void pnv_xive2_ic_cq_write(void *opaque, hwaddr offset,
+                                  uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    MemoryRegion *sysmem =3D get_system_memory();
+    uint32_t reg =3D offset >> 3;
+    int i;
+
+    switch (offset) {
+    case CQ_XIVE_CFG:
+    case CQ_RST_CTL: /* TODO: reset all BARs */
+        break;
+
+    case CQ_IC_BAR:
+        xive->ic_shift =3D val & CQ_IC_BAR_64K ? 16 : 12;
+        if (!(val & CQ_IC_BAR_VALID)) {
+            xive->ic_base =3D 0;
+            if (xive->cq_regs[reg] & CQ_IC_BAR_VALID) {
+                for (i =3D 0; i < ARRAY_SIZE(xive->ic_mmios); i++) {
+                    memory_region_del_subregion(&xive->ic_mmio,
+                                                &xive->ic_mmios[i]);
+                }
+                memory_region_del_subregion(sysmem, &xive->ic_mmio);
+            }
+        } else {
+            xive->ic_base =3D val & ~(CQ_IC_BAR_VALID | CQ_IC_BAR_64K);
+            if (!(xive->cq_regs[reg] & CQ_IC_BAR_VALID)) {
+                for (i =3D 0; i < ARRAY_SIZE(xive->ic_mmios); i++) {
+                    memory_region_add_subregion(&xive->ic_mmio,
+                               pnv_xive2_ic_regions[i].pgoff << xive->ic=
_shift,
+                               &xive->ic_mmios[i]);
+                }
+                memory_region_add_subregion(sysmem, xive->ic_base,
+                                            &xive->ic_mmio);
+            }
+        }
+        break;
+
+    case CQ_TM_BAR:
+        xive->tm_shift =3D val & CQ_TM_BAR_64K ? 16 : 12;
+        if (!(val & CQ_TM_BAR_VALID)) {
+            xive->tm_base =3D 0;
+            if (xive->cq_regs[reg] & CQ_TM_BAR_VALID) {
+                memory_region_del_subregion(sysmem, &xive->tm_mmio);
+            }
+        } else {
+            xive->tm_base =3D val & ~(CQ_TM_BAR_VALID | CQ_TM_BAR_64K);
+            if (!(xive->cq_regs[reg] & CQ_TM_BAR_VALID)) {
+                memory_region_add_subregion(sysmem, xive->tm_base,
+                                            &xive->tm_mmio);
+            }
+        }
+        break;
+
+    case CQ_ESB_BAR:
+        xive->esb_shift =3D val & CQ_BAR_64K ? 16 : 12;
+        if (!(val & CQ_BAR_VALID)) {
+            xive->esb_base =3D 0;
+            if (xive->cq_regs[reg] & CQ_BAR_VALID) {
+                memory_region_del_subregion(sysmem, &xive->esb_mmio);
+            }
+        } else {
+            xive->esb_base =3D val & CQ_BAR_ADDR;
+            if (!(xive->cq_regs[reg] & CQ_BAR_VALID)) {
+                memory_region_set_size(&xive->esb_mmio,
+                                       pnv_xive2_bar_size(val));
+                memory_region_add_subregion(sysmem, xive->esb_base,
+                                            &xive->esb_mmio);
+            }
+        }
+        break;
+
+    case CQ_END_BAR:
+        xive->end_shift =3D val & CQ_BAR_64K ? 16 : 12;
+        if (!(val & CQ_BAR_VALID)) {
+            xive->end_base =3D 0;
+            if (xive->cq_regs[reg] & CQ_BAR_VALID) {
+                memory_region_del_subregion(sysmem, &xive->end_mmio);
+            }
+        } else {
+            xive->end_base =3D val & CQ_BAR_ADDR;
+            if (!(xive->cq_regs[reg] & CQ_BAR_VALID)) {
+                memory_region_set_size(&xive->end_mmio,
+                                       pnv_xive2_bar_size(val));
+                memory_region_add_subregion(sysmem, xive->end_base,
+                                            &xive->end_mmio);
+            }
+        }
+        break;
+
+    case CQ_NVC_BAR:
+        xive->nvc_shift =3D val & CQ_BAR_64K ? 16 : 12;
+        if (!(val & CQ_BAR_VALID)) {
+            xive->nvc_base =3D 0;
+            if (xive->cq_regs[reg] & CQ_BAR_VALID) {
+                memory_region_del_subregion(sysmem, &xive->nvc_mmio);
+            }
+        } else {
+            xive->nvc_base =3D val & CQ_BAR_ADDR;
+            if (!(xive->cq_regs[reg] & CQ_BAR_VALID)) {
+                memory_region_set_size(&xive->nvc_mmio,
+                                       pnv_xive2_bar_size(val));
+                memory_region_add_subregion(sysmem, xive->nvc_base,
+                                            &xive->nvc_mmio);
+            }
+        }
+        break;
+
+    case CQ_NVPG_BAR:
+        xive->nvpg_shift =3D val & CQ_BAR_64K ? 16 : 12;
+        if (!(val & CQ_BAR_VALID)) {
+            xive->nvpg_base =3D 0;
+            if (xive->cq_regs[reg] & CQ_BAR_VALID) {
+                memory_region_del_subregion(sysmem, &xive->nvpg_mmio);
+            }
+        } else {
+            xive->nvpg_base =3D val & CQ_BAR_ADDR;
+            if (!(xive->cq_regs[reg] & CQ_BAR_VALID)) {
+                memory_region_set_size(&xive->nvpg_mmio,
+                                       pnv_xive2_bar_size(val));
+                memory_region_add_subregion(sysmem, xive->nvpg_base,
+                                            &xive->nvpg_mmio);
+            }
+        }
+        break;
+
+    case CQ_TAR: /* Set Translation Table Address */
+        break;
+    case CQ_TDR: /* Set Translation Table Data */
+        pnv_xive2_stt_set_data(xive, val);
+        break;
+    case CQ_FIRMASK_OR: /* FIR error reporting */
+        break;
+    default:
+        xive2_error(xive, "CQ: invalid write 0x%"HWADDR_PRIx, offset);
+        return;
+    }
+
+    xive->cq_regs[reg] =3D val;
+}
+
+static const MemoryRegionOps pnv_xive2_ic_cq_ops =3D {
+    .read =3D pnv_xive2_ic_cq_read,
+    .write =3D pnv_xive2_ic_cq_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+static uint64_t pnv_xive2_ic_vc_read(void *opaque, hwaddr offset,
+                                     unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint64_t val =3D 0;
+    uint32_t reg =3D offset >> 3;
+
+    switch (offset) {
+    /*
+     * VSD table settings.
+     */
+    case VC_VSD_TABLE_ADDR:
+    case VC_VSD_TABLE_DATA:
+        val =3D xive->vc_regs[reg];
+        break;
+
+    /*
+     * ESB cache updates (not modeled)
+     */
+    case VC_ESBC_FLUSH_CTRL:
+        xive->vc_regs[reg] &=3D ~VC_ESBC_FLUSH_CTRL_POLL_VALID;
+        val =3D xive->vc_regs[reg];
+        break;
+
+    /*
+     * EAS cache updates (not modeled)
+     */
+    case VC_EASC_FLUSH_CTRL:
+        xive->vc_regs[reg] &=3D ~VC_EASC_FLUSH_CTRL_POLL_VALID;
+        val =3D xive->vc_regs[reg];
+        break;
+
+    /*
+     * END cache updates
+     */
+    case VC_ENDC_WATCH0_SPEC:
+        xive->vc_regs[reg] &=3D ~(VC_ENDC_WATCH_FULL | VC_ENDC_WATCH_CON=
FLICT);
+        val =3D xive->vc_regs[reg];
+        break;
+
+    case VC_ENDC_WATCH0_DATA0:
+        /*
+         * Load DATA registers from cache with data requested by the
+         * SPEC register
+         */
+        pnv_xive2_end_cache_load(xive);
+        val =3D xive->vc_regs[reg];
+        break;
+
+    case VC_ENDC_WATCH0_DATA1 ... VC_ENDC_WATCH0_DATA3:
+        val =3D xive->vc_regs[reg];
+        break;
+
+    case VC_ENDC_FLUSH_CTRL:
+        xive->vc_regs[reg] &=3D ~VC_ENDC_FLUSH_CTRL_POLL_VALID;
+        val =3D xive->vc_regs[reg];
+        break;
+
+    /*
+     * Indirect invalidation
+     */
+    case VC_AT_MACRO_KILL_MASK:
+        val =3D xive->vc_regs[reg];
+        break;
+
+    case VC_AT_MACRO_KILL:
+        xive->vc_regs[reg] &=3D ~VC_AT_MACRO_KILL_VALID;
+        val =3D xive->vc_regs[reg];
+        break;
+
+    /*
+     * Interrupt fifo overflow in memory backing store (Not modeled)
+     */
+    case VC_QUEUES_CFG_REM0 ... VC_QUEUES_CFG_REM6:
+        val =3D xive->vc_regs[reg];
+        break;
+
+    /*
+     * Synchronisation
+     */
+    case VC_ENDC_SYNC_DONE:
+        val =3D VC_ENDC_SYNC_POLL_DONE;
+        break;
+    default:
+        xive2_error(xive, "VC: invalid read @%"HWADDR_PRIx, offset);
+    }
+
+    return val;
+}
+
+static void pnv_xive2_ic_vc_write(void *opaque, hwaddr offset,
+                                  uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint32_t reg =3D offset >> 3;
+
+    switch (offset) {
+    /*
+     * VSD table settings.
+     */
+    case VC_VSD_TABLE_ADDR:
+       break;
+    case VC_VSD_TABLE_DATA:
+        pnv_xive2_vst_set_data(xive, val);
+        break;
+
+    /*
+     * ESB cache updates (not modeled)
+     */
+    /* case VC_ESBC_FLUSH_CTRL: */
+    case VC_ESBC_FLUSH_POLL:
+        xive->vc_regs[VC_ESBC_FLUSH_CTRL >> 3] |=3D VC_ESBC_FLUSH_CTRL_P=
OLL_VALID;
+        /* ESB update */
+        break;
+
+    /*
+     * EAS cache updates (not modeled)
+     */
+    /* case VC_EASC_FLUSH_CTRL: */
+    case VC_EASC_FLUSH_POLL:
+        xive->vc_regs[VC_EASC_FLUSH_CTRL >> 3] |=3D VC_EASC_FLUSH_CTRL_P=
OLL_VALID;
+        /* EAS update */
+        break;
+
+    /*
+     * END cache updates
+     */
+    case VC_ENDC_WATCH0_SPEC:
+         val &=3D ~VC_ENDC_WATCH_CONFLICT; /* HW will set this bit */
+        break;
+
+    case VC_ENDC_WATCH0_DATA1 ... VC_ENDC_WATCH0_DATA3:
+        break;
+    case VC_ENDC_WATCH0_DATA0:
+        /* writing to DATA0 triggers the cache write */
+        xive->vc_regs[reg] =3D val;
+        pnv_xive2_end_update(xive);
+        break;
+
+
+    /* case VC_ENDC_FLUSH_CTRL: */
+    case VC_ENDC_FLUSH_POLL:
+        xive->vc_regs[VC_ENDC_FLUSH_CTRL >> 3] |=3D VC_ENDC_FLUSH_CTRL_P=
OLL_VALID;
+        break;
+
+    /*
+     * Indirect invalidation
+     */
+    case VC_AT_MACRO_KILL:
+    case VC_AT_MACRO_KILL_MASK:
+        break;
+
+    /*
+     * Interrupt fifo overflow in memory backing store (Not modeled)
+     */
+    case VC_QUEUES_CFG_REM0 ... VC_QUEUES_CFG_REM6:
+        break;
+
+    /*
+     * Synchronisation
+     */
+    case VC_ENDC_SYNC_DONE:
+        break;
+
+    default:
+        xive2_error(xive, "VC: invalid write @%"HWADDR_PRIx, offset);
+        return;
+    }
+
+    xive->vc_regs[reg] =3D val;
+}
+
+static const MemoryRegionOps pnv_xive2_ic_vc_ops =3D {
+    .read =3D pnv_xive2_ic_vc_read,
+    .write =3D pnv_xive2_ic_vc_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+static uint64_t pnv_xive2_ic_pc_read(void *opaque, hwaddr offset,
+                                     unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint64_t val =3D -1;
+    uint32_t reg =3D offset >> 3;
+
+    switch (offset) {
+    /*
+     * VSD table settings.
+     */
+    case PC_VSD_TABLE_ADDR:
+    case PC_VSD_TABLE_DATA:
+        val =3D xive->pc_regs[reg];
+        break;
+
+    /*
+     * cache updates
+     */
+    case PC_NXC_WATCH0_SPEC:
+        xive->pc_regs[reg] &=3D ~(PC_NXC_WATCH_FULL | PC_NXC_WATCH_CONFL=
ICT);
+        val =3D xive->pc_regs[reg];
+        break;
+
+    case PC_NXC_WATCH0_DATA0:
+       /*
+        * Load DATA registers from cache with data requested by the
+        * SPEC register
+        */
+        pnv_xive2_nvp_cache_load(xive);
+        val =3D xive->pc_regs[reg];
+        break;
+
+    case PC_NXC_WATCH0_DATA1 ... PC_NXC_WATCH0_DATA3:
+        val =3D xive->pc_regs[reg];
+        break;
+
+    case PC_NXC_FLUSH_CTRL:
+        xive->pc_regs[reg] &=3D ~PC_NXC_FLUSH_CTRL_POLL_VALID;
+        val =3D xive->pc_regs[reg];
+        break;
+
+    /*
+     * Indirect invalidation
+     */
+    case PC_AT_KILL:
+        xive->pc_regs[reg] &=3D ~PC_AT_KILL_VALID;
+        val =3D xive->pc_regs[reg];
+        break;
+
+    default:
+        xive2_error(xive, "PC: invalid read @%"HWADDR_PRIx, offset);
+    }
+
+    return val;
+}
+
+static void pnv_xive2_ic_pc_write(void *opaque, hwaddr offset,
+                                  uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint32_t reg =3D offset >> 3;
+
+    switch (offset) {
+
+    /*
+     * VSD table settings. Only taken into account in the VC
+     * sub-engine because the Xive2Router model combines both VC and PC
+     * sub-engines
+     */
+    case PC_VSD_TABLE_ADDR:
+    case PC_VSD_TABLE_DATA:
+        break;
+
+    /*
+     * cache updates
+     */
+    case PC_NXC_WATCH0_SPEC:
+        val &=3D ~PC_NXC_WATCH_CONFLICT; /* HW will set this bit */
+        break;
+
+    case PC_NXC_WATCH0_DATA1 ... PC_NXC_WATCH0_DATA3:
+        break;
+    case PC_NXC_WATCH0_DATA0:
+        /* writing to DATA0 triggers the cache write */
+        xive->pc_regs[reg] =3D val;
+        pnv_xive2_nvp_update(xive);
+        break;
+
+   /* case PC_NXC_FLUSH_CTRL: */
+    case PC_NXC_FLUSH_POLL:
+        xive->pc_regs[PC_NXC_FLUSH_CTRL >> 3] |=3D PC_NXC_FLUSH_CTRL_POL=
L_VALID;
+        break;
+
+    /*
+     * Indirect invalidation
+     */
+    case PC_AT_KILL:
+    case PC_AT_KILL_MASK:
+        break;
+
+    default:
+        xive2_error(xive, "PC: invalid write @%"HWADDR_PRIx, offset);
+        return;
+    }
+
+    xive->pc_regs[reg] =3D val;
+}
+
+static const MemoryRegionOps pnv_xive2_ic_pc_ops =3D {
+    .read =3D pnv_xive2_ic_pc_read,
+    .write =3D pnv_xive2_ic_pc_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+
+static uint64_t pnv_xive2_ic_tctxt_read(void *opaque, hwaddr offset,
+                                        unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint64_t val =3D -1;
+    uint32_t reg =3D offset >> 3;
+
+    switch (offset) {
+    /*
+     * XIVE2 hardware thread enablement
+     */
+    case TCTXT_EN0:
+    case TCTXT_EN1:
+        val =3D xive->tctxt_regs[reg];
+        break;
+
+    case TCTXT_EN0_SET:
+    case TCTXT_EN0_RESET:
+        val =3D xive->tctxt_regs[TCTXT_EN0 >> 3];
+        break;
+    case TCTXT_EN1_SET:
+    case TCTXT_EN1_RESET:
+        val =3D xive->tctxt_regs[TCTXT_EN1 >> 3];
+        break;
+    default:
+        xive2_error(xive, "TCTXT: invalid read @%"HWADDR_PRIx, offset);
+    }
+
+    return val;
+}
+
+static void pnv_xive2_ic_tctxt_write(void *opaque, hwaddr offset,
+                                     uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint32_t reg =3D offset >> 3;
+
+    switch (offset) {
+    /*
+     * XIVE2 hardware thread enablement
+     */
+    case TCTXT_EN0: /* Physical Thread Enable */
+    case TCTXT_EN1: /* Physical Thread Enable (fused core) */
+        break;
+
+    case TCTXT_EN0_SET:
+        xive->tctxt_regs[TCTXT_EN0 >> 3] |=3D val;
+        break;
+    case TCTXT_EN1_SET:
+        xive->tctxt_regs[TCTXT_EN1 >> 3] |=3D val;
+        break;
+    case TCTXT_EN0_RESET:
+        xive->tctxt_regs[TCTXT_EN0 >> 3] &=3D ~val;
+        break;
+    case TCTXT_EN1_RESET:
+        xive->tctxt_regs[TCTXT_EN1 >> 3] &=3D ~val;
+        break;
+
+    default:
+        xive2_error(xive, "TCTXT: invalid write @%"HWADDR_PRIx, offset);
+        return;
+    }
+
+    xive->pc_regs[reg] =3D val;
+}
+
+static const MemoryRegionOps pnv_xive2_ic_tctxt_ops =3D {
+    .read =3D pnv_xive2_ic_tctxt_read,
+    .write =3D pnv_xive2_ic_tctxt_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+/*
+ * Redirect XSCOM to MMIO handlers
+ */
+static uint64_t pnv_xive2_xscom_read(void *opaque, hwaddr offset,
+                                     unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint64_t val =3D -1;
+    uint32_t xscom_reg =3D offset >> 3;
+    uint32_t mmio_offset =3D (xscom_reg & 0xFF) << 3;
+
+    switch (xscom_reg) {
+    case 0x000 ... 0x0FF:
+        val =3D pnv_xive2_ic_cq_read(opaque, mmio_offset, size);
+        break;
+    case 0x100 ... 0x1FF:
+        val =3D pnv_xive2_ic_vc_read(opaque, mmio_offset, size);
+        break;
+    case 0x200 ... 0x2FF:
+        val =3D pnv_xive2_ic_pc_read(opaque, mmio_offset, size);
+        break;
+    case 0x300 ... 0x3FF:
+        val =3D pnv_xive2_ic_tctxt_read(opaque, mmio_offset, size);
+        break;
+    default:
+        xive2_error(xive, "XSCOM: invalid read @%"HWADDR_PRIx, offset);
+    }
+
+    return val;
+}
+
+static void pnv_xive2_xscom_write(void *opaque, hwaddr offset,
+                                  uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint32_t xscom_reg =3D offset >> 3;
+    uint32_t mmio_offset =3D (xscom_reg & 0xFF) << 3;
+
+    switch (xscom_reg) {
+    case 0x000 ... 0x0FF:
+        pnv_xive2_ic_cq_write(opaque, mmio_offset, val, size);
+        break;
+    case 0x100 ... 0x1FF:
+        pnv_xive2_ic_vc_write(opaque, mmio_offset, val, size);
+        break;
+    case 0x200 ... 0x2FF:
+        pnv_xive2_ic_pc_write(opaque, mmio_offset, val, size);
+        break;
+    case 0x300 ... 0x3FF:
+        pnv_xive2_ic_tctxt_write(opaque, mmio_offset, val, size);
+        break;
+    default:
+        xive2_error(xive, "XSCOM: invalid write @%"HWADDR_PRIx, offset);
+    }
+}
+
+static const MemoryRegionOps pnv_xive2_xscom_ops =3D {
+    .read =3D pnv_xive2_xscom_read,
+    .write =3D pnv_xive2_xscom_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+/*
+ * Notify port page. The layout is compatible between 4K and 64K pages :
+ *
+ * Page 1           Notify page (writes only)
+ *  0x000 - 0x7FF   IPI interrupt (NPU)
+ *  0x800 - 0xFFF   HW interrupt triggers (PSI, PHB)
+ */
+
+static void pnv_xive2_ic_hw_trigger(PnvXive2 *xive, hwaddr addr,
+                                    uint64_t val)
+{
+    uint8_t blk;
+    uint32_t idx;
+
+    if (val & XIVE_TRIGGER_END) {
+        xive2_error(xive, "IC: END trigger at @0x%"HWADDR_PRIx" data 0x%=
"PRIx64,
+                   addr, val);
+        return;
+    }
+
+    /*
+     * Forward the source event notification directly to the Router.
+     * The source interrupt number should already be correctly encoded
+     * with the chip block id by the sending device (PHB, PSI).
+     */
+    blk =3D XIVE_EAS_BLOCK(val);
+    idx =3D XIVE_EAS_INDEX(val);
+
+    xive2_router_notify(XIVE_NOTIFIER(xive), XIVE_EAS(blk, idx));
+}
+
+static void pnv_xive2_ic_notify_write(void *opaque, hwaddr offset,
+                                      uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    /* VC: IPI triggers */
+    switch (offset) {
+    case 0x000 ... 0x7FF:
+        /* TODO: check IPI notify sub-page routing */
+        pnv_xive2_ic_hw_trigger(opaque, offset, val);
+        break;
+
+    /* VC: HW triggers */
+    case 0x800 ... 0xFFF:
+        pnv_xive2_ic_hw_trigger(opaque, offset, val);
+        break;
+
+    default:
+        xive2_error(xive, "NOTIFY: invalid write @%"HWADDR_PRIx, offset)=
;
+    }
+}
+
+static uint64_t pnv_xive2_ic_notify_read(void *opaque, hwaddr offset,
+                                         unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+   /* loads are invalid */
+    xive2_error(xive, "NOTIFY: invalid read @%"HWADDR_PRIx, offset);
+    return -1;
+}
+
+static const MemoryRegionOps pnv_xive2_ic_notify_ops =3D {
+    .read =3D pnv_xive2_ic_notify_read,
+    .write =3D pnv_xive2_ic_notify_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+static uint64_t pnv_xive2_ic_lsi_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    xive2_error(xive, "LSI: invalid read @%"HWADDR_PRIx, offset);
+    return -1;
+}
+
+static void pnv_xive2_ic_lsi_write(void *opaque, hwaddr offset,
+                                   uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    xive2_error(xive, "LSI: invalid write @%"HWADDR_PRIx, offset);
+}
+
+static const MemoryRegionOps pnv_xive2_ic_lsi_ops =3D {
+    .read =3D pnv_xive2_ic_lsi_read,
+    .write =3D pnv_xive2_ic_lsi_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+/*
+ * Sync MMIO page (write only)
+ */
+#define PNV_XIVE2_SYNC_IPI      0x000
+#define PNV_XIVE2_SYNC_HW       0x080
+#define PNV_XIVE2_SYNC_NxC      0x100
+#define PNV_XIVE2_SYNC_INT      0x180
+#define PNV_XIVE2_SYNC_OS_ESC   0x200
+#define PNV_XIVE2_SYNC_POOL_ESC 0x280
+#define PNV_XIVE2_SYNC_HARD_ESC 0x300
+
+static uint64_t pnv_xive2_ic_sync_read(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    /* loads are invalid */
+    xive2_error(xive, "SYNC: invalid read @%"HWADDR_PRIx, offset);
+    return -1;
+}
+
+static void pnv_xive2_ic_sync_write(void *opaque, hwaddr offset,
+                                    uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    switch (offset) {
+    case PNV_XIVE2_SYNC_IPI:
+    case PNV_XIVE2_SYNC_HW:
+    case PNV_XIVE2_SYNC_NxC:
+    case PNV_XIVE2_SYNC_INT:
+    case PNV_XIVE2_SYNC_OS_ESC:
+    case PNV_XIVE2_SYNC_POOL_ESC:
+    case PNV_XIVE2_SYNC_HARD_ESC:
+        break;
+    default:
+        xive2_error(xive, "SYNC: invalid write @%"HWADDR_PRIx, offset);
+    }
+}
+
+static const MemoryRegionOps pnv_xive2_ic_sync_ops =3D {
+    .read =3D pnv_xive2_ic_sync_read,
+    .write =3D pnv_xive2_ic_sync_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+/*
+ * When the TM direct pages of the IC controller are accessed, the
+ * target HW thread is deduced from the page offset.
+ */
+static XiveTCTX *pnv_xive2_get_indirect_tctx(PnvXive2 *xive, uint32_t pi=
r)
+{
+    PnvChip *chip =3D xive->chip;
+    PowerPCCPU *cpu =3D NULL;
+
+    cpu =3D pnv_chip_find_cpu(chip, pir);
+    if (!cpu) {
+        xive2_error(xive, "IC: invalid PIR %x for indirect access", pir)=
;
+        return NULL;
+    }
+
+    if (!pnv_xive2_is_cpu_enabled(xive, cpu)) {
+        xive2_error(xive, "IC: CPU %x is not enabled", pir);
+    }
+
+    return XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+}
+
+static uint64_t pnv_xive2_ic_tm_indirect_read(void *opaque, hwaddr offse=
t,
+                                              unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint32_t pir =3D offset >> xive->ic_shift;
+    XiveTCTX *tctx =3D pnv_xive2_get_indirect_tctx(xive, pir);
+    uint64_t val =3D -1;
+
+    if (tctx) {
+        val =3D xive_tctx_tm_read(NULL, tctx, offset, size);
+    }
+
+    return val;
+}
+
+static void pnv_xive2_ic_tm_indirect_write(void *opaque, hwaddr offset,
+                                           uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+    uint32_t pir =3D offset >> xive->ic_shift;
+    XiveTCTX *tctx =3D pnv_xive2_get_indirect_tctx(xive, pir);
+
+    if (tctx) {
+        xive_tctx_tm_write(NULL, tctx, offset, val, size);
+    }
+}
+
+static const MemoryRegionOps pnv_xive2_ic_tm_indirect_ops =3D {
+    .read =3D pnv_xive2_ic_tm_indirect_read,
+    .write =3D pnv_xive2_ic_tm_indirect_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+/*
+ * TIMA ops
+ */
+
+static void pnv_xive2_tm_write(void *opaque, hwaddr offset,
+                               uint64_t value, unsigned size)
+{
+    PowerPCCPU *cpu =3D POWERPC_CPU(current_cpu);
+    PnvXive2 *xive =3D pnv_xive2_tm_get_xive(cpu);
+    XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+
+    /* Other TM ops are the same as XIVE1 */
+    xive_tctx_tm_write(XIVE_PRESENTER(xive), tctx, offset, value, size);
+}
+
+static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned =
size)
+{
+    PowerPCCPU *cpu =3D POWERPC_CPU(current_cpu);
+    PnvXive2 *xive =3D pnv_xive2_tm_get_xive(cpu);
+    XiveTCTX *tctx =3D XIVE_TCTX(pnv_cpu_state(cpu)->intc);
+
+    /* Other TM ops are the same as XIVE1 */
+    return xive_tctx_tm_read(XIVE_PRESENTER(xive), tctx, offset, size);
+}
+
+static const MemoryRegionOps pnv_xive2_tm_ops =3D {
+    .read =3D pnv_xive2_tm_read,
+    .write =3D pnv_xive2_tm_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 8,
+    },
+};
+
+static uint64_t pnv_xive2_nvc_read(void *opaque, hwaddr offset,
+                                   unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    xive2_error(xive, "NVC: invalid read @%"HWADDR_PRIx, offset);
+    return -1;
+}
+
+static void pnv_xive2_nvc_write(void *opaque, hwaddr offset,
+                                uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    xive2_error(xive, "NVC: invalid write @%"HWADDR_PRIx, offset);
+}
+
+static const MemoryRegionOps pnv_xive2_nvc_ops =3D {
+    .read =3D pnv_xive2_nvc_read,
+    .write =3D pnv_xive2_nvc_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+static uint64_t pnv_xive2_nvpg_read(void *opaque, hwaddr offset,
+                                    unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    xive2_error(xive, "NVPG: invalid read @%"HWADDR_PRIx, offset);
+    return -1;
+}
+
+static void pnv_xive2_nvpg_write(void *opaque, hwaddr offset,
+                                 uint64_t val, unsigned size)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(opaque);
+
+    xive2_error(xive, "NVPG: invalid write @%"HWADDR_PRIx, offset);
+}
+
+static const MemoryRegionOps pnv_xive2_nvpg_ops =3D {
+    .read =3D pnv_xive2_nvpg_read,
+    .write =3D pnv_xive2_nvpg_write,
+    .endianness =3D DEVICE_BIG_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+    .impl =3D {
+        .min_access_size =3D 8,
+        .max_access_size =3D 8,
+    },
+};
+
+/*
+ * POWER10 default capabilities: 0x2000120076f00000
+ */
+#define PNV_XIVE2_CAPABILITIES  0x2000120076f00000
+
+/*
+ * POWER10 default configuration: 0x0030000033000000
+ *
+ * 8bits thread id was dropped for P10
+ */
+#define PNV_XIVE2_CONFIGURATION 0x0030000033000000
+
+static void pnv_xive2_reset(void *dev)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(dev);
+    XiveSource *xsrc =3D &xive->ipi_source;
+    Xive2EndSource *end_xsrc =3D &xive->end_source;
+
+    xive->cq_regs[CQ_XIVE_CAP >> 3] =3D xive->capabilities;
+    xive->cq_regs[CQ_XIVE_CFG >> 3] =3D xive->config;
+
+    /* HW hardwires the #Topology of the chip in the block field */
+    xive->cq_regs[CQ_XIVE_CFG >> 3] |=3D
+        SETFIELD(CQ_XIVE_CFG_HYP_HARD_BLOCK_ID, 0ull, xive->chip->chip_i=
d);
+
+    /* Set default page size to 64k */
+    xive->ic_shift =3D xive->esb_shift =3D xive->end_shift =3D 16;
+    xive->nvc_shift =3D xive->nvpg_shift =3D xive->tm_shift =3D 16;
+
+    /* Clear source MMIOs */
+    if (memory_region_is_mapped(&xsrc->esb_mmio)) {
+        memory_region_del_subregion(&xive->esb_mmio, &xsrc->esb_mmio);
+    }
+
+    if (memory_region_is_mapped(&end_xsrc->esb_mmio)) {
+        memory_region_del_subregion(&xive->end_mmio, &end_xsrc->esb_mmio=
);
+    }
+}
+
+/*
+ *  Maximum number of IRQs and ENDs supported by HW. Will be tuned by
+ *  software.
+ */
+#define PNV_XIVE2_NR_IRQS (PNV10_XIVE2_ESB_SIZE / (1ull << XIVE_ESB_64K_=
2PAGE))
+#define PNV_XIVE2_NR_ENDS (PNV10_XIVE2_END_SIZE / (1ull << XIVE_ESB_64K_=
2PAGE))
+
+static void pnv_xive2_realize(DeviceState *dev, Error **errp)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(dev);
+    PnvXive2Class *pxc =3D PNV_XIVE2_GET_CLASS(dev);
+    XiveSource *xsrc =3D &xive->ipi_source;
+    Xive2EndSource *end_xsrc =3D &xive->end_source;
+    Error *local_err =3D NULL;
+    int i;
+
+    pxc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    assert(xive->chip);
+
+    /*
+     * The XiveSource and Xive2EndSource objects are realized with the
+     * maximum allowed HW configuration. The ESB MMIO regions will be
+     * resized dynamically when the controller is configured by the FW
+     * to limit accesses to resources not provisioned.
+     */
+    object_property_set_int(OBJECT(xsrc), "flags", XIVE_SRC_STORE_EOI,
+                            &error_fatal);
+    object_property_set_int(OBJECT(xsrc), "nr-irqs", PNV_XIVE2_NR_IRQS,
+                            &error_fatal);
+    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive),
+                             &error_fatal);
+    qdev_realize(DEVICE(xsrc), NULL, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    object_property_set_int(OBJECT(end_xsrc), "nr-ends", PNV_XIVE2_NR_EN=
DS,
+                            &error_fatal);
+    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
+                             &error_abort);
+    qdev_realize(DEVICE(end_xsrc), NULL, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* XSCOM region, used for initial configuration of the BARs */
+    memory_region_init_io(&xive->xscom_regs, OBJECT(dev),
+                          &pnv_xive2_xscom_ops, xive, "xscom-xive",
+                          PNV10_XSCOM_XIVE2_SIZE << 3);
+
+    /* Interrupt controller MMIO regions */
+    xive->ic_shift =3D 16;
+    memory_region_init(&xive->ic_mmio, OBJECT(dev), "xive-ic",
+                       PNV10_XIVE2_IC_SIZE);
+
+    for (i =3D 0; i < ARRAY_SIZE(xive->ic_mmios); i++) {
+        memory_region_init_io(&xive->ic_mmios[i], OBJECT(dev),
+                         pnv_xive2_ic_regions[i].ops, xive,
+                         pnv_xive2_ic_regions[i].name,
+                         pnv_xive2_ic_regions[i].pgsize << xive->ic_shif=
t);
+    }
+
+    /*
+     * VC MMIO regions.
+     */
+    xive->esb_shift =3D 16;
+    xive->end_shift =3D 16;
+    memory_region_init(&xive->esb_mmio, OBJECT(xive), "xive-esb",
+                       PNV10_XIVE2_ESB_SIZE);
+    memory_region_init(&xive->end_mmio, OBJECT(xive), "xive-end",
+                       PNV10_XIVE2_END_SIZE);
+
+    /* Presenter Controller MMIO region (not modeled) */
+    xive->nvc_shift =3D 16;
+    xive->nvpg_shift =3D 16;
+    memory_region_init_io(&xive->nvc_mmio, OBJECT(dev),
+                          &pnv_xive2_nvc_ops, xive,
+                          "xive-nvc", PNV10_XIVE2_NVC_SIZE);
+
+    memory_region_init_io(&xive->nvpg_mmio, OBJECT(dev),
+                          &pnv_xive2_nvpg_ops, xive,
+                          "xive-nvpg", PNV10_XIVE2_NVPG_SIZE);
+
+    /* Thread Interrupt Management Area (Direct) */
+    xive->tm_shift =3D 16;
+    memory_region_init_io(&xive->tm_mmio, OBJECT(dev), &pnv_xive2_tm_ops=
,
+                          xive, "xive-tima", PNV10_XIVE2_TM_SIZE);
+
+    qemu_register_reset(pnv_xive2_reset, dev);
+}
+
+static Property pnv_xive2_properties[] =3D {
+    DEFINE_PROP_UINT64("ic-bar", PnvXive2, ic_base, 0),
+    DEFINE_PROP_UINT64("esb-bar", PnvXive2, esb_base, 0),
+    DEFINE_PROP_UINT64("end-bar", PnvXive2, end_base, 0),
+    DEFINE_PROP_UINT64("nvc-bar", PnvXive2, nvc_base, 0),
+    DEFINE_PROP_UINT64("nvpg-bar", PnvXive2, nvpg_base, 0),
+    DEFINE_PROP_UINT64("tm-bar", PnvXive2, tm_base, 0),
+    DEFINE_PROP_UINT64("capabilities", PnvXive2, capabilities,
+                       PNV_XIVE2_CAPABILITIES),
+    DEFINE_PROP_UINT64("config", PnvXive2, config,
+                       PNV_XIVE2_CONFIGURATION),
+    DEFINE_PROP_LINK("chip", PnvXive2, chip, TYPE_PNV_CHIP, PnvChip *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pnv_xive2_instance_init(Object *obj)
+{
+    PnvXive2 *xive =3D PNV_XIVE2(obj);
+
+    object_initialize_child(obj, "ipi_source", &xive->ipi_source,
+                            TYPE_XIVE_SOURCE);
+    object_initialize_child(obj, "end_source", &xive->end_source,
+                            TYPE_XIVE2_END_SOURCE);
+}
+
+static int pnv_xive2_dt_xscom(PnvXScomInterface *dev, void *fdt,
+                              int xscom_offset)
+{
+    const char compat_p10[] =3D "ibm,power10-xive-x";
+    char *name;
+    int offset;
+    uint32_t reg[] =3D {
+        cpu_to_be32(PNV10_XSCOM_XIVE2_BASE),
+        cpu_to_be32(PNV10_XSCOM_XIVE2_SIZE)
+    };
+
+    name =3D g_strdup_printf("xive@%x", PNV10_XSCOM_XIVE2_BASE);
+    offset =3D fdt_add_subnode(fdt, xscom_offset, name);
+    _FDT(offset);
+    g_free(name);
+
+    _FDT((fdt_setprop(fdt, offset, "reg", reg, sizeof(reg))));
+    _FDT(fdt_setprop(fdt, offset, "compatible", compat_p10,
+                     sizeof(compat_p10)));
+    return 0;
+}
+
+static void pnv_xive2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    PnvXScomInterfaceClass *xdc =3D PNV_XSCOM_INTERFACE_CLASS(klass);
+    Xive2RouterClass *xrc =3D XIVE2_ROUTER_CLASS(klass);
+    XiveNotifierClass *xnc =3D XIVE_NOTIFIER_CLASS(klass);
+    XivePresenterClass *xpc =3D XIVE_PRESENTER_CLASS(klass);
+    PnvXive2Class *pxc =3D PNV_XIVE2_CLASS(klass);
+
+    xdc->dt_xscom  =3D pnv_xive2_dt_xscom;
+
+    dc->desc       =3D "PowerNV XIVE2 Interrupt Controller (POWER10)";
+    device_class_set_parent_realize(dc, pnv_xive2_realize,
+                                    &pxc->parent_realize);
+    device_class_set_props(dc, pnv_xive2_properties);
+
+    xrc->get_eas   =3D pnv_xive2_get_eas;
+    xrc->get_end   =3D pnv_xive2_get_end;
+    xrc->write_end =3D pnv_xive2_write_end;
+    xrc->get_nvp   =3D pnv_xive2_get_nvp;
+    xrc->write_nvp =3D pnv_xive2_write_nvp;
+    xrc->get_block_id =3D pnv_xive2_get_block_id;
+
+    xnc->notify    =3D pnv_xive2_notify;
+
+    xpc->match_nvt  =3D pnv_xive2_match_nvt;
+};
+
+static const TypeInfo pnv_xive2_info =3D {
+    .name          =3D TYPE_PNV_XIVE2,
+    .parent        =3D TYPE_XIVE2_ROUTER,
+    .instance_init =3D pnv_xive2_instance_init,
+    .instance_size =3D sizeof(PnvXive2),
+    .class_init    =3D pnv_xive2_class_init,
+    .class_size    =3D sizeof(PnvXive2Class),
+    .interfaces    =3D (InterfaceInfo[]) {
+        { TYPE_PNV_XSCOM_INTERFACE },
+        { }
+    }
+};
+
+static void pnv_xive2_register_types(void)
+{
+    type_register_static(&pnv_xive2_info);
+}
+
+type_init(pnv_xive2_register_types)
+
+static void xive2_nvp_pic_print_info(Xive2Nvp *nvp, uint32_t nvp_idx,
+                                     Monitor *mon)
+{
+    uint8_t  eq_blk =3D xive_get_field32(NVP2_W5_VP_END_BLOCK, nvp->w5);
+    uint32_t eq_idx =3D xive_get_field32(NVP2_W5_VP_END_INDEX, nvp->w5);
+
+    if (!xive2_nvp_is_valid(nvp)) {
+        return;
+    }
+
+    monitor_printf(mon, "  %08x end:%02x/%04x IPB:%02x\n",
+                   nvp_idx, eq_blk, eq_idx,
+                   xive_get_field32(NVP2_W2_IPB, nvp->w2));
+}
+
+/*
+ * If the table is direct, we can compute the number of PQ entries
+ * provisioned by FW.
+ */
+static uint32_t pnv_xive2_nr_esbs(PnvXive2 *xive)
+{
+    uint8_t blk =3D pnv_xive2_block_id(xive);
+    uint64_t vsd =3D xive->vsds[VST_ESB][blk];
+    uint64_t vst_tsize =3D 1ull << (GETFIELD(VSD_TSIZE, vsd) + 12);
+
+    return VSD_INDIRECT & vsd ? 0 : vst_tsize * SBE_PER_BYTE;
+}
+
+/*
+ * Compute the number of entries per indirect subpage.
+ */
+static uint64_t pnv_xive2_vst_per_subpage(PnvXive2 *xive, uint32_t type)
+{
+    uint8_t blk =3D pnv_xive2_block_id(xive);
+    uint64_t vsd =3D xive->vsds[type][blk];
+    const XiveVstInfo *info =3D &vst_infos[type];
+    uint64_t vsd_addr;
+    uint32_t page_shift;
+
+    /* For direct tables, fake a valid value */
+    if (!(VSD_INDIRECT & vsd)) {
+        return 1;
+    }
+
+    /* Get the page size of the indirect table. */
+    vsd_addr =3D vsd & VSD_ADDRESS_MASK;
+    ldq_be_dma(&address_space_memory, vsd_addr, &vsd, MEMTXATTRS_UNSPECI=
FIED);
+
+    if (!(vsd & VSD_ADDRESS_MASK)) {
+#ifdef XIVE2_DEBUG
+        xive2_error(xive, "VST: invalid %s entry!?", info->name);
+#endif
+        return 0;
+    }
+
+    page_shift =3D GETFIELD(VSD_TSIZE, vsd) + 12;
+
+    if (!pnv_xive2_vst_page_size_allowed(page_shift)) {
+        xive2_error(xive, "VST: invalid %s page shift %d", info->name,
+                   page_shift);
+        return 0;
+    }
+
+    return (1ull << page_shift) / info->size;
+}
+
+void pnv_xive2_pic_print_info(PnvXive2 *xive, Monitor *mon)
+{
+    Xive2Router *xrtr =3D XIVE2_ROUTER(xive);
+    uint8_t blk =3D pnv_xive2_block_id(xive);
+    uint8_t chip_id =3D xive->chip->chip_id;
+    uint32_t srcno0 =3D XIVE_EAS(blk, 0);
+    uint32_t nr_esbs =3D pnv_xive2_nr_esbs(xive);
+    Xive2Eas eas;
+    Xive2End end;
+    Xive2Nvp nvp;
+    int i;
+    uint64_t xive_nvp_per_subpage;
+
+    monitor_printf(mon, "XIVE[%x] Source %08x .. %08x\n", blk, srcno0,
+                   srcno0 + nr_esbs - 1);
+    xive_source_pic_print_info(&xive->ipi_source, srcno0, mon);
+
+    monitor_printf(mon, "XIVE[%x] EAT %08x .. %08x\n", blk, srcno0,
+                   srcno0 + nr_esbs - 1);
+    for (i =3D 0; i < nr_esbs; i++) {
+        if (xive2_router_get_eas(xrtr, blk, i, &eas)) {
+            break;
+        }
+        if (!xive2_eas_is_masked(&eas)) {
+            xive2_eas_pic_print_info(&eas, i, mon);
+        }
+    }
+
+    monitor_printf(mon, "XIVE[%x] #%d END Escalation EAT\n", chip_id, bl=
k);
+    i =3D 0;
+    while (!xive2_router_get_end(xrtr, blk, i, &end)) {
+        xive2_end_eas_pic_print_info(&end, i++, mon);
+    }
+
+    monitor_printf(mon, "XIVE[%x] #%d ENDT\n", chip_id, blk);
+    i =3D 0;
+    while (!xive2_router_get_end(xrtr, blk, i, &end)) {
+        xive2_end_pic_print_info(&end, i++, mon);
+    }
+
+    monitor_printf(mon, "XIVE[%x] #%d NVPT %08x .. %08x\n", chip_id, blk=
,
+                   0, XIVE2_NVP_COUNT - 1);
+    xive_nvp_per_subpage =3D pnv_xive2_vst_per_subpage(xive, VST_NVP);
+    for (i =3D 0; i < XIVE2_NVP_COUNT; i +=3D xive_nvp_per_subpage) {
+        while (!xive2_router_get_nvp(xrtr, blk, i, &nvp)) {
+            xive2_nvp_pic_print_info(&nvp, i++, mon);
+        }
+    }
+}
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 441bf958cadb..f486fdfb5c72 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -725,6 +725,7 @@ static void pnv_chip_power10_pic_print_info(PnvChip *=
chip, Monitor *mon)
 {
     Pnv10Chip *chip10 =3D PNV10_CHIP(chip);
=20
+    pnv_xive2_pic_print_info(&chip10->xive, mon);
     pnv_psi_pic_print_info(&chip10->psi, mon);
 }
=20
@@ -1047,27 +1048,45 @@ static void pnv_chip_power9_intc_print_info(PnvCh=
ip *chip, PowerPCCPU *cpu,
 static void pnv_chip_power10_intc_create(PnvChip *chip, PowerPCCPU *cpu,
                                         Error **errp)
 {
+    Pnv10Chip *chip10 =3D PNV10_CHIP(chip);
+    Error *local_err =3D NULL;
+    Object *obj;
     PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
=20
-    /* Will be defined when the interrupt controller is */
-    pnv_cpu->intc =3D NULL;
+    /*
+     * The core creates its interrupt presenter but the XIVE2 interrupt
+     * controller object is initialized afterwards. Hopefully, it's
+     * only used at runtime.
+     */
+    obj =3D xive_tctx_create(OBJECT(cpu), XIVE_PRESENTER(&chip10->xive),
+                           &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    pnv_cpu->intc =3D obj;
 }
=20
 static void pnv_chip_power10_intc_reset(PnvChip *chip, PowerPCCPU *cpu)
 {
-    ;
+    PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
+
+    xive_tctx_reset(XIVE_TCTX(pnv_cpu->intc));
 }
=20
 static void pnv_chip_power10_intc_destroy(PnvChip *chip, PowerPCCPU *cpu=
)
 {
     PnvCPUState *pnv_cpu =3D pnv_cpu_state(cpu);
=20
+    xive_tctx_destroy(XIVE_TCTX(pnv_cpu->intc));
     pnv_cpu->intc =3D NULL;
 }
=20
 static void pnv_chip_power10_intc_print_info(PnvChip *chip, PowerPCCPU *=
cpu,
                                              Monitor *mon)
 {
+    xive_tctx_pic_print_info(XIVE_TCTX(pnv_cpu_state(cpu)->intc), mon);
 }
=20
 /*
@@ -1558,6 +1577,9 @@ static void pnv_chip_power10_instance_init(Object *=
obj)
 {
     Pnv10Chip *chip10 =3D PNV10_CHIP(obj);
=20
+    object_initialize_child(obj, "xive", &chip10->xive, TYPE_PNV_XIVE2);
+    object_property_add_alias(obj, "xive-fabric", OBJECT(&chip10->xive),
+                              "xive-fabric");
     object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
     object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
 }
@@ -1583,6 +1605,27 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
         return;
     }
=20
+    /* XIVE2 interrupt controller (POWER10) */
+    object_property_set_int(OBJECT(&chip10->xive), "ic-bar",
+                            PNV10_XIVE2_IC_BASE(chip), &error_fatal);
+    object_property_set_int(OBJECT(&chip10->xive), "esb-bar",
+                            PNV10_XIVE2_ESB_BASE(chip), &error_fatal);
+    object_property_set_int(OBJECT(&chip10->xive), "end-bar",
+                            PNV10_XIVE2_END_BASE(chip), &error_fatal);
+    object_property_set_int(OBJECT(&chip10->xive), "nvpg-bar",
+                            PNV10_XIVE2_NVPG_BASE(chip), &error_fatal);
+    object_property_set_int(OBJECT(&chip10->xive), "nvc-bar",
+                            PNV10_XIVE2_NVC_BASE(chip), &error_fatal);
+    object_property_set_int(OBJECT(&chip10->xive), "tm-bar",
+                            PNV10_XIVE2_TM_BASE(chip), &error_fatal);
+    object_property_set_link(OBJECT(&chip10->xive), "chip", OBJECT(chip)=
,
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&chip10->xive), errp)) {
+        return;
+    }
+    pnv_xscom_add_subregion(chip, PNV10_XSCOM_XIVE2_BASE,
+                            &chip10->xive.xscom_regs);
+
     /* Processor Service Interface (PSI) Host Bridge */
     object_property_set_int(OBJECT(&chip10->psi), "bar",
                             PNV10_PSIHB_BASE(chip), &error_fatal);
@@ -1927,6 +1970,35 @@ static int pnv_match_nvt(XiveFabric *xfb, uint8_t =
format,
     return total_count;
 }
=20
+static int pnv10_xive_match_nvt(XiveFabric *xfb, uint8_t format,
+                                uint8_t nvt_blk, uint32_t nvt_idx,
+                                bool cam_ignore, uint8_t priority,
+                                uint32_t logic_serv,
+                                XiveTCTXMatch *match)
+{
+    PnvMachineState *pnv =3D PNV_MACHINE(xfb);
+    int total_count =3D 0;
+    int i;
+
+    for (i =3D 0; i < pnv->num_chips; i++) {
+        Pnv10Chip *chip10 =3D PNV10_CHIP(pnv->chips[i]);
+        XivePresenter *xptr =3D XIVE_PRESENTER(&chip10->xive);
+        XivePresenterClass *xpc =3D XIVE_PRESENTER_GET_CLASS(xptr);
+        int count;
+
+        count =3D xpc->match_nvt(xptr, format, nvt_blk, nvt_idx, cam_ign=
ore,
+                               priority, logic_serv, match);
+
+        if (count < 0) {
+            return count;
+        }
+
+        total_count +=3D count;
+    }
+
+    return total_count;
+}
+
 static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
@@ -1971,6 +2043,7 @@ static void pnv_machine_power10_class_init(ObjectCl=
ass *oc, void *data)
 {
     MachineClass *mc =3D MACHINE_CLASS(oc);
     PnvMachineClass *pmc =3D PNV_MACHINE_CLASS(oc);
+    XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
     static const char compat[] =3D "qemu,powernv10\0ibm,powernv";
=20
     mc->desc =3D "IBM PowerNV (Non-Virtualized) POWER10";
@@ -1979,6 +2052,8 @@ static void pnv_machine_power10_class_init(ObjectCl=
ass *oc, void *data)
     pmc->compat =3D compat;
     pmc->compat_size =3D sizeof(compat);
     pmc->dt_power_mgt =3D pnv_dt_power_mgt;
+
+    xfc->match_nvt =3D pnv10_xive_match_nvt;
 }
=20
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
@@ -2090,6 +2165,10 @@ static const TypeInfo types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("powernv10"),
         .parent        =3D TYPE_PNV_MACHINE,
         .class_init    =3D pnv_machine_power10_class_init,
+        .interfaces =3D (InterfaceInfo[]) {
+            { TYPE_XIVE_FABRIC },
+            { },
+        },
     },
     {
         .name          =3D MACHINE_TYPE_NAME("powernv9"),
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 128cebe0a32b..d953197413f0 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -42,7 +42,7 @@ specific_ss.add(when: 'CONFIG_OMAP', if_true: files('om=
ap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
 		if_true: files('openpic_kvm.c'))
-specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pn=
v_xive.c'))
+specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pn=
v_xive.c', 'pnv_xive2.c'))
 specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
 specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bc=
m2836_control.c'))
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
--=20
2.34.1


