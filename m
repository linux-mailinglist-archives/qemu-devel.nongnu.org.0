Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987B03A2ADB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:55:22 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJHN-0007sR-LV
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqq-0004YJ-Rv; Thu, 10 Jun 2021 07:27:56 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:47549 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqj-0004ZR-R3; Thu, 10 Jun 2021 07:27:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zhvdfox3GvIMUjf0hTT3zCBT8qrMr+1EeKvgi45EqBRSxwFj4Ofre7fRzfeerzWjJx6JRIyld5JtwnyEVWrXWPcAy1/LTbLJsAgdVJkJaLsaNVnvdV61QIBlEujcGETPWu5axuAMxs4kq/3X0Pvz/IEmxyd7v/IRxh7qwXwh90R2a+cLbiJhDCO7iIjmJtNDsVkPiv/9rnSBbWxJzb5DjHKnLj4QCfXA15hMalpq7OsTnsSRhLKY/9YW3p8fUUpsCKbKOya/QrdU9w2/EHZz1DphzuPHE32GtCOqcx2tL2ykavsxBRSwnNorQmG8NwpjS7K+wDpyM6geLmSnms8FHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=d4KL0Z2Q+uJpmNOUfKbdDoCRz9LxWOWhIJw8qdD3/vHtjGmfEyCPcgQRQOB7CQYM1GhwusxNC564bMiP9F/cRmNWjo4DS3H+9L9Fb1Jl9U0v7J1ZVji682OoWwdL8tQIZKXzC1UtBHaQxQMHRhBYMTuTRFwKW5FagvPRvaG3vDkU4y4RrOenrLHexWrrLOeyj5ONEobj/LVbUq1Jwgmuj0kR44jeheb76Eh76m+yuhgNQYh/fqt7sU3BklWfXPyfOFfemUhHARaoCdaQMuQW6pxT4ebEORRwUpgy0EFH/bgqPE/4ZhRx9/zsnqtQ+Gfe+C6yqq7tghDhN0IiGhtcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=j1eQQdkB0ppV5kJ6thhtbPGBm1EZHqgOGMRg4NGmfeSChvvbQwEBxUJVDQkNPuLA1p/LFfqxJCs/W8QDU6XD+C7JONIfUJgxb43MC7rSbXSEfcJ2XhcISnoNoV5GdGD+wn0/a3f/bf6pWujqEbiQ7YA+m2wVXqRMhk9YOfW+Rho=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:27:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 29/35] iotests/222: constantly use single quotes for strings
Date: Thu, 10 Jun 2021 14:26:12 +0300
Message-Id: <20210610112618.127378-30-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00bb2bcc-4df5-444c-c27c-08d92c02ac86
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62806E7ED7FE7187AC20A5D3C1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: twgzxQg+Pkz7WSgLCxjpNfplYG9Pe6TiGK/yulZo5lVaj1Ko2gmSpN/l4VtVJWZnEF04cvPPlDdSHn+z2IdziM/pzi3+NQolAFGlrK936SHaWilRYoxB6ZDRIEyxgRzRJyU+BoVR8iSEIvm/4opi8+6S6XZwRp8GjUntjd5sj/pvtO04rZVVoTpPN94qd4KFw9KMj8vO9jPccMG/BfjUkf6ysu8JZVX36dXRISbEjPNUz9D2KSz68UwqhgFKUUaABGn+uHlbxPXTeMHo0WQ+dSbaVQ65t4ko9obk3DP9vd1hNjHq8IhvsKvTwo+HaxFk5UDonr4oiJ1sHCrZ2qg5aHinrEUYLHYa/fBU2Ro5HchGFgBtM7/CwGJYPiTzUxHe6XRrBf9G4B6Wf7tVy5Uv+F6xAUa+sVFEvPZBOBYl5Kd0Rv6n6oYlRnONO4RCe0fv8Fqq9v/059in4v+P28tVoR3126aayv90mLUJFIplYSSPsJ71Zlkd6ub2TVoD5U99UKs4HmMBql0K5VFqYxnK/duff3T/51ebrQZrOrMIPzHruHcbsWCon8pvsbJjsgBu666eytiQ0QF+RisjKuy6TQE/2Pk2d+FFim7rT2t+VnoCJ13BHI50g+2uhf7VtZSEFOUaiOiBrMFYjT2OsRGagKAtlbwcUwP7QJe/Y4Ol1B4aglZHZovLzyIicZeSMG65
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K+bBwiQbJ9Hs4XuxUobYlLRMKDNY6bXN6TKdHJpndc4SKp1v1YR2TyBGHHoo?=
 =?us-ascii?Q?qgN+KWuYGn8g+chPlgekxslsHgM1DhkQTOrBBgQcTqLsnZKyTBr/OncsP9PB?=
 =?us-ascii?Q?gPq7XfJlD+oNcsnVfoFtv8Gy+/tQ/nfYWHjKWqFhtS2+hLwe/wwJ7NczYJRJ?=
 =?us-ascii?Q?pzG2rTWlj8X8dTTKSOjxl5LMxkwQfUTObPlMsZ+c2BkvVPCyPrLRLJ6etsJ1?=
 =?us-ascii?Q?DUY4KhmeUXa8NxwQbkryx1NMAcT6+khpE7NPyuGRmrAJ8Tgp2/M9VEp8BmzQ?=
 =?us-ascii?Q?yI+WvRKABYacnMMCoCGG2OrCiLabUcbg+mrInzNfQyCljV12sLwfXdSjZsOJ?=
 =?us-ascii?Q?rYZcwNH2C4/GZSKinAtMDC/DKDko8X/riQIH1qBEjmiHxCCABTIOU7jdTM9L?=
 =?us-ascii?Q?RZwF6gH7neF/k9YfhC0u6nMEIT3LGFUrqDnj6uG6e32QdRAtSalT9WURp6fG?=
 =?us-ascii?Q?D5mDgWVBAFsyWX3Ovi+ViVtBxcmMDBWmc9WJr6pH3AhPlUuguQZZoIGyzpUy?=
 =?us-ascii?Q?cG2DfRREPsTCzPYq899PC5bvs1OBFfmrT/sRdqco+xtCVaaZH0uWUW/gUjKv?=
 =?us-ascii?Q?6JNIGcVHAV4+z5SsXBaAztblTnE5IYvBKR5ylpEkVbrQvyZk/mk8LAan+F0D?=
 =?us-ascii?Q?g2zakjOp7rR99FIsVeASL9OknfvEnEZlL8sCt2ppQ6C+mBayjG/CQEt1JAdX?=
 =?us-ascii?Q?+pWU95ajP4EX4j0ikV1ctE3Ev4Jn6FugLJVPSTeL6XXpjXxwNxzvPb4DH0j/?=
 =?us-ascii?Q?0+Cpl3pqn+MZvCbv483NHsTBRCiN7gKGA+iGIhfM4DiF5FqzBRIdM1FOzyx/?=
 =?us-ascii?Q?qWVSQr5sXhH7G65AlMyrquhg//wYC5EVDN1DC239vSe0py6RwqGuZ1NFMNQa?=
 =?us-ascii?Q?rJu/MNdtIO6eQVHVunyV2GBXsLtOQ42/PM5lGRy0koaKrX923UX/fz8BuzO+?=
 =?us-ascii?Q?xDdfGdUxphqKTS0kltZ5CjEOpeIjOb7Ydf2hT+69iRl36REQNTo7VMCo/2dR?=
 =?us-ascii?Q?Mw6fR8xlleWuRMcjx8lHcWFAlMbpva3WFS1RjFd03SLA5OPLeGbHNB1moXD4?=
 =?us-ascii?Q?ZONCLui+MLz4O5bUgXGy2HXkgBjxwzlkwUkqdTs4Nflddl9Wr8sRZgaqMnHm?=
 =?us-ascii?Q?0HzINAm/2/Y81XhuQa1RpajKDoq+v77JH0vgiB0wj4oAw3aFRFZca32TjoMs?=
 =?us-ascii?Q?lIdCxP3Nwhd/8LwULbLSItPYMqvdkm0oYjtmPUeqNOiDe9rADWImyHPQtguO?=
 =?us-ascii?Q?k9QYAbycmGQH7MA+ymyu18hOixNDaXkTKSmnI26HOR9dPjGvNbclXL/QpryF?=
 =?us-ascii?Q?2D76lctlj7uoQjwFw9Ll0fTo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bb2bcc-4df5-444c-c27c-08d92c02ac86
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:04.7308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4bjW0qeuuuV3peKJpwT+KPaixp2Pyl0pnYdtRo51QtybEPQtnJwb/2bFHhRvlpjcVXqFUdGcdJr6IapsE3rXMtVHqO4S1rA+fcaDPInZuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

