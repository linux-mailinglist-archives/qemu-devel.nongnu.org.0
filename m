Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CE68936D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:20:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsEF-0007M6-3h; Fri, 03 Feb 2023 04:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE7-0007EG-MR; Fri, 03 Feb 2023 04:19:26 -0500
Received: from mail-dbaeur03on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE6-0000ne-7E; Fri, 03 Feb 2023 04:19:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfN2wLTZbpw5y8fZNn7FgqCwiGjeVzRw5rbtyl8J2iFz2L7USzcBoLAYTmABv6cydzWbwzcx8JjAp+GutWvqQMRGh64IxyghkyBo1GcAgMlMGhrA6l9tcvX39HM2EQynZ172w4wrw4yY3LonAwgpev4+R9tG0glgb0aRQtVlLLP3rHa/0dB+3i9Xz0P/ao7n2mImdyxFMyaHccq3LAZZLtJjj3NFKusXvOSSUtcuMLNTn7Hp0101Ph1a6Yv6aBIg0nr1ePogYxROmuobyNigCiZ1Z/T1rkOhnhDZ+iKFjk0z3N3w3pxMHDao2h1FLoyM72D63J182UXudLvCJRm02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGYMOtB3M5Kd9JVr1I1txZcdZ3Z8vq5B9XzuQXqsJZI=;
 b=XDRUw52TpexiBeVcIxo/wNHnRKnfQjCRhVFkg1/hefX0cxlkL9+sX937Uak5CfIFNxRKR13py35+Os8YjkEj/4Cae6DX720QwXtxXp2NbeGFfTRg5BdEYpmv7HcLyoN9dyWJFopIUasWE8zI2kmX910RGt+O3QX8sB2bux62hN+yOmL+MfCuEyF/K9OnvnkLw/Z5wDJLzoYNvitQt84Sot2+0UTvcgTbvGZyluZMgaNJ//Luwri7+ayApRRw/xa4wZBpwNjYa4cfY5RRbXnbGaozyRZQmHomXAildL0XNxz14gPCd2Mf2YQOIOPTpVt9Lz8FyasbVaRNMFpnEFxPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGYMOtB3M5Kd9JVr1I1txZcdZ3Z8vq5B9XzuQXqsJZI=;
 b=eurUK6FY7OCU6KbMC9m4pTiO17eCpLqozmz9ZG/KnStxB0bFtacHbRTlHkdzeN80m7ZpE4PXyCITD6eO5Q7UaMjnWbOZLlyKiTpoHW2USFYNcAEi7gaFDOu2XUBKjzn5Fh2LM/HvTvncKzoKRGMpPFwD+Kc1Sil+WwNBwhZ4oOPgkgO3A3Sv6XeLsfVJGw/XV7pfQXY328jH0d8HeggLxxNheUpNthq11Bi+3YFhOUd68PqzXBkZS/8UrDyqASlsISqnhz4XHteWx6g70EVmn2cXebmP/C6hWSFJOSRhT4deHUNW+ynZxGmdcrTb3clGB09y7/CrwZakJQhlkpgWTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 11/12] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Fri,  3 Feb 2023 10:18:53 +0100
