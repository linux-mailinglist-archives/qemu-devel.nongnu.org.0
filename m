Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBCB38B222
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:45:22 +0200 (CEST)
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjvN-000371-QN
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljja0-0006Z6-E8; Thu, 20 May 2021 10:23:16 -0400
Received: from mail-eopbgr10092.outbound.protection.outlook.com
 ([40.107.1.92]:6738 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZy-0005se-B4; Thu, 20 May 2021 10:23:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqkOoq+Z6GaNgWy3NixElAd5X2ZMMz5+TIWpwdHQ9/yZAJNO7hhHNq5wURfbC3ozC/9pv+JWT3HywLB2Lgeq98u2VLi2eyrbOP2lHkZpgX2Syu0US4eTbh7PwLWFwNTQIy1fRd3xMpnaoZzmQ0841tjw+ihz+xjcIKLtSpb3ytJLmf80qiMrw1CgJOjj5E4XQLdN3GDkST9wnNwWrtJ14SaqTGwzZx7vLDpZTYUdku+AJwMWWmGZ9U1HfM4QduduLde8x/pM5tTtDnj0c0GeEzsTjfA4gIEVpnStfUXcFd7EkdhMJSRbX6dZCOskfUTA84IkGxCT0mt853qwwEDxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUjsfgYFLc/ZRc1eg2TVpgHPZi4LHvF/o+fq4jaekYg=;
 b=SQDdVVOW1iwuuj1tZWGfUiPoF9Y1S333CGl+92Qy9cn5or0h+d2KRC5sWNWd366px1ZV1+Mol+GqIBPgBOuGDQX8+gmJYKNuj+ZLnY8q7d+VHw3bToFZglWnM6DTnPFDrUfuBHAlY4e8Dau/YlgZ/8FEwor1Qc31iNbdIz3GlydE4uHo+W1RqODL4wQmxuKon2yMgZ5C6Fosc1k3hvN6zwM+Gy4+xjtweaZH8G6Wx11CWB5bEt/0iax5635d1z6FPDIW1zV/NXYJVum7T6rfebvxbXk93ThBaZj4Pyx0QlZXCxeq2Nkv0Aea1L7a0TiDp/2CfqMmaw7cHpG8+TdiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUjsfgYFLc/ZRc1eg2TVpgHPZi4LHvF/o+fq4jaekYg=;
 b=pTrgCuVsi61mRBY4tfvq7iN2N73EveNSvApbE79SinvN0z2jnVwNaNMuYneZXooz2orwsvlbo0PjPRM0fSHC9a468VxYczF9lmkraOaY06rm9M5Yj5AvZ6GrKQsUSvjim3ddsCzh6e8q2W8EJFeuWMNCdEeoAlTFSH7mtDfIb5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 20 May
 2021 14:23:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:23:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 27/33] iotests/222: constantly use single quotes for strings
