Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8600398A48
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:18:34 +0200 (CEST)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQlV-0002Cj-EZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf4-0000GL-3t; Wed, 02 Jun 2021 09:11:54 -0400
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123]:34529 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQew-0003Gh-Dr; Wed, 02 Jun 2021 09:11:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BElmPumzn+1vtQ8Wz9fktrJGzI2TJ+cY1QnDQboS6QI5FLRU+x0lipzhhqynR6WVTcJgGhMLIv3LuDWSbUrPmjb3t7gneTxrveeutHXYN7dnTY8+ORzIavX7x2BIhA40G08ev9gaezPjA1Kd/vogZ/IibKL2+oLMkNnsrM8G3JVT8tdBo+c+h93WBI2oLxNFs+h6RvdT/0j6fo4p+Wur7sXCl5uNRUYbfk19H8i1wiTYFyjXz5knMYhUoNsZ77I1ZyrAzvrOGX03YiBLwDLvDVw4KZoMzork+avDEriUMhYKKVlIvRxAuTR/6rjcmGdhXKKjqgOqmPLA6IV63xOUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=ixT2WfqhgJdm9GXyG1gRpSRoxXahKpXv1/RrEFZ7EioQxQzeP6Dqvs4TwLgQ0iEEU+LLiX4zu1Wt+EeVzr1oit+o3z8xf1ShIJM0uufwwVcHvdB0WItcOHqEenIJhkP4lDyDixsDxk/0qcYPp0uSuiZubYJ/2FFY8Anted7ZSeBLVNHprNfTH8M5eU+50vklAU898tVadcMXwTTihz0SIESyvxWSj25qnV1sZiFuzRxDKfIL/iVOiH05R7gt+NxdmJI7/DtDgv8sMHySoRHXpCD9StZFWmwz5895wCRONLvwR2RyDAaYjKWB3aopAh3izWjefPdBjCDsVZJJf1yV8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=aToVi/D2OfaT+71EcIPx/QZ72iPrBlqSc7CxORAEijtKCW5I2AvGTRHCNdQNgb9mES5mmSdiy6tg2JJiGA9zZBT0YeVdw/KDqUQBbEqRIcDHMDr4gjNjoYtFwahKK0pT7Mw8AsV8Pg0yf6gvsis52UH/isbSmC2jK6uUO1998bA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 12/35] block/copy-before-write: relax permission
 requirements when no parents
