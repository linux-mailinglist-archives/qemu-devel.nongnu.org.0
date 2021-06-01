Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD163978DB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:13:01 +0200 (CEST)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7wq-0007ZY-Pa
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bw-0002tB-13; Tue, 01 Jun 2021 12:51:24 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bu-0002Cd-4T; Tue, 01 Jun 2021 12:51:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrIV/OTuPyqZkvmyA6Gap58X1jc1pEqWpl9Ga9P/4LzHeMQz9pO2otpDPu9ECVNLX7vdLvrH5QCU0b5labm7yHx6NPOPEmCMKRges8Lq1XDI/gOozbAUFTBryZ7y4trmUJEdZMb1EPiXTzUFk67gZO5Kiy+P4MZs2hzZFTV6jcZVuV61IY2zKd8oexQhl/lYXJVG8V3k2wAKRJWy9UtKO47LFQ+gjq1/MwBY/2yVBtbsIdIzLBKFnYEeQohYYRAUAeAdTPidVDz0+Mpk71RmbcQ3dMJnvAbb22qFSf6nMyjBSinXA+mOIrcFM/7U6MHwXqbA3TTx6aE4dANpWzoyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=c6Al+gOL2Rdl0aZ+Oxxns3WS82aGQ8frT6uHeN5I/uwjBtGwazk6GH6Ve6s4na4lOMHL5D7fA6QuTXW/O74aaqeTsl73Id036JtuAJzyf/dAlRUKhn9lcETllOZTniJbE2FzOsqs4GFGceu9hvwvBWP97u2vbH+1XtR0Np9sxRmyqsy67DyEbpW2WavRHjqNPgSzbK+wE6RE2LuYpK/KpMlq4qsXdt8WW7C57k/qq+IM47//7aguu7BkeJFv43O4fPB9vQVMpbj3ezk10KujIOuZ4UUwOLTem8HdC19+NqKqmTntY3OS4bXSC5k4X7zwRjr/x3ChTv2kErS0ipPH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=Gt4fl6fghEEXlGI5xDwjvzniYhxFvS8ixSKrm6VSYkrdMbDOaNYhF09Q9SiceoRUjj1do3AvCz9Ad2Cj40NiTcDysZWlQERhZjvvBeRDC5GqRjPDhF4BYPscMSotaaU6NbuHzHA7dBUWMrp1ghoSCRthUJKEDkmQWhzXuHk2vYs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 20/35] block/copy-before-write: cbw_init(): use options
Date: Tue,  1 Jun 2021 19:50:11 +0300
Message-Id: <20210601165026.326877-21-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0780dfe5-c6b6-4f8e-5a70-08d9251d7514
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972C644F48340A159E87657C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4+4I/66AZySXoLfIPZwjbuaK3Vi8gZOjKBP9gjpVYE4Cvj2cG9JZv0CfdcX5YSqBbpK5XXa55lorQUQN00faw0nKsUfNlh0aj85JPKAyVOCimA2WrYYGYd++SttMr29hFqK9cp7enLU13nh8jpC+hp3CfsDxewKKMTHuSZdOt16ePdoNpwm0BbJKYulg3/uduvqwLluioCxFYUUg+6+kd5I21j4ElUZLxTezrDFFo6lZmbd2WceB9sGw35qnIjI1eaK/kQpbAILJzvHJXbS4l5l6TkXbUFXbko1k1Fhu0g/+pkbI8qWauQpyF5OFQflp1fETq7IGuFjmEvNVDF10HhGbI4y2rvkmf8WIIDC4GOR2bRfM6G+vyFIruHV0UdZ4nvCVIr+UdCM7vRJqDNYI86cFiixv01z3U2GlxZ5e53B930WH6cRchKNe6O/rZi73kljVxlOxeLVNu/dFK2Y7dfczouYq3n4VDmkyNWOQ3/XzQxQ1/N4QLdXBcDfrupsAJrVI5Dif2xckmd7qh7HdvsXLIJog42mQMwIy3gvaaU3wjJ6u+Vh1ueTC4Hct+0Pq3ddGl856a0l9Ttjk35324jFoN9TH/Xzi50i2r+kkhCqRSAZVdxV5ZTL4YTVK3ivuPeEI/Gc9TkDeTp9eMAc1Tpt/XlCjBjAmDqUSyeOgk2E1InQo9AL+n3yFk9XsM8E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(5660300002)(2906002)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(498600001)(38100700002)(4326008)(16526019)(186003)(38350700002)(6666004)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KnNVO7m/iBBobfL5CI2f9Oe41irjvhKWeVVbLeYMupx8hWospOImz+acNCC6?=
 =?us-ascii?Q?2ZJf9qG76tTJAEskhOjZ8zETQxcoYIE0+BZaXEeAwfxcCIxUDHkHkcWMy5Z0?=
 =?us-ascii?Q?v9sYO0pX1WCu9vrwqffG7BdbrQoWFYeSUPmeNlu7vEvGLMHwHjEk25fACSCh?=
 =?us-ascii?Q?/tmJnRR5MfVVResw3ts7nFgyAMBJlCKKYsP8nrXuzneaiOtttlVWt21jS0p3?=
 =?us-ascii?Q?bL3SJRD6W0CidHFoXly+8luQbxYXB1n5btzRc2qsJGlIl494pn9H6tjBJq7s?=
 =?us-ascii?Q?G044QB0I2tbaqkQcAiMuKzcn/SMCNROhbh7tAfr3xxj08k+o/AcmUZiVPAQg?=
 =?us-ascii?Q?nv6gyU3QQzw+2VH4FNY5DjaVSCy94DrptAGzGeBQNu56wY8MvCykqpJLxddH?=
 =?us-ascii?Q?fyNzUT3ahQAHkestzfXe9qWJeROcf71jOpIeVmLWd3EweWm2S70V/zLlXnrW?=
 =?us-ascii?Q?7lDa7BUjjeAkY+eBzIvexdr7s1rXUHNrE8bTSc23Iu2gJNvJzFEyn5LLfUkN?=
 =?us-ascii?Q?ddh2uqh6awGEgXH3N55TAVhQsiEV30z2T/HNC9O2zrLIDsJlMfK7/dq3lf6X?=
 =?us-ascii?Q?bi0Tm4RhstSUNl3wn/aJjZo7e2mFV8EEVGR69YGtpCYm+19vi+oDBoJsNZLl?=
 =?us-ascii?Q?FpkFMbZMpiLmg0fx+2iWMLLPTv+cn3hZpc3hGvrj5Q8Fs9iFhziSRC+o2Ngp?=
 =?us-ascii?Q?WhRH5Nd7xBrmayAkURAwRGkXBKESAFsh+kdWCK9XTCCJgROpIdrX1QI6tKzZ?=
 =?us-ascii?Q?wyDwVMOqQVnbT1w310C8+ZqVfMw5spvBV0AHEvEV9xQLZJuZaHL7yLKLv+Xg?=
 =?us-ascii?Q?0wQgdQyyxp2iSX4Cy8S195wtCNfxBwiiJ3KMFZNIQDGKbSJdUFUZJG9HCRPG?=
 =?us-ascii?Q?2X6fVVYYORh/PD/Kk3sdTd67MLrUy6r3NB+fPqt9hz0Q2PcMPMJ+YQnNQWzf?=
 =?us-ascii?Q?KnbBZKSBfkCALIa65IDl3QdbiWj/Xpox5jG72d4BID7sMvHC87CFOQ45PG4v?=
 =?us-ascii?Q?CDN8rC5VPJzDgxH4k8Ttops63St908HB5NQr028GxVL9kAZq/rzTR3MObju1?=
 =?us-ascii?Q?qDIUslnYmyJdtuycnrX+kOuBQRlaqVM5tyqWekW0RAUQvwXUJfa1AjruHHi9?=
 =?us-ascii?Q?G/bLXKeMt+RU/Bep1TmDiaY0morOe2q1g0k5QZlAqmmgJuYl9hgEJCCf7FGS?=
 =?us-ascii?Q?iMV6ZbonaDn2awrtKIyXC3iapoe00lVZjyz4uRCXmBVkeCq1ZdgfR43RWGqD?=
 =?us-ascii?Q?DgGfxoea6qUx/FbHa3/CUSKa2GvEP4/TPGfq9BuQYi5zOD/X00u4nCOQHlit?=
 =?us-ascii?Q?dYDRa/y6fkTiiNXmezbVTE6e?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0780dfe5-c6b6-4f8e-5a70-08d9251d7514
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:09.9198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BymmqwPZ6TZPjRcZWfPRcSEcJ7eqcYWfpWbeCvk58+JeX/trjP/iYeMLDZa1z3rI1HOyMDDWPUNSJowuJmpzEu5g2OsTHTr9jFbA3zzhfvo=
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

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1e7180760a..1cefcade78 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,25 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
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
 
@@ -209,6 +204,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -220,7 +216,12 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


