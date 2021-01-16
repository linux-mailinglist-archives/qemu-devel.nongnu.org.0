Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A42F8F98
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:06:07 +0100 (CET)
Received: from localhost ([::1]:58586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0thu-0004aS-Vp
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tV7-0004Mu-9T; Sat, 16 Jan 2021 16:52:54 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tV4-0000WU-PF; Sat, 16 Jan 2021 16:52:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chxUp8eoePBQi+DPPDRjoGfY3Mp4fAKfL/lkZ3i+puTUH0Z/8EM9G0q3q9EeTD3HRbHeuzmWkmxGYcHnSKrxGVAE+lbZx7iYWIJeeYTCMnjib9b2opLzJ8Hxwp2IyKBhWFTiCDHfEu8xCg4I4IHZP0RMQwirjX2eHnUhGzCDYN66Fu7oLzez6dlp5yl5FPKhXeE6MxgXosT+baZmwpQyI3JUpMywK+S6VfH71AxeeN0q+1Ha9Z2+giFEaMY+XZRvOPmRdKAJHRT+MW1jHRiidJgRcv8pSeiPfQ0skFg9XJfFlbz+08N3+PcUKaGT8yx46s2wYKWmCQMyw6Nq7ZMsAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJQuVP3QkPx4tU3Ve9RIH3B8zD/ZCxXj3/xFI9/V8ns=;
 b=ZlM1kP4Xw0kI5i2k3I5Y0UZnggOcLVFu4jmAHNquxZCvi8kpfx+oz26cvkQXep49+IFhtKavvjKMIlMQ2ilXqbktDLMwSgeVLFviW4Z5LZivJD7vJcrh0pP7HRDybnymBKEv18AzL9Lb4/6Zv3iKEwmQbDEC4c8XFx2CPnAf7wC3fM0jUKGun7p2+zr2HivkLQue3yq8XfY00ozXaDeLaxM6ZDs++u8vkY4QuSv1ipjfr/4PRU/QVDvaCrTwcBH4i6mfS2zsrEU2kIsNdinWH7jwaIoqi/uvzApIpVPB5csNTk9zQvpt1RpuT3uAAWFlMy1nPLhMpvv291ukmqo8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJQuVP3QkPx4tU3Ve9RIH3B8zD/ZCxXj3/xFI9/V8ns=;
 b=bPeVXLFHRM5GaepOgBL0daIerzfT7VmJww1MAcXuAafWZvGkxsTgkrtE8W1xmAR7gi2RKs91AiO5hVe04UEXvDDTkhwO7rUGK8oHDsLLJS1PmYwSJPijG+RGMlfXzG1ilbwbx5lqo5hYUYCGQeCXhTSkAD6D1QGBzTZlQGK9K2w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 01/14] block: return status from bdrv_append and friends
Date: Sun, 17 Jan 2021 00:51:56 +0300
Message-Id: <20210116215209.823266-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db895dbd-5c1a-4e3b-ae8a-08d8ba690ec4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35428FF8188E0E72FDCDC20BC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01m9cXfOeLAVV9vfsFDiKCULavlDcuOzQrp8WWvqitNgIGWectt4CBAAcQGfTobhIlFepHue+bDy/Zz1TB5Ub8KU6/bHtgj+e/o5urSx18ggUPOiHNRtBec3VMpfoukFPup/2iO9qUrmlQI/FznVUdAreVvJrNj7N9hZ38g0M5IMSW+VFpPYXI96xzHgMDjpSpplpo7k5nXsLYYHwDtCPx5l2hLqRMUsV8sukAtuwYorIBq38EHnswHWrri2bqnD/VyG6Hx8VL9YgNqeDYR/aY4jaggbYvPfMmu266tADesHRm+GaPymz9a/5TCqM89tJ+YBA+aRgJRtmhO4EFC4O/EM2LHm/EN3xRr67qxl3NLHCNPOm+WgYj2qEAPawTiHzdHScYbvkx/tu0daSnqpQ/m0qWSNqIxzo4b8zEOcwSKK1tPyxZOiN8j5h8ceLlmFgBAo+lvJygaq3tNcrQVui3F1KVAcUf3iXs+MX3Sq5YAr6/s/QEAbVAyoAAw7BXoTPkrNhfH74BTfMA06irn2yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uc28SC2STGk3r4KxxP2Nh81FcWFDMK2W4YOH2gx+kqYPIhoiICvRdBEugV9+?=
 =?us-ascii?Q?uJbUt2pHBrMszpj4SRLDZRas9/s++ikZjNL4r4YkTvnqDH8hJzcSHLPSPtTt?=
 =?us-ascii?Q?/HMyU9VbPN7nHhrvrMCkjUBT79iOlejDtB2X/B067EXYrQwhctkBTa8TCvkx?=
 =?us-ascii?Q?A2McQXAfFtYJNgTFw1uD5YPCqTTfd7QPamn4MWQ/3I1+f03hFurtsNlrRpW6?=
 =?us-ascii?Q?UIAOndVWBG2gPU39Q17e2GD/Me1MBIc5zoag5Ir49+ARsI7byRwIz263Cfz6?=
 =?us-ascii?Q?49IDn6cbiaexcvqoKLM2jNqF8lMt2nqAymwqmyxupNCRx5yWWSy4vGfmNhYm?=
 =?us-ascii?Q?EMqqv8hFog9UMBiuYgfvzXMm8H75hleje+N8nOkGlrjgI7EFNTg8uTu+eps1?=
 =?us-ascii?Q?XBojJMNmMa7jLdFtkL5ymBXznq+FRiouOtWygB0cLI2aWzZbYa+oHowP5Hyq?=
 =?us-ascii?Q?hgkxVXy/iawjxOAO8BW2Tsdwf7pouXX3ONI44B6e9rbGl7h4xuMfKj2hiWTJ?=
 =?us-ascii?Q?4WzR309/0B6S9RFN2eHyimehri6kBO/I/D9dvdMBZZQyjQOn58axdx7Ptl68?=
 =?us-ascii?Q?moURl4ledDBgSf1JqffXIR9PIFPY0Ai+VFdK7LHiHulBmcFida4ubfsm4/m4?=
 =?us-ascii?Q?jIUxOlIFR9VPWwdA/WyADQ4nX0F4nQY4sJN+/pPpDJvGgJhOCFKYv+80Suel?=
 =?us-ascii?Q?q+hTWnbPtks3T6IeQf+3Mo5PcHLXc9rPM2J1icINp7fgBKOGW1Yysh/BaR7l?=
 =?us-ascii?Q?8mbAI/ATNEQX7vTB4/vJ3eL3tHem8718GpWVhu6kDc0VHbySzDUh9GywawLx?=
 =?us-ascii?Q?AXpp5ErrsUH2qwquTAlZTEo9p+YUgmo8AL2BboX43SI7U03EE2w2AUY4xMds?=
 =?us-ascii?Q?STMUlAMKcQBCcZXM6CqCeFQMNxTUrtrqxU8yBjHrNd8XNh0Z21uXLQOfmr1y?=
 =?us-ascii?Q?svuOHWe/uSORcY3vbodml7QVk38oob7V0IFaoI7Rd7gvTiypsjHIRkEei9g9?=
 =?us-ascii?Q?mE3x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db895dbd-5c1a-4e3b-ae8a-08d8ba690ec4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:45.6506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uq4oCoDlxNlM2fvI57mvaPwyZVUagaBKNzQKt8fjL8n6sIp8TgMi8EvP/QUwUdgz9eYti48SRB7DGiuaMHbYAqB+NGkFSNbcW5jmJ5VmxEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recommended use of qemu error api assumes returning status together
