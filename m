Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CB4AF43A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:39:50 +0100 (CET)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHo8K-0005cY-Fr
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZI-0001Jt-Ev; Wed, 09 Feb 2022 09:03:37 -0500
Received: from [2a01:111:f400:fe07::716] (port=28271
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZF-0000NJ-OS; Wed, 09 Feb 2022 09:03:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY6ckh6NCcXUzmnxRYjgx4z/WA5GmS9Ozv6elcOpeTADAQPOTMnG7FP3i36l9IyqSCh+dXAHZrK4r7oqzHp2USu90U2nu6DrxPk7h3JZxHI2K7KxbbOyG/uePjwi8HhgoRf+aolKulExtRFV6BAdLLQNPqiA5r5kAQ2+iHDmND8vCLqY8KbF0mVG/3bPFk2HCltLJCaVruUvicaljbR4zIjSbPcnribzVpLnXuViqkb8geEjzAUUbfB6uEQQByldGvELPqBtsCF3rXsl84dXEVfP63rlGd5bZrEURGRfAmy54hrzNcb1NveIYJE0aZHpt2+7LJWaM0yRq8bOpXI1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9sLHXOJKkg3+df3Zt0LlqZDxDZw/Ifb2V+YvYYjaeA=;
 b=JQJ13OoGbhIYBrRRqsDEL/DnjsfNYDq48S2eg4FKQ4Vo+ApDllAASqLnz1HE2RhiY1ilheqXgwGr+cDptIYJaUge2nYGNKLuK9KoLjKv5QW7LiCS1z7Y7FraDaqnC+wCTwFFiYLR3XqR5lbp4IvDTExAZBkGcWo2oV3ffy3WrCjZDJcX57+VZ7WRiztEJ6g64LHEZogISo4orMWD9ZZ4/xrf/Y7O1B3vyc68u4wNmlB8ISvGPqyzBhxLj0xlYoFfHbAw/UdvcN6rFhClBIv2BV9yObm22+HQC8eNfPP5oVX6blW/1iwrNB/fvHJKNiA6BClVLjwMyPKJE1z3zRWucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9sLHXOJKkg3+df3Zt0LlqZDxDZw/Ifb2V+YvYYjaeA=;
 b=JLXGx2qY+kqCKc5TAWT9NlQM9RUERG6tWqGoNzjcJ+A3Gqv4tE1wVq/0mg5e/VxVXP6CAAClI1tFMhaZ8akTgEylz2uY/8wrmxzdLtdtHDHlzbrqklsyXtemG3BI3kXKh1J58MdHpdNQNnWjuvHMS5Tr7EZoSd1ApWDa5XtZUnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DBBPR08MB4460.eurprd08.prod.outlook.com (2603:10a6:10:cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Wed, 9 Feb
 2022 14:03:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 6/7] block/nbd: Move s->ioc on AioContext change
Date: Wed,  9 Feb 2022 15:02:57 +0100
Message-Id: <20220209140258.364649-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209140258.364649-1-vsementsov@virtuozzo.com>
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 746e8821-d5ba-4853-aced-08d9ebd4e976
X-MS-TrafficTypeDiagnostic: DBBPR08MB4460:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB4460DD4B62082B2BE2321452C12E9@DBBPR08MB4460.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ofS50hn3LiL+Hwf1DUOlxWuuwqnNY+rw0/x2qgQKXmBzSrvWH0h2VSI3Lhw0II6GV26ZIZRwpNNAZ/afA+Ut9HGUYPjDMMb6RrCD6n9LCVUXPO7UwEbQUdqyUT4LjphPrn8H4zA/2A1j6uao0/l02kUTgqATewnAo+Zvp+ZQEIm4heefrwwLEfrNYkWK8y0bExLLksTcS2WEYJSFDQ1DVq2lc0b044H7fl6sx6AZiE7zgSzR8eLhDeTq48tsYKh5Y1yyczvcWPj11drQgVv2TvtQn95R4UO3+InJG/hJEgaCG8DGHef74Mxivp1Y4YOUe+vAOI/sy0o48rC/S97/TsrQDzCmv3NAvZHlM8dS3haTsgNQtRHhXcRen9wS9AdME6+2jPGQJKSAlE236dSu4HzCKWOeguNIZkExCfBha5PLa2l6ox4YRBPbndKyeFEYa1ijlk73UbmVe0rUL0IE9nnxSbanrUkQJzy4cnqPPVi1lXT7X2GU5LkE2R0sDsmGj/8l9TvLFhaFol50RI78/X/ov+N+srXqx3Uiyjk8QOlGG1bRX3fcNsW4Kqm94svrRZ1XVDXJ+VAzxc6SBArAAFb+KFVguel8FyvUZHv2O03tBJoBDuJe1r+Aqdn4I9f93VqRewYqyVxbfS8NN9H6du8olareOV+/jbbf2TZeLOcpfOy7jFkv6GtIEZWyk0RM13e41m1uzYi6yDShDojX6coEcMnbWLTSkmboTmNQq4ngLt4FaPPV4MP08H/XNh0S/0yeIdbTaKbce1oO3jo0xzwVFeEWbEf0Os0YRpv6Gbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(38100700002)(6916009)(2906002)(6666004)(36756003)(316002)(66946007)(52116002)(38350700002)(6512007)(508600001)(4326008)(6486002)(966005)(86362001)(2616005)(66476007)(5660300002)(66556008)(8936002)(8676002)(83380400001)(1076003)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XDzNMFjVVB1ONgr04QeqFUKYeWWaKf4NvjZT+LxyJ/rZpN/pu61INRELUzEy?=
 =?us-ascii?Q?Pz5BPp/ZypmGZAZfinb9bqN5EHgxwLQ/g969NIDE5nH21gUcNLeIYdGzB2Sd?=
 =?us-ascii?Q?7apI2FgZ0hK9Hg8nfpzNCd+jLMKiY2R5Y9LSkwCJDDlrzf/sWHYJH7uFmNdS?=
 =?us-ascii?Q?spsFpV37XikSF5nPvKk0o2HPcux/M8IGOWATrXCa3gQfmXrq9TD+UY1mlIHR?=
 =?us-ascii?Q?+9z3TNhkpnYOeAf1MpdodiP8XdCzhE3l0+ATOVSsdxNO3da6orFtrbCa8UmO?=
 =?us-ascii?Q?4b4GJ6wBgbYuMPSswlWBWpHqudf0taNfwVaKVcceBrJ0JE5VvtRWqBHcHU8v?=
 =?us-ascii?Q?GUzWL9+qXPkJm0xtnJiQcQlL8Ics9jZPS8YH9GrXvhcDdJMi8QtEIjZLjzx0?=
 =?us-ascii?Q?TW4d5pITvLSgyB8eRJS7JxPP2A8wu6zwh2WbcnMQyltBDuKPBXFKHYDWTVU/?=
 =?us-ascii?Q?x1MwOyr15XC571AeqfpMaDW41asasryk20zkrgtVyOHk6s/HO8M9xk3DlrLH?=
 =?us-ascii?Q?DwzEaTd1oNKIeWpHBuzRmWFoXYhPrLIphULgVnzvFLSRJ5q+70yM6oNv5SK+?=
 =?us-ascii?Q?Kw2bOWwjXlQoSnS9x1wyRP6XI62Fa48A0SJ3pnwK7u8o1GUf/V6tjERbajnP?=
 =?us-ascii?Q?K7TLVdaF/F45N0C3DLS5f6UdJ/Sp6Y74ChULldLun6t4chvkV5mA+gyZdXC6?=
 =?us-ascii?Q?Dz4jmfGERYXSVsRtPmx5VVkco1feL7qzvXo3q7LzCPLD89wVuBOkpLhWMFxk?=
 =?us-ascii?Q?nD4cN0CeKMdjV3XAA6rRBcI7ZvKzp5AM15ihxy56qHiSunO52bJ4aMd3x495?=
 =?us-ascii?Q?38/gwQAExaBAkZSsLzWmvHsRXq1C5gzEWqHEa/FDLqXwdmW9LznCF09N773G?=
 =?us-ascii?Q?Mha4nt6A0U/KLRjeZIrjGMYb/Rb3ZIAP1NU8EM7gl9yPElhjwtGQwjxDkeJ2?=
 =?us-ascii?Q?WLwMdPDTBHxHSF5FmSo04Ta8rPL49D9VBQ5pp9rGwBiNNzhv3Q5XlEHsF499?=
 =?us-ascii?Q?BPQ+Di8Jo4syIVDIFNksVF5DOBG8mMieyI6CJgq1wck910IGc2uQrBk8yHWV?=
 =?us-ascii?Q?TB2ItPaG+QfIUti7h1iR0nYjqc0+NwLXb9GufBF2n5Dh4wnDTJkrLfYq6qH9?=
 =?us-ascii?Q?lLT45voKLxaAUo0LHzU9oXeyl4NjgtgAilI8Ojjlo1GwDW3d9FE+2/JLxZqz?=
 =?us-ascii?Q?fLTOJFT+y2MG7yQnUS9RkAv1UrJTGsKD7DfpY6gI+Pil3MAl7whU3jwq048n?=
 =?us-ascii?Q?Z7+anNarPj/xS+RURF71F3sn0KND6Ox8XHWz/7sgeThS/j2hK8zBxpgbSjCV?=
 =?us-ascii?Q?bN6sOweVULLG7sRQdQRh7Q6FipX+KkUmETyGtG2V1U4RnNh48rzJtXdNBNxa?=
 =?us-ascii?Q?PwOtiy/hiKvPS0If/xFRYcJmc/faCFFpMB/pNG9cG/7JwCFviJtuiOX3e7GA?=
 =?us-ascii?Q?aR0v8Y+p3MhTWb/Te5xxn+YJlWvwBlwGKlrft0T0g1d7qcGnEAixbrZqCFpG?=
 =?us-ascii?Q?EW3lh9fZ4rs8mNC3ggTHrWTyM1xuxtSsNFY+BQHtO6pCN/fuS4qOKTycPf1p?=
 =?us-ascii?Q?gxOveGsdQwVpcmZb0EbgVHNv4rkJtsMidLZttJWqGoFuKHpO5WMnUpqEoSm1?=
 =?us-ascii?Q?zdfZ5uVlu5StfFDh97wEanAN33m/MbrsG3Rr0xt4MQQrVchTGZg5a/4S/GIi?=
 =?us-ascii?Q?TeYwUQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746e8821-d5ba-4853-aced-08d9ebd4e976
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:13.3504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiyozlHyPTMlC3wXYwpUkGM9wt40OlzABRZpC2e6az8egJzx5/6BKat3xV9Sy+EcUxygire83kBKtIMVdcbhfvIL7yUwDBxzMXO0e3IsJp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4460
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Hanna Reitz <hreitz@redhat.com>

s->ioc must always be attached to the NBD node's AioContext.  If that
context changes, s->ioc must be attached to the new context.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2033626
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index dc6c3f3bbc..5853d85d60 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2055,6 +2055,42 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
     nbd_co_establish_connection_cancel(s->conn);
 }
 