Date: Wed,  2 Jun 2021 16:10:45 +0300
Message-Id: <20210602131108.74979-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b232765-1032-467d-bed8-08d925c7f74e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693AE9F28F49B0FC9F2A634C13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b3tiYcpvfI5RDF0gPDsVDA1f07BmnolN0+vy66O/1eb+fzZk+MOGUZZiwk7ivRk/TwtA58hl2b7+LoueE6ZYe5nwDh54XmagwjHfGWOHJSstSB2JnMo/rWwa9jgHgK+4HqnjW0359pl/xdfsjM3RaDrWCOGgaXNiFPDSdMC04pS22ZXQfoqQPg3iElNAGz+r+OtoC3CP6JXEivHmTLsjnP2+TrfWym+U21md9tffy4L0GAnq+yirj+kcE/Dff3Txbjbn6IQs9a0WAxkwC8xTdSFA4OlNXf6iePclhurbxrmkF6ER0XTKDHXrD/YcnQRpPcFISNNBB83TOFRnM8qMEWsvaAzb5g4TRjztWo6O4n4XiDU3Pz0SCGH3EU/jd+FaFLW3Su/J4LSQKteUbm/VGTQd4buL1HWQUG9maAOAAgbgWCfrtlNLuT3qolaOXV55gMfCTMKBETctqBsBbQweO+OUSdpREVPkt2Gima+WKHXWNKT2V/ZCHT/+RBLibe6grcM8nQEppKmTaGbZX0myomMpzCERhR4v7cL3i/cuPU42ERR+83wPkXwiPpE8nPI5RfQTPRzSWtYs3OygF2nwxDRK3BQLfxXizGl1Gj3d0K/RjhoPQvSlAK0z+KJMkbpcOQotCweV+MfS4/xd+xA/hm8weWXZIrwuEtLSsUxphP0I8upDW8/cr/MW70sq++OX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bn6gYoryRKTzmnk2ihDcVuKalFLfjK8AUvsfAaubErmY/sdquVdeZX9ZlE/X?=
 =?us-ascii?Q?KdBQnqiMuRokg/Z5RsVTladdmUuV5vO7Wk0ZwBzZWPD6jGTbCzdSSjlT5PeG?=
 =?us-ascii?Q?wM1FJ+SkzK9DLICWOyhTaT1JOPagUYVav+xJC/QwptMXncajZ+w/hTnC3rAs?=
 =?us-ascii?Q?68SO1+dwIOH6sFMzWzV9yJ4yV6Go1NK2I0BtHL4QNcnYXO4PLUHJdq3AFe8R?=
 =?us-ascii?Q?hpsWAql5ZeEe9wxNcJ+MSnHHTw26c4JRpnptAov0mYUg7gwzbmRQDNryRgsm?=
 =?us-ascii?Q?u009ViUNtH6g8xQRRNzYBHJgekew0/v6nNFGgwNbrZUiNnKw9I8kCL1rOpQi?=
 =?us-ascii?Q?W0YGPq7arfxv15K31hkbl/9cSwPjmwwYyuI12Zkx7hitFlijaMisK0X2L/wp?=
 =?us-ascii?Q?i1+BoKXfhPTo1Fv07NKQhLI43ybzNuSRDOXS343M+10cKcylxuKHONhsVbvt?=
 =?us-ascii?Q?9mV1Nb5w8hyxIO6rfU6rbH5YjhDrIrEopvYqOHuy5WBr5Z+n0Gjlo8HUUZUV?=
 =?us-ascii?Q?3o59eEXh0jKjPzAsHA3iVTUwgeO6cZ6dUS6Aa/TrqQmp4iT2i0cwmrI7yfEp?=
 =?us-ascii?Q?An1eGmZIVi4Gzl+XfbrzudKBvNv92oTKjP1O4bT9jA2vTKh2YjRdQKR+LhL9?=
 =?us-ascii?Q?b9VmPxmc9LIrkM+9x+yDMDEmCjyDMaH/tqLccvxRT3sSHTglmE0Ty/PY72iZ?=
 =?us-ascii?Q?b9LvzMFCwju2+lGhAt6gryhMOwhvBb4y4q0lU59hU/rELEd3qSdG43HbuPVZ?=
 =?us-ascii?Q?JBMaEwaEv/YtfH+ryDem177cl7cydJWcqEbWJr4LoihCfnCj5Bs/rcAWKB+L?=
 =?us-ascii?Q?/qKkkXG8GdP350yqPrQ6QHAoSkyOeC0xUjk3wHPEJ+7GV9orR2dWaJJIMN1v?=
 =?us-ascii?Q?FT05+oFDBSvl6IfHcz5OwhOnaF/uVBYbC+M/cGO4sN4PNVi0Xkv85uYQwqwH?=
 =?us-ascii?Q?b7koj9LCmi566cXhZ5x2ZC+yPP7VfyEVod7fU+NueeM9Cd+glOEi/yKppFd8?=
 =?us-ascii?Q?bN+g9zAZ4pOQGh8s0gjr3N/gO/TcGGQ08xps/CUrCF5bBdFIEDwGPz/dtXpv?=
 =?us-ascii?Q?tMzOTFaX1XyL4zIVtidRJc9ui3N/3C9h5Vl7qkCAuRlQYY3wIpJH7+pdf6zF?=
 =?us-ascii?Q?b9tq9YSf8wvZ35qZkyx+9Q5VRu4Fzm90hYmFvUF5AWwx2/chup4v07PiwHjn?=
 =?us-ascii?Q?aqpTU6dDaqr6YMe/5nhw5C7hGal7XmibJqpDh7zDtFtZDuz4eRZEnYeswGmS?=
 =?us-ascii?Q?iSqKscp2KrfaYFAn3yOX1ds6l8NBKsd+HmnzE1sumtHwb1TYkeTGmRnWtGUT?=
 =?us-ascii?Q?M+82ODTx39Fjo0woMbT/UjvA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b232765-1032-467d-bed8-08d925c7f74e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:42.8653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DTxBM+Kcmi8IArZUPvzPJlHlFT7GXdnlE1UWbjAhkhhbzAMDXDpjGqW1+/zGdxEbZvMvywN1yEUnj4Jjjz0/+pgZu05BiSnZvetaEqa6T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index f2b7219632..5bb75952ef 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === copy-before-write filter should be gone after job-finalize ===
 
-- 
2.29.2


