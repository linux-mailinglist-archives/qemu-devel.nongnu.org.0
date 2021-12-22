Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA0047D62A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:57:51 +0100 (CET)
Received: from localhost ([::1]:37130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05s6-0003H0-Gd
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bl-0001Bi-Ah; Wed, 22 Dec 2021 12:40:57 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bj-0002Xs-Kn; Wed, 22 Dec 2021 12:40:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHR+jE21Y/5xsM/zdFrXK/DOQ+fK1Hldz2NLXNB/uLdffC0LocQ1C797HFjMahyASi7mjCBREO04VKiaS00NTjySCMBi4MvEvI8pi3As/ovyjc95s/rYaiJpwrQcAGz5jlQVPGopEMHMW1arx4feInEbqnHDIzk4+w8o2sptfYCeUR1N/E5H9nDAhdMl/nBQ0Ln6jxWYDyDJLPhLyRMJsgaWXa7lqjmUB0tptQSeQ5xvldy/nRfiXkNV8xiLnQst23nnivatj2QE6VkfrnSHLdsxl8/KcFADLjlHd1ZE7Pk3ROPW0BHQDcQKfB2UaxijssGdirLssLJIhlvBTG83iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CbIakG8Bpry9mIDvB9GIJfrqIDoKVb9JXqzYEcnay4=;
 b=h6hZ9q1cnY+UvRo4ku3uOiOPmCiERVerw9uiV0rNMBFrUtFpDSxoDyNDB82CCDkEgMkiozOmxDlzihlo2Vf8243xcDnhZgTJhaDFcbn/VEvTPn0lVzT/vXf40T39r8u6IRFEyG5hc0UtgC3qO7RyfNKUbtHUXd/6DY7eiNtmRXOML/p66qIG5k1f3H3oRoXWlo2v6X0Av/ZPlq++pPvYn4xFir3C3SXTIlXKLw6IcgZsFyVRyhy7VREK7BdhjTAbzIQnDLohpYfS8WFH77VDOfbOa9COEyQ5JPsb5jsiTW2TkolMCbfsh26qMd5IXqQkOUdPq464ODIGDVuS/Ra5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CbIakG8Bpry9mIDvB9GIJfrqIDoKVb9JXqzYEcnay4=;
 b=ickScpv7o4dyD61bgQCmt37mZx/UNL0kYXh9LGmmfAiGwu/RujTjy0GsNC8w+0sEY9vi2fBRkgIau9oUb/P1cp0gd4kPzAy18nri/RXR6kIuH7SClBRg4Xkw18ET4amKLjXOrsesL4MLVcZFy3V7ImUa+FK6o89gcJMYnyZkJx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:43 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 13/19] block/copy-before-write: use write-unchanged in
 fleecing mode
