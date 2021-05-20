Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEF38B1B2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:28:14 +0200 (CEST)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjen-0007Wl-AW
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZm-0005qc-RR; Thu, 20 May 2021 10:23:04 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:8320 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZe-0005ij-I3; Thu, 20 May 2021 10:23:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3BHxCTY+pAE/rjX1Kgpgfm72MucrENZpeiMjQQ9UAVyIKvoLuzV+xWeJbenmG38sytnwbXTxjD8t6Za1C2XAyuEIR2JWnmrsAHFHzjbio6dpx01MM0nezpiuCslJ3z12E7TAtI/h/hFc2brCYfA1gn9RMIrAzF0tqmTdtlcu+wi7Lk0LlyfjxRmqsUyDhrzuQUzgTwTh7GYNW1kM/p8dOd8Ubpftq0r7PGdKfEqboOlJjx9DoZ4pHzFBC+zdDZDeqa7HO9dzKqNJDiRRMN2dLEhQ//k/2YFQipCTvplWZCwPYgRyfkt5R1OQ25sHw3QlDUsObxp0VU3bmKCCnn0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFZ2N8HbuZD1E5/sueLbbBtUq4xdCLJaWlsPftjA7no=;
 b=dQuoDXhu/MRzd/5J+Y4r5m51gIWNX61Am3mcN6uVVoq35weWQt4i+LvKrbawIVDCUFtvONGBeGI1rzhiWRxJW2mhgrh4iR9+1SAngxkxYqWaM6Lyh14yoki4/NLZh4qAWMj4gm7KmNYkPHSJYWxA7MalRAJgmNIPDTdaWDzB3UaZE+RIHfomEQTR/nb1U52fhPfCQLe2VTyGFKoaAG/PppCqGBA9WtwqHqozWQn3UlRjUTwi0EVED7jHr76XW9evklRbhAhb+jXjB9bxD0Ddy7nkCIn6JBdCAzg08IVcgQ9kjTqDilu3TWkkQfu075gi3HMLZg4hK1ecROJdkYNVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFZ2N8HbuZD1E5/sueLbbBtUq4xdCLJaWlsPftjA7no=;
 b=R3DsTEb4QvtdQC+m4jNEuoiWbXuTRFiH0RZ9tJu8VU1t6XdcgEcsvvvAnKRWjoTNUHkNYh/QcCf+TALvucDuBDbbvCwDCkU6UxXWzXDiYIkN/UZqdV2BFr86e04HYNJ8XgTg9u2zopA+r6vrYd9UHXlzY6u1iBvgfjLVpDmd4Vw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 11/33] block/copy-before-write: relax permission
 requirements when no parents
