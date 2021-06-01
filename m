Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840FC3978DC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:13:35 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7xO-0008O4-KV
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7by-000342-Mc; Tue, 01 Jun 2021 12:51:26 -0400
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:14240 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bw-0002Cd-Ml; Tue, 01 Jun 2021 12:51:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8ydMG8BGAlbHe0NFC7Rr2DPPAVmNhawgS/qaxJ53mcdCuaJLVJQzlJOue5eJfVWM4xIFwQ18SkIuV+mJX6AfLK97mVL9D6h2bmfYLtrmqsnkhHg82k6KYYvgpUkn57t91rPhpTdv8rdagnUo2P+cln6qVolvjO6C8zXFI/PjnySshV4lhyPNPo1OAI8IoVQh1uDHNqrolqkyKdJ3R5P6iTwUMaOX+UaJRPY0Prc9Hj3L+xdIp7ehFswa2dNsoK+W23n/FdGgdXIsMfE3NRpXVeX6rEGhws0LfbQ15xnO5gY3G+APTQTbiKZCIrZVkhHL9+dmuCUGadQJDdZ0LaoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FP3oRG+mlTQOGBmI9nOAJBa88SuTkz51wIQU8XrlyA=;
 b=nTwOKX9nvx0nTe4Zqs4sQlR1xgaeF9EG9ljCFiLijCejBzDY69IS5MLQvURGEGnWdFK7wqsjGRYfh9pwKtwnyF2aqYo2DYolZAV/OdNDvj3oykAKoijcSLkpBHs89W9xbDQab27O6lWtepUwoiknU/ZrXnxCZ9zI8zER2+a8zeX3u/XvsiHvE/7KqhAgnpAIarEAjN/0GyIfyikL+Yf/AC8X+RAiiCdn2w28k6/+Otr+xm83B7jFRm+aY8t+lJiSD7dI90bM5Gpd6GMDq6eA0XYT+Rwaj++UTxrVDFA3oeG29+13vcDirZrtI4MCKWmjRFOM7q7I+GcbZCw14NH5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FP3oRG+mlTQOGBmI9nOAJBa88SuTkz51wIQU8XrlyA=;
 b=gn4COHA1J4gB0fOo+4JTYvZ/WUkPmb9buw9tVjHKUZ1WDdvZ6iOe9+xuptfruZ7bSzat99sXtQb8aRrhhjzUd7E784L1UUS9qILLexeNZzskWN1ZM/ATjWLzQxJT3Kx3QLCrUcZGUu3CTEJn4MkQ5w1fJYf2Y5e/TstRbbVh4pc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 22/35] block/block-copy: make setting progress optional
