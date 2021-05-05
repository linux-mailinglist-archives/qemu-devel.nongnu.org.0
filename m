Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23537355B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:08:26 +0200 (CEST)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBdx-0007bn-FC
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWP-0007ze-3o; Wed, 05 May 2021 03:00:37 -0400
Received: from mail-eopbgr70123.outbound.protection.outlook.com
 ([40.107.7.123]:51520 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBWM-0005wK-G9; Wed, 05 May 2021 03:00:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRsO884vj1xRiF5M2DHVEHSdEqqtUfcnXJoeXf0CmYeeRUVp6wXzzclQNaOuvki4auFbnHn7SS70+K3aNtweNTtqV8ISzFLjST8KTcJ5jcAbaM9fhHBlaCxswLjN/DxS7OjV/tG+KO741v6yBGUVtBtJoRElqPk4zHnv84XefFi8nL6sBK18vpmx57zMNHDbxWw8o6x06/+kScP87NUSqIttw6ZcmUp+TNz4fiKjjxpOgRd4DHe+a0hqCw4ZlU5FzqmXBxuur8kAV7VLgqj1vXBsyJf8Wl2o+rqWLpwS1HzDZtbH5xiM1HFQ5Z78OOKeuyMzcLGQ3v3Deu8B1Nsurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G5WyvaOES8B0BFYc4c2ilE8vSVWNgDmBbr9RbU8j3s=;
 b=EID0P05LBjOUvDZ252buSsgX1UWi10wK6SqY1LVnjSmjaiizZ1rsNSjPU6kHqh0EYk6fdzbJwoY16G1y1Dn+Rqr9GktDdvzT/X41zn94Efy9PJbocJ9OhbepFP9rW75xxn/KFBmAIj5sjFUS5lbP0NW7Noegf04UYX037zYDmqh46u9knBCum88ItgS3nEwNF6cyZBOiCh5mYGN2z1T5dWbTJBhNWCdFSmtZa7GBUHBfm2mRsdlliWmiVR6sLnWsNEhIwCX4c8b44ULUp/FN2u2egbL9ILB4L0aoBUTrPCTfmyQQx1IqB1cms+LjhWH8/PceZtika7twH0e2XPn0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G5WyvaOES8B0BFYc4c2ilE8vSVWNgDmBbr9RbU8j3s=;
 b=kzVInrbJVLlRkaO/sipJpRIjUy87tcSfpcZEakadqAUHQpS056+bjfnhVH+Gx5+RcZRN5Oq0b8c5A1rmT3Xx7t1tYWAygBh+/OKJplMh8mRe0Ja1lwjcJAWpk7wJ8d759Va3+mO7wbN060N8yf0llMFUVHg9m8pCjEfXXRh3FMo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 08/10] qcow2-refcount: improve style of check_refcounts_l1()
