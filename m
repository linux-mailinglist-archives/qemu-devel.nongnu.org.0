Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E04638B1F1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:39:46 +0200 (CEST)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjpx-0000In-9q
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZx-0006Pr-GN; Thu, 20 May 2021 10:23:13 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:6738 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZv-0005se-Fv; Thu, 20 May 2021 10:23:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpE+VvvqQiuROhOUQz+NMDR8qS8D/y7UhZ5rR3QhCoGNyEPtng/0zsaaVpGVDkCtqv5FtGWFa4vAaXW3N+zfZjA9qntGXSN39HTsiR14fg9AAMoM36MzCoasdjFLt7XEf+0gsCAE4zKvfkMhA+h/qF7m8xlipkqSNhYVQsoRBFpOup4Sk0MM0IyahGBX1J6AebsrqoIj41zx+HI7FtqdxGJxM/k5j02OYx++YJoz1ftQwIvy57aTJ/SDJMn//J9lV69v/eOFCqpzPtM2t9mzsiui9/uM6lJ4edoLY7SnEFU6xHI+29JloPZ9MbHbweeRVZ8cy2f9ivsOYu9TrCbXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJxV4WU2wXEdkHVvm72koYegMn4aHd+CVc2XIYDBOM4=;
 b=morZ1YqBYK9xMnzOlfC7DCXkYQbLuZt37jq5K30PBPvmg5hIB9dx4V0L9AQJdQPHYZzBpRbQ7AX7oT6zChr3/U9MI+dkxgS6G4DIFx7ffqqK13fKdngMBSXEFz7QjSczILb9k496FkfynZuQO55Pndww3dtPF+V5zl1WcHesFhM6nJawV7y2f0jWGVUUXa95PDaRrIhpr8ReUAo5Svxh35HPlGf1llwwft8eXpUST1Hk/U0x5ewAkeihQ5SXWeYeKa5JBhAq4i2lejYfOcoF8mSMioIZPlRv9kQBxLcTxgt0HLXqksL3Jux3EweAf2Ejs14fuESjnXp0pxJggmR+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJxV4WU2wXEdkHVvm72koYegMn4aHd+CVc2XIYDBOM4=;
 b=kL8IQAoxthih9V8SDamwOCR/BjBP9GBZpFJ2YDQvwKbmPi42XJRDPOGEJah+Pr70cwcETt+Y8vcJq74qG5YZN0WVrF11FLmIMO06AcC97iDAzcxdfDovRUF40lW1xfoBGE+yMe6VDnmyIsP65couqOgyvwZP29EzZ0ngo/qoA5k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:23:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:23:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 26/33] iotests/222: fix pylint and mypy complains
