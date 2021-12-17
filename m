Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445314791E1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:51:19 +0100 (CET)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGRy-0007jR-Cb
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myGO0-0002gy-P9; Fri, 17 Dec 2021 11:47:12 -0500
Received: from [2a01:111:f400:7d00::707] (port=6433
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myGNy-0008DM-MG; Fri, 17 Dec 2021 11:47:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAcsuBIwSKLHH0xO4m+PdSgPfERN4gYl0f5AyfaZYmJA25m8rafZM99f6kCCtIwNGHLv+OlIsrTbSaKCLG488WAANJCdYkRMHZLc3iPfFLdTBtsv8IbBzakfs9XKLPu4TNKDeG9Tp4Gu2E6ueDHldS3BO7gBgGuXevR8t6Jh7FyRL+GgmzymGButGCDnAc5YCpO+A9uiE78ca3GClBI/rVXSKE+4/0C24xrjvK21Lc0JRuDiq6zkNx/Q3pF/EYgYuyMuDUavJe9fwNxH0kRrH4Wsc/v9jbGVn0oKDiR1rpJnLfXM/CIemDztrSxhNTfhy8AfdxUscXcwrCmeV/igFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3x+CA3xoAUw6+jkjktlDCfdR0tit9aImCsaojfiMMA=;
 b=j9oKtmdUfPtr+81uAkhPGhuLy60AjsSt4qRW2nGeahJkSE5IS9G8cKdzQjrcsLzffH4n0qWu6JmJvxbFdWz1HhIsfA/yjsjrMwMuciV9kP33OLOkYrNSWl5tnY4NvHfl0WqIy2rDyPWx39OwmM9moqsJ/13f8wwsNz06GCvEik/EjAQsjjsSJyEjPL98yFN5XFRO3/VBlMcVKzrMvx393Lv1TZFBCGRhH4KfCM8IBYwL7411uHmOD3OFYbY5yRP/oaiHvFlEhskYrreDm5yt6uMf/nnToa+xjcp8vrkxikG+7WN/W/ps6slO3Pg9eNzQ9DZvMmEsFpBjVhdfI6lhvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3x+CA3xoAUw6+jkjktlDCfdR0tit9aImCsaojfiMMA=;
 b=ruvvbIN6KSUBOzbfTkqXzqONfXWRzFxokUq5AQV1/jMcqBjGWtOLukd8H4+xL6+iNtsVA9dW8/tPNvk8q6cTm4TGLfwI3bPTsI6Qe076SDgUNZcucjcF9Ug8Gf2MgmSbQIOuZz0g2WANznD39jhoY7pUuEiIBGWm7nWb30sJHyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3362.eurprd08.prod.outlook.com (2603:10a6:208:dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Fri, 17 Dec
 2021 16:47:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 17 Dec 2021
 16:47:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, pl@kamp.de
Subject: [PATCH v2 1/2] iotests: Test qemu-img convert of zeroed data cluster
Date: Fri, 17 Dec 2021 17:46:53 +0100
Message-Id: <20211217164654.1184218-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211217164654.1184218-1-vsementsov@virtuozzo.com>
References: <20211217164654.1184218-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0192.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS8PR04CA0192.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::17) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 17 Dec 2021 16:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f25e979-dfa7-4c6e-78c3-08d9c17cda60
X-MS-TrafficTypeDiagnostic: AM0PR08MB3362:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB33626AEE7695AADBDC037BFAC1789@AM0PR08MB3362.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mm+qvIrm7OblS5jDNjy7hTqxbZjwMDJzo0GEitXTGu9HnhC2mHQ+Db5Yij93Arw+FdbNLfHwu6Dy+iX8FDr/oAgp+SGx9hUqs8aQDPPbIam2yLfZ4OFS2I+73E6tteqiw8HnIEO+A9h+bqitaPYZw3GeQmL6TleHk9SK2smf5FD2m6zo6YH77UHJVYN9JZ1eWZYTVUpUFJ5Q1p44rUjE75DyiNaZi8d1i7y65p6jEgRWGcGWXkyHuFNRb56SGwctM8Kn9LhZ4cRvxJNj0ogNkDJcxh+k3cHnewTWjnID8Ck4KaSTCon03a5cYjd1jg2I6n/Pm8JcilVm5fb+l2nzXWZfHO2KJhq8COwmKqRyv4r+C+hj8PXxr7noH6qwhfIcTtVMl1Vrh770etlmquwSvn18Std8wLlMZ26yk1CUZtCCo42OOWKDthmnKR6348qoq6sm3sQLFYLipf11szyj9vXkHyEaeIR92UahWY5u8UNd5GtuxwxDG161nAjmlRdnqNHM0PzBeMc40TaVRV7lVtvKyMs6KRHfE2uUUYZ3qkHvNX5Al8MUg59lOf6WNf6bLSe3Wzj5WeM66pWFC1xTk1Nx0Rv5rjq+8Ha2BrbwZEvVuZEsqVUHH6aeLzbZVZFamWjYFo5cthXhtUTFxOOmK36Sb1zvAnUk+KnM4o4wxnIDQuozx6wcRmOa7/SURYRRsY1VdElnFsgceUt5QUuQkkpetctSlwANNqO0RS+Qpx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(38100700002)(956004)(38350700002)(508600001)(2616005)(6486002)(6666004)(36756003)(8676002)(26005)(5660300002)(6506007)(186003)(8936002)(4326008)(52116002)(6916009)(1076003)(6512007)(2906002)(316002)(66556008)(83380400001)(66476007)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wTbb5u7BdGFYEzTUd4iMoOmAeC5Srg8luOhPOlbWIOBmbFwGPso475yBbhEU?=
 =?us-ascii?Q?EOx11zOx5F8HZG6aghe8SUJFV687+Krf4VYuU/T+dPnmey+d0/Ur73Md+XlR?=
 =?us-ascii?Q?yLn1Y0knhpErloR8MzL9hB9M30SLytJAciWGWgUFEgQTHpcGP/XoriBTKwgS?=
 =?us-ascii?Q?5B4LY66gq0WCvzdaHdriDXIIS9+QuGwGwMWZI8S7f1Sc+2kpRO4gvZO3vAjP?=
 =?us-ascii?Q?hrYm9P5J0XcmGPSdZG0MZH77xYggXS6XKv3A7RXjNA5fTLQRiEhO0t25V4fZ?=
 =?us-ascii?Q?enZ3ylPBF8wCaZ18zYCCUvETCfX11JzZQMX81Ki10SHyHjUCPc0lz70m8IcS?=
 =?us-ascii?Q?W3goBDasiyaR59SYFguEJjKC2nCedGqit3MuUuYAEXgQV+5RnTckpe8uwVPQ?=
 =?us-ascii?Q?jD9WEodYMm7nDP8J9ZDQdSDAeAtyKPc+pflN0huLOFkNycP2wSVFDM/JnF64?=
 =?us-ascii?Q?pE0QzPObFpzeFcY4S5yK+ecqVt4bRDOTkwBdDHsRUQfjRyNoT5y16Ojg8XwN?=
 =?us-ascii?Q?5lpzxjBlVCSoNHn71+K6a52iPvIztnAWPU1J3JJNZ+WbrxLAJ0jWlhxFuTif?=
 =?us-ascii?Q?7gChNPEgemSo50BG7kkqnUsmsHV2kSJOIsNztFwZvmz4FhQkWxB9AnqzAJ3k?=
 =?us-ascii?Q?bUaVUX2ZPiNlos6WIHVqJMvwuInmuG4eyE2PJYFau4PUI8p5GcDXkH/WOGD9?=
 =?us-ascii?Q?Lzd9+Z67qUDA4s+KLwag8lfWUioEXWhE1mo7rZeNtfB76almFHcKc6o/9oI4?=
 =?us-ascii?Q?R5UG8fcZH6Q3jGDQ7Y0XM3yKkq3/zw0cq7fLvmCysQXSmf1N91ViP2SaAQ0H?=
 =?us-ascii?Q?IUmfHamvEHz1+PHzp3J26K1fUadGiYgaP0Zx9gr7aR7TN/z4QDeROHTL6cqH?=
 =?us-ascii?Q?IYaQrsTAHpIf/xyzVrV2zaKZ9uF6iDFL7nFjTb9jhKWfh9uShjW+DKeTNuEt?=
 =?us-ascii?Q?LwSA80ykiW7k1tccsxxSevDwLFMOgV38ghAutOdXynjs6RVX/f6znYyunKjn?=
 =?us-ascii?Q?PpdbRIGDg60OcPtfCmAVEMZxxUsqXfGQPCs3WE9EPAYjtATfjumYY4HLDLM5?=
 =?us-ascii?Q?wPgOnZoV0GzhVIrPr5iQIjeYFDMzwB8G7Xz1/M259mGS1t8pwDZC3YMznAp5?=
 =?us-ascii?Q?NBL0sielNseoSWj5+ZlN52UfHkdqIthu95VQW51Snvf8IArQNut92uxRjTY1?=
 =?us-ascii?Q?BCiOUTRCJPz72CM7gY15vdjppS/q2MEXGSl+C5h9y8lv2t8x6pSQVOsSUlhS?=
 =?us-ascii?Q?00KiUgM/ynQewh8NfWZ1L/qLT2VSM+fOnspQDw1S0ZjqQU4H9ASxvceD+9dc?=
 =?us-ascii?Q?ItCixD6aUhYfmFReMdJIeT/0rGupaMV+O/ZJ6lm8xi8W/lUvDhyl+VVffiWl?=
 =?us-ascii?Q?bMPZHIyGdBOXvAQdd2PN7uk0ibzPbUX859Xpa+iiR6TlGLrMDlxerDc5Z+Hl?=
 =?us-ascii?Q?dYsHsKQHEBwSME3fKHeIlrgmv41nLPtQOcle9cSnFA0bjIwgZNRsB7c9ZP/l?=
 =?us-ascii?Q?9d5IHV7z5X/wSWijA8qL81ep8CFIikTwHGIfaItynqk6BJbcXWY52SKItOOq?=
 =?us-ascii?Q?5+dOcakrTEF5+XVL8Rfq9EVg2VBDMv45OM9/OnBJkyDGcdNhK7SwZfEDpA9r?=
 =?us-ascii?Q?jyR8r/zdak/eQDB3j1Vup5ZdOqo0+7m8s08oADSFhD7kCzcj15zWgE2bufIf?=
 =?us-ascii?Q?Oar4zukU3gWqjZ/5e4CjQlgoru0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f25e979-dfa7-4c6e-78c3-08d9c17cda60
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 16:47:03.5448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HL+Wga5r0a2uqDB2yCCvjappDjdAtjROB1Fwuty74GrKqYywuZSmx6dlEqST7+ETcRh+AWX3Sh5+6I60Sp/yW3Pe+mWxIdbNPmalT3bn+sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3362
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Kevin Wolf <kwolf@redhat.com>

This demonstrates what happens when the block status changes in
sub-min_sparse granularity, but all of the parts are zeroed out. The
alignment logic in is_allocated_sectors() prevents that the target image
remains fully sparse as expected, but turns it into a data cluster of
explicit zeros.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/122     |  1 +
 tests/qemu-iotests/122.out | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/122 b/tests/qemu-iotests/122
index efb260d822..be0f6b79e5 100755
--- a/tests/qemu-iotests/122
+++ b/tests/qemu-iotests/122
@@ -251,6 +251,7 @@ $QEMU_IO -c "write -P 0 0 64k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_test
 $QEMU_IO -c "write 0 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 $QEMU_IO -c "write 8k 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 $QEMU_IO -c "write 17k 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
+$QEMU_IO -c "write -P 0 65k 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 
 for min_sparse in 4k 8k; do
     echo
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index 8fbdac2b39..69b8e8b803 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -192,6 +192,8 @@ wrote 1024/1024 bytes at offset 8192
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 1024/1024 bytes at offset 17408
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 1024/1024 bytes at offset 66560
+1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 convert -S 4k
 [{ "start": 0, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
@@ -199,7 +201,9 @@ convert -S 4k
 { "start": 8192, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 12288, "length": 4096, "depth": 0, "present": false, "zero": true, "data": false},
 { "start": 16384, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 20480, "length": 67088384, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 20480, "length": 46080, "depth": 0, "present": false, "zero": true, "data": false},
+{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 4k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
@@ -211,7 +215,9 @@ convert -c -S 4k
 
 convert -S 8k
 [{ "start": 0, "length": 24576, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 24576, "length": 67084288, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 24576, "length": 41984, "depth": 0, "present": false, "zero": true, "data": false},
+{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 8k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
-- 
2.31.1


