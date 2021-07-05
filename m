Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5113BBA17
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:21:03 +0200 (CEST)
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kmk-0002sV-HP
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki9-0002CK-Ib; Mon, 05 Jul 2021 05:16:17 -0400
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:48480 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki6-0007yh-EE; Mon, 05 Jul 2021 05:16:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ2SJ/PiC2QCBhAtFwNiLnOHAjsTxCbENc2+/MiRikQQGZnzltmDnfyIfAVimh9amb9UOGyVStLFX83QSmP81+cnTPIbmdR6ZFpTJBa3aSAfh6jI3pGPMP5xDf0uzuLU+DOu9xDu6GQRCh4ptrF+L85NwQBzxRNhYn+kv6zglcu79J3/ElY2P93JSYmLsHgxgLUJxbA6gkefQTO2UF8BNb3WfF5FIyI3TNhE7B77AGzdOWI2sJVgYGX6TtZCyvQdGSiitNQouLJXHdiIqxwVIbUbSqzYMhTTC0NbfWOVGiKYq+NvMV7MQpHKn5KlFvKKOv3F+1Sc50RpxWd9MiscqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrqzPags1gflF5OmXymyVmkKu5DSmsxA+f6cGXcpqEI=;
 b=oAVWlPyAh/OqchzmMAw5oSSwXI2uAvMs321dcP9eq0pxx0rxXhtSA3D6+ugi1YksEutrJw9sYA9Kntx1dmQH3sxKTxSYn0/vqXQPzBLz8RdX+zu9G5OGF7GV7ucAeNWrHBoddOr5GjFwq3bm0OkDBhDC994+rhLWsAOqrtbMNHqiMVLd8zxmRaRFVEAWHNvFT3K3hoZ0g6B5MTNe5kve3jI+PszrB+ejmKnScuCUQML1h/R8KOTXp46UZpcM1pec6ScheobP+CW9jShajnECDtkYByAFfOAA2EFeUWx2sBJ8STcc7Fo2eDlkB451xnWhKdg+MTDmAWEofFHAK0GPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrqzPags1gflF5OmXymyVmkKu5DSmsxA+f6cGXcpqEI=;
 b=vuI0zp6LpZ5X6BdcNk82U8R0Dj1pOUbGM+80nO066qPx9XO1LxGmO6a3wajn7/VYatA/htl1iM+xl83xAnuBwlkbMEnaT2cEH8DE+hPJ4biGLyk3Kq81CALq/tj8Buq0UpO5XI6J/mYxKTV/9H+pqUlKJb151I4Exd3PZsLt3Ag=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 5 Jul
 2021 09:16:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 05/14] iotests.py: filter compression type out