Date: Thu, 20 May 2021 17:21:43 +0300
Message-Id: <20210520142205.607501-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd68a64-dbea-4f34-14ac-08d91b9ab84f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354409ED95090A9C4BCC7FB5C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Em3VFMXvcuc49C/Ixstyx9I+BSe32uoQ9J5dVsZY5I7hz5JT+KMI24SqeXZU7csClcxvH/XO/2JDlFQcCOVBN5IuX0XCmmE8ppDDJC+hvM7cRiBGUuYh/cOW+w/HS1uPU+yOtGNwVc7BF10j8b/g9Iy3Itrh+SKLlHvUdPFzRZH4Ju6yMMLpcmr7KK7K/u0hglg7dsCvS6wNQLIPP1VlwDufy8NVjWt0VA5KVwU5ewMBlh2r24sI2z0EVLHV7Iqikk+06Os6lvcEYrX+FElPwVW1kDg2chCcE7ZBsr0LU5EsMHABsB85bfwjK8uZxy2WngYn4R2/hVRrLcZMj6/p8GJflhphgFrnq8ZXSggVvsU7tmvo1tlLsgJuwE3MaEOR5hJ7CREPNHIBBxxmh51Q8LSg3BuNyjog7VHAQnbhKx261tyUMjYUtC4itZpj/o1KmrxUQY7qnyYCRDx48RE8MQQR4FckhydK/wZGj1Q6KUbu6WzdFnomR8NG/dHIMTRHsECYaEsYi+br73FHyxLg3psUjGP9aODNnstvPmIf17Rw/DCGXOjbvh/92KDDWFTnuy1dGizjw+ai279SWvRtW03x3E4qxXelSpOGVnu7Gltd3iZBKJZTdWglZkD5eoBAfYomRGqXGOvzSteUGdFPLR4WTJHPAOdXO+9MOckrMXwidJPfVrSZHyX70coiUpO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(6666004)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?68G5Wb9clwyRdbwoNCUFKOHetPhLJ9TIvGIGsybjJg1NKmdCMv2edkWj8h/j?=
 =?us-ascii?Q?7hmcoxggjRT1qkgpK/KEhKqPo2pzpLuux4pD2i6vw4qw22CTn/6h/r8TltmP?=
 =?us-ascii?Q?sdOSjE8HQgZLGkwwWBSBsfSk/DCsQ8IPSAhbVhzQdvoUS7OudeeFT1I1DXwg?=
 =?us-ascii?Q?WLLioEmeVt2NjGJ2e1H+ZMBfOfPgpyVM/pFO1PV8TFALjTdlFJDEqFQp7BJ6?=
 =?us-ascii?Q?2b8c6Gql3xKjxUldvc5zQbQIYlCWUHSNjuXSjMsED4MwniwUbqqy1Z5f6KoK?=
 =?us-ascii?Q?wgg/zQV+vaYDx497S/Y9nKRXi4LXPeeYcDcV7JLT0t+SR6/8KlSeUNW5C/jp?=
 =?us-ascii?Q?oE8Jg5+9qm0aMKihBZGV5STqtm6jusytaqMEYd6Grk1zHFdNcIpFfSz/kmOX?=
 =?us-ascii?Q?DncreeVANPh/uQ6wCUnd4eHaJr2M+zlHJMSXim7mnJNPZkHZ3vx4NLt0LaH8?=
 =?us-ascii?Q?rKYJTSH5RvmKQ0s2Ug+lFX4ZQNWcmAGKmA+4Qg8Zjv3kZsStK/6ci46ThOLu?=
 =?us-ascii?Q?Wnj/LwA7xTqWNgDKfnJ92LT4X1coS5sewtN5hD7UcZF0BUuYVB5trbNOES1T?=
 =?us-ascii?Q?GFo5D7Y0BteK9ry0JwkTaoCQmlR6su5LQ7G3zdPPBvGrp9kJoceuN4ZHCXh/?=
 =?us-ascii?Q?Fb/rN0Tx05byQj4US7GP/mZrr4atVl5pmjh4M7cMAPAXk9jveg4bMnvbVlnz?=
 =?us-ascii?Q?sbbFjIwaym0YYfCtAUWJ2CZoeiUTw+JSE8f2hS/iZvfC+bGNV4By5mwG4Z8q?=
 =?us-ascii?Q?sIlNdDvG8sNa0sCCp7lMN6s6mhrGtOlcjLDUq/m6SngILgWGAo//FUhXM+9g?=
 =?us-ascii?Q?x69rXkCjqAiBKIqVbAXpzKs4yryBsIMp7qxjKfqn727sBFIOeZ7Wi9pGvkkx?=
 =?us-ascii?Q?h6HMFfG8qd0ZTZlaFrMAqDDD/hZ3t0NwjY9/glE5AEILC9f50dflsA9OMx4G?=
 =?us-ascii?Q?EzunGGtTKphwoU/X1rEU0QKn+M+cu689C5KRS+k/65NB+eTtygimmgYNzrtD?=
 =?us-ascii?Q?OJCAHoJ2/I7Kl29xk9rk5pm/loSMiuXO6fnH6PYxfrBPdaN668Zd+f5MHUFp?=
 =?us-ascii?Q?m65QVKZ2ieVJHyfG+zBpFhy9zEMqE1OxtWVc6knaD4yOk0pScp11QEIOs0Jk?=
 =?us-ascii?Q?nM9TqENZ0RRv8YmHWxgdkgY7oQYutEqw4+Qu9U0KUDqQ8ZXauPHuXANiqdhT?=
 =?us-ascii?Q?6duhnQWGb7G38p0hDLC+0KVkzzyG7Vv0ENB341moe13Ua7SMs7FEA+CtnoOz?=
 =?us-ascii?Q?Kt40qvc0SuebHw38XLkaCFnOrkUGWA5EyRYzyf5NIwH3jJ9mVLrkMeHzzcfG?=
 =?us-ascii?Q?6yfSOBzkZVMwmHt0+E2fESrL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd68a64-dbea-4f34-14ac-08d91b9ab84f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:38.2073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCZBDrMsq2wdlNFsgY63uzipcEVX4rR9h7IBZn1uOHAUWhN8sdvWha7JJ2Cmd+wrFScuEsBUJFT80Kfe2E6CN5B3MoTHiVfGFHj45ccpZSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We are going to publish copy-before-write filter. So, user should be
able to create it with blockdev-add first, specifying both filtered and
target children. And then do blockdev-reopen, to actually insert the
filter where needed.

Currently, filter unshares write permission unconditionally on source
node. It's good, but it will not allow to do blockdev-add. So, let's
relax restrictions when filter doesn't have any parent.

Test output is modified, as now permission conflict happens only when
job creates a blk parent for filter node.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c  | 8 +++++---
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a7996d54db..2a51cc64e4 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -142,10 +142,12 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
         bdrv_default_perms(bs, c, role, reopen_queue,
                            perm, shared, nperm, nshared);
 
-        if (perm & BLK_PERM_WRITE) {
-            *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+        if (!QLIST_EMPTY(&bs->parents)) {
+            if (perm & BLK_PERM_WRITE) {
+                *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
+            }
+            *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
         }
-        *nshared &= ~(BLK_PERM_WRITE | BLK_PERM_RESIZE);
     }
 }
 
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index e08f807dab..d5350ce7a7 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === copy-before-write filter should be gone after job-finalize ===
 
-- 
2.29.2


