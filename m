Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D925E2B54C7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 00:13:33 +0100 (CET)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kengi-0007RC-SQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 18:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneV-0005wp-LO; Mon, 16 Nov 2020 18:11:15 -0500
Received: from mail-dm6nam11on2083.outbound.protection.outlook.com
 ([40.107.223.83]:24441 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1keneS-0003x7-6s; Mon, 16 Nov 2020 18:11:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XS2PKTr/D/NoCGbxc2awqrxjO1uwL0b1eB9UIdUgI9Lx5d07PqOODXfccWzfvgfxBPr7RcuvrLR++ad9B/G71THU0udZJqFUeIve4eGpPsaNNzeeadz0llQn/jwvqkosDwKLRiU+e+XFB+rczZ9UR+lbBOBsTPW7DFmQN5BDzolsvT7Ny5fmuhOpZw6bibAFEbc87MpC4q7b3ffyiW/ETi2bFILT11jUBDBpkWhKQFoaNCxu+6wbypoyd/UG773i4aocFwddKZqtaTqB7ueX2aYqFf65bEPrQRar2SUzt4xafiH9gj5+izXnGvSrUtkGt2rw3Z+Xo1lUg4KEi39WQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmGw24mey98EVD29QVHkLwGkDmwy6TrrfDnUFlk1POA=;
 b=jKgj+2c8SSgua5Vvbu8dvDnRLAFD6OaWhFYGmrR/Eoo+w+Qh3/6DGlWZvllxMKOgJ7vKo7msatXLjseYvx5oHORF6oA2ccLXPBWtcuBAvAfGRMSGYEevCjQuSmhswsrbIxx4MXZPcy1Y9ga8pnrW5jUIK1pGXnRorQv4cuWgs5ROjSRXR3Vhs4ORHHMHp0YmzxVzaDX95B4tEFUhCvZCDoiDg0uzg729+pWlDbEFAus/ckV5mNr2gM4CryT65gQAKPDpXs+BJ1HKCDf9PZG14zs+hsr2Ld6IykVdyr/S7uwqOmKmLVU///xWomZl8dxxjGJOVS3EHFUbSlNU3xyDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmGw24mey98EVD29QVHkLwGkDmwy6TrrfDnUFlk1POA=;
 b=dQQgTgTcMeVldAeeo5nVLYzEkv5F7rA/r7Nqzj2zaO02XQ861PPZlB1EslFawyIfBh1pIALw+8M4HyffhaVBD8klhfUIa4cK5RVuMrDGiaIEVdJCi1GmVxenrsRhvXrs73+p7utUZ7oq3jDFGqXB34ID546ItyYMOKEFmpbb0sw=
Received: from MN2PR13CA0032.namprd13.prod.outlook.com (2603:10b6:208:160::45)
 by DM6PR02MB6010.namprd02.prod.outlook.com (2603:10b6:5:157::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 16 Nov
 2020 23:11:08 +0000
Received: from BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:160:cafe::1c) by MN2PR13CA0032.outlook.office365.com
 (2603:10b6:208:160::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Mon, 16 Nov 2020 23:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT050.mail.protection.outlook.com (10.152.77.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 23:11:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 16 Nov 2020 15:11:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 16 Nov 2020 15:11:04 -0800
Received: from [172.19.2.32] (port=55506 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1keneK-0007S0-Hj; Mon, 16 Nov 2020 15:11:04 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 0/4] hw/block/m25p80: Numonyx: Fix dummy cycles and check
 for SPI mode on cmds
Date: Mon, 16 Nov 2020 15:11:00 -0800
Message-ID: <1605568264-26376-1-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1990db90-f04d-4a9a-816d-08d88a84e5ef
X-MS-TrafficTypeDiagnostic: DM6PR02MB6010:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6010DD37933BFB1A298052FCD0E30@DM6PR02MB6010.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACHvGaZn9Y3XGuZi9WUQ3qP+nqXxWtCKi3JBkmvo3HM5y+F11Rh0OzTDlW5HJ8DIJLKBJ+0hV4c6PfD4PX2y/3sFtmU4Kx1LGkCDp8kCXMShISLewed/nVeg7aMdQpZu8wuSLziEMPXfj3OzEHxajDIePhlCbpiIqYkYe9BQa/YuYAfr5OKGEYll0npI62ZRKE9fW4rFyvC7+MvVnmVuDaN23dOfuapSPbhCKO1z5SfcauXiLc1xB4QpvkzXk3InSrGO8rmFF54mzW4l/kC2C9jMCdQtaKJdRWr1g0IWc/Fle0xwvkqH65a3JDmc8fxS9DD7fmMT6iAa7wGO1Y0oFJVAFWsxG08ZLNKL+S+YDUosx68QzXroaqGg//4eChvslzH9wi+WbY4dU+kCPtQ0IILddCxEPYZljvmwWvc8s/0=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966005)(82310400003)(186003)(2616005)(6666004)(47076004)(356005)(4326008)(426003)(336012)(54906003)(82740400003)(26005)(316002)(478600001)(7696005)(9786002)(8936002)(36756003)(86362001)(70206006)(70586007)(8676002)(5660300002)(44832011)(7636003)(2906002)(6916009)(83380400001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 23:11:06.9510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1990db90-f04d-4a9a-816d-08d88a84e5ef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6010
Received-SPF: pass client-ip=40.107.223.83; envelope-from=komlodi@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 18:11:10
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, alistair@alistair23.me,
 philippe.mathieu.daude@gmail.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changelog:
v4 -> v5
 - 3/4: Simplify logic when changing state and checking mode.
 - 3/4: numonyx_get_mode -> numonyx_mode
 - 4/4: Reword commit message to include QIO mode.

v3 -> v4
 - 1/4: Patch changed to change names of register fields to be more accurate.
 - 1/4: Revert polarity change from v3.
 - 2/4: Added, fixes polarity of VCFG XIP mode when copied from NVCFG.
 - 3/4: Removed check_cmd_mode function, each command check is done in decode_new_cmd instead.
 - 3/4: Add guest error print if JEDEC read is executed in QIO or DIO mode.
 - 3/4: Don't check PP and PP4, they work regardless of mode. PP4_4 is left as is.
 - 3/4: Simplify get_mode function.
 - 4/4: Simplify extract_cfg_num_dummies function.
 - 4/4: Use switch statement instead of table for cycle retrieving.

v2 -> v3
 - 1/3: Added, Fixes NVCFG polarity for DIO/QIO.
 - 2/3: Added, Checks if we can execute the current command in standard/DIO/QIO mode.
 - 3/3: Was 1/1 in v2.  Added cycle counts for DIO/QIO mode.

v1 -> v2
 - 1/2: Change function name to be more accurate
 - 2/2: Dropped

Hi all,

The series fixes the behavior of the dummy cycle register for Numonyx flashes so
it's closer to how hardware behaves.
It also checks if a command can be executed in the current SPI mode
(standard, DIO, or QIO) before extracting dummy cycles for the command.

On hardware, the dummy cycles for fast read commands are set to a specific value
(8 or 10) if the register is all 0s or 1s.
If the register value isn't all 0s or 1s, then the flash expects the amount of
cycles sent to be equal to the count in the register.

Thanks!
Joe

Joe Komlodi (4):
  hw/block/m25p80: Make Numonyx config field names more accurate
  hw/block/m25p80: Fix when VCFG XIP bit is set for Numonyx
  hw/block/m25p80: Check SPI mode before running some Numonyx commands
  hw/block/m25p80: Fix Numonyx fast read dummy cycle count

 hw/block/m25p80.c | 158 ++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 129 insertions(+), 29 deletions(-)

-- 
2.7.4


