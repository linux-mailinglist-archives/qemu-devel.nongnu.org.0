Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D951838B1D3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:37:01 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjnI-0000pm-Va
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZU-0005fI-EA; Thu, 20 May 2021 10:22:44 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:23648 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZR-0005Yx-C1; Thu, 20 May 2021 10:22:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mR+5MCTXH/dP46CLPRV8CtBvp1sdU+eE7zxNwUKMXrRVHhc9sfEZGiZoWk2qQSN5VR4KyjEI+GoRFBDzZlelZ4U8c4ydZ8fILkN+FssnxzbDkPgHUeyEE7dZfaSzEq6k61QUh6/CHLk78/Q3sx3eQmJZAXQPCIW6k+ARYUtaCRBWjvYIsrn0e3BUOVwinVVFb7o/ML7+4Qf1uvPWJbg9xegM64cDchUzbkFxSk6jbtPH6BZbhMVIWbvvIs0q2fX8UHKSmuDVPfn8zhRh1oS1r2HzrAdNJecBG3VgQpUNWhZ+xxoanq2hbayvmtbgIfBXea8/yknQljovcunjx8/XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wju+SfsauUACenJq2OTqYcEloKj+ejuPkMRtJMC1fkM=;
 b=m+/P933C4VB9FCv2gyVHmT6HvW/uMVZHXBd1aEyMqVR1WUVziaegSp0x6f/05f6iBXq17+n/2a+Pv9jqnCBujO8EeXEWFL8WU3DsJd2nXOubwEIS38I5muocTgzHrC0IZIJ3ebc8zRf0wjBo0WTBT/1sOYp00cFRk+uqcJqPEZPZYkX4Bh6t6yUvJGIsQCZOuNyFK3wnTT24XZmq5QRgiRG+nE5n4Op9MKUHBQ3W5OJp5BoySaW21nAJtE6BKVR7UFp4vagbCZveVBeaI2MkfEu6FP0XvoOnOzvnqHI24Lf6VfLzGdCW+vi4iCrXF4C4Ru0+82D1I9LzPBt13o1Xhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wju+SfsauUACenJq2OTqYcEloKj+ejuPkMRtJMC1fkM=;
 b=Lqqv42GjnkJXe3TqbrXJZMpvidBO+nhLW6+Lz9Yj6u68HAWu/SO1F43i7ZhJa3e/+2i5cBn20smf98vtfhu2pApGMNHSY6Nntfs5c/ZDCMrbPJRftyMvyyxc6BR5sc0fvl9qbZ7PqogpaU9wXfxvrzpqHoTmBJq5u3FE8laK/XQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 14:22:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 06/33] qdev: allow setting drive property for realized
 device
