Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706FB467EDE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:37:41 +0100 (CET)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFJM-0005cB-89
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:37:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8t-0000zi-GQ; Fri, 03 Dec 2021 15:26:51 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:27177 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8q-0001ct-3n; Fri, 03 Dec 2021 15:26:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc7dklqTpAKYdJJOQHKrEX6xztI05XmdMURD1zTpvZF8iKs603Pi3SqR686cXTFJQVQt13H3PU0+RmrVLZBIEnK/+7UlJxD3gwWO1Dyhqv+2FO0l+tdd3tDtbuook3t7nh9FLyP1A7q/SIiQylUDx4PmLVkSVCGXD52squbIyfKjGNgrL1wPvscu42ItPU5nd443QifyH5Z4rUYjpZF+t2c3zB7OfSBCaZ2FaIWc3OqHEbKhAULjt5wm1txpMTlVsqQWmYJZfeU5k0wwmZQHAiSEkngTa91JsJ9SmXDijLf4R9tRB6KJcKnhTI2b6lEK10rL1ukJ1l6Suf3j+dVZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc7qBEWxtgA6+M8pXOOBJg1yZJz9VgtKzv5IQWLbO34=;
 b=J6Lq9+bh788DVjCLfzcZUKIBCMVNNmEcJCxBAEUCuHr5KyDDWoHoLOSffUrUJ4pMQOAQXOUHGtrxMzd7FlV5ehe9gINhWRCGpjMGv0bcH3tChy4etGP0QpOTbhvAWIPU/oOxTYrkMMc2syWDHIp3uPXnt+NhPokSPeDjYpEc0BUBt093xkRscnQ2cGJMtKWmVRyxGvGa1mYy2ZueCEHyZoT+c2K5LpenAjkivtTN8uMUxYDbC6N9nBHavBiu792ur5HeOqJ+XOg8p6sSQV5YsIma71XSHuHZbU7RSQ3HmU1ZT+uSW8gIU1fE1PBoA0YYYsH3BI1wPbiz1WLDAEXxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc7qBEWxtgA6+M8pXOOBJg1yZJz9VgtKzv5IQWLbO34=;
 b=LdIK7XJDIJT9U+vmuTBcCM2U9zyyOdBXUjpk5Lp8fbiaNeiFuFs5iJIag52BwNEbT4URyRyyyGZfwjzYu1NFt3QeA9UGKWmc0lN06BsJA+JuWdS6xnVP+XExMgubBCHEUAeGQjEqAajNTmyCiQXLl8olLAnkfBisqxJaVfe7PDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4068.eurprd08.prod.outlook.com (2603:10a6:208:12b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 20:26:25 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:25 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 13/14] block: Manipulate bs->file / bs->backing pointers in
 .attach/.detach
