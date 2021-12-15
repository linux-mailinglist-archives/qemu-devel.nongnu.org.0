Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7F3474F45
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:31:41 +0100 (CET)
Received: from localhost ([::1]:42068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxICq-0007mc-EI
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:31:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHwu-0001ND-Iq; Tue, 14 Dec 2021 19:15:19 -0500
Received: from mail-co1nam11on2043.outbound.protection.outlook.com
 ([40.107.220.43]:56161 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHwg-0005w5-Tm; Tue, 14 Dec 2021 19:15:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVjyODyn5uTYQ/Nj1j/CyL6rzWUrtI82kgCRlz9MiSp7Xl/rNZcl1xNp1fiNplUM7UCyLG+4R8N459haA9ohAhUA6cA2Pn4WJOoHnJJTLoq1IuAejn6s0JsQ5R9fa35/qqourguy1tITpIBY7HAD1xTFL0wZk1K7POttKipo1p4iSB1MunaaA5O02KIPYB68kH4ZXG6EyJR39f16k5MEjlBORyk6xYVJwLOxl3yuGK7vjZYkC4agOopoBQ2yTpmV2DVTQE4yzxIzDhKpJjz52j5OPcB9qs9zi6EFlGt2O6jv5to6sysTqxWwzf9aVA4jByd1RG8g/AL2Ck3yGtWi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbU8CV4/082Z9DsQLKqW2IysZIhFFCFtDaffzKlrLCk=;
 b=WAVcC0SXH+u0kLJcLpG1EicGQ//oqPNhnW5QTbbjhxKAEoPAJzZMZEEpPhP+nxVlNsxWZ3tySYqV2aIGiHOlUhVvb/BxGPKSWY9xQ5POXWBG488w7cZfyOJ/plbmPYWpVKb5IbdJg7RJQV3OJ7nWzPxGnCqdJlmA0MkjGlb9oIgVxcKTDaD14YYSPhbDjo70PEH/xJgyyZoYwwOk+Wb15YR9OZoRGz5YSLQBVrj1cpB+zHsqGHMhxQcM3LDdSZkEXYnyjATEROo/Z6PZs7VId9kJuB8QnMwTnlI7galOwUasXAVNrisabofrSA32jJEn2wIY6EN0UyCVEI3xYmVk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbU8CV4/082Z9DsQLKqW2IysZIhFFCFtDaffzKlrLCk=;
 b=ge7qYmNyln3+tcKGJaTwERBafSwIbUV+UoOWVh2Oi56OHAxBmudbOClFbAr7E3YNuN/1s1kINrzUkDOIEt/9Hutaw0aI466DUcFEAQqVu+GofPlb2XxAmXdgoIuM6cM8bJhxZr8C6hcxRSrGgnnmuz7dJNdIRnMCnZkHGt7LXVk=
Received: from DS7PR03CA0282.namprd03.prod.outlook.com (2603:10b6:5:3ad::17)
 by CY4PR12MB1750.namprd12.prod.outlook.com (2603:10b6:903:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 00:14:54 +0000
Received: from DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::24) by DS7PR03CA0282.outlook.office365.com
 (2603:10b6:5:3ad::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT049.mail.protection.outlook.com (10.13.172.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:14:53 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:14:53 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH 39/47] nbd/server: Don't complain on certain client disconnects
Date: Tue, 14 Dec 2021 18:01:17 -0600
Message-ID: <20211215000125.378126-40-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acb6d5e6-5098-4112-beb4-08d9bf5feb55
X-MS-TrafficTypeDiagnostic: CY4PR12MB1750:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB175036B6BEF1BFAA6859EEEC95769@CY4PR12MB1750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Ywbbjgswmxw7XpQNkJQCI9AbaNS3V3dosbyWwkW5sP9504cpN8EHvU3hQtPIAmnqZkZAQ0PcRTFGrR1lS+/yHsBM64fWPb8glChRh/eS3hrmEelyU1efgHUEca2hEue86Hz5ijSSQutpKLM95UEToxTmTyUmwlruRNlbYaYh7SpR8r7jOKYMRqbvq6awdHRKEX42Upc0JYqqvHLm3eu66+Z4hXgs1u6A6Dk0LQKZeoDl45GkFZjboINYx00H4yqYCqFdteNrYtQApn1Ur7jnsZb3cD4QbHUmwpZhTtFfI76c03MdGrECV7ifMsWMWG81UrGR0HOCadh9zVUaFNxfc2FiVUc4JR8HKS5oTPOcX/0vcSAwmWCoJW1ikiNhGXkbgjwgGpdaI5Wwl0MQ3odtGDHXl5pt8hvwJgV+BQcg19pkiSq2gwZOG63T9cYA9tqj49NfgLZ3opTeS0LM9zJMyQaaGtkou+AZ9HWeMuMtvn/g0T+ChfM9TohlHLVBcxKoacsQD3VeLKqCwr7AX4DhbsvKi8wGzQ9nwJNyX9gu+kLy7WjAxAnXyXUp8uyn+bzPdYntzGCUBA8Lo30BzmKz19KCE5KaO40xbGAt/XeEuc58EnzjpX1RbOJXx5xSVZDN/dj/U8bu3vanCgQg7xcUk2w8umkKs7OMn5o8wY5FbwqNnvH9ZJ4XMdsEIhEDIfdGdC82kFKe7wTfHVjIkg8k6LqGF3D3jug/07XghaJAeggKVKfS4tqkkwNDxkdcG79KuN52UzgJXWPBdVz72lv/m/1K1elvyyNo7zaZzTh8004Opp1odS33IsaAuYUA1zzzzsMk3dUt4FMw/YT8e6Sew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(86362001)(2906002)(6666004)(5660300002)(6916009)(356005)(47076005)(70586007)(8676002)(1076003)(70206006)(508600001)(81166007)(8936002)(4326008)(26005)(54906003)(82310400004)(426003)(40460700001)(336012)(36860700001)(2616005)(186003)(316002)(16526019)(83380400001)(36756003)(44832011)(33290500001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:14:53.9761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acb6d5e6-5098-4112-beb4-08d9bf5feb55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1750
Received-SPF: softfail client-ip=40.107.220.43;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Eric Blake <eblake@redhat.com>

When a client disconnects abruptly, but did not have any pending
requests (for example, when using nbdsh without calling h.shutdown),
we used to output the following message:

$ qemu-nbd -f raw file
$ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)'
qemu-nbd: Disconnect client, due to: Failed to read request: Unexpected end-of-file before all bytes were read

Then in commit f148ae7, we refactored nbd_receive_request() to use
nbd_read_eof(); when this returns 0, we regressed into tracing
uninitialized memory (if tracing is enabled) and reporting a
less-specific:

qemu-nbd: Disconnect client, due to: Request handling failed in intermediate state

Note that with Unix sockets, we have yet another error message,
unchanged by the 6.0 regression:

$ qemu-nbd -k /tmp/sock -f raw file
$ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.trim(1,0)'
qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe

But in all cases, the error message goes away if the client performs a
soft shutdown by using NBD_CMD_DISC, rather than a hard shutdown by
abrupt disconnect:

$ nbdsh -u 'nbd://localhost:10809' -c 'h.trim(1,0)' -c 'h.shutdown()'

This patch fixes things to avoid uninitialized memory, and in general
avoids warning about a client that does a hard shutdown when not in
the middle of a packet.  A client that aborts mid-request, or which
does not read the full server's reply, can still result in warnings,
but those are indeed much more unusual situations.

CC: qemu-stable@nongnu.org
Fixes: f148ae7d36 ("nbd/server: Quiesce coroutines on context switch", v6.0.0)
Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
[eblake: defer unrelated typo fixes to later patch]
Message-Id: <20211117170230.1128262-2-eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
(cherry picked from commit 1644cccea5c71b02b9cf8f78b780e7069a29b189)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 nbd/server.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/nbd/server.c b/nbd/server.c
index 3927f7789d..83aeed51c7 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1413,6 +1413,9 @@ static int nbd_receive_request(NBDClient *client, NBDRequest *request,
     if (ret < 0) {
         return ret;
     }
+    if (ret == 0) {
+        return -EIO;
+    }
 
     /* Request
        [ 0 ..  3]   magic   (NBD_REQUEST_MAGIC)
-- 
2.25.1