with setting errp and avoid void functions with errp parameter. Let's
improve bdrv_append and some friends to reduce error-propagation
overhead in further patches.

Choose int return status, because bdrv_replace_node_common() has call
to bdrv_check_update_perm(), which reports int status, which seems
correct to propagate.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h | 12 ++++-----
 block.c               | 58 +++++++++++++++++++++++++++----------------
 2 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index a193545b6a..b4e0347b49 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -354,10 +354,10 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
 
 BlockDriverState *bdrv_new(void);
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp);
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp);
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp);
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
@@ -369,8 +369,8 @@ BdrvChild *bdrv_open_child(const char *filename,
                            BdrvChildRole child_role,
                            bool allow_none, Error **errp);
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                         Error **errp);
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp);
 int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
                            const char *bdref_key, Error **errp);
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
diff --git a/block.c b/block.c
index 8b9d457546..fecfe27d5e 100644
--- a/block.c
+++ b/block.c
@@ -2827,14 +2827,15 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                         Error **errp)
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp)
 {
+    int ret = 0;
     bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
         bdrv_inherits_from_recursive(backing_hd, bs);
 
     if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
-        return;
+        return -EPERM;
     }
 
     if (backing_hd) {
@@ -2853,15 +2854,22 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 
     bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
                                     bdrv_backing_role(bs), errp);
+    if (!bs->backing) {
+        ret = -EPERM;
+        goto out;
+    }
+
     /* If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL). */
-    if (bs->backing && update_inherits_from) {
+    if (update_inherits_from) {
         backing_hd->inherits_from = bs;
     }
 
 out:
     bdrv_refresh_limits(bs, NULL);
+
+    return ret;
 }
 
 /*
@@ -4533,9 +4541,9 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
  */
-static void bdrv_replace_node_common(BlockDriverState *from,
-                                     BlockDriverState *to,
-                                     bool auto_skip, Error **errp)
+static int bdrv_replace_node_common(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Error **errp)
 {
     BdrvChild *c, *next;
     GSList *list = NULL, *p;
@@ -4557,11 +4565,13 @@ static void bdrv_replace_node_common(BlockDriverState *from,
             if (auto_skip) {
                 continue;
             }
+            ret = -EINVAL;
             error_setg(errp, "Should not change '%s' link to '%s'",
                        c->name, from->node_name);
             goto out;
         }
         if (c->frozen) {
+            ret = -EPERM;
             error_setg(errp, "Cannot change '%s' link to '%s'",
                        c->name, from->node_name);
             goto out;
@@ -4592,14 +4602,18 @@ static void bdrv_replace_node_common(BlockDriverState *from,
 
     bdrv_set_perm(to);
 
+    ret = 0;
+
 out:
     g_slist_free(list);
     bdrv_drained_end(from);
     bdrv_unref(from);
+
+    return ret;
 }
 
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp)
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp)
 {
     return bdrv_replace_node_common(from, to, true, errp);
 }
@@ -4620,28 +4634,30 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
  * reference of its own, it must call bdrv_ref().
  */
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp)
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp)
 {
-    Error *local_err = NULL;
-
-    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
+    if (ret < 0) {
         goto out;
     }
 
-    bdrv_replace_node(bs_top, bs_new, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_replace_node(bs_top, bs_new, errp);
+    if (ret < 0) {
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
         goto out;
     }
 
-    /* bs_new is now referenced by its new parents, we don't need the
-     * additional reference any more. */
+    ret = 0;
+
 out:
+    /*
+     * bs_new is now referenced by its new parents, we don't need the
+     * additional reference any more.
+     */
     bdrv_unref(bs_new);
+
+    return ret;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
-- 
2.29.2


