Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D517C3824F1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:03:26 +0200 (CEST)
Received: from localhost ([::1]:48866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXHh-0001Ue-TL
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0f-0004RP-2m; Mon, 17 May 2021 02:45:49 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:63681 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0c-0001xR-Ts; Mon, 17 May 2021 02:45:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf9resHh6nv6r+FW/BIXV9cSmT3YVOo0x1Wr8jWQZnBQSuRk51Xdut3NpBGVbR+87OJUTtQW74QqBw4pnFT6jU58RA2WqHKTOu3I0mZgt/ZezWz1ZPvm/JVIKt6Ew6H9OHSDSsZQYyAjAbbz2/M5jODOc1MeqRxdJg60y7v5WcDBtpev+HpcwzOfWQWkseerSXISKaCt42QqaaG62E7Hdu+Uwcs5bW0uGDKGEqcGD3uM9BBYolXHCA7XMeTrL8ami8MkEvf+Sx2u8kAocPWR7xfzeFz5bwkzebB8Sd8P5qa0f2yu8jBYEVD5VH+W0fawLIpWChijLEzx4eC3Tc/f9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv7Gyd3u3eorN94OkmUxTkBC8m6p/HwKBStFa9kInbY=;
 b=KI/TDrOHkn1zwODogPGjSSDn6ZUftg3ghPgMQFnWQQ+KV2hP6chp+uHUihGzFginmu46WlU2LfLjDkf4nCg4l7HnDq3Z1JuayvVgs4DLy00W7obarA4EsScETw+4kCX+UDR8EFq9+0C5tzxEYLK7VhppMmbL2PDoBkhPB3md3WubBz/unDaen+pUv5bKPT174kdNO93VLgR9dlYMZTgbu3BqXHD/+Z46wHcwkHs57e9nFpsMtHj3AeBxpQzQ0GP+XgVbVk7RRii5xa471MxVEZxwI1Yzct9Vv42hza+lfi2ZFIGfgVOLwCuBcFV6oxg4rmTL70sNKsWFIDSRPpE5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv7Gyd3u3eorN94OkmUxTkBC8m6p/HwKBStFa9kInbY=;
 b=PMC06ACK+rQSzJVDRPfZrZUo9ML5QV6c77ZppWYhfEjDwO7ZZL+KS86mOuqszEnvDbCCBfI/I1BeE3itvbW7FY9cCXB9o5blQx+ddXi93hISoelNZfsEatoHp8YRXGWDpLOxZH2mXX+1NoVwhiHfXkNAaR5nUJj1l7Y63/IvqEo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 21/21] itotests/222: add test-case for copy-before-write filter
