Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E939787F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:54:49 +0200 (CEST)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7fE-0002nl-H6
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bb-0001de-6b; Tue, 01 Jun 2021 12:51:03 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bX-0002Cd-Ts; Tue, 01 Jun 2021 12:51:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjxgAcH3XetDnTnvhMS2PS/8v1sTq6um1vMbK7laC24LCIeTtAuRHp/AdrsHaIIq+hRNUJq4qck8cMVh2yn9WoWOZYyn8w6P8xeA7cOP0q+nwTG8hNbYA1VShamzMKQsKlziysPZey2n9AefAFLYCzoWhprVfgu1GQttqfMk3zY442bkmOkPPoDxrHszKW66yhfdGdaDhA4AVbtoAZczbz21sreEgcYlnOHNjsn6dEM3q4LUFxZ+HX0I0B8N2Ki98qPKzzooecROC+geH8BV56RpVNXDI+aSPIzRiU3M3QUwTNgt5MC7sOIOqSNKRTi6rZ326TEFGtA6mqsRBq6w5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+3f3bH7RQ7dfj93oOHrPDR55bW/tkDL0KWBSBd2Q6w=;
 b=HSR3c7b464xRrclMHta/QOlPlghCbeZ3g4Zb8xZ2V/MNLWURnrzW9wwsmqFkrpMres7sP4tO/qpjwfbMiwt4Lm9dPd+kPEmCUmqdds3ds7imSZywU853x9whx8pEiJFpF8D+NINBs1PsjnK0+TMxLwjeVju4gCv41Wj2xRU4upELXHasxUWGlh77cY+uQNC0p43l0Fbpd1SBIMkCCGvgmrezrK9QuYqXVLTyrquMUce1Pd7qrgPNPbxak7qMfh2ahUqHmzL87Rny9hJUf081RIMAjgu4d3LhLysJ5XL1B5nYmMCP9ZjlXItua8oAM8se6J15IRA1nH8p/bAorpJFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+3f3bH7RQ7dfj93oOHrPDR55bW/tkDL0KWBSBd2Q6w=;
 b=R0efTfoFlDtaUsWMoU7DTze/pHh0Zk9Z5koH+PaW5yqXd3PMz2cQ3F6z2eEotWHsYXBEmvN6K1meiM8kxE0A3VuD5r4WTMccFodrQ8sl88S+24cmj7Tcg4qyMnjneIuIquOrJ/7mslyU4uUMDxs5XgsHNHCeGhfT+zaTp/DJGPg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:50:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 09/35] block/block-copy: introduce
 block_copy_set_copy_opts()
