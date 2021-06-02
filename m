Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91029398A5A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:25:07 +0200 (CEST)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQrq-0003Or-KS
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfN-0000sH-8c; Wed, 02 Jun 2021 09:12:13 -0400
Received: from mail-eopbgr70091.outbound.protection.outlook.com
 ([40.107.7.91]:46453 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfC-0003E1-3p; Wed, 02 Jun 2021 09:12:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKH2mM81wAVu+YPi0Zjg5Z9cnII5hLQuBWRvrPcz5XWtwRcTrK7jsGEiNkQ4MCe/0Om/ueI9LCaruaRtcn/ksrEY0UCHfgF9JAS9ebXCh+yRFyok2m7T02sVCFeBBWJzHMlm873XIXugtVJKveZh//Lp6WzmQJ5E3KqS6YUcPQTnq74FhhB8K1GRNuXfEmwFH+/7xhgPd67QjSTUAOVIlgJJueQXmPWKUjRRi2amsj8JRj127eW6xwtldAiQKqRyePoVq8LocHm0U5saN4vLQD4PHUA0F+1UpVq0lHWXeQel2gw++lwa47PcxokYJB1lMnnMi/aenZIvO+QOCuV/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDvvfdk+qNZ/K0NLMJ1t2U6awdk74v/hZzY5n8Jf9Fc=;
 b=IlPbehvLnf4Zw/i/phTBOkDUo9fxCI6gMWkShR0WJE5+OCNHwFlBEZvgvouVYMKwX2Iy4wdmyAW7y2AQUSeTOYfNjSe+en3kg2qBhvBxiIvTFwmyPMcnzmQRdMnRISkti+mAqCGcUqeHPyUAmNqQkw+YOvlvNdmr0fiiU6oDb+dc3Y+SkGHfj5bqa87KFf5lm4on5wigKuovji2/karMcZYZRUSA33TiAtxFkz07NOYK6+FbMG1trdTAmDS2DYOWAPKN/J25Iml6IQ2uGj3C6Biu1Eg3OwvE95N2xwuob6j9K20JabPV7Jpn3u6IjyaweV2w66nVkNgA/tK1fj9aeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDvvfdk+qNZ/K0NLMJ1t2U6awdk74v/hZzY5n8Jf9Fc=;
 b=OmKSbmj/f52SmnQg3k0EHivG23hsE3wVheVZ4Zxb0MzVZKZYUEuSHxbDhICDXeAxPIl9LTA6f5kqPJ7LbRCMPWsDxJIjb1Fifhq7/iUuQ87Gx2NH91q5R5Z/tkoHeliPe4QUIPEX+2xVLmTParAJEDLl1I+cl7zOY9Edl63m9Rw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 09/35] block/block-copy: introduce
 block_copy_set_copy_opts()
