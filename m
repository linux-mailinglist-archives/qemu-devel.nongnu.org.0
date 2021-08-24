Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C03F5A09
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:46:44 +0200 (CEST)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS4x-0000lr-Fd
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy7-0002US-Df; Tue, 24 Aug 2021 04:39:39 -0400
Received: from mail-eopbgr130120.outbound.protection.outlook.com
 ([40.107.13.120]:56386 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy5-0007HX-Ks; Tue, 24 Aug 2021 04:39:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7U5XEjMkAH1+d27DME7q6q8Pbjua/jZHOiFoWS+sNqxdAfYTjlmmej1TZ3eC9dZzVSLleddhcN/HQjZVbhd8T2UUgUKSM7kacjFKei2Lb0nY+iPIqL8z0R1DF8ogz8i0qHNlqVuyY9wGugkZXdk0t3kUoetUeR8HZeHlR4kyWZBENASpEOvmmkz7w2vVXibOWwr0kwDr6M6R0aZ+eiYCGtnOqHooeTtnyGOnb1TmHpAAgW4daA0ZfK2gpWsDZ9jIrtY4TVLgzenU4SNcDKD+1B9R/+d8zLEfaii2SXolRhaniPztrjv1lu+jN0RpJ8AG4g3htNLdUt0VqSPi/46Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=g5XbnCQsntKOi8f3xdjGPnybpZq1PJdwXhBglq5XCEBpVAb725SyR8TNQvTeRq2bDiOUCTqewYRqmh6PpYvyOh5UpmRXqatD8Zs+iIyjCSyUpB6pUMBcY7Vl/KGi33IDOtLkB75+mf/V9eN+FRwW/BlsYFPrpAW6wNuLUxVM1bDk/HAJjZy8E0vvekXr/gupjnDOVqyxyad6ysFXrUZQvD3GKlsw0MUy6XB8I8qQOOC68Kqx6H3JebW6qXBxrfE5IEE08ZodXW57LfgSo5Oigy5Y+yXdDgcHeL1U916NTZJW1chrqq6UryAESjwPXsHziUaxGJdQeqi39ovuTsS1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=qYnAVTC8lG/F9gmgnWab9GAc+XcWr/YjbkbLU+j/5u7f+I/EbMF3TcERySVnk1RYqR1E4LiYac++zYPtUL0ax/XhuT0YrUovMjDgtBRJvUFq/pgRQQ0t79RHz5yZ3pVvG0m7h8IPVFmr3MKAOjKMcCkcvfjkI4RrNCYgaD7ux08=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 04/34] qdev: allow setting drive property for realized
 device
