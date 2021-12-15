Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C482C474F5C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:36:02 +0100 (CET)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIH3-000785-Ro
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHsO-0001NM-4p; Tue, 14 Dec 2021 19:10:32 -0500
Received: from mail-mw2nam12on2081.outbound.protection.outlook.com
 ([40.107.244.81]:16896 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHsL-0005VS-Jx; Tue, 14 Dec 2021 19:10:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipuXNRLRXYoWP9k0RNpj4YUNvuU4eqshppMp4Jm7QdE46qov9/2zsOoSMzWXeopgaFczbpRq57GuT+p30ax7t3Uk3S8eEA58aXVbn/feSNKv/FQslgGPvKLSqs7rCUIl6KyqdIxh3s+Y4TxIER8cy7nwVCd4nEsyUcp5H6Lzyqli5ajxRxoexKYPYISV0wmbdbpU2V+cmtZmiD5YfGRlzSw/40NoqvpfujWgGlp2NSHNmm1oyZAbX0Gf81i4Eo21c38jYdsX6BRZEJYCZqU/9VhUqmFqAwPe5TkgMZaBridnXU0IGbdBgyKnJHwI5epmmOzObi2LO1uXLqGxeEVrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X11cfneiBeTamFhEkZ/2DS9tVJ1XkSeqwyW5aXl7nE8=;
 b=geWk6/I5udrBT20f+LbEnUKyZB4Kwq9y+Iy7+WO2zD6nRcBHOtXYqBrGt9tUL14037lt1BGBQPM5UNfDPu2aXY6L4OQB82SpuGz6tfZhF0n6uFRcW2GN31Ba+VXU5LFLEHg+gnW7wQARNtrKSUdXz1tFDngGcQsML/lqcT4wXx94saNXwMqylpchubMuVwinoNHpTP9W6x8rIZ661WdcFk7m1QiWLh7Mqv6lcWUnM5PakSyjrXn/EVZXGXcszU+J/ukKjXvDykoyLGSiRjpFRPmpqzuQ4AVNmLfzAEtVqpO/ehuoLYQU5FH4Q9yzZT8s7Lkogh7TmMnYjxlZsi2/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X11cfneiBeTamFhEkZ/2DS9tVJ1XkSeqwyW5aXl7nE8=;
 b=T/Tzlzm/V2VIhdFjVAHW22hl6UBS9bOsyDY2STc9scgSgZ7qrYJ6Sz3ff13V+NpJajk7PyVazqMAahBurvfzWRNSedo4qhD7GwSugpkguCVgU6oSspdylqAV3sSumUXhYasLE8eiTnP9bS887xw8LNuA3pxpRvuRKHJDfTPkF/U=
Received: from MWHPR08CA0052.namprd08.prod.outlook.com (2603:10b6:300:c0::26)
 by BYAPR12MB2999.namprd12.prod.outlook.com (2603:10b6:a03:df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:10:25 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::ae) by MWHPR08CA0052.outlook.office365.com
 (2603:10b6:300:c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Wed, 15 Dec 2021 00:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:10:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:10:22 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Ari Sundholm <ari@tuxera.com>, Emil Karlson
 <jkarlson@tuxera.com>, Akihiko Odaki <akihiko.odaki@gmail.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 27/47] block/file-posix: Fix return value translation for AIO
 discards
Date: Tue, 14 Dec 2021 18:01:05 -0600
Message-ID: <20211215000125.378126-28-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3a3528e0-b692-4fee-e318-08d9bf5f4b19
X-MS-TrafficTypeDiagnostic: BYAPR12MB2999:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB29994B3FA7170872DBC0C5CD95769@BYAPR12MB2999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I7V4Avgkp7gBp5R4/O3n50NaKZXnoKTzW1dgMlriXmMQfrS52Bs73O9aVTM/Q67zRoUwdyDazwpguy+LXInIOggO5mp21A3uLjUtefgKK79AtEUYl7N6v0YvnP9hdxso6tXf5IVIjYtpkrmiZyIAJ4W1s+c4sUCKO/vZ4cd0SEUHYSCGtpu9KeQmoCn8X/7aba4XcEEl3EUo48/F48tI7yc8b+YPQgS6h8IcVIcNKVL/rJtWC++Hu7W0limj1HqsmmKSfChudH9lWw6/7JLRgPU6Y39/jQS7r2Gmxn5lTc2Lqr439aKoJr2oOz/nIWK4Ms4IUCFm4swnWkfZ5fqVvsPSCqXTUC8zpXpUwksafEs5uG8RQhJFJZXmnj5fHGEXndgpPl4Obno3Krzz5xuTpYcp83dDar7a5YZVg3G402NI8gJrKbI+zPwyFzgEZctYmBzJOsA0KKUX8BEaWCZAh6wWWYWMXrjWR8aWEJpFi1j7j6iQkcs3uUq7vJxg8nOdf3gpD3zkIwE6m+PE70uB12KSraG6ErMoAkHjLsLb26HiPfR37y085k7MGZD3nkaEAa7OT/u36IubmJIG0YHvRoe2uaE5WYbTiJp8A6lWEeQPVg5++NRBFUjdldvJPks2aXdKAMXLoWbRvCeo9l4eYfnySUWsWERfAeJwqvBL3T924z5zdA95Lqnd8vtFmv2bZpKYGTJhVfnpG/fsU0sKeMLFCLEhQEVkZZAdbiiL+QP9Vu52xqntJgdRyzDy9HnhkgEe1/j7GvnUFIu8Tu3iQ4e961uT9yiAZDA2DpoEOzQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36756003)(82310400004)(36860700001)(356005)(86362001)(44832011)(2906002)(2616005)(81166007)(508600001)(26005)(47076005)(5660300002)(336012)(186003)(1076003)(83380400001)(8676002)(54906003)(40460700001)(6666004)(316002)(426003)(6916009)(70206006)(4326008)(8936002)(70586007)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:10:25.0919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3528e0-b692-4fee-e318-08d9bf5f4b19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2999
Received-SPF: softfail client-ip=40.107.244.81;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