Date: Thu, 20 May 2021 17:21:59 +0300
Message-Id: <20210520142205.607501-28-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38de5771-54aa-42c8-6382-08d91b9ac63a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB407299B8E9BA99F309403320C12A9@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAW4Jaf2V7mLHPTlqNfvEoUxsOn8avC79OfpLAu2poMGaAv5cVQ8XBol1bOw2AfDEUwEQFjeyDtZgJWka3C/YI94/QxL55hVReb0LCiW2ZKaUprZNCAWxV6lvXWJd1HceZsU/rOfzA3drh1eIBUR6xQhrM1Z/INa8sGjMl95km0EgTVJoMmlXgEeUxvmcTbxyXZ127ijHHDaeGQBB8dlDTVEpYW/G3+vjqH0TBD7oc3bI4yHp5ZqytU3CT5liDa7AKt5k4UiRs2KvylB1rTnwZHq+Iqsg9tMJRRvKm5AGRTQgkF6a3cKo0dWUnjavtrikeUsqcXqM/pJbf4IEW45I562Sr7a0dQ4g4/xGQCBUW1Ic71zn6XYyXzIb66JEx1uIlgcOfnyVe+eFGtOHWp6+GZALfNFupRut50tyvlUokBt3FEf9m/v0CYXeBgGk7Xi6pJGIQJPmbeYMWqT048IjISeAdGYryg5NwgpouF3hMsJsQkfXG43R+Q1h5lVzTh09DQpeuG+NJCe+LDrnK47E6RedxQMYALJSxbiVAfNEp+tte0hr0CLK4ECxul+X3+yBnUznvppX6PeLCRsey8sdJaz5jH5azdAZIjfqSVkN1lTCjC6gR/1bj2pZNVSUYyge+3Hm6mtUP6qoQ2rpNh86ImMA0cOpU/BFSQnMMQCAa6admbjJP6BNKTR6M70HMAc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(38100700002)(478600001)(186003)(1076003)(38350700002)(2906002)(36756003)(4326008)(26005)(52116002)(6506007)(6486002)(66556008)(6512007)(66946007)(2616005)(66476007)(8676002)(16526019)(956004)(6916009)(8936002)(83380400001)(107886003)(86362001)(316002)(5660300002)(7416002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rBGOTQKg16LIuqDc/P6UYDSVwYEELayexulwESNunnsiNqcsdKV+9oa1uVQ/?=
 =?us-ascii?Q?J+M3RTv9V3atA4oE09cajsBqgRA2D2YCf23JkUKXrgASW/2o9UAWowDx5V0b?=
 =?us-ascii?Q?Fot7VHisQF787w81nOceZWhBnyajDtAXZQV4Ekp61VpexhgrxoxGvjiY4JSj?=
 =?us-ascii?Q?cWZuya31Tz9jCAy1MKmJyQNAhpLVycDFmp4tlGkITzibYdb6mwn6VLUVqXFy?=
 =?us-ascii?Q?p68VmFrtqWWae1WO6lwuTiq6JCoHz7tgXWGO/2g2RuAl1hrXTB7hgQWG7qW7?=
 =?us-ascii?Q?WLguJ/0+Y4hsv8hjwBnISACYl90p0bv5lIGVtVxcn3YBTAJWsIT6DQdvuQ/G?=
 =?us-ascii?Q?3g4aOiU+FAKRveTmdHMF9O95vQH35/rKjrtRZsWHwtXCmn1BoWqEDHzvuzRV?=
 =?us-ascii?Q?AGxTn1y0bB1/eSayV/2D/44Ml8WQg82xtbUu5+7Y8rjlgXtjlD59Jb6HxZeH?=
 =?us-ascii?Q?BINelDwAtQOw7UsNhSvDSl6S6WKCpdwwwlHZBYLXG0/Xj2psIQlEnn3EEevi?=
 =?us-ascii?Q?xhVn8VLnaI4e4Y7ZFUPkmKVvFMZISPtqeuOCMhLaZp9D65wO7+7p2EaulzJq?=
 =?us-ascii?Q?nTjdWj0TUIGOxayiXiI7TtjcxRE9ORRzOE4TJeCE3JTOoD+NAY/KoUy5iVXj?=
 =?us-ascii?Q?H9T08+GZrynU/l8bYeESqWVjChnfVnXg6M0/+peAyIHPmLdExZWAkOMVVSCB?=
 =?us-ascii?Q?QF+ZT2Vz9vY+U1hp01VbJcIN5GriB5N7sllIDCkbgLmy8Acm6VvK5X/sow5D?=
 =?us-ascii?Q?Ln6jB4psWEMH0F7NeRokYaD9cyY+cph35iKNcdH0WjNSrQe+BHQiYIaNt12n?=
 =?us-ascii?Q?eD1txjZ1jJZwcCaupSNVrMKj48Kf7b7sFANhlQT12l3UtdPCOBS35fT+b6BG?=
 =?us-ascii?Q?KwYuKztZyERvWH0c9ysM9lZEry4guagb7J8H4keHv47IBMnFOVy05G2PUbvA?=
 =?us-ascii?Q?8SKPU4U/7xjE8Vhoxq99LzHkSiajGFO8Yejv8mMP0OI7h/f1LceJQbkzxxde?=
 =?us-ascii?Q?A0TgVMfAGH7K3DaK1yMc7v6S84i8JJ4jO1MmqbtjZtbY+s6Kq1UwN8McP2ry?=
 =?us-ascii?Q?VuoV4rF2I3Uy8WK+WItvOEmGJ1d+8Py181nZW29492cA1hJgYcVxIoYgG2vq?=
 =?us-ascii?Q?YNrHbKbrlzpABvuJ2tXbQb+ZgQqrP415X2oxjLpS0c0vCG++e26bGSSdga/D?=
 =?us-ascii?Q?Q9GN/Vwf/GBJirIWEAXVcG6P+4j2uwsApoLfYz5+WWihywOqUwxLCrREL9/t?=
 =?us-ascii?Q?ueQM4oTPdRcdR/L/25C4HjxDCj8J2IUjOdo0xI5rid9ijjIRZs9OgEDORqL1?=
 =?us-ascii?Q?MUIVDou5wLxkf7ohpHp3zvTc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38de5771-54aa-42c8-6382-08d91b9ac63a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:01.6096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3JhzajZJDhkLFRnseBaEbZfqKsY1/aaFVwBCiegqXgSz1zuHfpAaonksUzZFGx0cuhd3mUrV2Xc0zyIotb6DwUJVgRILXV6s+h4wRw/lgg=
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

The file use both single and double quotes for strings. Let's be
consistent.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


