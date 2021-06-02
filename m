Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E753F398A56
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:24:03 +0200 (CEST)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQqo-0008Gr-Ud
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfS-0001CV-AO; Wed, 02 Jun 2021 09:12:18 -0400
Received: from mail-eopbgr30117.outbound.protection.outlook.com
 ([40.107.3.117]:11330 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfO-0003Uo-S5; Wed, 02 Jun 2021 09:12:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErXrGdu7z+SWKOn98tV5TEKHHX+mqcpOM+gD85rtT2E7WZjg14qJJdlLPpgIoKC0QW76HYff3mZQpOQP+1djJ4AYxwtsIgzeN9PQttfK2bPOumcRni1ezEm/0yp/dxq2TsonAsI3IyQ9IJztbjiYpxuBYu4ZmfREWp98ImV+0tnE0woXAAVwu1/7CKlAAX81igyxMLUuHs7kBODYolMBDH+aou6U76ZYzMgZ8ob9ZqfjdJ2/oO7ZEhm7Qa7g+gimPGeZkMfPN5O8rznkdSXCwDt+938FQto1UUIHORSwzNLFD2OMIGiSbclCianHafmfSQc1Sthz8OaQmfWS9BpO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hThZmQm51Sm7nJEhS46GAn4Lu/YtWxwc3tRvkYElg0=;
 b=SdSx1jXbeDjVNEvBcgZC+ngjFccFers2xbTx1zsFi6tkm8dG7TeBvnlCSt9HuI2jUbUpK9HJPlxuva49cbHWtdrfQrSqzi73ql/iLd1HIfaQf8CcWIyC9yK2+w3PpUBqZ27P9wE/eRh7K5W1OT/8Q5g3EgCSuLYt72xgIIm/x/+ZknCUUl0B8PEShPQNE4ouNsunXCXUePq8biPqwCrac72O/fkLzYgMPpUs3w6PIttHB6ICCdMfcj7vRemqEPwKzcXU2JTc7iEw89RjaLPzQMKxwkNMRxLq++wNHg3OFk5YRZ4ws3BEyilE8i9BQje88WF2y15VSLgKORQUsGMh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hThZmQm51Sm7nJEhS46GAn4Lu/YtWxwc3tRvkYElg0=;
 b=AXSoX6W6iknnCwmGFvQ1t/xvl/U97emqNBIT3Nrr3FJDEwhGV3JEdhsWi31+P/AxZwOEA/KugOjlXyDag8f9DFBp03aZx0WT2qdmsoZkMIujKPpyNEYf7l8CbIhSn74u4EASsaGDWtnd+gn+xJ8D78rB7belZxEMVUn8r3VM/HU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 13:12:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 28/35] iotests/222: fix pylint and mypy complains
