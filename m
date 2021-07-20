Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736983CF934
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:53:19 +0200 (CEST)
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oJK-0002kb-FP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o63-0003UR-IH; Tue, 20 Jul 2021 07:39:35 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5z-0007CC-VC; Tue, 20 Jul 2021 07:39:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpD/PJWYAv6HLu92MllmQ+r8uMVyl9HlPQiqbYd6nCBTKLDvYI4CsOWeNZTvEoQdm2YhWg5ito7bZ+VPIzxHBp7wa84ycILL+WdL1M5ebW6ioU5z5yECWvxTEv6Seme2IhnuiFyRSKzbyX3bainoxx9QG7X7+PR3K7OTXE37VhQEw4nS8vREGMobDWzFFzQ5K1Im8nERRmtcnhZqffi3R5zyP78W/2xAst9ZOQ6swF6VgpzN+Ez2xFKnv29Vfn6vju/rsrY9A2TFCzqz5dF0/raHNzfzUaCICZaild/5W35+B6QKc8TB0mCLEDVsysNd7DRihyJWhWv6Kd8+++k7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1j0tfa4dqplR197C7cueCRvfxSWt4GHVx3+nwnhavc=;
 b=TJt0Y8lkWeU1Is9PYfRWkgWqgyhLyx3Hpcjk9e+Nd31e9i6/rWMPsW00BgsFA2jYZQlXMEmvk3MKal4h4nFk1k4mkbfUu7HFRkt2AA5en0oy7XuWNBtD3b/Z1Jr7JHNaXENW+Nmi25o02z05HEuk8CVyHudIgfFZ3xcXeqma0iWEjhvmHZSunsdZg/Nk+IrmgENp2K7G78KrDTkvcMDgG3m+P3GTx6f/fmnaah2EEF5qre5YtAeF7TBSSwxg32qZkhVAEP1uhTnEpbL1HMPJHgg+I0EjKAZp902Ciu3fQxic2EpPTsC6jsip4yEYvKRkM08nBxjlWFIk2W3+/Cd1VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1j0tfa4dqplR197C7cueCRvfxSWt4GHVx3+nwnhavc=;
 b=X8WWxidx1rbGoEdyJNhe2uQNzvrpTRjJ6Y3zwsgmJXnq6L69fY/T1SVxovXr9yewX0dWqO6bUMCxcrGPgpNtPWP5JTrCuBnCColvPc9FQuX2fSEqTpmiMHx6bpTkhxP0J/rJHmbzlemQsuN8PXBcOoviBvUwGc9rGcey4mNspw4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 12/17] iotests: massive use _qcow2_dump_header
