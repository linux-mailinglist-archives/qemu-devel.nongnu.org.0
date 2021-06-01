Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF23978E4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:16:18 +0200 (CEST)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo801-0004n8-QO
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c4-0003Qi-AL; Tue, 01 Jun 2021 12:51:32 -0400
Received: from mail-eopbgr130139.outbound.protection.outlook.com
 ([40.107.13.139]:37856 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7c0-0002Zc-NE; Tue, 01 Jun 2021 12:51:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCTPXXNt75dOo/xgC+5hMIVNeMhn5ncrPh5lR8q2a5qCOzBuPD+38wcdt8Xn+pQX1bc32zllk4YaDVJx+VRinJm0V8RTiwvqi4mgAW07Bx1q9zmXjUvHgh4Vgq0eBCVmOjMeXch1oo/xL6FkZQA/aug/nXVt380T3EA063yQxjQhB5356XmdQQBe+xEJ8e1VHEkxbgytide/1uf4VP0WikO7i0GJicAffpXq9uEA84QMRHwndybo114XvAQ9z3UuAbW+M3gwsVZRSrvxGTsqcA970ynpzbK++OFMNSAXvsljiElZIgMdgWTf0KWiweXhq/vnA3i47CF3G/U0Fn2MpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=TvvAy7h8GYFXCOar1hy8ltS+Yx0kCE61r0P0gUe0SM4yqQ2gR0SMnwMdHQx/sCRrJd17qwwq95GJqBU/I7yE1QDp819+igW+oFXIITyA7lCwrNVVAP61tBbUQdNHtIdkCZQMTn6T0gPUDmXxeAqzy0kw7ZDHKpUFBLHqjO9MDl89+Alwm2KrM/8Lauscf4C2mNl2d9OrGYy0AQa+g8uPfr2udTb0QWit+PoP0fcNGLRgK+odCjMJBHoBw15J8k1rOV0Uks/19U4QAP4FUOvJKY1mAqvSN/M2tu7GMm85MQ1fdHoPje0qGQEewIM9J6Z3PI4JFifaYUWIany4PLGeLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=Wi9ahhsTIL1QP/eWHuyNi7tHXjN8zRSisbxkq0cu0cOckxpTTbLFClHmd+3lyZuuXqZ+jnCktIuthygtXouwqUHq6Sbr7X4Zzwl9wz/2hf0fbNhQP7ye4erF0/7oMPjQ6rgWsPqur1I92yWtS/r1Kjwfsh+t1DWvPSm2RPSNbFA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3864.eurprd08.prod.outlook.com (2603:10a6:20b:8e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Tue, 1 Jun
 2021 16:51:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 29/35] iotests/222: constantly use single quotes for strings
Date: Tue,  1 Jun 2021 19:50:20 +0300
Message-Id: <20210601165026.326877-30-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf9fea97-9216-4ef7-fccd-08d9251d7c46
X-MS-TrafficTypeDiagnostic: AM6PR08MB3864:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3864129D2E91E82290281A87C13E9@AM6PR08MB3864.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ytilkzxz8ekfjG7CRZNCocH9NM64Gg7Yiut5dgoacYZ6RujNTYzQ/xN2hB02zdN24bJ8s5p3wePG1ysf5LBwP8/uOE16Yj1zIy1oloTKJHNhPnKOcu8rjNSWi/fef40dD3Wy3mInZmz8f9DTGTMGQRLMbXcpgBsrA/gpuQNsnuqzMuaD1NbdEnKsS1O76XOo32MsnrB4ccDQRFNX2RYZJ9nB9nkrDXE55yrSrjk4DvHZlMdkqPHPr2QKsRm73zZI5UsKR2NE2xWxN7K+Ku2Kknp72gJZlqhbFXEd4Km7bJ5SGeSIT05cFh/BvB3Ymo9jE2JXqkk3yEV/I61hrGrkNaYL6Frh9qJeFCDK4e+bdht6ftfdEkQL2ARdOyQ32ai8//g8b5Vdp969KUTsk674xIRqLHPRhkz4W2AhdtxHjGngdEbzPAUxH5PY1J/xDqRxylIhIfWJ5gz1R6raptOn4UpriIHHx44g9Ylj0knnoHWOPntg0dBRhAXGucbIBxmO7qowhAj8j8hsN5abNHnGI6iLh7W9EY/KbS3PLOD1M3mjcVsj0dPhwM4ObQBGofN+qhOocSksEAYN0FGYruVoSZPeTI85Q+5HHesacPusq7Yg9SxKFUTtCAfx+eO+NGSa+EUWUVzAnaVDHNf9PCEUMdCfm8OIO+H1+JwxJwD0LNYjqv6SjpIQslS+GzTEgYpq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39840400004)(5660300002)(86362001)(26005)(1076003)(8936002)(66556008)(6486002)(83380400001)(478600001)(36756003)(8676002)(2616005)(66476007)(6506007)(38350700002)(6512007)(6916009)(7416002)(52116002)(2906002)(16526019)(4326008)(186003)(316002)(66946007)(38100700002)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ccDddVnzcjQpoU1+ULmA/g1xF9V1+ANKNDCzUxkHciFRvf0LTYrYk2BXMBNQ?=
 =?us-ascii?Q?TNfZZ6cm5kmuG7CoYzh8Sw0vTfXNj4b7uPElzNRUJ64STaSGTBk+JKZW2pfn?=
 =?us-ascii?Q?BPihFCQ74jgS4w+2r29kHFdAzbIDOELLT48DSfSAz9iwaM3z9zhkbKaJgYNR?=
 =?us-ascii?Q?1JMfri9ZN12GbrmD1YU4AqSmsTnpqHfExIAT+yC8++km0tlm8zW2yCRLAS3t?=
 =?us-ascii?Q?hNRoiUCuv2ELU7BUbwvXylVMynd4dQs+nuFZKWrEMZuyt08fwiIgp4dQvxkw?=
 =?us-ascii?Q?2zKCBmXjcMofz9NyL9uyCf6azdoKqITolKk2hT4y2muG/6uYezo0DD8CioxR?=
 =?us-ascii?Q?w2774izt8xXj5qOIBM1n9ljNxGvsj0vQ3JvtkaOuR1lpRzkH/eTnPhqhgvPP?=
 =?us-ascii?Q?chVGNffjfvgmk9+LOEWrWbr2pNouUPwZ+0VW3yGNksFdS95mVHEemO3PQrEz?=
 =?us-ascii?Q?OqekBXYuYHkEyNaEN1I2GtDc2AbTeed0PkVE0pPxT7hdwNR3tq3ppLXYLOrq?=
 =?us-ascii?Q?nvIx+kOievyJJvkz6KnE/QMJ59+oVu7n18fep0WWe3MogEkZV1rOjRphDAH/?=
 =?us-ascii?Q?TGMw6ykkZdZArMMan2BOyYm9I789XsGaiaoL6Zlf0PzCFk+aigohiW+4t3kX?=
 =?us-ascii?Q?wIM0sKN8zLmJpqMnnXEoIw6NElVK/prWQWfX0BYsSfrFpaCN/52Cj9+arPgk?=
 =?us-ascii?Q?JOtgvunEUC4r66gyMhlU8JBtih/hUZrzuFAqqNERWDAcgR9wHbdtRPPvclUT?=
 =?us-ascii?Q?1oZLICqsH5oeeg7xFTX9cbkNVdz44kdVpwyqu0Xn/rIVp1AS9AUwJwIOGu/M?=
 =?us-ascii?Q?1VCBzw1vz5u0x8Tp7lmebJnqjwq/rWHvkpuJhBKubtFh927UdDqbO9j1G8au?=
 =?us-ascii?Q?dsVRNqWMfQPktFHhZMf6BxKRbt98aG3yIKeLSo3g2LjRscqBxASecFSdwvJy?=
 =?us-ascii?Q?akwuMr6M2CUPZKepYPvsGNsRc6lMGjXqkH5JGQee91aHok5aZygXB/Nd5WMO?=
 =?us-ascii?Q?XsR0sdo9cdHsnM8MCUiFYiGwKZyIPBiilvVuu0h+OupGNDKgAluB/rs0zyum?=
 =?us-ascii?Q?v6oSbRIHFH+oPaNwj8CTVPabkX+rymUUtWtG49rhtusAQLzW37Y2PDbtjOea?=
 =?us-ascii?Q?bpeqHOp7ovaS0QSknGrEReeDw9wK9Hd+kM23cyGV0kcXJEUxPWhaodIRsJmX?=
 =?us-ascii?Q?WDLm+bAo7LMKUOGe6R6zfaavcffalXQ5cRPzIwSLhGuLdPtg8j3nHmZ5766O?=
 =?us-ascii?Q?jlaBrF2MGx7dFo/ea9N5e4BZ/bgLwaCAj3I0pWlz623Y/bDmz6nHgXftLABI?=
 =?us-ascii?Q?JTqsOBY/VGnLnMZ6JT5HTuJY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9fea97-9216-4ef7-fccd-08d9251d7c46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:22.0535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrmoJO29uWWIjkDbaNAU55MQ+xHIIA+3Ha4cEr58i7knSLRm/pLm/VUT0Khqavjumm8U6iiSEaFgSBOVYEYAOdA3eXdIi8sw5ZQq2mbi+2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3864
Received-SPF: pass client-ip=40.107.13.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