Date: Mon,  5 Jul 2021 12:15:40 +0300
Message-Id: <20210705091549.178335-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7de04ef-927e-4e24-db40-08d93f9586ec
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB453368B13F443791FA014613C11C9@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tYlFSOwq0on7QLGjcfv+7n6AJIqnwPSK9wuxv63PNGD1MSPqsySQukfyv9qDfeD4HkZF4CbCaZjLOFxEKpbBPt9DsGjBhmkg6Isbh/w4AQ/zT6mNFeBPCdy/4P4n/GzBTLp1zBzzzwgm9y5Pt6qVrNw+qJ0tNhe3tOJn/xb9XFwBIfCDU2xrkwY4SpaENVY6XBBKPP6nnhudN4pryojwEDw44Xx2yLHWVDmK+d1JBmPVlU0TA7FcJL2zu6YPaWJ0GNZG9UFHT2Jrf557NZ7EGxY9D51uPe4qMnA6lOTWhIUHTN+/ZLjl+pronwRDm/3qFlZ+w0YJ9GC214t8jPL60oiltXSfcGYoBHRQCNaVkSmjGwULIwYOtn3TuhAnVWoshuZjHuP/XSDJu0xM5W1Q48mmofoVIBSyC+DzidzgOaT9jXBpG7nmXG+2kmv/I5jXnXA+cJGqmLERZEpaUe6tTYQGIDPnXJ9J1s2M2IRtfdKlVAvj5HXyIVF2ES2Vsd1HYrC5o/XU9xtCEXxTAcQiKAEhRKdxMgnZ9ARC44EmyvgG87sWyYgnEwL2ekR7aZZ/2XIWIuPpJ6lYZF9UGZRGqJHgIXEjgA8jLeae+udKolIhvCqc/nBPN3tvwWxe/rgMzJb+VuN3+jFodiYtRmtR4AxN+Elws5Imd3r7XAf0tRNjc2zDbv+pjpEqua3brWfnGO6m6uAmvQel9tfEdKHwJ39FFxWIB5bRlQHDptMNLTjp9xVJ0GM7RU5QaoqRYUx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39830400003)(376002)(396003)(52116002)(6916009)(2616005)(5660300002)(66556008)(66476007)(83380400001)(316002)(86362001)(36756003)(956004)(30864003)(6486002)(478600001)(6506007)(2906002)(66946007)(1076003)(6666004)(8936002)(4326008)(186003)(38350700002)(38100700002)(16526019)(6512007)(26005)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B47aZK7wPGBCVv24qGVQLKMDKMCTkaeRSQR6vB/hn1PXam0LgGQKs2PU9ikI?=
 =?us-ascii?Q?MbgvJaAGg86YclbwpD4haLVXlt4yfdgvoRO8T+dqgLoE/uIk3/dWD+51DSxs?=
 =?us-ascii?Q?Eg3f4j0742D6G9C7CTUEiq8ljj1Bjfs5Pm9DJhPgYI96M6ygDgLTHTReHX0N?=
 =?us-ascii?Q?p/5wilXyNwgc3T5RHFm3OUFMPFxXOffSsLeLskLqcIc1prtTgROHw9in+wEo?=
 =?us-ascii?Q?a2+20UBHbJu9utiUcizOjDPnRiVwvwu7kFKQBtjJtBl1yrOwIsOpxopn0hds?=
 =?us-ascii?Q?3dAXhgbX6U5lfVqw60JPpf/1m5dG0AXmGYyUXtwVBbDGtqtiqO+tkP/CgK7n?=
 =?us-ascii?Q?a1QIiAXGoEbCIBDS8TTtkvBUnWTAf7HP+FtSOwMZFX7wlKSRPUMdyRfrDL8V?=
 =?us-ascii?Q?Hp0nW3YZLDfAR0eXL7TDyjo48gvJzhcwAg6SfF1t6XDkGm/+us27L9U0hN+b?=
 =?us-ascii?Q?8xyDHL+ijqIx+i7VojzY2Zy6DBVOS8F0290B7YSg2ulAy1o8NkhEBdaYmeQo?=
 =?us-ascii?Q?Se4mei3g5Y2RRned+zvWIV7v0UuFSgaPIMAiIMoDtPJVP4Yojo45ode/2Aym?=
 =?us-ascii?Q?kZ1JHm0RSB3b6XN+CNJk1nW8RGuM6KDiTQ/sHhib65rXYhNsfT3qckWyKKk8?=
 =?us-ascii?Q?kozakjLTzest1lslKKltb/JHWGhO83KDhhm3UnpVvgYJv6J5ozpH7lfZ7LV/?=
 =?us-ascii?Q?jqliHrkzeXHTzAgLKlGMEpuVB+s2gmg6sAwjiz79/OTabWDtWfgJO+kjtykb?=
 =?us-ascii?Q?v+Jk5vKSJ43OC547/qrxaPe9e7EUnLnYmrngw2i5Cc7yP10MhkJ3X186orzo?=
 =?us-ascii?Q?zbOmX0uSE+boj6DWRJ0ZRmukvxugiuI+QJ1orgh+evjPkDMTnfMG8pFxdowK?=
 =?us-ascii?Q?Xv2AhzW4apkUX+IGbygX+jo1h5nUZI8W9XZCn7G07JXmVG+oVjaY37UD3frA?=
 =?us-ascii?Q?YsR/dz4uzDRbtVyL1XMg+wkXRqJ1QEg6lX0a6mhlzcEFPkSmbIyHDr0FWDus?=
 =?us-ascii?Q?j6wC7Vh7j0FGeiJlCYxBaLUN/iSp6XAJg7dMz22U6YfJ3dvUcRIUcO7l52L3?=
 =?us-ascii?Q?m304ZijclxGGRTvGtasfCNzIv4Jm1q6BGvrKf71nqxeF2xELXsbokDj+DiR4?=
 =?us-ascii?Q?yufLtvovFPWuNT4IAryfr2wXgIFf80cQqxwHfVVlPA3y/82/CEBcTz4XPeqz?=
 =?us-ascii?Q?U02NEHfnWB/YCH/dyMcvrP8Zlms+bU2vgwlGRXYQqbX600pKwR8zsd2I5Zsi?=
 =?us-ascii?Q?itLyWdCNC7rjyAVE8zbEUdvYanAnDLjhtH1I+kTtu32+G1HW49wVf3kMb+Vy?=
 =?us-ascii?Q?TXBUH8u/gP+zLjLQuw8fTb7E?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7de04ef-927e-4e24-db40-08d93f9586ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:09.7943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0wNoikEfWeAINjSc+0fHOPLCVQ1am9y6CxMldMBesRAmpwdpSh3xllw6bQAIRFanY3MhK6oQdFPEDqXBP0VM0TAo82MJ/Xp8vsaQl40C1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

We want iotests pass with both the default zlib compression and with
IMGOPTS='compression_type=zstd'.

Actually the only test that is interested in real compression type in
test output is 287 (test for qcow2 compression type) and it's in bash.
So for now we can safely filter out compression type in all qcow2
tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/206.out    | 10 +++---
 tests/qemu-iotests/242.out    | 10 +++---
 tests/qemu-iotests/255.out    |  8 ++---
 tests/qemu-iotests/274.out    | 68 +++++++++++++++++------------------
 tests/qemu-iotests/280.out    |  2 +-
 tests/qemu-iotests/iotests.py | 13 ++++++-
 6 files changed, 61 insertions(+), 50 deletions(-)

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
diff --git a/tests/qemu-iotests/255.out b/tests/qemu-iotests/255.out
index 33b7f22de3..bd3b13474e 100644
--- a/tests/qemu-iotests/255.out
+++ b/tests/qemu-iotests/255.out
@@ -3,9 +3,9 @@ Finishing a commit job with background reads
 
 === Create backing chain and start VM ===
 
