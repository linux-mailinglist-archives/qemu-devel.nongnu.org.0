Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BC3CEEF2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:04:57 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5bNg-0006Zo-Mb
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5bLi-0004Fe-7P
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:02:54 -0400
Received: from mail-mw2nam08on2082.outbound.protection.outlook.com
 ([40.107.101.82]:43393 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5bLf-0001Xs-2s
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:02:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1pIJ04X+/P2VJQ7oBTW0x2bXPaWpoMdScjWnUPgIJkN2/gAnhj3VodnYmBFw6OIFLBh8rXjc3JPRIANU86Ve06EfO5wlEok+rkfWOA8921gA+Cf6b6i8FBZMwEKwYHmkJrXNMDUFBK9Mx1+BUMG9cdEFibdU4UxBvmZmumGjGyCM4K1nJDoIGOjeiNDCSmgYY+0bGaNw+qiynYubGgI50YEdwW0SBZibAimWwnpR7yFecDJbjXcbAhpxaY6Ra0G3ysRHKRVrWdgZLYGGGNaAhKyu0aHkKN3BzThgMHsouPIYhvXlYuVmjpm8Wl4GG5qGvw8LLu4IJqupxzWT0TYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mVexR5+lwXJzqk/7rc4qNiAiNrPFQtF4mHXUMePBks=;
 b=g7GLJO0WqKCFSsYEg2qINdLFmnSxvZO2UWs38BN4gTuHChkgA5K75Ah3M9XblbZTwkK4iarYYZ3LyNmQEzuGZtwZcFu4tFZG+SA25an4xrgn9GqZqKFId3z3L++zYPiJs9zcZULAiiBN35yeFly2kVb3iEiH85iJaqnzHCrueR/oKGBZU1bh0YBnMJCp863S18Y7F2ZK3+r/eY2Q49SXVjL5BzD6/pdLBnlfVenT5dnm4xyanvkjcSMZGLPZeM+qR/zgta/5K+7OGiT8PZOieQ2vJ/HOBgUJIYXyrkpA2ci8Me7YrWScK8uD1zAbpMUoLKKaiNJId5cx+HL5sqK+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mVexR5+lwXJzqk/7rc4qNiAiNrPFQtF4mHXUMePBks=;
 b=ISpS9GoG7HfbQK33prqERoAdxRLwdekMhV/2fQkPEPl7qUn2KzMfsdHbK15pPNZXKHKzDoM8FDJ3g0dzkQJ+w6pSaRhlYErpwVOIttOcrNTWvRU/G9KxDvf7xTe5yQjNKk0dp4te5WmLomdWJxkk9vZuqbiedRLwN1RmfRkiY+4=
Received: from DS7PR03CA0269.namprd03.prod.outlook.com (2603:10b6:5:3b3::34)
 by CH0PR02MB8105.namprd02.prod.outlook.com (2603:10b6:610:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 22:02:47 +0000
Received: from DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::b1) by DS7PR03CA0269.outlook.office365.com
 (2603:10b6:5:3b3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 22:02:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT036.mail.protection.outlook.com (10.13.5.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 22:02:47 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 15:02:46 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 15:02:45 -0700
Received: from [172.19.2.32] (port=56696 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5bLZ-0003YW-VE; Mon, 19 Jul 2021 15:02:45 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] hw/registerfields: Use 64-bit bitfield for FIELD_DP64
Date: Mon, 19 Jul 2021 15:02:45 -0700
Message-ID: <1626732165-137461-3-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
References: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 678f13b0-a823-4b10-a628-08d94b00f184
X-MS-TrafficTypeDiagnostic: CH0PR02MB8105:
X-Microsoft-Antispam-PRVS: <CH0PR02MB8105EA94AC48459AEFCDF927D0E19@CH0PR02MB8105.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m4URF+QURpYis9+Now0S8qMcUrbtCNFsl7Yg1gcNs7Apd1tZ3RcDJugQbES5HJ5gbVYXaG/Tv3e6G1uM/Cy5v/dBjpZUAIIVDlpqp0sOVJ6U+Gn2lV5x8xwHyGcEMqKKV0mGuTtWD9tG3UWWxcEylhKzz0ncDwmS1TBNnA0BOraCTo9TK09zub00s/l3F8cthahebstifNWLOWuwioix5tL56wFNwhzqc8rzeeOsbFUo79v3sdnnnAJvBMu+lOGYkugUWNyZ8Vn0ahvlac9LBjtdTFCR0bY7pHvBirrhgpSo2z9Nnlxr3pF6qnop7m0wWDWNCGGSVzK/LLc5DLjv6UINTe6hvAIljGpKEe6Qqfq9ffIYrYHCnvatK5vteQF5eredbX1cNl9/GYTGYB+X0iSTntdKGAGTtDgj0NGvHAav5CUyd87gH9Tg+Zs07lXEJaHGkF7BmnqQ6iytWKSQL8yvvrcz6wkxvTRJSD+jEVlO4gfbIUSLmhA2WFgLzaUFhBzQa7sotzj575gvF6+csJqNO6571QJYxR0syCcrHzghOOtqdnGljPY/sQ+p/oGKDe5Y9N6J8rsTJnUyw1tIG+AiALq/XkhH44foNLAekeh/jdiSWxVB++4+htzI5TUB2VuETPMYjz/Ig4+PdQWgz4NAK0+gKz4mGPV+hZeaZxD+sXwmNn+K36g7H/doo/GLzjWM9N7thc+ARYmb0QkhLZ9blGPDsn4E4uezf+sQRBw=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966006)(36840700001)(7696005)(2906002)(478600001)(4326008)(47076005)(54906003)(36860700001)(36906005)(316002)(82740400003)(4744005)(426003)(336012)(70586007)(44832011)(2616005)(5660300002)(70206006)(36756003)(86362001)(9786002)(82310400003)(8676002)(6916009)(26005)(356005)(8936002)(83380400001)(7636003)(186003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 22:02:47.2801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 678f13b0-a823-4b10-a628-08d94b00f184
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8105
Received-SPF: pass client-ip=40.107.101.82; envelope-from=komlodi@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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
Cc: alistair@alistair23.me, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have a field that's wider than 32-bits, we need a data type wide enough to
be able to create the bitfield used to deposit the value.

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
---
 include/hw/registerfields.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 9a03ac5..f2a3c9c 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -95,7 +95,7 @@
     _d; })
 #define FIELD_DP64(storage, reg, field, val) ({                           \
     struct {                                                              \
-        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
+        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                \
     } _v = { .v = val };                                                  \
     uint64_t _d;                                                          \
     _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
-- 
2.7.4