Date: Fri,  3 Dec 2021 21:25:52 +0100
Message-Id: <20211203202553.3231580-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3546909-7aeb-4be7-7bac-08d9b69b2da1
X-MS-TrafficTypeDiagnostic: AM0PR08MB4068:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4068FD295E9AC8232C7D888DC16A9@AM0PR08MB4068.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4Ag5WAMDPojNlLP4QJjqtt8We+mMYAezUxA+QcCZ3ruLGU+LOxUDzzoq86fniUQOmMbC25FMYhQq0Oygv31vaV5NqJ1d1Y7DtLpbBunYPL9Whuprh5scdBkJWncrArhTm9XaAcVPJpGHvoSYNYl2HRnmlSfNAe66drNH6nq5NHJ/oWFohzZFoclsj4LZik9k0HvZ6475tMzN0/22E9gSxb0QFED651vyFSY5S3p22sRuTW8yAtVOKVXO8n8TqtAHQyRhZqUGD14XMaYUbWKLO10prK4B2Pr03LVUeGpriMr0J6NwbVrv4SErql+oMP8olDUfEQwLnavOGBiKK9YR/eD/53KGwZXaiGXWPDKVLY7L0FvOsuEiG1AvJ+Y+n1cdL8Ng17FGzzo4WqEqPInuD3OXyOsbedT52WKkBxKxwqeeYsyx5iqB14u2nKblbMXOdwt9vfpiiU+Vm5Cp/rzBHDdF6KkGSWPuNIqtNXRpNeEZ3fLUJduan46C2K14sz2CeLxuwsffGlpYwvLW+hK/yIRuhFveMDXokZqtZI63DH6DG2DkDw1sop9CMFKY/k+kaDhU4awC3c94TQjIpbVDMDjTIB1atRDoESf97nFQ7NHrS3TSh5h8SXlpq9A2E0XeJBGfYtH4HySE9FZsXk2pY1lhUuNYXpdT8IRC+U9ljjhoufsq9gK3mGpdNFq+uPOn7H49lRiic5bFEApp7QzJDFVgnkXgO6YTndLUUzYTPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(107886003)(83380400001)(26005)(6916009)(8936002)(2616005)(66556008)(2906002)(508600001)(6506007)(6666004)(38350700002)(66946007)(66476007)(38100700002)(52116002)(186003)(316002)(4326008)(6512007)(36756003)(6486002)(30864003)(956004)(8676002)(5660300002)(86362001)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3AuG9QcvW1t97dGn3eavJNFPw7u75jVnCB//EjJR/IQJ+kNGoliUNfck8hM1?=
 =?us-ascii?Q?BbWgK2HYLxhbvk567m1ro5UuIgSxjjQ3HVJnf19y7rV4PAQCSnP2N1R/rRNm?=
 =?us-ascii?Q?tVB9aZ8epYtCZ3VMbUI4GXPrKmrsW6U6W7ffaqer4CfRp2hqx5Y2TrNGnwIp?=
 =?us-ascii?Q?A27W7914NmhTXdsBqPOeQeGMjNNWSvmGRDvYXd0+wnaPlo3BN8kc+/b79ido?=
 =?us-ascii?Q?UO24A3+NhqDIJ4pzkiMhvXrp8BG/V+kIvJYfXGvLI6pZiXYfawUzPaDg29i2?=
 =?us-ascii?Q?dL0z2LVscst3OsmdcFA0ORNLQxHSAzW6IX32fUs7QD1dTPsU3xnuO4owjaBo?=
 =?us-ascii?Q?3gzA+yjP+H6Ciy31guPXHRaq1c/X/O8U4Vtg/qRMNwFF6Iw6IfVck23w6B4V?=
 =?us-ascii?Q?yiUyvFZV7Ww4S4yE7nLzJgBDBPfUgaRLBbBLRZDXJpfhMQpY5JguaTojYeIh?=
 =?us-ascii?Q?CUgfK5y3eSoneFwAP9Nvf7XN30TQVTRUsWb90gJqYT4TMeA1D8LgbTw8w4m2?=
 =?us-ascii?Q?XQoJ9F2PIJY2aWN7bkyJFOZXmZ4IOFHzBVqd0vSHDdd8y2PCmkGQMKKVCZnc?=
 =?us-ascii?Q?ADdmj2A5ktmKzk6WqD+HB5mkxOqXi09Qa5mS/wo+0pO9KP/Sj6xWhqfM7bfR?=
 =?us-ascii?Q?jQ/Uiuqv65m6/f5Kpfv4w+rUiTmDPh5M4AdkLFTaVKLvE4B9dLwD+uUisNG1?=
 =?us-ascii?Q?cO/RWEebvZGIOer2yS2SDWIydQhLGk6p+LPBZElK7qBrZU6gFRhvWI4Srhrz?=
 =?us-ascii?Q?MggFAj70yOqQTsD3V7CkWBJKpdAxUIQMQr6Lso1UfioqpzCmWR5nHkWqxZ+t?=
 =?us-ascii?Q?UurORmzHsTVmviMf/z4tTPFG0cmwG+xyzve7IN0k9KIzCB+fRLl3t74wDBqv?=
 =?us-ascii?Q?/e181j7fcq2qspRokMvbAfBlBsAjn6acaTaNQ4U52XqSdu+yN9wzul4cNQ2L?=
 =?us-ascii?Q?Y2wPOQFoWj3fsMs/DK8oh/zaPuq/Aqw9aLVvasl5SIL8aZyV5fxtTCWD6icJ?=
 =?us-ascii?Q?0PIAyoJAUWPiLeUpc/qxycrXh4nEZ1r5PHj43qtAioAYidILGs+RJSDBenri?=
 =?us-ascii?Q?K0hBY6unWLTzCx+4Xj5kAFewltDHV6x/ZKcKB0Jhijgq0hk+0ANddO8rCWeY?=
 =?us-ascii?Q?HiOjlAPvgh4PLo1fwvIjPKi00HceISdZXY6Rjjp/rh288PT43MKAyHF+nFlx?=
 =?us-ascii?Q?7711cRUdqzB9AxmA/TbRfr3rH/23Y0qHA8ZreGVGmv/kpL2uU3dMUleADrKT?=
 =?us-ascii?Q?Qy0FA932OSEy5qoJyl7GdkFbq/q5tZeZXfenZXaZbGe55/AVLyUI7mG+/EcE?=
 =?us-ascii?Q?kk2np6AUJL2KvwimAG0lMZwlvC0FhOQGT8tjwBv5d1XFUPVJbWC6yeYVNs4l?=
 =?us-ascii?Q?Sr/+j9yeTrxZHVbjX316f01q0P84Mp+yf9hZmbrEAmYoIEUOcuFgpCDXxknn?=
 =?us-ascii?Q?yesHHfKqmygU1/tpUCQMJZAP4zbVzv9H0LnIRESKAXqDHsEXBmBfRqFhD7Qn?=
 =?us-ascii?Q?mxFpnlbS8s8oGhqFtBy9F2aWEZGxE5+bEv4WEmcqDvbXkjCOtcowU94jVaYF?=
 =?us-ascii?Q?MD6B6gettWAoT+0mbjw+5PXuEAybWItzn1IXuxoLNVSrVnEAfOZ0N8zDoHyh?=
 =?us-ascii?Q?bDgHLXlp/yav6idLy2zF/BwDwPpTLOHGyew9UKYpMx5JIewrGIaLS2QRKtUD?=
 =?us-ascii?Q?OAvt8Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3546909-7aeb-4be7-7bac-08d9b69b2da1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:25.2634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ycq5yf41xCEShn38KlQag+sTlGdIj5UeMwP0INc3LGyubXlFq1tSO9ZC2SAcDZBwNDfuZ+vd1G6naq5us2n2vAYF38WubgDKBVKQBSEs00Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4068
