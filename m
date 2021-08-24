Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25DE3F5BE4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:20:13 +0200 (CEST)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITXL-0004o6-R5
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITT7-0002ld-O9; Tue, 24 Aug 2021 06:15:46 -0400
Received: from mail-am6eur05on2091.outbound.protection.outlook.com
 ([40.107.22.91]:59744 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITT6-00055n-7v; Tue, 24 Aug 2021 06:15:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp6U0CZqa7bI4Cd2bJakaKU+AitgobEtZlEWQi7uLvOlSpFa0TjE/PwjmSpA0OdhAhR3Odh8Zc6+Ok6ek4Epqw5sGok3h7T+0BlI4V2LnUTj6WMK5sbdwV9gkJ1jB4vAbyCwoytm6bIdvkhE9rhcYZ1fxpa77X7gok7jp7h2dvQbcg+rn1Jp5eePBINM4A724Gaf+LhFw0AAtzhO+umIyXLrh7+agPWJvTUHCudBpsR4IiE9RXJaq9z6G2dzu0NJHDtU3OGCaKiQOfRUicfKMv/TA9CDhqCnk8knT/Vhw6Qjsm/BsNDm8K69mnPvtbUmP+SUvoqEmXAb60FqnxXcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw2EpU0uol72ORxoZAKrL4Rp7CPVgaUDPLaqQSFbaG0=;
 b=lUZo/4PeZDPbkLyaI50PLIka/t9Xm4jpx895a8xTqNCR8cBk/tI7Fp7uqaTow5CxCcHif03geo4C7SQ40y56Rnsd4ojZy17r9RpvcK4X6M3GJwcztcEG5Qx83Y1jInT9tSpluxIv7JCPNajUWIwxVcxG8yHSuJxX0uvdb9q2DS9gBj64EVZ3gYtSymTHy8Y+iXliilOxm7tt8Br9SF8pQhQkra5WVYhaiwoT/BmXumurqFixNypXvz0BaVHUNd+qVfC3D+cAJJb5Q+1xj9oNCtUnKxCpi3fBwU+M9gi9RL3RihiJP1kCBSZvJ+I+dKJ4mn7rNsl6KVJh16e3P0BEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hw2EpU0uol72ORxoZAKrL4Rp7CPVgaUDPLaqQSFbaG0=;
 b=ZTxAnRy1IccHS93Xpt9sKRAjENi8XJrxeQxjNI8o/qf7ZKrQU81jDt1Lwko2SNTl7HMPD7eIsvlyMt3ye4Vq/NzsWgpTs+VkhGgskZ9YRrdgdw8F/mvNb3oxlDQMft1EXifrx3tpmxVjszZTmC7axbTQMBmFiOTVMJ5Yq1gp3ZU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 10:15:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 10:15:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH v2 2/3] qcow2: refactor handle_dependencies() loop body
