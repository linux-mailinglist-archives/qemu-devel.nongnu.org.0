Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BEB4CC6C1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:02:58 +0100 (CET)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrf7-0005iA-6M
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:02:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNH-00047A-Iz; Thu, 03 Mar 2022 14:44:31 -0500
Received: from [2a01:111:f400:7d00::701] (port=54113
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNF-0004Yn-D9; Thu, 03 Mar 2022 14:44:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eExPTqBT8C/KV958RZRhXpDGrjbkMowR46uqeIOmY2/XG1B0KuZwAyz5NG/nga2JiWqsxths7niYDwxutwpcp9whHCnghT6ucKunLIRM7I9icr2+h5rMu3nc+2vIIHzLJvGwbC3KMCuudCx9ohNTEhXEhPWc1bZFatk/Cm786GzadP3WbS8Hx0Q8/164ubAcerTBqezj2nxxWqa3Gn9XDmClny+GUi7qPLAg2oFpJptKdM8oVWdLs7/VC9yg57KaTgrgpauPvqDL1zXQe2FkPYdTxY6l0JKsRs+Z+YEX6G4wmQel/xfd21HoaZ8BCm774lunU/YOONpj1Eo73sB7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnXEeuoL4Vv3p1Q4s5BuJZZqZVqTZWvpFCi98qbgHHU=;
 b=Cm9QHeCHRu75zO9bRZbBLYVlDL2hp+JoheQzWE/Qir5d7kvbdhrt87ADJ9LmhEgNx/7ZRuXLC17zCvNZSwDHkOaGfo6n3AqMPT7vLG716CQUQkT1Cd9pE6OyIzKNUmGwCCsUDAew7SQjyVgGMq+4EFGUeX3LY+xoNhKT+wZHE+Z2eFV/VdiLYyMauXh1sI1XFJl2ey+A6SycRGBgsTUeCUBqA3PgufYLgfrMbGAHUSzTZ0YcDpwPifmBcUdd8A22t4iui/5fH+/rHNeyShZ1PR3A7l6ZwLdpLdORRuc0WnqXVj5pA4K2G0q6PqoWZSLXG+fmuPCxA6uX2i0VMqvjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnXEeuoL4Vv3p1Q4s5BuJZZqZVqTZWvpFCi98qbgHHU=;
 b=A7TGD37+jDKOa+AG3jQQ2cP6M3Vu9va1RXSBnWkYxN8t6/4N8DnE5M2b3pxRa/p5m2RqtiY/ImycicrpK4qjfFcO8w1MVi8Y9NH+97stYEZ/g5VmP72aJ6Zi+q/gLXXU71WNKzkjjYLQDgul9+8+Mhr/xQmqn05kfAzXQkifi5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:16 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 15/16] iotests/image-fleecing: add test case with bitmap
