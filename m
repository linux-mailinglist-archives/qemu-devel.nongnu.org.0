Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93D13D0C5E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:21:57 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69MS-0004Jy-QU
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697i-0007fr-JX; Wed, 21 Jul 2021 06:06:42 -0400
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:23364 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697f-00024a-Ok; Wed, 21 Jul 2021 06:06:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWDkrQ1PRbRwDvy0p0WD/3A7BUMM9Se/Q8irzP7qcr/5fSmu8ZzpEAgnFcqcsM2b90b3WCI2FZNTHvnczpgvG9a2QGqE0HDPExEym0wyfxJFsBXmSJ9wGOhbCO61WRxJAN5b2Q561ewMSxXKUs9u0InY3jMTKhBbFQV4aZw/vf6n09VH9IrcRrt9uxC+kJL2wuqa1i266Z2V83HNI7a+5SaTyqBvHnl9+QtM0+EwJ6KyGLDfcLJR0YBLkqXTCeDcJh3KST9iSv3kdL71lxVNfKVJT2EToQtz9Pz66ouN+k7N7pVfoeDfkpEcFWLGM/37xegtQqn77eAROFQ3IKlzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=CuWnW+7tHUksLDoElQgA82FmL0N6CtuPDhpgigpZpq8lHqbHXdRaYRA1JTj/ZJn9+eokfg9rf+LNdQxxnE+3Xi5/7lBhJD7gx1Np9K1RPdmwMheCt390IRFBtN7TXXF6aRctgXWOH85TTF3X+qUdirefu8RGT2XZ1jnFFbK+lm2MJSRvX+am6c3VqTaGIuZpPHlKeGbcg8WfRTze8XgAUHygFqbdXrfOWy6aMMHIc4B9HW3w255qhnTYqXYIRABFHcRGZQDTehBRvtNFJxU8CrewDBaSGJIPrGH3Pm7mkVQYYqTwTuGEbX0w7vNStvY6wiFrfLN6vDdOQLt/yxTMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=h2riwMDpESQiaeUaz6Cg2qA4mrrftmZpm0Z2Sk3VUHX8WUjLLAsg3Vzt0TuyOtvppNTVWapF4rj/aJ7BRQwcSFgZvnhR5UBYjc8JfW/XoJXZ9xFzs/3UlJJD8WIqNfchjcFvjJBb0od7OZjv6+LdV6iKThjfRUz53ths+HCfgEk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 10:06:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 15/33] block/copy-before-write: cbw_init(): rename variables
Date: Wed, 21 Jul 2021 13:05:37 +0300
Message-Id: <20210721100555.45594-16-vsementsov@virtuozzo.com>
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
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 395d9b05-556f-40f9-f23d-08d94c2f368d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911A374EA10BB4326BC2FEDC1E39@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3lLDRSDz7vSwgFoG3Vh85RxV9t3l/eX/+ziIprhK0niACSRzTVEPJwaYOWzUH04oXsqlTkwL0LtA9LaAhD7vLEVoTthaoLkJaqLYoevxs9TPqmlb1TggjNueqXeGv/oBacjh6aTGGzxteV/BRLzgFfnSCCkNN02rtFd+u3UYP74JMigq/qFhxWt+/e/k05E8+/uZWPVQ9ytE6lpPz3nToMe7JbrFe6a5hZtYXYSnnDOqe3I66gr8UVnxhwPZNCw3cEA/XHbdiXGHXwU3IQlNKPmDHfhlt9Mg2cd33bns3z9RJglNTlNTy/Y9UQkLMiwkur86/o7iUy9RHyvDRct8VUEwFx+0Y8UR43CrDh9kTB/RbMyaONwK2JK7jFKtfRtmQVGPhdmsdQohBlwsmklSfBlmlg7MiX3NM7ZJKegW19yZ0TVDfqYXaGIbblpmXHQkv4EdyoQ9iHMV8AQZs0cENPPI5QNLUzSVmqOf/iQqd7QttgelVCpV93KLDaU+t/iTNM16PJYCnq1GC0Mau6+prLyHsDNehyqXyXD8i9Yf0cfgWv/dbykde3LRRZnx5WFPOUwVSDmKvvfT7yDi1SWRs5BM5ueDfAZ2oHiEEREDDYMVdfnyj2SMrmmLHTASGB3wy/l7ymksaZXovdPTEEMPYMMuJ2as0PZRq/DokZSZS/F5yYgt2HE+2AlXrdQl0u+neefw/Uhtfv2GUjdWJ/rJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(66556008)(4326008)(6916009)(5660300002)(7416002)(66946007)(6486002)(8676002)(6506007)(6512007)(2616005)(1076003)(66476007)(52116002)(36756003)(26005)(478600001)(83380400001)(86362001)(2906002)(38350700002)(38100700002)(8936002)(186003)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Otk8E2v3ox7MzmR/v5c3EeRUnHwlAnM/Mu8HsV/gBHWfEniM3wbo9FccGd4l?=
 =?us-ascii?Q?KrWzwsVyIdAOYcF47iiLfYkxqp64g0muXjhFIpDfgiHh8wtcLT1nsrYcLI5T?=
 =?us-ascii?Q?yQXDUdbtCykiMbqavn5Zus/Q6LYPpcMNpMVn+2nYs5qme38CJBNyAWBZgHNd?=
 =?us-ascii?Q?5NHyswt3VIhY1SZnh9rMvlm2WgWBUbzSfrPR3v/ceamQBrPdmQBmLsYBLewt?=
 =?us-ascii?Q?yrgaXKJENeDbHvi1zRl7jiOJ9CCpTSLlFyiBnFJ7dUjMUNQrUFn/9cPjWz0a?=
 =?us-ascii?Q?XhP93AJY/DXyo46twTx94BAlL+frnnsmH6ssITtJED7d/on6vnbul7+i+CTp?=
 =?us-ascii?Q?c6/V0+SoAwX7QggBtq6wyZhvA/T6dGhggY+DQ7CyjyjAR+jjl1Fl87b7NoEo?=
 =?us-ascii?Q?RrbVY8DnYmM4dl3PVcu92apGQmJTdTHdA/oerMJ8+liaYSFQ6wuypjKWaXHc?=
 =?us-ascii?Q?BU3z3W2p/a00dYmon25ZxucnSqMv9oVEAhEJHINwmtWN3lXnOli66PubhxSw?=
 =?us-ascii?Q?jSf9byVwDqzfgopYLhK0QEKrfk4OzwST176LED6qfsL4I4Wk9D8k1uBn2Kp7?=
 =?us-ascii?Q?2OTMMDtiVLreogfiAgz18bLFE70DQ975tRhG15nU7pn3PFmJXT3ODXECKzWi?=
 =?us-ascii?Q?23ICLx2L1hcjBeoEZDWVKk836o+93alTfAEnPnjT873cOO/o9507mcwVjEim?=
 =?us-ascii?Q?RH54R2KFVne0OOfrk6MVOIfCZRMOUbqT59ec8ny4dq7uvtevgwbWgZSrev6z?=
 =?us-ascii?Q?H5ISiyF6AVx8iFsVP3PKM8VLuofN58Z1Q/+Pvv5MhD8ALRnM8ajCrG0vIN6g?=
 =?us-ascii?Q?P6NJqLaWx5drTZZDTO+iVQS3E/x5rP6xhEoYHJ61mQSGVGCnjoxFIXtTjmTx?=
 =?us-ascii?Q?qpeiHMHShELhgrp5hRkvxtZweZYtgafrtgWgok1pbqyxvOtI4/gFzMg9d8zy?=
 =?us-ascii?Q?jwMBB8HRjiJS47PvdkUf7/j0wMCWvvm0QiA2XFbwvl00mxm50j3+1+Ca9S1g?=
 =?us-ascii?Q?BIsg6bUX5lBSJQWou58fZUdEbmqRqzdUzLQUMxn5o7wN0rq9hbEI6bWPR8Tj?=
 =?us-ascii?Q?Hdp4yZaptXUpIVL6MhkpkstX1z+Em2jxCwqjSS8wjsBbTya7WnzeyFY7CcDq?=
 =?us-ascii?Q?YwDyJMl1FxW5+r2dByLATba9LoyiSYxMHsaktJkiWn6pT6uZNJsIEJPk7pO7?=
 =?us-ascii?Q?IxSlWnBR5PERWWYoQQD9pzWul0SYS9vA94kQSs/7VD976Oa+gmzLVxNQ1L7U?=
 =?us-ascii?Q?GNUdRRO3fXFd1pPgd43tTezCgqo8ssswcAryupzqd8JVSTTeL2EcDpRkEbqq?=
 =?us-ascii?Q?t2AE444uBrmpBMs4qPRrHUnL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395d9b05-556f-40f9-f23d-08d94c2f368d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:31.3406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDC1nsw2AyyDGl82PNRhRvN+NQEKZpKtYXLXpVEYSSioixe34YXYpe7IJ+IUrir0DmwZZRh+WCJCJNz4bFNvFHBy8KzSsQMLuNM2MfxNjkw=
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

One more step closer to real .bdrv_open() handler: use more usual names
for bs being initialized and its state.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a4fee645fd..d7f1833efa 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,38 +144,37 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
                     BlockDriverState *target, bool compress, Error **errp)
 {
-    BDRVCopyBeforeWriteState *state = top->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->total_sectors = source->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              source->supported_zero_flags);
 
     bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
+    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
+                                  BDRV_CHILD_DATA, errp);
+    if (!s->target) {
         error_prepend(errp, "Cannot attach target child: ");
         return -EINVAL;
     }
 
     bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
+    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
+                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                 errp);
+    if (!bs->file) {
         error_prepend(errp, "Cannot attach file child: ");
         return -EINVAL;
     }
 
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
+    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
     }
-- 
2.29.2


