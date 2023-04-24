Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C46EC943
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:44:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsjf-00041v-Au; Mon, 24 Apr 2023 05:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjT-0003wY-0B; Mon, 24 Apr 2023 05:43:39 -0400
Received: from mail-db8eur05on20723.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::723]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsjP-0001KL-Sb; Mon, 24 Apr 2023 05:43:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfY5dXNLmQ4lekzQ4HzhAr0TeFLoyTUoREvtJLuVncUoL86tuSPDGE/4nKwkfAOBRV80YlUtAvMEYtzLEKB+V3xNN2HtWWudPFHff35a+x45u8VTuttOvZQKjYtZmIyx+lEW2pwpI2DRQgNgpLApmtAd9+U4AWdYy9cEnC747lxoqaPlHu+ng4JN0W5pXfW93sxfF6b+Q3Qqh5j390GHM3ZzIdkl4ozLQgQZ1pCwYtCyzyzENGuVwshYgo9TdfK4OJA/mny+0fHCwGNnnTlUW+2HRo8s+frWm2eiUMBBinp1AUyRmuwxUbieGsrnDHv3w8pndqMZY1XRgUlWWgHg7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4s/00F4HygINgCN0AuoerDN1fHTAqhnPBSWCTP7Zak=;
 b=biUzeimnlR2lxrzOgErOqAeCdj30NYBv4KEtKB+5u+dkp2EL1GVpJeKSsbDn7elRmcqXFDwApKM5nCv4iK8Z70MzdGNmzlAWt93fD0eTBUuDq66NNvGS7lfqkwIJYnlB2HYVlgiNeHSe54I0f9mBS+llv8dMjcIWSVOI0vcwSvWEs6Nti9rcZoI834BT36nKipxIoeR1zfpYTbWnMOO388Otk0j0DmZSwhWMnhLjk/lGmtpRx58U9hiLaG/lNZm6eShywb9dP2B8QBEGCgmST0nIlgvTfOTcMKOV90r7x2xt2Knn/m4ZKyuq10JuqUHiodYyY/75WIBC7NTrXK1Bxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4s/00F4HygINgCN0AuoerDN1fHTAqhnPBSWCTP7Zak=;
 b=PEomkppK7iL+MhBG1xQNy9Cu2xZ6Bl5wHqDgwBjmDxhmpWyodlGg7pVj8Xl4Ezn////Pcb54MPKq8gWl7iTv3VYA6v2e9tiPMzuJeERl1DOQUXGFA8juYdFgCvF5iQi9O935PvM0zIs9mLP8Mp89+zbhJZD3MjUqkHaG8MDohfP7ZshqYfH1/8BWuYXb/Sh0QrevZRnBGE+uaV8CQB/d6shSAhRCfpuvHM/KvA3Q1IAHLtR1fnJbk2cwEPyCDOvJqVJXPtxVfK9jLrlcvaef7yD1D3nT+zanfxy8tU7kHxBIKhRPXwM/Hh6dzuc/ZGYB9Uvd+QlxtI8TdpyYO0/YJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB6188.eurprd08.prod.outlook.com (2603:10a6:10:1f6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:43:27 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:43:27 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v4 5/5] parallels: Image repairing in parallels_open()
