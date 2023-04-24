Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBA6EC89B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:19:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsKH-0006Pr-Pp; Mon, 24 Apr 2023 05:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsK0-0006Pf-MT
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:20 -0400
Received: from mail-dbaeur03on2071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71b]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJy-00035C-Rp
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm0D+Js6Xm50vTg8DpJa8fnORnO6NgAtgRnHLNL0DrtplxmKlMa7FWTzxta3m5om9Tv+XXlHa9ie64HZaBJXrB/u96JgIohb8CZ+t7kX50+SCL5uJr6/eCXj3apXczHcGcNisEUp1O90F4OYCl3InFjHJNtot3FBF7O8A7PmYWyJIYDF34pEcOTfsoBkvgqHE+vhaaKRkFHCge54gKoyneZObJSyPzG4c27hNr/DpenB6S88Z9/6IKOFcRRjZ0EjBMO47GvPV7VyXF+xfTZWTbFDiEYNxaF5JvcF9jPJraHMg7LB34ymnpDnWjuBQ3s4DuK4RKLZZAYKVBgecZSBJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtEFLY65U+CF++IiOCt2WtqxvIgTt86j6zZCeu6sYcs=;
 b=b1UNLkYK23KXesdOMMKTA0AzF1b76wwtgUuWzmfDksrgbq83XU8QlHYF50J54857rjEzFgXbEb1DPkoDuW1GS8YhG9jjthAgmQkYtWT6qEyMmULGQUf6KTlWrbiQ7i3s973KCj51LyASxtH8ek1vHQ26PTeZehFPaOEf2A8LxsZPRaTCNHwPvARScTl1k9KGrPbDuwixcPKId/7EySgZzOwuOGdBoGARUScClDaq1wbuahpGzCiPMa5HqPed26VIWUHAK+ZNh69/Lzd2pkua/r70R+9PoupSIK1yE5OXNzcADUmxhqpyDIWt73tg/uIJ9hDpwA9Mqg8khw2t4wSFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtEFLY65U+CF++IiOCt2WtqxvIgTt86j6zZCeu6sYcs=;
 b=jsgTcE2tlTcm82WmDzROjdDEXkOh+/5V6JP+4rSlj6H/jkFNnoFXXRO4yzik9g9ce+jg8ZyFCvNntB3vKNHloT+Ku5XV1PmSnvq4i7ivXhmhgk90l5cwWRHnqnKxuF5vS78wcku9j46/O9xvIyrQJr3+mnIL4sNNN/bifdFDcE5XaxDIV9iGNx9w0TUc5AlAe8QxLm6I3wnVfaU9Wizo1INd3zmEqdMNns67GaatnhMxXGHHPkShle1NHE40WyR+iLJlLoW+B2QEYlWntMVxKdcTA6Gj9+4r315mWhDZN39t+4P7r+z5ldWlQybJhc3UbjTbgaYlSycErZf/jjhUCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBAPR08MB5832.eurprd08.prod.outlook.com (2603:10a6:10:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:44 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:44 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 02/12] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Mon, 24 Apr 2023 11:16:16 +0200
