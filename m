Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C0A3D0C6D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:29:42 +0200 (CEST)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Tx-0002cq-8M
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697a-0007RM-D9; Wed, 21 Jul 2021 06:06:35 -0400
Received: from mail-he1eur04on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::713]:41470
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697X-00020J-1L; Wed, 21 Jul 2021 06:06:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENHU/8Bw4UqaDfXmxNZnXQxluAoYMOea59Dv79D7/erd+Q5dzgxnjAKN8Aj+7w56ii44hNy3gFtaiaTRHmNFSi5JqBYjYxDtiEH9Yoy1nTaMlLNTELHLHRk3WruUkZLHAOuWczR2Qd4n8QMPPWJsNC62lOM2tNyVuALaq2bEdk8/sB5Lu2/JxhFvyBB5rnz46z3kmX2ZqGhfDNyLvo3LKx16lUD4ycCR2Y5XnXHfTGcE2GGWfYEygyUoSjkPBSjVcVq8Iqdlq59v7itLX2velRf8j6WlZs58By1N9IMTiUqC9o+g0AXhv/qs2o/4YFBW2O1jYmbBQjfSBjJnZu8Ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=mHiuuChNyScllb8wVRPO6RCZwMjfVAFg4/rN5z6rkU6/iaChKoP4shpIL9L8O/DMjETA+t0HS4FnoA+sKrZx9bc9HFC/f5YYYfUdenrceDAG3hLgZVIljKI5kGHhm6SDeAvjIPEnLjgp3KXxP/wlGyd3SeA7A9f7PEpFOiIH6bgeYyLVm1sLRKJDi67nWYRrjG1kRMOjeYqwBC5NgDrLMCc2bFXCulzsKeOmpWRJYYQpSXZd/Fjsk0+YqTNwXdmodQulJJKcADvC2HEYsRXmdr51nkjS/Aduyd+4q3ybgOr39o4ZDG2KUikNmqH5LgJwyI9mFQ0Lsl17dT4Jstxs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bInQE/uHeOJXFSRvTK95+xxJ8i89selJqzUmDfHwl4k=;
 b=RRSbGlngNNQBl5/VXzJz3439GArCMOlpREhx0LO2CJgbntp0fucf46097gDe9hQ9G2gYAIhjb+vA0RSLrHGub98Z0/bXoYgGKnkZ69JdBRZsSBE/G1efffOGXHOOYy8wTexpSNFxVF4AKKs2P0BRvn+WSAWvTFVAhgDQcMX+0hE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 10:06:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 10/33] block/copy-before-write: relax permission
 requirements when no parents
