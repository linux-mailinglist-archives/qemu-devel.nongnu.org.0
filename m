Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A4837273B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:30:01 +0200 (CEST)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqRM-0001my-B7
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqO2-00082Y-OA; Tue, 04 May 2021 04:26:35 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:10464 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNx-0007EP-3A; Tue, 04 May 2021 04:26:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvCZSWmVrrATEnqhsuqq3pv4p8QgLyRgnTJdjORngCjBYvylr1+ZZ9kfzsIJRmEshG1LZWBS/3TNoUY+a7qPr/T+Ll0AFHyUgJQAZI7ailwA1mYjzCwXd4zBl/FmtJgZX7jI6qvEMaIE9lY/3zpPV+clapKgJ9vwCl65CKvcRRe9N4Qa7zZp9zaFcvzle6pcEoM4xclsXMtr1AaQteGVsPy6poM9JZpMwQTl7zdbkI9FdUZ8opeZCgcVhRaUki0Px4Ter5p8/jXSpQxwP9ymyrt9Zb0Okya/21IS6GFOGNJ2955rW84P19J5J/OsYRtuXiSNltyfU10ajDz1cyo4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVnxqGECls+TQxCkbFAClRijhk/doPHsDIGULGvD54U=;
 b=Kn+IvZUum1lVTAJgI1ARO/Sr9cYRFuN2snDa+uaSFu38DmpItqOpQKaPb5vW7yu3BsuYnn/CI8u7Q2bwQVhkTgTm1T3lYxX5Bmjvv5arg7JgkbH2HQdZi88BOhOXIggo7OUvuIVeLvSRSCu/2GBR6Zdg5RdzLSzx+DVQAWv3XebbMQHyWhmLTjbequNOjdqYyVo3p1GGwcM1KQ7D7zfjF8O1ZqHaPH3rMh6zTz2oo5CMCvuMlpv5trueaU/NSZGxWR59bKOEGSl19kU92PAT3EgZ40O4r+RpY44tJbxfFEiRL9u6elcjnaFDTo0PLmjk0iAXwVLXzt3ZLXlQcxlXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVnxqGECls+TQxCkbFAClRijhk/doPHsDIGULGvD54U=;
 b=cGxHu74ShbZOCxwg9SrF9eJigVc75A0Jee1nYN5/R8oTbyIBX/wQawa21HMIpWolmN79ndnpaVLiuCRe6HQ7NbUlJxeN7+HhMOGoVphHoZ7zz47KWG+UTkYwwTvwvACtQNuWAUdOSkmGw1K6tr3JMvATtfquk86hw8ihvz+gTZs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 5/9] block/write-threshold: don't use aio context lock
