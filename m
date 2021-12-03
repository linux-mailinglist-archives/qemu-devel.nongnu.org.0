Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBCD467892
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:38:42 +0100 (CET)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8ls-0001tg-83
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:38:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Xo-0004aS-BE; Fri, 03 Dec 2021 08:24:08 -0500
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:4097 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Xm-00089d-Hd; Fri, 03 Dec 2021 08:24:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sda63Da9btJB3iH6jXqw/s+RiewBd5CzpgQlzLVcE1exX0IdFd21dCcaOA/X7NXwoKB9miW+8z8SrBNDb25Qm8uEz/UIyxJKvoDqBBfeUbz8ZugQtC6iIo8jDXKypN0X/b/t1/2/nObJaC51TFtx3bgeNCmNzLP493U912FpN0EG6SOpqKz/xlbjNYx7F+T1lg5xUr5xKcC1aYsdt2YdBt9cCunw47Apk6j/Xv9hz76UYd/eukNpf5ATXDp8kHChmPTGO0oJcMaCk805CEFrEYJzYcvZW2zBd52XAL8FhvKwD/wiBtDLlwWU8lVZlseK5SpUT0glH890eM/V0/GwJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjzRFhzRuTOHXPxEtuEYrd8abo5SP9xxpsdojVLcSnY=;
 b=M7GcVlLlgc0awxpsLX3fFWGreHnxcAO0V6lA9X+5HfcBe/80nmKPG9P56SDgA/gH6fiWfH0xWPc0aQBT8ylidNWEnkBpb9aWqtL8ItAScOu6R+SC54bUY5Q1uRSc2qb9HGhYt5KlCYZMD3QC3wZeYUHG8kUVeXgprdTk8RK0EbjFkgocQF/CKuEUYgEmwrxO1sZixs0yFayF+sCTQKdbcjOls/4H59Ocy5doZTo1Smi36EJrbfaT6VMuZPHLvMJcAZPOs2qtyzi7UjP7b+3ypVdhNNkZIbMjsS/AfMpwtFOLLredX9YbLRqvn+5gTS6tbAwTlLg+I2H6zyEw3UrZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjzRFhzRuTOHXPxEtuEYrd8abo5SP9xxpsdojVLcSnY=;
 b=c1eAOrWvJ1T43+jTJ0V/psrdx2sx8oN4pMMybMTm57/j4SxPHHNOU1wdAzPOIWefD9NxX5dyXGWET5g59RpHw2XCV1i2xgP1wkwBVoksiRosUJjjFeuU1e7ANCb7ZUZWknL6MM8W62kFAfoH81l/Z809FsYZpnPIVQnu9cZNxU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2177.eurprd08.prod.outlook.com (2603:10a6:200:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 06/19] iotest 065: explicit compression type
