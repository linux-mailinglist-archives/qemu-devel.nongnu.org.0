Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD732F8F7F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:54:56 +0100 (CET)
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tX5-00065Q-LR
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQQ-0005HR-SC; Sat, 16 Jan 2021 16:48:03 -0500
Received: from mail-eopbgr130098.outbound.protection.outlook.com
 ([40.107.13.98]:5600 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQN-00076Z-TR; Sat, 16 Jan 2021 16:48:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5Mp6HQ86ZgOdXXF1WYJ9HO+JIornATrYYV6FRh407hI6mjOpYyWsC2PrzvYYOHkFtpBDPbMiS/AuPphTJPRwd1puiLYBjHo4xEze15DlLMYnLdEQ2kgsTIxVYXR2/T55XHzZnPMhz3YNjjjDSy3baRe3jlnTEGowedGfpDDyv0saUKQQcJVYTNz6aT/RZeKapsWhi4RTLGYtuxKlVZdbUCdxDs4dTFc7g8Mh4RAdeYfpiVmJ1Ajf5+zkcyDEVQBPXwfnJn6Q8pHiG9Y6tLKFebAVz7hrfHlcgh6rSraErFBf74UbKtKID4OGMDe4+Zw7nbQVsNPNoYkcM+gw88zPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cduAxBS2cFNz/246heWM3sUjp3hH+x1NeOIdFZDXAw=;
 b=lVCNdcg5ZwwOJpabstL+2m2nr3Mcy4t4rBLyEIgONz23iOl7pJklro6N8fvCs8dECHmw5Sj9J6YmztLJswsyLH8msbPt0npZUCOkIuyPgAJKqxKBsCnGsFrO7WNpa5o1L1TUczvnVb0ga8frtLcrWqIJhUDbZewFO9aVXSkF2xowlXT8984DcViijiX6zBy64hHZfhuAFmrsTs63Z/UUk99R5tvgidVl95WUuFyeOAM/ov7MRUR276AbdsS4i33pHwH/gmbsgVLO7oKUa1KQo4+/vz1TNLvGEw1CIfgyJehNlHGnFUWzHhEvmEUBX6m34IgDJueKmW9uYLPJNqqlKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cduAxBS2cFNz/246heWM3sUjp3hH+x1NeOIdFZDXAw=;
 b=SZNpl0lOZLo1r3lIqA2za5t5CXEnzEn8r3f7sZS8HbEWUq9holZ+NypU2sWsLTLAVUbJymeVkxIVZOVwyg8Fj4ye2Tpm3FKIw1T74oOtLhRznvDPrwNy4cTRvunttlvU+RbqrSaKaOcnCEOQkQR4zcsg41o7MybMGCcUTEdegvQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 07/23] block/block-copy: add block_copy_cancel
Date: Sun, 17 Jan 2021 00:46:49 +0300
Message-Id: <20210116214705.822267-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a403acbb-ec6f-4e1e-ca3d-08d8ba685d64
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2033BE044DE2B0828B1DB04CC1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:233;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UWEahqBptKVC0AgnRYnNhERIOpfzkMP8ba2n7dF/ACkxa0+8JPsAhrvVEJmhhVGwFvCK89xrb80Fp9ganmZ3WmLBn5pbXCv+9vfE+sJifAE/mf+a4u9cUwzNV6XJr0XOBbD03MO9Y5R+TS0vOiTJ8RqRTcW8OAZVJ3YXe1Qtke5vH478Ns6dRObrNf/69Oa+5Ltd4xMoH6VHrfBEosPbLBwSSuTAjXDu+GgNribbkz1UGZp2rXYliKcCOC6vpKU7OweHoo+Otm4oiIsZXdEHY8dvvrwXIunNYAsCbh264XMrC6M8ETM1R+BNjS9spMsjNhPw6PikrMCE2fhcJ62Nvu+IGVBFwC6vxop82WcHIwFrMGbdwnBCqqags/RQNdyhevpsfv/gTtjhB4ml8CdowQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?orDjFUOUa++iaupm1sn+kGw+sa6jKqH1YnpuqAz4qUo/gM8k0Sx0BGzCQUN4?=
 =?us-ascii?Q?+4RP27vua30+n+ftOvChJhl6UEEZij52rIgk3aw3rZhEL/Jd/Zb+uOBx+tYL?=
 =?us-ascii?Q?Xf7FVMd2F8GJRmUuLY67l+2JdgL9UFCvQOwLyMOnpQ6vhYymSeAm8p7oRDtg?=
 =?us-ascii?Q?pJRfV1BCbeFTmPxOWk1KwogyZHQdndiOnlrl7KL2sZpR2bT1rwL8d9IVxtDn?=
 =?us-ascii?Q?7vqNES0RmL/ODVm3etcbfodc27xDXzpxdqyqS1RPBv6ciS1eJm1bfHXA1gBA?=
 =?us-ascii?Q?ZsjYJldVkb7xYEfsDDsYkj0f41wAzG8L4tuwdJjrarEY8e3XIvtkQNdMbgRs?=
 =?us-ascii?Q?MWaOGcy31qGJ08H13pcKRVOooUm1PpGht3K49X/5989jlUfovQ98PVbizVGv?=
 =?us-ascii?Q?WAcmvKf1uflvHhj+8EKDOg+ncU5oAGDgr8ehk7au2BNMoJN25wWh9c/dCLxy?=
 =?us-ascii?Q?thFCqvxokI5eeuoIpwUd6Qa6XdVSF9HYp1jwKlA/wYKdrWnKwXuCjgkYTfGg?=
 =?us-ascii?Q?Ii9xETZu1bjyYj7FPyZH7yiCNPW25BvseChT1mOJzvSFuCCltgp505HKiRba?=
 =?us-ascii?Q?ua0Huo7Zrjz/II65BpNcs2c5E9ETmGBy/yk+y4bhHuuqNHMwX+kY4nDhrlZX?=
 =?us-ascii?Q?iqw819IOvuG5NuQmruvbKvw6d5KCfbTbQMVdHsPLJ8GkMRqVcSwlnyfRQcTI?=
 =?us-ascii?Q?iAmAcLGdDfMUlm2WxVss6dzH317KwCgKAUetLQrMCqiELsEDwlmI9RcdjG4G?=
 =?us-ascii?Q?Jx+GVByrdV69Grz3Asy+U2KD9fzlt4fMNCv3/BzlSPFYOoiCRASnp2a1nF97?=
 =?us-ascii?Q?/fG4qPalEO4lhMXN1aab++ZgDhoEGxMIPwg/w7ljfQ8xf1i7gj8msTueVFup?=
 =?us-ascii?Q?d/DKboRVZJRlEnrl9YdwCcYgC73+z++2C8PKTaQJ8LbyFP2FSKcTQ2qmBg4k?=
 =?us-ascii?Q?VFSanBglyrW2EhBxf43yAR2QYmslPQsQGARf6nToy4fupfROCNJKqu+d/Udj?=
 =?us-ascii?Q?EPGW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a403acbb-ec6f-4e1e-ca3d-08d8ba685d64
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:48.0759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrmflixdMBeQ/9Zcz9EQwwVy/0vbZ1pkUIuyjMvG0tRijE2Df1EseMjcHXLrSPXyB2jErP83GbuqMt+KqO0j+x0hApBBa/4gkZI0Xbj1fqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.13.98;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add function to cancel running async block-copy call. It will be used
in backup.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h | 13 +++++++++++++
 block/block-copy.c         | 24 +++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b5a53ad59e..7821850f88 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -74,11 +74,24 @@ void block_copy_call_free(BlockCopyCallState *call_state);
 bool block_copy_call_finished(BlockCopyCallState *call_state);
 bool block_copy_call_succeeded(BlockCopyCallState *call_state);
 bool block_copy_call_failed(BlockCopyCallState *call_state);