Date: Thu, 20 May 2021 17:21:58 +0300
Message-Id: <20210520142205.607501-27-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e47eca3-d607-4220-d676-08d91b9ac560
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072D64D9F667927F33D3D2EC12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3C1Tnd/tn6oEZV79NZqyJaZDG3FuU0dNUSzUfmnQcwhG9eiT8bPOE4XisqmfE3peJXJ5VCezzopVYpKAmQXPf2QGOoq1Fb3JvcNIwOMSAfybUtlTfOttu4vxqD8QGDpgwpvz7gwy+DHVQEALmEcbQvIj+52x0mp1Qb6jXxFNL8AXU3ghdCEDftbpfT1cvXCfZa6K/I3huBUgxA/hrzuDWFR3GMfJ0dUTbGvQgnOJsHZFBXbObQU1pCuWUfgFkSa6vb4fRDi1d3tZnmVzkFmzFDbI+JacK3XzxcGd6SAOxX3s0JCtGWXfV4GAx3P9NBUxhJB2AhKN/IALNLHqzfa7azEb+bJzNAgXFiE9yQVv5aF3uwpiq9g7KD9fO+VHw9NkYOlKSntgzDnQGt/UwjXoXTBng6+bZ54zNL0jgIOiGGgJ9MDP3y/fg6O1SX/2V/Vo9fFP5EOiHdsFVLuBokSU0xtfXGOztjCJ4zg8O4phdtA2+bIFqb8FpPoVjBWVdgxrWm7Ad9BZDIiYefVwNM1lN78vva112Y0Dx3MO+yb4+9ugGgnV8PDvGGfahpuwOGnN9SkH9ictqSu8CssE3wS5016EcuCQAZCDe0mFXickXg7eaPIgWlksfo6bmnAK/AVVYLmxRF+jjDwO7fE/Bql7z+ti1rRtw6GimH49FvKcO6v1jmrSsx9T6bzviHGC2Lu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(38100700002)(478600001)(186003)(1076003)(38350700002)(2906002)(36756003)(4326008)(26005)(52116002)(6506007)(6486002)(66556008)(6512007)(66946007)(2616005)(66476007)(8676002)(16526019)(956004)(6916009)(8936002)(83380400001)(107886003)(86362001)(316002)(5660300002)(7416002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?j9+jLRt5sxuIhgjiYjxpqDTI711gPvvg2e/InuoJQblRhWGTV6QmT0fCAg1A?=
 =?us-ascii?Q?Y6X3SDMCbGkY8TXbB/avpXCNcq5iuP8ms8K2yAMQcF5kw3Ou4lFEpfl+eQZ7?=
 =?us-ascii?Q?gChBbHQhc0kgvK3ralHVrrWjyJWFAcgNI1YHxW3JNUaM6OWv3od3PBrXhiAF?=
 =?us-ascii?Q?YcKvJgkoT7ByzROCA+6uKeZVS5e7pqYdigavlAUk36L+hb9WFTxG3G7Tlqwf?=
 =?us-ascii?Q?J0tNEVV5MJu5r1oVRKWiY+9g3Z7rIgjV/zBr8AjbWC+sH4+NLI7nTaZg7XSo?=
 =?us-ascii?Q?TJ6kvmnNgzSbbqJlLong8pKQDh/Jgu0rDYvhxduiFc82T9WzS1urUS3t152r?=
 =?us-ascii?Q?sD3xGjdma9TX+8edBhVFML8xhBTFhJpS/HLdBmMTzjz2/Q3dnW0S1jD60xzT?=
 =?us-ascii?Q?0SJ4QYkiZAhx+/Q6Vg8nubqoPGXISZVxNut/FQW3gg8ZfRbbaeVndJMwE0ow?=
 =?us-ascii?Q?gl3K34it7gzuGZByE14M8g1wcUiB1GJi5s/EjGjruMcUcYHyoXUASVuIrqlG?=
 =?us-ascii?Q?pJ2p0HwAYeWk/DdHOkBPy9kMbpg2FDpqhGt2qsvk93v7EbyAEhy+IAo7eitC?=
 =?us-ascii?Q?RX7xJMd+atFuCcRYoVX04GmpBCvutVwCSMaAZrjif5vl5meeK9YvqIo89GjW?=
 =?us-ascii?Q?iMhdSroMtmZcDZ/lCPyzxk0BdqL9iI4N9eMfN9aaN5rCp2aABzUTgsXKMVKN?=
 =?us-ascii?Q?zN516/iE5pEm2udQ5RrfP+rOzj0JQauSrY9zbGhgHWHmb2U0gbo5/JH4Mr+P?=
 =?us-ascii?Q?9fYaU6MV158ZYiNcPtxtowH8iWcs+yDANelgLL0uMBcDV5kNhYq7FCIuW6D+?=
 =?us-ascii?Q?lWchW75/C6tvJ8bnEOzShyq+OVG6MCNiI+AJiRwX0Ge9SBlRtkF1ch+eDhbg?=
 =?us-ascii?Q?9auy7fnJtrJIfybLnTQNOFmaQSMOcNE7+/cY3h03RrtB5EnO4SzAT5vQvEPz?=
 =?us-ascii?Q?FuOi8z8+61fJu5sxRr+nv0hfEalitAQL8CED7Z2xVzJzEJsXXYZbG8yVBlaK?=
 =?us-ascii?Q?1UtDSHIAo7E8I7v2p4p7Q5/mHe85R5GX+XlZg8pHeQH3VS4uiGozCBuLHL73?=
 =?us-ascii?Q?VWqGmc2euKwgFZcBhgOg+chQLeXR8NR3J468RkIUc7hwjUlGSIMaAIgr5Mlb?=
 =?us-ascii?Q?GnR+5Vqji6MTV3nI9rw75f0dsxqHZ3wNiHHO63NaQdZj5n1IMK0NM7M6NmMn?=
 =?us-ascii?Q?1VqDacI3MV8njpEd8+O7bKBLlpwNOY1Jf5JhJkn/1BrFrCj2uiui78SglBCk?=
 =?us-ascii?Q?6e23HqLkkhXZnGAHQHqBfBfU6ybpqDRsrbFkHr4jV/mQxYPWYLSlYGzB4usd?=
 =?us-ascii?Q?eL4hIlxBynBb75ECtlCMKdoI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e47eca3-d607-4220-d676-08d91b9ac560
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:00.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tfut8uwKJTLTDnAX++k/lxxI7/XAmq4qjx4dtfIx3KcFbI7frjI9NuIknBu2v0Lr2R3mzMinbGhKXHvZts9GcYXhk2gB82nheyBoNrWOZhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.1.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Here:
 - long line
 - move to new interface of vm.qmp() (direct passing dict), to avoid
   mypy false-positive, as it thinks that unpacked dict is a positional
   argument.
 - extra parenthesis
 - handle event_wait possible None value

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/222 | 20 +++++++++++---------
 tests/qemu-iotests/297 |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index b48afe623e..5e2556f8df 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -50,7 +50,8 @@ remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
 
 with iotests.FilePath('base.img') as base_img_path, \
      iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock', base_dir=iotests.sock_dir) as nbd_sock_path, \
+     iotests.FilePath('nbd.sock',
+                      base_dir=iotests.sock_dir) as nbd_sock_path, \
      iotests.VM() as vm:
 
     log('--- Setting up images ---')
