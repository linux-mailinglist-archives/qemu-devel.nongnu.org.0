Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E652D97A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:55:31 +0200 (CEST)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriUs-0002l0-4K
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriF8-0007Va-7V; Thu, 19 May 2022 11:39:18 -0400
Received: from mail-bn8nam11on2061b.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::61b]:53985
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriEv-0008RZ-2x; Thu, 19 May 2022 11:39:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaZ+sPVvJOz9oHfTyc0HToDIrHhds+dyVRmdxgWAcjz3C0p88pymviCx6KVkYL1y27sUG86d68rnXtl/3Gtlx/4IaDrPACnAUxcAJNDySrw07EhUujSh5PEJn8lAeC2n6ezgIhBhc+EJZOAsdQKGCxps5dwkYVzhI7d+27RkWHqvulNGlyE5G7e4L8m5bSaw5eS9W3Gpf9tdm7bu5TFYxQZd/3YtikXSIGHlotrLfMkqRBbmxGxyYvrAjYoBZqtSpE2QO15bFXhQob1q/zPaVTL/9xh/UgHm2n1uJMnwNl7FR9jRb0PVkU77DupRmng2RlK6T7/7FuOkOSY5QJFOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwPgua6rpusJBnryNs13nfUxKGV6LTUy9IiUcZb/TeA=;
 b=DmwuycgSpHfvpXEjRB+IlRvk0QkcRaM+xb4JIwvbSOMfbOcTAwYwb8spSfUvkBpY8kWDTdWRgk72y5wtzYSBB/qXpZ2nGN/eVh4OTkqXNVrFi7fuKwGj2cwho00YHUDVZH61EfT+gbKFoGLXsT1Gazz9p3Ni6cUISAPWGvFeEuSc0DCPPeQw3RcdtFLxCV+bAjIeAV9aEE+5EOEbechbe1vL0BYaQySmTj1vBu6Rv+Fcr3Do+LtJfvEKbM6xY2oIH/THSJDH/iDewAkGXgAj9BZFG8fnW19hB8kjgE8XN4UGGssF1U+2mXibO6GY2H2Owsbzs/Ch9GtTXQG8+nhPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwPgua6rpusJBnryNs13nfUxKGV6LTUy9IiUcZb/TeA=;
 b=gcHpkxS7kuPLzlydAdtuvwDMH3zS4uVq31qNgWd1Fdot2OwdmBVVU1cnHTHk8z85ehVoxDa7x91fNO5Kzyqt68hosUvA4CU26eTxWs8hKY1craIrbccGTWqVscruUokWh54J+dlsL7Vcw6WpkFT6syv3nxtZbH9Ll3tZkeiQ5CU=
Received: from BN0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:408:e6::17)
 by MN2PR02MB6749.namprd02.prod.outlook.com (2603:10b6:208:1d1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 15:38:57 +0000
Received: from BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::41) by BN0PR03CA0012.outlook.office365.com
 (2603:10b6:408:e6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Thu, 19 May 2022 15:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.80.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.80.198 as permitted sender)
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT020.mail.protection.outlook.com (10.13.2.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 15:38:57 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 19 May 2022 16:38:55 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 19 May 2022 16:38:55 +0100
Received: from [172.21.132.221] (port=36706 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fkonrad@amd.com>)
 id 1nriEp-0007q5-Ff; Thu, 19 May 2022 16:38:55 +0100
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>
Subject: [PATCH v2 0/4] xlnx-zcu102: fix the display port.
Date: Thu, 19 May 2022 16:38:25 +0100
Message-ID: <20220519153829.356889-1-fkonrad@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3012955b-7b73-4c39-d1be-08da39adb009
X-MS-TrafficTypeDiagnostic: MN2PR02MB6749:EE_
X-Microsoft-Antispam-PRVS: <MN2PR02MB6749BC3AF401E840A90DF3CAA6D09@MN2PR02MB6749.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E3zyEB9R1tSMJReTPl+rImS0D3akJGdb7v1KvIXBucTyiVkYuT9GjuYJ3aPLFPtknLhYjumsOfF3gtxIyINEiA7Axk49mDQOM+pdXhMqdKZaA0q191XEt2bjW8B/eBXfJN9SVEjskJa62CRJO2EYvHFjdmItCf/PaAaxMhDx/p5amv/AOhXSe0J4cyjMpOSW3dOhlQocxRXq39OxSQMSsK1VbXEiiyLtELrJ0HoqpPmxWtgTcbRkJp1dNHMSpU3j0onVT8u/HHs6PVAJucHTlmBJ8jt3CwkEsAqO4PV7aR7NT9RvAs7kKfhqkFsF2DactYcgaQV4boxXKtd0YHMRGXxUij5QyqaXsL7hcaHFeLa4+aIKhXnEQqrZCHeifzZL+4lPXw3Y6jZlGVgfYUALI4X7/NwL4aJdn9SOcaRh6iyDNngsPwOREjNkvDyY7PJ1I4W6WEnfpjpwDWQ8TL91ZH9qRYAmX0hLTPvTTwaI3Uark+XhK8OH+nsJuYer0mpmzzAtLzGVNEwaZzAY4f2zSYHU+y31ieiBSyragOIPjRgHCJZfMZsx2fmt6atuQbC3I3LS9s/7vJvrlLNqeNAisdySzMoheTyLO6ZFcWBVNWwabSXMDrLGGi3MjdC1INPM4ZrEsP21NWgQTb6RGLnpQ/n8ZDUpuE+4MPXZ5p1ZZdaba4Pa9XoiVLxqM4svyg8OeLeopWA9j+UPQz8INpMIsg==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(4326008)(86362001)(54906003)(26005)(82310400005)(83380400001)(316002)(336012)(6666004)(6916009)(70206006)(40460700003)(70586007)(1076003)(47076005)(7636003)(356005)(2616005)(35950700001)(2906002)(508600001)(9786002)(8936002)(36756003)(8676002)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 15:38:57.0186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3012955b-7b73-4c39-d1be-08da39adb009
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6749
Received-SPF: pass client-ip=2a01:111:f400:7eae::61b;
 envelope-from=bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Frederic Konrad <fkonrad@amd.com>
From:  Frederic Konrad via <qemu-devel@nongnu.org>

Hi,

This patch set fixes some issues with the DisplayPort for the ZCU102:

The first patch fixes the wrong register size and thus the risk of register
overflow.

The three other one add a vblank interrupt required by the linux driver:
  - When using the VNC graphic backend and leaving it unconnected, in the best
    case the gfx_update callback is called once every 3000ms which is
    insufficient for the driver.  This is fixed by providing a VBLANK interrupt
    from a ptimer.
  - This requirement revealed two issues with the IRQ numbers and the
    interrupt disable logic fixed by the two last patches.

Tested by booting Petalinux with the framebuffer enabled.

Best Regards,
Fred

v1 -> v2:
  * Better use of the ptimer API by using a correct POLICY as suggested
    by Peter Maydell (Patch 2).
  * Rebased on 78ac2eeb.

Frederic Konrad (2):
  xlnx_dp: fix the wrong register size
  xlnx-zynqmp: fix the irq mapping for the display port and its dma

Sai Pavan Boddu (2):
  xlnx_dp: Introduce a vblank signal
  xlnx_dp: Fix the interrupt disable logic

 hw/arm/xlnx-zynqmp.c         |  4 ++--
 hw/display/xlnx_dp.c         | 46 +++++++++++++++++++++++++++---------
 include/hw/display/xlnx_dp.h | 12 ++++++++--
 3 files changed, 47 insertions(+), 15 deletions(-)

-- 
2.25.1


