Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAEA3CEE02
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:03:34 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5aQH-0003Tg-Fe
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5aP8-0002lf-3Y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:02:22 -0400
Received: from mail-bn8nam11on20628.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::628]:20257
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m5aP4-000446-HK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:02:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBwUoaUNWe9xIOR1jWsaMqD1z7SWw/61Dm/4JE/XP1CWWh+l3gHhkBWspMwIOd1NPPwATapFRbJOGWvluafTj3yIDh88XXBAjU57SatvJmwlRLfom3GHsL4eg41heui2L7ZnH1GRsFa24mmKW0yueqPcgWJbSeMM32Fph7EwYwNV7zAv1Sl9A9j/ko438+iyWmpyYCObfhp3pFFX5CSwM2PjA8SqxrRmU/Hhj3iw9I4ompsbPnF7V11e+Xut+GwiQgmgI+mCzPMY8av2w5aJyRBbUSPcyiX1An2uaha8F4bjoyPYxO6vvzGJIZOQ9e+xkvxiaM9pUwIEqmkvm4EPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nH0TTiT34jJlhnfzyoPc0N1bn/ic6TUexZwXie+1io=;
 b=GQrBYEiX5LT5QRPHPzRLDd/sLog6ucC9O+JlbJ2N0HIwrPG7K9mbRwXzu6quPokLAztcul/Mvua078Dgk+tfer/EI74/ImGD3yUwYEh/eVKHAM4yctVO2dkZnOs9rTYDNBqsEAFCxWVM8nDBqFEoOdHEfOW9oFcSjqgKFVJI2rftTrdjln6DAl/HRkZQDnw+tw9N0JiBHGfSPKowlXKFLyb8FE/FFmpd/JBZBG8y93mm3HVtLyVP4bU+eeAiv7UQeRxncqp8GcAPNuUne6ksnzAQRjLDCu6X1gvg1OpsmcpM+8/c1KUjpfZ9xPP42im7D8lURCjRMccj+9jYGHJTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nH0TTiT34jJlhnfzyoPc0N1bn/ic6TUexZwXie+1io=;
 b=INP8OtYUtfViPtNWjm3FW2giMSSEKdvbLDtQNDxJyNQigq9EoVXpyix73oyM/8Vr7l9Q2HNAhZxl3sJxt4/nnjdW7jeNFKZs5TAr57gR0FYW+zxXl1ED+4Rkt2qzksdY+R0hxMVQHYwWJ7bfPyXR5LP6Ayzqhj+Hn36hs+MIhtc=
Received: from SN4PR0501CA0021.namprd05.prod.outlook.com
 (2603:10b6:803:40::34) by BY5PR02MB6739.namprd02.prod.outlook.com
 (2603:10b6:a03:208::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 20:57:14 +0000
Received: from SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:40:cafe::fa) by SN4PR0501CA0021.outlook.office365.com
 (2603:10b6:803:40::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9 via Frontend
 Transport; Mon, 19 Jul 2021 20:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0029.mail.protection.outlook.com (10.97.4.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:57:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 13:57:13 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 13:57:13 -0700
Received: from [172.19.2.32] (port=56680 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m5aK9-0000iY-2P; Mon, 19 Jul 2021 13:57:13 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/1] hw/arm/smmuv3: Check 31st bit to see if CD is valid
Date: Mon, 19 Jul 2021 13:57:12 -0700
Message-ID: <1626728232-134665-2-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626728232-134665-1-git-send-email-joe.komlodi@xilinx.com>
References: <1626728232-134665-1-git-send-email-joe.komlodi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d7c5494-0b53-46bb-0033-08d94af7c8c2
X-MS-TrafficTypeDiagnostic: BY5PR02MB6739:
X-Microsoft-Antispam-PRVS: <BY5PR02MB67395149CFF7405437CBC435D0E19@BY5PR02MB6739.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DeykptgW/3hEuZbZFNBxAP+saZ88LlCAGU+labFF89qPrdGaouUj59DhTBaRdIYX38yxPrUCqGnZTIEyvwHe0UyCrv2jxJi0XuJN16kfhFRlpQ0CUs4SzBOytTKwe2H0Kt7yKlvWu7L5fjy4zO3l9tnwl/hIL9GUbOI7VwuiAYmoiMzFAiIN2ankpKDibmMNzTPpzaN85NBtlnVjYpDWjtuV2ZI93BcR4aORfzwGSiwDUzZCrDbP+w8xYlFrWqhKg0YyCFwUfcbnqoY/kPEEa/UF/6BBtEE/Z9gi8pXS8SCcrra/DwyVOlqIZAUCKEwJ6oxbRzuUZxr1q5A+7qpqZ1bIJ1/W0nu2XKOcudfaDEZ0cimyEy+V60lU9AJwTh2kR6u5Bx3/HkRBD5O8hP9i+lqUxS/wxnnp54nYHX20Aif5716ig3xX6OUuOEZhLdQLk1HT3LPthIk9XICs60cz/HCjWhw09x/pjMoluLJMoyJVV4EVcu7QZ1ENL69/eSw1hVc3Do74PX3j33RO57hvoARMb13R5LardhlRRwwQi2W94p7TXIoBcHCJ3mJZX1hj8KHj1xf1QSRO9uiVWrRw2YHo+H1d0wBMSSzYFud6XmwY7AowjNn8+CTmrfWVGuw+AH2voGh3VQmUFDubFC9AQj9cJJ5mPAbDg5sL0mG5XEio+qa7AYWudpHOICc9LTBgv53QLQN64RZuHLGGKuBPUDJIlZwawQZVjM8oY9hBgMY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(36840700001)(5660300002)(36906005)(7636003)(2906002)(36756003)(8676002)(316002)(44832011)(186003)(336012)(8936002)(86362001)(356005)(82740400003)(7696005)(36860700001)(82310400003)(4326008)(83380400001)(47076005)(2616005)(9786002)(70206006)(26005)(6916009)(70586007)(426003)(478600001)(4744005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:57:13.4380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7c5494-0b53-46bb-0033-08d94af7c8c2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6739
Received-SPF: pass client-ip=2a01:111:f400:7eae::628;
 envelope-from=komlodi@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bit to see if a CD is valid is the last bit of the first word of the CD.

Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
---
 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 3dac576..d1885ae 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -570,7 +570,7 @@ static inline int pa_range(STE *ste)
 
 /* CD fields */
 
-#define CD_VALID(x)   extract32((x)->word[0], 30, 1)
+#define CD_VALID(x)   extract32((x)->word[0], 31, 1)
 #define CD_ASID(x)    extract32((x)->word[1], 16, 16)
 #define CD_TTB(x, sel)                                      \
     ({                                                      \
-- 
2.7.4