Message-Id: <20230424091626.195590-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBAPR08MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: ef42d7bc-69c5-4636-8b29-08db44a49d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lB/+Hn+VorWG4h0oQ6TUgFD74LkFfJds25tefD/p3CELf2ACr2BYpV0bUnCSC1+VKEznkJ6J68RGhXPSDqk7S3BKqCAxg+JRXT/YV7qlT0tkEYS2xi9/hMCezBFJ1bEObSUL9KeJ8dqHUhKse/iQldwZt39R5uZ/t6O2Wz1+4bsu4IyCl2c1M0ZjqaU7eN9fCjMB6NVecGECbXAup4EPYlN0nHwi2/f1lEfEIyCJGEJ/X17zGuWiXlLYCnndFsPjbHE/uk05AAy4QZbnN8FY9VD4jr9GvEh/vICLU/rAsGoXHk2V6gKUAIi/In/2mInyI9ZHRdT4V1Jx2euQurrpJuE/EK49tEGaJnvIF066lkLrELkugCD0O1U7ZUe5dzlHDHEqWgh5Wy/o6rlYq2QkrU/du1GrRYm153V4Sohm6bG5brci2qu5QoUtgDKmjxvTIRglSwWU9DtT+Ajl6jP9jvJT6FZnkDAq2Wy85SEkmpXxIrxrEBB8m2lO+gIhZXnQ4sjT0tE6GhQ4HL/EiptNFEZomCiwrE18823mlrunqwcDJibYR1f6AG9kGRTb3Jv/6lHEZkcvh95YtHqanaODzdpJYaSvcsnSxPOFfxAlGxvr/hytngywBTISj8QOH3Gh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39840400004)(396003)(366004)(451199021)(5660300002)(44832011)(2616005)(86362001)(83380400001)(186003)(6512007)(6506007)(26005)(1076003)(38100700002)(38350700002)(8936002)(8676002)(478600001)(316002)(6666004)(6486002)(52116002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(6916009)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YNIhRrkV46EK7gpTaktpHvlVwui7IUMINclupjziN+VMGY1an6tNNhg9SPLk?=
 =?us-ascii?Q?gwGmEgyHLRrqdOtjHVGUsfWoJBKdLABWl1f2yGkdU0SXpi6qU0ABtxoOZLQf?=
 =?us-ascii?Q?v9CPBrCBj/dZ+qKT/asbc327st0jNBi+TV/1nFCjPtU83H39Zt1xl+IC0H4r?=
 =?us-ascii?Q?AmAi6pImWz/PPILF+BR6As+y23kXbjca9flvzGsSuAo1nl59J4eSCQ5qc62f?=
 =?us-ascii?Q?Ft2MbWnp3ygD/3o/GkhatHkgzXf0G60ZM8LTw0nQJdNV0Ua3EIq4XGJoiLDo?=
 =?us-ascii?Q?PhZ/a+i/O5hhZ+Xerxs+Q0mnLgDYuha8o/r4VUEg/WXtOR2nmlpO/UA3wWNB?=
 =?us-ascii?Q?1W11Vr0vEOd7TD34f1wyiZl9XXpUTJgrpXPhBAIy7XfFHETi6xEifqv+X8pN?=
 =?us-ascii?Q?BPNAtRDRxyljGveYwJvFyQ0J+8u+pT9TXaH4vpmzv6CHI2StxySWQtAjUuGZ?=
 =?us-ascii?Q?OgSC21GPuXNp+I1o3s3LWt8Inb/3LQLPUIbj/v7S4NNTnEtrdvCLXFGN4Im3?=
 =?us-ascii?Q?n3rB3mITINbWFD320lrr9/xdxFdCpXKHupihzCELKwXQYWh5BOR8uoPK6WcR?=
 =?us-ascii?Q?pOB29GJPJzy0+G9tIV5nm5ln/cOj63dtULbAAAGCuL5Wvr/GkXA4W12O3umT?=
 =?us-ascii?Q?ttekm/b+m4rukyS2lDA0ljqGHWKdoS5npkvRQXj+JqKBMbYy8PEVSv7b0mDj?=
 =?us-ascii?Q?FfWREqP8sJ/KUn6krvyC1WRFhKFCRgyTPk9ZpleA5D3Xdrl6YH3wwatp2xmo?=
 =?us-ascii?Q?aJSG2G13P9pdgDvnnw2G60mtVFWnImUNmG7GnXFkaKZbDBv3A+hL/3aaztyz?=
 =?us-ascii?Q?SbmDgBJzMhXGHSccsAYfNoUIirNvzX+B1kVF9aahKDSD2xFQiTcwrow41o8A?=
 =?us-ascii?Q?bC96/0E9W5/Ow1rrGXqgRLg5h0Z0aikDhxCpv0Bk+odZNsppZTYjEU/xEVvO?=
 =?us-ascii?Q?XpVbV97sAxYixwVouDLbcJEwpifLb9fQoeG79TsHNUZ8n7nyYatimnaGJWM9?=
 =?us-ascii?Q?E9bF+OrEBXUrGqd0UQLNPm4KRkn9RpO7AIdjf/ngA+y06Y1byRhuXK2NC09+?=
 =?us-ascii?Q?sYJtOtQwPAAym7fjBpknvCI4MGS+LELf/QlI3U82N2ZWlzmVEIx6zFagSVO1?=
 =?us-ascii?Q?fmPtvW6VtiLz9s3YPl43qMq9229OY8kz40WfM6HVpcix8PH48Jg9i2sUtWC/?=
 =?us-ascii?Q?O6rp+w9H1h4RstNbUtX2FauWds8odcFYeVUgq4pZDplhEyZdkAY1TgaPISji?=
 =?us-ascii?Q?UUp9RQR7HFlEobPWfgPwNrzE1kSUjaA9OjKIn7ZsBI4KSNT4qfw4lCVSsQVA?=
 =?us-ascii?Q?R1sGYN294cOCUgSo4H90YFHLv/qzKWhYHwtlxNNpExdwGkf/qMoWgCP9GLTL?=
 =?us-ascii?Q?MiwoHW7RSGRWG1Jby9WN//ahwCGVA4SOvCN5apJcrW4ndwpN5+BzXt3FS6i0?=
 =?us-ascii?Q?dWbVCxIYLY2P0a6oD+g3H5oW7nrm+Jz4fD3nKMmrZOvaSW86QJ1fIEhnhrny?=
 =?us-ascii?Q?VlzQ5kK2GpyW/EPBjg0FEbwYcx9oYxb6FY3MZ0yXh3tV7PtboAI91Tt8HXAF?=
 =?us-ascii?Q?vrG0p5c269kTHsRTccrQBOh+HLNtTpLXg0cCBv4tqNZqPyIkAoYQBgPCSpRS?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef42d7bc-69c5-4636-8b29-08db44a49d81
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:41.3857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+ITSW0edtwKLagThMzlowr5+K9Ddh/Ju9yfcvGbubuu6NrQ6o9dcezlc9LZVEKKP/r1PikFtXwl3q0j30TI+4nDjBq3dzz9jmv0ZW/ooJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5832
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71b;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Don't let high_off be more than the file size even if we don't fix the
image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsement...@yandex-team.ru>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7e563062eb..4d6284a314 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -462,12 +462,12 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
                 s->bat_bitmap[i] = 0;
                 res->corruptions_fixed++;
                 flush_bat = true;
-                continue;
             }
+            prev_off = 0;
+            continue;
         }
 
         res->bfi.allocated_clusters++;
-- 
2.34.1