+static void nbd_attach_aio_context(BlockDriverState *bs,
+                                   AioContext *new_context)
+{
+    BDRVNBDState *s = bs->opaque;
+
+    /* The open_timer is used only during nbd_open() */
+    assert(!s->open_timer);
+
+    /*
+     * The reconnect_delay_timer is scheduled in I/O paths when the
+     * connection is lost, to cancel the reconnection attempt after a
+     * given time.  Once this attempt is done (successfully or not),
+     * nbd_reconnect_attempt() ensures the timer is deleted before the
+     * respective I/O request is resumed.
+     * Since the AioContext can only be changed when a node is drained,
+     * the reconnect_delay_timer cannot be active here.
+     */
+    assert(!s->reconnect_delay_timer);
+
+    if (s->ioc) {
+        qio_channel_attach_aio_context(s->ioc, new_context);
+    }
+}
+
+static void nbd_detach_aio_context(BlockDriverState *bs)
+{
+    BDRVNBDState *s = bs->opaque;
+
+    assert(!s->open_timer);
+    assert(!s->reconnect_delay_timer);
+
+    if (s->ioc) {
+        qio_channel_detach_aio_context(s->ioc);
+    }
+}
+
 static BlockDriver bdrv_nbd = {
     .format_name                = "nbd",
     .protocol_name              = "nbd",
@@ -2078,6 +2114,9 @@ static BlockDriver bdrv_nbd = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_tcp = {
@@ -2103,6 +2142,9 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_unix = {
@@ -2128,6 +2170,9 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static void bdrv_nbd_init(void)
-- 
2.31.1