Received-SPF: pass client-ip=40.107.7.109;
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

bs->file and bs->backing are a kind of duplication of part of
bs->children. But very useful diplication, so let's not drop them at
all:)

We should manage bs->file and bs->backing in same place, where we
manage bs->children, to keep them in sync.

Moreover, generic io paths are unprepared to BdrvChild without a bs, so
it's double good to clear bs->file / bs->backing when we detach the
child.

Detach is simple: if we detach bs->file or bs->backing child, just
set corresponding field to NULL.

Attach is a bit more complicated. But we still can precisely detect
should we set one of bs->file / bs->backing or not:

- if role is BDRV_CHILD_COW, we definitely deal with bs->backing
- else, if role is BDRV_CHILD_FILTERED (it must be also
  BDRV_CHILD_PRIMARY), it's a filtered child. Use
  bs->drv->filtered_child_is_backing to chose the pointer field to
  modify.
- else, if role is BDRV_CHILD_PRIMARY, we deal with bs->file
- in all other cases, it's neither bs->backing nor bs->file. It's some
  other child and we shouldn't care

OK. This change brings one more good thing: we can (and should) get rid
of all indirect pointers in the block-graph-change transactions:

bdrv_attach_child_common() stores BdrvChild** into transaction to clear
it on abort.

bdrv_attach_child_common() has two callers: bdrv_attach_child_noperm()
just pass-through this feature, bdrv_root_attach_child() doesn't need
the feature.

Look at bdrv_attach_child_noperm() callers:
  - bdrv_attach_child() doesn't need the feature
  - bdrv_set_file_or_backing_noperm() uses the feature to manage
    bs->file and bs->backing, we don't want it anymore
  - bdrv_append() uses the feature to manage bs->backing, again we
    don't want it anymore

So, we should drop this stuff! Great!

We still keep BdrvChild** argument to return the child and int return
value, and not move to simply returning BdrvChild*, as we don't want to
lose int return values.

However we don't require *@child to be NULL anymore, and even allow
@child to be NULL, if caller don't need the new child pointer.

