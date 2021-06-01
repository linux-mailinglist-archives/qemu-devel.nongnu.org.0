Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37B397887
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:58:06 +0200 (CEST)
Received: from localhost ([::1]:42638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7iP-0000uP-Sd
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bh-0001uY-BK; Tue, 01 Jun 2021 12:51:09 -0400
Received: from mail-eopbgr50117.outbound.protection.outlook.com
 ([40.107.5.117]:4526 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bd-0001yq-Sj; Tue, 01 Jun 2021 12:51:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFeXke7lVyXW/I7Ldp+MgOfwU1IWplLrwjVKI18j/FQcLmU/yQOL/OcWTpCx6AoEnWgqn2Z4GQBuelOXn0VtNfGcLnIhvoX2F82toQq+MVsZWawNIUBCo8I5iQUTHLMEoeKiPGonnHbTUWoPT58irPwRkwcwLagriaWU+ncKZUnkGnOa192frwYqknIjBlTt6LKE4aiAJ2h6y2eNUqB4QdwPPl2WQ7nfAGj1B7zGvD7S07NjVxA/FPtLkrJy2t0u4Kowww43knqmH9P+wD5besZIFwQm/uEO8ADGPjDbnYPEERKHtTeFlUDMG7UJIjm/zG0+q9sJx0O0j9QSGVWODg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=EEs3UUL2JfOkDQV9Cv9s2mK6g+dXZJFY1OSoX0DxCs4myUjX9kJ2uY471rIRPkWZchfKjtFMZtlVyB89VljDhAltaXEJAM3bor7n1Mh8YcQQZZQG4osjtVt9uxPpBbUuhCx6Aw+nlmzWX9069cgof9p1nWI3iHoq3kAhT5Z5PqaLMkK7hpIZiZwyINHLB/3yPfGHi3LbW+5FzxcKXuDDRwxP0kNkNSTS2xomalFR7AzmSoyazKDrwgqPAbhIwlk23YSVfT1QWbSE+Njs6eOOm+vxbjvdqMpxXt2LHs7pjchjDDfyWz15tVNeb0N26OyU0CuyRmJBP/NE78XXjoUDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=CsiYmrLpuI6mBuLeTtwOZ9LoWU7jSAyngH4DV2qCnviCkkz+z9zyq0sX20DsBDawopR76BKswJWiP+QDllzg9TK9aLmytIzzJ0FVeIMISEIa+tZUgr0lLHYrvwlEWTJxGQGT3QqJDiUVVeZgb/JP8g/JVVVcTQsgR4vCbXfafp0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 06/35] qdev: allow setting drive property for realized
 device
Date: Tue,  1 Jun 2021 19:49:57 +0300
Message-Id: <20210601165026.326877-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a98a185-ae6e-4019-359a-08d9251d69cc
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44719224C7C3CB0BA4207AEEC13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vOoLqNY8xZN0ML9dRGDm/p0uubjvaCFnuRYv6VibTt5whqIqzIRDSeu0tM8s9uJfAli6rYjO8UeQYfHisnYaXq6/CfDTIoNXQ3wb0b8lHWiPf65xI6kLtz7ruMyG6M+pZ7eIkoz7RAP2JHKMM4NXvOOHQ89HF0mk/DaApuuEreWNR+NP3MOkPaz6bgZPmzui9AR4JrliDmvLWyxJo0yVXf3tHDeJzt12ORtT1s4Okes1PnV36NHTIWC7IJpJT0kybbZjdLcFjzZeWSEJx64nzYvxBGxyUf2WReMQWecwTaAvucim/Bv6H3RatpqRtryZO0IR6vWinSYWeYGYcPhKMHV5tXVtSwUmeU5P0JTq+UZpJbb6EDp4xvlmTlQNk1DPJpfz93+1JUjUXL8AnpzWwgXD+KJzx+WAqt9qDCQ/lciyqKfuYNz23DTf52JPPY6hTAvo+Ia5YHSFv9fqbngGSmGgMInN/RXegic4a+E/l2ltZPjLpuZ9jmL2aw+Moq4T5YcY1AV5lM3mt/ayIpzNyDgq4rB3zJzSHuSRsAayV9SwnyxqmyqffufcTFNXNeK/BW670mN0W1A1XSEBwfd4IULS5VsIQr9oHIM7l89sbIB4U1u63YJhpDbNvA4f+hzVtdT5unt3xfBan/L7JhSadA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6666004)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cklSdUEvV1g5WCt2aXRnREdLSTFocjMraEd3ZXNZcnlncVU5TmxobDZ1WVhv?=
 =?utf-8?B?akRJdTRRcDMrclppRUpDTTE2M1pOL2hnbHh2eGk4QnJhYUszSVZuclAyR1FZ?=
 =?utf-8?B?NnhBZmVSSTY3TE1rRENObHg4UEd4clVsS1hyRUwzR2w3b2lRSE1QeDFwd0Jn?=
 =?utf-8?B?RFZuK3B3ejNEY1J4WkFEOVZwNGFOcTZ5TTAyUmkwMGEzNkZXbWp4Q1pENXRZ?=
 =?utf-8?B?aDlFeFlEZXc2T0NGTStHeW5HQkFFOVZOWFRoQjN0T21pUTUxUFFHMnR0OUhN?=
 =?utf-8?B?TUo1ZEdTNlE5YkY4ZXo0S1dTT21JYmtRUFpKOEo2SEoranZ1enJMNWJCd01D?=
 =?utf-8?B?MTdmNmNwQ0RaZ3RxVXh3MmN6ZlN6eHE0SHp2RlJpRm85NW1EL0EwcHp5WWdG?=
 =?utf-8?B?cFVFMGFtZlA4M2h5cWszMkw4SXVwOEhSaStSRUFFYU1sTGk3NktyZ0cvNGlJ?=
 =?utf-8?B?Z3czVDI0Y09YcFMzc1dzMGZ0LzlRSzc0cC9pak5UclhuQngzZlEwdlJaWkFo?=
 =?utf-8?B?K1lZYUhVajRjRUVPaDlsYURvOFhGL0IzSS84WjNiU3hJTHpISnE3VjNWMEV2?=
 =?utf-8?B?RGt6MnBibHM2MTZYUEFJbWtXaDJwREdYYkEvbU5BSTdhdkVXTWlkZEhjOW1j?=
 =?utf-8?B?aEQ4ZlJ2UFpUaS9pbkI2WC9zQkJuRjZvS3RCcExRMWRLb2NjRzkxUUg4dno5?=
 =?utf-8?B?WXFUSUZUbXl6NDFRTk01NjhMbkErRmF4RVc0TncvVzRqMXNYKytDaGNoMlY1?=
 =?utf-8?B?ZWVHTDl4WEppRVlyaTFJSWdUb09NeW9uazJobEJFdFA5cFdSdklIZ3ExT3J2?=
 =?utf-8?B?RzhTZUsyODM0dlZscUFibUdTbmJpeEVMZFFMUWsyUzhPOWdyYmoxbHlRN3gz?=
 =?utf-8?B?RmVSSkdGMWZNSWx2cDlnQ0IyL3VoZXVsNDIraVhZeFpDeGhGbTlaeWZaYmk1?=
 =?utf-8?B?K2VsTk1lL2xTNXUzV0pjeEdIK2xUaWFZR2o5MlNzZnY4QnRZOWc3cngrRW5U?=
 =?utf-8?B?eEROUERIa3RsVlFlNGZmNU9lVE5jQUF3WDIrT1Z0dHduTVQ4VEZzZU9yclZv?=
 =?utf-8?B?dDYwT3l5T1Btc2lNSTduVE5PZGg1emsrQkNyellBa1RKQWJWcGY5elRMMEk5?=
 =?utf-8?B?dm94TXhNY3UrOXlGazQrWktmeDlyOHlsazUwNmUrNGo3UkNlQW5zeGV6UzFl?=
 =?utf-8?B?d2lMMmg2Q2JjQzI2cnBwMG0rYmUrTXhhaXREcHdNcmJvU3RlMmRLQWhuSGFs?=
 =?utf-8?B?Y3hUNlo3T2t5Mm9RVUh5SVZRZHJ5MmxJRXNId3JVLzZCVFkyRFpoV0tmUWFS?=
 =?utf-8?B?aWNLSStjSVNsZE1YV3ZvR0JKUTJOTXFQcHFPMnlxUFd1RUR1WTROeTJ5ZUhD?=
 =?utf-8?B?Y0tCcHBLTzVIZVdabVd2VXhSN1hWZ1ZzckVrM1QvaEF2ZW52TGYzUDRWZzNv?=
 =?utf-8?B?Qkp5VHFlMXg5VHM2a0NOdnFOQWRRV0ZlQU5kZ1dKeHJVY1dEaWZiQmNPZkNL?=
 =?utf-8?B?NGhWV0t4WFlNMitYN3dBZUdSMUZ6dnNjRVlpWEttaENCVjZQS1pHVjh3U0p3?=
 =?utf-8?B?N2RTZ2lFbVlXQnhaMWpMTGRFWklkOG1TZjJabUxwZlJCYmRTVTlBQUpxWmMz?=
 =?utf-8?B?RFJWdlZNMmNuQXdaM3p3ZHVnOVpEamUybXZ6NVpaU3paTEZ3SGJwZzB5NDBD?=
 =?utf-8?B?UTUxUEEzVVVLdDF6WmoyQmpCaUc0WGFCL21SS24rek1JaHMxTmRMRTFMM3lK?=
 =?utf-8?Q?9P7bFMxWllKL0VLPS6bsRyaEx69agTwwSsZNLOE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a98a185-ae6e-4019-359a-08d9251d69cc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:51.0110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hv6Z1z+uQy76hWfHp2U3/OG2GN2J8NhORa2EP18gCX55aqYehtr6d4N7EZSxAQ73DfrVMugGtabGWbUCIP350F4DiIZdPgw7Be06S1W0bEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.5.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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


