Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D403D0C5C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:19:52 +0200 (CEST)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69KR-0000aq-DJ
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697R-00073j-Ik; Wed, 21 Jul 2021 06:06:25 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:45473 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697P-0001sc-Jm; Wed, 21 Jul 2021 06:06:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArX6I7xhECk2DT6eh1pHwr8nzOgF69BkgzCR39geNrfveAn1wsQAq0kpEcQ30lmFu/Dokq/qJ8Q6Ey2yM0Ky5DIy24lCebk/4JnSImk1QW65BXYl4e6uSrLoTvLY3CoeEGujH9CQagWeEM9sjXhl/psY8XRY6US11cCNYxnbiVMqLkREdi9mA7phuHJJpMm9Vp5YfHdfAQq6b8ig/h6E4FxDy1D38MlvNZ5PBMK76eAEJsOEe/DCGGI5P1vlM6hgD6T/OIWt76TpVDIUJppwlJyp50t+J3oR9zQhkagILHOk/Hyt4dIzdV9jwzCJ1hqTUmpBIlOFD95yQQXU6m4NlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=XE8eYLK0IEwdEEqNGeQFby/yOYA31yojMQw77pxFcHPXOsCZ1rn46AVkqEBdtMF6p2nOrxeyVFjUvqhUx9D3Okw7hGaue/va+hjs/OmrYzyl3yEbz7hvowRSxwFakjjklTSZMm6NojUglqehQobNgZy8jmTn9PFIllufGpzC2xuP4Q8Scgz6w9hUg7KhIQ+EjL+B34bgvgB4oWugLzHo81KW9NQ4j/pwpw+4rTRdw0vknu3J511AmVzjLqANVwbmEUNpzL31i/a6HEqqDyWusHmTGoOSte6tziby3OyptsIuH3BjnEaGX9CEAv4ArohdcALHV6BrDhnbkN3mJcAwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=G+APvPBunyC7iYuaI2m13TBpq7uSs8Lo1K1cu7zK42A/fpBTUb6RUbJAIV7nVlzNi+Cgm19T47ki38MXvMdKWmgqGPP8qsqOC4DBiz5kAQY3JRlZp7SnEVn8U5JB2SnUS/suRNPLHifbJwK0QjGYg/EqCqvc02LCqGBTBZLjxPE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 10:06:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 04/33] qdev: allow setting drive property for realized
 device
