Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941443DFE7B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:57:19 +0200 (CEST)
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDeI-0005Xi-Ie
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMz-0005um-N7; Wed, 04 Aug 2021 05:39:25 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMx-0006MN-Rj; Wed, 04 Aug 2021 05:39:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+uWZHH+wjldYLOE9iGWSFNRVMTzgiVt2b1hCukl9VVWLriK6CNC4iWVhmHu+I5f17tiYEnk+4GAjJZcDY7t36drJUvtXxs5NI+lIjpUhWaiHsFKv/k9jEPlQqpjWcFOWAof0Xi/vasWcSkaR5szzBguSxF8CCkn2P8doNSgWiisEANSegOsuxOm9I6IIxTBF6ti/XR7n21F1y7koRMWDvYV20fzOnJu8Kl9GRfYBd/o37MHROZFsGX+KtRyowxHpkTrydD8U0v4JI/pB3yZeVtDb0D6c5b4pEhZ4wMP9iit9iQM7NmrUFsxVBu+TzjgK6VXPbUa/FyDlKKCn35obQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=f+aBZpbmULc//eB3ngGU3abe/C4Kxm1rON8e/p7o8Rnd8aY9AGac06UvhKwI7H9yuXBJLkVjwBblv3hQZduQqhqggQufgE8ATkn0fqggD2Mb41F4Y6P7+coPml63YkRZudryD2HMkEEY4PEWgwBJE4Ol5Gzz5OXO3P3V82LniUjW1PUH9jV6CHkJwaj9gJopWUqdJcAlLMXPnGuIsNe/yd3JMt9kUAghIxMMRFWSjS3gkmsWItpRUTlImcDd10UuRpkXTidiMssbrXHKVHzBJGWNV+RmKv9+tJcsEfrjp+dfhpIJHIfgwzcrO5hhapeY7ZrzI2tALD2/4l1BEJPbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=PMnItB7WPGBgWMePmjhPt6X5lL8dduG0dqHwTJ80BQByxRZT7aVfD/s+2jCYpLuHPBw9eh52mBIXjr+S4l2EQxeqSuyko62+/6HUMH5ixa8/tWtNu0IuaJY4vr7j3sIQsDOO91OUNwWZO4QKVFGQ61c4Hl+oKf2syD2GgYHrAtM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 26/33] iotests/222: fix pylint and mypy complains
Date: Wed,  4 Aug 2021 12:38:06 +0300
Message-Id: <20210804093813.20688-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8088ef83-74f4-437a-d8f9-08d9572bb8a1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46896CD01A67523935E40E2FC1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gr5gjOrQ50biz5qA0YOMVasJKl7nf2A2DzLRU6uwBvki6jy6ZKGp52aP5GXbrDnxBNN0yDO0k5uELENGK9adjwDo1mcSvMFfJ18gDKISM36Xyrhn24yXLvsw13mjnBEDxrCVP7DWLC9wYHYzMMiCvEbGeH8Fqcy0jF6aYZbTJkGr06aptobLlNR/gFIBHBB4CRMhgjGVROADiQHBYfJ1kY+spflL3HCwcGgLWbulAv+Roj3sYATADcrwFR9awesRqWZGPTWma45PG2J5TnuU+MhWemDI3Yemk45tl+qFRf6uxOnsJS46KjwRNkzRCuZ4gIw/bGg+Liuy5fdfqoYBQmPOif9nivjbAtCGr/5OLUEAw3FCqtuQxXgsYrUaUYm/b5oOwoUf7vZPC3HooDRwNu+BWKuI+pe9+Co1nIjklgbaG+T5oK9M0Rcb73t7CCmh5npwy2l7aErd84SpXa0we3GHLBhATbGxmbbLH7uYYF4ariEX3QLtIovEToafK5tvlhj7EGknm0OXZvXVJagapUo2IeH5W8UH6vMnrE46zcb0DWsdWdDaK81eG6Otm0lDFUKV1lmM7N6WavKh+FY38OFuSGzdD/+xeBqoRUHoguH8GMDgZKO9qQRXPrAhLSawot1GVomb3ht4j8RpSP+D0FGYNqjLYqdJOKF7OnEJNhUXUv+mdCoMUaAgz2Y+Ns9pWVgym1HIPTmdShOZadI1lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?527DXOTAXDD/g3RQ/1t9tZsRTm5YWn+XeVlZR8M+19aaiWcAsh2hsjiTnbcn?=
 =?us-ascii?Q?TUECoKQng3BDtKO3U3VyPppGPReKSMpqWJO0XtHQ90FC5r8dgUK4EZ4LY2+a?=
 =?us-ascii?Q?Ks2YUr2lmafivgoBGUtauOLmMNX4G9njrZi7UlRRdTzbNBZzugKC4YvNYwgv?=
 =?us-ascii?Q?UyiHp3y4KuVoE/TdKdC91hClTeVIg2LEtxB2v93/ApxvjxeyY6Fd6JxHqlAt?=
 =?us-ascii?Q?df7e2s3jLwGtOnUSop2WYbXZz23RpRVc58X7w3u8P2tsC2AmMIP71U1hRyvq?=
 =?us-ascii?Q?27BQ/FR6oHNSTo6/0MSwTc3TeAQtDWxjrRk0QGSWTo8EG1WbaEINB652aNfd?=
 =?us-ascii?Q?Qs0uG9pZ2uQ8By9Btb/Zg6BnXYtkaSpcVQhvUOtE6jt++Qo0N+nfNC5yy4qE?=
 =?us-ascii?Q?tdlw90QKnQdnrEDtNYKjD/U0oRScMXQnu+nln83VBid4wTh1IJDf3AEDWo/X?=
 =?us-ascii?Q?y9ygyMpI0gdCxzHco5b3VqJ54xWbKYUZsgkH7hmE/v/oeJ4O0kV9fUNf44iA?=
 =?us-ascii?Q?h1mXCmKYjzl/NY3KWugbkGP5MghH/9+mn0GCoBxPFRKVScIU4DGOrLtFd8b5?=
 =?us-ascii?Q?u37DDLM1xS4Y9YT/VZsI9/2ZNS+W8cGCNO0p6EtJrTooqt8IbklJ+5kZZPKn?=
 =?us-ascii?Q?a6ECHqoX/fZsG0+hIEJ1ZB0Ct7gEPEoPavQ64oKgxnw/ctKtQJIvFw0gZ8SM?=
 =?us-ascii?Q?fDXBwOWpdvwQSh+PR+jAYgWQv1w+YMp4Ri4P7XFpOLIoUbmqDkoIrLLbsSfe?=
 =?us-ascii?Q?+hXOgI0pJ3BJrjp+XOYaW6YKUnFfqJt/4I3z0NAiROds9V3aYFgo96b4zbLq?=
 =?us-ascii?Q?wabtPK8qBzonHH13izCOKFMaWWy+SYfJnRN546dzHW04iYIr11ihh4evfBzX?=
 =?us-ascii?Q?Dcfy+U2bXHUf+rO3bbkxIf7oyqC2Sx34I0mvLfb+anDewOxBdx0UzYE3k0AX?=
 =?us-ascii?Q?YaoiO4NSZT9CkKDcDGfETRkp28M7+s9aqWDt/ABoNCEhY3EQdb4kTwgJfql4?=
 =?us-ascii?Q?FHMaORraHXBx7r5S8MxieChEypoR/OOBXz83BdBlTTDjsD/UZg3KtrYMNsHn?=
 =?us-ascii?Q?D0qM4/woHVV0GruLI6EuK7qQ8EaEg4tyRzxRGqTHzjLQUvzPIsCoGBch4/Sb?=
 =?us-ascii?Q?WLnvRtAZ6BE35l1Lg9BT6vFLq66Son60gQJwFoKthNRp+a14uaKxJJtv/GiI?=
 =?us-ascii?Q?DT6Xf4KSHcCe2/INW+HZB8uN+qM5DJPLMpwmRTPK9tVajTmOvj1gneON8NNM?=
 =?us-ascii?Q?K0Qp1BFZhUw5isbulqqP7Z4dGI4joWgPA8mTNudENfaew17loFnxREgsCmWQ?=
 =?us-ascii?Q?m4bg+vnM5eV0u+2iodd4wZVg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8088ef83-74f4-437a-d8f9-08d9572bb8a1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:14.4193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fevzaZgSFp0tZkCk9edYJOAyZj8/Z6kSvawVYWZLSSi2beIAYi1PBKHC4nZvcE2UsaYKadrIZAokv9Z0C+0YjOzVUS1atB1O09g+Y+FtLAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
index 433b732336..345b617b34 100755
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


