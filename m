Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86874113D9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 13:58:24 +0200 (CEST)
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSHwF-0001hd-4h
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 07:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu6-0007Q4-OV; Mon, 20 Sep 2021 07:56:10 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:7297 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHu3-0005GK-DQ; Mon, 20 Sep 2021 07:56:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEGLeVlh/ZhslWSfnQ2ZBFbazIQG126SRKjCjECkZVev4Dr5m7ta63N6kIfYtIHBcZnFKp6CCNbjwBa7xYAn9jgBKhh3rRoKtnuviYp9X+Nz4s6m7g3a0APCLnbbgCiG7qBdc0lVDz65JlB3TvxghzFaEy51T44B+EH/I6k0zOkTCbvlDwOvnZHw0CW1fFQuGxZSJlnRmcC2idRKbKPIhLGhmZUTi3CXHCNv8EcTiZGLQ25Nmri2zOf90QFvIUhtiSIKtvg2tXOpngKC+4+N3bLNlu3wdzZJeKIB0hT8xETEeh/bMMLLNVt0kIub0YrbmD0zz2IHQTDfYBAuSZBKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nSVBCX8rP22n7MtEMM24oo0w4p1lZtTU9Oz6Ox0Gpmw=;
 b=BN6LYsB2ezANPX1fJQmbauio//VFLJ0mjmwoH5oGRHx0M3JmI0NIrANg1/DqUAqL63qLhPisZAzhOsBhkAVaktQP7Sj+7oKT3/3V6zXk/Ec1qxyZ4IzHL2hjK5mOsykzS/EgWuuXevmANDT3TzNqmnccvSfQ1O0qSFMmD6HoSxD3YgebaYOWBzvZm1Mq8cqcH/LeIMHLgvet/kUlqu/126pPs2gSabzel5hITQzFgwQW9A4b5KOrahpC4ZpLmhKoCte6NQFvX0O+tvymezNg5/EWgB3IwNwbdFdbSSBNAKQ5UjqsQicUhCVhrHl3+SlvKLOoxijNMvYYGGZogE4FRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSVBCX8rP22n7MtEMM24oo0w4p1lZtTU9Oz6Ox0Gpmw=;
 b=d1XB5L77igew/sCcc58yvl5R13CzJKQOZam1vbZVBZi2K6MWTvTDPNbaLM9rvK/KzjBttRIogFNYbQIPZ/ETJB7UoZ7og0i2MFi+wlC4Y1k/vZrWeKabQiPsyvIZfPkNv30Numb0GlaVTsr8jh42fbGYEmR8KRRsrb821w0rhZY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 11:55:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:55:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 1/5] block: implement bdrv_new_open_driver_opts()
