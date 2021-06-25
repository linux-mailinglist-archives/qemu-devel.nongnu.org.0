Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ED73B4ACA
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 01:04:08 +0200 (CEST)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwurl-0000xQ-RM
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 19:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1lwuqm-00085T-8E; Fri, 25 Jun 2021 19:03:05 -0400
Received: from mail-bn8nam11on2042.outbound.protection.outlook.com
 ([40.107.236.42]:12974 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1lwuqh-0001Bt-Po; Fri, 25 Jun 2021 19:03:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fzwsvb1gK6MJfUHDR5uEDsJiisiOiQUB8OASuj8PT5xrHU3UKkxEm/jBo5R78amsQkiEjhQ3ABO1ds+Kg3dN+U7oHXIxJVwNN0ik/cUfW0DaK4eeFJ4ZECUmxPLnWMBl/RWgcrCkn828wTZavEvLdkbwXGDLJ77nYib95GWqojHg17UbSf1ijR9aHbJIcV4LdAmrMmT7U/yz0BHxyai/vCn8/3RtjLMgyKN02/WEnv0ID+a1oRcQbI2wTZQ+QHA95OpFecJKcy5njJT2cN1ZIa7R9HJz5TpV8qsky/M3vgJ4vEHsTvObf/E43CbXYjINXUD+iKfiyCHOllZIMXzegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8h+d0HHEtpxpZjF77aVSpH02pviQmmF3fhxuPCQStE=;
 b=B4a/gC/JdqOe4l2m538WO9SWdjdkdWVmM7Te1fscu96fsD1Bs0Dy9TZzP73pXTkiBUJgikwgifKSqJEn5Cc8ISHu+PW2Hg6rd6tmrhTXKpk0DGjwuH8F5ppt/fiSxMlc4rctYz7raxaNt0IAhFNpGByXVWrUDOxCS1GT1wpk3JBzjhwK9X+hvE8KHybM840csr809Ox0TaSdOuOFlb8LbpXC/q07GD2YnCQ88CSp4UZ15EDdNdaR7kvi6NJnE1lcJg5sPKOWwYwTBUHsY/oZWr0569W1L3h4w5O4FlxWxt8XvlnluWajb3dw56bD76oVvF7imY351XHonGBlKB7sgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8h+d0HHEtpxpZjF77aVSpH02pviQmmF3fhxuPCQStE=;
 b=IFSTXGmsbGGc3WtL/aymWUGBUhw5MF9bIK9M7m8zUfDiscqf0SdoLBYDTfpPUuIyiEnR7XomNdHDl301Z4QFc6HwznJETuc6J+q0DByBETsRcSbPsUiuvDYn33u8sA9FRZN+w01rPuZ0+HmtCHmAcCzgH+F9meIAsSRcCW2dkM0=
Received: from BN9PR03CA0296.namprd03.prod.outlook.com (2603:10b6:408:f5::31)
 by BYAPR02MB5429.namprd02.prod.outlook.com (2603:10b6:a03:99::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 23:02:56 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::cf) by BN9PR03CA0296.outlook.office365.com
 (2603:10b6:408:f5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend
 Transport; Fri, 25 Jun 2021 23:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 23:02:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 25 Jun 2021 16:02:54 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 25 Jun 2021 16:02:54 -0700
Received: from [172.19.2.32] (port=34046 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1lwuqc-0007uv-SG; Fri, 25 Jun 2021 16:02:54 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
Date: Fri, 25 Jun 2021 16:02:53 -0700
Message-ID: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc7911fb-5e0c-40d3-8311-08d9382d5e66
X-MS-TrafficTypeDiagnostic: BYAPR02MB5429:
X-Microsoft-Antispam-PRVS: <BYAPR02MB54296EEB0983E3F4A7C023EBD0069@BYAPR02MB5429.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XIf45fIHn9kZXXuT3t5J1EMVOjCA0k2jqPrWgg5+qEZ1PdKz9pK4lxaK5qQuDguePXLPbQdLLB0OhHJ422Ofl44OQpiXAYpJK5WF5VYAjIB7S/+9VrDgbeUsJuWZuEkgWLkcW+1UdxqO2+qKxbhrrOXhcnknBtQuDdnmazwKzZM13Fi5DxBH3soAc5pTZ1jRN/Jqh+mcbCvraWhRt2vCK+gNt63/9VtGGWmy56B5g13l7cZXZen9ojUEPOk7k3PmObZ0T7o3kfEPUKTGm4yaHR22IC6ENUp2/8bQ7B+mGpHtJfp/MCPEA9NP/cq5RkIU06dqExDDWRBlOnvWLPlM5q88udD0EGiRc3pgC26dxJ7Zx+SQMPBE3HTlJNO62cUOjSoRayVfeOoCaRMicaEDhF1TChRYaYaCrR5edo8L8YF/dh/Ve9iDMjiv9zFOONQcbbGK4jl3qNejeNePQorPnJnCTJUKVBth0WOdVXAC2jwzo8dF5CQlRTJamH25fKXMdcTvqkDlexGAwrm96xgf/m7creiRIcsAuXf54Xj7JnZM8b84yXDY2Y+UqJfD14a4gFzPRqLL5W5YSnKe600Z+PhC2LONhSl7MifyVqgvfqJ4ns5yUUUC/xDLtv1G3epZ4Q8nZ1sQMaUCC9dgCcttck9xKDqyNCiSrdyCSF2oteLR/ywLq7V2SBizwkJsX6/
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(6916009)(8676002)(478600001)(426003)(356005)(2616005)(8936002)(83380400001)(82740400003)(2906002)(9786002)(7636003)(26005)(450100002)(44832011)(4326008)(82310400003)(36860700001)(4744005)(186003)(7696005)(70206006)(336012)(316002)(36756003)(36906005)(70586007)(86362001)(5660300002)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 23:02:55.6566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7911fb-5e0c-40d3-8311-08d9382d5e66
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5429
Received-SPF: pass client-ip=40.107.236.42; envelope-from=komlodi@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This fixes an assertion that occurs when executing FRSQRTE, FRECPE, or FRECPX
on a signaling NaN when the CPU has default NaN mode enabled.

When attempting to silence the NaN, we hit an assertion that ensures that the
CPU FPU status does not have default_nan_mode set.

To avoid this, we check if default_nan_mode is set before trying to silence the
NaN.
What happens then is the instruction sets any flags because of the signaling
NaN, then gets the default NaN value due to default_nan_mode being set.

Thanks!
Joe

Joe Komlodi (1):
  target/arm: Check NaN mode before silencing NaN

 target/arm/helper-a64.c | 12 +++++++++---
 target/arm/vfp_helper.c | 24 ++++++++++++++++++------
 2 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.7.4