Date: Wed,  5 May 2021 09:59:53 +0300
Message-Id: <20210505065955.13964-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505065955.13964-1-vsementsov@virtuozzo.com>
References: <20210505065955.13964-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 07:00:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f19caea-24cc-4b30-5727-08d90f937228
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16524836F027DD9257C14C62C1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c1CqgH7Qj0p8q5+0BbDARd2BXKWiaLAsrHyKKYwd4mRqdEr1X0MrW8Qvld49Pp1D9mL0PNhhD9uSb4ktnuMT1OIJhnQ50wIIS0zKle9LlkoYGu3p5xGBNofyKYMNlM+QbFiooQsFhZaDJFhM+02XCYZNRynUlLxCpwc9QzC2iDF+AgJ0mi51b8e9vvkXPuW8D76zUJmhP7utp2YS+oeembA237OkfGaXG3c0jjdPENpRftpWZSzIQFJockeYDmpcxlmfmMzvuEmB1nmwRj09Mpqy0izSE4J76ibDoWkEOqcRaG9MArLne0oiJ3gsE0JbixC2GXZCKr98kSdz9yD6Y5OfN6tZFnneB4JACGU0q5YZc1ze43JGI7qv1KhdociA612/kvzUmlYTMv5ZHTkXzFPj9dJcPe2vzzhBPmpCcc4G4uSPLugY39FVFU6fcawvKIeBhBHK4AXRZu71swYwLs1oDRpj8KwRI42nqxd+WTokyVIVbneVAFEiEbQINfjvi88q9lX+g4xLlT76Ts7bIUxLoFYGJWOC1oK5vvCMvs99GgiGHut0aP1O1FeIQ+6V5dbKFIUNvjME1Un9G7YKemiobIhAwxQXYLqrKCuVcqSxSpc7U+Pd+wvN19MR+8vMu/CUMgrCui7HGjRJqphsvKm6i5ca83272UNFsHWl7WRD8u0T8qqwTQQQmZOSnhMq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PnkjXkb7TCRA54IIW+Eq+Q//hi5mm2v0Q9fqo2Ekr4aNI1i/s+/lYX6A8A00?=
 =?us-ascii?Q?D1Iz2JmtyOgUc6myme26EEYkfjxbv7whHseooktdq6ORnsHD+G5yCC3M/s94?=
 =?us-ascii?Q?wzlPSD8y+plCPaJs2whhHdzoscqlhQg+fcYvsajQ0ctfkil5jITi2zFoAxL3?=
 =?us-ascii?Q?+rj3RL07qLENmPnnwJU7Pju+ELChL2sf0/AcM0HnS7UHgs++YfWqHQWjAHJV?=
 =?us-ascii?Q?7r8CtRNaFE1WiluKD9Kg95Ycikgzu5nSJBqmBZedHU/WgeQT3MDqtN/uPbKR?=
 =?us-ascii?Q?0Rf66AdAXiIU3NpgO3XkNneIZMzRy5C/UY6T78+pQQD82k3E2H9yYB77U8F5?=
 =?us-ascii?Q?XF0tc+33GrwIVQpoIOnosE29r3EiaHoDTDsgUEVO30jOh8hbm6OvB/ihyOcl?=
 =?us-ascii?Q?QxG303sa1w+RFI0dfT7/R2FuNEvJYRAvkCMkuW8xJf+tALnJm878Pid+hq1N?=
 =?us-ascii?Q?TllX7NZwyIA5XDOQHn2uYk4aBEXnzr1Ulest0iPNssIbjaslqcNoud60upRE?=
 =?us-ascii?Q?2Ji8ElFUqUdIeRwf1BlVibAeAzhrcy9yF6VHUtMWDH+cqDiVS+Q+tPLPVSa/?=
 =?us-ascii?Q?Jj5SCm+EJn+4NvN3CIq+WKdJCIws60xJdSbDWV+oiYI20fmImdIoed+56/8O?=
 =?us-ascii?Q?XJ+aHyFqlfQQtp7J7MMPILPF1bp7dHBRhDEe2iM9+WMQ7zbEuUEhi7IHbfSN?=
 =?us-ascii?Q?fl12HswtjSqSHg8ffnnK+leDXlVHAIj7UwTGic6WDa9o7Z5dg8NuVtLxwa0I?=
 =?us-ascii?Q?Y3un/gMJ9LuqqQ9Nc/J7s6TRbP2vi/cHx1sRZPHX1WH0bY4hBiultetvvCHb?=
 =?us-ascii?Q?NLUXvvTZVZGJIx+ebvL866BnxtMV456UJAuVzxkNqJJlHXcByC5gklY9MX4z?=
 =?us-ascii?Q?a6D08D3+jJI4b0woaJ/M+vDG/xdg0cKE+WWUNYWsP4jFmTVNqIT4W7rpzi3Y?=
 =?us-ascii?Q?TD9rdCPUxfLGQ2Ms4/4KT4mx4TpCbaC7JwRlWsFAcVxI7yjW/fr47Nef4Jxo?=
 =?us-ascii?Q?qPwOL0owv7C+TLEOk6rGKy0xSR5XSz30BpcvPxAtX8hkxBTjSVvfLEShO9tt?=
 =?us-ascii?Q?dgrWTQOtfE4ytqCKBT6cezuHIa3yuZdDRNMImeQSLJ143ZCQNjXj07VDAQpZ?=
 =?us-ascii?Q?seMwhx/yeRS5jJ793daVG/7j50bqBxLSfkEOPp349AN7CdmEr8HawgAW8j/k?=
 =?us-ascii?Q?aENOiPV5HfSJjuI2f4Oa8g2RqNfzeKaf8+s3LNVJfhBph6llqVQNm23cv9aQ?=
 =?us-ascii?Q?zmISBPukfHNMpWCzgEu9uv7rZIE1869aZjcyG9EetW0Hf8nLAyahccBOLBYb?=
 =?us-ascii?Q?e62f9ejbtXr/h9lfzizPe3dp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f19caea-24cc-4b30-5727-08d90f937228
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:20.0586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29J3+5BYleDu+W7f8FJEGL4i7bVc8+KETGsTB488m5ShuYyNnrTviD0Ege9e/RDUcn9IuPx1nnCr268kge2pbvCcxSvAKQokpLPVdfzqogM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

 - use g_autofree for l1_table
 - better name for size in bytes variable
 - reduce code blocks nesting
 - whitespaces, braces, newlines

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 98 +++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 48 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 47cc82449b..69294a94fe 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1864,71 +1864,73 @@ static int check_refcounts_l1(BlockDriverState *bs,
                               int flags, BdrvCheckMode fix, bool active)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t *l1_table = NULL, l2_offset, l1_size2;