Date: Mon, 20 Sep 2021 14:55:34 +0300
Message-Id: <20210920115538.264372-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210920115538.264372-1-vsementsov@virtuozzo.com>
References: <20210920115538.264372-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR09CA0082.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.205) by
 HE1PR09CA0082.eurprd09.prod.outlook.com (2603:10a6:7:3d::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 11:55:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05883406-9cef-4168-b17a-08d97c2d9af2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6631D6DC91FFA5E38BF20AF4C1A09@AS8PR08MB6631.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6M9Lqshw0hNSRPU1Ke9R6NZe7z5p2wNBWIsYo8jntHxpN2TM5LaSxKr0OqVU1trOrUkECC0alca/8IkSHAITyEN7rGRICl1vBiAjfUg6nj30znJVh66xAZ4q8jS8a6rCa67cEdcf8RDsiPJgmtqNQDvqFryG6tLxvoUykymO0nvIVTa7yl81ubxGEVhdBK+qkmHSDolaxVu1hQpYN1iiXCnBUhQ8sHHdYUqEdnbo1G7LS6d/Zn4mLch3WNCKTxB3BUiL24pZIDqq3feiyLDEVie0xBQ1toRZzC7kpnRSytrzG18OAnzdKWmm4e/FDSO8kq4qTEkn9nE94UzVRSyOhN1gzrohwopnyrlnc3O7O2NUEbNcuXKGy66GPnhhg1C9uDiQN3EDEkpWlq8bmBcgnmGKuXS8kJCztKwPkw2NGnI8mnbq6bswgvHEFxCOWbG+k42YCbF/fPshqsg74/6C4IRFoa/P5ItIMGD2pzxot8GtPGo5k/cOmU2udbnHuqQashZNL0LZwkcq8HbNbzwMZ//4Fw5mlwryou8MpCq+TdneVVAjsTCAQfgmJ+x/YClg2RABAynIIfrwe8066xDPwpOfSUXcYv68m2Db9zKu3svMJ4RMe36Q1Qe/vf9m7OtGsgNYd+PIPAAo9J2+X5+7m+4iUc6X0VNqBND4/u8la7zboM8aEo1Mu/HVTdytsCL9r2sle8seN8a50IO4O8zl/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(2616005)(956004)(66476007)(478600001)(66946007)(4326008)(83380400001)(66556008)(36756003)(107886003)(8676002)(8936002)(6506007)(316002)(6666004)(5660300002)(2906002)(52116002)(1076003)(38100700002)(86362001)(186003)(38350700002)(6486002)(6916009)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CuWMf3J+JA4Egg13Uyayglh/xzmQkGh+XarjavOdhlCS5MV6cdI+hLEoWLBR?=
 =?us-ascii?Q?3jg5alJjHprDrpAiBwO5BN0EJOVs5TYrT23Xqu6b52bhqkCcRuZzhClXxOE9?=
 =?us-ascii?Q?oaXK3IRm862kMvtLaxbEMtxIP2g9XxvsekSv3BcOwDmIvGDbi+AJcAa0QncP?=
 =?us-ascii?Q?uotpvQe3VCO2P9JXjosPErT/poN7ElEjFHQx8qW37vGxN+pbsz09sLcRbiAg?=
 =?us-ascii?Q?++QkohY7msg1Wwsgbybmg64Mi7zGvNUjR+N9i9lhDWD1f6iDy99/uWc2umLm?=
 =?us-ascii?Q?5SZnd+Typf0ZDIT6xsjix63mN9a1iHVloU+hb7QrDiR9CSjBODjzaVQBw/Pb?=
 =?us-ascii?Q?UPH/4ra3N7kGUQE714eLAXqtd6BwMgujmYBQF1QLTVE2PSXVlpwlTFBi1Va7?=
 =?us-ascii?Q?0Xbe1xMtEuUSKPJ8lDACgNqn2TlLZNW56X5CaV7LZ3Hk5vJQ2g7aonFOKBLo?=
 =?us-ascii?Q?4+p4lmnwiyZnH6MV4CS/UX9/HtWnH9zc6EwAL/2CTuvk7n6xr209vDU6+DBV?=
 =?us-ascii?Q?2PAB5OrfgipCl8yyGFDUxvKVQ+Errkt2u8KYj0Gez/kZJem/ZD+qJDno/Cwz?=
 =?us-ascii?Q?XqRghtI8wt1FAJkEcIYrd+eUn7uS+91agbZSL7RRu+oTGgOGPXrP2Vg+oxEa?=
 =?us-ascii?Q?YK+hycqfU+h2EWhm921jsuIgRnmUXJuJAoLYsAP4QOAO+2cIjUGTgy9Y5p1I?=
 =?us-ascii?Q?9qm0DK8AWlYq6jtLa1+igBaxRY0DLgFhA6DnWgn85izvYcYhnJj6D2lilWfD?=
 =?us-ascii?Q?t6440zSn7DSXy9ty13ndrLRb71HZcjckD881Hbuw0DWeZbALumJxakUGVcUx?=
 =?us-ascii?Q?6Rf067d6SOB8pO5MwZLn/cO2TkiAXiJTWrQMXaKvKZygjgRc7k9n2vBjOQ5m?=
 =?us-ascii?Q?8xsolMooCLS2TdGed8Jfw37wRR+7ktobGNtfhnRwEPru7ILMGsHCy9tipDGm?=
 =?us-ascii?Q?Bg9k5XpG8thQX9/QtkD5E/8JoxQxIu4FyNYV6y0n1LXCwOO1C/tM9dUYDQs3?=
 =?us-ascii?Q?et2AYTViKGD8OyMBSoU/Xlc7Hx11yhD4+T71xPoLC1dmv1ucTHgUErQiVY8e?=
 =?us-ascii?Q?HVEMLfw6ywaMFB/qwBy0L+A20/VodlRbFhD6shLGCA1ObBcwJ7vsKmqEJXDG?=
 =?us-ascii?Q?DRLYUCsAQ7Iff4vqgfkkGqrErp91m1mNYGivbmDTCwQPx8vthTC3LTjtGjYA?=
 =?us-ascii?Q?u2gnLwATySCSkSJEPlcC8atPhNIgjlBKDZxTZgPnLQDgj9MOMltxjmArfCm0?=
 =?us-ascii?Q?Jk6Ydmbtabjlix+rempzu1+TS5mKGasDYXNNG78p29IMuQFWYOgS7ZZPZ5FH?=
 =?us-ascii?Q?m8G59YDySHE3WFkw2/DZ+ye0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05883406-9cef-4168-b17a-08d97c2d9af2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:55:56.6820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQIJmAl8my0OvNxKA29gQRkPz0g41jR15zL3F2HBFGRH0t6sbV4eEHUp2CYkdXppA0RjVJMwJQ4MfehnWvWE2YCTjneeVlE/5ES2zqQMF9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
Received-SPF: pass client-ip=40.107.22.122;
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

Add version of bdrv_new_open_driver() that supports QDict options.
We'll use it in further commit.

Simply add one more argument to bdrv_new_open_driver() is worse, as
there are too many invocations of bdrv_new_open_driver() to update
then.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Suggested-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  4 ++++
 block.c               | 25 +++++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 740038a892..24b773e69c 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -383,6 +383,10 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
                            const char *bdref_key, Error **errp);
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
                             QDict *options, int flags, Error **errp);
+BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
+                                            const char *node_name,
+                                            QDict *options, int flags,
+                                            Error **errp);
 BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
                                        int flags, Error **errp);
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
diff --git a/block.c b/block.c
index 5ce08a79fd..917fb7faca 100644
--- a/block.c
+++ b/block.c
@@ -1604,16 +1604,26 @@ open_failed:
     return ret;
 }
 
-BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
-                                       int flags, Error **errp)
+/*
+ * Create and open a block node.
+ *
+ * @options is a QDict of options to pass to the block drivers, or NULL for an
+ * empty set of options. The reference to the QDict belongs to the block layer
+ * after the call (even on failure), so if the caller intends to reuse the
+ * dictionary, it needs to use qobject_ref() before calling bdrv_open.
+ */
+BlockDriverState *bdrv_new_open_driver_opts(BlockDriver *drv,
+                                            const char *node_name,
+                                            QDict *options, int flags,
+                                            Error **errp)
 {
     BlockDriverState *bs;
     int ret;
 
     bs = bdrv_new();
     bs->open_flags = flags;
-    bs->explicit_options = qdict_new();
-    bs->options = qdict_new();
+    bs->options = options ?: qdict_new();
+    bs->explicit_options = qdict_clone_shallow(bs->options);
     bs->opaque = NULL;
 
     update_options_from_flags(bs->options, flags);
@@ -1631,6 +1641,13 @@ BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
     return bs;
 }
 
+/* Create and open a block node. */
+BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
+                                       int flags, Error **errp)
+{
+    return bdrv_new_open_driver_opts(drv, node_name, NULL, flags, errp);
+}
+
 QemuOptsList bdrv_runtime_opts = {
     .name = "bdrv_common",
     .head = QTAILQ_HEAD_INITIALIZER(bdrv_runtime_opts.head),
-- 
2.29.2


