Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 092543D47EA
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:40:53 +0200 (CEST)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7Htc-00050P-41
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7Hs9-0002r2-GE; Sat, 24 Jul 2021 09:39:21 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:24064 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7Hs7-0004Sk-UW; Sat, 24 Jul 2021 09:39:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4g09TgkishxazuA4FOK52F8J8dczXf++GoYjtKzeRR4UD2lE2VivglvZWFIuFubZBDyvWX6TFZJgEMS5W6+r5ctiTRQmbO14l4PvWY/fdI9efNvlvmmI9EzYP0PKvr9jnyC9tsUI1LKSfPN3Ehh9n7oJt0KtBA5F01Uxh0hTt3GL6on0JS93X7lnni797rCRXThYtn9mOZ//nQ8VxeBPwIgyE2L++K3iTMwbkxM8uDgUE00hc8XgSpNYsknwNh7g5bE3S5s/GSgGuYDzNRVxrvIZXLFj2P19+x437sOiBdf/NYpKKTK0L6jXvEmuq494LwrnIq4HP2yFKrANRKuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLfPQBKuH9Xo7JBqruNxjx5/w8IgHlV0UgJwgxYXYcQ=;
 b=TPists4SdUcH91gfXEqsvbjiB2qQC+BHQDvexoTltX1SrvxvUGKrwQON5pwFCEemPkxTrhMeYtOH6WmLI0ZyzMD95gBV/5p/8+1CqveV+zf8pXkFp3A+cd70CKN6uAFoE1zGs46CJFpW5oXNIKFkO+9gJiwOrsMvD7fEycwFILbVW584FIK3OFe9TWSkxjeLx9r2KrYTQ/PLfrMSnOa2+wRxgrSW3aJ7FhxDhhBbJpkf4MzhqHTkNd0PR7oDL6yOBXSmTig1+eoTgKqxeBqbPa/GFDu53odgqP4ti8uuzrHZQCEwVsdFVvOZ3xl7k+Was0KMBsTIItuceDMrRfEzGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLfPQBKuH9Xo7JBqruNxjx5/w8IgHlV0UgJwgxYXYcQ=;
 b=PFROV87KjniN3k2ruWFoyP0bffE+/GPEV4k17pUfa+eWjaYVUuvOYGaCCEgzkcuKpgRE6nato8QTwKwZAzTWGtdCHaLWI0Ad595v1RfsWs7YA/FZphWgXnMdstP15eEfJOdF9AsD5sZztJuEgzkO1UJqDDVetrrt7GPXhhY+hq8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Sat, 24 Jul
 2021 13:39:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 13:39:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 2/3] qcow2: refactor handle_dependencies() loop body
