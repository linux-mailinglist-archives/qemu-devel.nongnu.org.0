Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01C433AEC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:42:57 +0200 (CEST)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrGS-0000PK-Ry
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqCu-0003u0-Qe; Tue, 19 Oct 2021 10:35:13 -0400
Received: from mail-bn8nam12on2075.outbound.protection.outlook.com
 ([40.107.237.75]:28896 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqCs-0006b5-Hi; Tue, 19 Oct 2021 10:35:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXFhkLkofC2yJZjYOdfioqjikFsgVNUjMLz7oPO2K6KSexM1qDDZZWerb2qFg3QzsCBZDOGNgnE8FrLPBGdE+HhpXtLEVy+sGuNsTgIzdj/GNPNQOXvXopnphBWLJZcuB87aEPoAat8VhBXgcQH1UZbvlXbuZo6efYGaWeSfaywyBgbMZIlxmgbmg5laChgbRKyZO7lvG3fxBunqle4kepD53C1VG7rHBBxLhDaj0prl+C0IRcyaogVaK/YOFXWpO5lWSnY1YenmFGM4VReSAfbNaIU02VPWjG1LZwwdcImAEV6Kj8ZoqqgYUjppDpM39vOC54d04JddUMb9q9j3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXBoQji/cwR4N4wlKIVc0awS2g6AFaRsHzulX5Z4u4I=;
 b=IkrKCSnLexheKBxnZJlOCYCLlpn9B+O4JcerFJyRGTEPyUwxdIQcClrOp+M9lA8AKgsbC9FgVplWYf1cVz9FrV/5CzsrIYCxe4AkEkqgxe6SQGwhZKw7sEDt9CZ4Cl52s+pBUkKIVI1sbHZf9goNnyMPgPSHtSeneq7jyisxS1E8VOJgI25LFz1EfKevpdeCevPRFXHSqKrCilsobvIK52zvsWFhb5yMEIya4xtyc/A+hv5g5ukJkfDCUbFLMqrMn0ZRHbQorzQYwKYiMgCKygbYsCz2ZaJsBNHuB38o/H0WO0Z7leG574nDUoWWvFxWxYqGfGrhuBLQxjlcNRjANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXBoQji/cwR4N4wlKIVc0awS2g6AFaRsHzulX5Z4u4I=;
 b=D0+npL7kMn7NTkLlmJUl0tIbC0v3U9+26LefYvH9HoQ6nunOHkGo9j6lsNnulk31A2dvZvt28OoQK594hCx2fxWTYsAv7scd+eqeGDVPDccinx5zyYpxon9AC1knfFeTI4l4+q/NvV4iHSY61gFb3UM2vjcQe/D7Y3SXv+r5n+Y=
Received: from DM5PR21CA0033.namprd21.prod.outlook.com (2603:10b6:3:ed::19) by
 BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Tue, 19 Oct
 2021 14:35:07 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::89) by DM5PR21CA0033.outlook.office365.com
 (2603:10b6:3:ed::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.1 via Frontend
 Transport; Tue, 19 Oct 2021 14:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:35:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:35:04 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH 05/64] migration/rdma: Fix cm_event used before being
 initialized
Date: Tue, 19 Oct 2021 09:08:45 -0500
Message-ID: <20211019140944.152419-6-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c409fe7-bfa7-447a-18a6-08d9930da5c3
X-MS-TrafficTypeDiagnostic: BL0PR12MB5506:
X-Microsoft-Antispam-PRVS: <BL0PR12MB55066608249C326203EA660495BD9@BL0PR12MB5506.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rRpxU33FDqisD9P+rVtc3sd+/F2zUwBeZV65B7fz6dS7+TgHDdaL6f/xQDEKxU1hkOMR2q2ZFnZ1wBY5cE8habmL7mqwDfyneoO5s4k3akZbbwujk/FXgWYsDslXSygF2H85cJXx44QT2JhUwSE+PiVmGQ1u9t2sqAFjvXhi/jKEvoQtfzGRBVxD843y6zYR8YNNtYZU5ER2oV3/TB5yQASoew2TQ8AYh8cxqr/cXGwGU9y2sxAAV+YPb1Ih3O0/Gpk1pTsySqc/FEAbMsWMXlIVofRVtls92ZUVxaT9WtGQ3A+vKtRAs/CJ+0xL2GvKvGpFPr4JeuAZUu7nP4ZOq0OJkYxHwEb5Rw6nWWa/WAQHzRwUtmufSKj9LDwG4ND2yBsHYoCnGaSEOC9b2pmfpVqD3nuag/puVDUJh1BjWRZf4la5yB16jqo2zcLhdsmwG2Dqsr/hulDGocBm7U72VhoQBFC2i+PQ0Iobk+ZgiBzI7siC4ikzxlnsJIk6LFyRkPaV+c4T+40sQzcUqhxaAbAfdzf77N0q3fmAkzw2YcNiTsIXlJYkLb1KsBaUtFdE/d3+ZSGIF1iSoJ2oYzUqPvhdDFwcQxC29PGfBZUoBtIK6OqR52Pu6sKRjmvsUYQhlFon6FTY+4dwlowVgD4iFITM/NpV/FLVNNv8Em14brebAKZfNLLynjRJUZEp3CBnt8KKBtP7wKSL0Llj+YdViJSG1WcXTtrC+niwl2eqP4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(44832011)(4326008)(36860700001)(186003)(16526019)(47076005)(508600001)(356005)(81166007)(83380400001)(70586007)(70206006)(2906002)(316002)(86362001)(8936002)(36756003)(6916009)(82310400003)(426003)(2616005)(1076003)(6666004)(26005)(5660300002)(54906003)(8676002)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:35:07.3770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c409fe7-bfa7-447a-18a6-08d9930da5c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5506
Received-SPF: softfail client-ip=40.107.237.75;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

A segmentation fault was triggered when i try to abort a postcopy + rdma
migration.

since rdma_ack_cm_event releases a uninitialized cm_event in these case.

like below:
2496     ret = rdma_get_cm_event(rdma->channel, &cm_event);
2497     if (ret) {
2498         perror("rdma_get_cm_event after rdma_connect");
2499         ERROR(errp, "connecting to destination!");
2500         rdma_ack_cm_event(cm_event); <<<< cause segmentation fault
2501         goto err_rdma_source_connect;
2502     }

Refer to the rdma_get_cm_event() code, cm_event will be
updated/changed only if rdma_get_cm_event() returns 0. So it's okey to
remove the ack in error patch.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Message-Id: <20210519064740.10828-1-lizhijian@cn.fujitsu.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
(cherry picked from commit efb208dc9c3f1e881aecff21fb1c7a7b6b869480)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 migration/rdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 00eac34232..41726cc74a 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2497,7 +2497,6 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
     if (ret) {
         perror("rdma_get_cm_event after rdma_connect");
         ERROR(errp, "connecting to destination!");
-        rdma_ack_cm_event(cm_event);
         goto err_rdma_source_connect;
     }
 
-- 
2.25.1