Finally, we now set .file / .backing automatically in generic code and
want to restring setting them by hand outside of .attach/.detach.
So, this patch cleanups all remaining places where they were set.
To find such places I use:

  git grep '\->file ='
  git grep '\->backing ='
  git grep '&.*\<backing\>'
  git grep '&.*\<file\>'

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h    |  15 +++-
 block.c                      | 155 ++++++++++++++++-------------------
 block/raw-format.c           |   4 +-
 block/snapshot.c             |   1 -
 tests/unit/test-bdrv-drain.c |  10 +--
 5 files changed, 88 insertions(+), 97 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 919e33de5f..4ea800e589 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -937,9 +937,6 @@ struct BlockDriverState {
     QDict *full_open_options;
     char exact_filename[PATH_MAX];
 
-    BdrvChild *backing;
-    BdrvChild *file;
-
     /* I/O Limits */
     BlockLimits bl;
 
@@ -992,7 +989,19 @@ struct BlockDriverState {
      * which can affect this node by changing these defaults). This is always a
      * parent node of this node. */
     BlockDriverState *inherits_from;
+
+    /*
+     * @backing and @file are some of @children or NULL. All these three fields
+     * (@file, @backing and @children) are modified only in
+     * bdrv_child_cb_attach() and bdrv_child_cb_detach().
+     *
+     * See also comment in include/block/block.h, to learn how backing and file
+     * are connected with BdrvChildRole.
+     */
     QLIST_HEAD(, BdrvChild) children;
+    BdrvChild *backing;
+    BdrvChild *file;
+
     QLIST_HEAD(, BdrvChild) parents;
 
     QDict *options;
diff --git a/block.c b/block.c
index d57d7a80ab..0c6bbc9b0b 100644
--- a/block.c
+++ b/block.c
@@ -1388,9 +1388,33 @@ static void bdrv_child_cb_attach(BdrvChild *child)
     BlockDriverState *bs = child->opaque;
 
     QLIST_INSERT_HEAD(&bs->children, child, next);
+    if (bs->drv->is_filter | (child->role & BDRV_CHILD_FILTERED)) {
+        /*
+         * Here we handle filters and block/raw-format.c when it behave like
+         * filter.
+         */
+        assert(!(child->role & BDRV_CHILD_COW));
+        if (child->role & (BDRV_CHILD_PRIMARY | BDRV_CHILD_FILTERED)) {
+            assert(child->role & BDRV_CHILD_PRIMARY);
+            assert(child->role & BDRV_CHILD_FILTERED);
+            assert(!bs->backing);
+            assert(!bs->file);
 
-    if (child->role & BDRV_CHILD_COW) {
+            if (bs->drv->filtered_child_is_backing) {
+                bs->backing = child;
+            } else {
+                bs->file = child;
+            }
+        }
+    } else if (child->role & BDRV_CHILD_COW) {
+        assert(bs->drv->supports_backing);
+        assert(!(child->role & BDRV_CHILD_PRIMARY));
+        assert(!bs->backing);
+        bs->backing = child;
         bdrv_backing_attach(child);
+    } else if (child->role & BDRV_CHILD_PRIMARY) {
+        assert(!bs->file);
+        bs->file = child;
     }
 
     bdrv_apply_subtree_drain(child, bs);
@@ -1407,6 +1431,12 @@ static void bdrv_child_cb_detach(BdrvChild *child)
     bdrv_unapply_subtree_drain(child, bs);
 
     QLIST_REMOVE(child, next);
+    if (child == bs->backing) {
+        assert(child != bs->file);
+        bs->backing = NULL;
+    } else if (child == bs->file) {
+        bs->file = NULL;
+    }
 }
 
 static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
@@ -1604,7 +1634,7 @@ open_failed:
     bs->drv = NULL;
     if (bs->file != NULL) {
         bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
+        assert(!bs->file);
     }
     g_free(bs->opaque);
     bs->opaque = NULL;
@@ -2756,7 +2786,7 @@ static void bdrv_child_free(BdrvChild *child)
 }
 
 typedef struct BdrvAttachChildCommonState {
-    BdrvChild **child;
+    BdrvChild *child;
     AioContext *old_parent_ctx;
     AioContext *old_child_ctx;
 } BdrvAttachChildCommonState;
