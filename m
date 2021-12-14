Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041AC474130
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:11:52 +0100 (CET)
Received: from localhost ([::1]:57420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5ip-0006p4-52
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bN-0007Jh-Q6
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:09 -0500
Received: from mail-bn8nam12on2045.outbound.protection.outlook.com
 ([40.107.237.45]:23265 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bL-0006z2-Fu
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSmCg5mhm4bGP5X7f1SGkimMRIIcUJgVZUMvBhki7lvrl6Vne9vQz2S0MZ+1NIWUjMMMR1/n+GbEtro1vhx1mL+4jXK1yXXbVr11xMrHV064OapCwaWIi6+yZB/oKRStG4h/CkFuKurbrYK/Kq6olDZTVPgDM2t8ofnomXqWt8dmt14XTtA/BruWW76L5wIl0cVa70AGhHTK6Iz8lOeTxeizB+pnvDpk5c+VGJjPZFD7Nma+nj7s4Sgza4w21WHhNlAxp+qOEZFVMOtmZqpoVJb6jsmX+CWwhjTbuMz2MLqI9+nOUF2Qi7alTFBKA9T72wimfnGQTib92WI8DdavNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s06rkp40HrD2ti1UbzaS2sG7flE2jh89EHJ9QPnT9ho=;
 b=cKLHyAY32Pgf8XaO7XMtWIpylvP8h3BWd0Fph0Fi96qZhBfz6OgWRke2H0ROsVBn5uJ+b2lSZjJpvE9UMlymIzOIOJBS2x7l7Ve7SQ/GCNbRs7euoOLmF3LPGBlL5SKrUyCVTXKoQBdahDbYiAe0CjNzSEff/k/HpRA2MGdS2T6o50QEXMDiH7opZoN9jKLE10jIkl+FbNQq83kyvPXYFJ4t3S9W6Tlm10kSlDpAjFjaOgAELG/NlwynK1/eAzGjchQvf7/nWxWyzs8l1JXq+Bkpox+ngwObtNKITV9N0/joF5s4jITZye7qdb3N1DpotWp1CQfzEgljZwcZt2gmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s06rkp40HrD2ti1UbzaS2sG7flE2jh89EHJ9QPnT9ho=;
 b=oq2pCMKbgPTxG9PU1t7Ph8iV2Efh6CuMfXfIKe5pCITDIqc5T+69tuT7Alyl+7MRdv3uipFZMmUDIIbnxpAed3QAkkb6QzqCSgNUOV36lPXCbDr6aqHjLMFOSi+uvrea9wHKmdW3m8pmQ3zgjSfFtUsn/QUdYA3pVsJRvMAVwaY=
Received: from DS7PR03CA0151.namprd03.prod.outlook.com (2603:10b6:5:3b2::6) by
 MWHPR02MB3199.namprd02.prod.outlook.com (2603:10b6:301:64::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Tue, 14 Dec 2021 11:04:03 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::73) by DS7PR03CA0151.outlook.office365.com
 (2603:10b6:5:3b2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:02 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:02 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bA-000F5K-Kq; Tue, 14 Dec 2021 03:03:57 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 00/12] Xilinx Versal's PMC SLCR and OSPI support
Date: Tue, 14 Dec 2021 11:03:42 +0000
Message-ID: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98ec26e2-036d-4d45-e889-08d9bef1705c
X-MS-TrafficTypeDiagnostic: MWHPR02MB3199:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB3199C1A34ECD71812C631BA9AD759@MWHPR02MB3199.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bq3oLW1VpdGQU5XfJxTHInGDI6ctazgmPi0qL+vlWdPxy5SFHrvwTzI6TRfUDd41MzK+yt06FUrGhBL+Mt9wjr15YusHiEqANIBQvb0zReLsqXLIAIcNDtEOR9/dwzao8FOzhwJsil1sRZ5+9ELfOz7Yx3AXVL6VcaqQ0CDiCTojRPNjgMlmDnjh76u46LrNXos5ODdKzUG7/m8b2XDL3MAQeypLPQB5KWjsg7aQ5rSaKf4lZXZQcfnEyzCaMCu0ZzyofQEV7BQ2rTQTOY34irN8f0qKFEi48e3LnY1GS8OtH6Rv/wA5RfyLMcwkabJMYZA+3i92Wfc6Hg/QaN4CLemcVGKBk9f2kwj1tnAyTpyTd9Z3SLtlCtN2AD/QhMh8gGY1kaIZSn7SO7FGkUO3f1tjrAiEBlpnfN/Dc1IVARAlpfECBsJ6dydIm2ffRjZktLb3fpbvnqIVgHY6PRImdKHz+gL5qUqEa4y1+7TEFdL3rWHPCfOX59GpHkScoRXPTtKMabrGlhFzWJ6ZM+tUramOrKuzqsfmQ1PywZ4QEUyP7Z2mqnqo1WsVwdY2pS3OB0lT5jAupOTBk5hrfSp5WtOrxneb7ECwdgVmrrngWB6Jrc24enfQgtdaRSgcaE1a3Zba960sVlIycZIryvs7wlR73bpwSodC7U9wuUnorybbxW9aAKNxDLn/nC9rjTnRwRuEBM8y7Hj5vNNqpl4fWaN9yiwW/8nnk+Wo+njjlek=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(36756003)(7696005)(8676002)(83380400001)(2906002)(356005)(316002)(54906003)(7636003)(4326008)(508600001)(2616005)(1076003)(6916009)(336012)(44832011)(70206006)(9786002)(6666004)(426003)(70586007)(5660300002)(26005)(36860700001)(186003)(8936002)(47076005)(82310400004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:03.0231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ec26e2-036d-4d45-e889-08d9bef1705c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3199
Received-SPF: pass client-ip=40.107.237.45; envelope-from=figlesia@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
 docs/devel/dma-ctrl-if.rst                 |  234 ++++
 docs/devel/index.rst                       |    1 +
 hw/arm/xlnx-versal-virt.c                  |   25 +-
 hw/arm/xlnx-versal.c                       |  190 ++-
 hw/block/m25p80.c                          |    2 +
 hw/dma/dma-ctrl-if.c                       |   30 +
 hw/dma/meson.build                         |    1 +
 hw/dma/xlnx_csu_dma.c                      |   18 +
 hw/misc/meson.build                        |    5 +-
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1446 ++++++++++++++++++++++
 hw/ssi/meson.build                         |    1 +
 hw/ssi/xlnx-versal-ospi.c                  | 1855 ++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h               |   30 +-
 include/hw/dma/dma-ctrl-if.h               |   51 +
 include/hw/dma/xlnx_csu_dma.h              |    5 +
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   78 ++
 include/hw/ssi/xlnx-versal-ospi.h          |  111 ++
 18 files changed, 4084 insertions(+), 6 deletions(-)
 create mode 100644 docs/devel/dma-ctrl-if.rst
 create mode 100644 hw/dma/dma-ctrl-if.c
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c
 create mode 100644 include/hw/dma/dma-ctrl-if.h
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h

-- 
2.11.0


