Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE8398A45
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:17:45 +0200 (CEST)
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQki-0000ak-3Y
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf9-0000Mk-0R; Wed, 02 Jun 2021 09:11:59 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf2-00035G-Ak; Wed, 02 Jun 2021 09:11:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg23ihBFtqVDYBpqu7FVATXs9QfZaoxvAOrbuLgFrhKt07Va8GMOJkE6iFakvygF5BMJQsfC7ADEYes9szDBpL7T5YTvlnxH825nGc7jjvvWvre3nBZKxBf81uBqjWOpcdQrOwP+kI9kSLZG2qBIhnMa0Ogq5dFuZzifQacu4YDNWFzdMTqx9sNF1t4b9nBPVR1LqUrC2PuFe5cHPGdJgWWS8DHgsH+ENpGsLtA1SBiOz1s1JNUbk6Q7R+Nd7UvkBXet4QWmhx8vU5UU8sOYG4u7uI2LQTgb/UOJcTpEH4FtPLjNb1caokd0cwJYiRz3LWtKlyES4PKAU1HoXr53og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=CA4jPnRfnahNKSm26ht0/WTYZSodkzZrcsYxFWpP+XD3in5Rd7MzriM7WR4X4r/8acLlksXtMQjKiSEYLy07hyf2diUeMigtkYo8B2xmkg7COWXQeKpOF7eICT5T3mg9P0EPCT/jR+xcqv+hmlfvcuNg1QD/ZLLTLHpK6VXhalpWDynQE5rb7vxzMqYwMY4Ky85s2UHQSStVdUGfjrozwqMLTmr0BlN6Ulen4HmhgFHI3SjDSyiPLiQwoHefO/a7e7jHPj7uk141340zLV21ZzRZ7UAuBO9r/YCYe0ubnIN294sDV/D6BuL3xJfQetmUzK8SIxCfxrAXDWMV024tTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJfp4qB2n7EBWUo59Of5E9XDnSvgv7wv4W8IEBSsMhQ=;
 b=AKzdioAph9cZmS+8w1dGWEIU3FF7offlsbAMszFNIRZho08+toKmNYM1RIlaImfbQrj7TjG4IUwn3pdKmef9Zw1b7zEeO3UWyYNFoy33Rc9LhtMFzaGeRB3Bg76vSXJzN6HfmX1J0gfuiyqzJ+avqXQ3P6ZYdiGkJPfZrxZicis=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 06/35] qdev: allow setting drive property for realized
 device