-Formatting 'TEST_DIR/PID-t.qcow2.mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-t.qcow2.mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=134217728 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-t.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=134217728 lazy_refcounts=off refcount_bits=16
 
 === Start background read requests ===
 
@@ -23,9 +23,9 @@ Closing the VM while a job is being cancelled
 
 === Create images and start VM ===
 
-Formatting 'TEST_DIR/PID-src.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-src.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=134217728 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-dst.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=134217728 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-dst.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=134217728 lazy_refcounts=off refcount_bits=16
 
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index cfe17a8659..eb23acd5ed 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -1,9 +1,9 @@
 == Commit tests ==
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -53,7 +53,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -66,11 +66,11 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing HMP commit (top -> mid) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -85,7 +85,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -98,11 +98,11 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> mid) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -123,7 +123,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -136,11 +136,11 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing qemu-img commit (top -> base) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -153,7 +153,7 @@ virtual size: 2 MiB (2097152 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -166,11 +166,11 @@ read 1048576/1048576 bytes at offset 1048576
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 === Testing QMP active commit (top -> base) ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-mid', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=1048576 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=2097152 backing_file=TEST_DIR/PID-mid backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -191,7 +191,7 @@ backing file: TEST_DIR/PID-base
 backing file format: IMGFMT
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -205,9 +205,9 @@ read 1048576/1048576 bytes at offset 1048576
 
 == Resize tests ==
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=6442450944 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=6442450944 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1073741824 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=1073741824 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 5368709120
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -224,9 +224,9 @@ read 65536/65536 bytes at offset 5368709120
 { "start": 1073741824, "length": 7516192768, "depth": 0, "zero": true, "data": false}]
 
 === preallocation=metadata ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=34359738368 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=34359738368 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=32212254720 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=32212254720 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 33285996544
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -248,9 +248,9 @@ read 65536/65536 bytes at offset 33285996544
 { "start": 34896609280, "length": 536870912, "depth": 0, "zero": true, "data": false, "offset": 2685075456}]
 
 === preallocation=falloc ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=10485760 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=10485760 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=5242880 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=5242880 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 9437184
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -267,9 +267,9 @@ read 65536/65536 bytes at offset 9437184
 { "start": 5242880, "length": 10485760, "depth": 0, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=full ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=16777216 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=16777216 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=8388608 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=8388608 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 11534336
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -286,9 +286,9 @@ read 65536/65536 bytes at offset 11534336
 { "start": 8388608, "length": 4194304, "depth": 0, "zero": false, "data": true, "offset": 327680}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=393216 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=393216 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=259072 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=259072 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 259072
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -306,9 +306,9 @@ read 65536/65536 bytes at offset 259072
 { "start": 262144, "length": 262144, "depth": 0, "zero": true, "data": false}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=409600 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=409600 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 344064
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -325,9 +325,9 @@ read 65536/65536 bytes at offset 344064
 { "start": 262144, "length": 262144, "depth": 0, "zero": true, "data": false}]
 
 === preallocation=off ===
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=524288 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=524288 lazy_refcounts=off refcount_bits=16
 
-Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-top', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=262144 backing_file=TEST_DIR/PID-base backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
 
 wrote 65536/65536 bytes at offset 446464
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/280.out b/tests/qemu-iotests/280.out
index 09a0f1a7cb..a40682d902 100644
--- a/tests/qemu-iotests/280.out
+++ b/tests/qemu-iotests/280.out
@@ -1,4 +1,4 @@
-Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/PID-base', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=COMPRESSION_TYPE size=67108864 lazy_refcounts=off refcount_bits=16
 
 === Launch VM ===
 Enabling migration QMP events on VM...
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 80f0cb4f42..6a8cc1bad7 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -224,9 +224,18 @@ def qemu_img_verbose(*args):
                          % (-exitcode, ' '.join(qemu_img_args + list(args))))
     return exitcode
 
+def filter_img_create(text: str) -> str:
+    return re.sub('(compression_type=)(zlib|zstd)', r'\1COMPRESSION_TYPE',
+                  text)
+
 def qemu_img_pipe(*args: str) -> str:
     '''Run qemu-img and return its output'''
-    return qemu_img_pipe_and_status(*args)[0]
+    output =  qemu_img_pipe_and_status(*args)[0]
+
+    if args[0] == 'create':
+        return filter_img_create(output)
+
+    return output
 
 def qemu_img_log(*args):
     result = qemu_img_pipe(*args)
@@ -479,6 +488,8 @@ def filter_img_info(output, filename):
                       'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
                       line)
         line = re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
+        line = re.sub('(compression type: )(zlib|zstd)', r'\1COMPRESSION_TYPE',
+                      line)
         lines.append(line)
     return '\n'.join(lines)
 
-- 
2.29.2


