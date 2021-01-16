Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C92F8FA7
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:15:01 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tqW-0007Tb-AY
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVH-0004Z0-KE; Sat, 16 Jan 2021 16:53:03 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVF-0000WU-U6; Sat, 16 Jan 2021 16:53:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBHP0DwPMhtt6MyQqgaB9pYjwRg3nQgC5AY1GTmUBE7cT6pmbgpBc/VOJvk1I0cdHNgO25YP8XcLNZGa6HchOsysq6p1AgoutBzmRNhg82rSGNnkFvYwPxx/dLuTtMiL5KKizK5XLhm0vftWCeAGI24bbwk8F7GwabV2ZebpoT5DD+gm/XapU3cBvhDfMOBDesW3PFk/h/fLZdj1mKFg1quCziL4Me99nlTpXzCXK0WoYY0wyZ+z+0NUnZRuFCqKOKbNlelK89hZ4IvHIja/Q4gxNUbU0NRoUktLSeRGzTr4n3WsdX3Ibw8c8X9EW9AwqY/BDi+TZzDlDeUyge1bjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnvxXx4Sq6TeQbn0N5jnN92TmTyGAUWeEQWfXH5uujI=;
 b=EBZwTe0qef6NEcY5iv6MXmEelH4gdKLvsIiYfyaqRnPVK51UTyAJklOwSRmpf0rNJBk/e7JbDxffTS71JZYpn4/7BybmooYCljFJZ3Zv0WGAwPUKr0l1xaHb020aM2oKyhhuKDkDdbxDOWXYpSKw7tLRGk6auUGgewBrAELJUhI1QO/PYoBxnsigxfvf0FOs0NUSxUFrx13OW2BUkLe3VZMLDBRiGIVlzvjCQvM3Fxo/yVtETZ13711Z7k7jlTR+ijuWrH8YhdGbhtu4kRNmaIFHqprIv+ies9wJrWAXmjv9fw1U5z9XH84HJ+0VkVsIo/Q13wlcMGklSslRgpHldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnvxXx4Sq6TeQbn0N5jnN92TmTyGAUWeEQWfXH5uujI=;
 b=jH5/F2tEvnEhncgxp9Y+PFktxWuzcxHwju2xt4iA0+tvsS6+dNqAqpmPzKdiQ6HHZdFinbS6FZumP7Tes7PE67gVj7x6Uv+h+ric2Rys12UHQZJFVs3NHzWSHsPF8BzhcAgN+qs4EcsbNuDaNVQQ8Lf/nDtaQnJCuJBii80n3dQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 07/14] blockjob: return status from block_job_set_speed()