Date: Sat, 24 Jul 2021 16:38:45 +0300
Message-Id: <20210724133846.64614-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210724133846.64614-1-vsementsov@virtuozzo.com>
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0200.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0200.eurprd05.prod.outlook.com (2603:10a6:3:f9::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Sat, 24 Jul 2021 13:39:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79262717-9c88-46ee-9bb4-08d94ea86adb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6805DACEB88752E5B393DA78C1E69@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:134;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ZXqNeDkB0k9sc4UnP1BDzQ+fKubo3vgFFa5XdRdgrQ9TwOWySMWO20nkpF476COtDtqib39kmBhEEiBrDMT5hCwbveQ45TVqgh5s4pdFqTXjygkyaRzftlsXjFr+9xHHYeSqMYRXOaxnPAdg+5HiAbGbzECFoX8fIhEo3F1mJ691GiqIZW9dRGpKqY0MshULYu33EA6uhJv0oD+GxoMT1vtc8crT9TXBXeX9/R6apPFBBJNJrrG2WSkS9aWtzMpanegS+YA/RtGafBp/VwrObbmKr9ddx5xhNu9bbhWcFYwnQ2hRNmh3ma5Q6GKRDpE1ZY5Ie/Ugti/9u4ERWNht4o7qAb6s2+d4x9GYc42wJb2RjxCnRGJL1HxDV3lBVZxfyqILPPlXoJK2371yfwNE1BS+ZS9GiuUca0HsSqV9bSdWmmqIQGZ4nwv9ULBB0GfBSY2Jtw+KPi/Aw+1N+A3uqOxBBVQMpRPrCeIi31BjmJspzrEIEGMnn8KoQdNJWShvbgX+Bjr9p7tZGGrAAiJlETz7XWvc5cK/Se70BFjIkO+xQHTpgWeNdTdkzHhM57zm7gVljnWo8Y35VXzXhQihlGkb7TZqo9DGNsMEeRbwkaise+FCOTIq/cWvj/7l+0HX///EC+3sdVRV+EsDlIhHDi7PciHN9N+8c1Nud6ngWS3vlMgIT+hoo6dIRXTheJDfokgD0iV/ay/xNHH2ROqCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(39830400003)(376002)(478600001)(186003)(6486002)(66946007)(8676002)(6506007)(5660300002)(956004)(2616005)(66556008)(8936002)(66476007)(6666004)(36756003)(2906002)(6512007)(6916009)(26005)(86362001)(4326008)(1076003)(316002)(52116002)(107886003)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?17Zlsz5OA4gkftBLAnEmLqrVoZvAvZ6m3AtfyVR/3Ig84v8TA+tEJ3EiMr94?=
 =?us-ascii?Q?FowFD2SeJoKWe2tCA0bbd+RiQzFNnTnQe0IxwJ9pZ74nl7xqKY7xCOibzXmU?=
 =?us-ascii?Q?xXiHevIx8dd9K0OISdmtDbXBinMRkZSvrUfzOZ35uV7bTLNlUS/rB0Uoo8S9?=
 =?us-ascii?Q?nR5ypoJOChCc7sDF/SgKhgkBShH4RJeOZ3m8wW0sapjcxmPjx0AUqkHCx6Nz?=
 =?us-ascii?Q?ClOmADrztg+pI6virJYWEPTiJ4PzO4lnIxfu/zDqhf5nk0hFnCXNY+0UeoXD?=
 =?us-ascii?Q?TLpQkCRK5osLaltpnWaeV0SkYZkIKbhXz9KS2HaXKCWbAQV7EvcJjMvOauuV?=
 =?us-ascii?Q?MoyAEVWK1vegrj6amL0s732F7UMidyi5t8b3/ayDKwxfxDVGDDW/sK34h09/?=
 =?us-ascii?Q?pS3LVcLPnN3b7cMsEf5S775GuvZsq8wgPxQGBcrYTQZmAsuqWw4VQkC/eyQ/?=
 =?us-ascii?Q?9INKpT9eoSTmWHE7UAf93VD9bXOoMnUmeIo0118W2NG2zPKgWmaAeUjMD+8f?=
 =?us-ascii?Q?fFsdKn1wNZv7HYMejxXhYC6Zn1nxM890sC/0L5dYrOP47sgBrJpm8nuTB1CR?=
 =?us-ascii?Q?rOU5XFuKcCT6x6Ye8Dozb7mb56hHQ5VkJKSJ6AKqK6FNTAhrm24cjJHojU+5?=
 =?us-ascii?Q?wLpgritDCCMgjls5mIRrN52irkvnwSutfJ9W5JXaTr8f6DlQZef7AdWxqMUJ?=
 =?us-ascii?Q?LMQ49TuuF8xrvvM5UIAOBoLoJ1JuSzChD7rRa0mmS5Eh+hPCPcUTTbeFkkq5?=
 =?us-ascii?Q?uMEHAXQoUa/LZSk22b4qJZo+RgoT6tDaLM10LxhZqqbHmgmRpjJmZlZFSeIG?=
 =?us-ascii?Q?GQ8yeNwMX7SbSdMooagdGaybjYEi+EYp/LQnsWv6n2MDlqY1xcN9RpMvDLPb?=
 =?us-ascii?Q?OonRoAmAgF0okuLigVQ9oWKO0K8POAPlBYezx+nrmsD4BpjyyU3+pLssVdNi?=
 =?us-ascii?Q?E5tXThz0jVc6LmcSQYEDr/7ZkNLHUn8Rzn2E9hpRoKFAkQ90IDzFPdr58Rcz?=
 =?us-ascii?Q?lvLHlKA2VdVkla0/Gv0mDF7JF9bSxLwx8mbCpyWks9us6FMGzxdIZ1+Fv43c?=
 =?us-ascii?Q?PyXN25OvGu7+/fp+Vfpz2UeksdZ/yYb749eA2KUiABemI6u75gwCVgWw5x/Z?=
 =?us-ascii?Q?LizzI9SbHH/C5Y2JVnGYsFZNngpLntfUGyk0K0RoCxcOzzSts10qP7yT+2bn?=
 =?us-ascii?Q?bUzVz5xY4yawln+MahI0c0u5jymCSQRpxLJfdXv5fo9NUPNcnVdsDbWKJlHf?=
 =?us-ascii?Q?yLVWhgqalMResuBvFU7g5J8S78esS4Ld2abVoWMSBEyKjLWrWA3bHPyombRS?=
 =?us-ascii?Q?yTCdLJnBy+b/4s35xUoZalyA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79262717-9c88-46ee-9bb4-08d94ea86adb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 13:39:10.5129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQo1g9/RlBvY+XkIB7SKmBPQUYQT/rONUm6PXXc55bPlnXzNPaZ2d4Ftj8GqbfN7FT9OwS0G0vOarSfQzlvEczSV+wt6XkO5SLuju44luLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

No logic change, just prepare for the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-cluster.c | 49 ++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..967121c7e6 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1400,29 +1400,36 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
 
         if (end <= old_start || start >= old_end) {
             /* No intersection */
-        } else {
-            if (start < old_start) {
-                /* Stop at the start of a running allocation */
-                bytes = old_start - start;
-            } else {
-                bytes = 0;
-            }
+            continue;
+        }
 
-            /* Stop if already an l2meta exists. After yielding, it wouldn't
-             * be valid any more, so we'd have to clean up the old L2Metas
-             * and deal with requests depending on them before starting to
-             * gather new ones. Not worth the trouble. */
-            if (bytes == 0 && *m) {
-                *cur_bytes = 0;
-                return 0;
-            }
+        /* Conflict */
 
-            if (bytes == 0) {
-                /* Wait for the dependency to complete. We need to recheck
-                 * the free/allocated clusters when we continue. */
-                qemu_co_queue_wait(&old_alloc->dependent_requests, &s->lock);
-                return -EAGAIN;
-            }
+        if (start < old_start) {
+            /* Stop at the start of a running allocation */
+            bytes = old_start - start;
+        } else {
+            bytes = 0;
+        }
+
+        /*
+         * Stop if already an l2meta exists. After yielding, it wouldn't
+         * be valid any more, so we'd have to clean up the old L2Metas
+         * and deal with requests depending on them before starting to
+         * gather new ones. Not worth the trouble.
+         */
+        if (bytes == 0 && *m) {
+            *cur_bytes = 0;
+            return 0;
+        }
+
+        if (bytes == 0) {
+            /*
+             * Wait for the dependency to complete. We need to recheck
+             * the free/allocated clusters when we continue.
+             */
+            qemu_co_queue_wait(&old_alloc->dependent_requests, &s->lock);
+            return -EAGAIN;
         }
     }
 
-- 
2.29.2


