Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8900381936
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:56:54 +0200 (CEST)
Received: from localhost ([::1]:34818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhumj-0003Ww-VK
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue1-0006v9-IR; Sat, 15 May 2021 09:47:53 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:8323 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudz-0003EQ-JP; Sat, 15 May 2021 09:47:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOcE9Q+cR250g+r5yBQfMo7OtRQrRm9R7sRlmwDc9FwggByNXWCpMGXIliRU9QYlZqavl+DSdNrfP7kQULxYQSvXwk5KdZ4W8eOkL65TYXYpYQ0swIaD1eWdMzABC1gUISzQmaIvDsp6rtiBMgRq7D5ETLj9D7cLemNs5J5JLCJfB+oGTLWhQieOEwfC76XUm9NSAMxEOHX7H3O99uADW6mbe4rWP+9ee8ssp+KpNLlpch2yJTig0KZBBHLcbl9ZJkJz//HsAExoG142ayDuhFnfEa9Y9Fmlnr8y+4tmeaC4/Ipe59yD1yGFqy0aU9NcwsRU3lXsLycRJeY1a5vjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ4QFY5tFPsOZcCKa8Gji0OUsCjk4m+JoQGa7zQdmlM=;
 b=Ps6q7mQiQiYwXlDdTNr6tnbXTCEXg3Dj5yAzVqPydjwt+DIdI2nHAYEiQxhSrLOKfqL/auWGghOJUwdq5Qe0Q03u6nXs37KYkg3e1SMEKt20+HeUC6fRkh3TjCyJjzh8sc8abBV6y0tgQYrDCzGyBmmp4zXjEcpYCmvLmaRXwVloY3Wv3JCpIu1/NmqdMORPFch8n+K2fYRH9js6Nx4NpLp2tPMuri4qarKL8C0LfmrJhuN6HA1ssj5BwPM+yKnRc2iP45CHwL4mratVqoNvztIJsyKmxooutJ9VJCBbuEyv5GBPFYRbT75UNrAjHwCNig4mkcWFfHNfu12lYRBFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ4QFY5tFPsOZcCKa8Gji0OUsCjk4m+JoQGa7zQdmlM=;
 b=lh04oxFk9D7NEsc+aPPTraBufSDohYk50zlEplCopM/896el3cR2OPY3dt6isEvaY2HrBE+PZdM801cO4rVizzR6chU4jSHMIfzsUJ3yx+GIOsCT3e2TUsBCuIUbYczRtn4FTiMw9/zU5wEZdmP4/jsR+gI0zvcZHTvsCm/LpAM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 5/9] block: bdrv_reopen_parse_backing(): simplify handling
 implicit filters
