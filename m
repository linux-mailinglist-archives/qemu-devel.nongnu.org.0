Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52B467845
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:30:26 +0100 (CET)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8dt-0007jQ-Fj
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:30:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Im-0002H7-Fr; Fri, 03 Dec 2021 08:08:36 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:61828 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ik-00071J-4F; Fri, 03 Dec 2021 08:08:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i49oxVPmNWBra88r0Bf8CaVee6RsZEpPJGSA2vH08vJ4AA8bXR1e1C/dVOl0c9qbrd7RN2wz52XwthEcquvSChbm0+BFS4JCHxc8ZXSIUEN3SjxGka9hCxYOua/s6AzP4HYOTeS6AIbDHowAnAfvbVqkVuUdsJqF7nw+O84OkBByb3wXeYMibwGMhU2eIc3OuVAnuifboBry3cJCi3m6ZbEIDh7F6Hj7a3q6MV+bwNSF1BNOrCzLq2Ufoong8PYbTZEztzBQUj0gZFZO1VZa51xIUXSyKLAWCjfOk4Db9Oc4vWDig7e75gopHMt46/hV4cGQmb1SixYDu1clhOIJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQ9oSHqLXKFNKhHgPqYkrc78zjIZx1hVU7ZozAuohNU=;
 b=mEql8v8NfmkrhgA3S6MRvqxsSojxlyeOvrYf6g1/k6XKP1wAKMBV48//5JcceLC7fphFd4UP0TkLKHrLVTV911pcK6p+ybEzbxzo9Bi6ZhmT4s/wUjd5vlqDRFDqIJlORscFIIHBbwn0nY4DBsXhb+2nZzZY2twFqPe0MOIFoTIPE71u+W5+gXHSMNhJKmjEb/LU2oqFw0tQGx5K7n9MOfwFF7r0PjcWsQYPXMTpu/+B0tR3Q6b264WixYN3UxHTuhXklN7wbwut7TxhZzocSREaxewjlJ2kLkf3At+tntPfJQumcBBw3Rb9CRPfKBP4Slbq6rSvARRRnUSCmepnBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQ9oSHqLXKFNKhHgPqYkrc78zjIZx1hVU7ZozAuohNU=;
 b=TL0NvZ5gnvCRVarMAXSXiQ1QEoQohhRi7v4o72jBxETeTFC2cmGO3tH3zPSf66P10Ayd5XF/Wuo4bnVFBmOSS9HdAiTJ91J8m1nJQulexLnf7smYiv6Gr4K1nl+6Ctpjsgn7FHx/3QjVdOmdWUOKVr8J/iXGB23eKdJ4wLyCCSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 12/19] iotests: massive use _qcow2_dump_header
