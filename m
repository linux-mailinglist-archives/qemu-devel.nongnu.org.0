Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907C25A14E3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:54:54 +0200 (CEST)
Received: from localhost ([::1]:44588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREFx-0003UR-JW
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtc-0000mN-GL; Thu, 25 Aug 2022 10:31:48 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:64553 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtW-0004oN-V9; Thu, 25 Aug 2022 10:31:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwTuTSwCqeYa5z4kM7kfMDX2t+rBzhKalP6Qy6/VjvZA9HHAKOZ4xNq0+GQoYVJwZpyLKdtV1SXLVuHdZ1PIrLXv0y4L0bbgT+Ai5axW8lCUKtzCWRBoTeBk9eptZ99BRe8jBSlQ8pCrAmVa3/oDGXNVIizgb3IVfMSIcwEtek+E9zhSbmlIz5h6MJUkoC9zn8vUaCPbGWLtpvkDe4TGhE1JHpDaCEpM67y5b09ZcqeRgCun7cPrcx2eItccyeBwKQKvFGKI0AsYv2UB1NLJiBsoq6xDNrmEnz0DA+DFW6ItNCTEEaSXYKALg9fPnJI3ZQrbqEdgWdsVInDfoKF2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muZhga5Mtg2pyW235XbttJqM6vST9qzQe7PQGZbXvSg=;
 b=Jn1vPcyiIryx7V+5I1JobFePnx8fLK9RNwmT79+Ge6azXiNe9CwjvxPwp0HuL/wjoMcDCA8PLmphSivWn1w4gMeLWjpDxwsk2LwB+kSgqXTeqJUfH4mazf2JIEM/RXro8rEY2aM04du4zqJP23soKWxP8F+usUQg0qkjDhNByF5QlW0twHJZbpWQlbV6273Z1m/bGcRYZQo0eAw/50smq8JY1EbcuvB63Gg2RtHcANa8Zz9fueGF5ayKnLI7tvFkMwbTpnDYqEt8yHtT3+szLp09sr/E95qoxVgaq6pgzKh7RTYZuJc8OTSgldKGI9UfjjulUL+l0uttIgqArIVHVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muZhga5Mtg2pyW235XbttJqM6vST9qzQe7PQGZbXvSg=;
 b=bsOhRfYm95B4jO178FlGiSl79m1Eb1ZQa3iTPwpjXVKcDRTYLuKm6DX5e4IJReelyXqnfA2EG51xsQ14q6m30OamhDccRc4eDp5UCjQ4L7uu9+DT8TR8ebWxxrN2MrJ8D77NDnFQOOB6NARWRE+fre273j78Vo9uPuDsusVYYcb0EnTa9JeaRsh2aErCCDku5yNLgxwo9tfA69h2b96I5EwrRRf1TdB82ByaYO4wgmyg1Phsh0cvXppuZc5EhorbwpVkVP20wG0zjqFSuOiwbL9WgBHnNIANiHoDfAycAmO7x/ACU8I5JtyO+iF8Y+gI9Wv7XGqdZ12dnFkSg7gqjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3569.eurprd08.prod.outlook.com (2603:10a6:208:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 14:31:25 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:25 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 10/10] parallels: Replace qemu_co_mutex_lock by
 WITH_QEMU_LOCK_GUARD
Date: Thu, 25 Aug 2022 16:31:09 +0200
Message-Id: <20220825143109.176582-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be77bfa0-cf7e-4169-7448-08da86a67d3a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3569:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nbzF9TGCk4Lxsh2Vu82HWNwG9gKMBR0sCAgKlYl3dxBD1wbm8ouOuZFKkx0F0oxulcj1CAp7D5gKFMVbcWONeaKp2Wl8cFcY4NPcSHkgAZTo1VQu86vM92jOE0drEbhCM/6GL0f8KL4oM/x+hcETIqzCSCwxAuB62YIEOeRamwGOPNUjoNfoIpXBDr01mtTvQmrZ2qFZomg0qwtYkMCKaa6Oyk0rQxg7HC2N1f2NEV8KkSBLKHurwkkqnFDQuHlIs74RfvB3hzgbSzvVIRhrAEcUdQ1/N+tDDdxIRUKIsiF5a9gFjUlDlwpbMyMhsE5JDZwZr/U6rRClmuDQ2ddGr5mQcF8eecA/tUp3vAoMY9BmitaqTCngeCJhJ8N9jPzuCwIHeVGAPHNQMHuUDfroUQ24+jsy2SGF473fpRsVEPm90O7iEzzr+eiDI81LSAEaUPpGiWzkjN8fWXIVkSnGLY1Xal0Q2fpi9mqooj2FSRoH7W/VtyHQyScXVRe17Q1wNCblO7ZMLoGUoYZvkwrtrPcCPburllpTaGvhZxAJV7FKCeI9p6iPz4u8O1TIjAVHeLrwUgTW5tP17vSNJX5L6w+dLQ897rLDmooFx8Qhe+V099PAkRP2KLub4MhFkSBhL+iOr4BkiaTBi7NICFnwutrwIWHXrOshWS/4bLqHXMFJxb9YNin6dRcj8DAJFvT1VxOSJPoN855NFnsU/MCMP/FsdWPx4g3uo5Z+zay8/PbMenRv+DCSHWndECuXo8SV19yh8OoS8Gbqi7lgIEtA4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(186003)(2616005)(1076003)(38350700002)(86362001)(66946007)(83380400001)(66556008)(66476007)(8676002)(316002)(5660300002)(8936002)(2906002)(44832011)(6512007)(478600001)(6506007)(6666004)(52116002)(41300700001)(38100700002)(4326008)(6486002)(6916009)(36756003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uArCNsWz8gU/UakQsJWVT4AZ80nde2ZrlBMGmgFZdXiynUHMUFxQexmGmzx8?=
 =?us-ascii?Q?/UOuUg6JECZCGcophhqLmFqBlJ6lOeV+wEF3NiJ3BaFkp3Td0u/9AqZJCooJ?=
 =?us-ascii?Q?pO++uxXKjjUdJC7Y6A2CfIWcoEB3H+znxtJ398zT2J0kndHQrn63uuOSrhxI?=
 =?us-ascii?Q?OYD1V1KUUAOEhIMlD2z85xVOjBoE234EILk0k2EJczIHje1ZhTRjFU+PBjX5?=
 =?us-ascii?Q?cXOMakzM9Pbub0qDGCw5gqQIb2RIM9/KLL53PVFLWPFS+IXQKZCOLUwfXKIW?=
 =?us-ascii?Q?1VdtTnxHgeiNdQXJ7IP46eIwER+2pqtaKJA3BUBJV5/8yp4ehvWxrGNwFt/L?=
 =?us-ascii?Q?wOSwo+zwv1nMzL+ByoKATBneJdGiSzRmxxHsGU3gAt3vhUTDp3S2WDNsuwxz?=
 =?us-ascii?Q?OtrcMzVJZo0k4Q4z52GZjsE/tRiG1peA8I98xBIT26VTdY/M7zTYx7fK8gHN?=
 =?us-ascii?Q?eRY3F+GccPyxWk/cohFhLlNBUvgZrEp+2yL6aezeWbIhaXUi/CMPabvaO5m0?=
 =?us-ascii?Q?jTMCso6VnpC+iZT6yYP9Qf046QiFysM7D4Xd7/bG7/d5pDMglSR8zo6843yJ?=
 =?us-ascii?Q?4tvRIqtSTlxmNwT3xSRWthDtMlDaNpQi7b4lWsQol673WsbQbOa5reXys6zW?=
 =?us-ascii?Q?XPmNdd3xnVL2izoRJ0/gGiPNwfNNZFUonqR4jvTSmymZXx/FtnXfZqWYH1hF?=
 =?us-ascii?Q?QcJp8P0TeJDJleNid19U10NWAmJLiFZGyHsXDB3x0Yb82+M7ew1HtL6UFnTg?=
 =?us-ascii?Q?cHbKoX208kDUF/F4pItRTZb8VLVfUNqLqc+0X58pUrZxs8/XHbJG75ZInxP5?=
 =?us-ascii?Q?RhrO8MFz6hK/htdz0N3ov1ZwVEhq1Ec5HBjYM+Hq2PDn74fTRVp4VACvm5Uh?=
 =?us-ascii?Q?SZPO59p63m4aYUurH1FyWEeDlQfWiVORcWeKswegnkhTXCAWGKf+M3Od0E66?=
 =?us-ascii?Q?ENO3I44QBm/AilHyPEUHyGPyzKt0+iOZA9xAtqPXcuwtCWPUlsF0KGbGgHyX?=
 =?us-ascii?Q?deFn4SkmNsaNU/IztBsnD6XIvlToPet0HpV+CFIt4DZSg4xDozyPyK1z/OWI?=
 =?us-ascii?Q?KtwbJh4/i4d/tUVcNK+zAYvM4eEtjtWwZr6T245iADDvv10k4OxTPH9CAHXj?=
 =?us-ascii?Q?AoTRCB/5HH9Bi2uMKaco6jel6FpQol1bxc96y9JoFaiK9mD2DPeFqRagD1t5?=
 =?us-ascii?Q?WcreHmRq8rhvuD7BXG0Vzdn1VcNe9m6JzLxEYJLq/wJ1rASp8FkW3t+2t67r?=
 =?us-ascii?Q?T48nMSMg/2xFjN7S2Csg9JnQF7nEX+R1pXXD9jOQmEeAeYPouWI3ugKGofq9?=
 =?us-ascii?Q?PvuK5+UeRgiKjyrkXhELHWabU/u+8iNkabV980v3Hb/qpOnvOkHx8d+kcm8j?=
 =?us-ascii?Q?cARBnkMWtwHrSIIBRbOyFpofNtkz3k1yRZNHYT7RhnFGsxGf2wezvr69rE4t?=
 =?us-ascii?Q?Smrf9L3+0U51EY3dNkKrJQkjPcFbJkXidIDJ/OKSx/l9hp92CV+cBpFxyEuy?=
 =?us-ascii?Q?4SL0GmiGD7UqPQpxRqDTtNg2PnzGMXqaWssth5p278CKAGT9PM0gjBc4wT4i?=
 =?us-ascii?Q?jicptWtkcw1d1zD9zXToljPdt9VseOzjXB+gu4CjMxzNA0/32zmkBd8HC5B3?=
 =?us-ascii?Q?CNljzslGpDw8o3pbkALODXM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be77bfa0-cf7e-4169-7448-08da86a67d3a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:25.1599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibsXDSG1gnTl4taA9wAwZSiUc+Ev94Hlfcf7i0+m7yL2sHAZHgRlV4tXL8LfXqLGDE7vXW0nWIDDG17++C8rHZloaF5aUlvpdc8gNQ/JjSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3569
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the way we use mutex in parallels_co_check() for simplier
and less error prone code.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eacfdea4b6..8943eccbf5 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -561,30 +561,25 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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