Date: Wed,  2 Jun 2021 16:10:39 +0300
Message-Id: <20210602131108.74979-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b31a0440-d643-4985-7fd2-08d925c7f21e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376559B0F9DC2F9777AE124C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oseGuwWkgBhB/MZTq0wu//s7dIfcmtHBaZ6g75PPHpo+LE5Euc9TY56X89WcLxUto93jt0kjh7W8Jj9vR3fS+yGeMHYMGC/vqAs2YqfO5jGne7IsxJumJRNnYMigXqy8QsTwh9xsQBl/pPZrchG3n5kUPJ5xa+HmQDWoL+S1lRCREtmdb/X2YYE77bwU8BP03V5NKKdk6L/p2b03SmY0APHBw8nGtFJStjiml+Df8dW4hLIEOOJFDELMBSkoC12w18Iy12AnfPuVuZYkkJhn7CxMDzcGw/KAW6VHXtQL5r2fJPFi03HmNnrzUoAtDMEJ/GCRqgyzJ/5IdhqBcrLBWfE8YU/TD/XTuSrC1i5Ch6Z1MClnu0yDvi26ojVkn8lqIzCSMjkvm4AUhLm7JfWE5U1yLEkDoosdsr15kp45ZelJOw6bN2VDitTGsfDBNfwTNffjy0+723HVAIm1Pg7Lbu0C9r+8tr0bBApBTtsRNbathRXZuCadX5h3+egtfMAmPiYrmciyN75CZAd73e6qEioyxcpDkrJSG2qJN8+vzOHbT2xF4+0D/Gws6wnTF3FzTWKnegDK1BjMmDTHLiX9i8L9ChX6IZm0jpZR7MBRILSjbquotXCIjUJtsqDcgTGWzVRDV5dQiyiXSaUKJ8VCog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(316002)(186003)(38100700002)(478600001)(4326008)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHBzc0tvWVV2UGlKRSt1a0VQejBkRDYyZCszbmNscHUxeFFOUjNkemh1MFdr?=
 =?utf-8?B?cERvNTdqcWx3WDZzQnVhTjNxc1VOYUZ5MWh3bkU5c3pWRS9scnZHM2lPTFVo?=
 =?utf-8?B?S2xEVVFNTVBSM0FMbXZtWnc5Y29UY0k0TFdaUjVHRklnSWhzOFVxUzk5a1lE?=
 =?utf-8?B?eUZESm1QQmRaM3JDUDl5a0pLbkVBcUpuTkh0NStUMmx0ejRUalZhRWdxNjQv?=
 =?utf-8?B?ckpTZEE4T2xiMkpzRHB6YnZaa1hYK01aSWpNNFdmYi9UeEtLdm5LQzJHTk11?=
 =?utf-8?B?ZnlmRHI2b2s2K0hZZytKYjlGN0pna2M0VzdHZ2ZMK2RLL0hhKysrTGhVZ2VR?=
 =?utf-8?B?WHE2eVQxeW9SU1FSdUhFK2dFMFBWVUVnNGQ5dzdLa1lDQk1YdzdrT0xGdHFy?=
 =?utf-8?B?MlJjNTU0T2Iwc2FyMHRmV1g0SGZOeU5kQkRVMkw5OG56V1NsZ01zUjNqVWlK?=
 =?utf-8?B?MVc2NkRVM0FhSytyaHVEaEhTdHFaY0VBSm02ZTM0MVhyUEFMNzIvTU5XM3Bt?=
 =?utf-8?B?WmtoUFVFTVhhcmhyMld6SmZSaEFEOTl0bHhRVkQ2L0F5MWdOOCs5OGV6YmQv?=
 =?utf-8?B?VWpzUXdLd1VmZndEbk84Snd0RFNCVzY5ZnordGN0aUJEaHM2NnBxTXdDaW16?=
 =?utf-8?B?WVYrQ2RSOVZVVW5HVk5sekVJa0tIb29ZbTFnQy8xRjNnTzFwK0ZyK1VudXdx?=
 =?utf-8?B?SGhHR2JVNTlVNjlqSTYySVNEQk1aQUNWVTFtY2k0Y3o0b2NiYlYvVWJwcmlN?=
 =?utf-8?B?MmdLazM2SUZNTFcyMHE2QkJUSVo1M0JQZmlBSHRnRExzNXlzWGdhU2dkd2NQ?=
 =?utf-8?B?c2pLRVd0WWFUbWh2TjdvZllkTWFSdUtxU1ArVzRON0dCRUtXTmtNazhSOFJ1?=
 =?utf-8?B?bjRLOGdsNEJhRzRVSUQ1b1VXR2lpODM4M2pqOW1NWk9kaHk1L0c2L2ZiWmta?=
 =?utf-8?B?VkY5KzQ3VkJPcGtSZGVHRzYyWnlrU3gvaW9YdzJwUEFEcm9DUXkrU3pMZytq?=
 =?utf-8?B?RmRZOWlmc3ljODFISS8wL2kreC9kdngxd1FNRU5RcC9ONi94Y1NDWEY3WE5N?=
 =?utf-8?B?QWIrYmp0Kzl1TlNVOTk5L3pqUDlzRG9RNnBXTW5iRnhFTnZMRmxmVjU5TFBt?=
 =?utf-8?B?eWs0SEZhUUZzZzM0U1VUTThYS0p3bWZvTXhuR1dqSWZRK0gyb2tVbVJlUlli?=
 =?utf-8?B?R3VOSmJBS1k5Qk9pWHd6NFlNTzkrN0oyUWY1cjhDL0h2RFNNaXVVdTdTb3FI?=
 =?utf-8?B?K1I3TkEzN1dwcFE2dnRhL3FNWXhOK29pYTdEbHpnQXcrM2lmWTNQTmYyOTZJ?=
 =?utf-8?B?TjhiR2RtT0tSQ2FTYUxwVUxDc2FHL0ZNYTBEY2JKOTIweGhuZ1VZUkNDbW4r?=
 =?utf-8?B?UlNIOUkyd1NuMG9paGdMaHQ1cDZVd3p3RzNMcmJHREJQZUN6MzJuMERESnFa?=
 =?utf-8?B?R3RlUXF6V2loNmdVeFFackRDK2tNeWFpMWNOSXJjK1ozc09BZ1p3c1pkWW14?=
 =?utf-8?B?U0dMNm1EL0s3Skh0YVZuVGE2M29zSTh0c3R5Q3VXQWJITDAvRndqdldCOTJD?=
 =?utf-8?B?b1VmVzJPSEMxYlNhd2dYSzduUVgxd0RFNnQ2eUlkMWU1bXVoT2tHK1NrWUhm?=
 =?utf-8?B?L29WK3FsYXVnd3liaXM4MHBVeS9UcjQvK1d5ZWxyUXplc09OWHl3OWVaOHUx?=
 =?utf-8?B?NGs0UUtiTWZVS1dPRWw1YXU5WWpGckFkU0FRZFVaNEtNdlZvTXJSc2RQSGJq?=
 =?utf-8?Q?0n5h9G26iFJ+jLZtVDRYsWPTDPc/T8e1JTTkPH3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31a0440-d643-4985-7fd2-08d925c7f21e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:34.1615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdAjNo5KamZcnu9bWRuNHam+/QRfqZq1yhjheL8gLWZy3B3HAJS41srsP8Ld4Z7Z0+pOuuCvHUOBHuFaLN8JBVtboRFfFcRMnWTLt/Bdv3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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


