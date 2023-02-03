Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A786689376
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:21:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsE3-0007C4-Jk; Fri, 03 Feb 2023 04:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDw-0007AB-3y; Fri, 03 Feb 2023 04:19:14 -0500
Received: from mail-dbaeur03on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDu-0000ne-J0; Fri, 03 Feb 2023 04:19:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYPq6bQ97841bgjRN3DusHlkE1FGku7rVHOdNXhhe0Ugzj8UvFgsaztVujmfI6AzuNnL+dxHITHbMR+B+gkpEo+R5agZe7h2onlT3TpmYgeYLqPeJLFxd4+va7oT86auniEWVuS8k0JscVxVpA4Q2Ck6hX9ei+cbVlGrUY0uO6NZgIqQSwfJZdEXgkVebSNIQurChJUAlz8uCJ6hzEwoSbT3LdrqOL9R1FP3gL94XA60jsD5+Ac+tKol4zBZv2t1XWU7REsHLskiDWHdSJaKGrtveq3m9VOK0AkudIh32GRYgcm7DWUNFROHNapMirRzQoBzlWfpGv8ASJlm/bZgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FllO13ykNHz4YczDSZc7Btd+cBPUJl3fkQ/GSewfQ0A=;
 b=WbnZOpIuXpT9mrrxqqE6lEr5fDr6CtBolv9q6Mgn5qT3omeZdX2ke9wTTxT2E9a4SDWpQoo/sohvZx0fWfHNFkl67r6hj1Q04qzLDO4N/yEgTwyqDDs0xx9VpMsUdDI+Wp/FZBw1NhJSpROabceH7S4hNsXlD6G3RfZQ69StJ5ATnnrHx2fAchdPi+eguIf48zKwiEiXeJSh/SpFD5E09etAzbnOf74B3s+UXo9rr7pdJpKdNHFtOI4AQ/faU4zdSK4RhV3jCfkbuYyAV1U9RXxBqyrD6Vuw8Jo9VMtAmg/M5mcvy2q20WZhhKVJkxjHTxQpFfd0hK8NtjEmOa7sIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FllO13ykNHz4YczDSZc7Btd+cBPUJl3fkQ/GSewfQ0A=;
 b=o6Vb0bpk4rWeyteyksQ6PiwXdjl1kIaLOsJ3SDwyzpYRsZXSJFyDWMJUHhERvrTWzCpAKwul3bXRpdRHwaqdczvtYuy6peRysHE6M18V3VCVm+OyDJdtnwOrEK5vS1IiIDDPoqUEiHrGjCEeuqPm5npT7PBeLEdN2RYzktv9m5zejTDr0ZUDNjpoyUtUAT5SdJJRfpsebiCQslUFvzNeqjtRbdh4bFV+xAQiX7+TzQgQ/nlRR5cL0JV505Wq+X+ehLercaTPjuRg/H2/oVL3iuMt+Kln9lL4qB/Nk1QYDX5g8+a4x6Af+k/rdUPHefs2HWbqdQc0cL0y5e0z5Usp6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:04 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:03 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 03/12] parallels: Fix image_end_offset and data_end after
 out-of-image check
