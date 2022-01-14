Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFB48ED6B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:52:31 +0100 (CET)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OsQ-0006qL-4l
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:52:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OpO-0004zH-KK
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:49:24 -0500
Received: from mail-dm6nam10on2057.outbound.protection.outlook.com
 ([40.107.93.57]:52769 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OpM-0002A3-En
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:49:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oENxMD56lGnM1JmI6bqUEVZmF0lLYmlKt5G+v2ZAkVsNC2k2Vj/W7OJeSkKU/JUqcXS6F069xAuN130MznW7uS9q9B8Kj3O9vfMITSoCgcsqpdcQzsrgZjhiBb9W5pTz2GivIXkkL8cgU+09UG0xBegglL1jgvr3+CD6vFkErCvyO8Furjv7TAiwT2fgQkPd1+KThl+zaRRJJQBD3NE6a9r1PQAWv+KvND7R08OIkLnMD90n3EHVb5C3nbr12Huos+H0GEVjnETCb15EkMBjmuX9cn1cUi/mSqwyclz49JtCN0RdC0iNSK+cuCsofv/nC5LjaJHduSnkaQEq5fN0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48HOoMNI5fsNk4M4T5VWFd4RFI9r2JtZtl4ZrL7pBYk=;
 b=PApNl7+5n5WtzeKRXXBRhJ4GnQUbiF65YZtYeHcX9KwTw0HB5hbhhUWwl20jQzn4JkFHAi/leku16z+HQ2ZrWamCZAKlnZ+Q6+nqwlo/4lNZvToI+Q1kLRSDECdI6rOM7cun9DEihfvlrpURI6EnpYPZoIEKNhP3lLxjC3VbVNcbvDQqSkcOs+DCDSPMr+r2HW1x/loH21I3zj2dSqmoeNsCevGFcRQfXj9NjyJ+/Q1weIFErDSUYzF5shrbYjiH1sDJ4633QIPUzK8Ndyl+feRGTopxEFeTu+Y1tpp+x1b15/56g/cbXusqwx3lXQiujtk211npdOVG1r6ouyXFww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48HOoMNI5fsNk4M4T5VWFd4RFI9r2JtZtl4ZrL7pBYk=;
 b=ZxEAxSxXP82qFIfoX9TZRCA03ffu+tud2pSKAZzBCoRdo/sxFEZZ35U8lqFFhzwQuXWaMjAW4Rpe6+hg0wqFWqlLR79vkZwqqzv+q5PF9xElNIx5PeHR8Gmex5cK7J3ngtLf4ayETnGQ880mSSqlJc/hU97qd9UDOc98ANONDh0=
Received: from SN4PR0401CA0009.namprd04.prod.outlook.com
 (2603:10b6:803:21::19) by BN7PR02MB5281.namprd02.prod.outlook.com
 (2603:10b6:408:2b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 14 Jan
 2022 15:28:46 +0000
Received: from SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:21:cafe::1b) by SN4PR0401CA0009.outlook.office365.com
 (2603:10b6:803:21::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Fri, 14 Jan 2022 15:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0049.mail.protection.outlook.com (10.97.5.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:28:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:28:44 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:28:44 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVQ-0004L4-6p; Fri, 14 Jan 2022 07:28:44 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 00/12] Xilinx Versal's PMC SLCR and OSPI support
Date: Fri, 14 Jan 2022 15:28:29 +0000
Message-ID: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d32a9869-9195-480a-8c71-08d9d7728dfc
X-MS-TrafficTypeDiagnostic: BN7PR02MB5281:EE_
X-Microsoft-Antispam-PRVS: <BN7PR02MB5281768978C1AF5469FC4DAFAD549@BN7PR02MB5281.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +o96iqTfFl4whjKBvl8umPQnMV6IfTnHE1M4VRULeQYJ+08JmogqSIg+XpTrLSGz80ESDwuLrDmrgnwLIwhcdPPdEsS5KkHg1PM0xTHgibrYSRO+/Fi/k3/wQInlxj4/MMreBSkcsSOjVOkGz6FC78UbtgilXcjs4bMQenjZJufSD8Iz7gLNzYcd175cHEjYnXBSRT56O9OQW/ucT2JQdJvu/mi5tg6IWU6WC/h0tqpd5+RcVzHFEVfKKKlFuw32/OGDCv1BI6eafAyBkFDn99gbGNbe7teCort+galieKaPjeFYuZAqbS6IOLTqXpcLq3H2zGegXcC37DhwJcSbA6X6tkMbuMdmkSWy1ly9MQ1zJRpFbfm9/It93O2liiYMzrhteMTYMPYQ+kZr+yQ6WgDVvaICNCUPW8wfxlLGkCn/nd1ukUD9dxKDLFBiAdzMPtA5IOYDvIdtYVOXgQpbW9JFjUXz3WPtoY+/A1RJl/f4L09CHwReTqUXbaJK56wwdpcb+nd/lCsMF3+wIbeyjySWOZiEh+0YNI2RUdQmz7nTsWUYeAjArl0/T39edHiZegl5EpcXhos0FsteX1I+8gyR00ueB5GgUtswfL7XDBuSTEQK+Kxx6tJ9o36f/P0OA04MfC+6vtRITOvJ1cqTe7n1KIKoDur4cwQpouxnv382AdvE6086MrDRsE63hwNgmv5mUHp5KuN2nT1rs7vbreQO/ufxGlyC1j9pUlsZlzs=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8936002)(1076003)(2616005)(508600001)(70586007)(70206006)(7636003)(9786002)(6916009)(5660300002)(7696005)(8676002)(83380400001)(47076005)(82310400004)(44832011)(54906003)(6666004)(4326008)(356005)(36860700001)(316002)(186003)(336012)(36756003)(26005)(2906002)(426003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:28:45.7080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32a9869-9195-480a-8c71-08d9d7728dfc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5281
Received-SPF: pass client-ip=40.107.93.57; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
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


Francisco Iglesias (12):
  hw/misc: Add a model of Versal's PMC SLCR
  hw/arm/xlnx-versal: 'Or' the interrupts from the BBRAM and RTC models
  hw/arm/xlnx-versal: Connect Versal's PMC SLCR
  include/hw/dma/xlnx_csu_dma: Add in missing includes in the header
  hw/dma: Add the DMA control interface
  hw/dma/xlnx_csu_dma: Implement the DMA control interface
  hw/ssi: Add a model of Xilinx Versal's OSPI flash memory controller
  hw/arm/xlnx-versal: Connect the OSPI flash memory controller model
  hw/block/m25p80: Add support for Micron Xccela flash mt35xu01g
  hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes to the OSPI
  MAINTAINERS: Add an entry for Xilinx Versal OSPI
  docs/devel: Add documentation for the DMA control interface

 MAINTAINERS                                |    7 +
 docs/devel/dma-ctrl-if.rst                 |  243 ++++
 docs/devel/index.rst                       |    1 +
 hw/arm/xlnx-versal-virt.c                  |   25 +-
 hw/arm/xlnx-versal.c                       |  190 ++-
 hw/block/m25p80.c                          |    2 +
 hw/dma/dma-ctrl-if.c                       |   30 +
 hw/dma/meson.build                         |    1 +
 hw/dma/xlnx_csu_dma.c                      |   20 +
 hw/misc/meson.build                        |    5 +-
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1446 ++++++++++++++++++++++
 hw/ssi/meson.build                         |    1 +
 hw/ssi/xlnx-versal-ospi.c                  | 1856 ++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h               |   30 +-
 include/hw/dma/dma-ctrl-if.h               |   58 +
 include/hw/dma/xlnx_csu_dma.h              |    5 +
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   78 ++
 include/hw/ssi/xlnx-versal-ospi.h          |  111 ++
 18 files changed, 4103 insertions(+), 6 deletions(-)
 create mode 100644 docs/devel/dma-ctrl-if.rst
 create mode 100644 hw/dma/dma-ctrl-if.c
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c
 create mode 100644 include/hw/dma/dma-ctrl-if.h
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h

-- 
2.11.0


