Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30FD59737D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:04:09 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLWZ-0002M5-VW
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN6-0006Xc-3w; Wed, 17 Aug 2022 11:54:20 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:6277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLN4-0001Kk-DA; Wed, 17 Aug 2022 11:54:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbwC9VTfA7jbiqjY86E0qS2H0KR3T5Zvhz45gWxUit4o3p9u5vo0YeVe8hdrwem/7GxTUUkWKZoGu7IHZ91aVj6peWKQdw9gHB8474f4plKa3elKf8DEUWXRNbeD/JrLHAK7jN/jCmHTEOaiz0ut61VDocpb4n1W39hYwS6WZcsS+NxnhJpRZLcgR4Eae3tTFBauKCT1iCXkPO9EvJt7CmmolmlIi0SyOwvnJsnsBgMx8SwjTmnIWgHDBLqLVVaax0zg1TLannxQWIgD7F5v91gxZT+CJZJAaotU2dBU+CkEVGlBF9jkrubMXmrAjpnRyeMwaloGtcaNFm81zduTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO0Xm0JTQOmQHxQjGfmOiiL858aJoGmGW9JmNGT+GFQ=;
 b=BBqNiqLAGHRGuStCj8GQ00fZnknSKxpD/eWbJsDNmnDxf8VJnaRfDjfZ1yUx3UdCVaEK2Qnu3bLRTsSkOZ3qcWlXHzQNjJF4FBXyGII764Um+4Oiex1pzjHGXWo120druEWZJorRN2E94B0mA9TieyTq0G39Z49+bMdHZK4KkrRydIkbwYBsZBG4JrtjxQiXgmJJnOhFRe0qKkI977HdOSYpwPQLEMcvDGaSvTsi5dNEAxkI6nBomz/WcfPhjXg49vIujODRw8okO9jZiIlZ664bEJK+EG1If54in1zNeQaoAFz/yhkqmsR3vx+nQUimqegq++V07+a7pQAPjco/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO0Xm0JTQOmQHxQjGfmOiiL858aJoGmGW9JmNGT+GFQ=;
 b=wV/g0HTFLh6P3HFHZ5nNUE83Vqx2ozQG9a/zMuj2pw+lS5GGUZ0QyJNw9mPdagj6pq4bRt+sEpHaXf43BOxyxTpHfO1Cc0YtQYFcjYsB451MT8yOQUu6NIbUi4aI9SWJ1xYCjxN3sPR3Pmfmz5Uv1IgHLGLaw6ix22Mg3QNo9AEuwjq/PYAQZSPyWnvjnqkyUAhOClwi4shXYH/qhStnSC86Hs+hvc+8wQ0Scmxajh4yZsRj45QeXmDoiyvH1v6EHeMZNSZlnqrvnGxxSHzLGcI8gifXYa0ngjm/4h7deMnDI4aXkoo+KSFxIg1T7F8ryAG38XRu+9EXCAfQCal+2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:11 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:11 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 02/10] parallels: Incorrect data end calculation in
 parallels_open
