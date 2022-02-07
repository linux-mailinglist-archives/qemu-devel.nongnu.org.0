Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717AD4AC744
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:27:11 +0100 (CET)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7nB-0004bw-W3
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:27:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71R-0001h9-LG; Mon, 07 Feb 2022 11:37:50 -0500
Received: from [2a01:111:f400:7e1b::708] (port=37729
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71O-0005HI-De; Mon, 07 Feb 2022 11:37:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PttscNq2ksNsRd6ktHYXslpkog4B1QYbPSpYgc5SZ/5vR9Hc4m1j166ekmvHXHMUeqUnoR8RKt3D6CodWv2oKAzPh8e2WlO3SAnJ5yCXOXSE7jLA+122aMtp/pXH/yUzqIRk11aJZLaN6H0+hNcUSX+m7FfcHjtYkmWRRrHlVRLRrFPhEhdtsg5YCYZK5aD8vfEp8RZbPDKVZHILcQIE0cZOW3MenBwkF5g1iFIYOrsYkEk5XkeKXIewCUJXbNQixMK79CFR8aWDD8pOgEZxT71ksnAlQNmQUcVYre6XiqjwTzP5UB14bEg3mfEhbjwcF49HMk6dYt7azXiek0PoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tty7PQs0d6d2+Pp2OIMA28yZITQC7+ncWsCZ99J+230=;
 b=nVgDticqcXo5qpC2JVzyByQCw4xP43k2SNgVD7LiQ/T54K/ph31Us1uFGwfy3gHAdEoKEDbBqq2cf/KTGnMYSxGY7GPNsd6/4GE3tiF/KINWrAo8QKQDioUKoZs+7ZmM1GT+U7v/2bwdaM4sagD1hnn/0J3dcvwenbt8ArLx2d6U1Wfcw6OgjvBhamAR8v6IryWfJ7UTsnAXNbj5xpZ+gqwiZU3/xKqQUH1rZESFkPAwHKY/UnFG2rK8Fuf4RgTRZCaRiciv//xBrWKgYBU821qmAv9Tfo36mRB0IwbcDnmFChiiKrm4YpU/9EJMciVfJ4vvHSfqNjqRYxchzXL+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tty7PQs0d6d2+Pp2OIMA28yZITQC7+ncWsCZ99J+230=;
 b=GVv8SreobHgNioF9F7yZmG+Ra3OsKe2y3Nw6LjswRu0IcgqbDRAjRcyvUAkeb7GZLruQE/erWJEINFWnpv7dT2bqXyln7yUKdXf5ZZWNk2QCtr9wt+4SRnnPeQngtJGAxKn8EFtFLkCjRyU8wEDXx8j4EoF13m0MoFFZyl4xVGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:38 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 01/14] block: refactor bdrv_remove_file_or_backing_child to
 bdrv_remove_child
