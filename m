Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE58398A74
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:29:33 +0200 (CEST)
Received: from localhost ([::1]:43722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQw8-0006jT-6h
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfV-0001Oh-J4; Wed, 02 Jun 2021 09:12:21 -0400
Received: from mail-eopbgr30117.outbound.protection.outlook.com
 ([40.107.3.117]:11330 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfT-0003Uo-3U; Wed, 02 Jun 2021 09:12:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHtamN/QzZkM9nYSfKfHv1uiMjdUpbmEdJ0qlv8VN8uu3jjrhTLRgpcdKwu0BOv7WnhC2aPgg7eHyd9gWZnFeZoL0aoCU6uG3lbBItAp88TKE2z51BKIfSQmUHK2o63RaXIfFI5BELiH8J1+UyrKZ7/d2GInE7kGvQtx0Cj2GQPBvmOny8kiuAAyyrCfD1ElvKojt+ldtZ/fYXsKGlvlh2fflzuKMdxpvEwvsxi9Ou5kJrXPkQGoOn4zHXTUuaMj5TftF5hX7861df+J1eQnaLutSo1e8nrefPYBDNVchvIId4FLSsUtvFLMmOGNZUqNSTNgMyM6Mv1DmY179+v/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=U8KxlpeQRkBRLh3w4VLJFIK4mMOFuk6Mhq8WKgY/smzKP2idvVEhp8H5tc7+9lHJIw1cDbQqdrtDO9lWWWmks8DklePFM+QNiEy0FfNQ+tNOz4WGv8cTPVW6fhoRpLqJ/YA4dx1vXjfBhJc3ap2cljY0zNC3FVum19Cu5PiZX2sgAmn6JapwqAvyYswiBMZa2K4O/CB1D6u59GiWtJz4kkxWoA9Deb1/kElifl+BR+EOl3l+Wx5AoFSTtlQ+3POSTySZLdxZkiWAiA1ej1S3z7CTyVdhXTOB2cmZDGXQ47zRG/NUr1KPtH+MnzrERLJSew7a1uk9Fb4wQWiH9iaWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=rHLKEdgSDMDAmPX4ptcw+mUrc7aVdGxiuub6PKN4LzysMwmn9AQPlKXCW4xxgJnLH2gvHAShz3cGOWSYvHgjJGXOHze9HBka6tx9a9BnBXAUbX2K9u1ua8rW8Bp6paOmN7OpFX5VHF+TjIYK44JZKEDTOCnxPA75ZPetZ6t1g30=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 13:12:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 29/35] iotests/222: constantly use single quotes for strings
Date: Wed,  2 Jun 2021 16:11:02 +0300
Message-Id: <20210602131108.74979-30-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea6996c-c685-4d51-abde-08d925c80576
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4536FA5DB97E41642E8BA65AC13D9@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ttv1mV+ScHl5Tf1i0LzCUiWLIvnc4jn0ErvGiBgnH1Oylpj9wK7QqiQg4VG0gSCdO3Pi6mAy9dxlbXNodAi7oxl7vuTKycbMxxota2b9eS0T4jtAFW5tog3xbuAldy8FULRsd0GzxOKSP0ZptiG/iRa0YTYXl2x5Cqm6Xkj2LTwRTCjJ6Eks91pESMNXr0N15+WxfI1xrx6Kg9+mIUD6bt+DdBAeyte4oNxuYE2VeaRl0SFlf+W0bhRNhwZcLSXGeGJ8oc8+K92CjhLg88tE5v3QjD890wbODyNVcKLafTEzBiFBSKADqTyPAlMrWEyIQQO2KozwLjQTPvwIMcVNrjAw4W9xBc6iUuATB2EOiuHJn7G+e9wZeP1BQ0Bu7DwWZPu1wS/f4cpS1vNCRqCbH2jhg2eNQBzCv6nwQQI+wGZmB6KeHMpJKI5DWHh6QKgKY0q6+I1upc5jYxecVbrq+nSfHP8rqt4u8nlYokCvnCxS0KW5YDorG+msoFowcnY1EGpmrJpFQ/vipWRf8S6+4bfYXe3KivwSUNKpzgAXm5+tMdAWTqlN0yq5xAbyrGiy4zD1AWQIlbXP3YNAyB93mdVtnYn15eTpIelhZkhAbeRu4znOvYOTOLWpQ6xjn/EFlpxhdy4kyd4Mo37YbPPEeV8DIHfXz5m5Y1bBl5DHCVw8fpNR4e24HCP4Hss+JfkH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39840400004)(2906002)(36756003)(316002)(83380400001)(5660300002)(66556008)(1076003)(66476007)(6512007)(66946007)(52116002)(7416002)(956004)(8676002)(186003)(6916009)(6486002)(16526019)(6506007)(8936002)(38100700002)(38350700002)(6666004)(2616005)(86362001)(478600001)(4326008)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jjekPH562FEAv1dVeFqG5jWS0ef2UCczRSuIDwdrz1VVD9COpLP6/R1QyoCp?=
 =?us-ascii?Q?YhHGWxcKy1gC6EkxSYLSmfP2ohgHACSSl+H7RAzGzbrSdVs6YmwTDIw6o7ZZ?=
 =?us-ascii?Q?CBNX51c4qDC4wHpdN0EoO7mmu6JYN0kd6YCIXw3lTZMuMnVyansx1RDJB98P?=
 =?us-ascii?Q?LKrLVLRJMnoZRXrXXi+Xh0VBP0TIeu4umkgINug/r3yrtqXtYF2X36CTY4Ad?=
 =?us-ascii?Q?xsGjpM2VdJD5cTiL41Sm5HmHwWseAHJx49Sgiz72HfEQz7mw+qn+w0ZHCbC0?=
 =?us-ascii?Q?Lws8rb6kXPvotTgarmZbR6ppv2ODSfZQk2PQXgllom+7VvZl3ROsCQ0x1Aer?=
 =?us-ascii?Q?2xMOijyr2oLmSgaX0vnqAwtkuIp/5jfuUlNkBGa1uypAHV6QmKs+CEW7t91A?=
 =?us-ascii?Q?krbS3kGa7N3kf3IKT50wjbth4Gv8eOWypSl5vDLl1cggd6Y8FsdXbKk9fsR4?=
 =?us-ascii?Q?87c3thpHt9xAvkP9ItYJKtfA3b+6K3capXzHJ1DZLtzwfGXvlkicXZHz6TwA?=
 =?us-ascii?Q?FNgDBIwpdsWWVPS54jCykL3MF5jU4+bLNGRMZSpCyIPIG/uc8L/jj1HRPoW/?=
 =?us-ascii?Q?/Lyf/QtpWm4QDURwXojQOK7nm5flSeEcQA+pVFBHCbmy52tmOmDuj4kq0D0e?=
 =?us-ascii?Q?wvcmRRfHIJ5sdfgx+IiA2wckahOA5eyMR2Gjn/uILUCxpg/lGB9yQZDldNpg?=
 =?us-ascii?Q?Vg3YMCfYeNQlXyf/0VxT2lq6K1cCOh7Mxo7kQ14GO1S8DpXrd3O1uzUtT3Iv?=
 =?us-ascii?Q?nOGxOVFwMJLJdwRPwKk0qPuexZgRNtdzysRdl0aIbx2LcJZj6wqBmPvlf1iB?=
 =?us-ascii?Q?Auzy5uObF5LQjzQq5+8Xdio7IzrQsB1L0v6iyIeTtwOC16IeaYwoyjFay93N?=
 =?us-ascii?Q?swop5bo44aIs5/mqDjH9pOUSMabrVr1M8Z43Siqt7CQeNqA8jYFe4IOcMKQ1?=
 =?us-ascii?Q?Bqj3kj0Z4mplTv99itKlKSgBA0Ki1GwE7lhISdPK5RvTHsl4oaEkszXpIsoZ?=
 =?us-ascii?Q?lSmGFzUB4x3fO1y/TsKiLeBuZH+c56/WMI4sIFLGm7c2MuT4LuU+V1q6R4ef?=
 =?us-ascii?Q?LT0VUtarx11OkZIOHK4ArErtl7YwbmWE8JAlrBWuz1heLRFi1T+9I849Jl3L?=
 =?us-ascii?Q?UgG7d2+6YqpY/TjKQd/yVriKw3VCoyErbjgw3B53YfJCvSGEHHriMIO210+G?=
 =?us-ascii?Q?gi5rSwD9HmQ/chKHRgiL0uoR0JYr9AGZgdiYs05NY8S2GC+y+27nFpSSt50e?=
 =?us-ascii?Q?iOw+cdgNCLh1JnOH9ycqnWny1JV/2N2g/9ADewKm6Tg46wZXeS51yVC+abjc?=
 =?us-ascii?Q?0Tn0laP5mgGTXnsNM8khJ+cq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea6996c-c685-4d51-abde-08d925c80576
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:06.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCZL6SJsmdxGr1HPHUBXnB0D/8AFTuVVg+YNxL0v6itTG2YoDkHf0JMmqqTQW31sl9/eJsPftNmHM7KYF5R1QZYjQMdFwdA13/nacviAwoI=
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