Date: Wed,  2 Jun 2021 16:11:01 +0300
Message-Id: <20210602131108.74979-29-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea1b61e-c1c0-4a88-86a9-08d925c804a1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45367A35EA9F688EECE757BDC13D9@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdl/z9vnmtzkBM0hKIPrWRebCRROM7fRek1tGGFYqJAYMlfQCHQElBw+TR4Si9uZCTiYx+6bRfXamHkZgPOa115G7ebEJFgdBpQZGGN40Wl+E0uIHgBin3vAn/jLVGZ1sC/stRoHPVfOv5PjvvGZSsRPmaMZpIAStOUzC2f9s1kawfDDSksZAfREfjqY7gYtdYnvTPOrEePK3+2VgQuo29UqjPosfJ3KjYgsmq+lOAB8DtV0U2d0AarAluBoRqNZusoKHWPSNFXZrEdgw1tphMhF9Ieiv5SJafDsViYdGR2CIeDDDs7PS0C7E4e6XEpe7OgC8BchE6dKUVKXvBVCQeWWJ71Ln7mNlffDNh1gGKbsu9/0JBKTuyb0sdkNhKsS5q4TygQos+B+hjbxYsaOO4MZJN/AuYjy1ydEJtF8pWDcMwGJmlgzXOVAUghOUGBDt+SS5hyt9rbw+apZy1jgvRiHeJa1VJWMo8wIwaugOHZKtkCd+rH8r8g36PpLIM96HOPFO8Lr1LmKjfe54BSbyXXeqGd6hJF+RI8oBkGgxYjkXyWN7krstUE/4i6W/ENW5n/17xUsm4zq9I7+b5XP57omATq8szN4/t9SALMwmyP02VhI7UistLe1buItja+cZDCUx/btXMpf3yxxny27LiK6ZK8ySaei0dwxP4G2+wc4b6jt2Eu/uq5ggot6n6M9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39840400004)(2906002)(36756003)(316002)(83380400001)(5660300002)(66556008)(1076003)(66476007)(6512007)(66946007)(52116002)(7416002)(956004)(8676002)(186003)(6916009)(6486002)(16526019)(6506007)(8936002)(38100700002)(38350700002)(6666004)(2616005)(86362001)(478600001)(4326008)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tXgqxM23odWfl/m8zkJ0I+zMGslgGBfkW36rCjY8NIoC8nAwTB2+wmwhbnud?=
 =?us-ascii?Q?5tgrJJ1Y6VJbldg9afw8Nb48JnWVuQElA0izRh1zWvee9PXMfjkvCUh60D41?=
 =?us-ascii?Q?1tEGQ1gwcHcQqytHlByfUGGyBDWTTxHR7qmiM56wjRg0OzrcTs5ddwdiMSiO?=
 =?us-ascii?Q?cBhe00kOGqo35U6ggtV6KAV/HpCbDPU2pBPiTkjo5vGUYIxcqer0YBTEBdI4?=
 =?us-ascii?Q?jaFMSPULn8iGiitfAjwU3xncTCmmbBQlRbeSDU/YqRt5LGoL1ORFuKHwRq0I?=
 =?us-ascii?Q?DP1nFVH0RH54nOKsffP1k2QhiyQFD70u+KY6g4T7bcLAZdM+10epmEDjuabH?=
 =?us-ascii?Q?ajQl74uZ3XhimQbaesyCfJ6Fab5f7HrR29fUAGJEMCxRkqlYK1vxEq7PjiE6?=
 =?us-ascii?Q?9XF0jxUGT4LVY74t7HJWoxPepST96lVVfqZwXcQQvopNhiN9/te4n7XlTp9o?=
 =?us-ascii?Q?/P3OSySlTcTivIH452KDrgPDw7GAvMbmRGCnI/3stMWgE5aYvPFgkKbcOE6n?=
 =?us-ascii?Q?tf5qpfJPNtvzFP+tXeexcQ6EJCWxld9OtKoNsDTQlaOxiab2d5FqnIxObFUi?=
 =?us-ascii?Q?uqDqEoQyhlPaFSli9si+RZlVw5I3VYOjcTcQdfRZnHjAjQD00YlVBORZt+5E?=
 =?us-ascii?Q?tmOqMqbxLLdjDl4J2piAp1Gtx4XhNJgA0tIZRAxhXeLCQ856ohKiCWD7i+KQ?=
 =?us-ascii?Q?+QVxf2x1hr7PxEAbwQNygW+LVt166MZKwqyG2iL4jvnQD1VFEfuGGgT9Ag3r?=
 =?us-ascii?Q?aX7TQ+l5SeDPPQe98oh2LjYKOtYuoYkGb+un6Ke2GiZZvMDLkCOgBhXOw2bj?=
 =?us-ascii?Q?cPbJxE5CIV1MrvSa468W/MaSm8gCAgR2J+xNRf6uZRUFB55RUq8U0aUvGSL4?=
 =?us-ascii?Q?BuxKTt0qO14YLc65QUanmuTd5vZ5g4dNBxyQIlGNA25mipW3Oe+3cE48K/IS?=
 =?us-ascii?Q?qzxsv80nA3d54Fj46piH4+WY49RR5ZXrEl+f3gJ8N5RJD9i5iZe5W9H11hYT?=
 =?us-ascii?Q?3jXvqFtGty15t+tUDu26wqPw4StLn7g+c8QHMMYpyJ0DqZEwuQ6NzIRDIBpu?=
 =?us-ascii?Q?M093O/CuScHyidmxbLz5OgeDayhoEcrYOWJyNOz1okugzRvQAk3oow5bCFkr?=
 =?us-ascii?Q?xr00Xx8c4lxE+1P16RL/fe1mnC3PzGudezpZFJzapH7mLL8p38gtTdh0YTOU?=
 =?us-ascii?Q?GZU3ZaH/zxEzx1Tsx+o+Jxsb4mtNmSYNpeqh6c4oxTeOj4BvoVXQcusslS/R?=
 =?us-ascii?Q?Uv5SG05IAuIap77+0CP7QCGJFTIsKOuiBuzSF8l//NGCjYU2OjwL4Zf6EHuw?=
 =?us-ascii?Q?56qYcmTTR+qrsVFjU90Em8L+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea1b61e-c1c0-4a88-86a9-08d925c804a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:05.2172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEMPnzSkdaWzc8obQDRIE4P5az8YGnQYwlzHEbI3ILLEjKGJe8oSlfJDg9KI1qUJZdzoPcQpiYfrXD3Cy8QaZbQP0Nr2OT1YUG45lKuJUcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.3.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Here:
 - long line
 - move to new interface of vm.qmp() (direct passing dict), to avoid
   mypy false-positive, as it thinks that unpacked dict is a positional
   argument.
 - extra parenthesis
 - handle event_wait possible None value

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
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


