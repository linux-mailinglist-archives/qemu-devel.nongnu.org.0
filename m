Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0195A47E65B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:27:09 +0100 (CET)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qvr-00021u-HM
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXy-0005w7-IW; Thu, 23 Dec 2021 11:02:27 -0500
Received: from mail-eopbgr150128.outbound.protection.outlook.com
 ([40.107.15.128]:32197 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXw-0005La-6H; Thu, 23 Dec 2021 11:02:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m605H+jqgMd/1lIZZyKtPYAFeNyvIplZK0ODFsemJUH8yLAekQ+gsncsqVubpQZa4iKkpJ+dQaEIib+42OffK8LDpIYpdfcTX/gksmlOd0FvzcMUqhN3ZyyFCD+vmU4hfRilzlu6ExsWfl9Gl+3ICGA8DQj5n+/3oLSDVBPbTVFE6WIWxdo4u2KOhu5vht2tnByXRocftV8lox4Whymj60osMZxNcrtXPdwiJVNrEo+EFxlWCPvvXzN+vjDkCLwGOOAmb+I8lQserGFX1aHvok2Im6NbWEPeofBBCdpV8C/DqEsRnnS6klizPq/86yTccedALMEd+tJQN512XsJ0xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ9oSHqLXKFNKhHgPqYkrc78zjIZx1hVU7ZozAuohNU=;
 b=EbTcQRsuL4178gOC3+ETyTeDkQo3fgI1eWwRLlhZGwLflY7FQHw1LvpNHnuoF9nrs4joKvfJD0R07SE1X9V05Wgzcfc7p9OBRISPsntyyMdsXPEJmVsuvlU33zPF9qcCAfQf4hNUn28clxnRMgjYqWPUVXhuilBIM01LaiEk7o2IGG1SHljdEaPQSaAe4W3pJQN7nm8Cfoy+Dku58Ad+oWFhQ7yhJxog3evA+iXQtU7rYJStcraJHzWJ2AmT5yn3dXjUKV52PocprVx5gwq9RtHtPxOJbTSzy2/xcw8As0AmzywDG/wxQOxZawvvE34NHWOTwqmAkLL5YS8RVVlfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ9oSHqLXKFNKhHgPqYkrc78zjIZx1hVU7ZozAuohNU=;
 b=oOkOL1q3CkTLlW2GmXb2SJiyUhYz7puJMjW63RBvtM0ICGLIRK4zWWVQMSAXyOmbjR0EbszBKAZ9bSk3MRl501ZpgeBye59EvBPCCatuHzL3eNd96F6/2B4TlBcdnhrq3BhtmeJphl+jybfnwcn7GYk9JMStydVskUlNM5U6vyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:02:00 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:02:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v5 14/19] iotests: massive use _qcow2_dump_header
