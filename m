Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E98C6EC90E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYW-0007gJ-NP; Mon, 24 Apr 2023 05:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYT-0007dk-Db; Mon, 24 Apr 2023 05:32:17 -0400
Received: from mail-am0eur02on20719.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::719]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYR-0007Ri-IA; Mon, 24 Apr 2023 05:32:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4ThMx9wnK6mVFv7RchkkElAWuRWocsfrDl5E4qQS4NaEnqjvcCuxV5u7Zecc62AwPvuzxU1n7jypKKfovJKZls53aujEhBhPjXC2tWV/LZHUkU2stI8k6sXXuYvdiy7Qd50qZjbIHlXzxAMTHuCEuc8ZGiHkma1x6vZwXtyTxA6K9EXkPUyCf5U7crBitsJ54nvpCIJQOBnWG6KT6x1+5vA69+pAo0eeKrDNH5VQFrzhZ7Ku0CqV0vUTrngbozaxNQYtQawLnhfCy1YyX4gjmX3Lslgo4KhwMoAy7clv4JSe8fErLKAw7iiqEWmOBtEILXAJZJz6LMJYDHO5dk06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zT8W6VkfskeNZk+bb6qA74Z5tZiFUW3i0tPgZQDqOfY=;
 b=Vpp8avFnwFb7TRa94E6JuMEPjAlSD5MknnAWC0gU0kbZPKQXmrwdc54c9LwBwNd8PEVhViUKw+2ZlWTd/rzyEXhVCUC9RLOJqkY9k7Gs1zyAzMfvFhIhjpn6JLtbHnSuhYpGs/ovhmAMWsc5tjyATi+jH6brtCwP+yl59FGfRkEJYk/28dpHqfpQRBM1i8VP5poYePV1I7Hj182UDsH++9/d6X70t1hO1p/j7OpdcliVk7B9x8vc2BavndEC0tNkaHkfeppjPXMUxrHiNp63fn3d5nj3mA9JAOiKEoIry83eswXSVhrDxrY5x5sVkNkSgM1hrrk+yeZb6Ti77TJhYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zT8W6VkfskeNZk+bb6qA74Z5tZiFUW3i0tPgZQDqOfY=;
 b=rmlzaaA74aWce+h6FNrW/l3c6TP400D2954Gc1myPyw7/AGaY+qImsmZvIiaGwPU+bqqpzBeCbzF++ihJilVh0NOY3/DnLNbfg0nIG5bwh/sKsDU1sSAqMNDeD2JWyuLZKSEeqFtjKEa0MP/4003e21sk88vZRQfQNbCKrrWVazua8x4PjUCEMsR6NHuNj05y6ogaCwL2D8ixqcdQzo57Ti1bmjvMcTikWeQRlMXf/H52cVvnAS7bWr5j6NiWr/MAvOQfdCtY+MtWxQ4U0ZioqQjkndmqQZzzeGrtuis7zE+plqHr7+ppCmrfmwWmis26lxNALypyZCNtXIGg1AyAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:31:59 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:31:59 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 03/12] parallels: Fix image_end_offset and data_end after
 out-of-image check