Date: Fri,  3 Dec 2021 14:07:24 +0100
Message-Id: <20211203130737.2924594-7-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83e05be9-1854-4a3e-7183-08d9b65df419
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2177:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2177F786B824B23956E6FEC4C16A9@AM4PR0802MB2177.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3HkXa1JpZlHNLB0JRrIHRLs9gI12REKGxjQ3BgLQB/XqCZuqDT0ogrhGnQDVbQEsJL9LkQqz+whCTHNRnd2CKVVuqTSLw0k/dpPMBfJi91cnyg+EwqjuAF3U+SToAhNLEcVQs6tTaP+DaErWReG0nGoBsaQjCWTsS7lyhyL+F6diZ8ODgxok5ixO6+ilErPffU/dS+GFTpgEHJQdnARs4cGbt5dPQKTkz/Lql1+Y9KaACrA4ZwxDzCBPMpg2Z/JBWQvr6lrjkRIc+Zv9X7HtgRXxHmngDClBP1QS6JK8I4tdTdZYo5m28AYwWGkFjWX33JAAp/F+/Xjp9v1eGaksZ8J2IhD8KRcdvfUJ5lw7AfXtcY8RXIHrMpt8N/vQbz4k5H9hBFOxtjS46F2CSRIaDVcV3CACtzLKjeFWZJ3Fxa3l9+dOA+3isvl1T0VbkgEvHNscztgFgo9jgwJhryBvpbfkqRwMNXO38TvDTDXL3bQ5nnU9rLRC8Y71evWDR8P5idPewRBTSHvtlpDt+ufDvhsF1DSLIKdqIXhe2dugwd06S+QQmIwsEBijtxvoTyvnJMZvjFlhi1KCrKw4pDMEnicNxX3Jka3xQZIwez4SduChDQhSXwJM9jvzFuEkjVHZmVAZDFc7pHkTkFuvu9mvlMnQulzsM/gal8t/GTFL+Bj6bxKSIQVpXTBY5JYOPOPN44yS/Z2BPmXReD8JMlkiag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(83380400001)(26005)(66946007)(4326008)(186003)(66476007)(38350700002)(38100700002)(1076003)(66556008)(6916009)(956004)(6512007)(6666004)(6506007)(8936002)(86362001)(6486002)(52116002)(2906002)(36756003)(8676002)(508600001)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2phXDDeea+L/aY5ittWIQ+2ccNOue+zjYQe3tTjl9+yKAtwjJ3mDOiWR7wSN?=
 =?us-ascii?Q?StzkuCGFsWSGxgaf1Zx3lA7U6VsdSHeOT1M0VxWiAzQzQwN+onjo6FccS7wk?=
 =?us-ascii?Q?naD92ymZn4bGa0iGIw/ot5Nv/KbsbxHGZ1a3R7plL9aRPpVacCQVdRWiIzhQ?=
 =?us-ascii?Q?7feFU64Dd8t4FNTX8Gl9gDEr8UY4qoB/pdNl1asDM7ptxDGDegt7KSfBE4UW?=
 =?us-ascii?Q?w5RttXKhXlmpl8lVO0i0UBxu2Ig7Au9ygVgdzdGr9inyQlPmJeIyecAkAMnQ?=
 =?us-ascii?Q?Fd8kZEfMgufx9jANDJZ3D7Nr+ONz/UYRPJyoV11D/h96s5JP/pyWfYsFl8Xp?=
 =?us-ascii?Q?KJ9dme3mZw4qEr279DGQIcyHzkDBZ8jP5+A8MSVxW6r6IrGCWhgjCcq6Ovgw?=
 =?us-ascii?Q?tKq1xNzgHffegvyQMHCQTNc08DkXM3o8VniFZZKi+19eW0wVpysxWaksOjs9?=
 =?us-ascii?Q?xzHE/4rlPem2GQ0oMXUMZdrRzHcMYEhtWhltiNOQ1kPkKCZNNqJtXtDwl1Ts?=
 =?us-ascii?Q?Hu5iAtoKMDV/qnkkQFgpXmoJFw/oQ8znkaSo/sxg9sJujxmdRGCybwrq/hnC?=
 =?us-ascii?Q?ovElqcI5YPJrmCt8f/kduCfjchiEPmtIBpR8rlm9moKQ5d8VClWm9sAHVYYM?=
 =?us-ascii?Q?w6qJuHEgsA0rElMgLpreN4+bQMtBtp+y5D2Au2jQLzKguRfZLd8kgdVIa48d?=
 =?us-ascii?Q?1NxQyqLHTTuHTNTEjczmck+3x3qA8Zo483o7JXhb44VQK3w3FhqHOrjzRCjv?=
 =?us-ascii?Q?k+MqLj867StFML0GFVn8RsPeJHAE6e4uMvq87VnmfBPrZrURYR1HlCLEcWw1?=
 =?us-ascii?Q?RGLN5lmWqhoo3ZwtD0Wwrtt/Akl1ACrHrvNFlec4p2BMYqt2/Obv0zFDT3cc?=
 =?us-ascii?Q?D7L5JZ8oBvxbe3RJ814ddrbEfXVdMULgcqP+sT6bbvloABFTu3OfH8i9UDg0?=
 =?us-ascii?Q?5iE0C8/n1w/w3IGPq4xsumdtSsPSjb3i32oDu2G1QV5n5DXHtqwj5MKQ2rQ0?=
 =?us-ascii?Q?Lf8JrPLSc60JMlhJJeDz/aW8JS3ji7VrxHumPnBJ+UG5UG0QQsV3zKL97S/D?=
 =?us-ascii?Q?Y8qYRWfHQbMOB/8Hs9UYldTl64UCHL6lh7odSKWeeLxo/6oY/EidpK0D0MQ2?=
 =?us-ascii?Q?WCzSNgS+R88r1hB0qZx/9sZLGrc4QldYVx2+x413AK3IXhNZSH9z4nXwNKaM?=
 =?us-ascii?Q?p3n5piZZh0qfHIxEGihCi7OQDcHuayCGpK5xG/Ny0wbgrrOJgDwG7OQU4cXC?=
 =?us-ascii?Q?PGfFTMDNbHLzETLNnhC2GSFTPQSry5WI6A9dANDENxODV3/9FrZcFaVOZE2T?=
 =?us-ascii?Q?uBKIo0X5qP+BWqvryQE7pTEe+4tNmZZTBpN7zZQd6VWuVO5WjMaDcWVyGGx3?=
 =?us-ascii?Q?e5i1L5R1uxT2mtl8FPllhc9W6PpgicRO7XjEUUf4rX5wJNccmY0BcqtQXRaC?=
 =?us-ascii?Q?4yh1u2y73H9UyzDNOhEkNcrAKHzU0FhYUYK4deO+npomSXO9vXNmzCAQJN1H?=
 =?us-ascii?Q?xCxRZbR9Qym4DAS2WXKnyrLAdQTjOXIDBOcVbt9Fwbwr8MjJvW6WHToJMM5Y?=
 =?us-ascii?Q?5R/MmpHzf5wX0k5UrV+HSPnSokbuvMC7eubjgnUcBu6JdaVhgLqQqhk7wMaU?=
 =?us-ascii?Q?R88bEX/vXDNqCzHKa/Qp2ldZ/Gabf2y0GsGUSx7kf0WyOsI8S9fpy7wi9mgp?=
 =?us-ascii?Q?EoVOOg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e05be9-1854-4a3e-7183-08d9b65df419
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:09.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLV5MvSNhr0OwbN+92oruVd3RyGm8LyETfPxTRKhjyZG6Zr7fkwuipHj/E6ScILjVs5xVPaaviCQalP/ZgHtEvZwFEPbMHxvUnvfiEnuynY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2177
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