Date: Wed, 17 Aug 2022 17:53:53 +0200
Message-Id: <20220817155401.2045492-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a57970a9-57f2-4f11-aabd-08da8068b9dc
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8n2/PuqjiI9F4E4YUJpgDWN+5NsnaG61Ub0N/BVoSOhc5U8Aj42+ZQCjx+AKMdhWFGUscJAtUt1a0eMQXHdGKcVKlp4O8h+3NnnbpE/MBNB2M/EpVIf+NVbi7zq9axbmJ80wgMYlZ72acEPiQz4a4Rjcdl/mxqdHR6qpEQZcGWxNGMML/+hDW2oigch7kQ3+X1rODadLKDq+2ZgiGvTbOHM7urVa+RHoN8Tdzc1y0Sr9KPIP563LhRJJGgYzRb/F5Q12w6aglVuLrXR3HRCiNm1O078ViyvgjfpD+guaCe3f6ik9+Is2C/tkFvx7qgFeqdFU5FIagvBssFhFW5H3YIwm1f/3gE7h3uOyO6tXwdu9upohta1LJY/iQS+9JfleIMWsv+0aO8jVzz4KdgOROKE2SfmTWzP/mvZBGcp8nggwh6Pmn1KkfBXo1wJR1j7Ja2zRjPt7ftUU5oZKxbL892W8XaFCeDfOwMRvkzvuwHJCgZtqoeRFkqbsi8m/azvZiXPOevhKByFMEFofKoCQS0Y0pXDGGvpiJo86qSdQ4ws2DCxRyF8WinFnLbRqbWJVrYYXu0aVEraJNuMLiE9CEmQJ7HOKatl5SywVnznbqM6E7vyLmjygCrnTXLbUQ+F1+uUMjecEOySBa1kfQPDxmwjV4eB7SAN56GZxKxDrV/CpFaEVuFLYlL4HugwH4sIMjsaaFmvRnUup0BlQUrUNyg4IauCcypy2PzvmjXbDe685QAoueX8nXKyU742jy42qK3nchUyGxKbKifSDfQUW01xLN86RSrA+eiDMKW3IRX3lNZyzWE0AZ1kuuiap8yM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRFXf/pID4JlhgzUjruyZKWjx4o9z7YPf+3rmLY8uZWdQwl1g6TynPYVeH7c?=
 =?us-ascii?Q?l6xo4YjZBQMYn2sYEA/uQfG6nHc2tAJAwsGcamIAnKQUH64GMj+5fVq6npwv?=
 =?us-ascii?Q?y/ijIzOBhKUnLKcTenhpFbgJ6E4mNbSTHEYXI/yiagj1lV4EjOAXoLwbnJ3H?=
 =?us-ascii?Q?t2cY69azubK5atBfHvN3ptu9AT8IvJ8C4GwCn9RlCEY55p5mrRqlQdzZ4icA?=
 =?us-ascii?Q?Y7gw9b9PTNprdreAzfX0RAReKxlRSp2k3BfJigsfR6n337n3rWHplcmxTrN7?=
 =?us-ascii?Q?HNmGdUhE2WhrpSc7igjGmuXiz+DJuJV26yoggwwO8TaMtQ3N+sPTTsYpQcCQ?=
 =?us-ascii?Q?uUOjVpJGhXWRcmkaS7Eah3hi3wBbMuEw7suvLwZ3gpZUypDEBVskvJVkevPk?=
 =?us-ascii?Q?N7GzkxRPjJ6lqi8vZPOlOq7mo7QsCIOVkj5gssegFKm8XdU7qv3RNEhs2ZQS?=
 =?us-ascii?Q?aW/IAL8fkcWzzCrKmSDmL+Dei8OVw68gcEulJHwplhOz0uqcja3PFv1/Gf0N?=
 =?us-ascii?Q?agcztgnZ9HywoHNc6lRk1/Qhywxij0e6BA50BGolxMsPrO/RBncnyaCiK1Zv?=
 =?us-ascii?Q?Lb87eqabfFf7ah7MYMn7w8IXjQSjusMy5sYvnoEI1BkCPiUbQ+nEQDhy9Tyk?=
 =?us-ascii?Q?hg8yfBrA7N5R5xYD4xZjSlFV5ssqPpCaoVG0QoLtWZtCUkM8Lacwr1FQog5b?=
 =?us-ascii?Q?ktMyRjh4OkPg1H4bIeTE2lmEDODN+QBPiciQBDlEK8rK+UiuFdebayL/oO0M?=
 =?us-ascii?Q?WycOhpqv5HRqp2MHiqyN11DtafD+wVstXqxArYUztMhOsL0VqokGL9dtA2MR?=
 =?us-ascii?Q?oXTOmwp44fS7KhzZFf6e26+IVyD910UoOT/b42QAeYRpMrSQeTFKAAgZJQz7?=
 =?us-ascii?Q?5TzP5q79qxLsrm3duQiaNpUPd4DowpwyNUkmlPJcGL1ifP/z+6jnc95KyWZN?=
 =?us-ascii?Q?0tdGBNTDNJnrdfIxpXhnQUQYR5gvUNR12uHMpN63uCo+yEHWeKELt7L3tFsn?=
 =?us-ascii?Q?Muz+4IGLinmmWwpUfip6Gqe4sitPN6zUDCOa9nglVfJceEG/oWZZ7OmSqkCl?=
 =?us-ascii?Q?OBQmTRPlYQ4wMfnHLExusDRVHF3HeJSZ+U9vjyd6AJrshd0yKDg0P3Dx7TzG?=
 =?us-ascii?Q?pCEnMkv92EFXZCc8T4Dd50cZ6ypRHSnqeVwiDGpxGSvQJLCFNkwzzpQbMEsD?=
 =?us-ascii?Q?c9CUHE7izr4L6COPTOlbsd9QTEJpfK/FM9OdqizU6vwQZ0zeJF/0qDUYVtpk?=
 =?us-ascii?Q?lxpM7SuuEAuIJpwRgReIQKANv3yiUyNRa/T/U6KcnABycLuKRsMBK7epSdij?=
 =?us-ascii?Q?iOOBVtKfH2Z8HeDBPokkVEwi4um/6pw3UMlvF1cHKkhrZkzp+CLRr760gOvy?=
 =?us-ascii?Q?vKfUOS8j7zlxZr6HRJuyCtkgbq9nw65wJbezsAdk+urblOEXthwmZl0b/Pcg?=
 =?us-ascii?Q?CReIKYz54Di4kKgtYm0axnjYTuPUY0/tghZkMUz0z8XiIv74uYCArKg2orVE?=
 =?us-ascii?Q?FF1AA8BTKwgNqbva4LKHKskR3m2qPUzC02MrwrZM/PctmHL3Mt0lnWxLi1e8?=
 =?us-ascii?Q?zfaAwBifQ05/yt/FkF3ToPcp6vXmSZ9os8xsK920j7xUjRU9M/6Kh8KDoZ2e?=
 =?us-ascii?Q?ewBDvar8fMrQmai/4nQ8DT8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a57970a9-57f2-4f11-aabd-08da8068b9dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:11.0496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPrFG9YJ39WciUF9GqAUsFxWZqSWZvmJ3x9KQ6c3wdf5KOFKIBiODJGvsXM8UidXE4FBswCq2DkR+VFfNyhfN/AQDEWe0xQZdQZk+2TMGqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

The BDRVParallelsState structure contains data_end field that
is measured in sectors.
In parallels_open() initially this field is set by data_off field from
parallels image header.

According to the parallels format documentation,
data_off field contains an offset, in sectors, from the start of the file
to the start of the data area.
For "WithoutFreeSpace" images: if data_off is zero,
the offset is calculated as the end of the BAT table
plus some padding to ensure sector size alignment.

The parallels_open() function has code for handling zero value in data_off,
but in the result data_end contains the offset in bytes.

Replace the alignment to sector size by division by sector size.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/parallels.c b/block/parallels.c
index c42c955075..ce04a4da71 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -850,7 +850,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->data_end = le32_to_cpu(ph.data_off);
     if (s->data_end == 0) {
-        s->data_end = ROUND_UP(bat_entry_off(s->bat_size), BDRV_SECTOR_SIZE);
+        s->data_end = DIV_ROUND_UP(bat_entry_off(s->bat_size),
+                                   BDRV_SECTOR_SIZE);
     }
     if (s->data_end < s->header_size) {
         /* there is not enough unused space to fit to block align between BAT
-- 
2.34.1


