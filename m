Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F98682A8E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrl-0003LS-Uz; Tue, 31 Jan 2023 05:27:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrj-0003Kx-8c; Tue, 31 Jan 2023 05:27:51 -0500
Received: from mail-vi1eur04on2130.outbound.protection.outlook.com
 ([40.107.8.130] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrh-0006VK-BL; Tue, 31 Jan 2023 05:27:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jE0Usg/QgQPT2vSbhb6j5P5iQ4PJaD40mPspOb4bBLLt1kv+4ZRgLMmX7dHD/E03mipYwyV43JCmdJJJbPhwYfXSSzNa1HiuQU/K+1OmogCsXzFBV0q3Se6ko5RsidGTnMjI/uvvx7KgJlNB/qvGKP44RnbIxH27fYqq7EjCJQbI+ZvKoZyuqO1Z1V8I13c+vne6lHi4mFLKO27djSJ3hUX6Zew1qYFZgWk/h1x9GKbyFrGwpddLU2NDxVyFGF5yuvws2uZvwsoGLqihDPlgyt7CUfYbF5IB5/Sb4+ZfhseP7ssvXJ0miN/rvRCgOqqzVNNDNbM9igmaPUpupdlDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzrCE19U5Bc+4gW+rzytIfAwTYgTCv7OsgBMKOeLLug=;
 b=TPaYEuxHDt3/FFyLZZxIsp8AObF2Lfs3y5ZjuzBmvsF5S5MM051djKtDBNY/IfLbY/7APQ7AcBzsRBN5N4LqkfTIbpusgOJ5Tph7o3MFpyhmr3rA1A02cZ2dd/NLz6WK5IQa9tXLgMGdUZMsN/bDTt5+KwxjjiV4yEu2ubZVzADWXb0qdoRmIpCRoJ7w3897lj9OVLBiQm1UJ+SWe+8sfnVuXWhEugwiNsEgbVZ4hWl4C3kA5WaYEML2ElmaVhOCtNFVzt61jswO6dp23EIBH53iturfQBo4NXSQg3a1MNtcfcZTeEy5Pcsl5yyV8Vb7Vx0bsdmxhQ2xtGXUhISnKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzrCE19U5Bc+4gW+rzytIfAwTYgTCv7OsgBMKOeLLug=;
 b=B/454cowWOGOX9ahWO2f4YBPaLPGdV16Ymol+UgRvDP8zykmF7NSG/yAFNNH1XVlMAHgnxMdj0nmmTGB4mSSwpA9Yv4Mcb60uvZplOpogA4WIJnNBwArZ24xQx56pDrEkICa3sW/kHTT0kMeIjGJgwPYvCL8shzZescGxZdKMCqRhnaPOGOM/UC3gXGYl3lohmz502qrdKPdna7sNKlhPhp5SDVpiUXOeKPUzVL9PqnK501xy1g++lsFl60HseskyWoT9gou/eyQbTmppZEtQ9o18ciQzdivXlm3QlKwp7OVf+lD+abbRiero1RLbLfeSahXO1lB/iWRs0wVaMRJZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB8615.eurprd08.prod.outlook.com (2603:10a6:10:401::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 10:27:44 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:44 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 01/12] parallels: Out of image offset in BAT leads to image
 inflation
Date: Tue, 31 Jan 2023 11:27:25 +0100
Message-Id: <20230131102736.2127945-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: c410134a-c6e8-43c6-e866-08db0375ca42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NOXSnSmSnCQHmz3CFYVfATkjYb33y2L8prhISqsZBmQUP9YzBW4FF66tlKSRjb1EZv3+MdJih7tvZY6A8OVWaOF8SzLIgv5I7DeCaXOtBKVqSVOihhGGS+IEN9RXbMWF303GN6Q8DadSiuQHG4pUTKkjVrJxjxxD+uO7I8mkhtz1U3Ui5qsRSJTMx2QmcwYmB8AZo3h4bihPVzvu8plsQ1hk81nLZhh9t7zO23LGqmBoPAw/Y8LjaPDwuPZocwtKSq7YrN6CujCm9GaCTDZwSNVPX/pclrMbWPWsD7Ujp8vsxLPTJXRhDQ7gdSHLvjpDa3Im9F7eJzD9D6Ulvf7pEuKGeQP78S+v5NLblx2Bu06aagNO9KdietS2aumzz3o+l3efbe56a2DN6lyCvSWAMtTcJRaNTUkBwpaO/nMB6nFmOd1xli6r3fCnFpcLQq9NuqViUzOTRJ0q1CUST6fQyu/sKAaEfPlVcy3k//CYJpZnSvCKmygLAVZDfl249RJKsMTVDa2N05qzXZQLUnZfSgBZK6maAwpwrt8EHxsFs2VSVLN+rJaT1nJCsKuCq/e9e+szC3t1bGjPLr5pkJVPeb1WVTEpvHAPmOre8to3EFpvC1yIsUj5/Wf1QMOnROTHpG8Im03cvLKuQ849gctBe7d2NkBJeSIVlINbSDTbQzgzfv9xyQ0HDFB5ujErzFDdLcekx4FUY1bCr6w7UF+ccg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(451199018)(44832011)(5660300002)(2906002)(8936002)(41300700001)(6916009)(2616005)(66556008)(8676002)(478600001)(52116002)(4326008)(316002)(38350700002)(6512007)(38100700002)(6486002)(66476007)(86362001)(83380400001)(186003)(26005)(36756003)(6506007)(6666004)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqjJSH2R2Aya1fTPhgtkFvSVgXsiT4PiFLoyshe+wBNxeM5fhhWE/TZqVOxp?=
 =?us-ascii?Q?tjLIgVFvTpT7DUkfbGv0OZJ2VPxi7DS2WY7UFB8PTlJA/+lnk5VtK1mV8ZWh?=
 =?us-ascii?Q?mcl+/KLGAmj4LPeiN/7vVC/L+gpAvmK7NBEV0mQ4Pwz1dci9OQOOBvfX3HO0?=
 =?us-ascii?Q?3pYY3og1R9hygBc8GtWbyPHHRKtnDnV2LhSTVTRZUUR+gTsjcrKDTm1zEQRv?=
 =?us-ascii?Q?xqqMLAvL/tJyNnRGZg7VHNaoRSXyegtQ9NYOJhBC3ydqLlV1T3STVh+t0Z55?=
 =?us-ascii?Q?ppR7FvLKeroRvnOBjoWySrrhXj3mMHM/rk28co2sJdMHspKTzaUuDE4v0hnc?=
 =?us-ascii?Q?nDTflgH8A7KhPYCT4NGEjOQ7FJI+xkNwnjyEqpJ4ffpEj/A0G6MX0wKyDd/c?=
 =?us-ascii?Q?jXpqAKlZf5CP+BG+kv8BUbmka+Dgl3UR3qN/M7lPR935dUTjJ/vIIS933wA8?=
 =?us-ascii?Q?elFGycl6UqPAfFHi785ZNm4x7+eYPlVIi68wPW34MfjKyBOro/GqMgnZXkOV?=
 =?us-ascii?Q?RylatCrpy8HbtIgH91olhjSmJ0R5i6g7SEmE96IV5clDnRwU2hdiP2bX8pYJ?=
 =?us-ascii?Q?ddcbpXwmyrbBx/cbGOCIhNTqMFNkR2xwgJiV18W9I0TyGMCK31jbFABORkMf?=
 =?us-ascii?Q?jIQTlVRfLgsoZd79OjtJ2oiCmJF+ld2mF9EJtODeEWj6BgzYr9MjRRPzuzMh?=
 =?us-ascii?Q?g9hfPLXnPVswWKUmRngfdNNNMaq8YxM/rk+EGlg6rI6cj1MxqdGWovfZ5cyl?=
 =?us-ascii?Q?lf15OoMwDiKZg5Zo5/kQb/vTmUz02c07oYQ1QtJXeE8MPySuQbhJ+6N4kZUJ?=
 =?us-ascii?Q?dzxjGfDRLaSKpHom1GojRLvBJc68i0IJLL6vb3Rc6kqYpe1NQGES/gEl3s4N?=
 =?us-ascii?Q?Qy5Bp3zzQqzjKbmm2vhgiwAKWxL9S4TjGmWOumct2FZcE3piw4/0pyeEeKUR?=
 =?us-ascii?Q?cK/1zcbn4rKOpHDXUJCnpS0PthWFVeVZjMfLOUSA0L6bFWSpv66ApHgJKbzf?=
 =?us-ascii?Q?EBk6OZzRgMFeRZGm0qBZE0lOAWolPwctCflmWHqKmpvLDOKUvghDwLPtGMLn?=
 =?us-ascii?Q?/N5IrfjbjEu3FSbYTGKDzu6z3JuoJN7CZrmSD+Ttu1POYddyZbxOOHim8RF6?=
 =?us-ascii?Q?+enNRUuFUpqPtGaE9T2Hitr20SDerulllkq+WvKiFpiq+nPVlhzHZkJ5T8yg?=
 =?us-ascii?Q?bneWNgJRsZD7q5E8QaCURSDzTN2XJtksNQ9Qd7qVN1gZtzxBqltSu8G+E/l+?=
 =?us-ascii?Q?Yh1F1SU18WmvKX2J/EGPjXJkYIpjHJ+TL4vOayKXYbp1WrvUZYz4pwnxg8GH?=
 =?us-ascii?Q?zh6rnHnK0QEUBZoH1K3maNOWElyBUZrxQqmDXxlo6ApFAYd8CEBRWmUFHaky?=
 =?us-ascii?Q?xLxhBnX0wKj4BvP+JMAlRevNpjYqwcssVrBueHhjJ7Vk9AXrRWxfRNtu6UWX?=
 =?us-ascii?Q?iwAdfiGUmdBLjNuVQdkQlDprnZ6IkBubEAGDsvIf55EW2k5rjHpJPsyMC0/m?=
 =?us-ascii?Q?1PMtrqcRfAZw0I6tYskxX3+sl4RaTtzUkCBHMXeRfSFJzY1BmQaEZylF6mrR?=
 =?us-ascii?Q?/s56uaXEN8+V8yET7LRo/GY9sYziYGwpOzd6ifzJUjGT6QwOKEffhqm7+ATf?=
 =?us-ascii?Q?dyLFsiNhVuoBtl/dxoPeVrs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c410134a-c6e8-43c6-e866-08db0375ca42
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:44.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTS4HMk/CAZl5YjRrxeLYB70dPs6bfj9wWBh2DRWs6U1DdFirw3U9L00k6K1FifzP0pHeS98PJmY/gJh33CZRWhOb0iGSYVpUkgnwjGyOkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8615
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will
create the cluster at this offset and/or the image will be truncated to
this offset on close. This is definitely not correct.

Raise an error in parallels_open() if data_end points outside the image
and it is not a check (let the check to repaire the image). Set data_end
to the end of the cluster with the last correct offset.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index bbea2f2221..4af68adc61 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -741,6 +742,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        return -EINVAL;
+    }
+    file_size >>= BDRV_SECTOR_BITS;
+
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
@@ -805,6 +812,16 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
+        if (off >= file_size) {
+            if (flags & BDRV_O_CHECK) {
+                continue;
+            }
+            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
+                       "is larger than file size (%" PRIi64 ")",
+                       off, i, file_size);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
-- 
2.34.1