Date: Mon, 17 May 2021 09:44:28 +0300
Message-Id: <20210517064428.16223-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66fa2341-69e5-4491-c502-08d918ff5323
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB434159B007DD282D1780233EC12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pX9yA3QkUvd5aOTGLt5lguhr+6Jk5r/kTRR4Zo482ZIKM4D03UzjZhBGFkTzYnrvgpI98GjpcQcQVI/uyM7oEHF6iLtdBAHtrlufEGqbKdRZvlISw1fhJsqAfnS2ytUxoE6UMJ7tFkoA2fkL25lIQI6It/wv7RjUdQF28pwhnfNIoUaRSdXONBWAJ4UKs+HDzf0zSCm1uqOiqwJTzkEWVIJAahT7KAztPn7cljmEBejAF4wBaBiWjmHfa5nTJWTqTI+aG2yxXImgGpDNSrKWWTO+9ZnfFLoAXNjZIiwOf89LK90vPgko1+xEIbgAmB0QglEeXrKzkMBdm1uwmo1I8NX65aEaSZEbO2Yp5OaKMgjhXCmLLsWbd8Yj1L5uKHXs/t7Qt1bUYh5VTNxU3UKp2Jynxhb5QLYzsf0mVgIqHcD8Izqb1TPoboHe2SoTBwTWSrdLWwq3YXs5TT4M69Rdah4nmmEFwfpFzZUohuWreqO3HUfTRGf1ZIaDQiUo/OCU/B/FlqKw0vEgjdv+YlWdmJqTsw/rz1GGY0/eWHazSzDRfn0xiKwcwu6NWB/C+0yjwyLqxerIaYg9jGTRWb7fw49o4o5iWKZw+2f3CZkp7NzrHTRBK2S/mHeSUOEDzA1nxbYGbfpOYWFzl3d5xlwsLguEw/wprvOB8oJXoHyIvrvC7ImUkdRE6LpcuANlI9yq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?89keWriMn8sK1R/zsuJYSJSk8Oun4YRPPWJImaYJHkhLlIH69in6PGH7PI3t?=
 =?us-ascii?Q?ipz2h9hEgw2lSuvVnzn2uQ43wi6UYVPNFl7O+CrdAQtTP/VlvazCDPCkFA6i?=
 =?us-ascii?Q?fgvxdqzkTpTFLdAo1jNzpn6JYWLfJSuKxE2hdE+/bJPJvg85ntHvrcspbXoB?=
 =?us-ascii?Q?7fSuHJf7jdI0sNv/G0CWpDEQeihZtHjoBUkp/bXYKDsS3pPQaOQLULwQHBlv?=
 =?us-ascii?Q?2j2+MbN+loPqChGlrC7FLMTuTy4nwYxj19/Nbt8arD36Ewyoc+XWWOTLfqmo?=
 =?us-ascii?Q?g2H51AhpiZ7Ej2fUnANm28WE/FXS3Wkwn9DdV9axaOJcYP/eEDm29vuMuGUq?=
 =?us-ascii?Q?PK8hqKiXnUAtFyApZeHEv0YwaQhFIrFmtzgmt4MjLMw13QLgFDa8vIReHiY2?=
 =?us-ascii?Q?Kfg+8hs9VjhWMiCgF7mIq+o+6dg+2+yya9A1ogegWjMcGsEDDY013JFOUrXe?=
 =?us-ascii?Q?+CoQGfW+Fa0lnerlBNsQBx5hYdUdqLXCudONb/fHHYmtTjFJXZYh8e5JrQy5?=
 =?us-ascii?Q?JFYcvS4t1P73HvBIgRA/IgrjSoy8QrObftK9oTOJY/uDqorQ939RpRnJ0H53?=
 =?us-ascii?Q?tQwEP61mP5nWB1V8gVjtHnck+wBNpVE70LQ+z54CNM8eTm/LXFAsWQrnfvOC?=
 =?us-ascii?Q?+6UT5AMGIp+1lw6UKSUwq5i5+2qy0AqOUOTO24gm+rHIhDgpx6xSL/oEcqHW?=
 =?us-ascii?Q?R4dptz8ifqkNg0qEIAtL9e+HCuRfSRPxxVYRn3s5zNJsAjFsj3FQoQPRFoRp?=
 =?us-ascii?Q?lpKlblUVTsJYpgGOKRtq4fwIAVA7XuXQTuE2NDXEAZyCEixvOMr6g2ql5eqe?=
 =?us-ascii?Q?ii5V/DKtqdTpw5KPFfAQ8p+QqnHvySLl2eva5QJpzPE64StVD6NKr0hOwUk1?=
 =?us-ascii?Q?6U7Cd8Tv7dHmgZ6QeUIsjzvyP3MuXyDvmwFRXZgIHkkoZzcmeEAQUHVji+hC?=
 =?us-ascii?Q?v6qwrhWpS4lX214BP3UJe5nO+CdO6wMmDxVLSfHkm55f1Mw/UliJe5VcEHm0?=
 =?us-ascii?Q?aRKoHA6OoMkdcLdE3nIUEjfLty9N+KstIwkq9BpEQoe8iFyGTBel+5oQRpyM?=
 =?us-ascii?Q?twJARg2gZzsUzGo30L3yEsmCgRfAyMUu+wcMDNztJhsK1hMNqCKsnCN+rGPY?=
 =?us-ascii?Q?ZrI/qQQ9wkNW3BUOfFYhH3JdNqJIxe7ZnO378Ay4CiD/G5AWSGfDRohh6FAX?=
 =?us-ascii?Q?/uOxfBX3DOUovMc56C7IzMUSBCzYDxyEBG4/hMjizGql9KUCuhBpeN+eRBHk?=
 =?us-ascii?Q?ofgRHmI9f15+25OK+Wb2PuJqveic61+rmveHHPBcepZxSrG00UoY0GEKCswU?=
 =?us-ascii?Q?DWuH9b0AXAQ4eVm1H8pUU/Yi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fa2341-69e5-4491-c502-08d918ff5323
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:14.1749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9curSuXyXEHIUJJc1lr95LRP0uN9W+lTfK+Z/9VQahtwXTs4QevDCk0lBYu1q7PjJFifn7j/F7lxhS3u+DRfLDazGdZ8ZF9OtjVyq7hjLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.21.135;
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

New fleecing method becomes available: copy-before-write filter.

Actually we don't need backup job to setup image fleecing. Add test
fore new recommended way of image fleecing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/222     | 56 ++++++++++++++++++++++-------
 tests/qemu-iotests/222.out | 72 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 13 deletions(-)

