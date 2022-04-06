Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBBA4F67D3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:51:26 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9oT-00008N-AE
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gf-0000Mb-Lm; Wed, 06 Apr 2022 13:43:22 -0400
Received: from mail-sn1anam02on20608.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::608]:16835
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gb-0004Rq-Gc; Wed, 06 Apr 2022 13:43:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEt8P2QR65FiEjMyF3f7rLios8hnl1AS4TR+8XrF2wTHn4mF2GbkclngTZN5E1GacCDpI8FBlCK3kXS4FMCrNWMbQUHgsDr3AvzMP7UIAwO0oEyzyrLPtd2YWfz/HxU0lbqyQAfCh/oSpYdgGGv58VC3C0sbaBkcBIRy1Kz0yu584rvl1lttj9d95N2QOEtb554fh3+b6LFAYTFJhT/WUs5EqXq+7OngI9UwjxjVg/dyvxKuT+xziqMKiyAfGTnjh28aRQiSBR33y583bYmuAqoOBgydgGz9hch2za/Jt/v/OK/C4vXzzVdddzDS+JgxACXfOnUdJVa1sRBCoU25cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrfLQTaK4+BXlzEkgKLFLfMMGe/RocMgsGj5K/q/jUo=;
 b=GHKqhQYshvjDxIvxqMOYfL7Kwl5rOuX7fNcO5XCjhz6XrkZiwHeGFWFempLZ0iWZM/i7ozHfArsA/at17shg29TFGiLgfDV1bBdSZkdZBQB7D0uAmsic+XfNDkV2V9WY5VgKbteAUZaQcThEJJ54rvFte0dB1LYNf/wNL/pUA+14/PYES69GyDL6xPvMViUWP/U1MnloXKaTQ5+ROK9bSmMRlOulzc8rP8g7EK4DwllJIHZdJYrzGAWVedAwVScrUIBiT1LpntyPYrNmmc/gpHRd5g42E56cHJhUbBC7HIbgQ947iV6qY4RlQJU8tC4iah+TQuHe7goWYDuUvcII+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrfLQTaK4+BXlzEkgKLFLfMMGe/RocMgsGj5K/q/jUo=;
 b=kEnJw2twc/qX8544A6hzsV5e0Cme7P8qb61cIKO09G7joR6NNeOBE93lJq5hQkt/bYfO4QlRahPyLJpe3/ppLvrMy/DsGdqRYjDaFgkUN0GgWGGxbEXkPisbjk0MTN3xvYhIY+dh4Je8v9Qy8++HUweXwNIsCbXh9aAkyscKxTY=
Received: from BN8PR12CA0026.namprd12.prod.outlook.com (2603:10b6:408:60::39)
 by SJ0PR02MB8545.namprd02.prod.outlook.com (2603:10b6:a03:3fb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:43:05 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::56) by BN8PR12CA0026.outlook.office365.com
 (2603:10b6:408:60::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 17:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Wed, 6 Apr 2022 17:43:05 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Apr 2022 18:43:04 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Apr 2022 18:43:04 +0100
Received: from [172.21.132.222] (port=46099 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nc9gN-0001Cq-N2; Wed, 06 Apr 2022 18:43:04 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/4] hw/arm: versal: Add Cortex-R5s and CRL
Date: Wed, 6 Apr 2022 18:42:59 +0100
Message-ID: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4be140de-a893-4b6a-0db5-08da17f4e7c0
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8545:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB854593F0E74512007024E278ABE79@SJ0PR02MB8545.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: scp2QtTuFU06TsGXXdkEx3V7vtI9WIvdE9XV1+ygxV8ivdyR00TzQCN1eofF6dzq8/Gwyps+TCyL7e+QEs5p9tWRSKgniscKsk4Eoce3VRDofOWUSZKRFt17XUvMdWE0SRQXlVmhu6RLjs0nKTfFcriIc6s8K55SkzlGy3QMGd5tkGRoZp7grHBsNC4PoPlitikl9Po89rIr2ds2AUzUWFyUcMZ1j28q06I7pCTDVr6IKQwJus78QngAXq6TLxRrhFjv4aXKzkhcSi9EemCfiCXkepRueZqYTtNIlHiVyHtHSUYkAZgdp4Ze0APhUMKl3q4SlE4A8xU8gyHWlk8uzUoju3iPXODhJzdOnOsbk9hV1QRGgtLsI5kQrnQemU9RxaSUhQTlA6dgIxSqCzRktZWmvTp8izBsCg2blWbIPkh0Ys39FLOqMufn/IJpTbX4AnHPS+vHb25zy0n43QY8aZpSD7kISBzyBgPK5UCcqdmkeXXYDtLaNIx/z5D0vTfSbRyr6h9PllQOqCV4LNvZTqLULX9L+6xcFtb9l16I3xJ5HTaw5MDky8f2TWCYOoe94owClKRcl29XF37F8d7BfcYY022GRHmGp/rDg1l/CAdRYH1ArvyJ3g2wztJNEp64+rX5dMZfHf5zgilI2BHzi2Uqilw0BLcLvtpekRWOxe2538QqR1s9JAKTqR9XxWix
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36860700001)(54906003)(6916009)(26005)(316002)(8676002)(2616005)(9786002)(1076003)(356005)(83380400001)(2906002)(70206006)(4326008)(47076005)(186003)(70586007)(8936002)(82310400005)(36756003)(508600001)(7636003)(6666004)(426003)(5660300002)(4744005)(40460700003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 17:43:05.2366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be140de-a893-4b6a-0db5-08da17f4e7c0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8545
Received-SPF: pass client-ip=2a01:111:f400:7ea9::608;
 envelope-from=edgari@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 fkonrad@xilinx.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This adds the Versal Cortex-R5s in the Real-Time Processing Unit
(RPU) subsystem.

A model of the Clock/Reset Low-power domain (CRL) is also added
allowing runtime release of the Cortex-R5s. The RPU subsystem
is largely missing but has enough to run simple bare-metal R5
apps.

Cheers,
Edgar

Edgar E. Iglesias (4):
  hw/arm: versal: Create an APU CPU Cluster
  hw/arm: versal: Add the Cortex-R5Fs
  hw/misc: Add a model of the Xilinx Versal CRL
  hw/arm: versal: Connect the CRL

 hw/arm/xlnx-versal-virt.c         |   6 +-
 hw/arm/xlnx-versal.c              |  99 ++++++-
 hw/misc/meson.build               |   1 +
 hw/misc/xlnx-versal-crl.c         | 421 ++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h      |  16 ++
 include/hw/misc/xlnx-versal-crl.h | 235 +++++++++++++++++
 6 files changed, 772 insertions(+), 6 deletions(-)
 create mode 100644 hw/misc/xlnx-versal-crl.c
 create mode 100644 include/hw/misc/xlnx-versal-crl.h

-- 
2.25.1