Date: Thu, 23 Dec 2021 17:01:39 +0100
Message-Id: <20211223160144.1097696-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c124ce64-e4f7-4f26-6c34-08d9c62d8d7d
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB614841CE123B3355810C48DBC17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A4DKequ/m3ecSpwZfISrF5CKqYsxFeLrAhtUpP04x7IO7Rdagvu97HROyBs8wEyh1qGfaBw4Qo1WSPHyKZUEryMsglLzkSGZ+A+Zhaoa/8/+PElho9i72QjVI31qJDFMdz01bD/jPgqX6KA77TBuF+EMq0NNWvEoifSKJ5cNQr8DjPEJVGmHxNYJd968ej48zd6uTFwTHEgO8Wb9urEaEKoyIZa4un/N4WZ5Qm/eOSlx77iauih2X+5upJ+Lrgpb7nWmFxg4HFGJVPTUcHVwFVjvFj+Poj58G4U1yllCpns+h8io6HQaN2VDVCaFclIC9uOCUQVmVNwels/QlJlEK59YJMhvmjX4GKg96/WxI9Wzw6LmaaKYihVDw7RPBJ+dDUhEVyEllINLKCrXgn96eGjCKSefHJiwnM9et5W+QE+T0LkwI95qGfEMmzmN3MgCyV4FgAJ7Co5XwcH8OSBZXy4naXFq9kftte1jUbHKB0wjj/YqNKdwZYv8fffyJwBUxIy57n8BR6dhPaB8/h3806/QuChl4J8ZgGs6frBBmqqoeea0HCVzAPX5YLuRtA6aqlcWWjsbKtgat2wAr0O8lPkwCSV/Zhp4jo2OaXM++ld/hZ0Q0BHj81Mmdejw0Jhw0TFHFQXObomq2P79NTRxVR1a7ana1YXzjamB0ggT7MDIhplUjctKkUybLdlS8MO2pXzwfJtIXlWjBRD3W9SnwzAuPulOtU429islPWI5sIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003)(14583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HaR0scFIgLKqbr/RtQ01aXiQet5p4vRhooR5SDEYDjB8BFrPThVDlIp8Gf+H?=
 =?us-ascii?Q?P5q05SJ3060aKCVQHl9oBFXYCWrAAPyU0Bj39cOM8nvLXmT/R8MVfPhL3RPz?=
 =?us-ascii?Q?GWEyogvAG2ZOXFfCaQzplfXmz4PwZoqvGvJEVAFjEtCUA1PxR9DUHbDHWH+F?=
 =?us-ascii?Q?1iATrDYlnl5yBXthYVz7QDLy0HFfBYUu70vZUvJRugk4bBgjY9BCBLiqgsBd?=
 =?us-ascii?Q?SIsAyOrQQHSlpd1BTKJbiUj8ieY6idO6EIHh7r0Q/3A9X4c+Jc+8S/8G+0GP?=
 =?us-ascii?Q?03/Bw1yhR+dNHpWYkO4E9XIJ2/Gbw9IioUJcQG/bcOvgpAjLraMvFW3X8hIt?=
 =?us-ascii?Q?Cx4wKiUcY6j+VAcuwQB0BLneEY4IFTwFPisB62MEPbsVfYR4AfnXreP/EWwL?=
 =?us-ascii?Q?cHvt/6+KkPt7jBSFLFwus8gjr+MJn9UPBMEXwppad/fNlCgdxUppXBUfm5Ld?=
 =?us-ascii?Q?0JlC8Az40bd9/rM1IQ4HxcmFVaTw1tmWSuQRpEFOM/sfMCPuqG/6gZKOHolV?=
 =?us-ascii?Q?hCvEv8TtBIW71+uijBN1OAHC5soYlodiLX1rXomx7cFUa/d2pCdj5n3Glfti?=
 =?us-ascii?Q?hSHQ1cX4KFIcccPZXit/UKXN4+Cz1oxXDAJoKoxi+EQESv+3BDsiXwcDsDQy?=
 =?us-ascii?Q?Ltch6oMf9cVqDnL79P+W3PImweZUXSEQA8866Y/sDCPiUfa+3GOW2XCtg2Dg?=
 =?us-ascii?Q?oo4h8ivo3HF04SH+WrkbjFFmZBdv3zj4XMHVl5Ve6SuOKWbFZjqXFrQ2sesz?=
 =?us-ascii?Q?Hn+rmgTzEFKWdNXM/RyiZC0nVi1b9GsDZJ3yCeJFmDfk7Cz4hQbP8q2X2uvv?=
 =?us-ascii?Q?zsGu97kMt+cZ1pFHTVn6oluuNypp3rSzXKlc1yWpRn88Sr51/OcdAsNPIexl?=
 =?us-ascii?Q?d8+Hwnbuos/T1h10IWUHDq1KEIoFnN+AlFCYEEZZJ7Yd2Yg36qB0Cv/ZkAgg?=
 =?us-ascii?Q?s+S9KQQ3qj324QCFRXt43ACNHaKAYf5Q1Q3mRpEOR4MxT/WlXlDx7a2gbt0a?=
 =?us-ascii?Q?P2iof7QuE8xHLOeT0RVtv/bzXUhIkM58FQKUNqTjFK/NXqfEUICZbVM9miXB?=
 =?us-ascii?Q?qXzIh2T+E01Fe4gGe+djOOxtjXtSy2bJ9fnfjFBcxYhmFUhawLpfwBzV2n35?=
 =?us-ascii?Q?h22kUKpgUxRDe4XJt/HGDGoMQXJdR1xgtUjERjxr5125hW6IRBa8dkvULvGv?=
 =?us-ascii?Q?6SJ8LlbLTVE4p9NGUizki0aEmxqd2YM6FEbYsk8Ri8xkgwzfPb6aVrfHcwJI?=
 =?us-ascii?Q?1CMn4rgNi+a+IRT/nCpxA4OcuTfAmbmc/oxq1ll67xTxYTpp3nYeBDu3z6XL?=
 =?us-ascii?Q?61E9DljCJxnmtT7t1vUzspicwEFxFUA9517wuoeA+eA+HN0+8Hm7QmwSHhDp?=
 =?us-ascii?Q?+1FX7x76YX8c+gv9AKVCxJBbpS3wFyKYQffaNUyBar+C9KfwaJYx2NaPfeMp?=
 =?us-ascii?Q?gzixWd2oI5hlvm0MLjArea0cOsko2VAdE5y/RSv8qeiANo8p5ED8WWtyStgK?=
 =?us-ascii?Q?kcHP9iMvhTskXOsfTDmu9UNRy+smVbh78HDfDML34csdo2ZrHqCJ2oZAT2SV?=
 =?us-ascii?Q?RO38atovrXfNBEWJK8xDAXKVsc9h2W3hzjwvxpAwXnd2Ek9nmKwFqMNGMAYk?=
 =?us-ascii?Q?UHK/VMGBpp6FAxCBTNqSFiyRVWCj8TfkZbcnPsg1symBXdN9YVXlgIQ2Vjc5?=
 =?us-ascii?Q?L92IU0tB/TGJWctf6zF6FtbpAGc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c124ce64-e4f7-4f26-6c34-08d9c62d8d7d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:02:00.0833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6Lc6N4mE8EwJijv28rLOd8R/FDkx7qYWfJI7WySYAOGlxNQ/7LpbgZdDsKYgpzl1L8J6xFAvYYWeBsKjVWfa090NEmBDibUJ/bf7LO9vnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 2d5334e8bf..5427ad5456 100755
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
2.31.1