@@ -81,7 +82,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     tgt_node = "fleeceNode"
 
     # create tgt_node backed by src_node
-    log(vm.qmp("blockdev-add", **{
+    log(vm.qmp("blockdev-add", {
         "driver": "qcow2",
         "node-name": tgt_node,
         "file": {
@@ -103,8 +104,8 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     nbd_uri = 'nbd+unix:///%s?socket=%s' % (tgt_node, nbd_sock_path)
     log(vm.qmp("nbd-server-start",
-               **{"addr": { "type": "unix",
-                            "data": { "path": nbd_sock_path } } }))
+               {"addr": { "type": "unix",
+                          "data": { "path": nbd_sock_path } } }))
 
     log(vm.qmp("nbd-server-add", device=tgt_node))
 
@@ -112,7 +113,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Sanity Check ---')
     log('')
 
-    for p in (patterns + zeroes):
+    for p in patterns + zeroes:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -130,7 +131,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Verifying Data ---')
     log('')
 
-    for p in (patterns + zeroes):
+    for p in patterns + zeroes:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
@@ -140,8 +141,9 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     log(vm.qmp('block-job-cancel', device=src_node))
-    log(vm.event_wait('BLOCK_JOB_CANCELLED'),
-        filters=[iotests.filter_qmp_event])
+    e = vm.event_wait('BLOCK_JOB_CANCELLED')
+    assert e is not None
+    log(e, filters=[iotests.filter_qmp_event])
     log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tgt_node))
     vm.shutdown()
@@ -150,7 +152,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Confirming writes ---')
     log('')
 
-    for p in (overwrite + remainder):
+    for p in overwrite + remainder:
         cmd = "read -P%s %s %s" % p
         log(cmd)
         assert qemu_io_silent(base_img_path, '-c', cmd) == 0
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index a37910b42d..7cb8c531fd 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -31,7 +31,7 @@ SKIP_FILES = (
     '096', '118', '124', '132', '136', '139', '147', '148', '149',
     '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
     '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
-    '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
+    '218', '219', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
     '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
     '299', '302', '303', '304', '307',
-- 
2.29.2


