Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1083B3A2A6E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:38:02 +0200 (CEST)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ0b-00069T-3r
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpj-00031g-MS; Thu, 10 Jun 2021 07:26:47 -0400
Received: from mail-vi1eur05on2122.outbound.protection.outlook.com
 ([40.107.21.122]:49376 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpf-0004NZ-Pv; Thu, 10 Jun 2021 07:26:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpojRKfGtwj3Zz+qwK7y++gJ+rpOj5xsROLgZJFbi0K/uti52Tpre2zM3XLbHq5yWFU7oy9KCQsoO3ckhHyYTnn5uurzvnxsC/pzMnNFtyVzSfNkSx6gD4B+lX1SRU1zIEcjvTTdDln3qeaCXHoMYrnHyXclPi2bPJM2SOLI4aQAhzEYfMVHK7jdsrm5wsJJXYqWaANZYswSSgUpIc0CiN3CkjTOtC0wrtjvlR3E5h1ks4P0mzMEbP3OwtQy6coKF68RKYfHMUkGuFJhmffFP1P3pixFSMLHBk/343LwSX2YzdahNEvaFUelgE1wXAN8YSSzwfldQJxH3LvAUqbQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=StaOofTGTMkoLR3MCmDAZ5orrZtYaggUUVtYXBpKelEKZccXNlDK1WRxtFgVz0HhVjqR3tBiG0C1Laca8muXmv+qwKEbvkZ+1tKIf+dQUwWb+Grn/NGBU890twwo/xKPCbS56VpftQBjNLRE3xY43eeen67Def5Fp9Sm+yAI/UXgvRKYz5Ou+qTfGT46ak4Og2d+it6tGbldJsxL5kgrlfSp1pL6UQUJR+Lcn62ZebMjJ30ufZ9wPIz1Z+7mipu8es3sH6iu/Efty1eK1EK8kJa+NAaNU0nqeIyjPv+TVEVbIgMfK4VbR+POLVnsX40kJqYub8thqPqgXakaEApQ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=hJ72SNkkuRLvYU/66qvjg8Rzsf7P3LQXHeQ12REdeP7Ym3G7TKWk39K5QUeOrD12P+Wh2eGtHu4jlKmo7itRCgYslesWccL20uOTSoDIKwk3hywL7hBAr/mkVeONpByqvXmBJiomGS8CG7NRbLRgJXVvLUbkKMvGjw5EAy4rzJY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:26:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v5 06/35] qdev: allow setting drive property for realized
 device