The file use both single and double quotes for strings. Let's be
consistent.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/222 | 68 +++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index 5e2556f8df..799369e290 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -30,23 +30,23 @@ iotests.script_initialize(
     supported_platforms=['linux'],
 )
 
-patterns = [("0x5d", "0",         "64k"),
-            ("0xd5", "1M",        "64k"),
-            ("0xdc", "32M",       "64k"),
-            ("0xcd", "0x3ff0000", "64k")]  # 64M - 64K
+patterns = [('0x5d', '0',         '64k'),
+            ('0xd5', '1M',        '64k'),
+            ('0xdc', '32M',       '64k'),
+            ('0xcd', '0x3ff0000', '64k')]  # 64M - 64K
 
-overwrite = [("0xab", "0",         "64k"), # Full overwrite
-             ("0xad", "0x00f8000", "64k"), # Partial-left (1M-32K)
-             ("0x1d", "0x2008000", "64k"), # Partial-right (32M+32K)
-             ("0xea", "0x3fe0000", "64k")] # Adjacent-left (64M - 128K)
+overwrite = [('0xab', '0',         '64k'), # Full overwrite
+             ('0xad', '0x00f8000', '64k'), # Partial-left (1M-32K)
+             ('0x1d', '0x2008000', '64k'), # Partial-right (32M+32K)
+             ('0xea', '0x3fe0000', '64k')] # Adjacent-left (64M - 128K)
 