Date: Wed,  2 Jun 2021 16:10:42 +0300
Message-Id: <20210602131108.74979-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e877ca9d-d438-4753-1a9c-08d925c7f4bb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376BB18CB3616F8E7F4FEA3C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cjN0jfx7d7UBSkxLR4l1MnxCANZTpytcck+IubuMIkLSqpu2aOIeeBJqDQ2sDvlqDeRDLPa2MqacjtmJkMkto/gg4+oanUFyGrviYJ3xM8IgnXiMt8JA2t++G4ww9lDm6G/TFuNheyEPh63CVHZVAfovOsWV0PHRhqV81YWSfZ7M/l9+dx5Vl7H963d2IC4cMrScUbprinjUIKdSVRrhseWYszABODZYaat2fUaALdy/7iGkn5dw8ikrMlEUDDYsNBqDD/UT4gPRjwHVojegDb/MM/SPaHvFoTGxE3dort6PL1ao0EqhQCguxGSCbz0dEeQhPG3+vap4gP++Yyj1Oj36Filf873mrtav74sfxmxa5Ur6nQSMF3+o7XbmBmbhtr6k0a/OX7PeHfjAcA1yc4xKdiRYK9jK/04OpCPwIaJA6j6dludOg9Yf+A/SAFQe1uccxrusa5mOxKzDDUMkrcXxZcw2Wp9ma9JP7W5UkaBnQ3qIUf2R1Uh1m6r6acr1pxHKIkcs26nZOkI9WocuHUsPHDgDa7onbpjAk3AfqNld7Wj8FKsXavS+izu0A0AijojHe/lfEUbJ8NccHut9AUjpbM0KB4htgAnOaEWEL1/zDsPr/06smxnkrhi+8qS+L4sehxcu6dzjqjHpQuPFl1K7vtb5v+t1NnW7dUI3Yy3IyqnR7vsRlbLD9MIZ4XAz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(6666004)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A3aBew6LqzwWSyqvJtmGffD2N0TvUXkjunFuRrcszIG5y6c4mty3W3XrwUXB?=
 =?us-ascii?Q?bRSAqZK2qO7wuThGwf6nzqgGxXnMwv1sLj0D5kjOOyyVP3mjuzUMcXhrAuyO?=
 =?us-ascii?Q?x071T6uhcPra5uq5vT9MKSLRdYr+O6vlkD/jUivNX78HiXSWyXv9NFnQwjKf?=
 =?us-ascii?Q?NaZkDTdcNP3CMfRfp3jABamsZYoql4peUP3t8uWYbel2CAamYv5QcmubdaLm?=
 =?us-ascii?Q?EDXPnnGntWOkY/MsGX9a09Pk8PNCzMekjvfbZj7ETnu8FCKTw3vfhNiDHzGK?=
 =?us-ascii?Q?SO38wLaGGzllA67kzTHWe4GfaiaVxPmftu0fZsG3hSko9lNYq8NTprHkQIzF?=
 =?us-ascii?Q?cOBXMHfCgKOEYfru9UVNMe5BJ0JsYjqz/J8qMnKFX2p9wwf9LBgZzJ+xAAUU?=
 =?us-ascii?Q?aGBK1SRvOXcHkcxDOT1HvvqrE2Kb5hthA5LnwEq98nblgVqw6a9fNG/eQQpy?=
 =?us-ascii?Q?D5gna6lFhncL9KL5ewaKAE3QGzJrn6Hi+jyT+DgetWQuQx7JW4Olrd/oNuw6?=
 =?us-ascii?Q?dz8B/Pd5oalMKSv0wTOdyJDw3yd/Hq09TFwK/x/Y1ktsOuyKb8kEd3D1NOZN?=
 =?us-ascii?Q?y8bVYhBiYr5N/S3s7oQUtRvD36AhGz+Re1OHuA/azBvKqAj8N2lHnslbFjdB?=
 =?us-ascii?Q?FHPm/KakIdBMpM11cNmTuTEsaOtl6JiIbsGg3+IIATLQn3rbP3GVnqhX2uh8?=
 =?us-ascii?Q?gFLZNcuKkuFU8aw1KLujNQUCfeAUUqWt3LyRW23jwM0/pBdEJX71+q52HW90?=
 =?us-ascii?Q?3jloXr9McI6O+XALQyBTtfN+dodvEA36EoFU591bP/u+S6QmF4NRn4/kY/CI?=
 =?us-ascii?Q?Hgzd2EQKcvzhK2yTFKnrChfGOBUmHmK/63b2d5KQprWwrOeS8jGjxE0Bt/HU?=
 =?us-ascii?Q?kfuFo8dyYgGpe/tV0oL/esjusF49nTafb+Hj+PdjZZH4/0XG9uWeNJbMUk04?=
 =?us-ascii?Q?9bcvb8BMV8p2RQLQzDX1fDb0bGvTjnawTndvw8bviqDr8Ykyi6nXfp20G6Wx?=
 =?us-ascii?Q?2aZZIeoeLPJEn/xpnIxHAXVIZCQAwvEfHZML0bZyk+slCzol39rX+dlVKq2M?=
 =?us-ascii?Q?Q0sP88T3LvjZppNTdwnfNoEuFMNY5g9IT+NGmndWmrNec4T4cUA/Ii325jzz?=
 =?us-ascii?Q?E6k3CeepKLHrkvjY9zc80k6h/BDH8u0UeSRj04ytz7YL7mCfVxC3wTdM2wDx?=
 =?us-ascii?Q?7L7Wfh8bWcDESYSlHUWJ/wMZaS3TfJBR6LNlW90HWr2J4K96JyMA0eFt2RMg?=
 =?us-ascii?Q?3c30HicCCNjhyEEVGThJUJxXMEApwBRm3wRVInCU8nsJz4k1NRz5ooBAAmx8?=
 =?us-ascii?Q?djE6pph9Mxx1O6S64CexUq7j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e877ca9d-d438-4753-1a9c-08d925c7f4bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:38.6120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/CbtbSFq0Gt+F6pLg2pzOtVcC53zxU+ex5D2DbBbBqSyqQYwh877I1QXF/Mq59RH9Z+dPSf7rA3yZ3mlmjHOkmNOlpVcixQGGCAxsOEFjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.91;
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
index 22a7c64c10..8baf8b9403 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -245,6 +245,37 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
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
@@ -288,32 +319,11 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
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


