Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F532EFF64
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:29:33 +0100 (CET)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDN6-0001ws-VV
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL5-00084J-A9; Sat, 09 Jan 2021 07:27:27 -0500
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:49601 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL3-00065E-Du; Sat, 09 Jan 2021 07:27:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Akf1grYh8+ekgeyVQ6S/ehfvpKgWrN9m9XMVuFuTD6qn0OJcfahMyOzEiDe/3T1iHboqd/15bZIGtRbmc+s2wFGv0BQw1O5lUARK1U4108lg4IIlW7JNZxVV6m4LpnQgxeQjAfWbeUQ3Y3FBpJER+/3mL2npw8P0+v5z5NTd/Tb4lzB5uaq79FnyGTRa/QH11TrIdS/OVd38MHPb7rM4EXTk4IYVRGNwU6F6dHw17CDF+YUlQPt6Rv49f/jhxCYlqjtOiBZBdf7kGPRU6STFjDv2zafL9PZf0qN+TTxH7OcmpPZzpHHU+gnDSl3D4YKqwnglLhckeMHaSUK6Bkby1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktw++WXIDRUsR8igEurpSfL5TH5kA3paQX8Y57F97fs=;
 b=JDwh20mdyu64MiicEGSFFlk9BwvV7kLth8Q4ktACs0/IoEh1OhagZ8OUmhAvW2R2cJNaiTIrLoihbQGcAj7EfdegOqBROR09IzXx/m5umr/8k8fmb86lwaMlljlZ6VRVwGTi1s/Zb1+0omtZxI496SpxNgqcSFwnVce96BTlER/1YqU1n7E9z05XMoV8QT7Ey80Fz14lwpzSNLMzEZX+bJSDb1YjyUwvk2OIXoGBb364oKHXYyKxsW1TdD0dxZ9svwSNWVDR/wdLulBwik3xOew5rMJU1y3+fvAhqiDIKKxSB9ATdkJ29nthVIRC7lmC1blMZIse9WOl6+qwo7l1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktw++WXIDRUsR8igEurpSfL5TH5kA3paQX8Y57F97fs=;
 b=GRQkUtsCzfVzyLoqNvx6x7NQbgL3ibjACPOOg0wv96gLYOfag+jngaorMWKYNBxIbxuY9efOsNxu+Uk+2D41cH2r2D9qeSxcgXPjhLiZRnbJJZNFNqOj8yamKbaiXwBT/wWbs12vqzEcfjVj8yGlZwxwwlWqyt0Ne9EGnkzt2/Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 03/11] iotests: fix some whitespaces in test output files
