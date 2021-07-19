Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581073CEC40
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:18:10 +0200 (CEST)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZiL-0002x7-Eh
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5Zgm-000184-Sw
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:16:32 -0400
Received: from mail-bn8nam11on2077.outbound.protection.outlook.com
 ([40.107.236.77]:31840 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5Zgk-0007J7-5i
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:16:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV8EbghsUczWH3ml3ufO4PPobu6BcjX4xf4eTO+ib3xxZVG6y9t0FKVPf0O5V8a4yuDx5y5H3PT22bBvrQW7v5Ff20IMFMBJaspxLIn7pQhHrb30vU/OldweXysDb9ZmFjPnIB0+VDk/xdw3L9whA+jsyWBLXwzPzpq6fbP87W06auPZVe7laf9H7vjmAUF5ZDBrPWo05Y+QNH3gHPAmVXxF/NrtGkCHYvZL8UrBWLht6vPDIrZsNtU/OGn2VyQHvF+hJjmQwLY/TJQqS5p7Wk1V0hdDjFjTzfWjbtctBptIbKuVnlawt3Ia2fPbhTTvBRxyck6PBg8XUKqXxMpTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMBK6OS65HkQryTWGU21GvkFK1VLmRrhw3fjrg0+eBA=;
 b=YFQRsObP/5L/Bzrqks3OyfKxyc2zb/yQplDx+cmtFFTw12+JmAlTZFcy3vV9TYOH0U2IMeTouqTMDlOubaxGj03J+/UJZwrjKetB8Qghq0PqkGsv+Yucptz23diAzcGyl4xMkrngSWs9R128M7+2nA9IYsE8REpYI8Vzz++tV2XstIISaI6SXecwLFNwNNeE+N06kMo0rxzpcrenKEGtE0ZW+PxrfG3gfTIi4ZEn3D/hfgGzbzh32/osJdrLmAI8lXW8P+J9GpgZoi3TrG+xvEJ4bv4119FvsGM5tjWSNKaLIh/7M0LJTy6l3G0ql1A2k+inD20wbhimAI7oNKfR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMBK6OS65HkQryTWGU21GvkFK1VLmRrhw3fjrg0+eBA=;
 b=olCZxmOAsqW+e9bu/nixxqD6YMktxNP3D5QFdbX2YjCPIeUEuV0foRxumIym92D4H1Rz3jr7pO1XTEb7YREnW5eMQmbR5H6qADtXOAVB65t8v0RuRA0X+pQAC3Q/d7SUDbJWbhY+1aXSCNDBiWsKL2wtBRCUtlMv2u8qxDNEWqg=
Received: from DM6PR02CA0117.namprd02.prod.outlook.com (2603:10b6:5:1b4::19)
 by SA2PR02MB7675.namprd02.prod.outlook.com (2603:10b6:806:14f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 20:16:27 +0000
Received: from DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::49) by DM6PR02CA0117.outlook.office365.com
 (2603:10b6:5:1b4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Mon, 19 Jul 2021 20:16:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT025.mail.protection.outlook.com (10.13.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:16:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 13:16:23 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 13:16:23 -0700
Received: from [172.19.2.32] (port=56664 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5Zgd-0004Hs-Pg; Mon, 19 Jul 2021 13:16:23 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] hw/registerfields: Use 64-bit bitfield for FIELD_DP64
Date: Mon, 19 Jul 2021 13:16:23 -0700
Message-ID: <1626725783-133765-3-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626725783-133765-1-git-send-email-joe.komlodi@xilinx.com>
References: <1626725783-133765-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d8486b3-cfa4-4f9e-8c83-08d94af21674
X-MS-TrafficTypeDiagnostic: SA2PR02MB7675:
X-Microsoft-Antispam-PRVS: <SA2PR02MB7675AAE6BA791C2F5405FBE0D0E19@SA2PR02MB7675.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGIo6ciyjNRmCnRAJJZ2jrcEHyNsZiYB6tIq+odM7uT/RYRwtFwFppvMDaYEXWMJCmX9TMbd9cxsByJuHAm2SMRLS0fkxBpZXuySZzaWSsNA0yW/YfIMFPBhQyi571CTSDn25vuiV4eJJ17CVapFdtCJ7CcPW7YSkIgXElu0IYTZdESj7+qxihGA/jIRdlYKnK3EFcrtTQvOLftfMFC2m4rF/vMA5/WCwIYCS6ngEbk/Ui4qMNYAU3f33maVvrsD16eTsbMbvJwj70A1rms7IuljO5GJZDOJXTCjnVUVYm4mUysHQ/UtQEHQCOj+CDZTfW48EwvKF2zIdQUBAZ4e50UJ3OxWTYjcsjkKTaJBFw0G/T3y1wVg0GOJI3sRg2tn/S+GXyblx4AsA4iOg74MF7WfVsNWJ5hldxfMWonSm8RWmY7vppWG4toV9PNu9t8x7gYl7v5HcgFqOEL1Xe9Wz6wBn2lJ0Hamfsfv2UHchgWTC5g9Y0S7JeuW74ei7jy0CjznxaxwxGmDIrahhmwRoUXyLXMARSxOIyzNawF+J5WxR6DYiakZLPc4s3pu3roe4p7nQ39IuT/9oCoGmxksCNWyGjDhsewfzC7457/uiqLHFewJ7c9h9YKvnrj0fFcArQlaaQUpxR3nZ2mtZe4m87wJ8/NERi9NuRMrsUapjgg0IPnnboz8xEAAVQZaAv0lRewZNCif81mzOkLEZfLWm4U/RAAKUrA/yOLMTIEfJ1g=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70206006)(70586007)(9786002)(7636003)(356005)(83380400001)(82310400003)(8676002)(4744005)(86362001)(5660300002)(6916009)(186003)(7696005)(2906002)(36756003)(47076005)(44832011)(36906005)(26005)(336012)(316002)(8936002)(36860700001)(426003)(508600001)(4326008)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:16:26.7994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8486b3-cfa4-4f9e-8c83-08d94af21674
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7675
Received-SPF: pass client-ip=40.107.236.77; envelope-from=komlodi@xilinx.com;
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
Cc: alistair@alistair23.me
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have a field that's wider than 32-bits, we need a data type wide enough to
be able to create the bitfield used to deposit the value.

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
---
 include/hw/registerfields.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 9a03ac5..f7bfa1f 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -95,7 +95,7 @@
     _d; })
 #define FIELD_DP64(storage, reg, field, val) ({                           \
     struct {                                                              \
-        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
+        unsigned long v:R_ ## reg ## _ ## field ## _LENGTH;                \
     } _v = { .v = val };                                                  \
     uint64_t _d;                                                          \
     _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
-- 
2.7.4


