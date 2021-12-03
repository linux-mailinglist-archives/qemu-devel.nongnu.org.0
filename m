Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F946781F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:23:01 +0100 (CET)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8Wi-0000Im-EH
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Ib-0001zb-3Y; Fri, 03 Dec 2021 08:08:25 -0500
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:63695 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IZ-00072T-BS; Fri, 03 Dec 2021 08:08:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2PWbKp1Dt7+izHAI369ZnQ/tnZnbJ2MxwnnuIVoTEQvs/GPdpKjt+J6HbG+HvO0ExmU/bT+w9GdqPIwAEAldiU93UieLKMty4obQQNnQkZh7sCofR44xRifGv67xtHf+oqRo8ljt8cA/AMM+hGRndldFSj2nc7If/ixs5vn8+IqjMwcjg8MIRE8BLkLptoRg5A3U9zYpTO9El02LygmJHfAsL4aYh4L1EVtAM6SxnkG+fWznM6BOiuylp0fEffKtzveHL6KDIUW9vLHpxsXwTAFsnoBqDSqsuw/+MTVKrC2nG9m9q1SryPZqWwpN2Nu+3794j4ADc7VIvKmx/PqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMwXdZz7gBViyPMoWfGcrwQnD0M52NhNqrghnGxkZ4o=;
 b=kIa6QYePOIc54nKdm4mPtJ5Qhhn3c2b6zkpQ/LVLhwhk//b1I0wDF+ULCALO65pR20Nb4ja8mXuiWW8qKHYst2+fSbYoaFgrJ8N5XwUMoXxb1PCh5KtFsAuYSvdV0WeYPMsFto9o08TKYi9AjNn3CZ6TK4bw38ulZIp596/r1fBE6nsp1gpc9+GWiWEqK06Ng1QcWnpmagLItNz/FSRDnstqlJVzlCDrpQo39YJRmuVQO2s5frh+Rdeq/Iix6ofDdPMWjfk4TqaGI/BuDYYJv49KJayrDVLkYbO59uHnbr/a5CwopxbqGxDzx8udgYQy/ES6SKqgReI4/5WoSf2KZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMwXdZz7gBViyPMoWfGcrwQnD0M52NhNqrghnGxkZ4o=;
 b=QMJXB1S+f4drZlxTfrwWEn74iQFkoYFJje+JMDs5mo456f+gie8smBVW+GOb1cbx943UomgtMPG8t7CasKgQenwpPOK8lqiceZWs4wo+otNxaIrmpi+oti0SxEwuodOfdaMyMbrE4PnhCwrYhL8KUMH6SQMasEqVtBrYQzGYY+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6968.eurprd08.prod.outlook.com (2603:10a6:20b:417::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21; Fri, 3 Dec
 2021 13:08:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 17/19] iotests: declare lack of support for compresion_type
 in IMGOPTS