Date: Mon, 24 Apr 2023 11:43:09 +0200
Message-Id: <20230424094309.197969-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0247.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: ad22b5f2-8fd9-4256-8d0b-08db44a85a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0M2y+1FfZcaazKLABPNZdYgkvF/vhY0l0zukdkIQ0zKL6YG/TxpmNEgmlxnUlQaA9SsYcG3hzRjJ/j+fQEgfcKeP0CfM/NKCgKnS4kVHWq4pSi3YjuuoquAvYgUeNREiMaHJaJ1ZYl8USohiSgUBnyxwiMDC12QLdDK4ZCC8rvIcCwb4vHXjiFPFVt7gvIrPf2swuPG+G3eciJdP022INP2vpw8NE142dr4VghrkCfVk3D5jMOtXF+cIqHJSeffPJRmphYAZMf4objBgFT/2sfP0T/5yDCIG0aZKWiKlsWjVVAIPStcSNHHE+F1N1gjZzzrtILvOKm/1Tsxl58L0cIdP9q/Cp0eig0KHYPp+LF+dhmvERBaoV8DfXcaBTrGBUvzEJ+WwGzLB1SmihWHASQ5DrGdPwCMhghichIizl7dNwuv8b+p/gjuo62ObyI587w2LwE1A0Cs0U0d5DmnBT7xxxLyfbbUt8O2JBReJKv6WA9iDi2DMO5OwionBqHyCcdIV05g4AwqUnpPneI5h2xw+gLzwYqvzjn3zvCtWhqwJ6dJWR02xnNyp4jP7PGB8OEMqjy2hpiUr/IVkuOE7X/VKXBxl5wQoS+t3hLwU1JpsN9SVvN4fpLNZRg9hKeMJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(44832011)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(1076003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(6666004)(83380400001)(2616005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Au57A5JCV+pWfbCtc3b34Bb+40VzXhhWmaaO1qLuvD+BGgpKfSNQPN2Iv44?=
 =?us-ascii?Q?bnfElFUgWtIpgdllgZy8Qq5qN8qb9/n48LFYxLwuEjiGaPq9m9t5KlWfTGlZ?=
 =?us-ascii?Q?D/rbsfxvVSTxq4qNmvshGYycPnrI+Io17GJIhWCObWqJyBBT+5L42AESF+Po?=
 =?us-ascii?Q?3KhwtLNV79tUKdzudiv8GyUgBW49SzyEwJs/n72nF9xiaUF2q0C8Ni5XDiaQ?=
 =?us-ascii?Q?y5VbZxb9o5zC5596vGD7QuXQuv6sZY5O5WaGx73XrF2MTdj9hNqkSuaqOYxX?=
 =?us-ascii?Q?IVd1Gg9vZeBP4RefPTJLC06Q9F5idGdiwE4Lu7TbZ8yEToVgAbzh8RKsiB3G?=
 =?us-ascii?Q?xA7TYSx7kL63bUvTB4X1hYYKcugVzYvtq9uF74SZ9RYxqPuJRlU4CpcdFPUG?=
 =?us-ascii?Q?Q6wzeCwsEfUvq7pMWG5qJ+M8mw632sd6bAVr/0AZ+UYdY5WCpafr4rbPNQqd?=
 =?us-ascii?Q?v2o6EjH7vx57jhjNOkuhOiZWfxlTXO4kdEiPR5KRXdE1PddL5Qdjz174F8Om?=
 =?us-ascii?Q?aUJBJJ0ULaoSOFJ94etaStpjtK2Jsltc4OyRREyLFZALcgoFCk36W7J1RwkN?=
 =?us-ascii?Q?3GgeEA0seGpKNkpdJvaMXidnJxAENVr/+KEyxKSSiEuqGFy0WEVR2HhZo0W5?=
 =?us-ascii?Q?HQaPMT0YsOYTGD5gTTOXFpMr55f+55y4syqFCYJZ+RGTFKy5owU58tg3jS6b?=
 =?us-ascii?Q?GM71dJsxIz0zdrRXLMISsYNFUnlHYYhdenB/HDqDMcTN5RgjvtRD6/IEwmI6?=
 =?us-ascii?Q?2oESibgU0RkrWp7I4fu1BQwQngxs92ONKlBt7n2VkxlmUbWAciPnu505yYm3?=
 =?us-ascii?Q?+LJxVkiEEsR3oTUWORz0svnGPpZZd6Gga+U9u+jbtTLF4DzhNKcI09/8YMLf?=
 =?us-ascii?Q?dSVdETeVL2qJ85CLgkovJoDzpcCrol+p1LjVJnfJQG4ZuRiarHTNwJU7swfv?=
 =?us-ascii?Q?TPsa4Ua8OjjWwmoTBxXfbeH/wHr4E/N3yiVA7tJ8v8F5PkNn2Y8/n8tgMPWX?=
 =?us-ascii?Q?UeC084iBjEkMwMMhrYNJ+WFeNHYuyk/KyA94lZisBbjpU0jAz19I5ep24bj5?=
 =?us-ascii?Q?rH0VmLf9CD3cJNvJ/nfsMWGZxaOuo0G6/0on4l0dURVHnC5M9+ya/ETO8yoP?=
 =?us-ascii?Q?9yI77O32Ii4T7T8FNF3pI0pT0GcxoVV493ABCO/XpdMu1rbEnqqfRN0K9RKf?=
 =?us-ascii?Q?uV+XljO1RespQ4XbV62EKlHcrr4M3xohWUfvQUsoh2fZd7PwGxKph1mVfigf?=
 =?us-ascii?Q?xcfzGHd7xvWnHfiICWAmlILQ9jRoy6zNmc023pGcM+prmzx0Rbkp8vl8jG6P?=
 =?us-ascii?Q?1ZXHSClKX7+BUCdF9iUw6gKVPiYEEacnmCSa5SSqIMqnPNNIGC698q6qosAM?=
 =?us-ascii?Q?jwiUC5oZZ1HG3EJU/hYyJBBD72C5ZQ9RvpORIDixiOV2N27Il14VQbe86LbC?=
 =?us-ascii?Q?/tfYAoamE6RrcLdfAmpFhvL/3j5mleEbW4cOPveWQLWelPlvRHzhZbz8UboR?=
 =?us-ascii?Q?Kef5wLFTU08dy0hGTqdEqTyGSwTr7p+Z+lqprc9RAKMdogH2PdSVtFJuLY0J?=
 =?us-ascii?Q?gIOahywEmrp4EXp6BktoGNfqoG7Zs4Ya5q9o+3gq+el/woakP1tEURdnx5lX?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad22b5f2-8fd9-4256-8d0b-08db44a85a8c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:43:27.0084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LV6xJb1tN5VoRgtGYa980of2HJaxs+7sMvPmCA6ckblbPrwO4gtp0bU3RTGRi8ElbgX9UolzDq/vmjSEPiBnjKoS+VTpFUGdzLZ/VhFGvkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6188
Received-SPF: pass client-ip=2a01:111:f400:7e1a::723;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Repair an image at opening if the image is unclean or out-of-image
corruption was detected.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 65 +++++++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 5dc56ca36b..705869d89c 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -958,7 +958,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
-    int64_t file_nb_sectors;
+    int64_t file_nb_sectors, sector;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -1035,35 +1035,6 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->bat_bitmap = (uint32_t *)(s->header + 1);
 
-    for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i);
-        if (off >= file_nb_sectors) {
-            if (flags & BDRV_O_CHECK) {
-                continue;
-            }
-            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
-                       "is larger than file size (%" PRIi64 ")",
-                       off << BDRV_SECTOR_BITS, i,
-                       file_nb_sectors << BDRV_SECTOR_BITS);
-            ret = -EINVAL;
-            goto fail;
-        }
-        if (off >= s->data_end) {
-            s->data_end = off + s->tracks;
-        }
-    }
-
-    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
-        /* Image was not closed correctly. The check is mandatory */
-        s->header_unclean = true;
-        if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_CHECK)) {
-            error_setg(errp, "parallels: Image was not closed correctly; "
-                       "cannot be opened read/write");
-            ret = -EACCES;
-            goto fail;
-        }
-    }
-
     opts = qemu_opts_create(&parallels_runtime_opts, NULL, 0, errp);
     if (!opts) {
         goto fail_options;
@@ -1126,6 +1097,40 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
     qemu_co_mutex_init(&s->lock);
+
+    if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
+        s->header_unclean = true;
+    }
+
+    for (i = 0; i < s->bat_size; i++) {
+        sector = bat2sect(s, i);
+        if (sector + s->tracks > s->data_end) {
+            s->data_end = sector + s->tracks;
+        }
+    }
+
+    /*
+     * We don't repair the image here if it's opened for checks. Also we don't
+     * want to change inactive images and can't change readonly images.
+     */
+    if ((flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) || !(flags & BDRV_O_RDWR)) {
+        return 0;
+    }
+
+    /*
+     * Repair the image if it's dirty or
+     * out-of-image corruption was detected.
+     */
+    if (s->data_end > file_nb_sectors || s->header_unclean) {
+        BdrvCheckResult res;
+        ret = bdrv_check(bs, &res, BDRV_FIX_ERRORS | BDRV_FIX_LEAKS);
+        if (ret < 0) {
+            error_free(s->migration_blocker);
+            error_setg_errno(errp, -ret, "Could not repair corrupted image");
+            goto fail;
+        }
+    }
+
     return 0;
 
 fail_format:
-- 
2.34.1


