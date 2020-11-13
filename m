Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4C92B1493
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 04:14:26 +0100 (CET)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdPXd-0008Tg-O2
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 22:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUO-0004Ax-65; Thu, 12 Nov 2020 22:11:04 -0500
Received: from mail-mw2nam12on2062.outbound.protection.outlook.com
 ([40.107.244.62]:22639 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdPUK-0008NW-S2; Thu, 12 Nov 2020 22:11:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmVKshtRf71/2xde2e5/THQ5mqhfnEF4TkCXMC7mxobrqgQKbtWn0YG5gAwqk+rSuIm3EcLf1XIEg087kcCkJHeYDDwyIs9Hm/58TWP+waf2COZdZ+vGjQ42/ZNdylwO+ADUdkMTeVvxxk1D1rpiW2PLBQGDWvicfUECXIX+yKLzMF39VsKKG9dUGTQmN9i6R3D4kZSYWciWgE/BULHKmELPx0PTGC0IZoC5U9juDn0l3aiqaqVL+WUPOFvtr+2OIB3bNBc4B2uf47MWYEi2W8y3UbFFkojmUPL0nk2YncxJG0O6bmRr30UumRwl0hh5NFV15LdmqOORGe5GVZEmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4ebD0g9+LpUzYrtGGoi5F0GpMkPXUxtDLrBXtzWsqk=;
 b=BmtOn1CjnVcx5E3MMJYBg+BdBRkcoAgF293RLq5EhOCY3+Oxxt5NFSDRhqCTLGyG+bZI1OYK9FI0V1LZIbm1UxM96VctoOffV+o6cexOGyBKjPN5iUG+9oNaLupsVaBczfvThGyIN2JflclnhlLQbaPZCvbhv3BTximrXxJpv3DjpHKUepjI1el3yKLtcGpj+PR6pn1NKVT3V2GafqkDWb86WjjSGorYq5rp8kD+/Zw3GLN2Anfb28wkU7kUco0gpafUgXUWtXr2mWJyhUzlLHx0Xz5NrYDweN5waCRnBPdiQOaMBSQRfrafGRs59caGcPO0B26H+atr+UZ/gTKp/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4ebD0g9+LpUzYrtGGoi5F0GpMkPXUxtDLrBXtzWsqk=;
 b=lsrqI4Fgg+JTeSmoXXUrzisSqLYqNkFZBliXN1eZrllAeoMUr3MGArgZf2lEk2ka7epT94W7rmSY9OTRzz1X7YdCT/O2QiDxbOK/3RXhxQMD4sUD9y4jknCodXOXT4+Cj5tLO4GxzZ80MXTaLGbqhKBlsfJh8MhcTrS9OUQKJaE=
Received: from MN2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:208:134::26)
 by BY5PR02MB6420.namprd02.prod.outlook.com (2603:10b6:a03:1b2::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 03:10:57 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::91) by MN2PR16CA0013.outlook.office365.com
 (2603:10b6:208:134::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 03:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 03:10:57 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 12 Nov 2020 19:10:55 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 12 Nov 2020 19:10:55 -0800
Received: from [172.19.2.32] (port=54046 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1kdPUF-0004vx-OW; Thu, 12 Nov 2020 19:10:55 -0800
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/4] hw/block/m25p80: Numonyx: Fix dummy cycles and check
 for SPI mode on cmds
Date: Thu, 12 Nov 2020 19:10:51 -0800
Message-ID: <1605237055-393580-1-git-send-email-komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20a42bbc-4997-4692-2c3d-08d88781bdb0
X-MS-TrafficTypeDiagnostic: BY5PR02MB6420:
X-Microsoft-Antispam-PRVS: <BY5PR02MB64202924D06C4FE33F8EE655D0E60@BY5PR02MB6420.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vIkluCMQU02FWLQch3uqb3m5/rlRd+l6WFsI2Gr9U1QN6rqn28JxdokJCuaS8j35YWd3sLhnEvZkQ2SpiremCvd8ni3gtkt5tZN9kCIel0eLIDIZAiOBZhOcnbLzQFD3VQGi+lhKRTvtz9+USUb8liAyU413Q3Ge+4M7Eklcg/J4Qq9/6urwQq2lx5p1e8Q390BieJD6NDf3BziaMfU8WQiLpPMWE9vngN7FDLYQvfND5LasyWmbDb8v5FdopNkRZeBZrz9osBeUyyWP3maOHcQubdg1FM5nC0HMCz3bUtxbgeqIf6xAoo4TbvXLu4ckZnJ2JL48yhOFg7ExtIU36/lI9wY+uUi1y0lT/1dA+7w2jywWMM7zoi7SAYtDN3P6qeXqWYEJGcPZp2zc6hOyMhxSnjalzmqQW3fBaaq9Ub8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(8936002)(356005)(2616005)(83380400001)(82740400003)(426003)(9786002)(336012)(186003)(36756003)(6916009)(6666004)(36906005)(47076004)(7636003)(7696005)(5660300002)(26005)(8676002)(44832011)(54906003)(4326008)(316002)(70206006)(478600001)(70586007)(82310400003)(86362001)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 03:10:57.4486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a42bbc-4997-4692-2c3d-08d88781bdb0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6420
Received-SPF: pass client-ip=40.107.244.62; envelope-from=komlodi@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 22:10:59
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

 hw/block/m25p80.c | 185 +++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 148 insertions(+), 37 deletions(-)

-- 
2.7.4


