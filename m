Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C31D38B21D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:42:54 +0200 (CEST)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjsy-0005jS-S5
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZz-0006WJ-HE; Thu, 20 May 2021 10:23:15 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:8320 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZx-0005ij-GP; Thu, 20 May 2021 10:23:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDHV/mWmuOPnm5PubwAwe9IIoYSkPvo9FbB8nIxO6CVjvpex8uNByL4En54FdZWb5GlLCbaqUqNr7Oe1zNBRBP95KQmL1E4448sEesI3v7K8HtknwFNcFfd7brkKZsA1SkJGQCwzs700meLnlTS/ZfOAzJSQooDiqXcLoaACHnbImqj/zsgB5+hHMp9a5s2fjWki8boRtq1ImYugMaJZJmPuHiTYUiQI3SZtCcyVZoGbZGdc6oTBRWePB0jUfg4vJtCCjCgMH20RU7ojAKAQNvs5r1SLSCna26BoILolcoZ1nZA4k+7qLqVuVTp08e99DTbk+Ksg6W0jj+3amO7ZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEbgov+yQ0/+ZLKoraieYigGWKc/Ll8cJU6HrVEihc0=;
 b=GnL0+xOVyUeoORX8rJT0F+hB8MMHOB/xjlLxrSmG8cRoveVWRLfL+SVJAm04bxU3rQpY/LxXJmC20ZXVC4hS6AxuJqOEfpn08b658TUIEUFs7ucgtappLUW3aa63xF5AyBxePBbTYgAkwo7xxE71PCQQMNyZfyto74BHnqrgVTvIBBkNGpPl9PLAZUp77uECsXC+/fOmXRIb1af6o1iKkzsByOwUjdK7AXtc1ZJpd1gjkdr/dYbrPmoLAu+jrrlOtim2GL17098ytP/celChHGq/mgWgiIWuypw6XpUiIUwt/74ayP+cuKWIS5FyNRvmX03XxTfTJpjNGj4F1gcwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEbgov+yQ0/+ZLKoraieYigGWKc/Ll8cJU6HrVEihc0=;
 b=c3QMpkgXch9uFA+vWJUhjgcYdDIfajT4aSENJ1GwbdoshPG7T4S43YDW7YL8y0iJ6oyP6VlHTlBzx+PxU5JGps5xkFSsMlRp+2SRU8+gdWMyy7T58YxrAAcAvYCjZrvVQDq7dmAs5Nl6gZ2RCkg1FinXH/3fvRq9ELsinvHVBOs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 20/33] block/block-copy: make setting progress optional
