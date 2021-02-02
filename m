Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144F30BF12
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:11:35 +0100 (CET)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vSw-0005Jl-51
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v91-0001gm-M0; Tue, 02 Feb 2021 07:50:59 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:42944 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8z-0001yT-Lz; Tue, 02 Feb 2021 07:50:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU+IUp/pC23w/BZtBVfoowcfemW/XHIKKchRmPDR1WcKBphlUVAY545oDDu8F0KUhdgMmQTDqmYNs7XeAmw5Wb8XupNM6xBmFlRuE33y/JABTD6p78u7SP6b4hCg2FJ7sGJSxqmuDUqRQiS3bb1ocbcd/SEPUGvJomoRlouMlvKnUOdBJi+U6WA0X5e5MtaZNq2+0VKl7WRnr2BaDgApNh/10jNa7quHpR+kdl/MjqGWu7xRBtAU1YbFBiK5uSLzKXa3CcCWbeRrJCF5b1yVZ7QcThzT2RJuzDgtx66dkCIakcBWF2/pFw2L3zNfliziuSjPtxZnqr52wv3nonA50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83GlCXkaxacMXgNIB425cxfYzkCiaetQsIeCxDT5l3w=;
 b=b5kYpfMBtKvsOnbst+su/pqKLsHWVDAeAK4+ZZ/u5zMnzL1XBE4W0ltJXtALMJrcXYtAt7eIbuETZIKFTT19OiN/zH0rwuM8CX1UrnqN3TscXzv+3XQrZWHmmnl9NcrBUgUDBDjgEaPrcJA33kZ02iwi7Kz0y0fqWOJ9y0K3A+8ZBw1yVL+idHbHJRjBLT4avDVfhqCMWixYK5b3TGQ8vFlq4kPu1nrtxoffjz/hJ8eXKzvcZvLlNh/zibHwCzPNLqIUwmjo7w1XJ8fEq1LzOBswZX58ROlKmnWgJKZ3oYyFdciHrC9qiPTF19sKjIVILpIXcfPnVzn7VZRK9hOOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83GlCXkaxacMXgNIB425cxfYzkCiaetQsIeCxDT5l3w=;
 b=iMB2IPyVMBzKOYF556CBBDrhcWLZZ4iBUQsjrNiEUE9QtN0HjpKCrBAsEh5sJJTUjZWFmzP2R3leYyNYAH8PJu5E0nSA6DVvjyOFruRO34QgvSHcE+ED7Veknghf7MNHpsxp8oNI1Qn2hLujJ2lG8EWB+yhfPHDTwco4PUEMXLA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 12:50:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 11/14] block/qcow2: read_cache_sizes: return status value
