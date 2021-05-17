Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D983824DE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:58:01 +0200 (CEST)
Received: from localhost ([::1]:59966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXCS-0006nh-Dd
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0a-0004JS-Ux; Mon, 17 May 2021 02:45:46 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:63681 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0X-0001xR-CZ; Mon, 17 May 2021 02:45:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9WlXBYAA4UkTyqSNWeiSm2FuJN3C7bza+1Xd5n3LzSQbeJBNGNNRSF1ba6pk1nPOdgaWjalags2CIUReHxZjKkVh7N3MqAkkL1UNrk1UjlTsruchduyhxxxlhukPOVOVe0hOniGO+BXb050vGbSVlS/kXjYLhkdR7blmgInThtlSmWPlJdG1yPgBUcSAY1tBblCGd45e69ET3c/xQhH7zLZ9lSKVXXudNUk9TEPbb1jozqPSxwkhvVnxaR4eeH9Mp/m3M4HeL4r274qLX3XTahdxo3kdaVtHRzwkSKz6HxWXuPcWEzab8mERc5BI6tj5dt8RkSnUBByc1J2fOQq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBrXjumhfEnp99vp6XokcInyPwKClfsIZij6dgVXOrk=;
 b=E7w+72kX6eDYXj8Sirv70DOf6jSEuXwDiuL/GBsHuQnX3qFpIZ35/C2DK9HcURVPiPiNMgs4eN0kudaVxOQrRF2R5Su7U8CUN74jLxf/TyoqcU/Idqy4OZCqkb9pWKnHCkC9l+LQrOCPqq4eI6yI5BNI7+xlX+EaSGc44iJlV4Uj+NXWtBVgHyT8liDC1ihWjdyxZpaMWBte01ySywHT5kwSCZEtTSiGHKa4NLmh9e4jY/Gch61xwKIhj7KjbjSuNhuy4VPphLuw2xF81M9Pv91OUt29B+k+SHj2FTR5UbqvfjWiMQhOnxYmHBjX73pUEZD1a0SpJ43xx4ji6kVmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBrXjumhfEnp99vp6XokcInyPwKClfsIZij6dgVXOrk=;
 b=qaLmYouHgHHR4QccoqSNzzp9atAxX0tGyhHFhF71c1aBpROKUTRc5xQ/7ORmPpXGBYHK5qaCA8W1V27am0JHfsfURWS/k6MdO7NTeam5OS+11w0VX/ZKgjFdQsmg7+5hTJyQvEti8LBNEtaD6wf6Ns2k0On4rrYJent0jin7QCc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 19/21] block/copy-before-write: make public block driver