The test checks different options. It of course fails if set
IMGOPTS='compression_type=zstd'. So, let's be explicit in what
compression type we want and independent of IMGOPTS. Test both existing
compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/065 | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 3c2ca27627..4b3c5c6c8c 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -88,7 +88,7 @@ class TestQMP(TestImageInfoSpecific):
 
 class TestQCow2(TestQemuImgInfo):
     '''Testing a qcow2 version 2 image'''
-    img_options = 'compat=0.10'
+    img_options = 'compat=0.10,compression_type=zlib'
     json_compare = { 'compat': '0.10', 'refcount-bits': 16,
                      'compression-type': 'zlib' }
     human_compare = [ 'compat: 0.10', 'compression type: zlib',
@@ -96,17 +96,17 @@ class TestQCow2(TestQemuImgInfo):
 
 class TestQCow3NotLazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zstd'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': False,
                      'refcount-bits': 16, 'corrupt': False,
-                     'compression-type': 'zlib', 'extended-l2': False }
-    human_compare = [ 'compat: 1.1', 'compression type: zlib',
+                     'compression-type': 'zstd', 'extended-l2': False }
+    human_compare = [ 'compat: 1.1', 'compression type: zstd',
                       'lazy refcounts: false', 'refcount bits: 16',
                       'corrupt: false', 'extended l2: false' ]
 
 class TestQCow3Lazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zlib'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': True,
                      'refcount-bits': 16, 'corrupt': False,
                      'compression-type': 'zlib', 'extended-l2': False }
@@ -117,7 +117,7 @@ class TestQCow3Lazy(TestQemuImgInfo):
 class TestQCow3NotLazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled, opening
        with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zlib'
     qemu_options = 'lazy-refcounts=on'
     compare = { 'compat': '1.1', 'lazy-refcounts': False,
                 'refcount-bits': 16, 'corrupt': False,
@@ -127,11 +127,11 @@ class TestQCow3NotLazyQMP(TestQMP):
 class TestQCow3LazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled, opening
        with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zstd'
     qemu_options = 'lazy-refcounts=off'
     compare = { 'compat': '1.1', 'lazy-refcounts': True,
                 'refcount-bits': 16, 'corrupt': False,
-                'compression-type': 'zlib', 'extended-l2': False }
+                'compression-type': 'zstd', 'extended-l2': False }
 
 TestImageInfoSpecific = None
 TestQemuImgInfo = None
-- 
2.31.1