Date: Sat, 15 May 2021 16:47:01 +0300
Message-Id: <20210515134705.433604-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2c18cd8-6a78-4c51-7545-08d917a7fac8
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5206E7ED8DC456A4101FDB4EC12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajaKhmdFeIwHNKbIXWCSZWh39Q2X1vBAytjilVDBFBPtSe0ONKtuTd3eAHs7iCdjTMH7uT2HUQ0WTofH5h5bx+A3ALB5rijQo+1Vk+uJXImuetx9/CMkVoeiN4sWGHAA3b1Jv4Mw3aCE+pUBI7PJpm46YKoZxZ33LoEnT32+0t1tdvoALeXTchef1Fm5JtwYtnUuIFsny8I7iegCe5vUoEjb1cGBRuu8Z0ZkC+KxBHfswptyZGlGa24x0GxpSUpJQ+BLWY1QJw+9knKTT7Q9iVwrTTo4CLpewRxZVGvvCdrdZ2ACesscO4AVoFO4cekqZeIf89V1VqjEvMBtrd6xwDN0mRzbAUz8jPvv+7/Ab7QILyblhHuIYjUoqRcOFCPbtp8YN42J8Qy7bpbv5BApqu0v3hiorSTlIO5P0uj31YhXuHU0XAdN64C4r3hExFh0HFeXqM2RZHHAD3AN0TqR6dfEvQjZXB+b6yHugcN+kISZOjtVx7fOuoLTA0ryoiBi2Fl/vn0ZZ/rgjV1FW3SmyG07IMPOA799EJsRtmSG63r8eqegAJA/Nwj6osymwOt0iUU/vuS6SuZZy/WtOq5JzFeTvQb0eDTl9t1cX8k44GOtKpvlg6LMZPke0ZkjeeqMlyF0sYtaAcHDEi6xUlDO5J5zGjEjgoxkfL/AXfMNg3FMaJfWchC9665jmH/mfkWj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lo2NCrnuCNW1zgOCbaFdFz3ioYaJMRvK2qs8LQOL/DRH+LvmVcH+g6q+m8sz?=
 =?us-ascii?Q?vcS8iAWbZkvoP8Agh7y86lPHRuKQ7/GvTsTRJIN02QTZBUCNZidpCxYO7Nsr?=
 =?us-ascii?Q?BGfFntuNykCsWgjFLY4XSDPYANJ0+J7ogOBblToUkLO3bD0n5JFhoFFEABvs?=
 =?us-ascii?Q?YvF7HkfpiJ3ACPRXK9ls1t/y6+oC+hvZCLSY0wphtI7ezhSxrA41x15Twl6d?=
 =?us-ascii?Q?aJccgoZuQpKaf4WRrDjdIg0i2w3MPqMtENXVbExv6lWXvud+vltGful7wBB6?=
 =?us-ascii?Q?7iMZPXpJbbhvS1Nm/GqSpAlA+FDW6gMj9uNtEG/h+GP/1WN6ET2NQIfhy5D9?=
 =?us-ascii?Q?wFHF4IaM6d8X+00bqvRPbHh5pj3BO22P8fbpGu7kiSD9X4xPO6DBOqCtHG6r?=
 =?us-ascii?Q?zk4s0bP5dCB/ieFKDpB6OYSuLXVj3YcvTVFxIBasn4pzYXEy/rHabkRNPTwb?=
 =?us-ascii?Q?5STMqaoqyxKWSKrpDxGT0cxdkgqc7hRx520eBC26EfyygA2qZ5YaZjMD628M?=
 =?us-ascii?Q?hoYbrpUxymUvNjRnexxDtM0oXzZ2jWDksIaoL10TV9peeXC9DS0aMLaaiK8e?=
 =?us-ascii?Q?6UeDteBNTba332tpSBRzhPTgclMX7Q6/iJwdm2s3ZdPNOZuj2KfcUvxn/TCm?=
 =?us-ascii?Q?XYoWBMjQl71n3ADuBCbrakhwPhJx96d96Lmvzn8ESPrFXeWlx2OQrq2Co0GB?=
 =?us-ascii?Q?/zF6JSHmESLPCM6kk3Zb8YqndC2i9K93HzekQSol/V2oQPGyFxMMyN2vnrGG?=
 =?us-ascii?Q?Tf1U8/5BszCCzpUr1uS6cLxq7cugprOkl5UWG/frcveJv0c71sxdzl7qZPdz?=
 =?us-ascii?Q?h1Hg0A3VlpPvp+tgB9rA5qifyuepNS23Q7Y6eCFDsJGY5AUtnMRc5C2Lhv64?=
 =?us-ascii?Q?FqV4jHojHoKQNdwFTgIyPosXIwF2Mjb1/qo88Ude5r7CjteXTxV6Urk/EAjl?=
 =?us-ascii?Q?rYrAFZ2Ytw4dlTeh9BJnnCpy3EaYEFcfQzQuRFlQfFfKVsOv+aLhYJ3FaKd9?=
 =?us-ascii?Q?cdwfF1sYbKaDLiwGhkiQ8uPUWZwfeAvTrRKMbir2zff3+DIFePj0eGvkz9mY?=
 =?us-ascii?Q?uPGmYfvl7anXlap5Wjws34BtXXm1bJK+COgF9xCiiwhDpT3wf+Q0/D/UcPKB?=
 =?us-ascii?Q?uKe5J+ywnLHslb2DGdiqUfucDt27Qfp/K1thAxqAa2G9BeYaCjkNBBbf6smG?=
 =?us-ascii?Q?AWzn6/BvISYOQCABwP58dW+xT4bAD1RE0fUQa9QG8rTfnwEf+khHvRlwX3oS?=
 =?us-ascii?Q?KrMV2Bxn8duYNwW5u1OIP5AYDJM1+UoAIr49PqxDF8urPPnMLf/WvL0x1GMu?=
 =?us-ascii?Q?cWIF1AMWqqsiEl2vaRZPSu0V?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c18cd8-6a78-4c51-7545-08d917a7fac8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:28.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkkU+1GEAYu83dG/2Xx9PbTtYcLWPjNLsbzgDYNsbEV3NIoaR/wzxT3O2GelQEGajcii+Rh7GUJZSUGk9tBCi5dEBGXKxt5zAftjtJeX/Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.7.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The logic around finding overlay here is not obvious. Actually it does
two simple things:

1. If new bs is already in backing chain, split from parent bs by
   several implicit filters we are done, do nothing.

2. Otherwise, don't try to replace implicit filter.

Let's rewrite this in more obvious way.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 53 ++++++++++++++++-------------------------------------
 1 file changed, 16 insertions(+), 37 deletions(-)

diff --git a/block.c b/block.c
index bfa497813b..7d208c708d 100644
--- a/block.c
+++ b/block.c
@@ -4212,7 +4212,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
                                      Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
-    BlockDriverState *overlay_bs, *below_bs, *new_backing_bs;
+    BlockDriverState *new_backing_bs;
     QObject *value;
     const char *str;
 
@@ -4241,6 +4241,18 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         g_assert_not_reached();
     }
 
+    if (bs->backing) {
+        if (bdrv_skip_implicit_filters(bs->backing->bs) == new_backing_bs) {
+            return 0;
+        }
+
+        if (bs->backing->bs->implicit) {
+            error_setg(errp, "Cannot change backing link if '%s' has "
+                       "an implicit backing file", bs->node_name);
+            return -EPERM;
+        }
+    }
+
     /*
      * Ensure that @bs can really handle backing files, because we are
      * about to give it one (or swap the existing one)
@@ -4258,42 +4270,9 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    /*
-     * Find the "actual" backing file by skipping all links that point
-     * to an implicit node, if any (e.g. a commit filter node).
-     * We cannot use any of the bdrv_skip_*() functions here because
-     * those return the first explicit node, while we are looking for
-     * its overlay here.
-     */
-    overlay_bs = bs;
-    for (below_bs = bdrv_filter_or_cow_bs(overlay_bs);
-         below_bs && below_bs->implicit;
-         below_bs = bdrv_filter_or_cow_bs(overlay_bs))
-    {
-        overlay_bs = below_bs;
-    }
-
-    /* If we want to replace the backing file we need some extra checks */
-    if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
-        int ret;
-
-        /* Check for implicit nodes between bs and its backing file */
-        if (bs != overlay_bs) {
-            error_setg(errp, "Cannot change backing link if '%s' has "
-                       "an implicit backing file", bs->node_name);
-            return -EPERM;
-        }
-
-        reopen_state->replace_backing_bs = true;
-        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
-        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
-                                      errp);
-        if (ret < 0) {
-            return ret;
-        }
-    }
-
-    return 0;
+    reopen_state->replace_backing_bs = true;
+    reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
+    return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
 }
 
 /*
-- 
2.29.2