Date: Wed, 21 Jul 2021 13:05:26 +0300
Message-Id: <20210721100555.45594-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f03b4746-8566-4601-82fa-08d94c2f2d0f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB41689D71FF4B264A74BD4717C1E39@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yqvf2IMrCB4BEOa4Kjb26sbHa7DT55AM5QhhfhMLQOPRYL8erDLsN95TN53ql5G8Obr/d6YfyikhKj48EwJtB8YLhuBtecEDeN5z86VAbYxifTrEikCfeBJ/tzp0yM3YTlP645ZJ+zonGE6WkodAyWZfXzmxP22iKsaxN9UYKKNTpVRFv1+dwjjg6ZitSk0fwtMVXDakiOa57na4enPmNj44KoBgj/akkEnfonSkGApNNEzdZ7BsAOrAnBXlIvzQI+f7K9ABkG0AqTzBLa0EZdQ/tFLl4HgSk3WWrGPqqzNmnkFAsb9ielrUDgOMASUousp7Uu2A1WcXdiln4h8agdBaaHq4o1vgNX+fuEhmewGvMKDverCQJFbJ3WikHz7NNAGG5W3ZhDY2OOc8BTBJibS39Rp9XQk+gH59Gc/j0T6VTHKqQERUmR5jWuGM69eyeOiKrphBxLA8RRIGx1uik95rD7sdQ8gvI0rfMX6SSFXrzRvFw1Lr2OHxVm9ri0Z1GoL2LnHGTZv7AgI9mcaguDdciO0LVmpaX6k80OlboYpwTyxATcX4fxUIwARS+4//YCzdiFONH0mneviejcbaOHrbesJV5u7W+76t4dlyBq69zQg8izC+7szFd5xVabfy3LtbrXp3iSSiTip2CS6j24hmwwolkCeERr++p6i31GO+dO4cRQm3zBwLy/OpQBD86ppWj1t5w+9Ru9KAxaeuUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(346002)(376002)(6916009)(83380400001)(86362001)(26005)(186003)(36756003)(2906002)(8676002)(6512007)(956004)(2616005)(6666004)(4326008)(66476007)(316002)(38350700002)(66556008)(38100700002)(6486002)(5660300002)(6506007)(66946007)(7416002)(1076003)(478600001)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFlGc3ZmQ0VoeXZyZ0pLbEhjVFN2NTFSbHpUdDVMM2FVd0cyNVJKbWlOaThT?=
 =?utf-8?B?RndleDVJaHhTSTNJaVpEa29zMUdvcWpoTlB2QUV6MkhsNVNPQnF1THVmVnlV?=
 =?utf-8?B?NG5oVjRubCtVcnZiUmIyR0ZHY0ZiZDhNNWRGbDg4RnNTMXZEUjN5MVVYTEtr?=
 =?utf-8?B?SVR5aFR6angyVXY5WHZWVlBDT3psMFdJTlNVTGpkS0VnMGp2NnpkakJFSUVt?=
 =?utf-8?B?SDU0YTkvd0JTTTRKdlZ2cDlyMEhQWkdsdDZCT21MZjJrSzBxelhiTityQzJF?=
 =?utf-8?B?eFF3UEloeE9xNTZMbG9KRVdBaWY5TjdEWkxGcmIxN2R3M09LN3h5Z1hBdENw?=
 =?utf-8?B?dTRtQWhoTm5IaFBuUUpCM0czRHU3THdpbmd1OWNuV3ZjR3pBY3hZN3YyRTVK?=
 =?utf-8?B?cWFtT0dnWlI3U2xRY2FNcVIwNkdzNEE5c1VoT2VmR2o0a1F5VDg3VGdmcG1s?=
 =?utf-8?B?ZWhDUitvUEVOTTd2UGFKUVBYZ3RaNVYxcmp1UDVMZmYyd2ozTktybHhFOFNP?=
 =?utf-8?B?ZUw2c0o3QmwydEFySHgxUGloK0RrYmJsd3REblBmNE5IUjMySHRJMnJ2aWZV?=
 =?utf-8?B?TTRaaGptMXZpUzRoZUx1cm0xdG9zc21FYU9WcU9EVVdOL3BSei9hZ1J3UlFw?=
 =?utf-8?B?cUYrdFpmTGpzZnF4U1IzZFBYSThnOWpOdzhDTG9JTHdwUmdPOXRxSjVlWnc2?=
 =?utf-8?B?L0pLYTNlVkRwakdNUlMxdHYrTXFHbS94OWZlQzdHdmVNNmhxK0ZKaFk5bml4?=
 =?utf-8?B?aThuSStHM0NwdkcybzBYbW5jYkM5S2E0cVEzNlBBQU1FNWF3ZFhZNWpXOEhm?=
 =?utf-8?B?cldaZFQ4bGowRGxzQWZuOVRQemtJaWJBaHpKenFDUW15VnlZUC9Bd2ExZ1dS?=
 =?utf-8?B?MmJNY2l1UzU0eDMwT0d6U0tBdnNOMjY3NFFmcHpVZHkxdzdBbFJhQTkwY0JF?=
 =?utf-8?B?MnpkRW5RRDhRZ2l5UTBLQXRTSmcvSmNkM0JXOEU2cnYxMmE4ZS9LVmY0dEV5?=
 =?utf-8?B?Vi9aTzAxSEovRXVocjUxZTVJc0kwZnpjS2Q0NzlVRjRzYUVlTW1kZ0tjVEU3?=
 =?utf-8?B?VWdGV1dxNmtpM3VIU0pEaGdTSjVDTmNqVzVSUERlV1NUSk9EUm1nUWlkTWdK?=
 =?utf-8?B?YVMvb2svMnRGRDJicy9tQU02a1ZEZlUvTW1SUTRSSUxCZk9LTHV1NVk3NmZp?=
 =?utf-8?B?R0FMSjF6Zm5RREZsdUkzWloyQ0sxYjhSTVRFQWp5Q3pTcDhyemZoVWo5cmd5?=
 =?utf-8?B?QWY2alB2Mm44N0pFV2dKenRhaEp3eFRIQlVGSVVRZHhwdGRqK0FDaWoyZ29X?=
 =?utf-8?B?WkIvaHNMQ2pSbmxCSzBEUmVBZHZUTkFjcFM0bWlzU2o1UVB4Sm1uYUFzUnk4?=
 =?utf-8?B?Y1J4bStESmYwYm5vUXBzSGxKbVZDblpXVTMybWdyQmh4d1AvWjNSRW1sbnJE?=
 =?utf-8?B?bXBLOXozYkNZTzE3UlNwa3ZaOUpRb2tmRUZhcTNodWI2cjAycWdRT2ZLK1VP?=
 =?utf-8?B?SWwvdS85UGovRmFzRldNNnN4clR2dDRTVGlnMlR1dkVoNTdWK3hyQ21EVVFB?=
 =?utf-8?B?cTVvVFUvMVVJVStQNlNuYkQ3c2tnYmJhM0xzWDV0Nk1QU2todW5jNVJtalI1?=
 =?utf-8?B?V1VIUHFPUkVvdjF6aGNBenpBb3hvK0N0Z1BIN2hobm5VcHJoTmx4UndlUlNy?=
 =?utf-8?B?ejhaY0tiVGd2VXN6ZE5zclR5aHQxVlFrRHYxaEdadzdVeStPK1lkMmdlVHZo?=
 =?utf-8?Q?ls6SJSjOh6+hXW0oSesXQaV/r8U4uD6+e0vf+wd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03b4746-8566-4601-82fa-08d94c2f2d0f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:15.4035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLZrBD1HSrIGOKPr41gj/JD9zAEZKSXQCZ/Fl6f2h8bOtRQbJQUZL7XV+Z67dWTmbDOxIN+DDqnbPFZ/NUuZvREon/8t4iuSQ+bSUBkej1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We need an ability to insert filters above top block node, attached to