Date: Sat,  9 Jan 2021 15:26:23 +0300
Message-Id: <20210109122631.167314-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109122631.167314-1-vsementsov@virtuozzo.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74d74083-200c-4d5a-f387-08d8b499e061
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2529FABCA69EF340FC3404AFC1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OUycFuYizmCgY5qBigxUzCrII9LmWrZNdwgoxDacThmzrOTrk7aDaZkEHJPiEHBVHj+7yRn8fhupO0tlchC4PtkUj5A3hTHQ6wOH5vrMRlGno1CuiRvDOkvvMOJPbbnLMAvY+2qn1Xi6jotNMJQgxIlM0Wl/lUhCt15Dmw01zvmenHU1ZPBqD81lSi7h39R/wvJTrh6+R75qFNx4DPVZmGGI70dxnyfYmpgRj+1caOi6mON+qrOq6f6maYtqyUYDt+M9NVIGCHCOK9AikbEcbeOCXDiryLTXSQusmpMQwkTj6053G4uZ9RwmIs3A17VDWcjxISDGwQYdHVWp1+TEjDmFM4jJD0gzuPsqBLFknrgpcMU9Z+8lO0Vz+EmTWL5oTujfWJCaqR5VuftfLjgi4ODHk8fJgRKKlvN3tJARwfj4bpeIdOmAGaCaXo2z8Sd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RtmYHnnM9H4zeHYx4gEFJd6eYBcThS4nGhLsvndy0pekayDg9Doob2N2ihWk?=
 =?us-ascii?Q?S3VPP/jXFWWxEY1QTB4AlI4wbm8h00S7pk0rCEy3/9dG/2V4IgOitbbWMJRv?=
 =?us-ascii?Q?o4XQJZZDvoPADkA+xMFQsCQQ35zUNhfCLHKswWNALoJZQbkBqvdqKtG3JMD4?=
 =?us-ascii?Q?tWebuM6mtx0FDcBZqrrLqnOm3R+2tmKm4sNivOkHwZgk1CD8/lOYuDSGXKkr?=
 =?us-ascii?Q?NgZWHVn17xb3ftkIqR1GGTW9BJGm1tgJtes9hbEwBcCt3p2I2S3BmzVGD6w7?=
 =?us-ascii?Q?pkJN7XojZJ/OWSzC9tvf28iljxJxwW6Vn6sEgfoDJUYfYnzJZASjfW01FqIw?=
 =?us-ascii?Q?iJjwKlQTmsv+aOvA4PRSkmohYGxnirgHGKQnU+ONiSJCT8OxWOrbxuOsEkRg?=
 =?us-ascii?Q?D4VuRh06lAPa8oRVXQhTLgXCDBgWnVcMtsByZOQ/Nx/BzFuzSLwoQLMoJLAG?=
 =?us-ascii?Q?xnIonMKe5IuS4PjAIf/0JwVAmOk2ufjqtUWIW2OLiDwuCekWRC/CoE8G2Dik?=
 =?us-ascii?Q?mPfIcWjhD56z6FrjoWRZNo0G+a7rkNA1eULY/5tTW9WjhsCPxhbtGlCzlHF/?=
 =?us-ascii?Q?Cm4yraC7+l2D3zx9UudMQadWwV4DKVuHuwBlWIgol5dA6fwfTG5Bpnm5xy0c?=
 =?us-ascii?Q?UQ2u69WP+U+YBNX2MCn1EemTpnVuU7jzlM+BulFt5qsUra8CHMxd/nbeADwH?=
 =?us-ascii?Q?w0mht9f8Yc5xjouYBLo5AIufmK7gWt/1eLutaO/Esj5CAQZYBsU8P9ctn6xd?=
 =?us-ascii?Q?Ki35TqXZr0SKh4V59bcbfTIeJSnvaQlA/LOYvDBZGQ3VJaYhhLGGlHw5tiYA?=
 =?us-ascii?Q?F0qSCTS+4EDTTL9X/quOEZ+jlSSvFHzgw+T4mu+0m59Tuq6n+JvEtj84bteM?=
 =?us-ascii?Q?Tfmk66m11oL220Fhf/gKUWMO2DF591yXaCtT0vAmMLXzaZpwmk0l78WMm55l?=
 =?us-ascii?Q?+zulNg7Ih5Au/KhhWh/OzpcgS5mnOT3i4EHCzhBCdC+/Zm8z4FovihBzhiSC?=
 =?us-ascii?Q?yoMJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:06.0028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d74083-200c-4d5a-f387-08d8b499e061
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgVP+H8q/zfZ99H0/itvrGchzkw/r8Bzibou6hHexiWWSptfFWIyf4ENVf5G33K4d0ui3DxwuCeNf1GFQ6byG2r+aZGhX6CYoOqlpMaqtW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.131;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to be stricter about comparing test result with .out
files. So, fix some whitespaces now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/175.out |  2 +-
 tests/qemu-iotests/271.out | 12 ++++++------
 tests/qemu-iotests/287.out | 10 +++++-----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/175.out b/tests/qemu-iotests/175.out
index 39c2ee0f62..40a5bd1ce6 100644
--- a/tests/qemu-iotests/175.out
+++ b/tests/qemu-iotests/175.out
@@ -23,4 +23,4 @@ size=4096, min allocation
 == resize empty image with block_resize ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=0
 size=1048576, min allocation
- *** done
+*** done
diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
index 92deb7ebb0..81043ba4d7 100644
--- a/tests/qemu-iotests/271.out
+++ b/tests/qemu-iotests/271.out
@@ -500,7 +500,7 @@ L2 entry #0: 0x8000000000050001 0000000000000001
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #1: 0x8000000000060000 00000001ffffffff
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
 write failed: Input/output error
 
 ### Corrupted L2 entries - write test (unallocated) ###
@@ -515,14 +515,14 @@ L2 entry #0: 0x8000000000060000 0000000000000001
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #0: 0x0000000000000000 0000000000000001
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0); further corruption events will be suppressed
 write failed: Input/output error
 
 # Both 'subcluster is zero' and 'subcluster is allocated' bits set
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #1: 0x0000000000000000 0000000100000001
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
 write failed: Input/output error
 
 ### Compressed cluster with subcluster bitmap != 0 - write test ###
@@ -583,7 +583,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 # backing file and preallocation=falloc
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=524288 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=raw preallocation=falloc
 Image resized.
@@ -592,7 +592,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 # backing file and preallocation=full
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=524288 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=raw preallocation=full
 Image resized.
@@ -601,7 +601,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 
 ### Image resizing with preallocation and backing files ###
 
diff --git a/tests/qemu-iotests/287.out b/tests/qemu-iotests/287.out
index 6b9dfb4af0..49ab6a27d5 100644
--- a/tests/qemu-iotests/287.out
+++ b/tests/qemu-iotests/287.out
@@ -10,22 +10,22 @@ incompatible_features     []
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     [3]
 
-=== Testing zlib with incompatible bit set  ===
+=== Testing zlib with incompatible bit set ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     [3]
 
-=== Testing zstd with incompatible bit unset  ===
+=== Testing zstd with incompatible bit unset ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     []
 
-=== Testing compression type values  ===
+=== Testing compression type values ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-   0
+0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-   1
+1
 
 === Testing simple reading and writing with zstd ===
 
-- 
2.29.2