+bool block_copy_call_cancelled(BlockCopyCallState *call_state);
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read);
 
 void block_copy_set_speed(BlockCopyState *s, uint64_t speed);
 void block_copy_kick(BlockCopyCallState *call_state);
 
+/*
+ * Cancel running block-copy call.
+ *
+ * Cancel leaves block-copy state valid: dirty bits are correct and you may use
+ * cancel + <run block_copy with same parameters> to emulate pause/resume.
+ *
+ * Note also, that the cancel is async: it only marks block-copy call to be
+ * cancelled. So, the call may be cancelled (block_copy_call_cancelled() reports
+ * true) but not yet finished (block_copy_call_finished() reports false).
+ */
+void block_copy_call_cancel(BlockCopyCallState *call_state);
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
 void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index fa27450b14..82cf945693 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -51,6 +51,7 @@ typedef struct BlockCopyCallState {
     int ret;
     bool finished;
     QemuCoSleepState *sleep_state;
+    bool cancelled;
 
     /* OUT parameters */
     bool error_is_read;
@@ -594,7 +595,7 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
 
-    while (bytes && aio_task_pool_status(aio) == 0) {
+    while (bytes && aio_task_pool_status(aio) == 0 && !call_state->cancelled) {
         BlockCopyTask *task;
         int64_t status_bytes;
 
@@ -707,7 +708,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     do {
         ret = block_copy_dirty_clusters(call_state);
 
-        if (ret == 0) {
+        if (ret == 0 && !call_state->cancelled) {
             ret = block_copy_wait_one(call_state->s, call_state->offset,
                                       call_state->bytes);
         }
@@ -721,7 +722,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
          * 2. We have waited for some intersecting block-copy request
          *    It may have failed and produced new dirty bits.
          */
-    } while (ret > 0);
+    } while (ret > 0 && !call_state->cancelled);
 
     call_state->finished = true;
 
@@ -801,12 +802,19 @@ bool block_copy_call_finished(BlockCopyCallState *call_state)
 
 bool block_copy_call_succeeded(BlockCopyCallState *call_state)
 {
-    return call_state->finished && call_state->ret == 0;
+    return call_state->finished && !call_state->cancelled &&
+        call_state->ret == 0;
 }
 
 bool block_copy_call_failed(BlockCopyCallState *call_state)
 {
-    return call_state->finished && call_state->ret < 0;
+    return call_state->finished && !call_state->cancelled &&
+        call_state->ret < 0;
+}
+
+bool block_copy_call_cancelled(BlockCopyCallState *call_state)
+{
+    return call_state->cancelled;
 }
 
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
@@ -818,6 +826,12 @@ int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
     return call_state->ret;
 }
 
+void block_copy_call_cancel(BlockCopyCallState *call_state)
+{
+    call_state->cancelled = true;
+    block_copy_kick(call_state);
+}
+
 BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
 {
     return s->copy_bitmap;
-- 
2.29.2