@@ -2764,32 +2794,30 @@ typedef struct BdrvAttachChildCommonState {
 static void bdrv_attach_child_common_abort(void *opaque)
 {
     BdrvAttachChildCommonState *s = opaque;
-    BdrvChild *child = *s->child;
-    BlockDriverState *bs = child->bs;
+    BlockDriverState *bs = s->child->bs;
 
-    bdrv_replace_child_noperm(child, NULL);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
     }
 
-    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+    if (bdrv_child_get_parent_aio_context(s->child) != s->old_parent_ctx) {
         GSList *ignore;
 
         /* No need to ignore `child`, because it has been detached already */
         ignore = NULL;
-        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
-                                      &error_abort);
+        s->child->klass->can_set_aio_ctx(s->child, s->old_parent_ctx, &ignore,
+                                         &error_abort);
         g_slist_free(ignore);
 
         ignore = NULL;
-        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
+        s->child->klass->set_aio_ctx(s->child, s->old_parent_ctx, &ignore);
         g_slist_free(ignore);
     }
 
     bdrv_unref(bs);
-    bdrv_child_free(child);
-    *s->child = NULL;
+    bdrv_child_free(s->child);
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -2800,11 +2828,11 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
  *
- * Resulting new child is returned through @child.
- * At start *@child must be NULL.
- * @child is saved to a new entry of @tran, so that *@child could be reverted to
- * NULL on abort(). So referenced variable must live at least until transaction
- * end.
+ * If @child is not NULL, it's set to new created child. Note, that @child
+ * pointer is stored in the transaction and therefore not cleared on abort.
+ * Consider @child as part of return value: we may change the return value of
+ * the function to BdrvChild* and return child directly, but this way we lose
+ * different return codes.
  *
  * Function doesn't update permissions, caller is responsible for this.
  */
@@ -2820,8 +2848,6 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     AioContext *parent_ctx;
     AioContext *child_ctx = bdrv_get_aio_context(child_bs);
 
-    assert(child);
-    assert(*child == NULL);
     assert(child_class->get_parent_desc);
 
     new_child = g_new(BdrvChild, 1);
@@ -2869,22 +2895,25 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     bdrv_ref(child_bs);
     bdrv_replace_child_noperm(new_child, child_bs);
 
-    *child = new_child;
-
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
     *s = (BdrvAttachChildCommonState) {
-        .child = child,
+        .child = new_child,
         .old_parent_ctx = parent_ctx,
         .old_child_ctx = child_ctx,
     };
     tran_add(tran, &bdrv_attach_child_common_drv, s);
 
+    if (child) {
+        *child = new_child;
+    }
+
     return 0;
 }
 
 /*
- * Variable referenced by @child must live at least until transaction end.
- * (see bdrv_attach_child_common() doc for details)
+ * If @child is not NULL, it's set to new created child. @child is a part of
+ * return value, not a part of transaction (see bdrv_attach_child_common() doc
+ * for details).
  *
  * Function doesn't update permissions, caller is responsible for this.
  */
@@ -2963,7 +2992,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   void *opaque, Error **errp)
 {
     int ret;
-    BdrvChild *child = NULL;
+    BdrvChild *child;
     Transaction *tran = tran_new();
 
     ret = bdrv_attach_child_common(child_bs, child_name, child_class,
@@ -2977,11 +3006,10 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
 
 out:
     tran_finalize(tran, ret);
-    /* child is unset on failure by bdrv_attach_child_common_abort() */
-    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
-    return child;
+
+    return ret < 0 ? NULL : child;
 }
 
 /*
@@ -3003,7 +3031,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              Error **errp)
 {
     int ret;
-    BdrvChild *child = NULL;
+    BdrvChild *child;
     Transaction *tran = tran_new();
 
     ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
@@ -3019,12 +3047,10 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
 out:
     tran_finalize(tran, ret);
-    /* child is unset on failure by bdrv_attach_child_common_abort() */
-    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
 
-    return child;
+    return ret < 0 ? NULL : child;
 }
 
 /* Callers must ensure that child->frozen is false. */
@@ -3221,9 +3247,7 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
     ret = bdrv_attach_child_noperm(parent_bs, child_bs,
                                    is_backing ? "backing" : "file",
                                    &child_of_bds, role,
-                                   is_backing ? &parent_bs->backing :
-                                                &parent_bs->file,
-                                   tran, errp);
+                                   NULL, tran, errp);
     if (ret < 0) {
         return ret;
     }