Date: Thu,  3 Mar 2022 20:43:48 +0100
Message-Id: <20220303194349.2304213-16-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e5ae0e2-5ffb-421b-5b1c-08d9fd4e3387
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB473668C543BBBAC6F6AAC304C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ln2cTgUnd21c7lQIsE9/W9kASOPB3OzcPoVyNdx/8V6VjtE7ZB7Sp419EBLc46517fQ7RA9+YruZtbPXDK7SaEjjh2VZFFVQDZMk7Y3W+Y3jvVLYi0zUwKz7th3w3gIOEeKnkw/02C25vgHElBUGFpmwT1jPKKMttc+5NhBZweoAfg7FHoXd7KWktSK52Me2Wr0WgAMG6dZ5Mm+g/wNU/Phh6TFhtfEdHZk0inNljyopI8Y2uU9zjQE1yuhca7Z7XMfqqV0RnicmV4yQWq+N17S8JuhH5a4EMCt7dTPTJ89ou/DU/jcy2kQ21FcEFtux2qO/CIMIm7uRT60/FoDcfayWwejc+EQisCGvXuS5uM0GK/0QLpCfjp5G+CJWMUAQ6aoMqBeA5yXFgXtZ4orHgBE0X0VRYMpe4AsEtmtXNFAvwgknztB3yTHoM/tXeEnecms8G779JZo3OS2zGJxlRWCA/LsFpPN32L3+bl4X6joshcd93PdHke73EQ0cKvBt8F9p1s5nUiKhjLUZZPgipZsFWZ+EpDoUWx0uVVqde3SAHWy5tWlgMIh/GkRvbhbasBCiPfCI3m09r4xg6imSLq56OCxxUwSIV/ai4VOWyMNns8FPNPaMteD5K4u05HZ+uu7fCD5qy9qWcZX2tepkhr6uKxof5c42jCVUcGJy0H+GNWcGqx7eTlwRve6lajlR2KZiFe9CTPmvaagUo7iPsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIIaysrtRvVJ4v2i6BsxylT6+BsGlavfgUT/CKokJiXYt3YXioyV/MzuEZyc?=
 =?us-ascii?Q?DDIyPF0U2/45YvJv14QPXDLnc/6lWGR9emBhVCm7eBF5P7nDdFajtDgYdNYr?=
 =?us-ascii?Q?AgJoTt2IbKkq1b0MGVHSN+wQGsOzxUKfoZOnCeydWCXQa1tK5LSQ6RhDRuFi?=
 =?us-ascii?Q?pLp1i7jT+/8m2Wpri4kAml/3AzwCkfvmkc7yszkrRQTHGEBSK7b2pT9WnHge?=
 =?us-ascii?Q?WjpYEAppWGKNDrnZlbUBh1Ghy0H/UvVrWIymDF7yefenuobfXyylEmny1fSc?=
 =?us-ascii?Q?kEN5y1wqg2V1cDSSwAyHt8fgIozu06xDEb3o7Cz3uWC5xSovJ4MGD4H4/J8s?=
 =?us-ascii?Q?Ymqp0JWxUW+f+xxgwMHsqJq24rpN1WTTK60cJ4Cwe//S2mYISB1aWIyHmClM?=
 =?us-ascii?Q?afweUwr9E26Aq0udOZYr7GvvmMfyu7efhxn4hblc6sHpbq9t2+BVieQ6lGnj?=
 =?us-ascii?Q?VxSt/bOtVlmUGFi7aGzZR2ZBRESrXC7i5Px8A44mSMFhX9ADsTmLMjYiZO7Z?=
 =?us-ascii?Q?6vk+QI69u6xtSXhUROTTpxjWSwTarQy23Wc8dKDWqrkdchXl2XU+MXT6hItT?=
 =?us-ascii?Q?fPML2VfjzsMuBIXYEV3KvAMENJknDyn9iGYkuAKH3lGVKMyqZuL0YNUVRRaP?=
 =?us-ascii?Q?UZg4tdKCKh9czbndaQa4Vqkje5NnrF4NcKZ1fa+w4VqftJggmJ0u/iQU+OyS?=
 =?us-ascii?Q?d+O75vfvw3pv7czKCoq3XFy/BGDATYk3zaOeHy7nk5CUf2oIbamgaJQf7RiB?=
 =?us-ascii?Q?3W2xgxEMEqFVRD7hXoSZDqpYppaD898hgqoeLvhwH/LXCbKs0jAYIzxjINot?=
 =?us-ascii?Q?B9/ZVsR/vK1FVprRowxdrxEbVPp8fySMPuSw2Y1TRStOy19P741LQYASOOsw?=
 =?us-ascii?Q?J9H6j5DVFhDKDtfOa0EweQtVaYVmnr3ZnZOSx6rrucj4w7Jux173875Iihfz?=
 =?us-ascii?Q?Ukdwx7imDFRW/LOmPHXgch99VzOgIASbFUzg3x7e1HNbIo0DqbXNW0uwcAVE?=
 =?us-ascii?Q?liYjS+YaavrH2Xeocx1lyfZLKOS0tsoFsxf0DsJt8N5S7xRmguvd8se+roOI?=
 =?us-ascii?Q?Q+SFtNhnpgqiIYGd5s/LtB4AsAw+kb7A9K31BDJnImCpZMxnOyv/WvXQCRy+?=
 =?us-ascii?Q?D9TElF/EzrDYfKNmOKzX3h0zJcFnjF9+X0t0y9JB8t8DDW9N7zzzomg6JH1r?=
 =?us-ascii?Q?eBQwR70+L2zLJQYBa4i60/On1BvL+MvECCtiI8atkYluVshz3GWSa3HTqoQf?=
 =?us-ascii?Q?PshSY9flNpBNP5Zs14M4Dn45oBBVt++CCFqTPMBa8Ykth7ij03qiCvQWV2es?=
 =?us-ascii?Q?ubHZ1UMEgTGOdQ3wLoyePh62J8oZiFQgjmmMePeS5YNoifC5nwQtWGOFKfKg?=
 =?us-ascii?Q?WrlKvm11Y9uzxVyRQkHcuPqqq8EwPaoFEHsJOhJaONOMSE/3JP3eG0jc7Hyu?=
 =?us-ascii?Q?Ap3TZu254dgxZHAwFCu3tadad+cC6yY4D+lKm9JTunK6YwLsqzBOFsKReyMo?=
 =?us-ascii?Q?+Tan3zcelp3liI+w18suVbG3VmPNj4bt9b7cTqdeIIO+s+KitNKeUblOJOmI?=
 =?us-ascii?Q?+SOM9OhLmsUvGsjpsKMFdJmOJ56oxNVbi9iVuN3EWUdEYlYw/z7kBL7fxWkq?=
 =?us-ascii?Q?boB1fXkqG8xTe592fcVYVdYlmH334zzpELYk0+Zy2pA1KN56k2v+MLpunxBh?=
 =?us-ascii?Q?OSLaJg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5ae0e2-5ffb-421b-5b1c-08d9fd4e3387
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:16.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FATXL4TrcvQQW9TEJxnOaB+olkRM0AGFg3b3yAQiD6jUNgrqYdb9uqiS60pclVB0jZtnNc3b3zh35vloRTyelJLSxfELBw5j9Xq3kgbCCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::701
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::701;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Note that reads zero areas (not dirty in the bitmap) fails, that's
correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 38 +++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 84 +++++++++++++++++++++
 2 files changed, 113 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 909fc0a7ad..c9ffa6647e 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -23,12 +23,14 @@
 # Creator/Owner: John Snow <jsnow@redhat.com>
 
 import iotests