-zeroes = [("0", "0x00f8000", "32k"), # Left-end of partial-left (1M-32K)
-          ("0", "0x2010000", "32k"), # Right-end of partial-right (32M+64K)
-          ("0", "0x3fe0000", "64k")] # overwrite[3]
+zeroes = [('0', '0x00f8000', '32k'), # Left-end of partial-left (1M-32K)
+          ('0', '0x2010000', '32k'), # Right-end of partial-right (32M+64K)
+          ('0', '0x3fe0000', '64k')] # overwrite[3]
 
-remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
-             ("0xdc", "32M",       "32k"), # Left-end of partial-right [2]
-             ("0xcd", "0x3ff0000", "64k")] # patterns[3]
+remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
+             ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
+             ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
 with iotests.FilePath('base.img') as base_img_path, \
      iotests.FilePath('fleece.img') as fleece_img_path, \
@@ -58,7 +58,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
-    assert qemu_img('create', '-f', "qcow2", fleece_img_path, '64M') == 0
+    assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
@@ -78,43 +78,43 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    src_node = "drive0"
-    tgt_node = "fleeceNode"
+    src_node = 'drive0'
+    tgt_node = 'fleeceNode'
 
     # create tgt_node backed by src_node
-    log(vm.qmp("blockdev-add", {
-        "driver": "qcow2",
-        "node-name": tgt_node,
-        "file": {
-            "driver": "file",
-            "filename": fleece_img_path,
+    log(vm.qmp('blockdev-add', {
+        'driver': 'qcow2',
+        'node-name': tgt_node,
+        'file': {
+            'driver': 'file',
+            'filename': fleece_img_path,
         },
-        "backing": src_node,
+        'backing': src_node,
     }))
 
     # Establish COW from source to fleecing node
-    log(vm.qmp("blockdev-backup",
+    log(vm.qmp('blockdev-backup',
                device=src_node,
                target=tgt_node,
-               sync="none"))
+               sync='none'))
 
     log('')
     log('--- Setting up NBD Export ---')
     log('')
 
     nbd_uri = 'nbd+unix:///%s?socket=%s' % (tgt_node, nbd_sock_path)
-    log(vm.qmp("nbd-server-start",
-               {"addr": { "type": "unix",
-                          "data": { "path": nbd_sock_path } } }))
+    log(vm.qmp('nbd-server-start',
+               {'addr': { 'type': 'unix',
+                          'data': { 'path': nbd_sock_path } } }))
 
-    log(vm.qmp("nbd-server-add", device=tgt_node))
+    log(vm.qmp('nbd-server-add', device=tgt_node))
 
     log('')
     log('--- Sanity Check ---')
     log('')
 
     for p in patterns + zeroes:
-        cmd = "read -P%s %s %s" % p
+        cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
 
@@ -123,7 +123,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     for p in overwrite:
-        cmd = "write -P%s %s %s" % p
+        cmd = 'write -P%s %s %s' % p
         log(cmd)
         log(vm.hmp_qemu_io(src_node, cmd))
 
@@ -132,7 +132,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     for p in patterns + zeroes:
-        cmd = "read -P%s %s %s" % p
+        cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
 
@@ -153,7 +153,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     for p in overwrite + remainder:
-        cmd = "read -P%s %s %s" % p
+        cmd = 'read -P%s %s %s' % p
         log(cmd)
         assert qemu_io_silent(base_img_path, '-c', cmd) == 0
 
-- 
2.29.2


