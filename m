Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D63D0C6E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:29:52 +0200 (CEST)
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69U7-0003GM-7J
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697y-0008So-Me; Wed, 21 Jul 2021 06:06:59 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:11108 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697w-0002Gy-Ni; Wed, 21 Jul 2021 06:06:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxSJy9CECYlW6NRWfouD7+4r5xMcw9gNwDrOIG7fkHItndlPKWfVxhjkAZJhAFNOqxl/siXcnq0lkmHa4Tox4YA3XefdV1FPxjIZQDBT6yciTwskmEQooTvMrRFZbO0Rxg2p10XcAFhogz2bgDf9hz1TvdcIeODdWxUblwiyhU+4ZMufcgu+h6o2HIokZruqY11F6A/5NYs2CG0P0+eZKVlS+X+169xa1OhJ1Cs7ToM6H8wP7QzHXBeMzKTvGkpDi7QQuq+Wl+E+axdKMJ+sNdBO2WM6OA9umxQ/IqlBJdFJZTP9ZSeZAnk4DdPvSOH4R628Z9S9JzjMrhlpvaZarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=dIujbgtEnwk+ep+ny8Axu5ocEEzYLgNNyktJjiUmFRII5LVezM9uSu6eSElFTYwisID4g3+xCCZO85HITuVrrR4Uh644bWseCseLXrhHIIamYRN6EWQu+CTvhCXAU6lXx7WMikgAetAog721f6UU8QbsjosnMzGiyTRGsCQZGso/ZAO3qoHxu/lIU/vaK8CsVwdWRlw4BwvYtzx67upRvJY5idB82fSze2kokakxcb8I8eHtbcrtcFj7hyB69drgPAk5OELftyrqtWfshT4gS0M5ltQIfwk+ezZ64idadMGqIkfOeJWz+aGxxgu/4gQ7O5H4YZfJc1d5VDf8XT+yjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=ixsMcc8TqLhwikF9+JyHoaXQy97KyfdDsvFwCODImQVvtyXhdGGE56I9vZASwriBrEpvKbHYSvvjZ+S2wfIsDQlkqmpFkKAAbiHdiBngWpXfOPOTOvAqkQKurXMo10eFEeg3kQwdnyQshNURS1YmQpDaRN1gRQ4JcHjvbclG+zQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 27/33] iotests/222: constantly use single quotes for strings
Date: Wed, 21 Jul 2021 13:05:49 +0300
Message-Id: <20210721100555.45594-28-vsementsov@virtuozzo.com>
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
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99c94612-71f3-4780-5ec3-08d94c2f406e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5494842910FFF9E9B3D3CB33C1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKyBhYP4KVWywrXXqjQSQPw9mNBPNAfzn263F3uwEz4f/xySStVLNutxRQLUbOnXTlUfEHyW7UCPld6/bd+WYIjNcVffi0P16ch2sWqS3dSc8K0pK1boY5svB2QBIMmybVR3hJ1lSQLAWO+gCpgAwtpkXbrmisPSQrKHT9R33RcklkVDHyuloh5CVanJqpQQHX6ldIMgaHJ/DUwSt6Q7ggZhC4on0ea7qRYYFI0wlJUxlXC858hYyZvLlqjRkbh3Chv0CnrLDfDpXM5SuhIWRKhBa6UMzXDz/0z68kzOklJGqhEdDQfBzigz1GZQ+QiVL2yGgt59dc8GCFZqs2bv0xn9TcEUqNk86KykP2IBQvtoCZYrMu0SIyEbU675Nn4vkSW8KUWAH9zoimZL6knE8Nx1AGefegm5rGR5MjrNsvl+xnq16XeNB2YMH6A+x/cWx7B5IKIPto38+ZO+Xwtpkmvtdu3QMUs+mfYkuNfMBZPiirBlpzMK7Pu2yLY2ZV8MDFzCruSSLGY3US59Y2vfuVer9UuuiphQuTvtF5Pl0WXhMBk3MbeQ2ppFdKnAhHcQIaQEkyYjKi6Q1xeayjdGJcDzaMxhUCLEt61C8Ut4GhaalQauivM2Mz1DZSFq8cbrQGhYwu+wwTchc0+1Osicttvt5laNz7jRqlXgNcKxFE5BU/Vp9B/XJORGxwFtdads3zrA/VqZy7U0F1lLNTK1ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wKyDHP21D0ljL5fPnjdx5YlCnapbmFmm9pig0DybZVUPEpwERaQBalQ5nMaE?=
 =?us-ascii?Q?AFzS0ESBDbU73DaKqQXszXD4SArm2FzPQbpWGPP+KhbmlmVmMl0oKO8PdE7E?=
 =?us-ascii?Q?/+jnqujUTflE9dTZYr6fpHRLUJukMO14fELZQtn2hU2Ge6c4Yh0pyfUvIRXw?=
 =?us-ascii?Q?lh9kIMVL1nG/dOMAApREEhte8sWYa3QhmMfcNIKqrdbQ0oRpIuQ6wmagsVRN?=
 =?us-ascii?Q?2Q7OscgB7LME/D8wbFWzX5IW6GjBo4v8KpYOicwjGX9zL/4uoIPYsYpDehDm?=
 =?us-ascii?Q?j4vJEQidil+3ys7lHG9DZfl0Kp3IuSY8zkcGpjuf1+9zJpz33ct7LW045rob?=
 =?us-ascii?Q?kLZ17aNInGQMT6YHJCxjXabHw2gZU3V4S1IwwTPzVyX4UkyTDqwTSRDZ6aOn?=
 =?us-ascii?Q?axoic1cxwjvOS4tHZVkXhGYiAITHlJCeFqmWLRFBojlKG1FcBWy6qweTGK8C?=
 =?us-ascii?Q?xQb1PNWp1+GmiieRT0vj6B+rW9QNHImVN0Vx1tbosivV1kp5EBX95hUiFOM2?=
 =?us-ascii?Q?d6pTQe0xqeKVd5cQlSqTpUbh86bexDUjK74OXeyDZ9UNRQcNKlOkTmiHAL6E?=
 =?us-ascii?Q?/iBr8lhOWWn86flSls/IKcfHm+4DzDnAhWe9sQWP+w6LkMHP5M85Flbg08Qz?=
 =?us-ascii?Q?mVg/KVtT0TebiGtMJvFtHSZNWwm2shlCePA7IO4+78HmVo8t6RpxsaRlPn21?=
 =?us-ascii?Q?gcA52BaEOAr5r7OsQ6EKctxvU1BZ4xGClQhE4+ddlIaS8DUqzPyCq4r6vUnA?=
 =?us-ascii?Q?kHc6Hn515OPBz+jli9ylh8KcxNvXXOtCxWpzshl3d1s32no1l37BAq0WGjSP?=
 =?us-ascii?Q?lTdmO0GbdncPdU8+1twc2vzei3fzWrf6o9LGN9pz7HU0H2B/VKUJm5TytPho?=
 =?us-ascii?Q?HqNK0ilz6rd38JIRpImQt0XECo8GivRELDgJw+/AwbMIddYu3vstQ6rOR8t+?=
 =?us-ascii?Q?NoVBQYcLNXpm62DtdXDyZz2vuL3XQoYePdBEMJ2LMV9W610+Eg5LeqrRLFiV?=
 =?us-ascii?Q?144rNGUvoUr/9rAJgmTG9eQNNIDjcjJOJz3JWXSMoe/7e1QpFxKy1cIYIul0?=
 =?us-ascii?Q?mi4htvV44KFES9vyTCKCO2VkdDfuiyfJ0WV+k2lKNz/mHNi08LlH/O8ibBw+?=
 =?us-ascii?Q?xFpY8h+YNAtPniJat2V+eH6qKuO8kJO4wmi7al1n7ytfG4QiuryYV5mRHAoE?=
 =?us-ascii?Q?UdnPKS8c/qvPcOfnfq6jndag/nRSH4ZruN+xrPDQ6JUpcA4oNddu4ejjbGTF?=
 =?us-ascii?Q?dQ/ct44jyXumnSyA+iSj/vGlU2x5aU+PWXB8J4rCALWYt043twyRpqm5AvDa?=
 =?us-ascii?Q?IV8krn38Y1yzOmu9TxBeSlac?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c94612-71f3-4780-5ec3-08d94c2f406e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:47.8999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8u1HibiyLLtE0cmPnCbsLRnZJve3QC/7v0pjVEMG7K2qsz07/mIXflEnHUKDtmb1KLMCGcZVQxhnpxVOdjwAG9OrJ7PTr9lRJSItHQOno4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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


