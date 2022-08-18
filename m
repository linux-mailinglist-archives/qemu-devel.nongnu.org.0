Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCFA598769
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:26:09 +0200 (CEST)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhPM-00033N-Ol
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEv-0005pU-Fu; Thu, 18 Aug 2022 11:15:23 -0400
Received: from mail-vi1eur05on2109.outbound.protection.outlook.com
 ([40.107.21.109]:49772 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOhEt-00071E-Dw; Thu, 18 Aug 2022 11:15:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsdgIGUQ7YDHGL1kO8LpIrbH87k7jBSA45Ofjqrx+OD80MsMD3q0BxGmeRbCC4/+2JzqOwgjaMmf8t2lYhjNsE/O6/R+7TrK//vg34UZIu+3DzjCxeYkRGpG1Ki5/LhAOXLON5/F70NZwBrlR3GlDRPVbcpiBFx79XJes4Nn1NfCD2q+y3PvEsgWe/K1WzA4mH3sPlxCxKmJbiy3Nv9ncjCM0EPb9dF19RmLqTgNQLukvoK88r7kGItGN2WG3PtMPWsNM30bn7kPY2dBxU8VrsmWysEeR/+bW+wgC6kBjtFnFbK51vZxRd6K96PiKioDLR8rKnpOSs1RiV027rChfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvN0sK9mTsGm8puGXFPxxCO1Alc4YZm/Ra6InPslqAM=;
 b=hiYH/Ksl/4d1oJt92Wzt+DoX7Q1hAHV0Tp2qn+iihkevuH0M2WoTkAvqcCKk7YeyO39CS9mzhCJQdpTvBVxDOGw+x04nAv9CT49Vh/ZHkka8wG+fa1L626zOr8TAvwDOWcH74CBTE/GRCVrnWZUkdelsJPh6j4bBlUvhi7N9ZRpbJ/yIYusFtil4vwzTH7u2knFk7FrGoiG8acM3tsRvRzsIuSywGuhA5eAksv7e2u0u0Wf6Bra7EfW8kUMk/i8UD1fj/sOPwdHhkAKWrkrgbteVovang+S37sFpiM/rmMlaZ+Jl04oxZGy6xp4ma5Sz6DpX/wxJ4ZvVU29IPTtdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvN0sK9mTsGm8puGXFPxxCO1Alc4YZm/Ra6InPslqAM=;
 b=QbssKW/eAAvSm4sYmR2EX3ELkDeQwQE/EAJhII4Ta1Bw4feLveB/J3HDc498cruNRlWWGT8jNs+4xJkFhHEQn6dvYnp8nuRqJBAlGLINfn99ZkEKEH1IUDDoZsD9x3EhuOGzy2wXkPBworzm9SnZOyBSg/7Ipx1CCbptNq01jKTGPKRtJH+BvgXxU9UAxejsg6c052+3mWfH1qtTOA49/xlN6k3x3K9xZ9d16nf8AS1rZowG5Kb+XO07ji4WgAFSKvw32GBwx57L1ItUTNcqqCnuT7RTKiDejFnf2y6blnUay1OEHIglNaptkr36yfqx6kyspvw9hmdz/F4XSAygyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3715.eurprd08.prod.outlook.com (2603:10a6:208:10b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 15:15:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%7]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 15:15:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 5/9] parallels: Move check of unclean image to a separate
 function
