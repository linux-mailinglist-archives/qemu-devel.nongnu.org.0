Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A3E3CF937
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:54:21 +0200 (CEST)
Received: from localhost ([::1]:53372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oKK-0005wM-Ci
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5w-0003Oy-T6; Tue, 20 Jul 2021 07:39:29 -0400
Received: from mail-eopbgr60135.outbound.protection.outlook.com
 ([40.107.6.135]:17413 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5p-0007L1-BS; Tue, 20 Jul 2021 07:39:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ng7dVKZPWpBAf1mq//zguSN6J/zE7nqi2CUexusnpRSqgEPy7CneiL5ty8tgk72bWT8Ksrf6zIzpyHilpd6Xr8Lwr6W9myPt6H0IdAG3jGt5P1dN7R9it5n2xTfQ7HuDEumCbsoeHa2NtJAFIoprUmzYdMU3hyojfJR+ZpB7XMdzVT4S6q20Le4FpZIdYM5omfKUY55gpaSP5HXFYP59E2CoL0GjdItKlwpn/yhICSfkwCu30B8P9UvhjqgPxVY0PiIEbNSzfSdcebzV/MIEvYnWVgwLZr+PmyXZwHkfBwufRI58mFJtWDGou1ssdvrAyIlXdLm64auHiLugXD8NHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxpBY6HHc4j7HGyC4D+FSw2Qsz6v7ogAScznzsWoOa8=;
 b=PMb4JmTuQc29SjBJJyemVC75+cz0lHCk7fxqA0Vr0b1RcH9/21whgsCH708LEUkIx05Kb3+VmO250S5Q/6wl2MOnajJckLtzKkUwKrkMHWX1D9RSaGW5OOBBybhCcJXHv0sAS7ycMGo1yecLnHjVvyDEoaXNktay4jstdLWnkHTGd+KkKngJxTxWegiqCkwsIGctk/JAddRDHgEAJYbbLsubx82vWcPRIZ4/zFuRSkjPCliqfPtARqqM/LZA1XuYl6LTmbEmCF4clSJb91B7iiZz3zJpNipPUgcZla5+49PSjUkE+/qoFFloq+TVEoYXYtYtJi1Nictyp/ThAMEuvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxpBY6HHc4j7HGyC4D+FSw2Qsz6v7ogAScznzsWoOa8=;
 b=Ov5CKmhIurPh6YbmCdiFLl8h5hTYuRQd3sdMfZwc0P+1e4bLcONGFuZsbG9R1AjYZt9AYLX+JSUOMxPg/Un5vyOZNzxBGfCB/2j3cJzqcgAkU95R23Um/nBRV8APY4UhKYybk553XN1HfcBwNO5ItPDI6XQDps+gkLWgPGF7LIw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4535.eurprd08.prod.outlook.com (2603:10a6:20b:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 17/17] iotests: declare lack of support for compresion_type
 in IMGOPTS
Date: Tue, 20 Jul 2021 14:38:32 +0300
Message-Id: <20210720113832.586428-18-vsementsov@virtuozzo.com>
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
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d50e8b3-42c4-4a18-cbdc-08d94b730061
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45355E30A8476C7B16F3E200C1E29@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZ0doY7Iux9G5/eij+wPP/igQ835nlwozN6sn8WdBeFHK0Cwlw6unlUCSvle2T8oTRvTLo5B3/uBJty8tjtPIqfFbt8/Uq/fqQJ9TDFu20hTdLfwM26myvjaeN0mGyfpxAqA36h6MRpJPG2CTnWOjGj2l5gO+jNG1cl8eQaOQgtVZ0ctwlnXJ0vfwkBO5DdVjx+AZj2nnRurOyYrv5bH4gviqwEGcfiHjPSWXc7LC3JzlUIb0jwc4R1GnXQSMXVDPruo5F6Vx2ew4cevrx0q/fSaIpcd4ys0YYCji0bVUwHlNWCzJ9rx3dHRCLiaJEux4dGM61d2xNmBe7FemA0GypI8AVj9/naau6+WL3xlVt9ECTXVip7vKrpKviYh46lVpZNQgdFJtMCyCAG/PRx1ww7cdZmMGyHQfFmt5b/FPSr9dCJ1kp8DSpbO5VoMH1KcYl86LW3eYYFdWXegHruFIr//4b2sZCe8L71o9s/nZ2fqMYGPJ3qpw7/Q3AANNhRmnoLvYG21xS1f8eerELUb3d7dyuq+ctVI0qei1WHQd0h1ywcVrjupntfYNgt46TuWsFQpVM1lHT3P0iTWUJxNVOSi4XS5qW4w0j9OlbMHlQUuINNummv4zt8NBSJ0+rdX+Ict5yvB5Je5BeKAylUE8JqmhzPL/BZjARpjIT14bBrcwxtlSdEwYPVHMtD1jyQ9sB+2ikbPYeaE8kP7MuYv+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39840400004)(956004)(38100700002)(6486002)(4326008)(6666004)(6916009)(36756003)(2616005)(478600001)(52116002)(6506007)(6512007)(186003)(38350700002)(5660300002)(26005)(8676002)(107886003)(2906002)(66946007)(66476007)(1076003)(66556008)(8936002)(86362001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pVRBFldVydv6q5ZSDN63fOipCLaeuE94XCSetX1Rq6VhqXuuX5KG5HBzKBao?=
 =?us-ascii?Q?3G8c6jUPw3kL5EsaKoWlTdK262HwAAuf/bZXrJVhKCaSXq8dLEBBbH1g96Yg?=
 =?us-ascii?Q?nTvmLMapWl5Bd6bpmf/vhWSoyK30ckMmt/H1jdQTEqI/SvHVxIztr6o5C1mH?=
 =?us-ascii?Q?++c7AFzF4NivvAFhqvTx6+3E07K7KJ0+uzan6JBumy83W/ypQwe0kofLa1Mq?=
 =?us-ascii?Q?XyHE1JTEf/5iKCayYj87CLNiWWI7CBNmUbt9hPu9lhB0SwH90/Yj3th/N2Pc?=
 =?us-ascii?Q?U/crxvssv5UmpYQnY5FSWGp/onq55GRpO1z/DuEYqXbtXUiaB155IKghYBfr?=
 =?us-ascii?Q?rEJSNaOEo1B2gwp1u3llBufz2M/ak+rLPnfTd2JtsSYb9rF1qkJ5tCmRcRQS?=
 =?us-ascii?Q?JKJKlvnEhIh5Y+FX1BnTap0sHTa+v6/s05r85sbx5pulY619NQLUYJjrDkcw?=
 =?us-ascii?Q?COaiL2XvcfTJCz3QvpCSg0whf6GdzwBHNVmEMGLaIIf3rl0DSPJAYaISzRbm?=
 =?us-ascii?Q?ot+OplYFllKvwSTD3mNdJs2P+Hr5HROMw4LdYvpoGHYqlt0/ieZ6TGYeRhnK?=
 =?us-ascii?Q?uC81xcbLTVt8rWPMZVgHYz8mZraH8T5xgW0Z3gmzTpsv4OJO8XrLVaBdEST0?=
 =?us-ascii?Q?g3Y+U9MLV1PRHNtYJFazXo2MgUb6WlAeNgvrSpu0xhX9Tf/ejmW/RHgOIdlT?=
 =?us-ascii?Q?Ks/J1VSWxHe47XO1E+sdKiTsDh78O0ilTTjze0AavEVvsJUbXovMOOKM2fzy?=
 =?us-ascii?Q?de1yoM48CVLCLUM6Z9h01R8bbY0yNDSXIKvfoHhQzCMvcdxH0VuEk2fFfoSB?=
 =?us-ascii?Q?3TOmoPKj0ZyUG+2H+Wgly6/q2kGIFFGoWdZbV6EGmWzTOJ4KvkLsVsAYuPtq?=
 =?us-ascii?Q?jLwTNsj2IYQunBERX9Z/IxZ0jU2ENSdDdJ/ypLIu/oUw5XW8iOCmnOw3meQ9?=
 =?us-ascii?Q?C16pKBtX6+0mFaaNhNWZ3f7Y8Ty8R5ezdRUm1otfBdLdI5gJwsO14mg2Hn5l?=
 =?us-ascii?Q?WM4G0dA2wrcyjrg9k9WcPHgmwVsG2DgMQRP1/0eAUF6ZUAqJdyXhzk1TdI3+?=
 =?us-ascii?Q?YXvSW7AvnoB0NhVpu//rZV2HWnaFHxHg9GpwGxoxzqDFWozNF6CVvGERV6je?=
 =?us-ascii?Q?CAaiwUjmLwb9ab6jsi9ic9sVpQpL20qK7d7+ZXMNSLVIpUuIls5EwCKdu7Y1?=
 =?us-ascii?Q?S/+pxYGYYqUpEx8tyIlyV3rjRHoDYP38thi/vnUEnlzoiuWD22u0zMBMdHS9?=
 =?us-ascii?Q?tu2jtQYElOk3V2SRzb6cV9pQVmFaUnvBUOZRYvac2a5+4USewERDdLZAWea9?=
 =?us-ascii?Q?x5BHM+PQcFCMYvolr92whp19?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d50e8b3-42c4-4a18-cbdc-08d94b730061
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:15.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2aN7+0wMeRo4ak+RHefHVMhrPMD2af5JI4IPDP5QEEUhLxLFh5YGwKTfh34H4DKlCgk2ielbGGTPIejGgM0UN8HT0II38Rn/e4VejJ0DTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4535
Received-SPF: pass client-ip=40.107.6.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

compression_type can't be used if we want to create image with
compat=0.10. So, skip these tests, not many of them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/031 | 5 +++--
 tests/qemu-iotests/051 | 5 +++--
 tests/qemu-iotests/061 | 6 +++++-
 tests/qemu-iotests/112 | 3 ++-
 tests/qemu-iotests/290 | 2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 648112f796..ee587b1606 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -42,8 +42,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 # We want to test compat=0.10, which does not support external data
-# files or refcount widths other than 16
-_unsupported_imgopts data_file 'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
+# files or refcount widths other than 16 or compression type
+_unsupported_imgopts data_file compression_type \
+    'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
 
 CLUSTER_SIZE=65536
 
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 7bf29343d7..4832000fd5 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -41,8 +41,9 @@ _supported_fmt qcow2
 _supported_proto file
 # A compat=0.10 image is created in this test which does not support anything
 # other than refcount_bits=16;
-# it also will not support an external data file
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
+# it also will not support an external data file and compression type
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    compression_type
 _require_drivers nbd
 
 do_run_qemu()
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 70edf1a163..513fbec14c 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -48,7 +48,11 @@ _supported_os Linux
 # not work with it;
 # we have explicit tests for various cluster sizes, the remaining tests
 # require the default 64k cluster
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file cluster_size
+# we don't have explicit tests for zstd qcow2 compression type, as zstd may be
+# not compiled in. And we can't create compat images with comression type
+# extension
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    cluster_size compression_type
 
 echo
 echo "=== Testing version downgrade with zero expansion ==="
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 07ac74fb2c..5333212993 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -43,7 +43,8 @@ _supported_proto file fuse
 # This test will set refcount_bits on its own which would conflict with the
 # manual setting; compat will be overridden as well;
 # and external data files do not work well with our refcount testing
-_unsupported_imgopts refcount_bits 'compat=0.10' data_file
+# also, compression type is not supported with compat=0.10 used in test
+_unsupported_imgopts refcount_bits 'compat=0.10' data_file compression_type
 
 print_refcount_bits()
 {
diff --git a/tests/qemu-iotests/290 b/tests/qemu-iotests/290
index ed80da2685..776b59de1b 100755
--- a/tests/qemu-iotests/290
+++ b/tests/qemu-iotests/290
@@ -41,7 +41,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 _supported_os Linux
-_unsupported_imgopts 'compat=0.10' refcount_bits data_file
+_unsupported_imgopts 'compat=0.10' refcount_bits data_file compression_type
 
 echo
 echo "### Test 'qemu-io -c discard' on a QCOW2 image without a backing file"
-- 
2.29.2