Date: Tue,  1 Jun 2021 19:50:13 +0300
Message-Id: <20210601165026.326877-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58691657-544b-46f1-046e-08d9251d76ad
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB197250EDD947DB55C1D9EAF8C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyMK3tXgQucGDAXh/2oxXN/A61VOSax83f8riB9Ls0W/we41SY70z2vDSfCrUf8xqaM6srp5gWY0oD9b4A6aTdUVqUHvHcQFuGehTgU92m4/aSRCnoOvbpgvEjHvau1jm3CGiT9FKM+q2pvZ0IsGr/QLHgHb0AluQr7PZXsDqkqZKkCL87+BWoTTEgTDli1CBESaTOXnZxxQqcxquCbjXU17Oa0iw9h2zRjG63A5AiRQc/Dn2rmgNR/LAeXOwXIxIXRUoabQdjK/RmWvUUd3W7A4vGaKZHZyAf6FIl9H92/z4B7KHdJ7FweHfjU3oaBTzzpuDqyXq+kkAKkGffQlRWl1PMCnmjWan1AIpNmv96TwP84pxddY/VJ0PtsL2F8I6bKMmMDGtE6Gctgho27YVM/SIyOSmJgQ+vj1UJmcq2my+PfwSKiGgsO1F9s+S5JLfatCrMIoyhMyPcdNCKx1/udMoAWANOWL5tycw7gtUCQAU6dMS6CQ6zdDB0oox2FiYH5g13zxM9ZQTQHhdi1aLW6zht2EXwGYujMbR7Ir3ngi8lCSD9RorI8wSYgeJrPGOIlat1QwisamhxmOPTUQqIUL/I1SZksKdzuPzx/sLdIwRYqGYAnCFE+tQEEaiwYWpPtmKEnBSn5oALk7oLOxXqSGErUypqpKaPoURV4j85PfaZi9KndOywQtNqTPlxnJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cXkFWZQj0rMPKamQEIBQLc+iDKDVSg5vtV5hr0GdX3qwK2Twh/MyUQJuL7WV?=
 =?us-ascii?Q?W1rgq3kcDboDI5OyD6Uocs8EFEoMH5GhOwItav5GOWAM/OqnzHl1P+36yKdl?=
 =?us-ascii?Q?H2NFshTlhoZXQ1g1Wy0ogF+xDxcukc5w8qRS/Ypc+3esEHkav2eqmbmWC768?=
 =?us-ascii?Q?nH1RN2wck928yqeaDmtWwlTpzvEzbE+fLZbC+mIKPm2Ctdl+R9YPeKm27jvd?=
 =?us-ascii?Q?eAvaVh/OAL82Mpx7RpxJsgumtzf/bIFn8dTFLkCixaPUHflI3eAJxDnSW8vD?=
 =?us-ascii?Q?smgg4GtmAuxM1PTHwSyWbjI+cKXNeX8runGPb1QFMECHK806ieiAESK14SyH?=
 =?us-ascii?Q?P0YjPKR18UC2QM3Cfy92X9OiVgtotTtg+JC9IBTKGFh7P186t/QWWcNrEFcX?=
 =?us-ascii?Q?AO21iwVPJPxrBqjRdykVY9a0VcWLibZSu+trhaTaqtFnLy23/ak2wnFuwsKk?=
 =?us-ascii?Q?XMuuphsCqSnRFNhVKltk8e2PhjAK7iGIL1pGs4+4IpU6NLhDsKaBsNyHOpEp?=
 =?us-ascii?Q?3KCeu+rH6HkqbL+FzUnV26MN/w54Fq2zGeQBnuamxQ39di5V4Qy3nBw+FrSR?=
 =?us-ascii?Q?wdJhz9nxJxIvSTzu5WCMI65BV6dbajO1r4Qix3+1H1heiPk8zAzm9Mztd2N2?=
 =?us-ascii?Q?CWyxa6LE/6g7Zf24PILqZ4a6MoiUnfTkHXMviGCaEVz2xmLu1hHO/LT9gHqr?=
 =?us-ascii?Q?jFhgGB9lfn+7b5rnGkWpq4KaG2ydrBhII9gOz1HJYeyRqp+c7KSdDN636GLv?=
 =?us-ascii?Q?08qfBzAOAFMsCI/iTsViQtNiTlwhqLvQ94lD8VO6gxWT04sdTkqp47PZk31s?=
 =?us-ascii?Q?zAYPTThKb5Vnc4/reEPo+me9Zq/txAXRvvgURVTbck70bSrh93++7pVQdpZ3?=
 =?us-ascii?Q?QbZMrmxZ/JsBClzSLro9QtZudw79kn1ByW1qr3AzuQ0R3wy89qvz2FrHWYCn?=
 =?us-ascii?Q?SrPZR0/b2cgUvRnCTKZ5KX62ADPPPCOx80FudGuOgTsRyLQ4UcW2i6CgO94I?=
 =?us-ascii?Q?wzamcnfty1YnYIz0g8b4OtaOoRELDoc6/Ov2Plhb48EEyWjWo2L204XL1nms?=
 =?us-ascii?Q?npQ6xGTcDU5i5h0SioGT021AHuLjRU+eotmLaWBWBi2AmpZ/GDRFArz2/RTT?=
 =?us-ascii?Q?8+2CujWMFuwVeNc/Y3K/fiNl5YAcEy19DCagDfSZW8sLxiZh+z4yBFmpmaKU?=
 =?us-ascii?Q?NP6qispdsk+0bw1grq7Dvc/pt3G5zbZJQYw3BGbv0TE+RYIS42/sYHjOFdUa?=
 =?us-ascii?Q?qDLaJXuLtLM4gh/PXrXf9rMqhZe2IP8jq3hgYgjMfv7YOSMoWxWaRyZh1POA?=
 =?us-ascii?Q?V0fcW7ImlVM8+sHEMSivppIb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58691657-544b-46f1-046e-08d9251d76ad
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:12.6040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrKQOUxkYwN895Ww/zXZf9LYafcD+13H8Xhu1HdrSyEPuL+r0vMmGniBGCQVC2oDxr/QekudwnjuXtAfwaB3rhqUNUectTwxhpdzT95x8t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index 649dde448a..d53626a735 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -519,7 +519,7 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     if (ret < 0 && !t->call_state->ret) {
         t->call_state->ret = ret;
         t->call_state->error_is_read = error_is_read;
-    } else {
+    } else if (t->s->progress) {
         progress_work_done(t->s->progress, t->bytes);
     }
     co_put_to_shres(t->s->mem, t->bytes);
@@ -623,9 +623,11 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 
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
@@ -685,9 +687,11 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
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