Date: Fri,  3 Dec 2021 14:07:35 +0100
Message-Id: <20211203130737.2924594-18-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba41cce8-acd9-4515-2bb5-08d9b65dfa4d
X-MS-TrafficTypeDiagnostic: AM9PR08MB6968:
X-Microsoft-Antispam-PRVS: <AM9PR08MB6968264B4BE39EFADDFD757BC16A9@AM9PR08MB6968.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4d5YtqrKtg0U4LeVNE0Ov9kbk0YzFxeNrqtROp9SqeL0wEjS4OZvkZbCAQrH8F/pXVWMYePvr/WjL5sCo0zzg7kCU+vGlt7TcfxaW6MoAtqKOV3Kr1ueyihWagJBMZbj0c58NSay5BNKzg/WODp5MDteXqQFz/spNHh+Ru5Fhv7U8kYM1iP6495LsA9opZoR0N+viLAl45bDCULxmHTo6Uc6h9KU2AcFNqkwDDJ5XZ4f24oJwULstBX7WW03/ZhcbGovCuxLqZNzmTvUTe0XetIVCMRNhkU/Py2C4n8tdi4Q6HXwudkEx+IUxkPAiPQLvLxho5W65e3J7GoOImAggvppZb7LvOUyxGzk0RowwuGdin+DZA2uuBZZSRGPWqqhmyFbPFsT2PRKXpaEPb1dngg6WhRbR1+y6aclHVDn99nIOK4obhAdjNi59swpNqaMsKnbVvPST/yBacbUsxFsH8+gl/u9FSYlYr4hmnB93pyBQaHVengOhD05vulH64JhGiOZ5Rj9ev06npii+0AvI+/dCiF/bJ5m25BHshhpHf5WelrQnp+m+ay5Z67OLcwhofJTWp4QR73o6vCo1XswT4jISbVrcfl9KFI5nHds6TAjHwTweLkM7Weuxn9zH6j7rLCV2NG/2Uyiy6YHwg3GV0BE6WpZWhm+69oY933pSuNZdmnexajItiOzbaF3Bjt6LI5w4augCowyslIWExBAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(1076003)(6666004)(6486002)(8936002)(2616005)(52116002)(86362001)(316002)(6506007)(508600001)(956004)(6512007)(5660300002)(2906002)(4326008)(38350700002)(186003)(38100700002)(66556008)(66946007)(8676002)(66476007)(6916009)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7HKL3DgoBK0ABT1wz0mUR9cwKs6hkUTDV26WQK0Syq72ItnHri6HuVEn8ng?=
 =?us-ascii?Q?ZZ1zUrL2l+H378TkgNyMARP/c2T8Dr7A+ybghVS+A/PYve6KjtaqPLRGZYpg?=
 =?us-ascii?Q?bb4r41y7QImy9PCyfZVATK9HzK6fUjnmeH907tqoxjlwJNopGI/qC+o3BIJn?=
 =?us-ascii?Q?1JpFlHSsBAhUARge4nI8a9t2hTonEHxaLLg/CpQCskweC4UQWJt3RuId9BxM?=
 =?us-ascii?Q?ObNe4NfHKw6LcvCgHFgfJC9u4EevzM+uo5MKkDyDmlHFKK8abZDgK3PTRJGB?=
 =?us-ascii?Q?KrtoX7fUsUuoaHo/6MfGW3DLIBadyI3iFKIDG2a9ps3XOripfGkxzUDcA5Z8?=
 =?us-ascii?Q?TwoghuUkIC3OpYVbTtlq1+3TfUjOaxrCngMDreQaUHX1Z9SExcodtF1bWdfF?=
 =?us-ascii?Q?oD/UQT+ylytZdAeWi1wJjw0krLplBB8HE501ySoqy4m7z8NFQBThyjVO/QJe?=
 =?us-ascii?Q?Dicwg2sj9AqqzgByHemzoDXiNWupkGPXIbrAyHaJa2XOY+74jinmwp2fKIsE?=
 =?us-ascii?Q?2GX7SloikPoAOPyZT1LZ3hvHM+ZmWqpHnFYdRC8eVH3YCRM6gGE3wpkJZ5AU?=
 =?us-ascii?Q?UAjoF0wL7Nqu9oJjxt9N3hNPTx25dX5b0BehxWeOsWIV6O5MZyeTxU0bpguf?=
 =?us-ascii?Q?zJLVihKDDuhx9NWcJAeV/fcHtvAsP6vM/ajeSFqpSQ5xSRzuO2Rh9AyA30c7?=
 =?us-ascii?Q?hPo31liV92Sx1Cj/wFYIdUsj0SU21WwaWu0a2qQ/COURy/EYef7FNjDfPqmb?=
 =?us-ascii?Q?M0weK0ImAxdi3xXzoMqIz0SOC+mCAOkDBZNzMmzqWLoYAW0f2Dtk/7dcqsTC?=
 =?us-ascii?Q?Ymnj4ilUYKWS2LxJBf0wpGoJxNeEmZ8knLJDU/OOVyuhB4DcUppOb5HPak6G?=
 =?us-ascii?Q?e226p9uRhye6ShTLL9QiV9DuCVmOoWs/rcaNde/CgAzxnngaqe+ZkYKFKDdX?=
 =?us-ascii?Q?TMtONOf2LRwBpONrphR1I4J6171534UbBw2YetVKjWLKUnkkOpkBv4JqMGPG?=
 =?us-ascii?Q?fr35elV6VidQh+7sMybxKQlM0tABwjTwRyb2gHCT1FpdqIqC/2zK+moDtfvo?=
 =?us-ascii?Q?WtEr7Y7B34TRgpKAMaUwtRgtcTuNeKjlEtZHbAMoENBjtCSj0yxD6Z4ddyup?=
 =?us-ascii?Q?ESuuHnwXlFCW5Nx7UZXMKIIEXIaLzEWKDegPB3wby/VShi3R3mpVIqc0PO9O?=
 =?us-ascii?Q?ARgo+HsUF2Zo7lsT+/icFm9JeGa8VNarY3padr1e96Jrt1nj9tO2gy8knZ0I?=
 =?us-ascii?Q?abeBRHkk8A9JDCM0F6l/tXpfpkKMmZ1ROtOA2gESkG713ccWBAN/9/px8113?=
 =?us-ascii?Q?/JZe2mfg3CxyirmxL6dxvMKxJ6qJ0x/SuHqFagbueFYhFKH4xqLENzlLCPPM?=
 =?us-ascii?Q?PrtHrAFSL3tsxo6TWTL14bgRR577J5vLPcE6t0behsdJRRBchlLuiz2LxC6e?=
 =?us-ascii?Q?ntO+IIlO2plXO6IUiDadawGlYb7HYsZcshJb7qvhk7NRwQrLtyUBRqp5FsGN?=
 =?us-ascii?Q?ynp9x/agvj1iCzuuTyMsHYhMFL4ahe5Wr0StMGPommfZ6Uv81puhzeVjTVOq?=
 =?us-ascii?Q?U2wfcc5Qa6bhnRse70cY/y0rnSwqF69qr5xYL6xNwXZG0tsAY7GUWfiMoa0Z?=
 =?us-ascii?Q?2X0qvIkxqqgvHUeWV3gB/SdxkrDDkXAJFlBaVoA/i9Cf+w99ivjT+GSSsw4n?=
 =?us-ascii?Q?C3SiHg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba41cce8-acd9-4515-2bb5-08d9b65dfa4d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:20.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z6Yvwy41109F5YFXP+T/8aLpKYaB318jL6vm+J0g57TBsgx03KwxfGhZPbV+I/1knC/1aKWd7giE62wWQPyN/xDzpvcHfI5wnDwsgWs2iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6968
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

compression_type can't be used if we want to create image with
compat=0.10. So, skip these tests, not many of them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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
index 1d2fa93a11..da93587039 100755
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
2.31.1