Date: Tue,  2 Feb 2021 15:49:53 +0300
Message-Id: <20210202124956.63146-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f52ac95-8006-4391-7340-08d8c779278c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354476D5FB91149FC0DE3AC7C1B59@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mH2FtZE9WqvGW/i1nzunucidXlWPEnl0AfdOX4FJ/IDmtwzCJPUVpJUspmcoQFTRn0eUvCKSsmHA6D410CtnQS7vezwUn/eqWqEDFENv1pWWBapc0ryOMn43Yv4KSM6/NvPmKAdsfOo8lCuhc9gz+tARvfRyvC62l6fWw+618R+RHi4wlxYcZzQuKA48WirubFxE1cxndKnVmrrkek+X+9+bpoDGxlnqk43CErlSTJldk9/NdzhXXkAHMPDPh+/WAMsirJYyRoDUaVccXPiA1+OE2pakKcGHlf3Fo29jVoOInPW/2+UelVWRtpMjGasMPDCdks1M2WxnRfeAOxYkL57GUjWHdEmT86uWpRMnLoAusHj1pmEtLY1vtOiIKFHpoJb5K+d4CAnXn+HqO8F6JJaodv/XRSEDNccvZSTZyGWZEK2XA9ZLLujjY6eRlrzQsbfhQ6ljFWzOt2/9/mnoQMGWsxF4j0Ee2SCZfgXUYQXc/Q0KF3RpcocFZzRKwNS+3t9PH1wHIqRmOH5riJFjyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(478600001)(956004)(186003)(26005)(86362001)(4326008)(5660300002)(83380400001)(8936002)(6506007)(8676002)(66476007)(2906002)(6916009)(2616005)(1076003)(66946007)(66556008)(6666004)(316002)(36756003)(7416002)(52116002)(6486002)(16526019)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2+t63xZAQox3Eb/Xqb5xFf3LkaOzapYgYX0ck/7TMVPCorlWuUixRvhz61Ar?=
 =?us-ascii?Q?7r8Nutkaz19lV2dVMx6ERz2/z827DkSCOX7FAcg5yyVMF3y9ymlJ0VyBQ4YQ?=
 =?us-ascii?Q?4CPXcRsy0dKo44oBtOmr6rV4as+/zc57I7Sg/KF56C8BzS0LxlSffFIoeGRO?=
 =?us-ascii?Q?Z+7+qy5uG6WzoIjGgKPSB9nekQg1UHlhjJHOdAnE1jFBS3rkrNgpk3eDn/xq?=
 =?us-ascii?Q?btXJaef6iBWz/NtOE5d2vOVPCleoqO+jl0VO/yGyLibG9hynjGDXh+9z4ETm?=
 =?us-ascii?Q?cfIM4HSL/+wNuU7LeESPU3sc9Y57u5ObAZ7RU9BoDBOSvIaC83CFvSLfY/ZT?=
 =?us-ascii?Q?yGCYLE4HVaASc4knuP1MZAYxOl85STQE58PCv2g64J5RJFu50e/+zA8QZizm?=
 =?us-ascii?Q?pfDTBUEFvfuvcybp9/lWeXKh/5o5Sdh0ASM8mYeUY3vZbYKQk3ZnKevG+9Zo?=
 =?us-ascii?Q?AWD6K6VnX+QrgCUTHcUe4l7qf8LKl6RGh66A7sK57MeQ+Ph66nqaRGlORrHf?=
 =?us-ascii?Q?T1qDzReChZ+yCky28VCV0LS7ofua16hHzWYHTr9nde/5lyFaV8VihlTPs4tV?=
 =?us-ascii?Q?SpHL6m0xABXlLWCnGGCD4zOaonK+FGOTbqHHAZIbZB6fXRIgDTeJ/ZfHLTuU?=
 =?us-ascii?Q?5Q7xTs59pnNOqbiHBHsALT6YcJSYkqYL+5YwV4rXsRz07vJjl4DILAJUgl4/?=
 =?us-ascii?Q?2c4KTAA+HZDOOTTmaUrAOhiUaTc4bolH4ssmWqk8mUHJ9tMsj6j/bVOzBii3?=
 =?us-ascii?Q?cj6YtmV6ChCMyCWMsc0NrvHUYBOvUtFGrJ4jqzP8uQc9/FY9aSEfjO/uv5Lv?=
 =?us-ascii?Q?EBNCocjlSJuen/J66b2cuI1Kpw61Jlvhv3HohjESZWhlGv6a3xslI8F0zDJ1?=
 =?us-ascii?Q?9yDEIJOFJJTJ9fQ4ooXyZ4EhCOrUxz2HkHmqEigqDIZt1Bt4nNsTmgEstZB0?=
 =?us-ascii?Q?WkEgiFKbp8fV05wESJbs/Ch1DPi/0T3Oi73R5zr/E8w5zwyEfL+IoTeb+8kZ?=
 =?us-ascii?Q?akcL3WckmYNHbcVbJiDnaapEDgV1yQdk1Xnm/oY1ERnrNSZ6RK11X+3CIJq3?=
 =?us-ascii?Q?aPQ/7uAI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f52ac95-8006-4391-7340-08d8c779278c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:44.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkYxhCG/CRZbd7171h+r5gM6Xa2DpDm/tqNDgj1B2cQh2x8IS2SXtDbzfFrzvcjWdEh86Az8/EfVkVVpUEzc5+0W+hMbKl258PG1dT3HHQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.20.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's better to return status together with setting errp. It allows to
reduce error propagation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 20d67bd9c7..2e0e050997 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -868,7 +868,7 @@ static void qcow2_attach_aio_context(BlockDriverState *bs,
     cache_clean_timer_init(bs, new_context);
 }
 
-static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
+static bool read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
                              uint64_t *l2_cache_size,
                              uint64_t *l2_cache_entry_size,
                              uint64_t *refcount_cache_size, Error **errp)
@@ -906,16 +906,16 @@ static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
             error_setg(errp, QCOW2_OPT_CACHE_SIZE ", " QCOW2_OPT_L2_CACHE_SIZE
                        " and " QCOW2_OPT_REFCOUNT_CACHE_SIZE " may not be set "
                        "at the same time");
-            return;
+            return false;
         } else if (l2_cache_size_set &&
                    (l2_cache_max_setting > combined_cache_size)) {
             error_setg(errp, QCOW2_OPT_L2_CACHE_SIZE " may not exceed "
                        QCOW2_OPT_CACHE_SIZE);
-            return;
+            return false;
         } else if (*refcount_cache_size > combined_cache_size) {
             error_setg(errp, QCOW2_OPT_REFCOUNT_CACHE_SIZE " may not exceed "
                        QCOW2_OPT_CACHE_SIZE);
-            return;
+            return false;
         }
 
         if (l2_cache_size_set) {
@@ -954,8 +954,10 @@ static void read_cache_sizes(BlockDriverState *bs, QemuOpts *opts,
         error_setg(errp, "L2 cache entry size must be a power of two "
                    "between %d and the cluster size (%d)",
                    1 << MIN_CLUSTER_BITS, s->cluster_size);
-        return;
+        return false;
     }
+
+    return true;
 }
 
 typedef struct Qcow2ReopenState {
@@ -982,7 +984,6 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
     int i;
     const char *encryptfmt;
     QDict *encryptopts = NULL;
-    Error *local_err = NULL;
     int ret;
 
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
@@ -995,10 +996,8 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
     }
 
     /* get L2 table/refcount block cache size from command line options */
-    read_cache_sizes(bs, opts, &l2_cache_size, &l2_cache_entry_size,
-                     &refcount_cache_size, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!read_cache_sizes(bs, opts, &l2_cache_size, &l2_cache_entry_size,
+                          &refcount_cache_size, errp)) {
         ret = -EINVAL;
         goto fail;
     }
-- 
2.29.2


