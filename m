Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4733D0C74
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:33:16 +0200 (CEST)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69XP-000219-Dm
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697f-0007Yc-3r; Wed, 21 Jul 2021 06:06:39 -0400
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:23364 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697b-00024a-3r; Wed, 21 Jul 2021 06:06:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DO3imaYjWrqCIGD42ORpkPIHQtb/gkNsYE56PcPcuun4+M2ATwTFdKIcb3ib6avnD2DEzAIFGbBD2jHuIULMGMtZgYMvYFaefXEDKX7AB4suGJ+sV3gZgykmLoAlYtCnMwxi3Ve0L6tbn+gWKWnMp+rHAUh4+5Ap6+7icOT5FRQyq0qQvFdVTUxv/jvioo/4p7IBrtUBJC5iWW4/Wk/RHCfIW1nZ1hlenqADrpRiDBqs+dSZa3qRTacCMxRLu94XXyYJLax/Ulb3rTuIeeZ7mt7hQMduQTl3TMNYBi3KSgyYaytPu5Q/a6zZ+2Yjp2fmRtEbOATing2dHTUi1OmhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=ZB1FGevRyabrcDDZBnjUGMB9Zhs+HYRJDXL4yAAz/Y8egTpPTFpjPPfAnHZy1iqiWs0hEIh9bYbVZkDltIJJy4MJ8JUZqPuaqzsO+g48M5TcOKOaJg+ByVcPF07WPqDaYRDAsAj3H9Bvwws3NL0gHVw1vq/tSOjwvnWvlt4b3y7VCez5SUT6HJB8pU2Fwmlbz3iQHz7HV5sqADZps9NIiQSws6NEJ1Dfoo+wyC8PiSRJtMKZqOcsixySre3qxlUCsbwPyytam2qVJSsJT9yhqxDPHENsZy2hN6Zkx1vjhfYyyrwVw8EmGvYlFoGkfYsgUVqMoBOLNMjJ+nNITSlH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=ImMKjY+FCyLtEq/s9THD+wSNGh8LsRCunmhIOMBskuI4yvUyyU2lkPy4ckcPfKD9xruCGq6dUD+qyKsnuOL4TU8PdCsqR8e/OyYaWK20l8qXuDw/dKmfGPdFz8C1ZHIDM6wNHOtZRGgFIDK3EBAPRPoMjwS+Rn2UiWTss0IP0Yg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 10:06:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 14/33] block/copy-before-write: introduce cbw_init()
Date: Wed, 21 Jul 2021 13:05:36 +0300
Message-Id: <20210721100555.45594-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af5a9e98-bed6-43fc-5c7b-08d94c2f357a
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59119BE2FC99BD1FB3569A99C1E39@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVd+q1YzslGH6lOnQwgjwT/+YsIWVw/zNQsq9h4RUsrB8WupSMoVF9O3PdKM+/JqLueqVZeZx/0NNb9/v4qUmfgMtWgUlU3h2cUjRNI9akmgszsO7aAofumW77G4SMjX81rwSRKkvKN3O8wxRJscYNuqStjdIDMmAYS38lnGhcDbaXRZUG8/X1y4Pb6HUCwYF4xslPhpEqCOYK7mrhv4W2a60y/hj0usoAlKdo8OChqxVcH92n2t0B8d0MEAuyMJkNd4iom8q7mJcqbsNvpRAxwp551HiOgWy+fw5aybEV5nhRfcbMlHLZN+ATcuJantwDn2YTXe/e6zvRbp3sIZ/8fseQT/Vw3dCLgz/QTutU52rqDybvTBiu/6QGER/htuJrVCaOxrNwCfY+t2TzD0BmcgjndBVrXUpigkmBLx4BPwNI2ptNTH3Z/RuzQiPrTZtzrqZj/uY7bYEjEXj5lEvX1oZ8bR5aEyWqqMLABZpOkYqSE2ALT7HhLKbeN2WBh3tWC+DbZ8hBNrmjbZwkTEAvY2XSH9YCdCqPOJMSkC8UoGbXyER4aa1iG0JF5RUlsmdWuzDn0kQpBV4ppolPDIp5+9zPorV73qc/Pg2qedu/pRDeto7vJvO2qdLrqT6D9BUh3b0ow8H78Pn7qDFo8oSTpZij+q9yvGVdZQyTQm0ziNPHtnTEll1SNSqlypofAQWqpNpEV9X4r8VE3FCfwu+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(66556008)(4326008)(6916009)(5660300002)(7416002)(6666004)(66946007)(6486002)(8676002)(6506007)(6512007)(2616005)(1076003)(66476007)(52116002)(36756003)(26005)(478600001)(83380400001)(86362001)(2906002)(38350700002)(38100700002)(8936002)(186003)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BkCC9BuxfJmJSLcPGNeyiPa+JwKmYpiXa0Row6lQXp/BVyjY1ISihoig37ev?=
 =?us-ascii?Q?ChT/zfEVxg59bHlwZDcOaGMgrMlYyPB/ExQ6/BDsd7yaRosYlnBbwTHuDouy?=
 =?us-ascii?Q?B6KPj7L2IYeJahlpUmF3sIDyapexcmnacwElgr9qgxC9qrdhogaFtXp3psAO?=
 =?us-ascii?Q?qXcDyPEAp55WOUbbGYY1Hf+VEvUIUH4m4OxnhLt9KN8BAFaP6zhrdIedGP1K?=
 =?us-ascii?Q?po/YlDmPiqOcdmgXSSTMRl72VOuU1y3fenKfW6RKrqBgJyMdwJZAIaP7pipz?=
 =?us-ascii?Q?ob18/fZsu15qL6KPMgx/N7/2sj2gLaobCbhLBZ7Eb0taX7u0e7/ZmrBL69rS?=
 =?us-ascii?Q?Qv2cWhmMeX2XLfFQJkO3kb+lFx3c1aJWfCd7KSTsjtTgK6XDQgt/HqUVyrPD?=
 =?us-ascii?Q?maYDCrMtP5KHO7kDBbDNfWps2OfpVSXEdmqcsCW92j2fOXujriKyBQhxoFtq?=
 =?us-ascii?Q?ZY48Tcs/bd2939njPj7D0Kz0FfT4vP/pFB5H4tJw6xs0Vp8TewqRjU7//trQ?=
 =?us-ascii?Q?3kl06xCM5n5h3UhHg3PBOE3cdHGRbosr1j47pXTf35inTwrlAmti1Ee9v/G0?=
 =?us-ascii?Q?9tjuGEpnjkJjpVbF1lTPhepny0nJWc3qCfDpOCkWEB2jm4bQrYQ8wtNlYAgy?=
 =?us-ascii?Q?U/muwDwtC/goYBQYoD0kzRgQWFN2ra1KrYp6RK+nK6OIdeoXA97ZoNYU+FLZ?=
 =?us-ascii?Q?EBf2g3wPVG/h8D1Cs/AASEVXspyDrzthZzNwostmffh0tRkfXBMyqPnuOV8X?=
 =?us-ascii?Q?KTbIXr10u8GekauQHj5u5IUC/DS6ANKqiDkZ5DVWSFYnC36Zprig1EQsP0TR?=
 =?us-ascii?Q?e2bGYrBDGaJyGvs8c7iS1MOUMU4OerEqGxSncDkMEeld3SyTkA7b9wY5j+Bd?=
 =?us-ascii?Q?b1UgV8j/zdWSLotAJB+kRc3K43xUnGk1muwXBtm3zuYX8QI9MuzjjBGYNUA/?=
 =?us-ascii?Q?B7IB3X70Gj+ptTGi/6vCrcVORZEXma4HTfDB3U6WC92rfPQzyJAmUnbsyWIr?=
 =?us-ascii?Q?0fVpXVPZQ4yknZFIj0jcsW6STmPCm/9es0XZTkiQn2AqU96IVVBAVFKvrxkE?=
 =?us-ascii?Q?Q3NTdE2JsIAg4dN3CD40wBZt37rxuVx7Na28WJCzSJ5ua2Jpv8vK2VMqrqbv?=
 =?us-ascii?Q?1gWAVod5JFOKBV3L+7qEqs8Stlb8rygdnz4bP+2VVFXw+E3CKjBhEJ3uBGeD?=
 =?us-ascii?Q?6JCD5J3lGDK/S3G0a2pi7iAzxbEG8L6JYvsDGj/xg63VIas8JJ+Rv9wZDa5o?=
 =?us-ascii?Q?bKJOgH9m/j9atN+Td/tMe0XKhpkSraYN9kLoR8q6DFAx4y5OTPofcD7Dfjrj?=
 =?us-ascii?Q?LvLVFFRYE3GQO60cR4aMZgKx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5a9e98-bed6-43fc-5c7b-08d94c2f357a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:29.5395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2DZ8CqGRfxuo5VHdC9FeWi6PYMUS7Ie6ygb+R9dJrIcQjybnnVQJJKsmOQOE8aupLQeJc3MRk9VA4yVh5R0jUGDDJJgLOMz1XIZKwf5DBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.4.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
intermediate step for adding normal .bdrv_open() handler to the
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