Date: Fri,  3 Feb 2023 10:18:45 +0100
Message-Id: <20230203091854.2221397-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c0ba53-2020-43ed-5785-08db05c7b182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8jj2oeAoMIjzXmYXOGGrSGF0BSHeRTYNDAYngwPh6y8AUL4CPhwppbp1n8cRbHSN/OxfNXqp2m7ZhppLcAjwMVH7FBaNSnIVT+de+tCgeTRQk9UCudMbYyGoEuzE7qajm7FWi6cSneDvrmFbTOSAk4RPOQkKhsS3MWRjMlRlKhNRFpJTmRpXsbj0MebyhW1jFzR4ULnaNE8HsTQRWq/ozdYl1HxipvP004lxSnXDg4UuLhXHBVNv6/auGUJfW/aZg9uEBuaxpqDDWZiatQ1TcpFoxyn1xX2TyDADypRqHKZmjgZhnvC+EI8hfb7w9F3d8NT9smFyOqpfjUSqZ+YM9fDyuLBQeIfCSWK/y32ON7mcjObnC36JEN5+Mi36PjIiG1EW8b+uOu/dL/fsi/VPsvDtvZ6w91EFL7haDC63BA+LChIVPQLddjgZLcLO3LORPwMJt2bzvGpEnhU+3mgiW09kxEw7XuWJpkHuQYCx0UbzsmYXLDnEzv3ufz8XkvRRpML19Tt48xDHy5eSNgQWTZoQo1/wwiLpBKExFcAKguMSp20NLf8VcpNrh6MWjwinaeidoDnyAAhLZ2reP9EvxjAw/7Ea4fxIjTAKkqydF0Vcp9oOa+e7KFj3WD7naacIvvubRxPq4ZmbgORc5kQ7Sk5XKcAvpgK7kBnFw1NeL8Quu36T7WoSfVI/rNKZBgkPaMIk3sSgSxAX4rQuzOGdSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uDuTdEnoV1bdKB3Dk7RUVau0MssAlS/0Dvky1ELY/QCxTT7JtnmPHGCNmgAe?=
 =?us-ascii?Q?LEiz6inEHkhikIK5caXPU3L5OOGdI259ZJMbvEMDRjI3j1TowgPBbOM1PG/0?=
 =?us-ascii?Q?ot5WCmlI5RqVC+jxTSPZhVKwXYWj3ujNomKwp/mnHS/BNd0tWtID94GHUu5Q?=
 =?us-ascii?Q?kBRClIuKuzH0+PWpzKM7SmzwFx0pE8A386MQulGE1Nmf7HEzEc9cni31kRp6?=
 =?us-ascii?Q?g9o11+C07JPQChD2PiO3jyw4rqza1q1MPUGvFoBir0QnN3SKAVEy39nNRz1l?=
 =?us-ascii?Q?y8NaiDulpLMSCJGMbypCrLcRdxLPitLIF/72PeIxvQaLHQa9jlRjMcHgRqci?=
 =?us-ascii?Q?+jErzWJ+jxEtTGXxdabSpbXVGnk5B8/8HjPH69PNJ7S0eDWb42H6gsL05I0v?=
 =?us-ascii?Q?uyK2xWtBZ4g884ZBmfuuj+kZ1GTql2QYrQPfeUXu5ma7J0QNGaZpVuMHaJKP?=
 =?us-ascii?Q?Fpry2I1aZcq6r6GylKngA4X2dBSQEc7BbVkWfeosOGw1rARp30AQtTCh1KKk?=
 =?us-ascii?Q?OWbTcg43pzQZyOUxuNyJ2nfJfn7t+/XGFnsd2rmFy1T25my51PCL/cOTCh+a?=
 =?us-ascii?Q?KWlIgbS4yEHLnDO6fl3Y8xUX5bFJZ1H60Hb+y7USVtwmL8zg468wQI8OBW4n?=
 =?us-ascii?Q?Q77o6gYNpAKGGTylXgHzqKGpNowNva8EcJErUV8soAI3AZXxIiysDlEmqwW8?=
 =?us-ascii?Q?sQoADtdMssgdG+yXFk2p/u1Ap5SWgyOIGHcLiUnpCALmEcg9sK0P9Udtnrtx?=
 =?us-ascii?Q?3g+zyFCVDW53nF/9E9ADI1XMXSxjNzpMLorjhQtjn9gvWObXXm79G1MNdm6K?=
 =?us-ascii?Q?tu2Q3FHQe64YLVbWVt5c/ZFokg7U5Qj8Rzq5D34TIckQpvC35+FvX2xl8til?=
 =?us-ascii?Q?OVh67BdcvPvEJ87uuqoll7lFHIp0hkvuskZDQxUwpIl2zAhLLp3ifxeWK+MU?=
 =?us-ascii?Q?Bnum4QcaGKJGJBx9hyA1CL1g/hngIb0lKENI08ncdTAe7bDGKAm8LaeHPyi4?=
 =?us-ascii?Q?+PBjW26uFYe0KSDriikH0hgBQRPe5DmF2NSiPndVs7W1yfNE0iig6pXlWwrw?=
 =?us-ascii?Q?m22vPvhNjO+2JMYKqM8MoTrOzVx2ioUFFTMs/Riume0a8d627IuRSKg/xKHe?=
 =?us-ascii?Q?U0kk9UIxANww2Wa6p1jVdQ0HW0M44QGZa1ecKexNgfhD8B/KMCPdUDMJ1cXg?=
 =?us-ascii?Q?rkpLEcwOCkghdSl4M71LWFrW4hwempr8/8vEQchXDhLIgBs+dCY1eEvpB0+k?=
 =?us-ascii?Q?DLTJgI1JrFghbCVmqqbVGdKfJiI+LY6FJYVXzi+7m1H37xF/0+pT8pjshksx?=
 =?us-ascii?Q?49Im/pwZzUex5EKih+AknMtzPmimuZrFKbmrv962ZTSjasMC7eCGYj1wX/3l?=
 =?us-ascii?Q?be9phVh2ChlUTqEpy6Tm0J/VLa9FZeGzAUeJ8Ii/ZYr/P7uH2Mm/aLSehsiG?=
 =?us-ascii?Q?tJOFW3/1yfwbUr70Ypmh1bRr02cIHCNtcM0NV6vncbnPvqsWHHmqDpxoY6re?=
 =?us-ascii?Q?Q2XpFG23AlDNhK83muHo71h61b9NCD51ifAxAHX1RRKValhdFF0hrwLOZJ1N?=
 =?us-ascii?Q?v1y449Xyb4NNF7kW2wxlgr67uYUr7ChE8lrpKFC8dOqcVXPCxrKE8OCql2Dx?=
 =?us-ascii?Q?JBlnI6BGOq6zmE+GlxcgFc0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c0ba53-2020-43ed-5785-08db05c7b182
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:03.9203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: az1PczYmT9LOT6nRBys4cKp5ymB3Jdt2/RtjVKySrM1VgowWnwZDqCCzVAhlUsI/IlYk6M5Vxw3caeEZVOTawa2Lasj/UzNFvDQf1rzVkeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Set data_end to the end of the last cluster inside the image. In such a
way we can be sure that corrupted offsets in the BAT can't affect on the
image size. If there are no allocated clusters set image_end_offset by
data_end.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index 436b36bbd9..2ed7cca249 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -488,7 +488,13 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
-    res->image_end_offset = high_off + s->cluster_size;
+    if (high_off == 0) {
+        res->image_end_offset = s->data_end << BDRV_SECTOR_BITS;
+    } else {
+        res->image_end_offset = high_off + s->cluster_size;
+        s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
+    }
+
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-- 
2.34.1


