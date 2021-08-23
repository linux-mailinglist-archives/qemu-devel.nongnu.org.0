Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CCE3F4FB7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:41:36 +0200 (CEST)
Received: from localhost ([::1]:38698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDwz-0000Mp-TV
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIDu4-0006Rn-4t; Mon, 23 Aug 2021 13:38:32 -0400
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com
 ([40.107.94.67]:50881 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIDu1-0001yD-7Y; Mon, 23 Aug 2021 13:38:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kA+RNXECXjyIgVeqwSC4gmT8HpCy2JMiPx5uh2O+xyKlLSnylSeK1ayOTIn9n9eZSDlwpurgj7m/+mY3ulKvQY0xrM7lyZPDqFCLNqZHtkYVeJsSlrWmuewHb9lM1UJjxm12fZUiz6+YJL6zl3NTRCfFQppbB55iqDQPtgnv5mX4T+ii991qhkY+k74P+5Sz6Z9dqYAoEiaZ0M5T8jFG1a/vp8QEht4FhuIArz0o9BRrxunyjCLCPbuK+NnCFK/EAbc82HF6eT0nCs5q0r+yT6+BcHiwwZf3vbmPHiw6fxq8tbc4OZB5ISaHDmr2cv54I3AAKLhDxPVEddJTbgK6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dohmSY6StW0prwxziYY9wX5zmgAciyi1MuLAH743V3k=;
 b=NW/MLzPrmkVyn9RpN/QzpUbEYIqksD90CVVVyq9Rs58m/QQYNrSKGrx3HRM7c9kEH3gTfvH5skJsHdtaCyAV6Sgy/MpVn1n9l20T3qBOE+sh6hgMHPX3EFsQfQ23iGVhG9dbVffvOIj9AWOjWgW0KtNHUfnrKjjRA28vAyPXn6Cc621yE/FdThokwQYbXFcrV9g88Mp5c06MVrkr7LTulydhZHZHAP5gHEnLBEUGHJR4V+zamBu489NQ3yIS1FvOA2cxL4NHowr+g0/uk07PS7/fJi5FO/00hpykpm1RWs9wGWwqElmOIaaKwRR600CIRio9Oi5iYWX5XGOFYBT16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dohmSY6StW0prwxziYY9wX5zmgAciyi1MuLAH743V3k=;
 b=mjX0fPhXpWTaO+KWF94NMZC+HHjoeKDUk8M8STd6yqEYgtbFDMR4Aufd4w7s2AwQA9gsaDhkXxgOyb6YJ9qBCvlrhuTZfsVlKkgCkUUhXVd1C7dJA4cTxYZiJvdp0O5+NK4uJTqF5sn0+rGeGLqtJ+5C57YS7n0uKuD2LuAri+A=
Received: from SN2PR01CA0049.prod.exchangelabs.com (2603:10b6:800::17) by
 MWHPR02MB3183.namprd02.prod.outlook.com (2603:10b6:301:62::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Mon, 23 Aug 2021 17:38:20 +0000
Received: from SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::46) by SN2PR01CA0049.outlook.office365.com
 (2603:10b6:800::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:38:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0052.mail.protection.outlook.com (10.97.5.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:38:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:38:19 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:38:19 -0700
Received: from [172.19.2.40] (port=46968 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIDtq-0006Cc-U0; Mon, 23 Aug 2021 10:38:18 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [Patch v2 0/2] hw/arm/xlnx-versal: hw/arm/xlnx-zynqmp: Add
 unimplemented mmio
Date: Mon, 23 Aug 2021 10:38:16 -0700
Message-ID: <20210823173818.201259-1-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b0e5451-39ba-423b-dbe3-08d9665ccc3d
X-MS-TrafficTypeDiagnostic: MWHPR02MB3183:
X-Microsoft-Antispam-PRVS: <MWHPR02MB318329B895A21FBB8D61EFF6CDC49@MWHPR02MB3183.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1jkKmr6ao+vuNa7oCGQyn4Nw7y+ziRiRtXu4AU/VAV7SVitX8S1hbay+B1hBP8WuUuE8oLAPR8KYGJz9lRFQltaGt+Xipa8inA3A03Zpze8Ci2twgEJM7beMEaHhX8vlXHAcpok9Zr+SAAMC5LEnbb/1x5vVSrDhJwK5Aua+ceOIMfnxUmDCwzkWoZc1usNyivQhVtj8V2MAAi358OjkRi9ZmzeYWwZN0L0BuIWzMyrJYVoyVq/RkR0G99wn4RH1EN7oc4tt19I/3tq+2CWS+RcbSXiYg442n59pvkwXLGLy84JvUFlrl2b3mrpijFLiLLce5trALE52uqehP/nFFWJjyPKtgVLLAhlgi06RtXu7jf8g5fS3UXjHZAps9vV2yKARS0SoU64dbg5gUCxYj9ckwFLtSOGrXmZm7j4LcdWjswSgDibj3Nd1rCyPe94sRPgR8o3erPjfd25gs6/+ls+p5NwmK//R5vy/IQ/fe0qLlJEOPZDAV+t3iv4XN1/IwHgG2lhwyke7shKpO2VfBLJvF0iytk0opVFmFTxQvDZZ+n8Lt78iDFeTqOoLDqoivXcZhUIGdNIaKzEveiaxEjLI2L8EZs9CuPK1Q9o15w1lAG7y4AlzNP8fEbkdjHyV6BQhNNP+rdpaPrGSlkCIfwLLQsOxggb5YCt4Hm/i6zqGczbSDwtsYBdtVMOh+xbY/UTtFYaiT8rYdKTpQbMD9NjEJYw8dsEbQ9YtJ+ue8ADzJF+EoQ257NBA0rkhDXxWRGFRtiutDingfHoIL8EZzPrlrzYVd04Wn3ZXlXGfvvjelUTQZmX4VdeuHR7wbp9
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(7636003)(966005)(4744005)(54906003)(26005)(316002)(1076003)(478600001)(36906005)(82740400003)(83380400001)(336012)(9786002)(2616005)(36756003)(426003)(8936002)(82310400003)(6916009)(47076005)(186003)(5660300002)(70206006)(356005)(8676002)(4326008)(70586007)(36860700001)(44832011)(2906002)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:38:19.8466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0e5451-39ba-423b-dbe3-08d9665ccc3d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3183
Received-SPF: pass client-ip=40.107.94.67; envelope-from=tongh@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: peter.maydell@linaro.org, alistair@alistair23.me, qemu-devel@nongnu.org,
 philippe.mathieu.daude@gmail.com, edgar.iglesias@gmail.com, tong.ho@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds the APU mmio region as an unimplemented device
to each of two Xilinx SoC to support booting guests built with
the standalone bsp published at:
  https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit

---

Changelogs:

v1->v2:
* For xlnx-zynqmp.c:
  - Use assert to ensure UnimpInfo array initialization.
  - Use 'unsigned int' style.
* Provide a more specific URL, in both patches' commit messages, to
  where the APU mmio region is accessed by standalone bsp bootstrap.

---

Tong Ho (2):
  hw/arm/xlnx-versal: Add unimplemented APU mmio
  hw/arm/xlnx-zynqmp: Add unimplemented APU mmio

 hw/arm/xlnx-versal.c         |  2 ++
 hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  2 ++
 include/hw/arm/xlnx-zynqmp.h |  7 +++++++
 4 files changed, 43 insertions(+)

-- 
2.25.1