From: Ari Sundholm <ari@tuxera.com>

AIO discards regressed as a result of the following commit:
	0dfc7af2 block/file-posix: Optimize for macOS

When trying to run blkdiscard within a Linux guest, the request would
fail, with some errors in dmesg:

---- [ snip ] ----
[    4.010070] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[    4.011061] sd 2:0:0:0: [sda] tag#0 Sense Key : Aborted Command
[current]
[    4.011061] sd 2:0:0:0: [sda] tag#0 Add. Sense: I/O process
terminated
[    4.011061] sd 2:0:0:0: [sda] tag#0 CDB: Unmap/Read sub-channel 42
00 00 00 00 00 00 00 18 00
[    4.011061] blk_update_request: I/O error, dev sda, sector 0
---- [ snip ] ----

This turns out to be a result of a flaw in changes to the error value
translation logic in handle_aiocb_discard(). The default return value
may be left untranslated in some configurations, and the wrong variable
is used in one translation.

Fix both issues.

Fixes: 0dfc7af2b28 ("block/file-posix: Optimize for macOS")
Cc: qemu-stable@nongnu.org
Signed-off-by: Ari Sundholm <ari@tuxera.com>
Signed-off-by: Emil Karlson <jkarlson@tuxera.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211019110954.4170931-1-ari@tuxera.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit 13a028336f2c05e7ff47dfdaf30dfac7f4883e80)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 block/file-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1567edb3d5..dd295cfc6d 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1807,7 +1807,7 @@ static int handle_aiocb_copy_range(void *opaque)
 static int handle_aiocb_discard(void *opaque)
 {
     RawPosixAIOData *aiocb = opaque;
-    int ret = -EOPNOTSUPP;
+    int ret = -ENOTSUP;
     BDRVRawState *s = aiocb->bs->opaque;
 
     if (!s->has_discard) {
@@ -1829,7 +1829,7 @@ static int handle_aiocb_discard(void *opaque)
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
         ret = do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
                            aiocb->aio_offset, aiocb->aio_nbytes);
-        ret = translate_err(-errno);
+        ret = translate_err(ret);
 #elif defined(__APPLE__) && (__MACH__)
         fpunchhole_t fpunchhole;
         fpunchhole.fp_flags = 0;
-- 
2.25.1


