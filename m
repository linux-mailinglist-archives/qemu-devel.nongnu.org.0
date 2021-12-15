Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3715474F54
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:33:15 +0100 (CET)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIEM-0001Pa-RR
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:33:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHxz-000220-BF; Tue, 14 Dec 2021 19:16:19 -0500
Received: from mail-co1nam11on2074.outbound.protection.outlook.com
 ([40.107.220.74]:17856 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHxk-0006B6-CP; Tue, 14 Dec 2021 19:16:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f24KC1p+KQBIo8yZtR5BPP//UUe6gYtPWv5gMf60y3PryhGr77UOZkMFS+CjrMCSDrHsA2oBThEt3u9Pm9svHO8kzqSfvD/8R1MNv3uf+VEFaWgQZqXH79g8i14yp9UNZhFKGJ78aiJauz66kc8i7ChNu5lVfrhKY8dNyArFTJVpPbl6rS9i2594QhzwpP/G/FGeVxlo1O6eI/gH3RU9ouByG5u3bv5raCJ90Ufh8V3ocv9/CqTNE33LkstychEUmdFgqMlYRgzjuH8eI/gen0gPmeuH/3c2EDyhDup7/sFQKhTo3xSzzE5PtJKx3FGjS016BjAIe4YVpn3Ru/cPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjF8VJuERWgAxWJzCvPcTNpSt0AhBvmKppGdnY8PBxc=;
 b=GbBaZOKM/h9/1I9Oz3knhMgqxXcAma+dtY/r2XJLPLxNTYRfqn8hVmtGIEgk+h+T2xXWOjMfwCwFvWItpFUfDC82pJ92DYS9j2rh5wjTX/k24BmoG0hh8rusP7G/Q4XMZ043F7zEOTppXqNzIricsF5T4Cn9faxI52thqC9m4p/WtbLhBfi/GFY+VDfFwx8n3ZUvX7NT/f8dwMsSkTCuifLeHWgfyYQi1IUWASeYFtox59cGgoDKImR6SgHsYLdQa039OOG8JkrI+W2dC+i/jGHLBhQ+FxrIk3f3vT+ZmeQkMM8+zGkcaMCi8C0i6IxsE+7Qq0nTHy41phUnQ5+2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjF8VJuERWgAxWJzCvPcTNpSt0AhBvmKppGdnY8PBxc=;
 b=W7L9zgXpY/YG9ZrPlCRm3TFUqmQSeSKRWLi+jJIk+KOsh+NXBIgAnqPnkfUpdVl1tzFxKqBdtSrPdqLlj6Gbpl/CUB2jV2S37cn9MBtWpGOPfw1yEVCrg7oIhf6A6DbcM3Mg9rOiwU3YFaC/XGJRZQbwq5y1vdR+yuHPy/h/8nY=
Received: from DM5PR18CA0073.namprd18.prod.outlook.com (2603:10b6:3:3::11) by
 MN2PR12MB2877.namprd12.prod.outlook.com (2603:10b6:208:ae::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Wed, 15 Dec 2021 00:15:56 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::57) by DM5PR18CA0073.outlook.office365.com
 (2603:10b6:3:3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15 via Frontend
 Transport; Wed, 15 Dec 2021 00:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:15:56 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:15:56 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Daniil Tatianin <d-tatianin@yandex-team.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH 41/47] chardev/wctable: don't free the instance in
 wctablet_chr_finalize
Date: Tue, 14 Dec 2021 18:01:19 -0600
Message-ID: <20211215000125.378126-42-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05e2921a-252f-4448-b2a1-08d9bf6010a2
X-MS-TrafficTypeDiagnostic: MN2PR12MB2877:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2877C48C6028078A3534A05D95769@MN2PR12MB2877.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JwnhxOvC5AyJymTElKO8cx32o2oik8dKP8pcOCRucT7u0vTTSPpCci8kaDOkhVDt6Nwc1wQBzH+LyxdHF1TcEZpFGUy6eu0XYqDH7jsvI4MNuAa0J4IblV4AeMKdf1qcFhE9AP54MvdkFabUpcVUQz6H6Sk9waMwptbQPrE8SjzkA+tHnIdreGAKiEFw3Y+JSYvPsfoBYWUuXneymugy91+qO89CPyz6y+6klqQSaUFHh+849W5GlIdB81N7ATu1P0O/os7NrdRnWCio7K9KRgT3oq822uVRpy9lj5romA8b8kRikzXn9Mf8lPJcC8mcPNPB77DaqtLf0I0h9vZXBmfBh4F/Q8vOODZdvsUOwTL7VZ4Tt5agKfR053DC9oCEQNNikPv2JEv2bNscxrmRI31bmvJrnCvYJflGFgXFe8Y9HqxO9JyG8BiSm2B1/+lexidb7TcpRDfQG/nhYStxyGfIbiuQa97zl/xkB4CsyYObrJ/Hc4QRtnFgvUXmbRCnAY2GxhsdR6MTUZM0CZqJe61FPX2zcINfOp8aXIWH7VKhRLU+QUxwIk0lXB4FqCIvF2aSccPghYkN1HIhK/XwTkGGfC3pQJQiBtBrecc7xZ7A3mHn9yo5PjNkIIiG1I7vRVw5IxvoKdcnMTwzkh3tJYfJCEw0T40/tIyO6LAB4MUMnHABzGN9vv1cf7PdQkk2xtCQ4VLgr9xub4u/lP4ppNTibTxQblXxmsizSFx2qsSTqjOeJogqxKE6P3S8u7vgUUN1obgBVsVxTaI8bpo+1iASC48EpQTCwz4Rt9zeVSQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(70206006)(54906003)(81166007)(356005)(336012)(1076003)(2906002)(36860700001)(6666004)(47076005)(44832011)(40460700001)(36756003)(316002)(82310400004)(26005)(70586007)(6916009)(426003)(8676002)(16526019)(4326008)(83380400001)(2616005)(508600001)(186003)(8936002)(86362001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:15:56.5651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e2921a-252f-4448-b2a1-08d9bf6010a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
Received-SPF: softfail client-ip=40.107.220.74;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

Object is supposed to be freed by invoking obj->free, and not
obj->instance_finalize. This would lead to use-after-free followed by
double free in object_unref/object_finalize.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211117142349.836279-1-d-tatianin@yandex-team.ru>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
(cherry picked from commit fdc6e168181d06391711171b7c409b34f2981ced)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 chardev/wctablet.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 95e005f5a5..e8b292c43c 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -320,7 +320,6 @@ static void wctablet_chr_finalize(Object *obj)
     TabletChardev *tablet = WCTABLET_CHARDEV(obj);
 
     qemu_input_handler_unregister(tablet->hs);
-    g_free(tablet);
 }
 
 static void wctablet_chr_open(Chardev *chr,
-- 
2.25.1