Date: Mon,  7 Feb 2022 17:37:15 +0100
Message-Id: <20220207163728.30362-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b865726-760a-4d00-fc0e-08d9ea582719
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2288C8EA9ED17C2A3C2CD530C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpglF3myqrPerKPInCO6oLXgurd8R2bvSwxPX3pSGVWZdAfDVszqgTnnKx79RIeOmk4cybGA/pNKcJ5biqwbQgtm43BSJc+kHLPuAyPZBka8r04iTgwmj5AT62inG62CHFDte/sLQ39Kaw5UKEkCYF1+srvSCvmFj3yHgj0syGR8mlD1qMIujmiy+DssxQGrKkIFA6EQj8P9Xy7NaTkBZL+ubHeNzE1o4ftFl6QjAEmOwH2Kz4e/C6TqIYyEYuuz9UhkwG/sJVTg6qXq6EiutbJrqZYamjjlj1W9RNdg9AZaqSdbckz18fy6WZOI94DYHq8XyoVaH99rAoB8VirL/e+dob5wiUwIMHOPCNlXaiTHxbRv/nu9/lAa1kBqgCRmiVlM/MDPVgsWJj95f8xrAwzN+WAyXcAuQAHM9MLDDKRblzYNe4raU9G31eUGx6mdRAohl9/1zA1/Br9fbz7ffgK0D1UCmifwLMcfwDkHODgmrN60zFD7AHPWBfJEjRNNwD/l8sIlHikUTPP85VD3d1rE59aPL1UsiSM0vNEu0jqakB3yjM9vDqAv1E1AEqqJ3ZUJQCmbq7eS+lYZfWy1JnKU3+uy6k06iGMQ8b9zEe0pFFVo44kH2a/dQIOmLK6TeNWIA7PxgG1F7lm1hALiVit7yNz/yw1aOMAW9jlJuFcQ61ZlafMstA6YjcjK2gfY4Ke2bKMF+oqKVCAvIQtzVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0fvZJXApnRH3+QIwIq96XS6wtPGV1EzyF2AbJAkmpfUno3p8JvMCEogh740e?=
 =?us-ascii?Q?jko9eJYrQfVZ6Vbx0ykOpJuFcPOY/h8/+8/9KVFEFdgzvvoInhbwkauNiRwi?=
 =?us-ascii?Q?tWyHkC5SeHadWVJyYgXAOu5ZmwlMMv2SUqMESJjqlsEIpNwpUisBb5OWH16Q?=
 =?us-ascii?Q?b+6pZLwuMoyuVEzCo1+Zfk11kw2+HSAPUGpI0D775niDsQqJZFoIIGt8ZWIE?=
 =?us-ascii?Q?x3tzdO51le8kAHkBtznl9D8sJEYFNJlUPX1pt9sI1Oqsaj1qgAlkyiLDqjoD?=
 =?us-ascii?Q?lI8xhXtmcYBCCmXZmbGLr+TU7mJqKu90uIak8j2wR4y66s0ML0jzA0OqAX2H?=
 =?us-ascii?Q?tmwyGd/fomdUV9wQaAVo87pW9ZTTEZaLEMXOj3jHFf5gil6RbV/ixN4wM0jt?=
 =?us-ascii?Q?FK2B07zl5ILRaA5brx3Fwj+Jk0acJXR7ngoJNZkKDRcb3mWXsuZJfcYPuQ5t?=
 =?us-ascii?Q?20sN4Miei/+owBxR7JVSmQunypszQtO2E9VFysnIBX6aUty+1DlZp0dGRa8m?=
 =?us-ascii?Q?SfndR4a7si02bAP0ugRo+RklkNvfbLeInOsC4CN2duUf1P7fTAK6vxvbzlqC?=
 =?us-ascii?Q?jcK4CVGUdTcmLhrfNKQTi9fYvryNSg75U6iXwabecrjDWqjS5uL67D7h7iba?=
 =?us-ascii?Q?YaPWHI19ncS6tri0a/Q14pcvC9tDuqbiA10TkzjA+REBc21F2f+AYPntgJfW?=
 =?us-ascii?Q?qMG2dVGOIAeiQLssifokdIfslSvN/2JjkNi3pM9iM0vkEgVOgZXBI2M3JJiV?=
 =?us-ascii?Q?NRdwTbFLUMAwLHLg4AgJpviKAyzhWEEUq4ZKAPmriiURGANCyGaGa0YZqNdX?=
 =?us-ascii?Q?YrytDSuhk3fGTtNha5hPXRXPqgC7rrn/hoYLhs3vj0fS5nyR502qLwEoo5k9?=
 =?us-ascii?Q?O7/NFl1N9GSR7SLxlWDOnjufbiPLDN4pCgMsMSGcxANurwGK9vY2KqNEd5Mb?=
 =?us-ascii?Q?KhREryr/BmBszQzMZqpiwZ+KObxa64erPGdmf30Y3tv9RBANsdeYN84i4GYO?=
 =?us-ascii?Q?rkgzze4x0iO+iwHFUFn6oGNDl523nV6dAezAwsPh4c9Zli9D+bXAZx1xK+Iw?=
 =?us-ascii?Q?11C/0bXQPM1w0QYKNY7ny36n/v+2mzrYtp6ZQ7iLVdfkdMSqof+0FlGP20jV?=
 =?us-ascii?Q?gzr7kPOuef9gdgJ7j3anpqC2Pzox9xxgWa0W28GoHZ7w6IrNIV4uyukp0AzR?=
 =?us-ascii?Q?cTWCqghz7uqtOK9MnCYVo+szOsS0mcNJXN78jA8Jsyj3jBccZhtOhvkvFnXA?=
 =?us-ascii?Q?8j1CWzIWS9GGFxcgI5yKSQDcs+8XvEnqtU7mzDHISex5JqpGt2YBvx7vA+sO?=
 =?us-ascii?Q?ifmEhzZ8wMKBy8PAveXMNlQkowwAyk8znZV4Na2sQo7mMUvF8l4AxGZ09c7v?=
 =?us-ascii?Q?FMsamYktonFrMJ8fNI1ao3iB4TmRMddkB+m+IRZKAwTkYLqxfV6oZIferrUK?=
 =?us-ascii?Q?ItDmEYBxGWMIeSxa7y+AHNw21g94iuxX01K/ZOfNKkJLvb+w710xOTLz+fOh?=
 =?us-ascii?Q?+qSRNX4/OzbFeRgK7D08CN/Y0q1Iw9l/JmoEBdSEizpHksFJtxc2+Ax3ZYPa?=
 =?us-ascii?Q?d1Ed9K8UN/4OffV1ERDkdPnXq/GmfwZyZ2Pa0/C7Id1Bm6fgoE8knWYQ338S?=
 =?us-ascii?Q?W1lK5Fyip8ORJS3+DwDI4x8pviI+yQDZmUVpnnhs23vrjWcJfuZiXO6hAbcR?=
 =?us-ascii?Q?4nG0mQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b865726-760a-4d00-fc0e-08d9ea582719
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:38.4934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzywADXqGDrskqoEasn6VeKZJYU6/7jnRUVhVuHXWc7S9EKINCCX5b5ffoXP10VuW2xqw9ixewtbks/kqaMmSd8afbdJGgY3TtmxmEXmXU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Now the function can remove any child, so give it more common name.
Drop assertions and drop bs argument which becomes unused. Function
would be reused in a further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 0fddb57e78..d852daf7c8 100644
--- a/block.c
+++ b/block.c
@@ -89,9 +89,7 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran);
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -3236,7 +3234,7 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
 
     if (child) {
         bdrv_unset_inherits_from(parent_bs, child, tran);
-        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+        bdrv_remove_child(child, tran);
     }
 
     if (!child_bs) {
@@ -4891,25 +4889,21 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
-static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
+static void bdrv_remove_child_commit(void *opaque)
 {
     bdrv_child_free(opaque);
 }
 
-static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
-    .commit = bdrv_remove_filter_or_cow_child_commit,
+static TransactionActionDrv bdrv_remove_child_drv = {
+    .commit = bdrv_remove_child_commit,
 };
 
 /*
  * A function to remove backing or file child of @bs.
  * Function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran)
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
 {
-    assert(child == bs->backing || child == bs->file);
-
     if (!child) {
         return;
     }
@@ -4918,7 +4912,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
+    tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
 /*
@@ -4929,7 +4923,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
-    bdrv_remove_file_or_backing_child(bs, bdrv_filter_or_cow_child(bs), tran);
+    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
 }
 
 static int bdrv_replace_node_noperm(BlockDriverState *from,
-- 
2.31.1


