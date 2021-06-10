Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6A33A2AC4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:51:34 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJDh-0004No-Q0
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqg-0004Hq-Ec; Thu, 10 Jun 2021 07:27:46 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:47549 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIqW-0004ZR-Lc; Thu, 10 Jun 2021 07:27:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czXFvuLiB8xAUj4Ni8M98jtN08xpd4RMKUNoBZKbpNO1SECL6/To0K8ptCLQJ9EKFxxAL/BrFJnUsQ17+/HxAcXWoD2royoRyzfMigfCcPCRzv2TmyuhmRurGR311pdEM7hy4TYjimoPtjw+NhijyKgDxPELI7hR0ato5cYUZIL/6x16RlYsOyGS69Ts6q1d/bSXG/evyus8vVUZhilkUQDFlIavqG/lydcCPOBVqYsSx9aIbx7tkJZlAkRHPxwsdv/KHMsISBilAs/F9nYmAm/JDJO0RTM7GMkA8mmI6YP5P/tMUb0GziApETqxS+s8Qqa6E2Po88+nDBXYNB2NbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=kemXOCMaRQ6vk92ZULauqFrCwNz7GRdi8zfm834cKDW8bN5ZRGxuOBj0XXoCOH0/W9Iv1lmBt3aKt3lEXF6XAtnWkt7X3X69WkexqN8ydBXMfFNQjr3wSYcFXjIM0IVBSc4Q5ve9q8rLMmwkZ0KYuvEB+oVk+3fItVEi46wp1OtahCGurEV5WPqOzRkDH6RMSq97mmQ2B26hmnuwjw6zgE7tGP26YDfTzjoB8jlguD3+svGLgyjkErCNlFVUnGUKxxnELD178MRmrlZirDK+cxVQz6FGm9FqHzJshZ5G1mzZnd7IWt3ovuhArJ9FxehCzmMOSgO1UtnSa/13aJdVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofy2QVqvSoIMLrXQBtXlnCHooDNtNXeEmY8QERMhYiQ=;
 b=i8wFNmfL9uAS1OuY5J7NX1P9iSBoGSAWnJTRP/i7O/wltgzHZxHvdYxGHULZg3VhGmIL6Y6+LbqWruS9PS0U1f4Ri4myBOnJq2Q7pc9+oGc02y4v8KNjnSICbENNvpWPtIuWnxmH24E3NEzt4NyDIHzVDUHc2OGxF/Qy3XdIXGw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:27:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:27:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 28/35] iotests/222: fix pylint and mypy complains