Date: Wed, 22 Dec 2021 18:40:12 +0100
Message-Id: <20211222174018.257550-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1ff496-c2f6-4064-5f99-08d9c5722d59
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964F6E3974216126A0DF14AC17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:62;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5mqza9U4ef3qmx7GO0L6U172np1eKG9tpn+q74+r5UfU+0kyiArAu+dck6mcpwy3p5pM2i7yuGTHB9lYU84GXPZ/7IwD7jdkWocSF6/mUYgOJLbU9O+TMMdkT/2nklEQFZ0Qy/Ed6u/ZVJtV8PT27ZsFXNNa8LzpACVKd8YagDdVvK+WZ/r8hD5JROrMkExq5nE3blFdoVmhyJwHkMZ0hL5voYjYose1lytPVGHa0Hw4L3UftFbcaR0pHM/CtuqEaiO2vT+pKh3iP79bIx923Qnn8/VDeKXHadA9GE40HqZmivw/Vzut6GRi8fn2kmQmhQAjWlh8nyfufdHNbitTSn9Qy4oi20S/ms/DTgS9Yd+kZBBPr65MQEJc2COYVDvJp+HbWOSbfHh5uqIzUPJywQfMvKJC622kv/r0UZDPeAXSIbUnUKHtYQtDVIQYvosN+MclTWmKU7NocUdecoJ5EjF8jyNiPSZasDNwck0n5lMU7wcmL2V03+ywv/cNdiQiq0QmkMuvyauxUYbQezN62ZrwILo2EzEdUejSKzC2AeiXfITpCqUvwq9Dh5J6YQ9ci/HKyODUleOSj/dazWIm/TELenK4sdoMeQJRwaQy9o1TapUNQ5ZdumLs39nPNUhsb/3FWaNIdShoDBHKFvkJjA1uy6AGbjY0qzh1TOSje8GZnE/go/RQ+C9/ay8uAIqhmc1jD2lex/OCFVyU+0eK8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UnBGbblkTKpStWwpo+ZWaTIaqq7+Z/JO6nT3WJowzIybyvkfJH3ngCD/6iKl?=
 =?us-ascii?Q?GqW8CPlvjLg08ma8wmcbkSk7s/m1tupN0jnlU7zNlB26fC2feTWzSpKL4r7g?=
 =?us-ascii?Q?BlB9SwOlgppXhHL3ISE7uGPc6MUQP+JKRXynVHkgWlLWoXlWXGySh3oRuicX?=
 =?us-ascii?Q?E908tXqVFS2qRk3r6twOtDvH6DyutZ+S6AP+wfLc5fXwhblIRYR5CkhlIxnK?=
 =?us-ascii?Q?6mmbg2CQQjfmvmK1LWdQPDZdsjezlFcNJTx9TVhi1uKTzY4rtmwjexIy/ycc?=
 =?us-ascii?Q?5IWxc9A7LOHuUiXrcFDlB6ZTYu1sGiEmOaCG8y4ohHRRmTZCVEBhnmf4xI5H?=
 =?us-ascii?Q?5GLsHCrmwszYy3DxJAQIniVDUdqhdtVMpJtpE/C3DrbjTYnWHBO/9ooU81nz?=
 =?us-ascii?Q?g6rJERvviFfreiBbfW5OQHpsj6PBv8ho0UVQZrtaZ54G+fHHohMxNvKEGi8j?=
 =?us-ascii?Q?6QNT0GFlBkz7vgLbJptYIt1mZduRiPTv8GqZYNZcnTr9rIOvrwDk1FNGXNbs?=
 =?us-ascii?Q?TR/CwijUreTTWfrT0Uq/3TuTe4wjoLTvUQ3/cEgy4O/bV1uNx1jhFF1qDHvU?=
 =?us-ascii?Q?MfKvrHEXM55Au5ik4aJjMSXoYTQyeCrTWGrnGcvHcz6qlboJ+Zd7JznTG5HB?=
 =?us-ascii?Q?Qkx93W87y/b8D56yVBMSKCkKoZa3WEgPTFmlhfNWWsZYN/ibXvzvzhuPMTtI?=
 =?us-ascii?Q?eAEiMNYLlsWKEka8kNiyJhwlyj1tL6yTgfUWpfcBFTZJq1XpqzI0PyfPIFJr?=
 =?us-ascii?Q?mDakajCatyNIhZdIOswtuMWMPJ10OyitmCZLNtXrnpGdnMEO0/sp8E+X3ZZV?=
 =?us-ascii?Q?+BjL+26QY4bxttaiPDixuJlH1HCvG7BYrgVP8cOaPUQRl6rdESeXFzFeq+Se?=
 =?us-ascii?Q?cxQaBWueGlrdPLzAATVnJvfggZOF2+PN3laYi5mA0RTIJWAswTJb+vUZDtXj?=
 =?us-ascii?Q?/M6ck2qSf6xWYJcoCzpHptZIK+CHlWTul44qPN3m9Xbrq3m7jieSpxuUJz4W?=
 =?us-ascii?Q?9pxKRJhmisjj2xhydA0m2Yb9DHLVGukPduy9XVntJuXbuSnBHUaLaRiwK0Tl?=
 =?us-ascii?Q?Ii4x9S2j6apyNls+ZiqfQOLrmfQ23y7lQlPlKWDim8N8/5gH/23sHNs5Jcst?=
 =?us-ascii?Q?MZaUvT1qSuyrXjrQu1Gyj2n+4xNMrOLT5OwVDsowqIEu1NJDIPAxrLsnyl0r?=
 =?us-ascii?Q?MjqpfIOR6nzal1LY95LxbY6+pXVqUfxbR8lgcOGZC/Z6+SXNNQHtmrZHKlBS?=
 =?us-ascii?Q?mjXRCuEiHkE3x89okG6ezKb2evkMOJExss06MzpfvfeO0aBKiIlx+jV8VQt2?=
 =?us-ascii?Q?/4rma3wVK13SFv5rUTWNvJOeHDIcrHjtrTlnxv1uh7NKqb0gULIcETNMT4P9?=
 =?us-ascii?Q?T7m/c4iTo4nc4ysLkOAWjcmg4od8lVtwYOKfMNILrE1JL6HMN8bIiCnV+yz5?=
 =?us-ascii?Q?SbqESrAmEJUruqW+84qGytUK/krx9vE4T2EuF18E5gRrqtXx57xetgtymPke?=
 =?us-ascii?Q?DECbWT2yDw67t4DP82T/yRwZ+b4rhpYAgF7ujNCrhi2AzvOePWoEH0tkJqA2?=
 =?us-ascii?Q?aGY/df+ybXGOiLlEwtY6BPpUoZ6Nc76WYK4KVciMhkC8bOo9FYr/YGjhtb7f?=
 =?us-ascii?Q?ADQYrLIYo+c/MO/JBYZO+B62WmUGEFm798FavfH8Mkuj+uk7H66BR9XG+BbX?=
 =?us-ascii?Q?UgXpudL8A7rEYofjlAFqhHAA+KU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1ff496-c2f6-4064-5f99-08d9c5722d59
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:42.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBW+WKzWd6tXp8YdcofO9qc6WX1poUUt1S32RYuMutrV4AOz/VJDp7h8JwDZkNSn9WT+Dhd0ZqLiUCO+cMnsxln2DgF1fhIQWfLHV8qt6YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As announced in previous commit, we need use write-unchanged operations
for fleecing, so that fleecing client may unshare writes if needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index f95c54dbdf..ca0d7fa5ff 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -133,6 +133,8 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
+    BDRVCopyBeforeWriteState *s = bs->opaque;
+
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
          * Target child
@@ -143,7 +145,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
          * only upfront.
          */
         *nshared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
-        *nperm = BLK_PERM_WRITE;
+        *nperm = s->fleecing ? BLK_PERM_WRITE_UNCHANGED : BLK_PERM_WRITE;
     } else {
         /* Source child */
         bdrv_default_perms(bs, c, role, reopen_queue,
@@ -213,7 +215,14 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, false, errp);
+    /*
+     * For fleecing scheme set parameter write_unchanged=true, as our
+     * copy-before-write operations will actually be write-unchanged. As well we
+     * take write-unchanged permission instead of write, which is important for
+     * backup with immutable_source=true to work as fleecing client.
+     */
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap,
+                                  is_fleecing_drv(unfiltered_target), errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