-from iotests import log, qemu_img, qemu_io, qemu_io_silent
+from iotests import log, qemu_img, qemu_io, qemu_io_silent, \
+    qemu_io_pipe_and_status
 
 iotests.script_initialize(
-    supported_fmts=['qcow2', 'qcow', 'qed', 'vmdk', 'vhdx', 'raw'],
+    supported_fmts=['qcow2'],
     supported_platforms=['linux'],
     required_fmts=['copy-before-write'],
+    unsupported_imgopts=['compat']
 )
 
 patterns = [('0x5d', '0',         '64k'),
@@ -50,11 +52,15 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
 def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-            fleece_img_path, nbd_sock_path, vm):
+            fleece_img_path, nbd_sock_path, vm,
+            bitmap=False):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    if bitmap:
+        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
+
     if use_snapshot_access_filter:
         assert use_cbw
         assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
@@ -106,12 +112,17 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
 
     # Establish CBW from source to fleecing node
     if use_cbw:
-        log(vm.qmp('blockdev-add', {
+        fl_cbw = {
             'driver': 'copy-before-write',
             'node-name': 'fl-cbw',
             'file': src_node,
             'target': tmp_node
-        }))
+        }
+
+        if bitmap:
+            fl_cbw['bitmap'] = {'node': src_node, 'name': 'bitmap0'}
+
+        log(vm.qmp('blockdev-add', fl_cbw))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
 
@@ -148,7 +159,10 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
+                                           nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Testing COW ---')
@@ -166,7 +180,10 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     for p in patterns + zeroes:
         cmd = 'read -P%s %s %s' % p
         log(cmd)
-        assert qemu_io_silent('-r', '-f', 'raw', '-c', cmd, nbd_uri) == 0
+        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd,
+                                           nbd_uri)
+        if ret != 0:
+            print(out)
 
     log('')
     log('--- Cleanup ---')
@@ -201,14 +218,14 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
     log('Done')
 
 
-def test(use_cbw, use_snapshot_access_filter):
+def test(use_cbw, use_snapshot_access_filter, bitmap=False):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
         do_test(use_cbw, use_snapshot_access_filter, base_img_path,
-                fleece_img_path, nbd_sock_path, vm)
+                fleece_img_path, nbd_sock_path, vm, bitmap=bitmap)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
@@ -219,3 +236,6 @@ test(True, False)
 
 log('=== Test fleecing-format based fleecing ===\n')
 test(True, True)
+
+log('=== Test fleecing-format based fleecing with bitmap ===\n')
+test(True, True, bitmap=True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index da0af93388..62e1c1fe42 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -190,6 +190,90 @@ read -P0 0x00f8000 32k
 read -P0 0x2010000 32k
 read -P0 0x3fe0000 64k
 
+--- Cleanup ---
+
+{"return": {}}
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
+=== Test fleecing-format based fleecing with bitmap ===
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
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
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
+read failed: Invalid argument
+
+read -P0 0x2010000 32k
+read failed: Invalid argument
+
+read -P0 0x3fe0000 64k
+read failed: Invalid argument
+
+
 --- Cleanup ---
 
 {"return": {}}
-- 
2.31.1


