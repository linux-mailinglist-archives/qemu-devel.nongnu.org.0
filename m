Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6633DFE7F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:58:54 +0200 (CEST)
Received: from localhost ([::1]:50116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDfp-0002XE-J4
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDN2-00063c-AG; Wed, 04 Aug 2021 05:39:29 -0400
Received: from mail-am6eur05on2122.outbound.protection.outlook.com
 ([40.107.22.122]:62700 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDN0-0006MN-DW; Wed, 04 Aug 2021 05:39:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPGSlV9MGIWToyzOWfI/tKpvL/w+HtiJVSgGsvZLyKo/WTRWSXjzEAPNR+uQyybeUhRZlkcEzuo3ftyvcysFzb8D30M2qWR90w21D1TdDk1f7QF3ibhlMvQlg7tltS2Cb0L4QIF6jTHkjSeV22s8cyiG0PI0wPSNdz7lsrHKs+7h7+JCXIB4J6Ul4k7m6NjmvbaJ5ER8WqKK37hI7u7EyQ2gSItajvy9Dqi5SZP7SLMm05//+5Oal6BUGmbgOu9xgbNZlofqUnhZv4cbAKcMhW0AlpNUae68CYyO4f/oQmx+/wsda5Lpgvdh//85zDMDvKNoHi91e67nC3qlf6WFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=BtDeVLNyspnnhgzOzNdHAW2t2IM/SDnTRcCgDQSHOk7ulkxQ/IjjD3x3YaXop2LtIQiXF8uG5wRsiRWwFTszqJQkdMAHf7eukO3fFT1f9w0TjnW0iOEWFMJ+Kzh6Dnj9bI1elcE5OIZA+Z1Qn2GgjUozykKyZlob9ybIBXbEDXpQnArOihAlC6HZcTlMTYPWGdTCpZomSLXyjkHBp4mhm2DI209qZ6SDVi0tOJzoqsOvJlcruZsYim7xuaV+yarKjNrgcgZbiAoP7McK67T3Lb0R29oFXm1r04C13VcVOGOPINfy4IP7wrCkiNwFeKeV7n0EBLPNeZ3D2d1GFxF38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUZIELcLM8f+XWay+whz9zP3yI/HpiDjHxOfs6j6Jxw=;
 b=Uzit1rUfmlaByaL6IRfKE+dI6ejO0F6eKlocEMZql9lhw2nzn5ffJNegDyfx+BUrr/zT66JXwORFt+MR8QSeqvu/oZV8EVnpUOfqdxxipDVan34rYjhKbLlbPp95y5JyxHXS1mbXsrqfUnrkLt9T7v7FISUrPzX3azRiLCt9INU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:39:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 27/33] iotests/222: constantly use single quotes for strings
Date: Wed,  4 Aug 2021 12:38:07 +0300
Message-Id: <20210804093813.20688-28-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 496f4de8-8b01-45f9-52cf-08d9572bb981
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46896C152A54B5E4E77874E6C1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ekg90C2BEvEG2aZAdL+VJxQXZXzKp5KKUoWK/HcGBJ3IdGAehUYksz7BQ3yE5fsNUv6erSpUz4oxRsrQRNRA08PADjrEoJJqrBkcR3r8HgG8ZfQ9dLxMYZmPQj7ClAKeCPqFJm/yIMdG/+GcatEujnfaGPJqvcHTzARpmATty4AuPj58BZD3zFPQkN4eUQwkFghZRNtXT7CwPEBxVhBzmx7LpcN8ax5/9hTDDeNgr5WtG49fTaQbdG1bETKSBtc/Yo+YSMjN0KHJsdhFxGHcDKBOGDgNgB5iu+TotRFdk5DIMdZxiZodGVqJLyYZMK8vKCLOUVJ0UI3PIX0A4K5tirCR0LPX0nFbOIERFex2XdNlwIT8oFTCvQPVEJrAw98lqgquka/ehTIbA45fdD4rWYGpaM4egbn8MnVOtA/2cEypLD3TTZ30CzMG0esA+Vgtfvb214wnym3Ob5IK1TmhaiHvqs6+ph6jS5evj46QRtEXEdKo7KeDlYs5SXe63ce7U6NVbaQYVjxM621ZaPu6UMfdZcpOELy5pxx6WlyHetwB3I1FpYaclGq/d1DQwnPwzNzDnnzMBGEUCawkbHsP7ssw/4ucdm6BxSHtRm0qnUI/cy1qQgqkelsQX+hXIqD4CmNk1L/nwgoHCF9daPLF/C5qNUkz4kup0dFvGANL7AO01c06qLlOoqP+bxKgVjj5welKNzmfIxkAYVP6hqEhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(6666004)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SBM5ybwDD/HvqOFiUTqOM0pinu1KjTBT9bGqo2z9RD/WSmxnynOwlPc2UFng?=
 =?us-ascii?Q?RjDV7uHpqxQo/QXw2lw7+dgGJ0N8mYJuwn0bUzg/4a64lkVTOfdk3aYbT4fk?=
 =?us-ascii?Q?MJudCMOIZVmMcQJe1zeCZOKmFKNyl4EmjBJrdzJvGmhDp0rKhOeuUZ29ueai?=
 =?us-ascii?Q?EE1iVE/xVXQDZkDd7O0fNK11rt94c5CuE3UI6GvqrFjTvtNxMze/gCPZgjNl?=
 =?us-ascii?Q?zTC3wEShpaF3H06/I266lCxXdzTqtJyK4rmMKgotONMCTK1T5XATVKum7nAg?=
 =?us-ascii?Q?JDXq07HUZqiEUIEWtQFqtLKAUXWWEzlFt2eNKZn++Y3ijqDF0wKDix6hc4iQ?=
 =?us-ascii?Q?SnDF1yXf2xDKQOkZVwJupq6nTRmm/rPoUDDlBdZ58fUxgGlaUausV3T7Rk16?=
 =?us-ascii?Q?5qukU9+NouwbuUZiovnm2QdiXfqAWpXkQsrtGCoPmruazwK/sirUaNnx7tWo?=
 =?us-ascii?Q?yeVGMmu8/FA2OJzUpc3GObtLFVd5Z5LI1ic7sBt1S6EokTdYuS/SCysdc9sB?=
 =?us-ascii?Q?BRQ+Oc/T+m8Jg5vmeY4l+zv8iT+J6ymnjmo6lUNpDtN5YsQLB/Wm11a+8s8X?=
 =?us-ascii?Q?Ik+sq0NPGkaAgheHzMX+3WS6qKA3MXJ2wVu2tjaxq1sV/UwcbjgdrHtkG36Y?=
 =?us-ascii?Q?n54CVWjTbPpA7iJt1abA8MHOLbttxBh9wJSxgdZOueDZwo/Lqv6x2gnnyAMo?=
 =?us-ascii?Q?Y6rvHBAHEPSt8+BQHd/qlpwfZ4yBEK8WLfWehz9ijhiJ0bz4ms8Sdb7Yhtxp?=
 =?us-ascii?Q?35i6COJBigiQP4VIggcVD9a75St5YAHwDYjmzl4EqLUmaEegx4hV0xnENPn4?=
 =?us-ascii?Q?fJv/q0fTpmJlK4D+3tLnnAKfZ9N0hAvil+XgfqLt5tK18pOeXQvTyXAhysd+?=
 =?us-ascii?Q?EsiWT1mJSTKSEeHJnKrPArYobgyPUloFYYmGttSn07hE3ZY4FpXpXaY9mF1l?=
 =?us-ascii?Q?hUiSAaggMk3HuQeUFZT+PQxYLO1V1ebMSIQAqSu0lMDIIzx/EdL+1GAbFG5T?=
 =?us-ascii?Q?tpqPUQM9tZDJ2Vro9EIrNSR7UVBt2DPRs1dYYq+3NLG0BT2rCVNqXHHZQm7S?=
 =?us-ascii?Q?FhV7UHZCNd0THHUJCFzNntWWuAQC62hvliTqTW2zfIZQan4NcMYSs7iPkzoh?=
 =?us-ascii?Q?sJCBmKFFUcqrtTtrIeWWBFqZUyqm4vKM2ktNmgOat/1auvLMInJvBERtZdlL?=
 =?us-ascii?Q?O5TghFkiPbF+x0F/JQcpB7Xg0WW0+XvPiBuVDpI6PkFNEX/tNNj2ElPohsBr?=
 =?us-ascii?Q?NiDvwPz4IP4vOZSkUle+0BImDXqtvxlc9nwwqEUD92R9PEkEKfTu1P2CFH3U?=
 =?us-ascii?Q?uHVt2zBuOhsp92RgwILpY3QZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496f4de8-8b01-45f9-52cf-08d9572bb981
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:15.9037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMyTq9celpwgVEZR8pQz688W+9rLBnx7D08ous6HI68Rj82tIh4OqjPQBbdbjrnHWKHvHFwzLhtLuK9fZbYH0wDtwUcN2Y/jer3RaKg0MnI=
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