Date: Mon, 17 May 2021 09:44:26 +0300
Message-Id: <20210517064428.16223-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3952e8bd-1b90-4bc3-cc57-08d918ff518a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4341BAF1EF5F192C705ACD54C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1Jq+j3MN7igeLwuf68QpIXfscwdI8ypsadkdgWH/cmj/QtcrR8bfiL7/4a4mT7bybmLymKIEyRHnaHf+phjWtO0k4HTwA3R1bOWCH1GyntN+oOiLOlJ7Joqqttzgx3lGibsPAszjxC9gxXatXYqOITUiNrZwyqS47ip1j6EcN9RAZb/f26xE14aZwVKnGGxlgICXrKGhDxCSDhRwLhiPz9jsw9Hcc1u8T9iWZWQ12sMHQUrpbIASPS+bJddIsH3QKoEg1AJwO1AgpJ1fp/uK4dX9gwe2yCVJ7LZvJoTVzCRCU2R5cUFjFEGB3TzzNefFxdPzOzOPyslNL/4KKHc1VSx6sHxWTFRJGMl0dKrh/B3qEAnkbV295fKMCxHr6xIbVaKJo2kE6bvVANMoh1099MIasmdhsmh0Xy6hOpDjXgADYkQQ97e427TgwIDGVmnN2UK2ud8wQT3MUeSFcfetyrNRq0FHIPN1jtdszDqwnSWNhYEv5GG+7mCcHibxjq2Zp6i9rvbJeFFIQmPytATXGO73Bm8msEKktnPLMMEoaEOKLs9f5V8TZvhnlRff2qwfwKKdsbZDUUvOl2i3q/j9qFChTKtf50KP8byjO0NHkuWpWWUJwtjmQsWyjyNSf9VAugb3uz4dcVFO5McLgNuhOFVnNOr1nKTQhF/L57dbePGXwaNW9TtzuzJH8v0q5Yy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ToJbPMlSiRo218ibLqRzcR5i6MIyH9yptAyY8XRi7rzfKWdWon/k2Di4lY0B?=
 =?us-ascii?Q?JLjE8UG22M8VYEdokliGydrwaOhamK3pX4IkMK3/m2BL1xGOOzSmZZop5xER?=
 =?us-ascii?Q?MooFcOTMquztP3/FKt2Tc9zIAKXl7ktpHXDw/UhE1YtXAypvPHuluUGVNFfC?=
 =?us-ascii?Q?rQv5tk58ot5kdSNOyA7q9Jz/YPVt2351HKt+mcIFR8i6TMRbaxtBpQ0vPLqO?=
 =?us-ascii?Q?lge+mrlar6kJ3YEnJYkvHYVhg1sYAzHeghOSGTTn5JZgPORnnLIJ2qnPUpXL?=
 =?us-ascii?Q?LTLt9G5CaBpd7cWJROxhop0wBejxv8xkyI57l04bksQlI3EcWtF6orR5oJas?=
 =?us-ascii?Q?zMro8kLRRubcI9IEerrwb0nAyu2+0DDDgKye3ClJaN7EQ+SEeUrGmLiLbcWR?=
 =?us-ascii?Q?80/Iiyr5ytRWZ0S3HD0YuElW3G3BJulZWvDN8jHg/tJbo1spkIV4oEN6nNRA?=
 =?us-ascii?Q?XCTK7Wk6y82AC3Yx6u0ws4Pg8Chk1xqroV+pl65zK4MzhECPBM3ePToV5ZEp?=
 =?us-ascii?Q?o5rK0b3kHNJrEqWU/A/6Qub2CdwJpo0MpgyPJk1J9L2DUoqfJDILQbjRH5lB?=
 =?us-ascii?Q?jpAmND+eEuLV5IB2G82eA/5vfK6ZX2B9yy8WHG/O++8gY+NVeI3cZQys5v8l?=
 =?us-ascii?Q?syjFnPZufe+Axki4HJWoI/nIA/BLOr1o6aAqlxnR1ADU5t/s0GnC/XYNRN11?=
 =?us-ascii?Q?3RMYsuGQXKkojAzERVmNGeD8iBR9RkQhoB3/eFqpM+Ynyl2kwfWkbPPN4F7w?=
 =?us-ascii?Q?q8PqfUcuJ1kWAh5T4OyDGx6AjzLrn3ZAJpjN6ABs324zZ7/QZzkaXnRWKQBR?=
 =?us-ascii?Q?nMapYPHIebXsIp6KC3v7Io1otDTqs+oxxJ8Xs41AYZQYHKyaFmWoS/C2gjOG?=
 =?us-ascii?Q?sN9eoW4Dw0qgbYwefvKwFBKk563anelfYEy9cWPOjRNfO09q9u1/2iR/Rx5f?=
 =?us-ascii?Q?VosFRa4lAzq1rIrF+OICpJKVZK8s+cnoVAOIKAmgtiDkZRw0plcoDeBO84fj?=
 =?us-ascii?Q?2Qne6fHxmDF7T/F518jCsBQlztWCYmtufD84mEbU1jLEzFzphapm9tjIyz01?=
 =?us-ascii?Q?UYryE9U9Awnva9xmxJr9xpZUVAddE+PrvAGHxPcqh5w/4c/KlBI7RfEkRxS8?=
 =?us-ascii?Q?TaGEgLDgs4o0fCyBu5AdoUhPf+bVutgcLrT7t0o9QnGx4vURU7SeeNNB3GXk?=
 =?us-ascii?Q?E5YhHIT7e01zKlNi/ZNJi+qmMKFj2OvOsmJUFfa1UVVYefY5N7BzHGYu/tY1?=
 =?us-ascii?Q?L5/Br5hLrUuAQOaUOG/LVzxLEifaPF4//6PDgU07aeoQ03PLcLcG8Gk1UtwZ?=
 =?us-ascii?Q?wWIoJcBY3QxTf0uFVdgAU9w1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3952e8bd-1b90-4bc3-cc57-08d918ff518a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:11.4996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0tZ/lZos5FoF1wuPwa0BKQqdNSZzmTe2uVoGEFtM8I3PNnMoABZClmSTll/2wEUmPi3lHHrQyZjDzh4bGisv8tQ9fC3O+fZgCW6JLs68Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Finally, copy-before-write gets own .bdrv_open and .bdrv_close