@@ -3471,14 +3495,16 @@ int bdrv_open_file_child(const char *filename,
 
     /* commit_top and mirror_top don't use this function */
     assert(!parent->drv->filtered_child_is_backing);
-
     role = parent->drv->is_filter ?
         (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
 
-    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
-                                   &child_of_bds, role, false, errp);
+    if (!bdrv_open_child(filename, options, bdref_key, parent,
+                         &child_of_bds, role, false, errp))
+    {
+        return -EINVAL;
+    }
 
-    return parent->file ? 0 : -EINVAL;
+    return 0;
 }
 
 /*
@@ -4731,8 +4757,8 @@ static void bdrv_close(BlockDriverState *bs)
         bdrv_unref_child(bs, child);
     }
 
-    bs->backing = NULL;
-    bs->file = NULL;
+    assert(!bs->backing);
+    assert(!bs->file);
     g_free(bs->opaque);
     bs->opaque = NULL;
     qatomic_set(&bs->copy_on_read, 0);
@@ -4862,41 +4888,13 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
-typedef struct BdrvRemoveFilterOrCowChild {
-    BdrvChild *child;
-    bool is_backing;
-} BdrvRemoveFilterOrCowChild;
-
-static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
-{
-    BdrvRemoveFilterOrCowChild *s = opaque;
-    BlockDriverState *parent_bs = s->child->opaque;
-
-    if (s->is_backing) {
-        parent_bs->backing = s->child;
-    } else {
-        parent_bs->file = s->child;
-    }
-
-    /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
-     * because that function is transactionable and it registered own completion
-     * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
-     * called automatically.
-     */
-}
-
 static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
 {
-    BdrvRemoveFilterOrCowChild *s = opaque;
-
-    bdrv_child_free(s->child);
+    bdrv_child_free(opaque);
 }
 
 static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
-    .abort = bdrv_remove_filter_or_cow_child_abort,
     .commit = bdrv_remove_filter_or_cow_child_commit,
-    .clean = g_free,
 };
 
 /*
@@ -4907,8 +4905,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvRemoveFilterOrCowChild *s;
-
     assert(child == bs->backing || child == bs->file);
 
     if (!child) {
@@ -4919,18 +4915,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    s = g_new(BdrvRemoveFilterOrCowChild, 1);
-    *s = (BdrvRemoveFilterOrCowChild) {
-        .child = child,
-        .is_backing = (child == bs->backing),
-    };
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
-
-    if (s->is_backing) {
-        bs->backing = NULL;
-    } else {
-        bs->file = NULL;
-    }
+    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
 }
 
 /*
@@ -5082,7 +5067,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 
     ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
                                    &child_of_bds, bdrv_backing_role(bs_new),
-                                   &bs_new->backing, tran, errp);
+                                   NULL, tran, errp);
     if (ret < 0) {
         goto out;
     }
diff --git a/block/raw-format.c b/block/raw-format.c
index bda757fd19..29435d3ac4 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -456,8 +456,8 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         file_role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               file_role, false, errp);
+    bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                    file_role, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/snapshot.c b/block/snapshot.c
index 12fa0e3904..cb184d70b4 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -279,7 +279,6 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
 
         /* .bdrv_open() will re-attach it */
         bdrv_unref_child(bs, *fallback_ptr);
-        *fallback_ptr = NULL;
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 45edbd867f..cb0eac5a1e 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1804,9 +1804,8 @@ static void test_drop_intermediate_poll(void)
     for (i = 0; i < 3; i++) {
         if (i) {
             /* Takes the reference to chain[i - 1] */
-            chain[i]->backing = bdrv_attach_child(chain[i], chain[i - 1],
-                                                  "chain", &chain_child_class,
-                                                  BDRV_CHILD_COW, &error_abort);
+            bdrv_attach_child(chain[i], chain[i - 1], "chain",
+                              &chain_child_class, BDRV_CHILD_COW, &error_abort);
         }
     }
 
@@ -2024,9 +2023,8 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
     new_child_bs->total_sectors = 1;
 
     bdrv_ref(old_child_bs);
-    parent_bs->backing = bdrv_attach_child(parent_bs, old_child_bs, "child",
-                                           &child_of_bds, BDRV_CHILD_COW,
-                                           &error_abort);
+    bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
+                      BDRV_CHILD_COW, &error_abort);
 
     for (i = 0; i < old_drain_count; i++) {
         bdrv_drained_begin(old_child_bs);
-- 
2.31.1