Date: Mon, 24 Apr 2023 11:31:38 +0200
Message-Id: <20230424093147.197643-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|PA4PR08MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fb9c11-ff3d-42e2-9f42-08db44a6c0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UEsuxPUWngzWD6+hxSIzH8IQeB2NP6tCjH7stilFHEuLvHDGl0iGWf9dy0itCzSuChaxb5OwO7CGda3A50nXIqTADNMvk0DxJgf2ZA8tnIbBU3S0t0xS/mmnH+yFSMv+AsHc/XFDmZ/zIZXlF1cA3qaiIHndLI8H9xVsuJVI0+2l6vQD/AtjDuEw6ei6j5slvSGZv7mVmyiqLdGSVfOUkc/lfsumwEOed5pTqsvJYgvVyMdn3d5hpBsolhicbDTS9iVH1cSc+A6Yyzp7pG97r3YlJUKGByDJamQHFfo98wFZJhgtuSDKoyEHf+oNUsAfpovCpQqNLCvym235f0bbmwGES7IgJ7TPhXZlt30l/at0DmvjrNVKEhoR5Y4qXHaluS2pcuXF8t4xZW39V5DPlPMHR4YpzVv42/VyL1EizY4tuEP3lwk45tAIWDBl6SFn/0N/2QIhLoA9tXm0hXoQN2oTLOJxZDrg4M6apvzBpOnohO8heJ3zaCXUXNW5BVGl60LLOt7bpPobnpiiOqhj/NNRHTeinwVFiO492aViJa8RXZ41xhtlyUARcQeZWQYc+AqvB3o4yvMfUQdSDqoxCpVwVM9as6MooNxC8aQl0Tk13i5JPqgz7gmxEYWoSIhY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(451199021)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(38350700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(44832011)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EtHYYFXP98m94sOu0HxHdoNNKBqRlxwUHLnDFP7R+UPtKhYVl4l+52Cfj6s2?=
 =?us-ascii?Q?PXJH5ccQUQYPqm2sguR2FCQgoUogep/ml5sB81LQVmURgoAjUXevNqdAxlkT?=
 =?us-ascii?Q?5+Y0MT+0cym0hW3unxgd9jsnFyfzApwiVkhhRv1ugKY9pP5NV88LHa0hpWvN?=
 =?us-ascii?Q?BHuO9hLYg9iQmDrGClWYizRnYwTwWAvmoIC6KFk/VzJJHmQI+KK0vPZYagat?=
 =?us-ascii?Q?zDC5lBGSo58gIWY3HDZAVCJ/z/sv2ODemf8sseAz0om9bRhYyKM0g9FVyyPF?=
 =?us-ascii?Q?psR8l37eo4k7f7Pu4RIyAxM70HmzHzFwm0DwrW+Qd7gJ8QKo6oRCeLOiv5Hc?=
 =?us-ascii?Q?aHquE7Kr2nZfj75APZptJMWHWauu0Z010AOWW5RXK0+vfhIRYmutQbxEJuqK?=
 =?us-ascii?Q?Wpjk/iSjMg+aih9YD5a2LQeEwj+lDNhD0lGMrlTQ28vM/e3l2AiJFujgGwah?=
 =?us-ascii?Q?Qk1NA9UJCyl7G+W3tvMjOjL9AwugbwIvL+rFvii4mn1o5DQlrkzgR7EfyJoz?=
 =?us-ascii?Q?yqy6SG/SYqwSpTaedxUOBbUzI9EB6+GERh+7VpH9DeIr2L+MB58bTBpT0mXd?=
 =?us-ascii?Q?3E5zaHtjhMLL6y6dYdFHsPKXslZnPtWc0Y0QbyTS/zRnn5B36zZuY++BvgNN?=
 =?us-ascii?Q?EjGAKJeWbRRMnIfHQj8i8Vwa6cTGJ8+yHWHZynWbnYU3NxW0NJ0TMTrinJy+?=
 =?us-ascii?Q?RVciPByRn/B/yR1K5POt59DZdwy1tQIr6H/8vtkR0/dB7sxskAVoNVgpuCrb?=
 =?us-ascii?Q?5FyjA1yLT/RaQ0p+OA8TLxaYg5AEj/z9XfrVBkfDO+VbSevdrftK338/WKD/?=
 =?us-ascii?Q?qnJBKX9zf1UlvHFc0NGNnYSIn92rAP6R5tUnwOFWW3UYVwBnwjLapG9DH3yo?=
 =?us-ascii?Q?/f76ZWOy0MXhAgbWGM0R0RUepAIjkUBSfJrZK2WdiuatHPonoYac7oBNS4Mf?=
 =?us-ascii?Q?DcmRpnxK9YHv3duxx8lkNOWNdXAtOmzmgSDjLjT7uUn07ry6chtBQ1Xt18F1?=
 =?us-ascii?Q?FyEZuKssrNkONoYnUIhnSV/GGW1DwfPsqtjBxp6F2ImrLEWx9C2CyQxAeFZq?=
 =?us-ascii?Q?a+lOiS4zxk8Kp7WAC9UmbwYA7T3l/Ve51uf8pOAKFI32RwZk5IjwuAwmblz3?=
 =?us-ascii?Q?fVEug/yBSF4ibG46va5yeeVNyTVjNOf/jvwCROmwUEhYR0yV4aYQZFXGf7we?=
 =?us-ascii?Q?/M8ZE/3b4x8Vz9VF1YPy3zriL28qwJwJ0haio7SCEBTNrj3iMKXvIJJZbTGQ?=
 =?us-ascii?Q?Hy5DGCTO7JJYVKtyKQ/dYxMGJQccp+6j/6ZuiQ7N/HuYvT0IH+hi+3TyDLn+?=
 =?us-ascii?Q?IadsviyCJMsgKSaidM24gYV7+a8kGRMF3L6AgVZ+floFVlQ6dklN8dSoa98t?=
 =?us-ascii?Q?s1GzItCA6dizn6lvcdFG8886dCl8MHl3m5sNkztdUMq44sjB8dOC4PVrqYQE?=
 =?us-ascii?Q?2ZtBAVE/jcaVCym/+/fL2txG5M5rrxx8qocwQ4WKtlYQNu7Bf12XaQTLhZm0?=
 =?us-ascii?Q?xEUQdtN2EYzLIJqxVKwcn89zCMt+l3VKl3UxMHzmJA2RYc11YqLLWXrhCVDF?=
 =?us-ascii?Q?zsts/xSrrqgqowalNZoQLD83v39dS60Wxq5mhCa1GZC34ldtwUm4YRWdLHbz?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fb9c11-ff3d-42e2-9f42-08db44a6c0b5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:31:59.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJNXZGXehF8rvMv++KswJos8Z65xlzcskn8Vtz1mPnrhZDQfz48kzZn7gjaRKCl+e8coVXWlZx4w7aCzt2n/2cIHPzYu41k8IKBS4YLR7CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
Received-SPF: pass client-ip=2a01:111:f400:fe13::719;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
index 4d6284a314..dec4fe1f06 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -490,7 +490,13 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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


