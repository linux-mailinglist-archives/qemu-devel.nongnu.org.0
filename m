Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C664962F4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:37:38 +0100 (CET)
Received: from localhost ([::1]:53700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwuv-0004AV-IA
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:37:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwqF-0002QM-Gz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:32:47 -0500
Received: from mail-mw2nam08on2055.outbound.protection.outlook.com
 ([40.107.101.55]:18100 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwqB-0000zk-3x
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:32:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jg7Kr20RuJCL8Ei5FvdN6PA27wWhyCGiVTvN7MmAEEvJyrHV248yqfdVCqUDQ+d51wXZ2xcKAapbpa8o2xiuF+bOVgrRDMGV5QUj114FAcMMx6hKtSd709k/dG7rJ4oxZf3jLTxxLUBqCPOWRBTE1WKXIk3zEaG0zJ0eah/PcJm462AUQaWaP28STbg2bk5FDlFfcLt//qyTqVkyQDlkDIgmBzAVEkfid2u+VcK2lPxscn9zhtR7uP3J2stsbahWJE8NqXtVGyFtA6m81e06aTGVqKlZ8th6UHIWwRBrE2AOpnsdjtaY+n2XOvFxv9lKKpL/a7ahSsWi8TjJi7stwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FdI8D5vsl1Dfb1er+qRhkN7hwjlM/sOcsKJZ5vQMB8=;
 b=Z7+BFslj0lZALWrwhCxqpf8AFSV6WK1+b5MzkxchcPlOU3GBvRoR6Grcry+EXYdr56tZeYgAFv12K+qM+frbAW339m7AsVY3RDBY5u2e3KeCf3HLsAVFSWEog9vVfvj57QSrcZq/XhhS2030HNklhKPBlxKi5MUbl4s5g+8d5J50EkAj3S509zlv+vbrFP8n2hymbAKo+N6H+KNE83SM6O1pFP/VqUTUeUqOueW3AEVKpdbO+lx26zNVHYaOAH/ViQW/HtuRCQ8M2tDYzEEYZb1E3Sy7XakG9Wa3RELILXQOB+rZdMfIRSw5ZTgFH4j0+hJyC/wAItLSId7EvpeIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FdI8D5vsl1Dfb1er+qRhkN7hwjlM/sOcsKJZ5vQMB8=;
 b=fMw3qzL052IMMC6+KVjNUyiqDFAAUYpg0hFLKYj1dgHUBQDLffs69jEFoAI8dbgAZwSMTofA1kk8wU6IglnYQIxTBVCW6nOIVjgFDB6JlaANhXLUh/AevSN1iRaNvSl6E/umCb4PqtB9GqxWyzNrZR33p9dgMeaMFzP9ARb9LFw=
Received: from DM6PR04CA0028.namprd04.prod.outlook.com (2603:10b6:5:334::33)
 by DM8PR02MB8104.namprd02.prod.outlook.com (2603:10b6:8:1d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.10; Fri, 21 Jan 2022 16:11:52 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::b6) by DM6PR04CA0028.outlook.office365.com
 (2603:10b6:5:334::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Fri, 21 Jan 2022 16:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:11:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:11:44 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:11:44 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwVr-0002nH-SJ; Fri, 21 Jan 2022 08:11:44 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 00/10] Xilinx Versal's PMC SLCR and OSPI support
Date: Fri, 21 Jan 2022 16:11:31 +0000
Message-ID: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5f947af-410a-4448-148a-08d9dcf8bc53
X-MS-TrafficTypeDiagnostic: DM8PR02MB8104:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB810481B17EEAABD71207F9DBAD5B9@DM8PR02MB8104.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uW45Yld1Xz5ZJBJC2U5jK4AmVq9NNU54yXFPSn0oN9APvRLSzNP7L3nsoouxdUVUqoYs8SfINMog6I2zHbICAxwDkar3dhwVFKo4mUwI3aiPukEqZ6hoXbYjMnFlIoNXXhXQSSl03j9sIGM1Sf3GTCyhFZOOB6W9vQGTnYbEW8i+VP/EKqwZHho0UubyngJYswFAcLibhme2NO4zgxfEypkl7LXidmC0WElCLYNBRGsDEIB/oRhDk9YOGQgX5gWM6zu3vbvT/eLP8jp5180DmMsRCmmbkXE3q/MI5mwNfJxRfwnmabMK2qffhRhonbvUIKokozra9XWDnbLEmQ8Ji7kkLj2IGSFERaS0Q2N0AOiFp2ZjX1gGEvSXL8m0AMO7oMbQO9kEseMiJc+ilQiD/994XseupsOMvvlIuqNk0OtOkpZk522gZh7GDJh9aNTwcrkWF7VcK5xSj8AJPzZYezg1/hnJEm3fpi1wQKXLFW66m99m5pyNnDw7KH2Re+Ic+AKwSF1P9nTnKO6dFETEAj28eBxsXBb+GyNV3/pUTrU9ed9laDnf+NPAievW3xCVMlJzQI4D09WNMelsKWP6ILfCTBlr1OracxcN1GkQ1oJc77jbLQ7YjVq5A0fwG6q+DF/AGYX3/b3/vokvetGaJRXOdfl2nbPAi/AAzLb0ClpeG9OJj9jBdShNR4EST7ltpu/UxUTt6nBi2ohlhnQ6x4r4CpBAQGoff5VTcwXSXHc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(47076005)(8676002)(336012)(26005)(7696005)(83380400001)(508600001)(316002)(54906003)(36756003)(6916009)(1076003)(36860700001)(6666004)(82310400004)(7636003)(4326008)(2616005)(9786002)(426003)(5660300002)(70206006)(356005)(186003)(44832011)(2906002)(70586007)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:11:51.8415 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f947af-410a-4448-148a-08d9dcf8bc53
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8104
Received-SPF: pass client-ip=40.107.101.55; envelope-from=figlesia@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series attempts to add support for Xilinx Versal's PMC SLCR
(system-level control registers) and OSPI flash memory controller to
Xilinx Versal virt machine.

The series start with adding a model of Versal's PMC SLCR and connecting
the model to the Versal virt machine. The series then adds a couple of
headers into the xlnx_csu_dma.h needed for building and reusing it later
with the OSPI. The series thereafter introduces a DMA control interface
and implements the interface in the xlnx_csu_dma for being able to reuse
and control the DMA with the OSPI controller. Thereafter a model of
Versal's OSPI controller is added and connected to the Versal virt
machine. The series then ends with adding initial support for the Micron
Xccelera mt35xu01g flash and flashes of this type are connected to the
OSPI in the Versal virt machine.

Best regards,
Francisco Iglesias

Changelog:
v6 -> v7:
  * Remove the DMA control interface
  * Add a class read method to the Xilinx CSU DMA and start read transfers from
    OSPI model through this method (replacing the DMA control interface)

v5 -> v6:
  * Corrected unimplemented log messages (patch: "hw/arm/xlnx-versal: Connect
    Versal's PMC SLCR")
  * Modify dma_ctrl_if_read to return a MemTxResult carrying the result of the
    read operation
  * Updated (and corrected) documentation

v4 -> v5
  * Use named GPIOs for "sd-emmc-sel", "qspi-ospi-mux-sel", "ospi-mux-sel"
    in the PMC SLCR model
  * Add a QEMU interface comment for the PMC SLCR model.
  * Switch to use OBJECT_DECLARE_SIMPLE_TYPE in both "xlnx-versal-ospi.h"
    and "xlnx-versal-pmc-iou-slcr.h"
  * Create a new patch 'or'ing the interrupts from the BBRAM and RTC model
  * 'Or' the interrupt from the PMC SLCR with the BBRAM and RTC interrupt
    inside 'xlnx-versal.c'
  * Connect other not yet implemented PMC SLCR GPIOs to unimplemented messages
  * Reworked and simplified the DMA control interface by removing the
    notifier and refill mechanism
  * Corrected various typos and grammatical errors in the DMA control
    interface documentation and comments
  * Updated the DMA control interface documentation to describe the new
    simplified implementation
  * Use ldl_le_p and ldq_le_p in the OSPI model (and remove the OSPIRdData
    union). Also assert in the locations that we are not overruning the
    new bytes buffer.
  * Correct the single_cs function in the OSPI model (both comment and output)
  * Correct a typo in a comment inside ospi_do_indirect_write
    (s/boundery/boundary/)
  * Remove an unecesary assert in the OSPI model
  * Add a QEMU interface comment for the OSPI model.
  * Rename the OSPI irq in 'xlnx-versal.c' to include 'orgate' in the name for
    clarifying

v3 -> v4
  * Correct indentation (patch: "hw/arm/xlnx-versal: Connect Versal's PMC
    SLCR")

  * Rename to include "If" in names related to the DMA control interface
  * In dma-ctrl-if.h:
    - Don't include qemu-common.h
    - Use DECLARE_CLASS_CHECKERS dma-ctrl.h
  * Add a docs/devel documentation patch for the DMA control interface
  * Improve git messages on the dma-ctrl-if patches


v2 -> v3
  * Correct and also include hw/sysbus.h and hw/register.h into
    xlnx_csu_dma.h (patch: "include/hw/dma/xlnx_csu_dma: Add in missing
    includes in the header")

v1 -> v2
  * Correct the reset in the PMC SLCR model
  * Create a sub structure for the OSPI in the Versal structure (in patch:
    "hw/arm/xlnx-versal: Connect the OSPI flash memory controller model")
  * Change to use 'drive_get' instead of 'drive_get_next' (in patch:
    "hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes to the OSPI")
  * Add a maintainers patch and list myself as maintainer for the OSPI
    controller


Francisco Iglesias (10):
  hw/misc: Add a model of Versal's PMC SLCR
  hw/arm/xlnx-versal: 'Or' the interrupts from the BBRAM and RTC models
  hw/arm/xlnx-versal: Connect Versal's PMC SLCR
  include/hw/dma/xlnx_csu_dma: Add in missing includes in the header
  hw/dma/xlnx_csu_dma: Support starting a read transfer through a class
    method
  hw/ssi: Add a model of Xilinx Versal's OSPI flash memory controller
  hw/arm/xlnx-versal: Connect the OSPI flash memory controller model
  hw/block/m25p80: Add support for Micron Xccela flash mt35xu01g
  hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes to the OSPI
  MAINTAINERS: Add an entry for Xilinx Versal OSPI

 include/hw/arm/xlnx-versal.h               |   30 +-
 include/hw/dma/xlnx_csu_dma.h              |   24 +-
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   78 ++
 include/hw/ssi/xlnx-versal-ospi.h          |  111 ++
 hw/arm/xlnx-versal-virt.c                  |   25 +-
 hw/arm/xlnx-versal.c                       |  190 ++-
 hw/block/m25p80.c                          |    2 +
 hw/dma/xlnx_csu_dma.c                      |   17 +
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1446 ++++++++++++++++++++++
 hw/ssi/xlnx-versal-ospi.c                  | 1853 ++++++++++++++++++++++++++++
 MAINTAINERS                                |    6 +
 hw/misc/meson.build                        |    5 +-
 hw/ssi/meson.build                         |    1 +
 13 files changed, 3780 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c

-- 
2.11.0