Date: Tue, 24 Aug 2021 11:38:26 +0300
Message-Id: <20210824083856.17408-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 777bc9ca-5850-4d49-97e3-08d966daabf3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6533551E804F60B355F6CE3AC1C59@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3F6sINr0eS6uSbERnt7FZ2H/cRN7JGmiLhMR5Kw36iCHCVii11KVldfrZQsjlSp1bEl74gq33Ba+RNBn88mboqmdmwHn2wkYRY23o9gwkBz4JCQaKOv65+UWLLHik1jvs570VLFPNGhi2hz0gmjW6Db+xr3X1vdsAWGgFibnMhBFiiNfdLDgl7+wPwlzNrhVvjWJRJ9SSl9P/wfyE/18mu1IgB9cGhbH4O1lct+0+2GHJtiOrQXYFIjz0xGeP75ARC6Jf0zUXyRdMzlr7HjbDf9WIfgf4zRM6SLsRhSx3JEX/Bc3X6lNFURMHwzez9BXfUWD7L+Denet+WsgJD927dE9P4i0lEUNIK+s18DmCzWFBLzrOlroZUBUUiKYmSp8utaOhlbs57CycyOmgRTKWCbMzdaGAw40i8Qb0dOic47a+1F2BmDPM24hhyChpciq5FOyCMKsTVdXrpAm1yMF9BnQnw22uQkzLvEvJDJUOr/gpZ6g/ffHm2T5uXXdvphGSh2hNwzR4dK7EfqrOv2WIm1lrLX0iLvjNTWu++hyn30/vMk0D5KHk7xLjurXqpjs0VpgUiefB2O2d7uguhs+klhF99xl59997tJLAWy0c088nQXvn0rW4EucMbN/QDpl2tke2Mmlhz+Dp97Hpwvh1P2Uwkr/ZwuOZ5w4XDBZ1gimDASt549iubSpadza8jV9LmkxbXzq5GTPTW4HwPNSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39830400003)(346002)(316002)(83380400001)(86362001)(36756003)(4326008)(6512007)(186003)(6486002)(478600001)(1076003)(6506007)(26005)(38100700002)(38350700002)(7416002)(52116002)(6916009)(2616005)(8676002)(66476007)(2906002)(5660300002)(66556008)(956004)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDBHMDRXRUJFRk56UnlCOEZINW9vMEk4WlNsNXNlcnB0TGEvdVFCdlpUeW1R?=
 =?utf-8?B?c2NMeW5manBPSGh5SVdSWVgrdXV0aktkU0c4Y1dZa3NGZjBySEVCMENiK3Aw?=
 =?utf-8?B?M3FyTEVHS1lpb2dCSHZKRkMxeTk2Z2JsSGRmNUpmZncvL2prQXhWMiticWM4?=
 =?utf-8?B?MkdZUE50Y2p5M1pHN2lEUXVGSGtPSXF0ZDhWSDJqMHpZNVd0OTdJY0NWTXYw?=
 =?utf-8?B?RkNHYkhJUVRqMWlmSlVtNUVXcy9vQVRKOWRBVzh3OWxsNW5kcU8xYTZ2Nndz?=
 =?utf-8?B?MGlQVEIwRnpkSEEyTk1UMTBUL2JJQ1VMUWxrVlkxbks1STY1Qkl0WFZsMzAx?=
 =?utf-8?B?QVJCaXlXa3Z0RWtMcGlUY0tPZW9JNEs1OEZUSTdoQlhJbmhtS3R0OU5DNzl3?=
 =?utf-8?B?Z0hVNi8wbldDalRvYXBmMHR4cGxFOWdNeStJQVpWOVBFWS9hc25GRGhDaHlK?=
 =?utf-8?B?U1FQaDAwbUI0SXRBMmdSODczRGNDeDdzdG1RbnNBbDU1dm9SQUExQ3hZOXdm?=
 =?utf-8?B?SmhDVC9xdnVaeGFaMGRlSis2Z2hHU3lFdlFwSXg4RlpUdnFrY04wckc0dzZW?=
 =?utf-8?B?dHBpWXhiZVg1a0psMnZ5U04vT2lvSVdJYTdVSTB5WDYxZ3Fsd2FjNUhEVnl2?=
 =?utf-8?B?aXY3Q0ZoejdtVnlySDRaajFiNW5KUnZaL2tBVGpzQ3Vvbzd4NWY5N3ZwUXh1?=
 =?utf-8?B?K3dkaE10b1pDam9kTXAvMUJUekNnMUtLbnRZQkZQQUorQ1BkL0pBQ2JrTm9t?=
 =?utf-8?B?TlNBdStJbG11UkhHL1lOaFh4bWk5UEhtWFpVdlZUdjV6ZDVINlBXbmd5Y3pH?=
 =?utf-8?B?Z0hKbE9HOG5KZDBGMFBVSFhJc05tYmhNY3lZeWttN1d4TTZiRTZmZ3drMEY3?=
 =?utf-8?B?VzFIK2d3OUVOSitrRGhaTTY3L2YrTWwxMnZMOFVqbkxiZlNkaUVDa3dWL29r?=
 =?utf-8?B?blhaTUFZVGtxZHE1TE01cGlaTjlYa0ZRckduUU1CZ3ZSQjlPVUdCTkZGSm9l?=
 =?utf-8?B?UGI2Y1dycnU2ams2M1JyL1lQZUphZ2xhMGwzMkcybTY5WTk1RE90YnZ1YUFT?=
 =?utf-8?B?MCtlSTlqVFQ2YTI2ODIrQXZYcWdXVm5wSXhINTVvbnhNaEFCVExSd1ZweUlR?=
 =?utf-8?B?VWt5cU01bk1jcjZBdGhMVmo1V0JISHkvSzR6Z0RMR0hyd3dONlZKc1h0SDZR?=
 =?utf-8?B?SE9PczR3elJUcHdiVnplcVpMVXNGRW95VUR4K0NmUHViSzU3L1JtVngrSS9V?=
 =?utf-8?B?cjQ5TjlKMWJyRWhLUTY3NzNqTDVWV3hrQTQyQzRvSkJsdVhkWHozZ1h0Qnlr?=
 =?utf-8?B?bE1ZOHJ2WnBRRTExZy9Od2plYUE1VjdlMG9rR0IxZTFqbHVwSTBIZE9xWVk3?=
 =?utf-8?B?WUYxZGpGUXNSeENjaE5uRFhDOCtTanhoYUNIQ0RMbXhZOWZBZitrQ2NGVGRw?=
 =?utf-8?B?L1RYcjM1RkdsTHd1WjA5VWd3VTVTdS9YYnhwQlZndHZpcUVSZnhZSUI5TVZ2?=
 =?utf-8?B?SkpEV3NUTXZnekVSemk5Ym43L1Q4SEo2THVBd1FTOGVhWkZVRlhBOWVRTG9k?=
 =?utf-8?B?aUtjNTZxRFRMOFJNTkxlWmdsdUxFK0ZuVVhXNW5jK0s3ZXprdlVkSlR0bXBN?=
 =?utf-8?B?amlCUTZLNUJ1TUVHdVM1TVlGd1dvOG1TbU1tOThKVmdWUEJSVlZGZmUwTmlN?=
 =?utf-8?B?Zng2OHdaYzVXbHQzZjNaMTVYRUd2UGZPT2xvTHBCUGw4cnFRUXdEbjRLL3Nj?=
 =?utf-8?Q?xOfd2Xbv4G1USdk+svpN4PbhJyfIzIEyicPhZZ7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777bc9ca-5850-4d49-97e3-08d966daabf3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:22.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+EwV5Fgczv+SgxR9cQoMGokEw9CdHIEOvISPbUdcjPDECHj/iy0f+mHXe9YFvOBXbhYoyJdtUqHhXtVq+9x6JqaAQ3j8OEnfA2dr8mmhR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.13.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