Date: Tue,  4 May 2021 11:25:49 +0300
Message-Id: <20210504082553.20377-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a468491-6373-462c-602b-08d90ed6477e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381C37AE9893E911145822CC15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: khGZPQZT5N2Md7Ui1qoJy12gUIkm2kgqN6ijLiYHrJjfuSpWjEhGk9GBYHRhibzPTpTyCXKT68+MYvYUoV6fJWPyo5e/9P8TDOqwORsCa1Q8tu/FJZPPQla0bdjOFnIeRNaL8qSKtSEYDZd9JiNjmbAOF6tQv3iYNV1vKOi1JFMErGdwKT9rUUmTu2h+NZXNDaAlgVkQrmcQThmiOUKg6XRu0S6eNytLJsPCliYduflqJJD7nVEg/I3FNC3FnHonZadVVXnqjLJ7t7dyWA0lP2vER4E+RXG/W8RMVWEd8nmjtnsGsOWVPmXSejkggg93e7PQdfGRFvzQdVa3xgfVjNUQEbH0LuZPfPecAZ/MJmjm7FvAR7OAhSEWhvpc5rUijwzfmgSCyv44Mdu0RMHxkPQLRcdHoQSlx1MZwMGSTIgpmvwWSq0B50iWUJMwm63lSuMKw9ML6Qga77M/LgtqxM8GaJvlRyIY0XMqWRcKIDxBqUGrkoleAAEQZST3UWKe/k8oY7J2gTje4WTXpOBZ5BUi3dP3pspd3jsK5APTSUc1Z8Yk9M/sAvNZOxFUgC73/q4H+pSkuiUPhH1G0py0H5HMRI8u8s/uFgIrQkzCewyRArTF2zIP0qwYn5JptqWhRrLKbWsAYRmeOfAjKEY6GCaXHhREwcIACN7oYdprkbOfKMCNAPJ0RBiGHAhRGFVf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o0lUNbwjciIqs3X6D49qtntb6ipi4hTPl9NRBd753WVA2TFyCCswi+kOhCyd?=
 =?us-ascii?Q?P0JZw1Joi8e+gRBsU8UhSogPsiyHk/0brIRedgaSnBLYcJUmp9e8nCLXuEIm?=
 =?us-ascii?Q?vQZ5fBcCplHTpFWYk7/PwRYUoHxl5ElUYnn8GxmX3sVK7D6bp4/cEh62z4h0?=
 =?us-ascii?Q?QD1mevCZELdNfWYOrxpjOBskf2lUmm4d06H5z+w/nq0NWvB1AxowVSHPWFv1?=
 =?us-ascii?Q?5igIKaDH7R+9eerDEhL+IGAxngmYhiviIoO/ZPvamjaw9fzVFiDiTnYtTHFe?=
 =?us-ascii?Q?yD9XmGu2DI1t8vM+kzmMXs/oNLydZ1kQiHQ+9/T2iwqOPNvkA+Al8ApB5wAF?=
 =?us-ascii?Q?htoCBl//DVZ/VmMTygbBvL1bLliLNLKzDIK+rlp3MGs+QoCsiI+J6qnbuMcr?=
 =?us-ascii?Q?zuK5/K1KP6HC0MDq6ikWToc58M5c0LprlxqPB66fYxUSvK+SlIXWIzBUC3Qv?=
 =?us-ascii?Q?Qg0umusoB36bhQ032gIPzauiLvZ+x7fG4WXUGWLBNGpJCVwCzNPC5TMuB2LV?=
 =?us-ascii?Q?5wrRwqMSOI3FypwW4xhLiukYITqRibixxe0wI8Jy3eABKAviMFbs70uaAOTX?=
 =?us-ascii?Q?x2z88HUqMLmE2qmSJxlphsfMSUum+eklJjN2BaSdceC58HqdYf05Ksb3uoFz?=
 =?us-ascii?Q?JrFHTvCsyKxnUmStjYRWRU+GcWsSJMHdVBaIlq8HC4Jh8h8MpHNj/osXGu2W?=
 =?us-ascii?Q?70l6t0ZXVGcGdmiK954xAS9QeIrnChbVnE9QW9qdH7zeaB6YM5bvFv49yp1R?=
 =?us-ascii?Q?z1rlBmVaU2sdnRqpKrztas901jYBtZWi+9zDm1ks0ijOQv+UVjR8fjtHQY7g?=
 =?us-ascii?Q?4yZ0BoNlM6G0gHxe5C8/uDW1iiSr9FDsBPx7icDbANPfmALhu4foofZXq10v?=
 =?us-ascii?Q?oKeIKT0EXmODTxPZVOqgViDhmjus/0qkWKd2120l79FW8q+ndyHV7Tmp4/cI?=
 =?us-ascii?Q?TYeyEYvcE6nkkf/5JMFdIpcw4Bio43xKZv+boMQgqHjAbMHDuahrIQBEyfjg?=
 =?us-ascii?Q?xw7FR/B+a/BjoyZXSDskbQ92UDd9SicElgnyffRCCXgm5ICgoMOCxlqMXqDq?=
 =?us-ascii?Q?2LkQOi920EG0Cq7Ckb1tS+oOj1QE0rNtpERusa+5XS8SnnCFtBa/0iptJH6g?=
 =?us-ascii?Q?XxSEFINKkwPyw4YH04NxDSKlPXGKFg0o2zaVHckhPMJyx7xAWnIds2wiqp8g?=
 =?us-ascii?Q?7fDE84Zz/xPA6YTw5U+iAhUaUOTYmpftv07n74gE55TwEp+UKCuDFZM0iZCu?=
 =?us-ascii?Q?QDl2g6il7tN9gQX2uypNpLxMusvtgfnJ49dS+LXJTNfICNnS8Yg/1+J57f0x?=
 =?us-ascii?Q?/ptXj+iepqIEN430lHSCox+e?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a468491-6373-462c-602b-08d90ed6477e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:13.6752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wychzb+63ip/4qi+lOL5l9Da8xcxudX4bS8tUzxFIGDcR1DjDdasJMjgYNPBgqC/MximlmkjRQixJjQe9NgNS2MRei99t6REnbNwTe+lDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of relying on aio context lock, let's make use of atomic
operations.

The tricky place is bdrv_write_threshold_check_write(): we want
atomically unset bs->write_threshold_offset iff
  offset + bytes > bs->write_threshold_offset
We don't have such atomic operation, so let's go in a loop:

1. fetch wtr atomically
2. if condition satisfied, try cmpxchg (if not satisfied, we are done,
   don't send event)
3. if cmpxchg succeeded, we are done (send event), else go to [1]

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/write-threshold.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/block/write-threshold.c b/block/write-threshold.c
index ae54ee05dc..fbf4e6f5c4 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -2,6 +2,7 @@
  * QEMU System Emulator block write threshold notification
  *
  * Copyright Red Hat, Inc. 2014
+ * Copyright (c) 2021 Virtuozzo International GmbH.
  *
  * Authors:
  *  Francesco Romani <fromani@redhat.com>
@@ -21,43 +22,44 @@
 
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs)
 {
-    return bs->write_threshold_offset;
+    return qatomic_read(&bs->write_threshold_offset);
 }
 
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
-    bs->write_threshold_offset = threshold_bytes;
+    qatomic_set(&bs->write_threshold_offset, threshold_bytes);
 }
 
 void qmp_block_set_write_threshold(const char *node_name,
                                    uint64_t threshold_bytes,
                                    Error **errp)
 {
-    BlockDriverState *bs;
-    AioContext *aio_context;
-
-    bs = bdrv_find_node(node_name);
+    BlockDriverState *bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Device '%s' not found", node_name);
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     bdrv_write_threshold_set(bs, threshold_bytes);
-
-    aio_context_release(aio_context);
 }
 
 void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
                                       int64_t bytes)
 {
     int64_t end = offset + bytes;
-    uint64_t wtr = bs->write_threshold_offset;
+    uint64_t wtr;
 
-    if (wtr > 0 && end > wtr) {
-        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
-        bdrv_write_threshold_set(bs, 0);
+retry:
+    wtr = bdrv_write_threshold_get(bs);
+    if (wtr == 0 || wtr >= end) {
+        return;
     }
+
+    if (qatomic_cmpxchg(&bs->write_threshold_offset, wtr, 0) != wtr) {
+        /* bs->write_threshold_offset changed in parallel */
+        goto retry;
+    }
+
+    /* We have cleared bs->write_threshold_offset, so let's send event */
+    qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
 }
-- 
2.29.2