Date: Sun, 17 Jan 2021 00:52:02 +0300
Message-Id: <20210116215209.823266-8-vsementsov@virtuozzo.com>
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
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd29df56-928c-492d-eba4-08d8ba69131a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542F9EFCE3F98F2C109CB33C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFRCJP8Bg1spViuZL8aQ+EzSa4VgtVgWt4wDqoX19JY6od0nVo/Ll7q+qynaT10SI3XmAellM19Zwj1Sl7M8id3dOAGbFf2At5PRFBgXhFq2AElyYeTl0JSqG6/MttlEl/PUF9sCSdybC1VvuhUg0C8UyGEQKXo+66hNpSFM+tT2ePQ4MAs85B7p0kh3G3JxQTRpDvTC04TPA0W/6OKzICOe18TXIfRHD0wVFk25tIXjlWOctBBMbmjRPPNHCB2s9kgXmRadSUyqobafgNR3K4seyVZaQNC4OJxmyirVsrm+D+a/ttzBsktrKcXovTHhCDagpVoNtzZFNj6DyoAwZBYOG9skF4tDhaDCCX+u9lh9U9c4f6A9TIjuh1ELYuInPwYOR/qQKHxUTKsqAeZVy9GJDE4AqIdu3zOcu862MOpYg67BwU8DydfA4BSNCybpnS+anKPg+wsAskGvpCu8A6/qGG24Se9EigHgFgXJLRdyhx0vXDaBtypn+oLXtAzH1wAXSooDKtKA/QQB3kbndA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ngKOTdLp8wHpH8R1LHBNXv9KaE9JbbB2FKA676rfOK7MCsSZkenOeHLMIgl2?=
 =?us-ascii?Q?9K9+h3aOAHq91mX9xjI0h2r+EG15PHKfL2f2UBzFH8kiOsKMaH/l2Bj3/0tz?=
 =?us-ascii?Q?FA0x3NYio64wmkSCrQWd7WeVIlPk7OZpDFhe5iqX06n72c7HiVqbGhpHtVHj?=
 =?us-ascii?Q?V9jAjqNoygYT1WNHmF3MY/o75gg45Ae+JvvkF0rLE49B3c62GQLc0HtD4U9d?=
 =?us-ascii?Q?CVqvfCxnv2BWKicvR4cpw9mobmq50S5+EWBxK9Eb9nwY2yFLVAq+reSkgH8P?=
 =?us-ascii?Q?tlwtYvzRgrR63r4kjVcJUpHaWt3chay82PDdnGlrtfxWTivy6C22yGLAFtl4?=
 =?us-ascii?Q?imTcn+gLIYq/y/t13cszf/ffiFNRVLOqvV/ygYTVMhmnz0VNT3uFc9AHti5X?=
 =?us-ascii?Q?DQMOozOIwYkoTO8/w2cMCTesDyKZhO+Yd9nvtYgv4AtEYkEQEMkapEgL5vVH?=
 =?us-ascii?Q?SIimpTRuyvembGygEzrzAsNa9dr26pvtCL4hOjDACJroNYxtyE/BmWuHtzLe?=
 =?us-ascii?Q?8xwEFp1SYGOMMzqXdIKbHsvIQJb6wAAME1DCMPXn//uEAu4nZhnQzsLvN6iP?=
 =?us-ascii?Q?Zw5J10gAF8hPoDP1xDigCbW0amrhyucL53y2EIbXP3t6rGdiFgO9J/SuXt1L?=
 =?us-ascii?Q?XmOoS9p8pFktfgIU109ZqYrazQFCCZzTTi4C/M6fYVXNoiUO30DmqihPDgtk?=
 =?us-ascii?Q?E0ZVAerySqPVdyRRGy38vneHDvd6SaQJq0RKTfJjemI2DlqfEue5QaY+vHC1?=
 =?us-ascii?Q?MJOKVOcyGotUYgxus2TSHAHbQBK5NugPyiMn6ciPfxqooE3X5dMmZcMMFiap?=
 =?us-ascii?Q?6+xsxyjdxqjm2Pm5OmvW7rOK78zIgcDL09jprkIWNzdALIJFcFQuXpy01QZ+?=
 =?us-ascii?Q?Qap+zepKXHC9qPnxp3goscYF8fo3YJ8vFf/5IuqMjCBAKaID+lplEwgQj28A?=
 =?us-ascii?Q?3EXIOIZLUpxKxutUuBbx66Q5ZhcDvvWPdec9HFI+TqeZwpZmKR6v2pD4lGxc?=
 =?us-ascii?Q?2BZ6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd29df56-928c-492d-eba4-08d8ba69131a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:52.9113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAVan+ujLLW0WqFNZ4xdJJOO+H3KZ/530IR5lktqOYpbQlYnquQXnu90lRYSfRAN1IrG3IsVcUxr5AreImzxpII8ctwXYvrulzPy6G3Jau0=
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
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Better to return status together with setting errp. It allows to avoid
error propagation in the caller.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 include/block/blockjob.h |  2 +-
 blockjob.c               | 18 ++++++++----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/include/block/blockjob.h b/include/block/blockjob.h
index 35faa3aa26..d200f33c10 100644
--- a/include/block/blockjob.h
+++ b/include/block/blockjob.h
@@ -139,7 +139,7 @@ bool block_job_has_bdrv(BlockJob *job, BlockDriverState *bs);
  * Set a rate-limiting parameter for the job; the actual meaning may
  * vary depending on the job type.
  */
-void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp);
 
 /**
  * block_job_query:
diff --git a/blockjob.c b/blockjob.c
index 98ac8af982..bba96a89ba 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -254,28 +254,30 @@ static bool job_timer_pending(Job *job)
     return timer_pending(&job->sleep_timer);
 }
 
-void block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
+bool block_job_set_speed(BlockJob *job, int64_t speed, Error **errp)
 {
     int64_t old_speed = job->speed;
 
-    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp)) {
-        return;
+    if (job_apply_verb(&job->job, JOB_VERB_SET_SPEED, errp) < 0) {
+        return false;
     }
     if (speed < 0) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "speed",
                    "a non-negative value");
-        return;
+        return false;
     }
 
     ratelimit_set_speed(&job->limit, speed, BLOCK_JOB_SLICE_TIME);
 
     job->speed = speed;
     if (speed && speed <= old_speed) {
-        return;
+        return true;
     }
 
     /* kick only if a timer is pending */
     job_enter_cond(&job->job, job_timer_pending);
+
+    return true;
 }
 
 int64_t block_job_ratelimit_get_delay(BlockJob *job, uint64_t n)
@@ -448,12 +450,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
 
     /* Only set speed when necessary to avoid NotSupported error */
     if (speed != 0) {
-        Error *local_err = NULL;
-
-        block_job_set_speed(job, speed, &local_err);
-        if (local_err) {
+        if (!block_job_set_speed(job, speed, errp)) {
             job_early_fail(&job->job);
-            error_propagate(errp, local_err);
             return NULL;
         }
     }
-- 
2.29.2


