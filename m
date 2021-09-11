Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A63407660
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 14:04:43 +0200 (CEST)
Received: from localhost ([::1]:35468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP1kQ-0000Dy-N5
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 08:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mP1gj-0006e7-Tq; Sat, 11 Sep 2021 08:00:53 -0400
Received: from mail-eopbgr80135.outbound.protection.outlook.com
 ([40.107.8.135]:45662 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mP1gi-0000VH-5i; Sat, 11 Sep 2021 08:00:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niS8wcxjrGpNQX4pq4iKXOKafHw5VDB2Xd2MRF0sv9AFdmg4MOpwKQrpCfT8zH/Rroq/RScx3eOQA6HbuN1wuqAM2UwqBrdhjtIcJlvL6OP+e17udkUAXTSuX56+xGEYNIb0ncPu/sBV+F/rC7j0HtIRc+fn1nyYtqHCqA+bQVOUz2tNoDUXHuF2dct1aSMrLPE45DbwegvdHQX0p2KELtv4ATNg5iaO1tH+tNiIERjlCLNo4X0SQhHzIiAuXfy6JQswKIDchDQChDSq3oQwYdwP5JJcJchd8PKJJZtPwLYvhEewVjseKMFFiMg22qTOj19N9aAx2URZvs8OiSViXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3JOP63yx3eEMP7oqIZUEymxyZcLv9oC4LGY9XPzXSY=;
 b=b47AFIBe71j2ANEfhR66ube3FAv12hfMssHs3BU1WdH1ZmQozliyWw11BnBa0s6brPbuMMQ9irDD5fWlAGQ08zc1My7cBPfTeLYf100tVoO4prb5ymR1aRHEvmBn4PlX4vJZVU5o6wFNWOx5mmAvHY0myEPeAgV5W2cACqmnqPFe4g6EB4qBXgYbV2+cy/uoKYcjKS1s3MrFjwfhC8hcAc745nDZoZOYRGYpq0shtPshrvCeOcVaKsNd5H2zsm/QwPWzlvq5vmfrZcAB5X+UBciewC6zVcHeZw1SHy+N3qlMWWyXL6zYMoGotcGxFWFam5x5nNMuFLrCIeTby6DosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3JOP63yx3eEMP7oqIZUEymxyZcLv9oC4LGY9XPzXSY=;
 b=pHQ9jH6YUC3AF+w2S/fZujN6p+a/3V7MGenjawzIr/pt2lrAln4iGkLX6DvOfhv7GYnsQoEFpTn6E6Je7N655/J8knjgt5gzycApw+D3vj6ETjpLLwmPPLbHAoTQ32KLh+I49idymThTIt2BphmFah9ICpdg40f5RJBKyfeZKsw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 11 Sep
 2021 12:00:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.018; Sat, 11 Sep 2021
 12:00:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v2 2/2] block: bdrv_inactivate_recurse(): check for
 permissions and fix crash
Date: Sat, 11 Sep 2021 15:00:27 +0300
Message-Id: <20210911120027.8063-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210911120027.8063-1-vsementsov@virtuozzo.com>
References: <20210911120027.8063-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Sat, 11 Sep 2021 12:00:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cda059ba-45e9-49ac-ed36-08d9751bc797
X-MS-TrafficTypeDiagnostic: AM6PR08MB5080:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5080E0DD6C5BF2A19B32C570C1D79@AM6PR08MB5080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ii5tETBFPUg+VT3WQZ/n3xHzSrhOLEw9IotNl6EtmbXHtDcnJB/Xm59j/BY9WSeH9WX+wlhNaxv527cAGfSXuT0+B4FR2yYF8kE56AdAqqzsKAc9Kku3U9M4VrJsiF/jf1pwzfV8OO0u2zWZJz1+3rlU0ugH9ztkdkCaHZf8tKcAQGPoL9AUQL5zE0L5zCGwGnW48hD8N6H284z6NIDuDrpmYlVc3650/O1MlGjnKefprhF8Wb0pv1fEVU5DUS5qtrVJiRQ/vKdD9pZEYg5j22ZTvHfYN4nJViUysd69JxMmVxSmjHDfDpp70zi3y8NgMNsN3THkKOiKrryZVakwCE6YchRinLAXuYW6vGcfYilkfcENKN52g42uYLb/7UzuUqFd+DWoBHlyNb9CZldxSS7VkLiwlsRHFYKE0jZ/Nsba6QqVctgIDHFUKQ6z2jUsqkcJfBob+Ow6MkvpK07L9rX8gm9ces6HvYwGwqccs5cqUpzG9IihbcWcLWkGF1iS5JyWypdUw/Mb3s/euSNSAi0NW9pvzXKPlaLLkDCkn7wGHcQnoO/r2oNE6vZAT3hI2zmV/d9MIfXZ1kmbufkpNprnm8i50KbgBUt3ckQs4tI1BAQBvp6eJrsa7kcHpQbTUk35xCZskVItOwvm0I64E3HBYbNQ3SQ7FofhHz6emzi7+wCNI4ViRaNvc6vZVzpOM31xqavkMyFOhX6oZAsylg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(6506007)(38350700002)(4326008)(6666004)(478600001)(6512007)(1076003)(83380400001)(2906002)(6916009)(66556008)(38100700002)(8676002)(316002)(107886003)(66946007)(2616005)(6486002)(36756003)(86362001)(52116002)(66476007)(8936002)(186003)(5660300002)(956004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3GIh9o+qPfQQ0xxUOuV4s0huuqJQ3B9ms11BOxf9ydT8+FpLjvvwGCNTdEa1?=
 =?us-ascii?Q?j70Li+goTFsLuoUNlw4SOoQs3LzG7NCkL5Rwe95S6JaCUFb6bXwr1reiRrf/?=
 =?us-ascii?Q?StOs2BuQezdlzOVd9z5aUnDSzqwFpngKKw+pTZ0GkDsV8d+aZdPQNlOV+XFp?=
 =?us-ascii?Q?uL/Auhz1dKgpZqpzg6NWkSNx5EHtRLKkAzYjiZSrIrtGm660zQNI7RIMiN9Y?=
 =?us-ascii?Q?9Ab/W/WCUjKKb1mVGPv1jbhAjUJ2bcG8gOzeEc0vaeLOO8Irvqsy4lExFOR3?=
 =?us-ascii?Q?WNOUgKt+CTgeOu6mHGty7hQIxEDO4oIh94N8cnYB8huCETc+xZ6cut6TbvSl?=
 =?us-ascii?Q?dt0i52ljYICfahw0JObwVviyuc1VFl8RVr6adG+mbt252rb/ifRlIn7fCNus?=
 =?us-ascii?Q?480DQQ+4d1q9K35KKlPeRvQBVSZEeRyRM1s+ISYhKSgvyXmjYJFmo1SSOQ9h?=
 =?us-ascii?Q?en8ZBH++F1tzmKNTPpzf2XBZOjGw9WeK7kqI6oLOfJ4eH008mtIhEIY8iCIe?=
 =?us-ascii?Q?pcgjlZvPmjD4PwfZUP2wXESUjYy/llUnh1N3CYCR3kd1dLoWmdyLfa/Sajz0?=
 =?us-ascii?Q?UwALPcGiVmsPCn4+Iv/nX9okhbZ6aBtk7aJ3luKKjrkNQWVNuVYWqW3xnfn8?=
 =?us-ascii?Q?cZaDVQbKsTCjU+jM/8JBqXdlWKClQjfB2ge9LKuW1kzifXs+LQSsyTqb1tUQ?=
 =?us-ascii?Q?OUFLSC6A/uR1dVsA1xfEfvZGogWYQ/asRgOhjMmgFIUSlcsNOx3qAcf1c2HK?=
 =?us-ascii?Q?uAJQN4CuOOFcsEpuNpIc34QjUIKZRRBg7FB8LHA9OJRSERTdpqeGvQo55Vet?=
 =?us-ascii?Q?5MmfEeLMtdrdYXHc83gyNH6k/6aCKHniYRZEzNQiB1vDKPEpZWSMQVCh2958?=
 =?us-ascii?Q?zvMGgQygWozSN+LUYkPmGSbl9R86EqpxB7+TOdvFenLamp+VcPF9leMCqsO9?=
 =?us-ascii?Q?zY7VokjRVGHmC9fzqE/g35Jk9l6M2oWGYoqV4s1KUNjZ5u7xcBKn7mVCm3DT?=
 =?us-ascii?Q?z+1GjDYKpVf2e97SxXBx/jyMoLuWbXgmNDYRHslLytNM804lh+NOgKRf6o/E?=
 =?us-ascii?Q?Fe9UBOYSKon6U3klHR+aYE8Vpm2kvyUmqXPoc7SNKVIRWw8xDCTX4EYzPICh?=
 =?us-ascii?Q?DYTBC5YhhaqLkOOKwkL9U+B/BrwOiOPNP2L335NBDIXJbEkLF/N9x7FhWuH3?=
 =?us-ascii?Q?wkeYNQQ1bpWbb0/hBNMHTL6JU999xSB3CC52wGHrdTyVEYHJwAxZhOV6gMck?=
 =?us-ascii?Q?gwHF4dOzL+FTUzJz74jS5t1e05BuamTS8k1hpVdP0O6G5qYDdDKa+mygPscb?=
 =?us-ascii?Q?BENevzdGhOra/7azXwyFf3ll?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda059ba-45e9-49ac-ed36-08d9751bc797
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2021 12:00:42.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCe3JBqTfmST7h7joTwPOINJi6c3Nm+r9NBuA+YCO8ap5OFS+0TA+2i0w86tLNWfd0qL3PdJGvgWo95+SH6dtSYjLzQgtQ/DB9XES+sNHHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Received-SPF: pass client-ip=40.107.8.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

We must not inactivate child when parent has write permissions on
it.

Calling .bdrv_inactivate() doesn't help: actually only qcow2 has this
handler and it is used to flush caches, not for permission
manipulations.

So, let's simply check cumulative parent permissions before
inactivating the node.

This commit fixes a crash when we do migration during backup: prior to
the commit nothing prevents all nodes inactivation at migration finish
and following backup write to the target crashes on assertion
"assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
bdrv_co_write_req_prepare().

After the commit, we rely on the fact that copy-before-write filter
keeps write permission on target node to be able to write to it. So
inactivation fails and migration fails as expected.

Corresponding test now passes, so, enable it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c                                        | 8 ++++++++
 tests/qemu-iotests/tests/migrate-during-backup | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index b2b66263f9..ceb2b66afc 100644
--- a/block.c
+++ b/block.c
@@ -6319,6 +6319,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
 {
     BdrvChild *child, *parent;
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
 
     if (!bs->drv) {
         return -ENOMEDIUM;
@@ -6349,6 +6350,13 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
         }
     }
 
+    bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                             &cumulative_shared_perms);
+    if (cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
+        /* Our inactive parents still need write access. Inactivation failed. */
+        return -EPERM;
+    }
+
     bs->open_flags |= BDRV_O_INACTIVE;
 
     /*
diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
index 1046904c5a..34103229ee 100755
--- a/tests/qemu-iotests/tests/migrate-during-backup
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# group: migration disabled
+# group: migration
 #
 # Copyright (c) 2021 Virtuozzo International GmbH
 #
-- 
2.29.2