Date: Thu, 10 Jun 2021 14:26:11 +0300
Message-Id: <20210610112618.127378-29-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:27:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a524673c-cd03-489b-d9c0-08d92c02abe7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6280F1533A74C5FD73C166CFC1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TCMxIll+QeY5jP25t2Vj3rNfLyO2OJpIx8JpZ+n3ytbXl4nn9YZTGlGWizAv0RV9E4WoRggC8ZLwTjmZu2Ud5dks4qykELht6ZbhzRU2ZmijStbDx1lUnkS/mieE/6ZobKzxSV4quS8szmcGdhvnSSk2OY2j+MW9VYRFg0vmWhEw3eT8wfbt9knNOfU5sF5scwS5Nswhi9s9k6StyyAy06AR0VnreJZec8T/oi2kwPI6Zu9uB1G3cn378RXP/OgjcgVw7ztT4ZyGX4pYvGRQaceq5JkNECI0QuUoaUdyuSb9b9YCEhEenXbtDI0H7Fy+LRv7yYd3YfoSn34qrfNg25QQvtwrhM7eTLWxThqp/p4x3QB6l2fDk48dCo8cSTN/1N5qF7wWSNThimNP8t3nIjGeNldqo2MJYOeqTLjyQY6cLEZpvq49Wmf98/gavIUNITbM9lO0ClUz87BWuDQN3MJRC+v4cOCO7b3RhDTNpxNNXnaxjeFvp+uFfluMYsuwnjWWogIyqSvMpME++FmVzojsiAHSzzHeqNFvVDdVUXO+pZYIyDGNVL7kIe4dnPaN1oZ9Vcoiitrn/kFIaam7M4OHB//2qE7fRCKZf8YGOpw91gyeELNabpbuOTOhQhjQWKzINIipx019Untu1d/XdQZlMDg+K6jdn6dwKsbGqxGfgne87jsOjDaW+hEhljT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SZFidHqX5IrBT98KYPQRPirtzybKw8QVeZaYGH4fA+ZcH2WydXYNBhnjn/W5?=
 =?us-ascii?Q?Tl5ouWIdmL/XCMW/27bY0BFEB/D5i4XoznGJ09swqALFfaXqTozrs0wIvDyl?=
 =?us-ascii?Q?vQZlLNVk/emOFpOVlOSj1g3Vvst7XeXYYntujeA8Wz8/5IdWHkHjh8b9HqD3?=
 =?us-ascii?Q?2+2vWCBrl3zuUe2ZzvK94MvQoU4dBvv7xZbeJH9f6ud3TrqJKdvFiHkCCLdV?=
 =?us-ascii?Q?Q61KIgW2ehiefVVCcRNhBMAFmZ4f3wxnI7UB4MPnJM/Ue43y+Rl7EQ+3AwPR?=
 =?us-ascii?Q?7y4+qu0i0m8JapG7jvm0LdX1zfpbzf7ZRxthBLgnJG+H+rs7ji1yz5CKcv4b?=
 =?us-ascii?Q?IQROIjzoX/ymKZ4/SSl+OtuLvVW0DHFvhZAllFMbNKtVs6sJJdWPHQBbkyPP?=
 =?us-ascii?Q?VVboULUnzmN5DXxZ1CnXgK4b/fQN9sZNdNPPH1r+A2JDJMzfuIQ2YQ37Dz2Q?=
 =?us-ascii?Q?cxDn/uiJxYcWQP42oFWrTPD16kfNLaruwKsIe5tGO+8qTo+9+0gP30KuROi8?=
 =?us-ascii?Q?XSiGRpfu2MWaTqPfNeO2SNUQxoIA1jGibkKGXL76dGedzUq4kYDixm3R4gYg?=
 =?us-ascii?Q?psOL79a6CrxEQ1NXvBQzXbFAhBeRytFhbCUfwbZTIwumUX7GdSms0YPQA+xA?=
 =?us-ascii?Q?i5ltq/ABqMsWV/2cjgxwISPNSEUX7vXFxUoyPzwhTy/59h/oKSMoL4kZSW11?=
 =?us-ascii?Q?kxdJKuiNYqHUPEkx9eFORC4VNV/g5uyiNmhiN+O6zyZ9MCn5cs8wcXSRAWAd?=
 =?us-ascii?Q?xVeKaOMkIxd8HqP6H2cXRgEvTqPe35FXHDUW+4jVxvrhRYZJsQg4znD89obW?=
 =?us-ascii?Q?vleN1x74wqIfeMkOhRyrtO/aC23QtE51l/bAJ55IfV32qvhQrdIGagCMESEo?=
 =?us-ascii?Q?llHkFhUrovoviWpWX2vd92P+AIqYapUHAgnIsGQfu8FJbNTKOsulJPR9RWgD?=
 =?us-ascii?Q?DM+JqaHb8VndziyuusxSprxUBVYixOECMurbXeXbVUG8oK4Wf+VSnKH8loXg?=
 =?us-ascii?Q?UYhu5zCcrCxFm9dOFHBmZzr9RwY2/iMmPvqYmJbkPvi+HjVuMyxwQwtNT/Ls?=
 =?us-ascii?Q?tB1tsyJdoctQ6p0OBhoNMw2jAbdAt7Y65HW9aLWfXodKJc78E4KlP0fI1pMh?=
 =?us-ascii?Q?Qt9Jc/9IknFasaxo2cmF4jmUHMYR/evdMsLF2bqIBg8869mPX4F/naDYiGuZ?=
 =?us-ascii?Q?wE+CUaVKD1Xs0p1+hwEvZiVDlC7H3XSdx7H/E03PPvnlB7hB4XAJqE6ExhLa?=
 =?us-ascii?Q?JVzAqcw/wCsi1P9rPz3rNO/86+ZIauLjdvAiJrl2yl/qZBzz2nLaa7uc224r?=
 =?us-ascii?Q?/6E+swn7raoFf1J/TLvN8hkV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a524673c-cd03-489b-d9c0-08d92c02abe7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:27:03.6505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUMZkJna/dbxJDyjM8F3gieEtSZAQvkvmQUTAEvMuuuRzvGvdDEmXLPQhRtg4YSozRAA1Rm+liFR/+Fepcmpy7wMviIMOzFsKZz25KIpDt0=
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


