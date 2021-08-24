Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA53F5A2A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:50:42 +0200 (CEST)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS8i-0000Yo-KG
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyX-0003Sg-4Y; Tue, 24 Aug 2021 04:40:05 -0400
Received: from mail-eopbgr70137.outbound.protection.outlook.com
 ([40.107.7.137]:13025 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyV-0007eD-2V; Tue, 24 Aug 2021 04:40:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGj6Clrc5MplDhyBuGB5P78EpksoAQT7Cyx2+krvHSUdSwNBfU4nPwRO2GRENnlcCpJ46SNl7/rE2FnnouYn/VSJNmLdGt562y5w9oClEyucpNIT+OyZGG6AbjC2VWRkUHQ+ddRtJpcKCGgpqliExEpI35afM3v7QIz9OWyux8BjWMeBelXYHPMNWNegAjL/laECLOn/Euh54jUG4//O0SzCYparVXWCXLVIE3VqBmQf0DfNr2JqkbgCG4Dlr+M0bGDLdmM3G7u4qGzCNHqk7bYBDxM1Plz6SSno6FhT+ZrCV3y+TFjLs8RYmYbFCP+071sQg4o/KRX0UVPjt24suA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=KyqjLwZ8mu8vsmTp0q1vpwnx8D6CyHoUDYGESD25pvocVpz5ZHShKfpz8KXmrVInvVs4AbKxWthfcugj6DflLjYWlsQxakt6hRziNGQyqEewM3fbXsiayBYQrxAKcUa8ynZ7ep6XkopV4KEZ4/58/WnK1TmsJ4wBriHCZfbyrnD2uCcqSfEVKg3YUPIbx3N0JrMSEd/eExP51+7mAseD9tXhLdGVbMjkXssUCgVdKLIN2Pc6auaGaC/sFsp8QO+0SK+exhIE1pVlrl6qiegvEIaXZAsbJkAHmTnwe0vN8L41kmvPSuEqkuzKAc3S+a4z3OrjcPOlJbYaLtnG/9ISpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=YO2YbqNInHOapsef4483gIhgwXckcGDBhPOW+vwnDqwBNNkuf2N+bKtMdrEsV+A5O5zbJt90ZZycBgdKnMRWfkaCtriadhs8mUn1DM9TIBsZu/hN/PhO901OlhIJ+N2QpPZ6G4sRhoy1E7RL0rHnHiRfG8hVOrSgYtunnOG2q7M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Tue, 24 Aug
 2021 08:39:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 27/34] iotests/222: constantly use single quotes for strings