+    size_t l1_size_bytes = l1_size * L1E_SIZE;
+    g_autofree uint64_t *l1_table = NULL;
+    uint64_t l2_offset;
     int i, ret;
 
-    l1_size2 = l1_size * L1E_SIZE;
+    if (!l1_size) {
+        return 0;
+    }
 
     /* Mark L1 table as used */
     ret = qcow2_inc_refcounts_imrt(bs, res, refcount_table, refcount_table_size,
-                                   l1_table_offset, l1_size2);
+                                   l1_table_offset, l1_size_bytes);
     if (ret < 0) {
-        goto fail;
+        return ret;
+    }
+
+    l1_table = g_try_malloc(l1_size_bytes);
+    if (l1_table == NULL) {
+        res->check_errors++;
+        return -ENOMEM;
     }
 
     /* Read L1 table entries from disk */
-    if (l1_size2 > 0) {
-        l1_table = g_try_malloc(l1_size2);
-        if (l1_table == NULL) {
-            ret = -ENOMEM;
-            res->check_errors++;
-            goto fail;
-        }
-        ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size2);
-        if (ret < 0) {
-            fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
-            res->check_errors++;
-            goto fail;
-        }
-        for(i = 0;i < l1_size; i++)
-            be64_to_cpus(&l1_table[i]);
+    ret = bdrv_pread(bs->file, l1_table_offset, l1_table, l1_size_bytes);
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: I/O error in check_refcounts_l1\n");
+        res->check_errors++;
+        return ret;
+    }
+
+    for (i = 0; i < l1_size; i++) {
+        be64_to_cpus(&l1_table[i]);
     }
 
     /* Do the actual checks */
-    for(i = 0; i < l1_size; i++) {
-        l2_offset = l1_table[i];
-        if (l2_offset) {
-            /* Mark L2 table as used */
-            l2_offset &= L1E_OFFSET_MASK;
-            ret = qcow2_inc_refcounts_imrt(bs, res,
-                                           refcount_table, refcount_table_size,
-                                           l2_offset, s->cluster_size);
-            if (ret < 0) {
-                goto fail;
-            }
+    for (i = 0; i < l1_size; i++) {
+        if (!l1_table[i]) {
+            continue;
+        }
 
-            /* L2 tables are cluster aligned */
-            if (offset_into_cluster(s, l2_offset)) {
-                fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
-                    "cluster aligned; L1 entry corrupted\n", l2_offset);
-                res->corruptions++;
-            }
+        l2_offset = l1_table[i] & L1E_OFFSET_MASK;
 
-            /* Process and check L2 entries */
-            ret = check_refcounts_l2(bs, res, refcount_table,
-                                     refcount_table_size, l2_offset, flags,
-                                     fix, active);
-            if (ret < 0) {
-                goto fail;
-            }
+        /* Mark L2 table as used */
+        ret = qcow2_inc_refcounts_imrt(bs, res,
+                                       refcount_table, refcount_table_size,
+                                       l2_offset, s->cluster_size);
+        if (ret < 0) {
+            return ret;
+        }
+
+        /* L2 tables are cluster aligned */
+        if (offset_into_cluster(s, l2_offset)) {
+            fprintf(stderr, "ERROR l2_offset=%" PRIx64 ": Table is not "
+                "cluster aligned; L1 entry corrupted\n", l2_offset);
+            res->corruptions++;
+        }
+
+        /* Process and check L2 entries */
+        ret = check_refcounts_l2(bs, res, refcount_table,
+                                 refcount_table_size, l2_offset, flags,
+                                 fix, active);
+        if (ret < 0) {
+            return ret;
         }
     }
-    g_free(l1_table);
-    return 0;
 
-fail:
-    g_free(l1_table);
-    return ret;
+    return 0;
 }
 
 /*
-- 
2.29.2