Date: Tue, 20 Jul 2021 14:38:27 +0300
Message-Id: <20210720113832.586428-13-vsementsov@virtuozzo.com>
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
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f7f69e7-0084-491d-3058-08d94b72fc0a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB611934424D3A05FBE47321EAC1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAaAZytx1eWNRKfHMd3FDSrS7cobETKMoSITeI2vRK2AiQWkuZX4u7oOzcDM36MhRhoLlJKxPP0iBnDVXgc0xK6UeYd/DIzXM5J2Fa4ZHyJj8iEN1oHDAjQm5oUoQUJewdfQ8SYXpLL2oQv8RnFwwWNh/sc6S1u0ow1xN6ACzfkRE5W0OPL8mOnA1OaWOmGOu0ySW70Czj2jXBpBATEjBL+TbdmE65at8j160GiBuU7ch66Xg/jMob/fD8BgdDjaYthSSRGl+xcoPnsIxif1+H0KDlqjEcgZygQ+JxjE1wvqn0BTteVvbxWlNhl3lfLl7XTF1N5Z/FHvUcj8VqeuY9XrynhgSDXvDtE7SSbBwmsiGW/+rQaOJGjsMxYiWSV3AIgbRMadIn3cG6LVQCyzCTnSk3UBMDUnMwSBQfGHiNxhzYvtT/qtWh/i+7RrE7iewO/Q+6Jwyo1hcgthiTmmPd2qn85d5NBUF7ym4PN3HTrpNrsLNUm4a7AyMyVKMRq3rbZHS/5AqBNKRVmrfCVBpMAE6lPFYwvSThpcF7JI+Xj5Vk9Us75ve9k+GTsigUVWoQAnqcMRn1vtFf9Tjhzvc+FoWMw+hjTBAKZqez/NzksIMoqhlpSynKMj/zZnp341CKbaEEsd66Tq2gpRFJ1q14oAOI30cF+O0+5SC4LmtfqEPooiV2rWWRnl5jQIrP8SHHmErROtnSL/k64093mA7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(30864003)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007)(14583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q8DcX+tco7tGFagTrYc0/RmQMvmA5LdVSEA33AhAVa7oytuUdMJjDZqmwSTh?=
 =?us-ascii?Q?7xje8J74astvD6GfJnGY0QhJWMO2OyAgoRF74yAYRvFFI75+34QkpZCkysKq?=
 =?us-ascii?Q?QpJYDU/Zgwo6kGix89o3gmirIKouC45DIXda9AdyhT2xgiTpKtmoh3Wd+CQw?=
 =?us-ascii?Q?Y+lPuPZurJ6JJF3ZwvM0cYjcXHYfeB+RS3Gh9WdPXvHpIrTb0o2GtyPA7UXY?=
 =?us-ascii?Q?h+0GBooivws2KnvOtPk2xHpKY4aZif2NqyMvUxGLQim1Km/7B1F+is9amRWX?=
 =?us-ascii?Q?7CwAWYzijCL/hk8jGdszKDXd6/zphxFGHtaULKl9+eCxKka2MC4hWmlu2Ha+?=
 =?us-ascii?Q?ctoInk/CotGI/HcKYOAEp06IhJKjOTWWzG0sHT2iTY7Q+QpvqN6ruZjpiZ5b?=
 =?us-ascii?Q?etuOFTgFdY1i1QRfXuKxyWH9PC1XRemFyWZ5iy+mR6nFtV0bNkdV3JTqdSVx?=
 =?us-ascii?Q?BiUCaGi1cyUGibNMntfegQzv5v5SPhqTNsmKnrNwlEcYdnmwBG10sNHpqIKf?=
 =?us-ascii?Q?f29EZgFmQXOXIh/nypchrY7NqBaXrurnrjctEZn9ulbpnWD7I3FEPbDYOk3N?=
 =?us-ascii?Q?KUBuEnqVY4hhEQCxqalsC5YqWpCTpXn8OKL+PnhoJ5aQJ8rewAHVeNBoTHhE?=
 =?us-ascii?Q?ZuGHfA/LKyUZGkE3umBZV6v5FUSrBPuGr53OeMdo3xNxi6RjgsSX6S3lU1QM?=
 =?us-ascii?Q?AwKMM3E5KBngdLBVpBoXbM3O2g+XhP21q03lTei4TLXFsRXOFvoRA6SXnc4G?=
 =?us-ascii?Q?TXa1Wi/j4kBIJ25OC5lnFOnBs2rpIuIpw9LfdvVwxlAfaMiCPbmFbqv+/skv?=
 =?us-ascii?Q?xrWl/sOxBYcB3hu1Mil9N2xPhJEigD/iqzdTk6PM7Lr5mZfa+5DM8rUP6RGc?=
 =?us-ascii?Q?BIG/lTXPkkjv5obGhekdV2hNuFsA25tHiymi1aW4KtjmfLASdM8KLUL397l5?=
 =?us-ascii?Q?HAEZoVnfCRxweurmeAUXz75eyXsvizD4UmsfLl+NTzKSfABwaFPBmnVB1lIS?=
 =?us-ascii?Q?HzSTnOdofnmkGy47eKyu2x7BbgHIDkoJ58f44OHD/v4hogKPjFW/kMM/W/Rl?=
 =?us-ascii?Q?3tV2KkX4oZh4WUloQMEir1YAGNS9YR9/5nJj0cgkcDQ1y3mBoFgRcPAvJ2Yj?=
 =?us-ascii?Q?WidOgxGppN61qRm37URiHq+hE53yOsrN03bMHHgfR4JmdKbyiktX/ZfThIJl?=
 =?us-ascii?Q?D7IS7qFwkRPnthfDVosNVBgSkXrnXTS8Pduh9PiiQFXN0aN9X69GB9Jtv4wL?=
 =?us-ascii?Q?zFpBzQ/MxFp6c5oneyQiBBAZPbXyLUCiYYX3DtSKTqOynuD/AuaTdCLTfVcY?=
 =?us-ascii?Q?Jg0PEHcwFFScwbmrQa0m08Ot?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7f69e7-0084-491d-3058-08d94b72fc0a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:08.0240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLOmwvKlt7g8kys7aXgQGnvsl2GoJm58strVec9aFDvxwUN93magSDWaSv682JZkFxsB+GuqsrNORgGF3BSecpFdyrjeQ6j6R7gzI0fAc/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