Date: Fri,  3 Dec 2021 14:07:30 +0100
Message-Id: <20211203130737.2924594-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 142a7d0d-a89f-49ee-e5d1-08d9b65df76b
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4515A2EA482EB5ABB2B9C925C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUxOkf6SW0e+FnhuncPc8exP88Rx1rDeSdUeTjAATRBFkY3kkeYgUzPtSPhSKPW+52kySiNtBur84PSC0XiTBquRp2OGbc2YlBW4eJJa9N5e35f+BsuUkyshDHNDYZvf/r5wY5p44M9qbLmRkvJnXn5UxDH4IvIoqSNmmyk83MjQZIY6OwhuGajCbdgHk8W1ychvtbYzSGz5WZImiM+m0wyv7uVHGh8+R5pUIfgZN286RBVq7n40NIu+rvrv3IGTgZg4RWtXhlSmDxGlwb+zi1wrld+3EqwNDnOSNEOXMIYpww3ugPEL+J2ZWey5W5BEPZMMiSdLGRKuTelG6e9V1d2tvgXvWLI/44pAfkGZaPQ0/gYC1pmP9bRZtb01Q5YlQXbt4jA+OJ6SjJ704mTNQfy4WfNvCdGnPolhUfMc+eg8GjbS9kPr2t48WxszF4NPjevQimHikWgCRwBtewg6oA5MeeTDuq8gDja1ACMlWP2FfoBOMsL3v2k3Krp2LNNYVzi5XfM8GqfV61uB9udrkzpRrxlR+Na4+EgbkbPZVdfxvzpvk6i2y9UXPsJIMo4FI0aj1yXzsXXpqHsHMfIaLxWNzGyRAvrZiinF4WeKVP10gfxql4vpW6i8F7BVJJFxXBp6dp4mwEpp4wFTBf4hD9D8hLDrFcqx6Al8EwVX/1vX+wsMu4GRJKfoVn95GsHkZzo/Jhx/3wNcjUeSikolOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(30864003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009)(14583001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C+7jv2QuCq5gjY9xnf8PQG+Gmwtc8g1GpWRQKfNx+EyVRzYGNaHaFWq6vkDe?=
 =?us-ascii?Q?znpCpn3RyDSnCNT7hmI7gvFaHcP98ozvQSB4HM3p13ysEOEZ/nWKNareBdQD?=
 =?us-ascii?Q?GN6l7MercHVuU9WDAyu+AiVSdhW8cbRgq+aQmu9wSSK8nPx2ZWlzyrl4QQGC?=
 =?us-ascii?Q?NngZ6ZIA6jyy6c/fUItRSo2/GkpPamzyiEFXfuYwMbR+gh6R98DvSzEV0sG6?=
 =?us-ascii?Q?gkNLf5DEOKAMFhqANYE34IxPg1hs0hhx6gHzptneCpzSxHWl4VfUarxOJ7s1?=
 =?us-ascii?Q?45EtSjqD73nqOrJ0fclJumUgewcJDsfHj7/2CzFhfpz8BQHplSVSBM+KaHYH?=
 =?us-ascii?Q?u1d+w/3sjVUqzy2QkPifBDpb0MY4gyxZOlHnRza/AJ361x8LteUhDtc62f0E?=
 =?us-ascii?Q?35yn3SvUodnIq1mPFrXMvqHKDfGrAjUoPSbHFzGIXUQMNqpMGK4N5ti/xjuN?=
 =?us-ascii?Q?1MkWzjjzHTmJlwT9LzfzRK/ZI/MB9o8HEdN/vW2k6626YybdDQhKy9ZNX0/0?=
 =?us-ascii?Q?Pfo3uR9QWKsdweOwdtdK8wgzjDNkjCUDepnTjsRAGuVmrKCoqoBm9SHc4BkO?=
 =?us-ascii?Q?RIAEMPUXH9fK+ve136ntmmk1KxtcuevJVixey4qq6FCGddMa600D2Dxb0k4p?=
 =?us-ascii?Q?M1EzFGgnr22vbbyVi4C3GTRgGKoiBdURiG8744k4nfaDvobvD30WuUgMkA22?=
 =?us-ascii?Q?EDRDOiuochUfo10muKL4WOJYeNbZ/sJPvCzkL6iSNiC4d9DsaE+VkOrXCaqp?=
 =?us-ascii?Q?oiUVG47+x4fqBUMb1N/cjDNLF3J+oQ87za57y9JDCCmLCeDIsVsfuRA0V+s6?=
 =?us-ascii?Q?dl8hT4mffyXjfFysRK7nOsbjM1/24KalGxnDxcJpRTLatHt+rzSw3Bd98gfA?=
 =?us-ascii?Q?ISuRnY9n+kmqgYHn0Umv8IXXtpNjijeTdHsYYvyFt8tOZhxDbLJ+ccwkiguE?=
 =?us-ascii?Q?wVcFT+fwQ0J1Kop3q//iLNhPKeINcibqVGcdZf+ratCfon9eT+sc4brRtbhG?=
 =?us-ascii?Q?eLwVGNbMAbQgnKi1lS5g6KzaGfF3ZeVV7peezYNGPvJ+5qwvgs2fWqwsQUjt?=
 =?us-ascii?Q?Kh7FE5/vk0yzO3uu91WPlHfad7ro2xS07vY35yD7GilIt5kEyUDaOIuFxcRy?=
 =?us-ascii?Q?sSMUqElpj9wQx2xhPIF3MOTw+T/K1joXWBdDspN01vbe2OrrPgBuH2QwlDbK?=
 =?us-ascii?Q?1s4xAikFnbCJETVlsXooZ6APzTg3UPgZeY4DppryhVwlN4shr7R8SUldNGwe?=
 =?us-ascii?Q?8vwXPBTFk3zJC//oFWcJ4xH4epeZeHGKAqHUBIPd6HXsuDO4RshIBdPJJuqm?=
 =?us-ascii?Q?PtiZvaRHYHwjEGvdjj9+w0+waHI0/3nZyqSL7cEJx3jn8lke6VU+pAmnWAO6?=
 =?us-ascii?Q?wTRc2oZCUwEZ9qpAPhzv1SgdGl4+4uExr823vzmOfR/2IyXdi5Rsp20UzmN/?=
 =?us-ascii?Q?bg3lF6PDyUgj2GQ6yQVnrQ67FHUNHJzMZ6dseqywdBGAFcewf/RnFK4GCcm0?=
 =?us-ascii?Q?n11NBz2fr0sAad5dmAlBfOV1SW43glAoDp4FLJZwZ3gO4EhYH8QXw85zxbc9?=
 =?us-ascii?Q?LQp54wbYTV22maKA98o7n/UavG4q9LUzF0YaTQU2qWru/JJ6pkiaH0FwPCj5?=
 =?us-ascii?Q?0BUx5rw1K2IJST0ewQCfRiXnKVGh0yiVKp6FLe1VF7XErTDfBr0jkjioO4So?=
 =?us-ascii?Q?Mo+Odw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142a7d0d-a89f-49ee-e5d1-08d9b65df76b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:15.0735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qapyc2cuPZ09i9rZ/DpXi/sDYxvyspwwOECEgVi6Hl/mK82eMPCOhQqDhXv02J9g2ir/R96DPk9c4k5mLZ8NV1hekE1O4RpvTaWedKl+qZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.4.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