Date: Thu, 20 May 2021 17:21:38 +0300
Message-Id: <20210520142205.607501-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 866ab2d6-75e3-4296-2257-08d91b9ab400
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB70090908645ADB74A16834BBC12A9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2FhE+xw9RqIj54NvDZL1ehZH3w6yhaJSS0Ci+fOogYeE61ETeBbq8ZXPho24a8JVeWrdrp8kXI5Uv+6SG1IXqnUyeerswWiHnKZLckb8F8REI4nnn5f55mMAXD90391LWIGqUSC1bL+UNNkCVvXiB/ydZlT+xdHEmI0nRUdCd13QLdINXUH+pdsik4Y9ffI5bkoRYyWZTz5yGnOGNywTM2crPZWW2ISrwlK6UFgJx+N/YUfxT6usVvDx7D5rIRYTT1x95CvDQhH5Xe5bLmA5TJcL5bnX0dKo9XK0kcxyQBmQfE6YBfIN3rXSUhhVqGR91wdQEapiiffjuZJRNyvGO8JWTviCvybbiVAXiGm4VgOcma9g3noHjmennRxQt/S/AyhqGgihTkf5sGbURmEypw0yX1svz8PpNc9Rx5DgpMcUHAZmZXtBb7cVmhOB0ZstKPv5q9PIWYVwQO0I76Q1av/V+zgStFX9IyBuoBNb/jFk4/QHFFOCh7ajcUT/kZig2SQdExKpvEmCAJxEFhMXGn4WC09D1fDN9a48sM1zfcTB9HkH+vV0wAqs+D+AAoEL0hp+uLog7rlPYxFrHeM+y2t4domvnxz5fyHVIkrGBwrmqYEbiLE9EOHsmLW7pzwbalv/p/4ia2ghrlHYrFyag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(38100700002)(38350700002)(478600001)(86362001)(6916009)(6486002)(36756003)(83380400001)(107886003)(8676002)(186003)(6666004)(4326008)(16526019)(316002)(1076003)(5660300002)(8936002)(26005)(6506007)(7416002)(66556008)(66476007)(66946007)(2906002)(956004)(2616005)(6512007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VE5ZYmd4RUlmRHBUZ0VvTktPQzI5ajQwYmdLT2hmV1JtbExoWWxpRWlMeFVl?=
 =?utf-8?B?N00yQ3ozd2hFNnE0TVdRblVGTkVDS2lkUzY1YVNQSFMxY25KZDg5V0trcUNn?=
 =?utf-8?B?TUU1ZE1sSjVxeXdqSUZ4Z2hIZjNVaEdBK1J0RER1Rk0reTdYZFZNNlYzd3Ux?=
 =?utf-8?B?eVUvcjNZRTcyN3lFVUw4TGduUExCaFN3ODk1WTk4eGxqcmkreVpCU2lxeVRv?=
 =?utf-8?B?aXdwZWcrTTE1bmQ3Yjk3eFZLejlhTm9KODRlcnZ1bUZBZXdWVlo4VjlrYXhQ?=
 =?utf-8?B?M2JsLzV5MGgxMHk0QXM5M3RyRjBRdTBqaFBhaEEvVmI5WjY4NG5oVTlPQnhT?=
 =?utf-8?B?K3c4TnFhN1dVekJ5ZEZNa1lFZVRUMmZWWUt1UCtOSGtEV0RhSDRwM2NRQ3dP?=
 =?utf-8?B?ZVBYOGVnT0lldEs4em1OT1V0WmJoRW1SWG94ZkVwQ1hDNldhamgyNEpnL0Zv?=
 =?utf-8?B?SlJRc0o1MEJaUEtGYVQvYVRIR2V6QmJVdlkwUlFkd2h1bkFwYWRUdm8vcUlO?=
 =?utf-8?B?TEY5OUpSRjdWR3A3YThmYVBxWEIrSjFuR0VhaFJhVHNOU1NvSmRTRXVra1pa?=
 =?utf-8?B?WWc3REt0TWtqcHcrNW01b252alRETXp2bXZ4R0Zxc0xXREhZZE1JUmVLa1oz?=
 =?utf-8?B?WU1BeFpFc1hYTDVPVGRETTFZN1lodGJkK3BnUUw2c29Ca3k5MUpRY3luRDNV?=
 =?utf-8?B?UWZIaEszK1hhWS82dUw1VWZTZXdmRXRLWlAyQ0NKT3p6aG02K3g1KzZXeFN6?=
 =?utf-8?B?Rm9ZWEEyZUVid0ZDSXU4TFRQa20vakpsd3Fra2hMVFBJWlk1Q2JJcVd4d0ZX?=
 =?utf-8?B?eFdNWFBWeU55R0pYUSsrU0Q4VGtSSDVsYTZQdzI3RzB0TTB6R202RHUyM2hT?=
 =?utf-8?B?M2J1ODRQSmZkV2NUZnRxV3hOdm9VeC9XTmFGQk5Wa3VGZHRxNWRDNm9rdTho?=
 =?utf-8?B?WjdJZFNBbnM4REFYbE9NZG9saENzL2NxZEs1L05FMklrSUlSMktCYlBPSVg1?=
 =?utf-8?B?SVBkVWV3d0FiSVl0ZGgxaDFUbVNFTThVaDQ2UmFKcmdhWE5vcmhEZkNmaXZE?=
 =?utf-8?B?MTNnMWIzQlhIbmRTdytxZWFWWVR4Q1lvOUphSTlJeHlKVlczdEhSWjZKZVlX?=
 =?utf-8?B?SHFWZ0t4aU1PR255YjlZNGdQTHFSK2JqbXVMelh6VjhiaHBmaHJXSk54VjRW?=
 =?utf-8?B?ekY0R3pITDVvOE16NGZDU1QrUVdGcnN1d1dIRnU4bVlOOE9CSHNjVGlRbWR6?=
 =?utf-8?B?Vk9qZjBhSmFTV21NUHJ6SWZEQXk5RXN1Unh1cnpNc0NrVFJuNHE5U3BHeHVN?=
 =?utf-8?B?MnFCT0FFYWN2YnB1T1JoNXlhekI5Um9zaCt3OHZaazVmSk9OOVVmZG4zT0Rw?=
 =?utf-8?B?bjBieFVWSHRxQVFuZmpES0l5ZitraVFhbHF0MUtTUksyOFBlbWN0WjlOMzIx?=
 =?utf-8?B?bHVnM1dYZnc2TWhaclNTd2RjOVNUTlNidEdPcDdJYUdWeTZJelJhYkIvTHdR?=
 =?utf-8?B?YjhudXI2NEpkMGtRSlZjMXlGd0NhVmJNWEhNem11bHhWdFFYd3A4THl1ajda?=
 =?utf-8?B?U0VOcE9SUStrVEZwNVJ3SWthbzRZTFlyejg5cTZlQk1ZYm52cUNjUzRFczhO?=
 =?utf-8?B?VlpuclBJS1A3U2JKVkhUTllGUVZRSU9TY3ZwaXo5aWVFbk1LWWRrVGtPNGRF?=
 =?utf-8?B?TUkzeGw1OHJiWENQclA3anFWUVV0Rm54UDNZQ1poYU05cFFGa3BaTHREcko3?=
 =?utf-8?Q?Wr804BAQUeGoGbWiGZracS339bSBWyA0gdL2R7/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866ab2d6-75e3-4296-2257-08d91b9ab400
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:30.9681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DV1wP2xHSxyrOB7q1WxYOa2FxQC6yO0ayegFpW9AzDQF1NRE8A8LPYUhSQ0IZ686ejRz05AIFGlu2GBOINZycqcM3Cp9SZLGqGql3Iujyew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.115;
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