Date: Thu, 20 May 2021 17:21:52 +0300
Message-Id: <20210520142205.607501-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e091028c-5ea4-4066-1e92-08d91b9ac013
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544775CCBB1DDB1D893EF91C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Zo8/Y1R3B4qWAgnNnGIw4H00J/l5jF0yEPj8fLgXaoSganR2j0cnUCc4dVgGdjS95ONkhNymvP7u3tfOF86CPAU2ngHGNOt2ChhGyoXP0hkOLyff0H7nl56NxfVekc9HoHq7bbNjwGmhkJw2ZP73Lim5iYJEe6ixaTgfSP/Csnb5nnNlxuoqIbcRwtIEk7pKSzMEvp/wDGntD2pz+klUd7nU4XzOZbwC9cfvWboNiaXxw/Zr4qhCtgaI0m618ts3djr4v72hiuWdVu9citR+4YkQmNcCF48VrCbFLWTErqNp2eVgzMKh0rCE+YKR8Mf9SmTVpU4gIPIoRwK4Unda48eI0Vy62kgQq45XgwmgSviIQlErl8j7skc4aM7pns5PcPTUrFMMNGely3jBF50xr2OvHwmbyykLE2w1mZM4kwZyFxYUfNdLJq+Qj7i/kqbs5TBzVBoYALk9gi0AzBpptXUs6656lK7LIZA2Z1xsYQrijDA5mul1gw7ULPdzFM4gfeDHJjpCdmmkT0ERfmSSxqxeLNiEEsnB+4A9bfLXi5EEmvc1H58W/s1bXxwxNI/AxVULJ1trCfSd2JPJkj9qt6Hls7sQiedniJA//bxm75n0ou8T2GgH6zV9I0k1yUpsKK2p/JUjho9tFmm/xbsehcZgYykl+SJbx13HU7/DkaWa3E0u0KjacbHOBdLraqI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+0vniiBL4I+IJkmyCavB9zlV12ZaeSqBhhXX6t+/IZZe9WJx1GRKU2cVmkvp?=
 =?us-ascii?Q?FdATX3ma7koCia5VSKN4PJSaX5LsCYV9EQo5zvvbIJ+9YbcwJdCqnkFpF5U6?=
 =?us-ascii?Q?nR5WWkS6Fl7U26hwAzd/aJDjS/d8Xrt/TgboMQlWFBkIgmeIL8eVOQX8WTbi?=
 =?us-ascii?Q?i2/ZPUzX1RikgotAtmHZjhELHKI31Xa5GJ7frD97fxU1WmPWfttsW2nLuaGj?=
 =?us-ascii?Q?9GHxNMWoxZFl3c5VxolYAt4Xv2fonR2BB5kk8V7lZT/As8jKjv3Tx1aK7ujm?=
 =?us-ascii?Q?ei1yP+HKJrBAWnNPWJ8RQfuq+tfu1jmDKRPZqG7mnUDiud0H2Q7f+vZff0Ao?=
 =?us-ascii?Q?8Xtw8bN+TNfsc3HDkvvpJ8alxF2tdBgym0yOkQjAB++iHRo7MKW1AuzlpUqv?=
 =?us-ascii?Q?TtPGflhrlQRlF7SQOivy5kcSYOp34HrN+BPrjdbuuaWDN29OORk21JY7kPxH?=
 =?us-ascii?Q?KvvXvL03upSQEWypToWokB6zeEuovM8E2Putp/fP/26i4drd57whZy3dWwuc?=
 =?us-ascii?Q?W00EqihvpzgQ2//fL3lgA9Z9bHauhp7QoVapXeCS4WLTw/BgFb8VM7mZ9UL2?=
 =?us-ascii?Q?TXIk9DUeA4EgNpB4/lHte0wyPN10DZH9x/GZGj7sgni8kyLTfu3Ycb5DuPqV?=
 =?us-ascii?Q?BM6zUCJ6RQGN1d8hhlXVXRhl0zWy313ebffllrYCPHHSaAz93Ym87N6osko7?=
 =?us-ascii?Q?QE6K1TbZjfdpLVWYUiEsHlduxJCRYo/MtYuBtbJuNasg4TpEpyJyncZdb7Jx?=
 =?us-ascii?Q?CXuhivHIvGGmshMGrdtuHIRs/cLzgJyrVy30xZH07d9aNTVUiPKaCkoQVfxk?=
 =?us-ascii?Q?f05QuMK75Xw+jgQ/Vd6+rqW+zRY8M66jh1aRw69S3K0cocwH+nfGrAyIwGSK?=
 =?us-ascii?Q?lvjTiV9hdYBg9BLWe/UbrpXi7OqJz971N7JioIawjdjC2J0A2FBL3he08e2X?=
 =?us-ascii?Q?ZK6kV0eqhhyeC3xGzR3Ix8kQsGpqtga/Ecmw+yBjCCAto/3YtO1Vp78db2wY?=
 =?us-ascii?Q?EWFAM7czJDgX/mrsUbaM2Jn1epfULpDz+p9bsLh/ALqfrZnmYQRjaVgYPtwE?=
 =?us-ascii?Q?Np3jOWnaG3pdC57EzavD+Bd2cK7VmtWsNjxddCn5yZf0FpiQvlCMLK/sGAF0?=
 =?us-ascii?Q?Mxi0Arz54IJDRQVwSOBeR9mxrDQiEKoBJuwwgy8ORRDM779g6xXSz22SYQiH?=
 =?us-ascii?Q?DootmJcUjt1bg+ZW8oLB2/iO2CDHYTarrrpw0nKo1x+IgNioSiDkhE9qpLEA?=
 =?us-ascii?Q?c8PDgokFLpU1lckwdQRcE57Z2k7RBcSARa1Cf+QHGw/n8L37J1MO+9sDpcfs?=
 =?us-ascii?Q?j1xMCbtk2HsZOaTNdCgpGZVC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e091028c-5ea4-4066-1e92-08d91b9ac013
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:51.2262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eL3+McdYvaGkzyHk/Gwq0qulmGa0aF4pFdwoW8eKWtRfZIvbjJt7WKuL8cUknER2LFIDprTYOWAnXL/61MMz1C8HzaMZu1R9VVO8cwaP5M0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Now block-copy will crash if user don't set progress meter by
block_copy_set_progress_meter(). copy-before-write filter will be used
in separate of backup job, and it doesn't want any progress meter (for
now). So, allow not setting it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 9389c7c6c8..0a9c3692bf 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -509,7 +509,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     if (ret < 0 && !t->call_state->ret) {
         t->call_state->ret = ret;
         t->call_state->error_is_read = error_is_read;
-    } else {
+    } else if (t->s->progress) {
         progress_work_done(t->s->progress, t->bytes);
     }
     co_put_to_shres(t->s->mem, t->bytes);
@@ -613,9 +613,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 
     if (!ret) {
         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        progress_set_remaining(s->progress,
-                               bdrv_get_dirty_count(s->copy_bitmap) +
-                               s->in_flight_bytes);
+        if (s->progress) {
+            progress_set_remaining(s->progress,
+                                   bdrv_get_dirty_count(s->copy_bitmap) +
+                                   s->in_flight_bytes);
+        }
     }
 
     *count = bytes;
@@ -675,9 +677,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
+            if (s->progress) {
+                progress_set_remaining(s->progress,
+                                       bdrv_get_dirty_count(s->copy_bitmap) +
+                                       s->in_flight_bytes);
+            }
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
             bytes = end - offset;
-- 
2.29.2