diff --git a/tests/qemu-iotests/222 b/tests/qemu-iotests/222
index b48afe623e..8f8e1e4d7f 100755
--- a/tests/qemu-iotests/222
+++ b/tests/qemu-iotests/222
@@ -48,11 +48,13 @@ remainder = [("0xd5", "0x108000",  "32k"), # Right-end of partial-left [1]
              ("0xdc", "32M",       "32k"), # Left-end of partial-right [2]
              ("0xcd", "0x3ff0000", "64k")] # patterns[3]
 
-with iotests.FilePath('base.img') as base_img_path, \
-     iotests.FilePath('fleece.img') as fleece_img_path, \
-     iotests.FilePath('nbd.sock', base_dir=iotests.sock_dir) as nbd_sock_path, \
-     iotests.VM() as vm:
+def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
+    if use_cbw:
+        log('=== Test filter based fleecing ===')
+    else:
+        log('=== Test backup(sync=none) based fleecing ===')
 
+    log('')
     log('--- Setting up images ---')
     log('')
 
@@ -69,7 +71,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Launching VM ---')
     log('')
 
-    vm.add_drive(base_img_path)
+    vm.add_drive(base_img_path, "node-name=node0")
     vm.launch()
     log('Done')
 
@@ -91,11 +93,22 @@ with iotests.FilePath('base.img') as base_img_path, \
         "backing": src_node,
     }))
 
-    # Establish COW from source to fleecing node
-    log(vm.qmp("blockdev-backup",
-               device=src_node,
-               target=tgt_node,
-               sync="none"))
+    # Establish CBW from source to fleecing node
+    if use_cbw:
+        log(vm.qmp("blockdev-add", **{
+            "driver": "copy-before-write",
+            "node-name": "fl-cbw",
+            "file": src_node,
+            "target": tgt_node
+        }))
+
+        log(vm.qmp("qom-set", path="/machine/peripheral-anon/device[0]",
+                   property="drive", value="fl-cbw"))
+    else:
+        log(vm.qmp("blockdev-backup",
+                   device=src_node,
+                   target=tgt_node,
+                   sync="none"))
 
     log('')
     log('--- Setting up NBD Export ---')
@@ -139,9 +152,15 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device=src_node))
-    log(vm.event_wait('BLOCK_JOB_CANCELLED'),
-        filters=[iotests.filter_qmp_event])
+    if use_cbw:
+        log(vm.qmp("qom-set", path="/machine/peripheral-anon/device[0]",
+                   property="drive", value="node0"))
+        log(vm.qmp("blockdev-del", node_name="fl-cbw"))
+    else:
+        log(vm.qmp('block-job-cancel', device=src_node))
+        log(vm.event_wait('BLOCK_JOB_CANCELLED'),
+            filters=[iotests.filter_qmp_event])
+
     log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tgt_node))
     vm.shutdown()
@@ -157,3 +176,14 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     log('')
     log('Done')
+
+def test(use_cbw):
+    with iotests.FilePath('base.img') as base_img_path, \
+         iotests.FilePath('fleece.img') as fleece_img_path, \
+         iotests.FilePath('nbd.sock',
+                          base_dir=iotests.sock_dir) as nbd_sock_path, \
+         iotests.VM() as vm:
+        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+
+test(False)
+test(True)
diff --git a/tests/qemu-iotests/222.out b/tests/qemu-iotests/222.out
index 16643dde30..bdc0f7912f 100644
--- a/tests/qemu-iotests/222.out
+++ b/tests/qemu-iotests/222.out
@@ -1,3 +1,5 @@
+=== Test backup(sync=none) based fleecing ===
+
 --- Setting up images ---
 
 Done
@@ -65,3 +67,73 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test filter based fleecing ===
+
+--- Setting up images ---
+
+Done
+
+--- Launching VM ---
+
+Done
+
+--- Setting up Fleecing Graph ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Setting up NBD Export ---
+
+{"return": {}}
+{"return": {}}
+
+--- Sanity Check ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Testing COW ---
+
+write -P0xab 0 64k
+{"return": ""}
+write -P0xad 0x00f8000 64k
+{"return": ""}
+write -P0x1d 0x2008000 64k
+{"return": ""}
+write -P0xea 0x3fe0000 64k
+{"return": ""}
+
+--- Verifying Data ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Cleanup ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Confirming writes ---
+
+read -P0xab 0 64k
+read -P0xad 0x00f8000 64k
+read -P0x1d 0x2008000 64k
+read -P0xea 0x3fe0000 64k
+read -P0xd5 0x108000 32k
+read -P0xdc 32M 32k
+read -P0xcd 0x3ff0000 64k
+
+Done
-- 
2.29.2


