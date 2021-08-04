Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCC03DFE44
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:44:56 +0200 (CEST)
Received: from localhost ([::1]:52830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDSJ-00087b-7W
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMU-0004ea-Kh; Wed, 04 Aug 2021 05:38:55 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:22757 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMS-0005wf-Mz; Wed, 04 Aug 2021 05:38:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmk+pQYtHSr5mJ9nHIg+qDMMx1SS/iT/3eGM+OnMwwuB3SMzh1N89V1rq2tYHOZOkZNQ/2DvD7WXbUOTzPrLh76JqrFAxY0qlakz6+r2n+z0rFgzEnoqh2vUOLw//IFF4Zl/Vj0iLUB31lVbRigvu+2Y6Ke9cqMv27zP85RawNsHxlBh+acWxMhclPkJksfwYtk1QCrU56mm5TSLeovBjTTA1u+l26BO1j6uihakIZTLSPCQmkgF8Mj+MaEDCT7Z+HuV5XlZR92O4WiIPmHd8qDpAilDITJTZNMW7ju9X+ITxuAFfN0b77x1SkvXx3dk1Sa48zhQEVnqPWtlw79rqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=C8g6Uwjnb95vJo29Kns9TbSq+KLvjvShPlgi/Kp+nc8WH5M2Pxm5skpx9j1IKaouS6qgj8hQlD7bb7aMyaBjGmp1U/CQnVfhXjyS7EYNekltBtmdoEa4TQ6NNCsbH8Mjz/7+BFWPMZiJE1JDJEarL6bnswn6M1hOXiJ6BmsEG3qe4MIPoFj/QkpvrwasT4pfOGs8bhU8f9KvjFV9eHBXcENu8W0hFh6vtVfSm5hMsivokf8dCjt3PMRWYbwsDD5p1tnP14GcKv+3DIYwbwdUqQzcONF3bXTBJEFq0B9gyCUi47gK4pCmLvhmE95hPh2M+uPlisRiVOKZUlsZwtojCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=QpJd5cWzsPPk4G4+RMYazfAzghvUUr8VUsolAH4S327GRFkhaq/irR9kOPHE/BcXXqpm4DUCHudRSbKCHTwIglYq+E0FMeDif3Iv62FJ7ZxuL0Lrv6VSNbDHNqTGzSw1tuVfMse1SX+4tJhv/Wuek9VGBLnA4o/Dmyaebpe5pwo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 09:38:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 04/33] qdev: allow setting drive property for realized
 device
Date: Wed,  4 Aug 2021 12:37:44 +0300
Message-Id: <20210804093813.20688-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7c5fd67-c0b7-4ffc-65da-08d9572ba49d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3622F197E76E0045379E47FFC1F19@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PW8On3olQyx/RNRdqDL4JevPuRXnkQeuNrtPGWHYlUN9Lu83RDsNBCBCH4/wevehL4G+gGgbArDFTvKgGr//d8FeZKkvlLMuO0WN3rZi5qFJAOi/Bd4sUQKJsDLYhI+gy5PGO00gnCDcn23fqLxEokWFhDp5GZHvlkaRkArc6D6wz/arKrWlmhbVniytbzYucLrDI4eSaP80xCkgeXnjQXXu//TaloI5z/2RF/WJix2GsjcGU338H3NwnkQN3JbxY4oeIiJrbFCOEecwhHQvyicYvYK2JYwAZdCxbUBgZFi9hv+s2OgrHsV+mxc8U1x52XyGGN9CLiWdUYBmEEjh2tsaDV7yY8SpeeicbfihS3hCOd3NzWU/nXeebnHbVYb++oM5UM5z4mXypzKMq1IRTagaSIYd8fyRh4lDJLN0zlnxIURkAfSi8CpoIl0T9/03tMa57C5foxWcMhgu1z2vF18TrHXvqc7aYEyOYLEufvzb61xkPXckofoRB+tz/iBJK2hVYdLiCObGIu0uXNe8zO7gZDl1ZiT+SUTy/Ig85oa4gneqoPJVDOwN4dHYJ0fzzbYoI0CucmoBvY0wU6h2uia2qkArsEnxjLqSaY0HvfoKC/Hk7uns/4EjqVRug9mZ1zRXbfXs75/B3ozDprPNm7QtS/HCYwOOO/x9prT2gwbYYAk5masgIoKFt8LTV2eY3vVr/LwvTh1wPuQn5bLKzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(4326008)(1076003)(26005)(8936002)(8676002)(2906002)(316002)(66946007)(6666004)(66556008)(66476007)(6916009)(7416002)(2616005)(6506007)(956004)(86362001)(186003)(36756003)(38350700002)(6512007)(52116002)(478600001)(38100700002)(5660300002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy9rRHg2VEJ2TW9GaW40UWUwSGpneCtMTnh6cFNkU3h1bFBpTGRuUTNKT0R0?=
 =?utf-8?B?eVVSaXJSQ0I5Nk9vZExsK0xybzhlOTVWQldrUHpiaitxRzg1cUhEV3h1L2lW?=
 =?utf-8?B?Z0gxWDA1L0Y2RTlpNU1ERFBlc0s3REtMNXVmYXJWaTlWdldQOFd5eFpMUG4x?=
 =?utf-8?B?SWhWSWNCV1pmbUNoYzRHMXpXUERDOWQzalVpa0ZNa3RXWlU3ZnpHM3pac3pN?=
 =?utf-8?B?TnU3NVpUUXByeEdod2RMeVhha1NnWll2N210cDR6TkZueEtqRUVQZzlpUnI5?=
 =?utf-8?B?Q2ZUM1A5WUdPUXNLaWZFdFhCVmxXZ0t3OTA4aStQdFcrVExOakhsWStkNHZi?=
 =?utf-8?B?L3JXeWpmZlk1V05iY2ZIWmRhSkZxS2JnTFQ5Skl2WVRnOGRneVdTdVRsWDQ0?=
 =?utf-8?B?SHFCc0pVc09pMzluYkxVNTZUOWFhRHRkcitaMFpsZ0NCcE5IUDM0S0hyVE5j?=
 =?utf-8?B?aVVqVVUzOFd4MTdSMWlocVZITVNlcG1ZVTlJeDFTVnVGMTdXdTNoSUlIUUQ3?=
 =?utf-8?B?dkdDZWlBSWEvMkp3NHZnSy9RL2Vvbm91UUpSVVBuQjA2WjNmbStaNE91ZzJp?=
 =?utf-8?B?TkRnSWtFNVZvaTJLbkdQTXQ4eTNNcUdKanFyR2NqSFpKQ1RlNS82NEt4MFNW?=
 =?utf-8?B?NXJieGdQdDhSa01uSnhqdXh4TWZiSEk0bDVNRm1OaUtLYjVSUWtodllCUjRO?=
 =?utf-8?B?R2pEQTdydnpQenlnQzdSMDh5eHFnV0g1Mm9VNVZBU1ZoZXBETERZVEZZVVRx?=
 =?utf-8?B?a2gvZE1DN1BFWG4zWTNPdFFuNTJheVRLekhURXM5NURsZEdxMFhPeVlWSG5M?=
 =?utf-8?B?eE9PaHN2WHBIcjhyQzY1ak1oNFBUWHJZdWxFUDl4cjRwZDFWOWhkRjIyVEZt?=
 =?utf-8?B?bmVXUmp5OE8vQ2trL2xFZUNWVXhCVGFNUnRjL2FGVmJQNitEVU5YUnppRDJq?=
 =?utf-8?B?aEFKRytLRGYrM29lNWlFbXZBc3dBWmVjdDhpNkVtc0RpejRkSHVkZzA0YjI5?=
 =?utf-8?B?OEJGNUdueGptY0V4NVA2dEpmMmliYmpob0hyQUVXMm44L1V4UGdrRmpaZy9T?=
 =?utf-8?B?NmM0MVdmYVZlL0VyTWRqKzA5U0NDbDY5b2ZyaEdDekhHZlByRk42Vk9DZWRh?=
 =?utf-8?B?Szc4bHRPWnJveHlVZVhwYnQ4VjJ5VGtkUHdWaTE5dFhMODZkTjZQcUVrMFJj?=
 =?utf-8?B?TDBqR3RQeE81NC9KQUl4a0lqZnRVWGhpUE9RR3FqWFBFdllvMFU3Y1NJZmJM?=
 =?utf-8?B?cWM2WC9NZXdHK3FPY2R2VnExY042eGlTdjNQOGVCaUZjZW9SOGpRTzg3Wmtw?=
 =?utf-8?B?TC9FV0lxNmY0Q2J0aEZCb2wyUjIwRWdPMXFaMmQ4WHRTTjBEcFdwMzFnL3J3?=
 =?utf-8?B?bjJvSUtpZ0d3YmVDY05sZGg2c3hjbWJSZEI5WGZMNFlzbVVFYWxZcFA2WUZK?=
 =?utf-8?B?YktrUThpQnpXVFd5TUVQOHhsc20vNjRDUEZIdS9JSDJodnZSZjJ0dzh3OThR?=
 =?utf-8?B?N2NKemQ4V1VNS2xuVEdYekhUR1Q3R2Q0OU5saHFkdmtUcFdxTjNzekQyU21r?=
 =?utf-8?B?TDJRMThPc25PNE5yVVhibStLbWZCcVdBSjFoWEltNFBNQ2Z0bDlzVmJJOU40?=
 =?utf-8?B?S3d3aVd5Z2RVb3Fsd3dLcC9JazdmdGo3eWExWEVzZ2h0dTM4QTBxTURCT2RQ?=
 =?utf-8?B?VFI1KzJsMFA5T3ovazNrei9yS0VTRjV6MHU5ZmVHa1U0U3FrRlJSV3JERDg4?=
 =?utf-8?Q?39HPi8edGt0dGKcl9U7I/N7feAwjFMDN7Onp6PW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c5fd67-c0b7-4ffc-65da-08d9572ba49d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:40.8406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwQ1GWwuwZhg94XzcpLRDYQHVXCv/lMcoR4KoiuhzrNYpnYVpwUkkwSvXkJryDcC1N4/vrDMCPOKo5iSwIAfKAFbzl7NIw5SQMMZ+yijcDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.7.101;
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


