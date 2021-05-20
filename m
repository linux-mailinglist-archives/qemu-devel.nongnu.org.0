Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA238B1D9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:37:35 +0200 (CEST)
Received: from localhost ([::1]:56060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjnq-0002PR-1j
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZs-00068r-Vc; Thu, 20 May 2021 10:23:09 -0400
Received: from mail-eopbgr00114.outbound.protection.outlook.com
 ([40.107.0.114]:2638 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZp-0005ik-LK; Thu, 20 May 2021 10:23:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGFBimQe9hONPEn6uaWyvVFLPsPIuseBovdlEPdtltALZPiHaJimTHxuTIgnLRdd8WqhafWPcr2q4hopEC+YyJ60P5QpEH+LOCDLXByoT17AJg0fIiPv2Zw+/WY1LzXeNdMatzaDK7zdGQIsDlnwuQkTLn1PmfufLqCd0LFmgp4PPJ8RqhzL61oZqia2GE+5Rfq5pK6MFxopPQZ/ynOjzIThNp/HJ1RL+4JSwhNddJDND79f5gOCcw9h3q/tQAwXG4+QSfq8j+SR3WUYoYLlzlNKLzt/adJaZLET+C/P99mMxcBHlh50ueUqL46of42ggxJho4zUQZfdC/SQfmIlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULbIfGle2hk6n2Q+v6LxIxzjL5NY6wdwu5ZWXwnhWDY=;
 b=Y5OnXceRuKQn2uMfUdTdf9g+YH0ek0yFNgYky8E+Y0GaAW7dIfZe9XTYETuTMYbWB+aFyN9XU3Wu19Bb0xd/pVMTACBXEjKKNr16LfsoT59fNTxnXPff10TrHZImatOZ8S1m2xCnkH3g7m56fjsrtoJIvqZKaUDgqQ2iyFjw1LGNEJuCbAV4cU//safweqPPL9xAZL3+CE1vzU2M8T85awBiegA7qqFGMIrPr7vCHRe+4LxhU7kbl/psRP8pUYHzyMwjbAVNg+CQdhgu3cYfsF4HMzmHZJBlAWpBqmZpqooeAMhKQhb14y4Gz8iNO/2vjDKoIzHda9sw3VS93MNYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULbIfGle2hk6n2Q+v6LxIxzjL5NY6wdwu5ZWXwnhWDY=;
 b=dG0jeFjNhei3lQlQLWfzOyBMdMLFBlJ6FXrkUdDjQku/71twk12AtI+WM+3XYNV8FaNTmWlee/yyhcA8afvv8kRGJ1/eKNia9mm66cmAQLfPgM+7O+sO66JrqpDBeWqGG/Cn76TG06qqeWBJAim0jmSt5v+B/h3BsnIg6QmmFbg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 15/33] block/copy-before-write: introduce cbw_init()
Date: Thu, 20 May 2021 17:21:47 +0300
Message-Id: <20210520142205.607501-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbc9def4-ece7-4a42-65e7-08d91b9abbb2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354403C596CC565871A6F3B1C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gfIlSY9StB0VNi/h7Nu0hT13RiG6wdFInftAij5wAPjx91X2gG/8kl411PVcoeybLY3qliH8L6YhwWWbJfK9BpfkfBTOvHiEYM6HLrrOzdh8TFXpD7ySKk62qIUYxBQr3FaTiUyf6qJuQpx/7mYbfDR/McSzyvVshLRX1ccOf+Ea8G3iuW/NuFQMpe0OMAi8N4fVUh7ejffhkcQbXwy1BmQ0PV7vBKo416bZcu+9pcgMVa4HLX7S0vYcEtNNbzGg48PPi9zmlKX45LhVV7RcrPOteNz9xjY8DsrCW4BAOpL9l3Fq3bQ1/+hdfESK14CkqovjZhnm+abvRFmZq1nQTyqWssyuurrfkNj8ycTobEsjZ2QZnigAhs1a/vhMIlw3EKwo0J6e7WOSXAm/ml9uP02inTCSGaat8lpUpCKjGwzS8qDRqczoIJ3v89pCY/ycNk/c2JpzICQgKvWcS3SjqT9nWomewybNBpsLocr2NN1pPb19DZ3KtCtv56VMk9fmGZO1JJt2PEKmkGPistc/XSFUIUCIS4OuRByyCd4aCdU8n0kF73cKuGynPTXUcwZiVtcFecpNwZq8OnE+aM6YLQ/AEYHWCxJqI+gOoetzHQDvVK2aG2zTAcvX38TKlkTnAtZqNM+8yfOe7Bdfic3Wh8x+YM6ZKjN5w0SarP72k/YvepAU4a4oBB18it1BOPe3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1Fbpl8j1nHecqVDjrCn1AyIGXS09TyE7fSC7fCXktxdCkd7Cc35Kg23Uj9Kn?=
 =?us-ascii?Q?t+TE8sI39DpTZyh7Q5mbD5dVKf0UPM3BrBNZMBQSuC91+cQeXOYi9yPVlLW0?=
 =?us-ascii?Q?LnBiRbmbgg15nqxiOqbM5TUO8p4pPMeWftti/L6bRE7t5y6JW0OpEM7rNJtJ?=
 =?us-ascii?Q?Fg2sYofS+HDHQjU+/yeNPUMo2QGaUmnrH56Th5plN6Az7xaTEPPbfkRuU/a1?=
 =?us-ascii?Q?n5AlwloBAp47E5TDQmtsvkASxUp1GLJlTHTv82+8C78evfmXWdhoYjuN6uG6?=
 =?us-ascii?Q?T3H9JRiH3jGmCIxzhqXZIt1wVgI1Ac9VAhuGhDQ3diWdbyFSRrlwvsvsaRve?=
 =?us-ascii?Q?POY36Qxz9WpGhvESP5fu/C6NMwkxLmCPQjqH09MTNCzyLv47kHjsJ4byfV8O?=
 =?us-ascii?Q?FZlGgAE0vxLDKklfiPZfTiI4w/RqCPHtYO3Qhatvbgn53mILd37ZTXjZ2PYQ?=
 =?us-ascii?Q?8T88QJ3uj8TjXzXfOHWtv0sAj/oZ+pOeD+9hKv3kXIwbr5Qpdq1uB3BpYsxe?=
 =?us-ascii?Q?GYcYO0zRLTjMv4535YJYUEKB+P/nUjpUsBkDBBHgY222vvfC+ItYz1cO+ICn?=
 =?us-ascii?Q?ZVQJkHicN254iHguOc4NhKo5HPqhzcZlC+ppX0yEGSa3NrO+dHqdlXSrX4Ix?=
 =?us-ascii?Q?DTpOmbDDMxq79hA17YdKTs1t7varKruvN2T1Fdi0TKxmnGVPv7Q8uB1ixMn5?=
 =?us-ascii?Q?bi/LnHf5lV9yq/qLBaBOBJ3kTqGqahokZlN9CLwXhelAP4qH/v+Y1cYZTEk+?=
 =?us-ascii?Q?kmTsm2oxH+gmOWHnmq4WcLqN8v1/fmesiBWjCNWFR/S545IqIc1JEVCstaW1?=
 =?us-ascii?Q?D2MG0J61p1K44hdZF9TBSCble8dzC627f+bOutmF4Pr24NNwrdRedFYYqE5i?=
 =?us-ascii?Q?ZceaRGLeMwsct2yaNsZAki78Z4HMAvFdVS6wnoQ6sbDbdBh1b9joE7W9LTFw?=
 =?us-ascii?Q?hWxwRrqpDzsNIMz2JMlu91Vxk3gDL4q9b5meWFXv+Mj/s//HaOWEoJEGC2fQ?=
 =?us-ascii?Q?qDrCoM7vNcrfQhf+py3G/wJjuPzo5OUGQYbK7mE0SOC/11Uuiaitk+5ROr7r?=
 =?us-ascii?Q?8PC3/IrNSE7AArPex6z0wsRYH36jywm1IYQKVbj5d1qaejwYhRjLio0Hm9Qz?=
 =?us-ascii?Q?iUEkeKtXuDzy1bG1DlxjGoOyuwH2/O2ZfcTxbBAT33N61uRgdelhnQ6i0bOO?=
 =?us-ascii?Q?oGyDSu0ipafjo0ezPYjJ43aqKBhLRuf1xRh2TQu1ulTbrM19VW51a3IiVjhf?=
 =?us-ascii?Q?ECPEWUsUgQchK5PQsKICFIySBjXyTJxWvnO+bXOoPWGibLIXtDy/rYpbIJMt?=
 =?us-ascii?Q?JGRAFPa0kA453TS7m7vT8AqY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc9def4-ece7-4a42-65e7-08d91b9abbb2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:43.8675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6zM/E2YYrC+AOvpYS0xtEhioATG7MtjPk03P5nWhRuNILQ3o/skTAfuVWEbWtypFOH/xpMczLi0pagFavzRkELlxWkZjXGUSoVBhKi8x0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Move part of bdrv_cbw_append() to new function cbw_open(). It's an
intermediate step for adding noramal .bdrv_open() handler to the
filter. With this commit no logic is changed, but we have a function
which will be turned into .bdrv_open() handler in future commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 69 +++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index adbbc64aa9..a4fee645fd 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,6 +144,45 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+                    BlockDriverState *target, bool compress, Error **errp)
+{
+    BDRVCopyBeforeWriteState *state = top->opaque;
+
+    top->total_sectors = source->total_sectors;
+    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & source->supported_write_flags);
+    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             source->supported_zero_flags);
+
+    bdrv_ref(target);
+    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
+                                      BDRV_CHILD_DATA, errp);
+    if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        return -EINVAL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
+        return -EINVAL;
+    }
+
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
@@ -181,36 +220,10 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
-
     state = top->opaque;
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
-    bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
-        error_prepend(errp, "Cannot attach target child: ");
-        goto fail;
-    }
 
-    bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
-        error_prepend(errp, "Cannot attach file child: ");
-        goto fail;
-    }
-
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
-        error_prepend(errp, "Cannot create block-copy-state: ");
+    ret = cbw_init(top, source, target, compress, errp);
+    if (ret < 0) {
         goto fail;
     }
 
-- 
2.29.2


