Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97CC465270
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 17:04:11 +0100 (CET)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msS5a-0001An-ED
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 11:04:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msS2r-0007f8-Hc
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 11:01:21 -0500
Received: from mail-dm6nam12on2069.outbound.protection.outlook.com
 ([40.107.243.69]:51040 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msS2o-0007mM-0x
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 11:01:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUIxCxbThnKTggblFDwhhgsZ4iHQPW6vN+HEdvZ8k5t02WnYjCRqPnyBKCZTEhj4IKIwW0WbR2dBcRyhWDIwpW5pBNLIzDPHv/RDULIBUwXlj9jKis++SCRAB3hN8ldm3PF5yFgVSwnw9Ef2ozuirtO6vC5OPjl+2ZQp1JD5uolC46AygIe54VaMlM1KuwzJAIXLIGLBzJhTRwoaNMDxI23BSlOGlcAER9EmMWDf+HrhtO8KI46Zpqow1BIoRSbfyB/NoXHZ91YANYnePjczorKNPOKCdtwssZHn6XDrsKeR8Jvbfev2zWTAAZnxRW+sWk11TYT+MnGYj2G+1QP2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBVDYfQOluj1pRojSLXg4TOWsICfTLqMd6+8HXLZA44=;
 b=e7QXi3/UcRk94zAsQT9gtBYsju48VPYri7Njx0xl8s5hH7lcoPGw8cANUJ4RM7hh+IVG1+uFBgOln+JlqIp6CU1X+Nr3ER0SSxtK14DH67B5V5157z7WByiT5lyu0hZNk7CKpMROm6Qvmy2iWfz/itu+n0upNLDKPCyPmssJdOhYt9raXltAWhIr2lGIMpOtQ0Ase+yB1B1aDZ6TuVoQLOa307oY08Bamrlvq5siUEJjgRk/WT+0bhaPJIuaZD8u4+GFaG/Y1Teuzn7iCJHLIcY7QxoKPBOJDRZIwgaDFMs/ijWFAXq6OfrWpoaUcc7vEUgVH6WBx67qpO7sXGCisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBVDYfQOluj1pRojSLXg4TOWsICfTLqMd6+8HXLZA44=;
 b=G/MMIO7JQtu/MRILVBPQ+GlDlDAYM1J4Wu9QLrxfaWzgc38zvPi2jr9SjTvi3r53OhCkmSDzsYqOrRTeaflw54F4FTjx9qVmEH5g84hf6+RjWlvAwp4ygHj2IRe7wuTo263Y3EhvXJDbiRlzNJn/LrHGfI7KtwMasxdm0x2AoLo=
Received: from DM5PR07CA0041.namprd07.prod.outlook.com (2603:10b6:3:16::27) by
 DM5PR0201MB3399.namprd02.prod.outlook.com (2603:10b6:4:76::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23; Wed, 1 Dec 2021 15:40:27 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:16:cafe::1b) by DM5PR07CA0041.outlook.office365.com
 (2603:10b6:3:16::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:26 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:26 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRic-0002FY-4F; Wed, 01 Dec 2021 07:40:26 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 00/11] Xilinx Versal's PMC SLCR and OSPI support
Date: Wed, 1 Dec 2021 15:40:12 +0000
Message-ID: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57a352da-31d6-4b59-3f46-08d9b4e0e5d3
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3399:
X-Microsoft-Antispam-PRVS: <DM5PR0201MB3399F56E7FAEF7D83CDA3333AD689@DM5PR0201MB3399.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYDvdyVMffDfTlQY21YmD7GNSu3MiPgShbjRfeEJ/F99pm2ykJqIx4OkUWF3fzKc1Beh/dRrEguSusKId+pShHtcYkoDc6B6R8s2Zy77EAinNUj0EfzP0kPgFLjherZZ06tzhj7n0l1UhiZfyHjQYjtAjTpVkpkmAQCVC5d8dScRP8U09YkL9osDW5iDm0/MEYYyQWnudfV8ibX+F5Q4E9JSIwv4QCUAlAn4YuXxVkC9q3w+5TF2MvYiW6DcUzonJtLuperjsvdvS+E9S+ucGCwCAagXGOmIAyqkmyqgiymL3Ljk3hLjLxpQa9DQMTdP6r6DvsL+PR7YR3eiEdK1ZuRPCnbsLieGj7HyujJC6unmwRdsYQkYRNf82YkpEar342OHKiRePDK9OtFusxOOUaVf5WErP5yucadz1JMBL8+fWMjWhL/X3huvhmWXwR34Ztp3a3Ei3KH4qKH6DC2ZQ0ho52VcFhnvylxtcr6Jm34fv51DiUOBgSbaToKexE7TZCNe7xv/1dtIKtCacqPP3s6+QyVHfCeZXiKAY/7nNWy2f/7Vxmd2jO3sMDahfZSUfGtvKONJpq5pd8jWHVGBEZhmmegu+v/KfI9ROe1q9uH7VJyGiy5br7rqdZIM4a93u8ymhLUrNsgYQb6VPZ+OJFxPAQbrS6cqjn/Z+2KCGGlj86/ERSv7+fxB1GXRH046aA+MvZAv5uE+XAsCG+RzhJWOWXrSPmC5UFn3lT7Hf94=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(2906002)(54906003)(5660300002)(316002)(26005)(508600001)(36860700001)(8676002)(70586007)(1076003)(336012)(6666004)(426003)(8936002)(82310400004)(70206006)(4326008)(9786002)(186003)(47076005)(356005)(7636003)(36756003)(44832011)(6916009)(83380400001)(2616005)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:27.0199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a352da-31d6-4b59-3f46-08d9b4e0e5d3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3399
Received-SPF: pass client-ip=40.107.243.69; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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


Francisco Iglesias (11):
  hw/misc: Add a model of Versal's PMC SLCR
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
 docs/devel/dma-ctrl-if.rst                 |  320 +++++
 docs/devel/index.rst                       |    1 +
 hw/arm/xlnx-versal-virt.c                  |   23 +
 hw/arm/xlnx-versal.c                       |  105 ++
 hw/block/m25p80.c                          |    2 +
 hw/dma/dma-ctrl-if.c                       |   31 +
 hw/dma/meson.build                         |    1 +
 hw/dma/xlnx_csu_dma.c                      |   32 +
 hw/misc/meson.build                        |    5 +-
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1445 +++++++++++++++++++++
 hw/ssi/meson.build                         |    1 +
 hw/ssi/xlnx-versal-ospi.c                  | 1892 ++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h               |   26 +
 include/hw/dma/dma-ctrl-if.h               |   72 ++
 include/hw/dma/xlnx_csu_dma.h              |    9 +
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   51 +
 include/hw/ssi/xlnx-versal-ospi.h          |   86 ++
 18 files changed, 4108 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/dma-ctrl-if.rst
 create mode 100644 hw/dma/dma-ctrl-if.c
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c
 create mode 100644 hw/ssi/xlnx-versal-ospi.c
 create mode 100644 include/hw/dma/dma-ctrl-if.h
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 include/hw/ssi/xlnx-versal-ospi.h

-- 
2.11.0