Date: Tue, 24 Aug 2021 11:38:49 +0300
Message-Id: <20210824083856.17408-28-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2f5996e-feca-41aa-19ab-08d966dabf6e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4088847C0107419118A25436C1C59@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 798hO2uTUUVZaX3TBSOjrZpIH/3eQQ/ybXtar7tdMQSr6U36pr+Z7rpz6bYk3fYR0jt01p/OMCfnKtGitjC9J3/ZkDujLREvdVm+hYb95NiDK4VpZRM+/jZxFmNWmoNhfudzf10cQ87XIQAvtw/l64Z5KbxNncL+ZCE1cL9fOJyTrt337u+ImaavYQy3TAEVOYNhaGPprB8vBnVu0DMYzr8rOT0Jns3TQyw+oDVQaq8szV3Xbp7OoVVsNHnnkelP+MNRSuntZi9uDX1qlpF9YNy9M0HN8VZ8Gx3gCq1qBDnDn2LtM2LhEeD6nJaorBeqfC9NqfsxoHDbJ+C4c1eBKwMToB8nf/pfVv62UzZqgFq0x/+A8kwidb16LTXcQKfpLf/Ie0SUKZgydxcuB/numVddjjIJlz7s/IMgr3xxcO8naJ+M58zWvFmVg9FdHYrvelt3M59o3W+Ir0N+gdVtO0YL49IsAuV10K1SX9BPra/fdONTQooYKGp4FmcNxnaO4OtL0Gg39AC1pIjs/ZFwnQDfbF3e0q0+MnyyD7YlfRYtFM2TK5LVUKOFmXJOyATGluKoTb2LoI6bKH/EBwmwjXfe5KffawTRcdviBzUbMR/VLdUYsOLvNHM0w4fGGQ8sobhwitG3LbaXPBKpz0zOthXIP6yuGR2BsbOcDrhAm23ahAlOOXvLggBeYZtHIUpUrGKiMiuLVc7KtXNQbsWPZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(366004)(396003)(136003)(346002)(1076003)(7416002)(83380400001)(4326008)(956004)(6486002)(38100700002)(38350700002)(8676002)(6512007)(2906002)(478600001)(186003)(66556008)(66476007)(6666004)(6506007)(52116002)(26005)(8936002)(36756003)(2616005)(86362001)(6916009)(316002)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?atz6IJf6GqyXVg0yoWtJFLhSRFV9AcD4Mk++QAGB1IHY2aeZjvPoythlQLGV?=
 =?us-ascii?Q?l/1dAEk7jFkU6js0KqWLQ2WySsvtpiQXogjFSzzuUww/ULbkManucGRtapQL?=
 =?us-ascii?Q?oC7f5spXb0co4SQ3VXGELNZyYeXdUeM8ueHn2+CWDGa0h3GSNPtIDP+9Tm4T?=
 =?us-ascii?Q?piQhcslcG50a+m23CUJRfs84smtzc3/LdOdUswniDtAi+TRxFtPvzu1D/P39?=
 =?us-ascii?Q?SVbZdxrjSpcj+jkt9lENCMHvauvaf+3N5bxVoS8loYB0OUtbFNUwdwbx2T7B?=
 =?us-ascii?Q?mJouJtD+liUaOSeHSeAHOc97mJ5ogXW+Lzmx7HbWNuslS313EIxcBiKIjAq5?=
 =?us-ascii?Q?qVr/5MfbgPxZmLMzkyGurlMly2VFMMVLUrjmn7Hym5T5/IR/T6N1rYN1hR/c?=
 =?us-ascii?Q?Tz/7P8crZ3jX/TEBH5lVmRVquzUJyuvPEwGgiipadvPEKrtRcu5nf8sJV+MU?=
 =?us-ascii?Q?A5aJMWZ7SuLPeLZ6KabJp7sqXrcdc4W3ZFKE4ffvEDMrc0n/rhvf28PrDZ77?=
 =?us-ascii?Q?q2Gd6lBN2+as95arA7LVUPRZzTO5LFdxDmpMYou8QxFikUpQ4iYjbHq+2/8W?=
 =?us-ascii?Q?6L0HxHFO2c/Lr5q7yHyXidKJNOKV4J+YaQ/WDpG1i1udviXaXgQt4oTcKF7M?=
 =?us-ascii?Q?HRLTkq+3GHfdVLZOfpu3B2ZUAZA3a/gSic+pCwXH7dVlCExuJHwIKBBXJCSm?=
 =?us-ascii?Q?ie92MlbaMeOmzi6wdSGH5HPbdKJqCzEtY44yecB3UUuVpaAnXIK+yn7pkryt?=
 =?us-ascii?Q?SFVZn0Tr/fsD8A+XjwjEYJvoKF08opOFmpvlGNcsTkM2cT5h/RJ0CIZZjfRO?=
 =?us-ascii?Q?jAoQLe/t6asiqbdNEfKT5FL0fcvL07rDggIeEb8AcfuXB1oYUj331yakmnAA?=
 =?us-ascii?Q?0b43ms6ydqC/fwfJ4iVJYt78ekyB5ELAZRcOLPeVU46V+gdy8bwhvTGlGRvT?=
 =?us-ascii?Q?cb163tpCU4W2q6vV6ZsfKVgdZ8TwFXn7kU/gMrO7eGWc2Q9WF8HRr40HSZvs?=
 =?us-ascii?Q?tr2lYJeSp5fld+JloLK+Wzb+dqhP0cc/lTcEBOwdki91xhVUBI8bTJvkd/1v?=
 =?us-ascii?Q?BuncQg4KAliCBF7AxFPQH5qGg1S2TUJwWiioVB0gLs3kS1PTJhm5N1kUKLS8?=
 =?us-ascii?Q?R4IadBwUkBcpzn09ytNnH+FLyhutOlkhT29QrUTSye8B6TL08+IaP5cDUdyi?=
 =?us-ascii?Q?6dkM365xUfvTZg06Lgm77LBkCUHyDN0/vtTnipqC8oEloysM5w+Ga6KSSWbY?=
 =?us-ascii?Q?nwVuZfZuwOwNBxaie2fSQeioci5mIy8nVxLIcofe+m6So27YG1To+0JWqlce?=
 =?us-ascii?Q?JjIe+sQR0TJJbIYqK5AmGya8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f5996e-feca-41aa-19ab-08d966dabf6e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:55.1507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMmcYc/3oyfM3MhWc3y6nkK2xps3C1AZ3EenY+QExgjH8MB7VFp0gc+f1D0P257GvlAvo8WvgBX2FxPwerAyED2UZIoowcwFo10dmnzVvSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.7.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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