Date: Thu, 10 Jun 2021 14:25:49 +0300
Message-Id: <20210610112618.127378-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8eb036f0-0b75-4144-ff2d-08d92c029e0f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB628035EF4A7BDEE354A28750C1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpgaC4u7SeQd34LAZMEmYK6KXsM0yOMw2ZVtE1+0ws9/mfXNg3jZXZq2sl+ZBApRmgGvQwnRfoxYrCrq99xQVSLcpEtv4TxvwZzp2cwpoPtw0YyH4MPy47tNnR5hVaG8baN9Dxxf+el+WimoH00feHswBSVvkNtG+e11k3MdUc4v+Iu408se01ypUiVsjqQhy6pj+WkJ3DNrKng2XzKdYG3vj3YeohyoktLsPGQgZtpTCBNpSBLHjeLAotMc9O+6g4LSgoQnNjOVj3lnI7sc2JSp/9HqX7htkEQV0pHcaZofbltl4CPd0+7l/tOPGoTaGEgsyytvbhKYGhOMvKcyOLPv7JVtIa+1/hB7+kOXeOp2BacnVrEM3t9AkRBviAJHLxwf6MJICGtAAHmP63LVGMifrvnL/o+02VJ8CQOCMlV1cPxxmy1dHiEeYoiPLGRSLQXbwO7E3ObZomCSYpyKizYmbvVqRYr78TRdQKTCVB3g8GWEA5e9MFkZ6zlbbRz3J4/8PC7xjCZJjkIBN7EIuTFtosQX8NR3uMtrouWQ5/np8B+lMe1KWnW3Dtpkg2NVDWrkqcytK+0sfzypnBKwhH3Oa7NQpciLF9NJ0xvKXyapEpFngxf6rVrBQwAbodeM1no3cYmmWx1t43VADb6cVV0wpjmvlP7XW5qM72gcEDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(54906003)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TFVGUzlTK0hnNlFWK3BVdmhwc0pWendMWmw2SEdUbDdHRUVZWU8wMEpkV1dU?=
 =?utf-8?B?R21wV0tsUUNheG02WFBzZlIxbWwwN3gwMmNmUmlMOFlGY2tIbkc3NnYvVVo4?=
 =?utf-8?B?eDdkZGY5NHM3N3dLOGNLQXdKVVllTDdmZDJ3Y3hMUytPSU51NHpIRnl0S2I2?=
 =?utf-8?B?L1pXbWpEaCsxbE01eE9SZDllT24wbEV2cWZOQnM5QUJzZTVTTmRmUmVWayta?=
 =?utf-8?B?dkplSmhKRDkzL0VocElpNkdVdHFZbGwxWENZL2p4TEFSTXpaV0lmczltOHVz?=
 =?utf-8?B?RmdoKzQzRVVOMlFwVGpPMDI0eFkwY1ZNTGpSaTMxOTZYNmVHN1ZEWVFweStX?=
 =?utf-8?B?TTV2bTdVQlA2V1NzZXg5b09FY2xqbHJwZ0wzdzhNMU9XRlhXTkR3QWljcEtD?=
 =?utf-8?B?dFpLejMrZ1ZISkNiYzBXMHBITzY2VmFEMDdjRkJUVHFLM0FUWFJIZEtFNFBk?=
 =?utf-8?B?T2hBYlpmSDVXYWpKWWNQVkFZbmJEak5iWUxtaVMzQ0NiNVF4TU1uZXBuQTQ1?=
 =?utf-8?B?THBnaWkrWmQ3bURGVWZZdW8wekdnSlRjRFBCOU9KdGdCd0p3c2RJdkNKWlFS?=
 =?utf-8?B?WTBjNmhuczlzdVhpcWlxRllVcWU1ZFJqejBiWUZUdWtaVloxQ08wcEpNM2l3?=
 =?utf-8?B?Vmc0Y00rZTM1SjNJY3NCTHJXT21Lb1BCaEVsNGtJeEozcnprMHdNZ1BwTE9O?=
 =?utf-8?B?bXRpTDJEN1NwMGVMcHBUVmFqdmFOUzZ2UGJwRUkvSUZnbkZLYnBEVGdQenlY?=
 =?utf-8?B?R1lsS2xHMkRqVFZCRWVONTEyKzlpeGcvQ05ZbjdYdEo0MXYyeGw4anpTdk8v?=
 =?utf-8?B?THFrSHcyK01SYkw1UUhacUNhOEdDdVo5Q2dMdHFSNkJnQnFVRkI3Z25lcmN1?=
 =?utf-8?B?MWtGemVKdi94NUlYTy9zdUhHMDhRUm1DQmFiZXlrZWFzL0lFU0kxL3g4a3J3?=
 =?utf-8?B?a0dDTGNuSVJDL1VDM2U0TEt5ZUlxNDBDNFkxQ1BSNzUyMU5aQzlHNnpzWXBv?=
 =?utf-8?B?VzdTZVBZV3BkbUNxQlpwSWIzcjR4YWt3TFFSYnhlZm42bmJtL3BweWpJQmRM?=
 =?utf-8?B?WUorcjNXNHAzTXdYVDZvVDJkLzY2WEQ1YTVJeEV4T2JWTTdCUCt2TGJSZE5I?=
 =?utf-8?B?d2JUcHhkTmNTUm1hS1ZiUStxb3lBeno5MVEvQng2SWNDaUlJVzc4ZHR5d2xx?=
 =?utf-8?B?V1NDTmFyS3hWQUVDbFZUd2FMa0NhcDMrUXQreWtQaGJ0a01UR1ErQU9pb29D?=
 =?utf-8?B?SE15RFlUbmtZanAwSGhScldYRlkyd1pHS3NOejh0aU1oUVNKajUrc0ZaaFhq?=
 =?utf-8?B?S3dyL2UxbThtdjNoQXVDR0Y1cVRFRHhZOC84d01mcnE3YUxwbkFLR0wwWEx3?=
 =?utf-8?B?YU9lUHRWa1lGZmxIbmNsVjl1bzJRcWkzcXRJdnlBOWNrdmJZK3l6VzFLYml0?=
 =?utf-8?B?WWRXS0pTbDlmY3laRTdDUng1VkVrbDVpdlpndHJhb3A1akhIZTBxWnhDQ3lJ?=
 =?utf-8?B?a2JXTFhxTmRBVkMvNU5sVTJwOGZncHNUdWt5L25wdXhJOXZad3BIeWUzdUZN?=
 =?utf-8?B?THNKSXl0MVFhRlBiV0piTzg5NTdSRksvNS9SeVRyQUt3V1N1azZ0UWE3QVJt?=
 =?utf-8?B?bjkrK2g5Sjhkc2dOem13VWZncXFzNVZXNWpWUkU4LzVkRFhFVlM5aGRqT0ZS?=
 =?utf-8?B?ODQvNithVkpmcDBSanRVTVVNcnhYclMyVG5IbjFueGZUOUo4ZkZLZXMwdG9F?=
 =?utf-8?Q?2+nTRRx3zLJ7bZFlC7fyOIhLkewh/pDgzrJASYs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb036f0-0b75-4144-ff2d-08d92c029e0f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:40.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbJfmLqpOxk93oLsG69/RdmwQmqAJMtl+0gEO3pW0oKx9j4zWyyzdCi68f4/0gMrq4vFDF9SgLNNRTV6MPUd/ZeM61IanfabvN0cQ1xjo+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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


