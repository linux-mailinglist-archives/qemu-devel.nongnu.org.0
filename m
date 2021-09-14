Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EBD40ABF5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:44:30 +0200 (CEST)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5vR-0002Be-Ia
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e6-0005C1-6u; Tue, 14 Sep 2021 06:26:34 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e3-0003Ok-Fo; Tue, 14 Sep 2021 06:26:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1UsKSNhB4FjZBebXiZtvuQZ/zDIojXCZU2krlDRMICyISTdbxnYDTgwDAeIiAP26qd/pGF+vJpjbxR5L5wCw+kkf2K3urhWEg1X1WCdQJrJQpdAEZWavGihQUE44gjbMhTFlDT+zvUHaAeQVNfkZFLbQxp1ArTucBGcKvm0VrGphcaYCaPNVXgGm5di9TTLE1+9Rl/qIXyUH4OO1XPVVYFYjEu8ocVGwYqEd62pfDj+0zuH8jE8quyH8+QmmldC1ranoEeZYjZijriC7NVaeNpJVR/4oBBuqKQvYqKFsc0j3W3X68j4UcMFxDrykL2rMbonA5O1cu0t6c0gBQYHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=J1j0tfa4dqplR197C7cueCRvfxSWt4GHVx3+nwnhavc=;
 b=Cku3s7I1EDvoFdbay72rzN8nKsNl/5xpgA1CZzCzsCHUH5qYqPIoNJ7tfGWCZkYyvPT2aSwjP/5VN0bQngNXdQaovQIxXp93+cXsrxYecnF+H4rWzMHDo1cZrqN+VBDT+hknx/UdOYvYnqzTRQR6QJiPf5I/9q9588hyk8607RGEClXc0SmklLvP4wP/Fx3J/ALMi92BXKzJonNJkCN23LGFWB5P9MSkm8lvDExy9kXBPlrbd54ZjJ6g1y+YPj+l8Sednxpu/+8HL9zmoxNerIBPNbvm9nlaq4KVZSUOfYyagtdW7MLKc9QaYjtHQoDiGzIdkjiACaRNnkSIq2pMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1j0tfa4dqplR197C7cueCRvfxSWt4GHVx3+nwnhavc=;
 b=SN+moc+SRlfYGhZP1wjaIXIGBRf4IxmyYUuHxTa/8BmxnX6J6TRIvu/9GgzCE4CtxO5JgaIuQYXD9slWWzRl4sVm1SkNgQZ09H7fENn4ddgX6JW1FGmtGe7ywoReki64nlVp3vjN8EVm47n8tPT0l02ABxId3aM6eFgDX7SERjQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 12/17] iotests: massive use _qcow2_dump_header