Date: Tue,  1 Jun 2021 19:50:00 +0300
Message-Id: <20210601165026.326877-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ec2c2e-3d57-468c-6c08-08d9251d6c3e
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB197222548313A22E2235FB7AC13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zRmxVY4z4K/x5jvXgajGBEUDNUjaPAeuyEW4irrJxxoMwLQTGp4yzsOdf9DT0pjUnBHqA+xP6KS/yr9k0aSxLKmdNn8eD5tEO8nORpjUCs7XUie3S28hucQWIl98M4IGidTYs4qZsJi+VZx7b8FJtxPMYJI08s5UqJxHS1yUVI3U0/xVxrUvBLVCSWn3/nycIrFVXluBN9IHxvlnax39sw5M7OzMUSUyzlgReDBiGMsDS3+zUwmaRPrkeD8VZoBw3s6KondRkzTrs0c0tKQ6WjsAEa4jDp0SmTBlf2YLBrfhP4kmWgNzwES+s0bTCcjVUIbTSqn+jG6oW1+XEwhtBvha0aw4Pn2ow6jl175TqiJA3dQ5R3W049cizSzaISrycWkbZzB217KoFZo/juBpvfYn7LaVeJMs4wykN/C+QVKoOQ1nFrPx0FQ+KH5Tt+iwKDsfF3oOgEQ2kzO1De+zqbrzRiVANj8YwNBJ9iA7KRvt/eJp7qzcTRaprcryRnZuYLcn8MN9PjELS7ClK0FKYXmv/Z89WUEGKFuuPRh0VOS2WOTScesVqaaZR8UjwsBZLS7lz01eEycRWzOpn4NzvJ+ovFUHZQVN2dpzuGTVltWueZ83keJxaYwHOq7ZMEyibODethsV2zR8D+5w59Ujjjd3dXsgagNuI9JcS+BgY3opvNQ+ET63C5EdLxwrIRb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(6666004)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zn0LFqPvmJBpjIzkNmW2yPacz9tb80nFPUTD8wBRSxdWPofA8tAdORkkpp9D?=
 =?us-ascii?Q?zJO/vqDGK9t/LER+vBen7ejm9qS+Qo/367cH+5tPiNTcXOZZXLhIcdbGaF4q?=
 =?us-ascii?Q?5ee2rxVym1jsIQzJBb97IeyY8Byu7QrP77+Q6ofVDA95gkFRbnMJpPTmrNT/?=
 =?us-ascii?Q?xjp1VKdYKyY4lKAnLf82N0p04Hvy/MBw0mMHiqUIB9MqMNVLfYI0EMdsx/37?=
 =?us-ascii?Q?ZssgebX70TIBgz/GfTbXo/EMzzC+YU3Bvj3q23Fw2DpZ0fcRJBG6UdMJEF+X?=
 =?us-ascii?Q?VBZc9ZzwcIwjm+GSozADTjZLecD3Z+hOQ7Mh1BAtSI+ZzScCbpvbXu2aJV1P?=
 =?us-ascii?Q?oRnJL91/PuET3cyQFlF1BXQJvyVwACp3AS2VYdPN8IVF1ghjgTcGMWhSjxDZ?=
 =?us-ascii?Q?fE2CuDQy0gMNRC8UcLS8DLjyhxB6ONzbSmstOQIlEms2aCENNcgin3uWT33f?=
 =?us-ascii?Q?RvU0iKb//u0+QmpB3++1f0XeKOsIbsJNRtS4ey3fBpWfZMeRiS81Y2cfjpY2?=
 =?us-ascii?Q?FkNHSNAA1eD7MlbVf2x08+9HONw2pgE9QnX0Db2Eb3cu1WGuQ/GdDIcbovDG?=
 =?us-ascii?Q?UTKAr+h6vBXdiTUhgt9+zsBDmcTtWSIif3/YOoPGPl6kdVYgui6sqTQ0rjne?=
 =?us-ascii?Q?EGJyidp3vBiBtsRfMnFTd1CLBIm2NXYRmNLAPJHDr3jfNDleo1ZP1tjWgYWF?=
 =?us-ascii?Q?GG1Rq67EM61XE92gorI/hhjvCrQnwJr/e9jG0Kg4F1eaeucPP7hGqjEyZqLD?=
 =?us-ascii?Q?Z05zSFX9Xn/Qd6QlG/tt9z0AwnpN6jFXBLPL1hmIgT8uEmvsXwxjm0Q8DTi5?=
 =?us-ascii?Q?5ZMzy0lnJ/ARfDvGsi9UFddx1axnUuEf4CICamcFWaopLdEZLA6ioGy0U86U?=
 =?us-ascii?Q?5cPSoRRbCQ4Jv1VQwQ8ntudrnWgDQGodkqfoqLe/l089YlAagwwnzw/zaHZD?=
 =?us-ascii?Q?sxo0yMYB5vueU/lJljrFJJt53yGMW4s44vuQwaFkAKz13R5t36ARkrhhSq3i?=
 =?us-ascii?Q?aCaWIHwyVz9LrG9W4fYlxuAN0EEmCEmVQL/QwaYkV4DurGOifaX1yxyJHHhf?=
 =?us-ascii?Q?+KpwdX5Im0dcoW8SVMouLkqYrnximQtbaBl0eZshIWK6JrFAGhC5lkCPurFA?=
 =?us-ascii?Q?coy6qxANJQ2uhClgfOk6/hUBOxEwe7KftQxBTn/ESdAKIIReEiKU3pwhNfm6?=
 =?us-ascii?Q?jAtRFlbr5uGS5UfWDH0bxwZp2o6gG3S/5l2YDP3DlYnt6vtZYGasLc6oU+gx?=
 =?us-ascii?Q?Xz4sXCxxMRsyAZNywL5O4O8j6ccK0VXOMizSkBIhCzzNC91LVFGEHdc7TmvH?=
 =?us-ascii?Q?czggAP+QBFqHtnY/z/Xy2ILd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ec2c2e-3d57-468c-6c08-08d9251d6c3e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:55.0970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZj/DCY1UspkMMiG94UtMJ36cK1SjCcN8OIcfm+76pPG6n2xTcGjSZGAacuN7Nmx8ISiYuuVD036suOeLnmaBhv4UDv3hQrw3G0vl2Rnw9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We'll need a possibility to set compress and use_copy_range options
after initialization of the state. So make corresponding part of
block_copy_state_new() separate and public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 ++
 block/block-copy.c         | 56 ++++++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index c013a20e1e..b74fb80067 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -26,6 +26,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp);
 
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress);
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 57dfef61f3..4922e1654b 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -243,6 +243,37 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
                                      target->bs->bl.max_transfer));
 }
 
+/* Function should be called prior any actual copy request */
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress)
+{
+    if (compress) {
+        s->write_flags |= BDRV_REQ_WRITE_COMPRESSED;
+    }
+
+    if (block_copy_max_transfer(s->source, s->target) < s->cluster_size) {
+        /*
+         * copy_range does not respect max_transfer. We don't want to bother
+         * with requests smaller than block-copy cluster size, so fallback to
+         * buffered copying (read and write respect max_transfer on their
+         * behalf).
+         */
+        s->use_copy_range = false;
+        s->copy_size = s->cluster_size;
+    } else if (compress) {
+        /* Compression supports only cluster-size writes and no copy-range. */
+        s->use_copy_range = false;
+        s->copy_size = s->cluster_size;
+    } else {
+        /*
+         * We enable copy-range, but keep small copy_size, until first
+         * successful copy_range (look at block_copy_do_copy).
+         */
+        s->use_copy_range = use_copy_range;
+        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+    }
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp)
@@ -286,32 +317,11 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = BDRV_REQ_SERIALISING |
-            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
+        .write_flags = BDRV_REQ_SERIALISING,
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
-    if (block_copy_max_transfer(source, target) < cluster_size) {
-        /*
-         * copy_range does not respect max_transfer. We don't want to bother
-         * with requests smaller than block-copy cluster size, so fallback to
-         * buffered copying (read and write respect max_transfer on their
-         * behalf).
-         */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
-    } else if (compress) {
-        /* Compression supports only cluster-size writes and no copy-range. */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
-    } else {
-        /*
-         * We enable copy-range, but keep small copy_size, until first
-         * successful copy_range (look at block_copy_do_copy).
-         */
-        s->use_copy_range = use_copy_range;
-        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
-    }
+    block_copy_set_copy_opts(s, use_copy_range, compress);
 
     ratelimit_init(&s->rate_limit);
     QLIST_INIT(&s->tasks);
-- 
2.29.2