Date: Thu, 18 Aug 2022 17:14:52 +0200
Message-Id: <20220818151456.2118470-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
References: <20220818151456.2118470-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca71259a-925e-4873-97c0-08da812c709a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36v1lhyHToMwqp+00NbyFVvZUe+qeISQyMdyoLIxlbas2hzsFayCpTsKN+sw86im0LqiEjMGxDwWbuD0FWjaFBYIUqE02YQl0HN2h9AzBoTQWMMjrTX7Vc+PVShxyXyV3GcFlEJ261sBtKGtGE4NDFEuouPwVz5cE3OnJDRAmW5RG0ZI97fcohm2U/UiLcMCUl1HPDw23yzfVs5W+OaBcbGossCjxe62PRgGmm2pcknTeZ15QPuxz699cnOzDoTwaa79zV4Ca+pQh2Mrndw6mGtt3lsbp8wnmYOVlRjwYMvHVQ6pSXjLaADgobuRybMXM/ggTylf7zsroId2EthK0yN0p7YzXT/w8AL9c/9Xfjil/dq1/2QHyiWdEblGiUPXSA2rIW71DEQc9BzR1tm9VVUAHqS0Xik4f2rxZKUCVWgNgGYHnD7R6dOsswpZX0QJ1lKjUpiwWATQtoAZJkpP5DTQmAhbSFNhNCVc5nfEf1X7WMXD5EcPC9m83x6kY/Vto2HrEP/KsZ8H8+tcn1s88BM1bdG4rf62ZWYtCrrQOpdqOwwqlTJ1mfRmotlM3DjUjcUWwgNfbLfx+dOK5kpPU5nmG7rfbLTE9WxX1YeUvqP+uqEXOxUs+wqYI2kVzZ6XiDD+nrYiLJHvNA1nYC8mce5pyxwQJAhAZhWoV91r5wSPre+FCGqXTOXPEnpqoG32Zb8PBlPEcAlNEhCmMRJeIOt+SBVrkxIKrHcon3DzzjTsExKpUaGMZKir2jhQKGjgqERJhyi9b9stQBEaPZdZoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(83380400001)(52116002)(6506007)(6512007)(26005)(2616005)(186003)(1076003)(38350700002)(38100700002)(66556008)(4326008)(8936002)(5660300002)(44832011)(8676002)(66476007)(66946007)(2906002)(6666004)(478600001)(6486002)(41300700001)(316002)(86362001)(6916009)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VzjhJ0D2gG75+yiqJ3m8q4mJGsGzUKgtlBHO2EC6GX43g36yGGQQ47goQmyG?=
 =?us-ascii?Q?cK6NyQVZxulo64BaSmAMo3zmRMZoylpnsnnM4BlkVg+y/PTN95+cO/fUPVmN?=
 =?us-ascii?Q?NC8/ObB0UKWFu7qzExoWJL5U0Y+Pz4X8BAo9DEFoFE1tOUw7vnWJc+1Ylvfi?=
 =?us-ascii?Q?AYbvKALcplOBG7tCJ2XXbA0osNwOdZ7ZX9r4yEwF/YSlQM68IIJCRVCJ6MW3?=
 =?us-ascii?Q?bO1fnqWHqeKkYQIjqg+rq5GZkuagtJ9k2szRDWRTHEFMOPkqDxyShmIB5eA5?=
 =?us-ascii?Q?ansaqOZPPOILmFY/6BU+QHFLfTifYxptuof0nzZxe6QEvrIUhTXc9bZ27x7W?=
 =?us-ascii?Q?Y0euiClvK87Ryom0iqRJmQ2bbWU7802U+6U+F2eYWYoIwa0RLvFW88FwNRoy?=
 =?us-ascii?Q?eM2nXYdU4RFHpNN/y3rMqTWEhFkMDB2KegCmdixnjXLwmWm5ZMY8MpbZzjJf?=
 =?us-ascii?Q?03zBC1pKammy5rMT1A4gbdr9ROix/BrnHuWPXZeQCEhRR2TVwA4hyj7SBuAN?=
 =?us-ascii?Q?rI6KgnwYb3gLQ902/LY1Eg4Ko9zoyiZCkCNpua158FYLr+TKCQByF3md9Mml?=
 =?us-ascii?Q?+kEvnHBpWrqCSdkJtDfaMob2uaQc3MDAEySlcgvoCQqfYRCSC42VsJoDaShi?=
 =?us-ascii?Q?U9pnZLn/QjfTMAty5G+/cHfcHfu5axcUQ6RF7nL3PeEpr5mvVt8y/+rLbsrf?=
 =?us-ascii?Q?FAnoDsSm2iKUgyqMuZ3Iqw4B/Nx32JSjsukOFHPm+uxs+/ygBjOv9h1LV0nt?=
 =?us-ascii?Q?CnRvO/+4hL2z5BotVYavm97ZNPq+/iraBI8b9ZCYm7mfln6YfYAP//8vOJip?=
 =?us-ascii?Q?UEkJKZdZ8AVWhj+nItUcLQv4mfERs3OoFq/80NvJvbDhyWr+GY6iRuPEUDqy?=
 =?us-ascii?Q?bchtYXpmIG+HBtbPum59evz2kEdakUC6cKtOdEGPjTFmJmmj2aexA5SSXxR2?=
 =?us-ascii?Q?3ckoj5PmE/PRYqV05kjP1AtCi9q/t424kPS5PHBUlAiGukILMibG8SURVf7w?=
 =?us-ascii?Q?fP3t3xuZZlLquI53x+D0MRK1Pi8IV3WMlGa6mRj1tp1p+dmntTkoujIYjoMK?=
 =?us-ascii?Q?eOSdtdvPpAT++d4vLwPqVj/1Jj4VTeqMPMVanh6zEcmVq2AcloLnRp/qX9iC?=
 =?us-ascii?Q?PG67q/ZJbDHeHX6oaSsCjQ848uOkTD/Z/yhfK1nDK9H2xssgNVQZFYwhCUMA?=
 =?us-ascii?Q?ecyMH2LglwyI+NjNpvoDgPc1z9U2/PZ806Dr/q7SR+4Qmu7X5HcTZcbDJWlV?=
 =?us-ascii?Q?ellBYjp5WkKlSgkQd1s1MSJGwdNkv7MiiaFQCLjICaNiYNgX874N+Ll9UR3Z?=
 =?us-ascii?Q?P3emFudIPtVvRq5PSPdcedCG13X7Lw4/0XyH9ruKHzuTWtfVoLoKp4tM7fQQ?=
 =?us-ascii?Q?oafLwHrGVjFzA8u1/zAo4xXeCpa9BCgcUbofJUzHbOD+qarcrMEaF0q59AtH?=
 =?us-ascii?Q?0+Gfs9x+OVXlJkGek49+bG64OtCvL9wVAACvpIvW0zwqt1twKe3vSfbeQFAl?=
 =?us-ascii?Q?+RAylNkzmXot3uai6orUMoJ0CkuipnWo3i/6q/8Kk/6LyQHb6420aTIV7xeH?=
 =?us-ascii?Q?/CvCn1uMrwx7cdQNDvuHQGbwJNQhsye7+4DQkRsvjUf/ZRLHAq9FF/dKqclr?=
 =?us-ascii?Q?SjJ3DjDYkdd+T1RUM1cq7P8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca71259a-925e-4873-97c0-08da812c709a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 15:15:09.5319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlRJXuC3E/5oCdPLknnXUiPC5tpfEDk01CpmBt30Pmrmv5Sduc1pmQf9mqud6IxjWB3B6rf37gKsKHEYBBMPK/NQ1qOvQsYQZR7bzwD6Pm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3715
Received-SPF: pass client-ip=40.107.21.109;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7d76d6ce9d..3900a0f4a9 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,6 +418,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -435,16 +454,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