handlers, block_init() call and becomes available through bdrv_open().

To achieve this:

 - cbw_init gets unused flags argument and becomes cbw_open
 - block_copy_state_free() call moved to new cbw_close()
 - in bdrv_cbw_append:
   - options are completed with driver and node-name, and we can simply
     use bdrv_insert_node() to do both open and drained replacing
 - in bdrv_cbw_drop:
   - cbw_close() is now responsible for freeing s->bcs, so don't do it
     here

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 60 ++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 9ff1bf676c..20c933bfb0 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,7 +144,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
+static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
+                    Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
@@ -180,10 +181,21 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
     return 0;
 }
 
+static void cbw_close(BlockDriverState *bs)
+{
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
+    block_copy_state_free(s->bcs);
+    s->bcs = NULL;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
+    .bdrv_open                  = cbw_open,
+    .bdrv_close                 = cbw_close,
+
     .bdrv_co_preadv             = cbw_co_preadv,
     .bdrv_co_pwritev            = cbw_co_pwritev,
     .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
@@ -205,57 +217,41 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   Error **errp)
 {
     ERRP_GUARD();
-    int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
-                               BDRV_O_RDWR, errp);
-    if (!top) {
-        error_prepend(errp, "Cannot open driver: ");
-        return NULL;
-    }
-    state = top->opaque;
-
     opts = qdict_new();
+    qdict_put_str(opts, "driver", "copy-before-write");
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
     qdict_put_str(opts, "file", bdrv_get_node_name(source));
     qdict_put_str(opts, "target", bdrv_get_node_name(target));
     qdict_put_bool(opts, "x-deprecated-compress", compress);
 
-    ret = cbw_init(top, opts, errp);
-    qobject_unref(opts);
-    if (ret < 0) {
-        goto fail;
-    }
-
-    bdrv_drained_begin(source);
-    ret = bdrv_replace_node(source, top, errp);
-    bdrv_drained_end(source);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
-        goto fail;
+    top = bdrv_insert_node(source, opts, BDRV_O_RDWR, errp);
+    if (!top) {
+        return NULL;
     }
 
+    state = top->opaque;
     *bcs = state->bcs;
 
     return top;
-
-fail:
-    block_copy_state_free(state->bcs);
-    bdrv_unref(top);
-    return NULL;
 }
 
 void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVCopyBeforeWriteState *s = bs->opaque;
-
     bdrv_drop_filter(bs, &error_abort);
-
-    block_copy_state_free(s->bcs);
-
     bdrv_unref(bs);
 }
+
+static void cbw_init(void)
+{
+    bdrv_register(&bdrv_cbw_filter);
+}
+
+block_init(cbw_init);
-- 
2.29.2


