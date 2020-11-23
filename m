Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486B2C1590
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:27:30 +0100 (CET)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIQp-0000tR-8Q
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID0-0004Cb-M5; Mon, 23 Nov 2020 15:13:10 -0500
Received: from mail-am6eur05on2112.outbound.protection.outlook.com
 ([40.107.22.112]:43328 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICy-0007SQ-NV; Mon, 23 Nov 2020 15:13:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUFF75HCX7+iT8NJ9PI2O5iGvUE9tE6CfJDzLJd6+fmfe8NilSqHDdvBrp1njK9fg6SdBZ2zr4MKvMyN0MgyTY6x7WOLhJ0IXK3dP1aDmJDZxQXcvx3CbugHV5wGy1prOYbK7wG+ONTAhArJnO0OVbOw6tuP66GweRgGk/bOC2g9eM96CqbjWhF1FAWtGzrPoo0B1jF0gkPor1mLoYtFCqDhaByuk232h9HQ+pSZFBxcJHeEZAZ6XV7oM9KFIsCFMb0E/mR5k0ilfgbGEuGy5wydXVGj3m4g3sn1EgZmMh7tHTJ9vUWMygtW9dhTU1WoRvSA5y20FvlXckjTzwX78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSZyEDF+S8rmF+qAPbopWLxnIJXl7pAn2tDAYBVvQ+4=;
 b=lMswskv8ec0w/SIDDJAlKa2ojdMvDDSriyTQvHvMKn/H3fyQIBjgIC1RbbSTThqlo+vy8kcHiciFKfrr8tKT57FdEVtysWXFAHEFa77EX4zHIRqiYUd9BZ5RuxkAHbMPgtCngbZ/XYL+5xUcY6B60B6VGOo5CvQDh0iaedJys1QRfad40Z+0MslTUXnAxYAp2rkZ9k5YHRKtKOyoQ3spdIAq8eAEVKPX1ldGix7jxn3BTHdnEriMYJR+NhYGRfZpdxTsN8DG+qr/GtLSXsOGMfeeYG0zJOINWvER9LNMf/OMwgi94dEmJvcXqvaF0pz0QrK0d6dP9mI7SRV8gBAjUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSZyEDF+S8rmF+qAPbopWLxnIJXl7pAn2tDAYBVvQ+4=;
 b=iCasUXjM4AAL56P7Jo4RtWTNmdGB6hsPupw+5sSGQmdG3W++2vujnL9mjA+tM531ObgdturQhKhrSByUfO5/I/5uhZey7tk0XGYNApghTPvP1xO81dUa4LG1qsrqdkqTJSc7nc4B9MiUp/uHlOwOyr3XWxqchiZbUlotD7yxnwU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 07/21] block: inline bdrv_child_*() permission functions calls
Date: Mon, 23 Nov 2020 23:12:19 +0300
Message-Id: <20201123201233.9534-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae53fa2-384a-40f8-b602-08d88fec2af9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469098EDF6364E4D92838BCCC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpWR6Ld5WWPG+98yfYWAQmns+vychp4tpZ8ZNsOdvqwKGQZqENQ3cOGlbPELwWBKkpN2cW0pZ1hwLl/aOQ0RbBt4JOHH8zuwUavebjSjYDBIRMh7DNFIa92MBfqBAK2hxgMOKTrxs/ON4Al55w2sFSczd+LrPuK5eyDaIrgAMkCFNWoEEwEuCBm/qoM7vw9Wstk5cYQLcYXb/wE0opx7EAAQWmI8g/wXx04LxUpXo6Ir4C13b+uWz6qMX6Kck3LOZYfF8swyi39McNt9MjmeckKPDGaZaZNlaQIngBdIpuqRHTtJGaSw1t5FTJockrL0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: nx6vmBPxxydYWJ+hX46q2Z2gqlRugw2gtAyYdfLm1SOVurlKq4kIpNRk5xEN5NsmfarDf6NaV/7IQs7E/C57/CbdXrT7vhqMzd+7BWqvQVinIu4fHJJyrC5zE4YZVd3UvyxKEnBk1h54OyNnPbIC1RQ8aCDNy/G6goW8O0uUX2O/bkcsnxBjHOvQd2POxCSor53nFqgEDI5b1K8ipYobhAli4T6tOPFsXxJnr8bs7n5wzRlsLHrTgkcGH80GDgjl9D9YhWX6fUMBXdK8vMrOit0UGQu7iWlwRMCl36O+EtUZFD+7030U3FWd3JqD6ti3ie0wRd5oD9NcdP/3ZyfYGGZHtOHNp0k3yfqO2ABfrws6Uw9jhW4/KXkf8wBrFg6AowoD2m4wI8/DUSsoq8i06cxe9AyTRElU4acBxdwPUZf7o66jgELYfbgQmEIGRpLv6qfaGaNS7yIs7iPauoQoTm1lFtfNOnsPI6zVF92niqnIbj7JY04hs1+KROKlm4s7N+yda+/d82b0CE8XjldAKstK3r+BNJQLdsrZ6ExAmoKD/3NX74bH5LR5Ic5hiYJJCeqGEdNOTRk8JInKKs9Z0J0qDMJWXaCd2hioIamXr8TYtwf1RUwDIuZv/TlAJXP/NLROpDW6hu05UhPMdKxnHPXFdNPzWJ+x46RT7LKMVbyb6qO4dfsqdr9kcwcMmt+GijQXmBgjx4QmwrkSmrKT6alz7RSYInRS9St0Qat0SAlu8NVsRy1SydeBza/kKnu9Dw3B0PVut8tnVAtqbWsNt/a7lNIUYcLspKWc791GWIwfnDu6HQ4G3sY3e6q4W64dwoBcx/D+tJRB8wyYUgGKPqVVvwGQHW4UmZoN5VHinuPe8V6LRtHjdEkyIxvKs577Q2NlPZW+c8SGbEKyBZG6hw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae53fa2-384a-40f8-b602-08d88fec2af9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:57.1077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9QWdzlvPxGBvwbKXxuZoM/0gRe7aS+cmrE9Uwmz+cYCiKGx5mzDaFtbFBz+mJ0fTIK2kpVGQkcY02A2kn1c8Rwnh0zvLdgkaf2fhh6SvuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.112;
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