Date: Tue, 14 Sep 2021 13:25:42 +0300
Message-Id: <20210914102547.83963-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93109484-e4c3-45e3-7d7e-08d9776a1782
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB607131CF7739033D36E036F7C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3UL5Ctk+Lmd4ROCuC1IlKxfQDAx6Jyp7EEOsyCQV01m37cs75jKAIp8OuCJNpSbBjTmgm8sii07pJKX0PLv+oEUMwbC5Hs5DWGxXV+VUFevt22O/K4fURu9BnwPVhkfkwZu1OissmYXFqixeMhg0bT89DoExmn0KjnkNfxGuWriR55i2Ct/fuba8AJPsouilBpf4wCW/yKd9DTt1xGe/ygMRQBkHPqjdKcT3WaePcqExOR2h+/XaMtKlr4yEHRYKNQ7jggKU32msR8lWt3MRyc87jWeQIBS3gqNAXsiM9LhdRhUl996p9Q2Tdo7b+fIU5B4kuG46K5/WQOyJ9R5OORmJlqhlDA2ePF/c/1b2LUyVBmx2ajh7RSp8NwFAjPzFESnjmj1tVIKbsV5SdCADckOZpyp/nyTUkdjqw3kja0AkI1oVKP1J2KqqxYnSwkwWysWp4eOZZcs5jIeTsxhk78XkSIa9kbfM5RVvQ3/Z8Oz1QYxaOMDQqO+vO5r7PjQFLayzEiEIq38E0AYO5/F2GgmaaT8bcOHIEeLqPn5baRU82jFQTuxHz3OvlAg0SNuADYxIupu8gL81jFv+SFxO/qjZfWX856BCjg8emnozMAGFnsoGMj7M/slCbvEsScuYSCZ0puLfxuFVw9gyiz3zBD0SU46P41+v8keppuKL9awioEkwrYRSDW6Fs/7HANLC5Wv/kkYM7r0jXsZET3q+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(30864003)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002)(14583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sOF8KkrUgdb1jx+EXP100BtR8DG/w9GG+94V1rD0xZZUUvPXaMd6o6xL+wx3?=
 =?us-ascii?Q?SrxFKjiqYNLtrzlg15dnNKvSybQ9m1zkan2Swtn7jkwzKpUeZCdwwLEhsZA6?=
 =?us-ascii?Q?l1gSOXq65SOcyj88lOPCe+mGjjYwoZkGbjN2iuV0pGVmGN0rvojvVYjbHsge?=
 =?us-ascii?Q?z8GEIX5YXjlpnl4dNeeWBIy/K87Wn2UhDUReTLqPEo6ZccNTZvNuGkiHSYJH?=
 =?us-ascii?Q?pUPazkVSStSE44J8JY/QnZx+ZxBCkLXUPKI2FAioaJJ5vRi0w+tWAfKTpreB?=
 =?us-ascii?Q?DzhqMgMsG8KE3m9Ip2ivG5k4Otp2Zltyf/dDtF0+L9gLNoAkwZb4wSQqglRd?=
 =?us-ascii?Q?niZjmTEXkcdrHhzso2hkIEQn20BB29P1DKGPLX0+E2doRcLc39Bbqg8j0zk/?=
 =?us-ascii?Q?fLJXj5+5MnCfQXTCXyAnRWpHOZlx4FXzpNIFXi9mjOn3iU5Eimh7K9FaKX8u?=
 =?us-ascii?Q?nYUVHumMbpo+9+HYSwJs8RaZq7lwmGKWvK4DqKAI7PVNNiYpYOc4LwR78xtf?=
 =?us-ascii?Q?73RE1nLpWYxH6CJr8kd5l5abMM34hJ9CGU1tjRdvXXRbegwZLiAqh7rM82p9?=
 =?us-ascii?Q?WpL675SNWBlzakuSpSF3P+43hShDr+w6e4XbbtJAYhyVCQDei0t6tdWP+9GQ?=
 =?us-ascii?Q?klpbyNvaYLK6Hgfis59RNM1Rh9tCNZEggxDfeBWnMgfQD9GZnQfoYl0pQriB?=
 =?us-ascii?Q?utIcO7JBIqiv+d5ivQ5sDSmpEQzAVb/0gBGShJFbNEw+WXvkY+5iG3Bh0ag+?=
 =?us-ascii?Q?Kd1R518dpL870OEqAePVbPoBzgnQjlDaxnuUk5QYsz10B8BMZoyAB5drz7uu?=
 =?us-ascii?Q?BVajJP+9B869wY9MXJbHMIoVP7eGMUojIMUnCJ1/RPRI9384kE2hr2TIjSFB?=
 =?us-ascii?Q?P4fe2WyfuaizVQPYSVlW7u7qliQM6PsrOlfFU+B8ZYE22HG7I0YYzejUBdaC?=
 =?us-ascii?Q?qFwUQaZOdrtVaJ8/hg/IGhZFPDraYec6N+wJiEzv0iHhm+CSGt4gwcIMvTJ9?=
 =?us-ascii?Q?H4bCdv0lPrUKc2Qf5PZmzRUUffXa+/tndWshXYxc1jKt3kOCgst5adD+8G2Z?=
 =?us-ascii?Q?MpIGAREoVCA6vQrLLcLhgaB+VcrQnCpb/sCVXWPrlZHQZmdXbliHMwn0ixbc?=
 =?us-ascii?Q?t5el4ZarKmL3Lb1tuJsPt9q09DeU6eRsfNyuYpLDvBwVgww7mlf5yROO1R72?=
 =?us-ascii?Q?W3yC28we3EdTjArz2BYPoGnw558npzekwqVT5UVa1ssEifOeNqnEy6wh9A5X?=
 =?us-ascii?Q?r5m4AdXcXZttkVGsVfVSu+Ah4em6wthL2ayJzqKklcSpsdU+gvO6FHKlW9bq?=
 =?us-ascii?Q?e7b+b+74sG+WrbkKQZSIR9vQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93109484-e4c3-45e3-7d7e-08d9776a1782
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:19.5676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cffy3A+hW4RLWn9fXESnSs+46EZRy0dZPVlAQsS+/kYXuq3epEjqsIr2haP0iiTIQA9sAY7+i6VwODTw+rTqgh16ijnaqawiByMKAy6Vd+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.20.115;
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

We are going to add filtering in _qcow2_dump_header and want all tests
use it.

The patch is generated by commands:
  cd tests/qemu-iotests
  sed -ie 's/$PYTHON qcow2.py "$TEST_IMG" dump-header\($\| \)/_qcow2_dump_header\1/' ??? tests/*

(the difficulty is to avoid converting dump-header-exts)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/031 |  6 +++---
 tests/qemu-iotests/036 |  6 +++---
 tests/qemu-iotests/039 | 20 ++++++++++----------
 tests/qemu-iotests/060 | 20 ++++++++++----------
 tests/qemu-iotests/061 | 36 ++++++++++++++++++------------------
 tests/qemu-iotests/137 |  2 +-
 tests/qemu-iotests/287 |  8 ++++----
 7 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 58b57a0ef2..648112f796 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -58,21 +58,21 @@ for compat in "compat=0.10" "compat=1.1"; do
     echo
     _make_test_img -o $compat 64M
     $PYTHON qcow2.py "$TEST_IMG" add-header-ext 0x12345678 "This is a test header extension"
-    $PYTHON qcow2.py "$TEST_IMG" dump-header
+    _qcow2_dump_header
     _check_test_img
 
     echo
     echo === Rewrite header with no backing file ===
     echo
     $QEMU_IMG rebase -u -b "" "$TEST_IMG"
-    $PYTHON qcow2.py "$TEST_IMG" dump-header
+    _qcow2_dump_header
     _check_test_img
 
     echo
     echo === Add a backing file and format ===
     echo
     $QEMU_IMG rebase -u -b "/some/backing/file/path" -F host_device "$TEST_IMG"
-    $PYTHON qcow2.py "$TEST_IMG" dump-header
+    _qcow2_dump_header
 done
 
 # success, all done
diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index 5e567012a8..f703605e44 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -58,7 +58,7 @@ $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 63
 
 # Without feature table
 $PYTHON qcow2.py "$TEST_IMG" del-header-ext 0x6803f857
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+_qcow2_dump_header | grep features
 $PYTHON qcow2.py "$TEST_IMG" dump-header-exts
 _img_info
 
@@ -107,7 +107,7 @@ echo === Create image with unknown autoclear feature bit ===
 echo
 _make_test_img 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 63
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+_qcow2_dump_header | grep features
 $PYTHON qcow2.py "$TEST_IMG" dump-header-exts
 
 echo
@@ -115,7 +115,7 @@ echo === Repair image ===
 echo
 _check_test_img -r all
 
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+_qcow2_dump_header | grep features
 $PYTHON qcow2.py "$TEST_IMG" dump-header-exts
 
 # success, all done
diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 12b2c7fa7b..8e783a8380 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -59,7 +59,7 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" $size
 $QEMU_IO -c "write -P 0x5a 0 512" "$TEST_IMG" | _filter_qemu_io
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 echo
@@ -73,7 +73,7 @@ $QEMU_IO -c "write -P 0x5a 0 512" \
     | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 echo
@@ -82,7 +82,7 @@ echo "== Read-only access must still work =="
 $QEMU_IO -r -c "read -P 0x5a 0 512" "$TEST_IMG" | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "== Repairing the image file must succeed =="
@@ -90,7 +90,7 @@ echo "== Repairing the image file must succeed =="
 _check_test_img -r all
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "== Data should still be accessible after repair =="
@@ -108,12 +108,12 @@ $QEMU_IO -c "write -P 0x5a 0 512" \
     | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 $QEMU_IO -c "write 0 512" "$TEST_IMG" | _filter_qemu_io
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "== Creating an image file with lazy_refcounts=off =="
@@ -126,7 +126,7 @@ $QEMU_IO -c "write -P 0x5a 0 512" \
     | _filter_qemu_io
 
 # The dirty bit must not be set since lazy_refcounts=off
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 echo
@@ -141,7 +141,7 @@ $QEMU_IO -c "write 0 512" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IMG commit "$TEST_IMG"
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $PYTHON qcow2.py "$TEST_IMG".base dump-header | grep incompatible_features
 
 _check_test_img
@@ -159,7 +159,7 @@ $QEMU_IO -c "reopen -o lazy-refcounts=on" \
     | _filter_qemu_io
 
 # The dirty bit must be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 _make_test_img -o "compat=1.1,lazy_refcounts=on" $size
@@ -171,7 +171,7 @@ $QEMU_IO -c "reopen -o lazy-refcounts=off" \
     | _filter_qemu_io
 
 # The dirty bit must not be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img
 
 
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index db26c6b246..d1e3204d4e 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -80,13 +80,13 @@ poke_file "$TEST_IMG" "$l1_offset" "\x80\x00\x00\x00\x00\x03\x00\x00"
 _check_test_img
 
 # The corrupt bit should not be set anyway
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Try to write something, thereby forcing the corrupt bit to be set
 $QEMU_IO -c "$OPEN_RW" -c "write -P 0x2a 0 512" | _filter_qemu_io
 
 # The corrupt bit must now be set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # This information should be available through qemu-img info
 _img_info --format-specific
@@ -114,19 +114,19 @@ poke_file "$TEST_IMG" "$(($rb_offset+8))" "\x00\x01"
 # Redirect new data cluster onto refcount block
 poke_file "$TEST_IMG" "$l2_offset" "\x80\x00\x00\x00\x00\x02\x00\x00"
 _check_test_img
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $QEMU_IO -c "$OPEN_RW" -c "write -P 0x2a 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Try to fix it
 _check_test_img -r all
 
 # The corrupt bit should be cleared
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Look if it's really really fixed
 $QEMU_IO -c "$OPEN_RW" -c "write -P 0x2a 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "=== Testing cluster data reference into inactive L2 table ==="
@@ -139,13 +139,13 @@ $QEMU_IO -c "$OPEN_RW" -c "write -P 2 0 512" | _filter_qemu_io
 poke_file "$TEST_IMG" "$l2_offset_after_snapshot" \
                       "\x80\x00\x00\x00\x00\x04\x00\x00"
 _check_test_img
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $QEMU_IO -c "$OPEN_RW" -c "write -P 3 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 _check_test_img -r all
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 $QEMU_IO -c "$OPEN_RW" -c "write -P 4 0 512" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 # Check data
 $QEMU_IO -c "$OPEN_RO" -c "read -P 4 0 512" | _filter_qemu_io
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 9507c223bd..70edf1a163 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -55,9 +55,9 @@ echo "=== Testing version downgrade with zero expansion ==="
 echo
 _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 $QEMU_IO -c "write -z 0 128k" "$TEST_IMG" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0 0 128k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
@@ -68,10 +68,10 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 $QEMU_IO -c "write -z 0 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c "write -z 32M 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c map "$TEST_IMG" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" --image-opts \
           driver=qcow2,file.filename=$TEST_IMG,l2-cache-entry-size=4096
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0 0 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c "read -P 0 32M 128k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IO -c map "$TEST_IMG" | _filter_qemu_io
@@ -84,9 +84,9 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 _NO_VALGRIND \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0x2a 0 128k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
@@ -96,9 +96,9 @@ echo
 _make_test_img -o "compat=1.1" 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit compatible 42
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 42
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=0.10" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 _check_test_img
 
 echo
@@ -106,9 +106,9 @@ echo "=== Testing version upgrade and resize ==="
 echo
 _make_test_img -o "compat=0.10" 64M
 $QEMU_IO -c "write -P 0x2a 42M 64k" "$TEST_IMG" | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "compat=1.1,lazy_refcounts=on,size=128M" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0x2a 42M 64k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
@@ -120,29 +120,29 @@ $QEMU_IO -c "write -P 0x2a 24M 64k" "$TEST_IMG" | _filter_qemu_io
 $QEMU_IMG snapshot -c foo "$TEST_IMG"
 $QEMU_IMG resize "$TEST_IMG" 64M &&
     echo "unexpected pass"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG amend -o "compat=1.1,size=128M" "$TEST_IMG" ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG snapshot -c bar "$TEST_IMG"
 $QEMU_IMG resize --shrink "$TEST_IMG" 64M ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG amend -o "compat=0.10,size=32M" "$TEST_IMG" &&
     echo "unexpected pass"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG snapshot -a bar "$TEST_IMG" ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 $QEMU_IMG snapshot -d bar "$TEST_IMG"
 $QEMU_IMG amend -o "compat=0.10,size=32M" "$TEST_IMG" ||
     echo "unexpected fail"
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap\)'
+_qcow2_dump_header | grep '^\(version\|size\|nb_snap\)'
 
 _check_test_img
 
@@ -154,9 +154,9 @@ _make_test_img -o "compat=1.1,lazy_refcounts=on" 64M
 _NO_VALGRIND \
 $QEMU_IO -c "write -P 0x2a 0 128k" -c flush \
          -c "sigraise $(kill -l KILL)" "$TEST_IMG" 2>&1 | _filter_qemu_io
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IMG amend -o "lazy_refcounts=off" "$TEST_IMG"
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+_qcow2_dump_header
 $QEMU_IO -c "read -P 0x2a 0 128k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img
 
diff --git a/tests/qemu-iotests/137 b/tests/qemu-iotests/137
index 4680d5df3d..52ee135184 100755
--- a/tests/qemu-iotests/137
+++ b/tests/qemu-iotests/137
@@ -140,7 +140,7 @@ $QEMU_IO \
 
 # The dirty bit must not be set
 # (Filter the external data file bit)
-if $PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features \
+if _qcow2_dump_header | grep incompatible_features \
     | grep -q '\<0\>'
 then
     echo 'ERROR: Dirty bit set'
diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index 22ce9ff0e4..6716419da4 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -61,13 +61,13 @@ echo
 echo "=== Testing compression type incompatible bit setting for zlib ==="
 echo
 _make_test_img -o compression_type=zlib 64M
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "=== Testing compression type incompatible bit setting for zstd ==="
 echo
 _make_test_img -o compression_type=zstd 64M
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 echo
 echo "=== Testing zlib with incompatible bit set ==="
@@ -75,7 +75,7 @@ echo
 _make_test_img -o compression_type=zlib 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 3
 # to make sure the bit was actually set
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
@@ -87,7 +87,7 @@ echo
 _make_test_img -o compression_type=zstd 64M
 $PYTHON qcow2.py "$TEST_IMG" set-header incompatible_features 0
 # to make sure the bit was actually unset
-$PYTHON qcow2.py "$TEST_IMG" dump-header | grep incompatible_features
+_qcow2_dump_header | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
-- 
2.29.2