Date: Wed, 21 Jul 2021 13:05:32 +0300
Message-Id: <20210721100555.45594-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 603c2272-3e85-4f1a-3124-08d94c2f31ff
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4724A0E07ACBFA70F0AD3105C1E39@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +OdxJq+YhQ3QBQF/aiiUkQQpW/O+JZfCO7WkLWnV36atZw5AxMNUdha8M3vCljPZWiQGByhdRLb1nmskk2u+t0I1kz6MOBamO/dn0Zjhy6dzchMRC232B7DLu9O2Os9mGP2sR9W1Yjw5YSde6nhKZxx3Kswuze4m8H9OY4I9cQjDvYy3VZF/7s0+uVm+QwcTkqgXXhm94lZHSQ4El9IuiFPTeyBVyN8KeGlXH2hD2RRL4FAfyzyhzCngD0J/kiLapxg4jqLgo35IZkj3RntQ6wz/HAHsKQc5aFXDesD+Mnq0PW7CEcUvQcGz8uvCmveHkmK9AnuhVIsgnPllalRfAFbcCbOpGGyz5XpGAHB6ZYs9fuH6NyqH97g3OkkXvb3yCBZqP3wJv7O9ui0Aka/G9p6rVbV9aFZXGh1nofWcFucyGlGHpijGeJkJhp4Tx7RGYmwQmYhB8zex1BFIKMlSgX89luLnFsWhw4JXrJ3+3DmGckMSutnRrj4fd0cAhM6V/3zT+YARDkpjq2sLgqGzCAAg1LXuyhNKsEYd96mUFzjWgFi61QUKObpoCXkAZtWTQQE6p0kMtEAqKGbbFBpLQwr2xvcaIHPyjCV7CoaR+I8iNFTknlJlJAK4h2dO08q0S8rvsWhk1WyofE2BvDIdFgcezHeO/DqdLXEqhaYi7DY/Nz6zzvQuI9rAeKplhGp0tHYD4L+tpQH1VqUYHJZEBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(136003)(346002)(396003)(186003)(6486002)(6506007)(8676002)(52116002)(956004)(316002)(86362001)(2616005)(6512007)(83380400001)(5660300002)(478600001)(8936002)(38100700002)(66946007)(66556008)(6666004)(38350700002)(66476007)(2906002)(6916009)(26005)(7416002)(4326008)(36756003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BXYpSqPeBCn40r8r+aXulw7h/49rtUuo/OTfNXO7qdt+jedoummhEMi3Y91Q?=
 =?us-ascii?Q?68lnv1s9w+Ik3vHYOIz9kQrfSw77rS2wc7otysvSyy/BJVLwKbdSec5CxUDp?=
 =?us-ascii?Q?YOJZF/7RfMWco/xH8m7D5h5/guZ+Ipii/sQO9Y91+o5XAP+tVkEsFHRHXnn/?=
 =?us-ascii?Q?Hsxir5xh4I5HeR02AACj4+24ao5JVoSp3oe0VTzgTAmeFCyd9qdAJ3Err5PI?=
 =?us-ascii?Q?L8ugqD4vCwbvvLHllGFLW5bpHPC8IyNHoCb6UjgZugjgGd5dltiMwmrvchQL?=
 =?us-ascii?Q?IKJ8Apcw/Of34bOpBRB4VYtDk7Y6DmPLNh6qFSC+FFj3Rd0TnRO1n2N4fmca?=
 =?us-ascii?Q?qVFQcLCWkkS6lqDbaDoBwqJ1gCTz6CZgtJ+EHQvfozEyCfrckrhz6yQDugQN?=
 =?us-ascii?Q?cxvOuQXjwH6bTvQoXPVWsFLKbrFlbkf33x5RhqfaURU/XKc1FCDw/Q6CeDsM?=
 =?us-ascii?Q?Y3atZ5jci9psIo1Blz0PX6VNeGCf1ERy+Jp0p7DEqtOEWLaQowIszwgQIcEX?=
 =?us-ascii?Q?vrdqZ6DhKOMV6+t6yln9AJWhUM1JErThiFVLy+4Z6FCT8qnxH768nN7Z9wMa?=
 =?us-ascii?Q?N2c3/sQYDYMFRzcxnO6AJ/kTODJJUFa6j1g7kWvxC03g7R112hDlEs6DYu2/?=
 =?us-ascii?Q?kCVMol8fiM+BjKThyCwwNC91PgXOiSpVJboBbGTYGDnhh1N1FVvCLSUhV6zZ?=
 =?us-ascii?Q?SuJnW/2yhQbq3KBeAJAYP9uKWtvF5rxVo70HXHI2Hrz/FoY22VyC8LKA7hyB?=
 =?us-ascii?Q?PFtjX5j90DQDaAlXwzr+/4KG9qWSto56G2oGDIvM0FaGmJ8N+ZinjDlM1Aha?=
 =?us-ascii?Q?YD+REFRE7aT6WvrBja/zMlzcBoa7I7Y8A5oSmZUSRmEi/pAx7bJIiOPDMogc?=
 =?us-ascii?Q?a70lJno7/ytbVzWN6HFfNjcR5sZ/+RbUzRUk+xx1qQ3SrODd9cwUPfLf0aX7?=
 =?us-ascii?Q?xb0QTNnrirjdcqfcYOMWEgd1+skL+ZwrHQw5yLu/U97lmH/UYsVnO6VFlV4/?=
 =?us-ascii?Q?Q533mue5WXtYwrWttWN4cHk2pn70eTM3P88qaiyZQ23UJLQGBxRY0g+GonPd?=
 =?us-ascii?Q?LMlI1tJGgLgFkMZhqpFcZC84TQAaJD0FliJKlIOHoHjYs1fjMYvHKuWETyHO?=
 =?us-ascii?Q?u92d8Rso5MDCAe1bOZ50pjpgZgrf/DBInyQdoCZ2UvN+Z/1eAA48LHe1SkYI?=
 =?us-ascii?Q?PsEgx4ANjuvaUAskpsqYgL8zn/nmOm6FXoSSjPXVg5e7sgynE3KsuVY9GYQD?=
 =?us-ascii?Q?NVPFcfOw/mbAt06JxrDtDEihRSTDlYanJER15Xiyf854WjzU9w1aCef/lJKi?=
 =?us-ascii?Q?PoQ82bsuMwZTgoKpt3g6Jf5b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603c2272-3e85-4f1a-3124-08d94c2f31ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:23.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/0kUzI7wWa5PVNxqybJBjJPB1jbXtaqxjPMskISTvmTWdUIe/B+E0WXnyIHZuFwRYlmwSP8YZ6euDJ9P+fcONfgzlIkPXMGP1dgGm8Szjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=2a01:111:f400:fe0d::713;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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