Each of them has only one caller. Open-coding simplifies further
pemission-update system changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 59 +++++++++++++++++----------------------------------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/block.c b/block.c
index a9e4d2b57c..22498b5288 100644
--- a/block.c
+++ b/block.c
@@ -1893,11 +1893,11 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     return 0;
 }
 
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp);
-static void bdrv_child_abort_perm_update(BdrvChild *c);
-static void bdrv_child_set_perm(BdrvChild *c);
+static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
+                                  uint64_t new_used_perm,
+                                  uint64_t new_shared_perm,
+                                  GSList *ignore_children,
+                                  Error **errp);
 
 typedef struct BlockReopenQueueEntry {
      bool prepared;
@@ -2144,15 +2144,21 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     /* Check all children */
     QLIST_FOREACH(c, &bs->children, next) {
         uint64_t cur_perm, cur_shared;
+        GSList *cur_ignore_children;
 
         bdrv_child_perm(bs, c->bs, c, c->role, q,
                         cumulative_perms, cumulative_shared_perms,
                         &cur_perm, &cur_shared);
-        ret = bdrv_child_check_perm(c, q, cur_perm, cur_shared, ignore_children,
-                                    errp);
+
+        cur_ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
+        ret = bdrv_check_update_perm(c->bs, q, cur_perm, cur_shared,
+                                     cur_ignore_children, errp);
+        g_slist_free(cur_ignore_children);
         if (ret < 0) {
             return ret;
         }
+
+        bdrv_child_set_perm_safe(c, cur_perm, cur_shared, NULL);
     }
 
     return 0;
@@ -2179,7 +2185,8 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
     }
 
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_abort_perm_update(c);
+        bdrv_child_set_perm_abort(c);
+        bdrv_abort_perm_update(c->bs);
     }
 }
 
@@ -2208,7 +2215,8 @@ static void bdrv_set_perm(BlockDriverState *bs)
 
     /* Update all children */
     QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm(c);
+        bdrv_child_set_perm_commit(c);
+        bdrv_set_perm(c->bs);
     }
 }
 
@@ -2316,39 +2324,6 @@ static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                            ignore_children, errp);
 }
 
-/* Needs to be followed by a call to either bdrv_child_set_perm() or
- * bdrv_child_abort_perm_update(). */
-static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
-                                 uint64_t perm, uint64_t shared,
-                                 GSList *ignore_children, Error **errp)
-{
-    int ret;
-
-    ignore_children = g_slist_prepend(g_slist_copy(ignore_children), c);
-    ret = bdrv_check_update_perm(c->bs, q, perm, shared, ignore_children, errp);
-    g_slist_free(ignore_children);
-
-    if (ret < 0) {
-        return ret;
-    }
-
-    bdrv_child_set_perm_safe(c, perm, shared, NULL);
-
-    return 0;
-}
-
-static void bdrv_child_set_perm(BdrvChild *c)
-{
-    bdrv_child_set_perm_commit(c);
-    bdrv_set_perm(c->bs);
-}
-
-static void bdrv_child_abort_perm_update(BdrvChild *c)
-{
-    bdrv_child_set_perm_abort(c);
-    bdrv_abort_perm_update(c->bs);
-}
-
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
     int ret;
-- 
2.21.3


