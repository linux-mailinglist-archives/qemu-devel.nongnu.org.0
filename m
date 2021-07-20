Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A83CF931
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:52:14 +0200 (CEST)
Received: from localhost ([::1]:43940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oIH-00088o-9g
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5s-0003K7-Il; Tue, 20 Jul 2021 07:39:24 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5n-0007CC-U3; Tue, 20 Jul 2021 07:39:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwmNLVV8Zb+CGFZXeN2ZPYs2TPe0rHlmBoIGmB9WKDbfYYabiVp7KQzkP78nNNOXEc185rKjnTFSXZ6U2Stl31on1wJS/0M8TfQyqrfvbQZKW7qmb5IHoGOLDGdcszMFII0bJ9+mPueNWjzA+3z6f8yr2bDEb4f23AVEYTjLiQzOKixl4SYZMhx68sXurRT/bcNp+KCph2UF5ls8q3FumLyPA9qc2zEDTgkWsxUNIZJXMH5I7WpuxHqiWadu29IpomDEEigpS2HE03fzez7GNogGxq7OQ9svNliF9DSbVbr+95CurOyVoEW9tgHerFQnPltzvIr1XBcOWY1NqVYqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7QIanrwSMC8OFA2eDOu3OJyKo4DCPluFencZ3dlj9Q=;
 b=RLtSEZi7P/kNFjw1hpA/GIfXz1iKalScmZyV1Pz39DZARyVh6yiMBOnzke/oB1RDONEq0VX/wbRf1+xrHlnpx65oNl/91F4nuiA/mSOizSJo9pLu79AiaorSXrQtKWrLafv4pieo9vkq9IUdegCQD9pUBHThdEm3NfJNy2C26Ws8g52TFrmzvJ4tVpimdVRJEeDrPhsOSZ+WnOTzbb7Ttv+ENzJTbr1N5T3kuvnX+OUyYkbKYmZO4WFt1th85rQO/qozUqJ/FFU2Lo0D58WTL7qZ6ttWY/f+HpnMwomfeb6o6fjTT8PgLOnNtLrQC98VqUyn3Yfml9h8h4+zALg8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7QIanrwSMC8OFA2eDOu3OJyKo4DCPluFencZ3dlj9Q=;
 b=ZoZSZWHAF+zi0GZhVoGz73iCsRudtl1Jz9zqFnAeLMW2dqdGJ0SpZNh4GW40qOAiyJKWfKji++Ij2bOYq8kwn0QtDMTCLELPaiDdeeUBaE4cBsK9ll4Po6AR6exGbiC5IaYMsOXGFPozAv9gopCc5/3N1hcrrRWnQhIX/Wk2dTg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 08/17] iotests.py: filter compression type out
