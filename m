Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEF38B1F0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:39:39 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjpq-0008Gf-B0
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZw-0006NF-Ql; Thu, 20 May 2021 10:23:12 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:8320 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZu-0005ij-On; Thu, 20 May 2021 10:23:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee93ZzLSnMciM1Qwdc6ZUxVRUKcW0q9FOcxFCtLEpWrjiIF2mv9mppDRP45HPH1qBz8DynagGBjgXQmowbldNOj6E0pgu1He6zcMjW9EMyozSsNJ7usni2bFPcEBNEJZtGtCxv7wvtL72XoyQXbKu0AM9l5uhFDc0c5xXOMAqcnYrnV0XpDV3zImRuhOTMMyRyEv+zeAEahd20Ou49TmzfqzNi2Rpz9OE+QJVpQ3P4uU/QJi9af2G4/P71N/Vyiukl1scBR3S6GLZBR0wEtuJThKD7obd7TcQKMoV+T72YV5zBqm+9KXVYIhK7eEZqdU5jyOcRC+EjFhlyW5jhwn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDA9K1JXkeUMHr90edWPnuaYvk89QAc3UVnpb6fe40E=;
 b=H1AEq13N3+Avjs8YJJ9k5KE+zBEoz7KrXhVYi75uYm3IbXLVTuNG2L5CztiyMgHambZHa4DHovBd+R3PAJo58RuBdtZherP6wV5Bq5IT81JZNHTl+W5mS1rLoxCLTyw1Tvn2+L65gLGFUyRCCSszA6tK9BR12ozUmQzJlPaPthYXhZLfs6KD6XmxpUKhVng0BpLPQDkHGPel+YEbgAM6ayYpq8jiXrLE7doQTX8gF64ZR+vWqE2dSR1VvWkJa6fhBItHdqZ5bpzVoouhzpge94H6BYg7izGjedOeIriJ/BGRPKd3Cz9sHwrPyhS4gh6cqEw9mOm4eb7ynfhOdAom/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDA9K1JXkeUMHr90edWPnuaYvk89QAc3UVnpb6fe40E=;
 b=hSwcf22yfiwDQEWuZMJAfhl/W4BKSDy1+B0HLJvQgulROwyX0EKGfJ/PHqoT0pCpmbipc3tCh+dO+uYvySB4PwHR3ycPH7nn9MdVuBTiSxkOqvXqiOnd1LbQ5hgAYYK/AlLgAbuXdjdH7vLajhjZQmnivi1uj1vUiV/TztHZSUo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 18/33] block/copy-before-write: cbw_init(): use options