Date: Tue, 24 Aug 2021 13:15:16 +0300
Message-Id: <20210824101517.59802-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824101517.59802-1-vsementsov@virtuozzo.com>
References: <20210824101517.59802-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0102CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 10:15:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c68e32e-9fa0-438a-61f5-08d966e81b5d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2099B4406995F0877897C6E0C1C59@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:134;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zp8Rohcfnn5cSeFrFkLK+WxBHKQri/gex3kC22wUTQkvAJlir8MEd0BVWqIFd3ueaMylMRSY7bgcYmn4nmATbOCKpNWmk9kHawgkRROYCCWPqKcLqF9kxvSkXggJr8E0xPGJ7NvsiUYifRxE+OkxicrZsiogY2TWNJAegER2qICjX86QS8fRGfekkDleZJ/ebcteHdwGibxulLL3OSMLULK3f7JWRi/vQaCDJTWBdxF4ykM0p19OwdQy29K9glvgrwoTeqtiHk4jesoHP4VYh1YjTewWb6Tcnvxuoi5duZ/QhO2qdC6m2FkrA8s82C1FdiMJfXq+F2WkaBjhM8oZ0pXY4VLNbqz9X1Da5GUO6UAaD2nmA1q3nKKHPJDCFet/ylLGseu2PEAj6v0uR/nrhd0sCqN5Lo8os3HP2zXwpvN716FtTT10Cli5TXCmmP12wz11hCfmCI06fp7g0Xk98qG//NgtR9W7L+pyt7tKZgnozfy4dN5DknGS8SwoK6zapdFZYk3+jldtcVHgEhXPsHqzNXncK4iBGi+bcMQEtPQCJ1KwzyRXYYLSjr00hMrtsrhE9C7LaNljCpSayn8qbJThbYzGtXvJwXr5nM07UkIdKj6q6afDtBbnt0neSWCdpZxalCyN3KRvmdCV3UCQKMH7YiXNawii8dOmIyrGdAFex8ZOKbDADAtaSgjY7TtgJn756IKuL7s4X8NkoHp67g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(956004)(26005)(5660300002)(8676002)(2906002)(186003)(4326008)(6916009)(1076003)(83380400001)(2616005)(478600001)(6666004)(316002)(6506007)(38350700002)(38100700002)(6512007)(86362001)(6486002)(66946007)(52116002)(66476007)(66556008)(8936002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rs0XLTSPOL8nsiK1qwrcMmwRBim50sHIo7I67Hp9ZGOWzzDNWOmudEVclk9v?=
 =?us-ascii?Q?W+dcla3b0yFJp/txwvmsikg5A2csp258CzIhOr2pXkyQOKOHypCz2VqiN099?=
 =?us-ascii?Q?xVMdhuucqVEucFaHPCtK0HGGvBsHO/n9N4yO+9/rYsiSh4izasvupOuTvoTG?=
 =?us-ascii?Q?MTWEXypVU1t7xx9DRZSiNIzF7dYbiZB4WdH0g1HPy4ToRvOiGrLuwI/nDnOP?=
 =?us-ascii?Q?AQzVnkipVZYcM8APi5Bb1eGva9XXnaLOxz3EBFFGpSXxyfBVm+Gb9h9ZaU3/?=
 =?us-ascii?Q?LbJURlw5RSKAOlv3AVGPzeDLIolYC3AZWfpWSiWpzRFJtP7sL0z4Exeuuq+F?=
 =?us-ascii?Q?Z4zD/kbU08Z1e/+NpMH3MGO2e3Od1XvcdfN6l6UDyD1y25dvSQxk+0uEF0Tg?=
 =?us-ascii?Q?BzFu7S4PPk8LuIIbDwGxCyKxX7wfVyDU6Q2k3Y3IW1zClGPqQEFQCDtb3VQj?=
 =?us-ascii?Q?W9nHgpNyvzNi4+WktmjhLL4aiuChdwyPqMtx/HkZQt0FYro+skgqnOJ82qAC?=
 =?us-ascii?Q?kgRAD4RJ07dt5zanymLABY3c4G9cHNC3zhmD/D9yKxtsz9yO2LAryrzwTE6c?=
 =?us-ascii?Q?WAeVyGa0cP7/rf8Uh5/gbWo7UapUVjb2G5/aEL0rByrYlSuxXhd3zTCBy3aZ?=
 =?us-ascii?Q?wn4zrt1XC92YmK3Ihr3ddj6amkUBat9baFZHqTKNdL2NoKog14HFm0wJaYPw?=
 =?us-ascii?Q?9k+FgCpkNEYLygVr8FW1Y1nbMxpmotTH8xLF8iF+KFWqQC3YWsrv3aaEfUyk?=
 =?us-ascii?Q?ZJDwo9YMgQ5RyEewuQwMfaV2EYiimxgL/JZYnEWo6hh2ocJk1iQ+zgIGQIH+?=
 =?us-ascii?Q?eZeJap4qkWEjwg2yzpdIghjJNc1dvHzxu7SbFiEslHKyVmvZ3PN1VHArxvzv?=
 =?us-ascii?Q?/Lfov9vDLyB1EV6etJp7dd8uFLkYqQZ0Wi6mbRTRn0dAlq6FdeYuoOTXiMjR?=
 =?us-ascii?Q?nZQpIZZekHNyFtDSG7tx74a70UjIx0lPDHXgFhENyf7nbV8YMHfUaodM0ZQF?=
 =?us-ascii?Q?D7KQZy1+s2aDIT2Y/BNF4oIr+yNssommutub+VCRl9dB0hyLxZjHnlo4GI8o?=
 =?us-ascii?Q?mIQJR6YnbGN6TMBZsdjAIQsxXm9kq2iAHYRiRJs/BdEJR3oAUW3gxXSMAxyP?=
 =?us-ascii?Q?BDVR/1Jayp2Zrjdoc074C3bWi2QR9MRF/UzdqPeZfXZqwq6hn+LyK7XWxzKm?=
 =?us-ascii?Q?XE6e9CK0Wut3LP6oS8Qcytvew2FJ6bLySsTohMjy6D+YOWTvlBFCrTK4khTl?=
 =?us-ascii?Q?/OK+AIiRPqu5BlCFw1QRqUcR1qiKAV47aJwaM85Jx1Efj0kYd9X02tzvLfub?=
 =?us-ascii?Q?rc1YWowpQHURSu2SUv8/ZSzv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c68e32e-9fa0-438a-61f5-08d966e81b5d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 10:15:32.8650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1e6XKzPvhIhvj+vKe4FdZNKyA6pvXvs9FKE3OGdBxH3idkyTPj4ehseQCHO3D/O4RDG51RFvfWumV2wF++hrq5b51ofpl0V5YfU+samR1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.22.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

No logic change, just prepare for the following commit. While being
here do also small grammar fix in a comment.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-cluster.c | 49 ++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..9917e5c28c 100644
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
+         * Stop if an l2meta already exists. After yielding, it wouldn't
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