block device. It can't be achieved with blockdev-reopen command. So, we
want do it with help of qom-set.

Intended usage:

Assume there is a node A that is attached to some guest device.

1. blockdev-add to create a filter node B that has A as its child.

2. qom-set to change the node attached to the guest device’s
   BlockBackend from A to B.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 hw/core/qdev-properties-system.c | 43 +++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 2760c21f11..e71f5d64d1 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -36,11 +36,11 @@
 
 static bool check_prop_still_unset(Object *obj, const char *name,
                                    const void *old_val, const char *new_val,
-                                   Error **errp)
+                                   bool allow_override, Error **errp)
 {
     const GlobalProperty *prop = qdev_find_global_prop(obj, name);
 
-    if (!old_val) {
+    if (!old_val || (!prop && allow_override)) {
         return true;
     }
 
@@ -93,16 +93,34 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
     BlockBackend *blk;
     bool blk_created = false;
     int ret;
+    BlockDriverState *bs;
+    AioContext *ctx;
 
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
 
-    /*
-     * TODO Should this really be an error?  If no, the old value
-     * needs to be released before we store the new one.
-     */
-    if (!check_prop_still_unset(obj, name, *ptr, str, errp)) {
+    if (!check_prop_still_unset(obj, name, *ptr, str, true, errp)) {
+        return;
+    }
+
+    if (*ptr) {
+        /* BlockBackend alread exists. So, we want to change attached node */
+        blk = *ptr;
+        ctx = blk_get_aio_context(blk);
+        bs = bdrv_lookup_bs(NULL, str, errp);
+        if (!bs) {
+            return;
+        }
+
+        if (ctx != bdrv_get_aio_context(bs)) {
+            error_setg(errp, "Different aio context is not supported for new "
+                       "node");
+        }
+
+        aio_context_acquire(ctx);
+        blk_replace_bs(blk, bs, errp);
+        aio_context_release(ctx);
         return;
     }
 
@@ -114,7 +132,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
 
     blk = blk_by_name(str);
     if (!blk) {
-        BlockDriverState *bs = bdrv_lookup_bs(NULL, str, NULL);
+        bs = bdrv_lookup_bs(NULL, str, NULL);
         if (bs) {
             /*
              * If the device supports iothreads, it will make sure to move the
@@ -123,8 +141,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
              * aware of iothreads require their BlockBackends to be in the main
              * AioContext.
              */
-            AioContext *ctx = iothread ? bdrv_get_aio_context(bs) :
-                                         qemu_get_aio_context();
+            ctx = iothread ? bdrv_get_aio_context(bs) : qemu_get_aio_context();
             blk = blk_new(ctx, 0, BLK_PERM_ALL);
             blk_created = true;
 
@@ -196,6 +213,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
 const PropertyInfo qdev_prop_drive = {
     .name  = "str",
     .description = "Node name or ID of a block device to use as a backend",
+    .realized_set_allowed = true,
     .get   = get_drive,
     .set   = set_drive,
     .release = release_drive,
@@ -204,6 +222,7 @@ const PropertyInfo qdev_prop_drive = {
 const PropertyInfo qdev_prop_drive_iothread = {
     .name  = "str",
     .description = "Node name or ID of a block device to use as a backend",
+    .realized_set_allowed = true,
     .get   = get_drive,
     .set   = set_drive_iothread,
     .release = release_drive,
@@ -238,7 +257,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
      * TODO Should this really be an error?  If no, the old value
      * needs to be released before we store the new one.
      */
-    if (!check_prop_still_unset(obj, name, be->chr, str, errp)) {
+    if (!check_prop_still_unset(obj, name, be->chr, str, false, errp)) {
         return;
     }
 
@@ -408,7 +427,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
          * TODO Should this really be an error?  If no, the old value
          * needs to be released before we store the new one.
          */
-        if (!check_prop_still_unset(obj, name, ncs[i], str, errp)) {
+        if (!check_prop_still_unset(obj, name, ncs[i], str, false, errp)) {
             goto out;
         }
 
-- 
2.29.2


