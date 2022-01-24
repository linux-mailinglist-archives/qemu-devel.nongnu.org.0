Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C60498842
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:24:57 +0100 (CET)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC41Q-0004YM-PO
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:24:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nC3KX-0003gH-W2; Mon, 24 Jan 2022 12:40:39 -0500
Received: from mail-eopbgr70112.outbound.protection.outlook.com
 ([40.107.7.112]:48772 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nC3KT-0002yT-9Y; Mon, 24 Jan 2022 12:40:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOD+wJaxNjwJcr8FQkWbu6vqYsSnWQJ1tJhnths0/VKEBU3HYLxowdjtkNSqtQIm1qt7VQOXa4HyBI+yXakVx5W/olPUhFeQutTpJ6GZfAw0Dk4pybHncBYp2FmHtx59OYW9aqq2l1uD1NsIPzbQQx9lTrgavpsVHvrN5FwP6DRbeBf9h3TuIxKU+j+bBQsvaod5HCnfCtNKjM9IctkEm03vLLY5I91eb/8prrZcK0yzOR3Up2++wPH2N2S/8qiIF7a/MYjUcim0HkIDeBG/PdbtggHq5SyZXzIP16vK/51my6X/3OgougMl7g6tgd1E5LX6gbvsdeOk68vG5+a0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVzxO3caD4IM2ACB7cqEQbPTZMpvIMQ+YIoLgiz5KuQ=;
 b=nl4jZtmoDlvXbTTizoQNlmxG8o+6/58pKriwR8aplPHko/+4PGoLX1cN2IQlJSUkguMSX0h48gh4xtTFYvwHVF6N7ZyF2zQ34/99ODS1oOKp/8o5xWL2dr1TR0ralkrcpUn2KeBB4NNIYd26Ie1Iv2/e0vc1EAFsBQvQ7lf4UUklovJnGOVHHbe2g2bOEw0dnTSXTCFeh8ZM5/KR8NbP8/u0pGSFBIh46pb005eUe2UhiHdgiumCymWwLzcPmxNEScGmNEmt9wtYwjxvLeFvDK20QkpVoY0pG0kO3m/064Ca8VPmu5gdy2/BVnCnEkxSD25jgXPlhQLRxrqSIDofRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVzxO3caD4IM2ACB7cqEQbPTZMpvIMQ+YIoLgiz5KuQ=;
 b=l65mEc4eKNYtUZELqUNBCTgpwyvyZTZnYKrTEdzr7GULYJKPsZYj66OMKzIbMjeAr5vBTB104hin969pfJGby4jYfgRBmmQmbkHu59y3t1H1BGBBe57jkLBP0OH3cx9e1J+Z/PUmphsO1/U4FvfIXY1LbngiCg3t6r17FjOjXQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DBBPR08MB4316.eurprd08.prod.outlook.com (2603:10a6:10:c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Mon, 24 Jan
 2022 17:40:19 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:40:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH] block: bdrv_set_backing_hd(): use drained section
Date: Mon, 24 Jan 2022 18:37:41 +0100
Message-Id: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0172.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::35) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d59268b-c5e2-4f57-9f85-08d9df609704
X-MS-TrafficTypeDiagnostic: DBBPR08MB4316:EE_
X-Microsoft-Antispam-PRVS: <DBBPR08MB431611CD10C0216662677178C15E9@DBBPR08MB4316.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RcRS/kysMA5QaYd6o9ef3+4p/ffpHjPzKoU1abWvBmaxm6ajqZa7IHQ7rLt9uzfpVbr943sirsHI0iXvLaX+PdjR8ORETSLlG+Yzi2CZ7kKk33Qy1SsO/ow2sQ3frp4RckrwYL8HDfkKVmylQR1yfsO5NND66wwDMGMYejTC2/746eWUv3BBivvaOsU6wGtvYW3db3NCDxrBDfNvHFsmYyDh928OSIXfPomlNXHk+rVULQNYb/7iFd5uHzyAbdtCkwJEbUKtflyBr3/K/guctBYharVaSx4Mn2oeCG7jMzY+tDWjiLDoByTRM6TnvmdNijGjktnFw42OZoiGTaOPag3oov/rywpYTG/rYYxtjV/eads4tBZ0bu8EFjL5+s5STt8OwmR0oGb+XBbNQLgt8zrpq65gJ4snjcOKUImdE0It/NQYzdjKxsiEdGC+VAgwMjnraBgUlco0qGBTj2unYgyP7MmJR68shIqhJAFVosbJqTXTZ0gl4WlHrz7rWncjQbS9yyyiTmABnXet2OXMJBp6h2vNyRsJfdDLWA5diYUvSTKRG3db/8jTnDn05U0bF8k2L+BRocmq4tEd7WqJmSiplRPD4ZhbpnjrfAzy6wvCmapgsXGHCVhlkcSU24HCsmAs8fbIkxaOj5mJM3mEigUGSB6t6DXDSLykV8bSrS+fkoahajQ6EN1G/Atsgz982CUFnppphlPDoEh4N8xl/NBT3rx9Aqnnyp8r7mBarKkD2C8UIvajedQEm9ZIV/rH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66556008)(5660300002)(66946007)(66476007)(508600001)(186003)(2906002)(83380400001)(316002)(6916009)(4326008)(1076003)(8676002)(8936002)(38350700002)(6666004)(38100700002)(2616005)(6506007)(6512007)(52116002)(26005)(6486002)(107886003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OQjkQzEaez+AbmYukJAgHT9i1BBIy9Tu6NgNNc19gNjIDwuZa2B4pE8l44q5?=
 =?us-ascii?Q?2jzlYgRJSozDAgEKX4ODL3AwJXQuZb9SpCyaSxoUiGtLtU5HQeIHPKj7pO+y?=
 =?us-ascii?Q?T+x0qTAOEHkoxrFwA0z4ueOUCzUsY6YAuZPRsucTL2+5pCZ07CnPZIoCgDCm?=
 =?us-ascii?Q?dLdyG6d/VFtm8JLSOxW+64ROHPQjHxxCgry1hdW2LqjQ7+dSLZOmWjYnqTeo?=
 =?us-ascii?Q?xBUC7N5x6twLH036xIcy+cqnQdS/i8twbPVvi7zhsKqpDC5M2XWuXtzVuyUu?=
 =?us-ascii?Q?ah1zRssMQXczvnBlZacttMUb+hDcMVU2XeFuFpLPPTInp1Kw+Ff5svoLKyx2?=
 =?us-ascii?Q?i7O/1/q/1mk2YkxkcIQ3azSnKaVr/8/3vvBWKKsdBWa3LGmBATgkGCND6SZK?=
 =?us-ascii?Q?g0ZG+rPzbg/ZmDTFcvN8PXU3MRMJm7X6uSWRcbi304dxWUBT6S1y+kpLryOK?=
 =?us-ascii?Q?PvVspd4mXDr/ne2rwi9AsMgOlgcB+Yultk2PUgdb7IyB1KzCAXWnwPgEL+Kf?=
 =?us-ascii?Q?i4t/5Wew5bPCo9VETR67TT4nLzLFvFKoz+utTA95VaQ0Inohbyqmv8EVpMnp?=
 =?us-ascii?Q?4/zhK6Tf82j/1xdjCkyKhfC5gyafsJaU5RV9+OjzqtOpcpz+Pn12Qt16tE93?=
 =?us-ascii?Q?fniA1Xt4pIRBT59GSd+IYLx5NR3Y7sK69PKMiHKKGy3eXmMegjh66v+fSuiN?=
 =?us-ascii?Q?dPms2JTHtMLk7yGNTuxRETGh4Ka6tQyo4M3kJOwzmlLdit5FZD9b5cwfmodu?=
 =?us-ascii?Q?Qgscubm+5EyLeHwJGAUzWBa2jJ7m2+mChHRDH79rHIPQz+GJlSGfswyc5ntq?=
 =?us-ascii?Q?SGNB9LZKt3Aj+ylLQ0Sb2NCsXv6tyXoMbsXBKHotexxAI2oVv9TC/qqoF5Z0?=
 =?us-ascii?Q?i7j8XJaN6lpy3ZWZoci6zq+0G7B3g6z+ywuPK+K9mg6u9jgN8xTHgMsHg79b?=
 =?us-ascii?Q?YrkVyoUT3P8W9byvVYvMCc89sNEaJdvq9+JNK0BFS3qbFClzlKZko89TvEAq?=
 =?us-ascii?Q?TZDs0sS2YA5cr3gElHo/kdFwBEkNJwZz2Dmb3895H1hoji9+aKdzNjtod+pm?=
 =?us-ascii?Q?qjyG0ToGmGsXU3JthCbkLJNLrfyPR1ObA5jQO0UjuUvxKy8YUB/t/O0er9Xv?=
 =?us-ascii?Q?dwF7MlfAOa2JuS5rL3k8MrPrHEyz1sOp2rHU4ZYyZXrjAdm7iPlK6Lbl9qtU?=
 =?us-ascii?Q?woYdg8wl2ayp+tZmRlKIK9/Agt4bf+Cj1sJW9SBwScWFUBlB6GNml0mLsQGj?=
 =?us-ascii?Q?1NyaX19rfiputDw0DBuuHSqxxrakTuitIE3RlrRcyMMcnYH0il+uIsfETI7m?=
 =?us-ascii?Q?o4d4qo48XnXS7p2FlE08UcOSyCAGlEGMCDpDp0v0rpWxQOBoh2Mg7U3wbbN5?=
 =?us-ascii?Q?jZ4kSuzEYICV/CeqJE3vJfVBOpv1RcUaNG6N/K5fnF8sTRU1TOEWukvW3VtU?=
 =?us-ascii?Q?NKZq0Drgc++Nm/GSiJZxn/Dhce16S3Thu7Hg8ZwLUu/lBHBBN2WLHEWG5PJC?=
 =?us-ascii?Q?/NayTxIt8SJfNyaxnTUSONgWcEBBRLJlvDG1xGbaczA7O9bEZBzDiqpVeQwv?=
 =?us-ascii?Q?auqDVIOw4c0sPCCkCEpH538PnqPQOoIrJDBnIt4rr07z7XG/z7yGtF08lJS8?=
 =?us-ascii?Q?EkPeiozwwGjcIzESNdBs/ZcEnUsD1QO9sjyYaDl/MTtLWg+d8xGJv+B62o9n?=
 =?us-ascii?Q?w4T61w=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d59268b-c5e2-4f57-9f85-08d9df609704
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:40:19.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPMrj6439BJEtAfcbxUuLTrGI/AP5TNjSXzT0jnkzhQggGOAJdos4ypSxAdryxRJLf7EWiucqxVH1cBoJAy159xRO4oTa/m31Q6lIX5sPYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4316
Received-SPF: pass client-ip=40.107.7.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Graph modifications should be done in drained section. stream_prepare()
handler of block stream job call bdrv_set_backing_hd() without using
drained section and it's theoretically possible that some IO request
will interleave with graph modification and will use outdated pointers
to removed block nodes.

Some other callers use bdrv_set_backing_hd() not caring about drained
sections too. So it seems good to make a drained section exactly in
bdrv_set_backing_hd().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

We faced the following bug in our Rhel7-based downstream:
read request crashes because backing bs is NULL unexpectedly (honestly,
it crashes inside bdrv_is_allocated(), which is called during read and
it's a downstream-only code, but that doesn't make real sense).

In gdb I also see block-stream job in state
"refcnt = 0, status = JOB_STATUS_NULL", but it's still in jobs list.

So, I assume that backing file was disappeared exactly as final step of
block-stream job. And the problem is that this step should be done in
drained section, but seems that it isn't.

If we have a drained section, we'd wait for finish of read request
before removing the backing node.

I don't have a reproducer. I spent some time to write a test, but there
are problems that makes hard to use blkdebug's break-points: we have
drained section at block-stream start, and we do have drained section at
block-stream finish: bdrv_cor_filter_drop() called from stream_prepare()
does drained section (unlike bdrv_set_backing_hd()).

So, the fix is intuitive. I think, it's correct)

Note also, that alternative would be to make a drained section in
stream_prepare() and don't touch bdrv_set_backing_hd() function. But it
seems good to make a public graph-modification function more safe.

 block.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block.c b/block.c
index 7b3ce415d8..b54d59d1fa 100644
--- a/block.c
+++ b/block.c
@@ -3341,6 +3341,8 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     int ret;
     Transaction *tran = tran_new();
 
+    bdrv_drained_begin(bs);
+
     ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
     if (ret < 0) {
         goto out;
@@ -3350,6 +3352,8 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 out:
     tran_finalize(tran, ret);
 
+    bdrv_drained_end(bs);
+
     return ret;
 }
 
-- 
2.31.1