Date: Tue, 20 Jul 2021 14:38:23 +0300
Message-Id: <20210720113832.586428-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79a76094-7252-45ae-fc2f-08d94b72f854
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6119552008A41A3A04B04276C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8NH+XHOZt59z7JNRNoqGJL9Wxd5L79R8d58MGb4niF3Tau8pwD2D+bfD7tcjNxCCBniJLSfVk3mim4oywyioU1DAMRN2thnprhGbS3WskqZuH18G2uTIX3bdS2l5IwiEUcgmth1dHzzDW5ufQAq79XfwMBAnlYZUZYjRkyAAYeuEotCYLT85JoC2YaM6tRlVp8b5QGRlkfPWskK4FM3KE4xj60c5X5VdMXslBhZ/RobyCzOLDwJJ3QDOC8eWKyOiVNfHrELBYURIlYfdeNgnzJIFB/sB26WJHfaGGgqeggJkWL257p+i6ZKd0rjGHo2MPS/0UJqw8E6ruoKGVZw7v95VyTtbQ2g4uGuLoBuOP+lO0qc62Qv0QJtdh8HVSYsDqbqD4fA1Byi4LqPXdWD7IdWlZTm55IVpA39P8h5O+LkVAGkHcC7Lsdj3Kl/qirTiawP2OUsyo0KB/gT2hjQJLftO5Ls/7VQXfc7EwUAi0iF6Lso/DY3ApKH1P9XUkFWxE2KODDZG0k06yzbZ3gLvGoucpKPvsIbAyCbdSNCiT0cGbAFaRgBVZcr42cSKY7iVuXgsaxEA+A7dcM2t+CNIXp8FVJMeIdwkTeg8Kv+M1CwaU3x3xHJEjnQmRXF/NHW0yXvDbhnX83TEyf1MGSOuFelskaZMzjh6QvQbeqdnaCBZU1f//A2P4Ifb3dp9LmRCSISPPiW8iPHVRfRRuSLAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K1Q5I5VDgoigD+t3xRIoeEBP2J6s/tUt4vZv9JIsiDkp/pEjepdaVbD9ZVY8?=
 =?us-ascii?Q?H+i3tIPmQvp5nU9MeBf1vK+4PSOmgzigpjhSIt3kfgtmROqMKpaP2Bwz49Us?=
 =?us-ascii?Q?BSt9mbih1A8kBvfcja0Ro90FkkA23He9O8FAKjZyfwOU6UmOhLN0fRiggJwd?=
 =?us-ascii?Q?/umGRCJZtnLyytoSR9f5CqDtr+WQz6HVLIJ3Izoeym3L3iWDU+bffukAAdg1?=
 =?us-ascii?Q?nKUqc3mEW4nn//ak+FEsBB8XIRLo+kYIwrFwI4ZkWbt5wpu126tBnfYI37DR?=
 =?us-ascii?Q?xPZJdajoeSTHG+2NDu+OfwkjldGuSqt20CjgJDmpEzSBMFL9pIflrnu6UgAU?=
 =?us-ascii?Q?dURakWmFZXGQZuQ9C9lsGa2l1hKZ3xVDEbnzesSFu+Iua24QIFA6M6Eghsct?=
 =?us-ascii?Q?PxfdU6uFdoWaxeyyNoBkg/D8xvw94JyaF+DL7qafXN5Wm6lO2tmA8WH4g3xW?=
 =?us-ascii?Q?Or4KAa4Sn8wyn1hxhE0PZgiB1vQTk+G7Cljpx5+iacnb+xarJYWdlPXRv53G?=
 =?us-ascii?Q?w/dUtQ+iAR3iHGzlJ6oajpkEXAJRaudYMj5Z7ybeUiftrcIorWtaGXAqWFa9?=
 =?us-ascii?Q?2cutaebTBrMtfsd3Ql2/CvmkrG7FVkPnHeDVXqfCmSmhkhaHBwSTP2KZAVu1?=
 =?us-ascii?Q?bzcQ9o27yuluUO4sjDT6VhyAUID8o/7Dwlbm8hiJcYLBdtiZG50BjLiQc8Uw?=
 =?us-ascii?Q?NyV9m/vw58ZWLVekEr+NMX4eidPyvpbQwFaL7WbetyXxJuXOOTsxBnCefqe6?=
 =?us-ascii?Q?5uvlD2ju9Hh6RskYIeo1mBKf5jJKtTn2LVLXe+Zvse/vDshzqOGyeL0BBKBe?=
 =?us-ascii?Q?m/WIP+JKrTiRHcaVOwajpMfriW1XoPmT0Mw6DOADogSXG8vtB/dV7vwiSZtp?=
 =?us-ascii?Q?RS8LpAYFS6sbBo/OBdoW71uf7kt16lcwjXnERkVBNlaGH4uIpMYJ2/5Gm0sr?=
 =?us-ascii?Q?/yfC/yl9811pmYWtZPmlK9ZNJoHC6DG66vBjXIJw5BoXld6+raRHCCdJg0eW?=
 =?us-ascii?Q?enri/mbhVIKWR7dFe5/goPrKzNNuItAxV8EzBl1/Ao63JxRT2wBzeABRiiQh?=
 =?us-ascii?Q?9bKOSTNwDTCYhViNjYyvK2uenlcyRfm7UhQb8Q8u4r+4LyMSES7SDmvni76y?=
 =?us-ascii?Q?+1N+LQMFRuMDPZF4TjvuB/5wFZEGy9NkJubYe+D36b5E4A6GlWDWJx4U1UFK?=
 =?us-ascii?Q?QuNLc5jrPxBqt28rYT+BFk50KmT0+qycBFoIS21lUeYInI1arKGWr9egXrAj?=
 =?us-ascii?Q?+L2G62jW+VEyzf3qXdUZVkSs4TJMppWfVIwEsHyW5uXMGRKx3ZPbuTXJ3Fmq?=
 =?us-ascii?Q?spwhv0gxFNph1GN/5Aq1F9a0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a76094-7252-45ae-fc2f-08d94b72f854
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:02.0174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wBv4DZwNvF7Cjo0zX1vbt3TUTnOIiJti8Dwz09QA8SBBvsOUNAbWmJ7hRDis7fCTnoptF0ID5QP9XhAOQWegvA0PF70xf5zblNeEmVJd68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We want iotests pass with both the default zlib compression and with
IMGOPTS='compression_type=zstd'.

Actually the only test that is interested in real compression type in
test output is 287 (test for qcow2 compression type) and it's in bash.
So for now we can safely filter out compression type in all qcow2
tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/206.out    | 10 +++++-----
 tests/qemu-iotests/242.out    | 10 +++++-----
 tests/qemu-iotests/274.out    | 10 +++++-----
 tests/qemu-iotests/iotests.py |  2 ++
 4 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/206.out b/tests/qemu-iotests/206.out
index b68c443867..253209eca9 100644
--- a/tests/qemu-iotests/206.out
+++ b/tests/qemu-iotests/206.out
@@ -18,7 +18,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -42,7 +42,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -66,7 +66,7 @@ virtual size: 32 MiB (33554432 bytes)
 cluster_size: 2097152
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 1
     corrupt: false
@@ -92,7 +92,7 @@ backing file: TEST_IMG.base
 backing file format: IMGFMT
 Format specific information:
     compat: 0.10
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     refcount bits: 16
 
 === Successful image creation (encrypted) ===
@@ -109,7 +109,7 @@ encrypted: yes
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     encrypt:
diff --git a/tests/qemu-iotests/242.out b/tests/qemu-iotests/242.out
index 3759c99284..ce231424a7 100644
--- a/tests/qemu-iotests/242.out
+++ b/tests/qemu-iotests/242.out
@@ -12,7 +12,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -34,7 +34,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -68,7 +68,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -110,7 +110,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
@@ -161,7 +161,7 @@ virtual size: 1 MiB (1048576 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     bitmaps:
         [0]:
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index 1d2928e14d..1ce40d839a 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -50,7 +50,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -79,7 +79,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -114,7 +114,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -141,7 +141,7 @@ virtual size: 2 MiB (2097152 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -176,7 +176,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 857676a329..43c1e723a6 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -454,6 +454,8 @@ def filter_img_info(output, filename):
                       'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
                       line)
         line = re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
+        line = re.sub('(compression type: )(zlib|zstd)', r'\1COMPRESSION_TYPE',
+                      line)
         lines.append(line)
     return '\n'.join(lines)
 
-- 
2.29.2