Message-Id: <20230203091854.2221397-12-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9de68e77-389e-402e-64fa-08db05c7b4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVLrw/FjPehlkr0wY9pZTHGiBgdNyy1U66c4kydwwrA4lxABxSuNnkL5ViZ3XDZTT55GGApSrM7TZ4WNJiIK/kp8S/ZWXUhxvbr98/yzexPX3s9zgHjyT67cg0Px+N4iMr78lKGqh/87qpuyN1mSD2F/2ogpLhHrbvxXOyIqeRbVR+ejrHHdSb7qbqFuioMwvkhAd/RY38NX0VQPJC97DhA1yDEgeXEv8OlW3xmpm35lE9lSuL0670iZz5e729Xf2RlSlzzqOzwB8izx6eZboaGK/yJWBoZL8O5RQrTxHfO2/YeW7AraD9lN4+isWpgQqtqr8N14im2Lbp66y+5e5Sd4hC6OMUhQ6aYk0Z99jhpgxXancEa1Ta2UKARjxpNWoWkgPT2X0vZOMqY6jFMO7P7XG0eQ4kGC35c7aIOAsXhM3yvbJuCQ/ZdhqijTxBJHD6LxQoYCc+6qp+Zs7epLIx2YM2ALJKtUTp6Ibz8LLeCoza07Bi89Ol3l6lFdTuxqX6z0/6ZraCzX46dLPXmUg2HljHlLZbaTFL+1Nhf8aLAmcTCv8s6EXLvFh6+AaagvOu4L3AFz5c2qPnF/8vF+25ydPlBRvu736m9f7DGIvf8A+Okb7dUov4FDe0Uy3jl3sVYexEdda4mV7ul+skpbrGW+2SnpcsO2gG5+JOaUUwIAeW2yR1hJOkqeLVAoZ+Bw3Mj3diMwDlTQG8k4kfb44Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yu9JnAe2sBqKDcFbH+CvhCcBJIUKfPa55kdbacE2nFrlE5tatAvo7PKEQrQz?=
 =?us-ascii?Q?GNkklR8MUyhBANu3nMx+EOVIBny47IvFj2skKJKhwfco2uoxWHOhk42fnLCt?=
 =?us-ascii?Q?Gpa8e1sSqingeem3OEFziMIZqDiJWItoXA12681c1jLPqq76Kzoap0kmw2Sm?=
 =?us-ascii?Q?aJB227hTS+syd60PDJtSi137C5LWA4Ij0Phsunox8qTXe++S1dTooG88Od4i?=
 =?us-ascii?Q?pg24QLeLFiXxUqQBA7AA2al68l9ujHieaOfGEaFi9aDIWrQj2D28fmcN5e5d?=
 =?us-ascii?Q?4AfDkwqJiBwkdafHzbfckmkmmKwC5n3knzHiAPv4nZNLG+dOdLOtSo9p2590?=
 =?us-ascii?Q?WLj/c16FhRBiOurMWUdshDbN7AqJPgf3S+DNJmB9tK0eB9JITY5cQbD5+P7m?=
 =?us-ascii?Q?SV4C9KaG4KSa4+ota6ZKBK31IK70TR+mbK7yNgKlHDoEmSE0A2yIipCnMQ/Y?=
 =?us-ascii?Q?4E9CZttlhxcEemM6XmlTGZx7YRvOpCM0P54pxuDlPFqtpl8iD9KAR8/2vgVs?=
 =?us-ascii?Q?JsVzbs2y6Ar0iamHB9YL0JhaxlmOE7lpQP3oVE9E6Y1or+f33p0hPTzesquD?=
 =?us-ascii?Q?4wAQVEaxcmgy306bcuRVy/lXC3kzFRxt7jycXLOtKsJVpq23OeONz/+D5TmW?=
 =?us-ascii?Q?LFLx1PfUyqk05c+HmVaJFs3h457f7yQPRq/pi/hzK42wsJv4/+ngbLU+WPnp?=
 =?us-ascii?Q?sbJAZp/jH6xAjDAnRvcGpEc1njHKsx/n+LsNYqkGiPwfKPfmczZc4oMmeXmd?=
 =?us-ascii?Q?iVguCbONTQ4WszXBU4h/hjc0s9/+v7PbtGQ/ul5HjwiOx+F6VdVGlgbI0//r?=
 =?us-ascii?Q?vsHKhGwLRpTf2Zvt6cGcs/p4qbvdcCWcKHcQg3Gu7ehlW6hDRLwuZqSejv3r?=
 =?us-ascii?Q?9galZP/CUPttG70y1jxiNZv4oOOZd8xT3/IA6Rp4meFksXJQJNJ4b/EdjbEy?=
 =?us-ascii?Q?b8EkVMNX/jCEEyQmqaPDv1+fgyXM6u7wGgXvQBbBRRwVQkjghkCFyA4gCnn9?=
 =?us-ascii?Q?nPJ8VJkAtE+Q+sElUJ69wAqwnxqONeNhlHC57hX5kFyk6SENsjEjISV25IIf?=
 =?us-ascii?Q?vlZcw3CZFZBJ04W6D9KH0G52v+RkncuWuIlCaLTIn/FVD8E0a3Cd+NYdRLDr?=
 =?us-ascii?Q?kl4RG4dRbMc+sCPFKOHPXVYuLaJf1P62e9D9qVH34OY2UfieX9lVJL/LcIaQ?=
 =?us-ascii?Q?ecmMtbbczq9etLcJUB2VMQYS+N+5j0pb2FCFBw/3vlYljMBejOxqCflLhZ3G?=
 =?us-ascii?Q?WMjCAdGie19WJ/8tYx1eXLsDr51VgtmFx8DPYtKtMtpsfdB348QPc4D2Bkhl?=
 =?us-ascii?Q?Zx8yJ84SiCpFNjDP4fyFN1PUedJT9YcC5ebG8UsRmflhiv1tVeALoUY7vlMq?=
 =?us-ascii?Q?ETjvF6ocKIma24LLF4ssoA5kkQlWsuaxn6upSIyOKES3u7QRtqMsOeL7lX+s?=
 =?us-ascii?Q?ziC2XTK4FBn+htvjM8dH25fwPFfnSA9nM6L5aABcvhFwT5rop+mAdPRtOLWr?=
 =?us-ascii?Q?WCzXzlq4lvWjKHlqx7vvAlaQAqE5MU1AWuuLbuVd0o5HZj7nUtaKxnmU6DR6?=
 =?us-ascii?Q?615rnm8BiMeiOhiO0gd+JZIo5hLYh95LvrScqBCDDNGbcaycZSpYinY7v8oJ?=
 =?us-ascii?Q?gpJGhoY5hMTPKh13/hvOU8c=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de68e77-389e-402e-64fa-08db05c7b4a1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:09.1257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DD0a8CgtRZuATQIk5Zk1YPJqLigRZ3N1vrLr8/VDMZ63eJBK7W/IVAZyewBrZGTi2O4o4c2JNoU204V45ilF8aow3H3ROwhEExdS9IqaewU=
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

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 3c38a0fd09..61e7e4010d 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -560,30 +560,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     BDRVParallelsState *s = bs->opaque;
     int ret;
 
-    qemu_co_mutex_lock(&s->lock);
+    WITH_QEMU_LOCK_GUARD(&s->lock) {
+        parallels_check_unclean(bs, res, fix);
 
-    parallels_check_unclean(bs, res, fix);
+        ret = parallels_check_outside_image(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
+        ret = parallels_check_leak(bs, res, fix);
+        if (ret < 0) {
+            return ret;
+        }
 
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
+        parallels_collect_statistics(bs, res, fix);
     }
 
-    parallels_collect_statistics(bs, res, fix);
-
-out:
-    qemu_co_mutex_unlock(&s->lock);
-
-    if (ret == 0) {
-        ret = bdrv_co_flush(bs);
-        if (ret < 0) {
-            res->check_errors++;
-        }
+    ret = bdrv_co_flush(bs);
+    if (ret < 0) {
+        res->check_errors++;
     }
 
     return ret;
-- 
2.34.1