Date: Thu, 20 May 2021 17:21:50 +0300
Message-Id: <20210520142205.607501-19-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f34d9a-2a49-42eb-e6fe-08d91b9abe56
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544465E491B4678B4B2BC71C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HNFbnzwmRZFKRiyQGfSQTVoqB+zUQKDp3slm64XPf3DXlV0Is5SIhiFeXDqyYRGHgioJjSWSd6zs5MTXJXQNiLFZUW1PUuAcJAiKldQrXV7dsJOh65SzCV0Wb/GlYCUxL55qHgm4ar9tX7In5GrBtisNaJ7A4tKorPpLJ2gLOY1OsjeJytOmB8xGOc8cKLgQrwvDrPueWykcBJC0cfv0o5DiY1JvqsYY3NCdyOqbt51waUzssvaXkReWMAPWh5ix8gQZpFAARuLj5fgIir/VLNemmsZBFwlaPiP+GSS2PM27X3BzIGY87iiDbMDw1eY2JMZxxEPlBpVVDKTgcf6ysbBmxsuU7P3Uv+Lw5Sr1hAsXBxDRVtwzhlqe3E/bcRelSKVtazFzSbZy1QajRy4oPvtFgKjo8YhCa8Gt1dmF48yg1DaWLK7iay3ItXbu9Mdk8yAA9A19Ps3iuZo6xGycW6+RO4at9ZHUHkt3PiGt0nAR0LeRmQaymK4cbf1IMvyBBN8j9X83H0jEk7ZAbcQ/u3BIkvg5Q5XxjdLUNJgQN4GgHMGIyIXLrC9BGHtGTxdlDMQ1p5eZsKVR7q7naaVbyby+Zh2u4mg6WWuLlN0OvAZeiML1hPhrdwhbApaaMHfB9A8B0+kMoplWpcsBBxxXrzttNv9aIFroOsenHCO5gwBA/2FIf143s0MbTvLzdeCb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(6666004)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jOQVgzj+QTKA16V7v9XppXXCj7L4Ut7jrk+SF+qYYzypdsJgZW1vF2gYOBUm?=
 =?us-ascii?Q?5lQuY6MYnwN/WBCup20DJd0P4BNfz68dsb4M8VsHPAjtvM8fmHbfgBO6J5ie?=
 =?us-ascii?Q?9uuI8M+TU9X+kWG0skwRnR4W6hMZMLM2H/+MWqUJ+N+PnipJB6E9aNP06hxc?=
 =?us-ascii?Q?KH+YwVqtoKtBJj4j9fSO/kNeY4UGMn65bI2Y/xcyI4AaE6RMKk2shsd7fpgX?=
 =?us-ascii?Q?wu+gQA0ZaSaMUaPfnJh2Di6Gg44bqJU08aExJL5OY8qGABxrqU4s2EkviELi?=
 =?us-ascii?Q?wNNCbxKkXvJiWd9SpP0m/VXd0LtVGBOV+wTAlXFy0i+uZgS0y6u7aWif60I6?=
 =?us-ascii?Q?inAa/j+Ap9K+lh97k1Vro1XLMmM/rpiBcRZ4dRkQ/uwMxIpekdxp9aZCvqiH?=
 =?us-ascii?Q?TaE7jO+1w7llOZB/y79s0x+lXNarmxWipNh28JvtcNXd3EoT7LPOULNmst8o?=
 =?us-ascii?Q?CQ5tgxntEHFLG4b93dxdF/HXaMNzTdqZAbwGTVLWS51zK8JiKG/lIJToqw2Z?=
 =?us-ascii?Q?eNb2kMKj0EJdgC/PIoFwI6MVznLDsEeqrMLTcaQf8J2S7xq95fOMQqPkuTs1?=
 =?us-ascii?Q?eJc/5cJ52va5gvha0JAFunBxlWqE521Gys0I5d/BDZ+g46PB6okeRSkn+475?=
 =?us-ascii?Q?CTPNW18v9ADFgkWysKt1R/nLqe6NJkkIYHJ3CxPnMugsqvU+ZomYHdhbvP0J?=
 =?us-ascii?Q?STdGreVeJthjuGbKvxxAGiERECPl8Iss6p0pEo/u0l2Gsq7+JTJp4iAxM/LJ?=
 =?us-ascii?Q?PA+oSbsSIKzf4YiyPJ2xQKkjK9CV5PESnG5ww6I9ZkNje3NWrVX3gKXNKv2M?=
 =?us-ascii?Q?4TYOOfYK/CgY2mAZJozRNKx/tvdqJCW87qoh3+TMNvsf4GSf//9MpDHZZx7R?=
 =?us-ascii?Q?lWTrA4dudibI25JRyUFf0cerTevrxmPR7d9Fz7ZC0gC5Sm9oJREju/wIYRAE?=
 =?us-ascii?Q?XGNayA+ruFrTA17F31Vj6wnpnyl/hQbp3zNahBQJkAntz5qtkrjmp7536N1t?=
 =?us-ascii?Q?CtwN+Awkwgyx8KCPzjaIecphbRjiteitPrKHIZtGmpzRrJa8K1sZ9QDzjPPt?=
 =?us-ascii?Q?uSH6d7r3tyW+o4J2UeR9SvuF/R0gmaDj97ioP1tgeX8BUyZYJfgqhUP/csw1?=
 =?us-ascii?Q?pyLk/7/zis+RFhU0tlUoknJMKKQJAZzxy7Riy7UQ/10KvEcvGmLDJNIM+7sN?=
 =?us-ascii?Q?3cKmzjJjVX0i682YEq8QjXEVi17wDUF4FKcfTYopsJ1+3a0XsDFF0xfl5AsR?=
 =?us-ascii?Q?9XaZu/UJzYA+uLRJ4V0j/DXKMLr0Moj0t0H2fyCuU1+BmKJaIjO+IaJCgVVU?=
 =?us-ascii?Q?4pcnxmaK1+KCqlYMvujI4UmE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f34d9a-2a49-42eb-e6fe-08d91b9abe56
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:48.3588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKITgsrIoeP/923M2xrTG5WmPtGvkDI7cHLDZ00PIudqpUopXSKQTHj9epEzBFlNGMVwJvHovDf8M0DLMDD80A8sSgmAmnybjPA6TQWLShM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 40 +++++++++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4858dcf8ff..e889af7b80 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,25 +144,21 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    bool compress;
 
-    bdrv_ref(target);
-    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
-                                  BDRV_CHILD_DATA, errp);
-    if (!s->target) {
-        error_prepend(errp, "Cannot attach target child: ");
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
         return -EINVAL;
     }
 
-    bdrv_ref(source);
-    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
-                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                 errp);
-    if (!bs->file) {
-        error_prepend(errp, "Cannot attach file child: ");
+    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+                                BDRV_CHILD_DATA, false, errp);
+    if (!s->target) {
         return -EINVAL;
     }
 
@@ -173,6 +169,15 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
+    /*
+     * The option x-deprecated-compress is only for internal use, to support
+     * compress option of backup job. New users should instead use compress
+     * filter, if they want output to be compressed.
+     * Moreover compress option of backup should probably be deprecated too.
+     * So, x-deprecated-compress is not visible through QMP.
+     */
+    compress = qdict_get_try_bool(options, "x-deprecated-compress", false);
+    qdict_del(options, "x-deprecated-compress");
     s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
@@ -210,6 +215,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -221,7 +227,13 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+    qdict_put_bool(opts, "x-deprecated-compress", compress);
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


