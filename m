Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C107F46789F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:40:27 +0100 (CET)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8na-00057b-Sc
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:40:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8Iq-0002Mb-31; Fri, 03 Dec 2021 08:08:40 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:61828 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8In-00071J-3M; Fri, 03 Dec 2021 08:08:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nitPQEafDKZojeXWo3Z+RErk9v7NY94XdNOMpD3NAKy3QO29wKPSpdpNd/dpNSfyBDIgSUZB66VPy/EUDJ8J/VQXkLfj5q9B/Cqgaj4ECp7E+F6ynAzEUJU5rPyIgiUwcDy12Litmu69tWy314mExw5OcksSEdm5YYn8R5EUTkZeOEA8W0gCGsYEeQKD0dLB8oGo5xPnVAa/Ndhyy7QeH7J5sZlJ9A1Ak1uYeMqcHFqVxyoh9ExOMXyHiE+NQaF8J+CpgmT/3v8xGY4SLgolEtpwRj79iP8c0OV04dSVbUexbanalk1iXXj/QrqJO1ANvzKMncevKauT8MkdXKpHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXu3FmnQgyJT9YuFbr3lHECaL5vJaHc5sDd1ZHx1QRY=;
 b=JsfRHKzSHMGeWoG0bT27M+SzKSNf+tPOU9gyDgvKkJeTWsMyJ3DR1w/LiFME+1r8LD2MKqmx1ml0aSDA7LXHMytaROqtUqw9wwMy2wijCQsmrH3o2QkveVwwCRNbexXxm662WMxWO5aQMJ4SCyuaoYUFGYQu3QteE9qIKUM994x2mYpOwHoFvc74pSdfd/LvY2dhDC0KPYq5CB6dKxNd+FB439Yeprk/xyOtHqxvrVtiKNLBd0SFTeFDrStyUk0bsWCNNL8xTNxX9u5F9rkjh51v0nmEdbJ9XcmMRvXt5fgjroeTtY/uT2SRRpB1FQqLKkXjy4MJKwTAoOj7EImFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXu3FmnQgyJT9YuFbr3lHECaL5vJaHc5sDd1ZHx1QRY=;
 b=NmtjPzXnWcgl//kEP9e5ek6JO04KWT5KIm/Ft7Q65gRBJNIp1bFLulvU+Xznumksu7Gwt7ZSLToQzbka7IovLz5ye/dwlFE4Usq+U7RT8kTa+8ItI7pBnGhZ7MsjIv/yun5LtKNgFfQ/OexAjSbb8xO2isPaLW6ivC68v26ZWek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:15 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 14/19] iotests: bash tests: filter compression type
Date: Fri,  3 Dec 2021 14:07:32 +0100
Message-Id: <20211203130737.2924594-15-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a401fe0d-d214-4d50-0212-08d9b65df856
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4515103BC4B8925DB5AFEDE8C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYwr+ZoU8RUWGWRCxpvlgPHWMA31ZdyTOseuwKKkocZl0EOP3m/P4nXhjoUYol2xI7KrMdgKVwzDaAETnPs5BrMLfW8EOCO2WcaSr7UgSSISx1jfpJYbIknhmuLl0OlZPqIJmp8O+SboT8u+wU2JmN3zRBpxnx/aWHZ/p6SF9vQPK3gllKP8ktv8quPsgNldrR9BtwQRo1hWUSnXeRSUT7fsOAfNRRj/05fIRjBtv9nR9DuCx2V2Cczf+XPF2SeIVcx/IeQ1I+sck1PmdgZ+GbPXim7pIk3cQPOYGS4tgqBWK++WXtiYYqh5nk1gHDDI8mlL1WbSL0pWMBmQ9bfKyf7wH4ENEfguMDAirkBAaXwqz3d8ew76lirlpfPmwq8OwlLq5o4JoCFH0EWgSQT7/uCdoYo510fyeQ8k9Ovrt3g4HQ69SRiJeo9LGh0XppCNHr8GzlxqLqgNOCqmq0hTkxCLI7MiMEKGoDyvttAny1pYCdvABx27rz9BvgQCRHwKqv3Kp2jqR+gqFyzxPHclTUYp7hsKSlAjgebLy6326lmntKUKccQtQMkeAvq+kr/zRT2G+I6uC9lJaCpvp8rhqQf7uMJCJgWEh/AHTYn5IqKZqVlo/aSWx88Rv8WOSG9HaOCFA/xsq6A4o51YLY0O42qCztBsknn0qWNm1VV0LCTipJSZUXIyd/qH46aLcoAewjlNkVy0PTYipRwPeALFCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B1EJa5Jfrm1N2sZSn3nFl4rJQln3Hf0JUgc0GANLt/SPQM4l8G5LRTKt1w8a?=
 =?us-ascii?Q?WFRp4PRkiQRTBAIS/R8EmlsbcqAp69pnJS6+OZf7BdL+wfmgIhIlR+paYSw9?=
 =?us-ascii?Q?mXCaGQyvZtm7d2vJaz4DjjOFrZ4z+AUEz48lppfqDLJB+ZcUhJFiJ8dO0rbL?=
 =?us-ascii?Q?6Glj/uiQK5I7OQhHhG7t6QE5X9YvFEgHBNEgbf8N6crjV/endFfdPhjMYPfa?=
 =?us-ascii?Q?nTtL6AUKlUCbFVK7d48J1Qm1piPwb5CrtA9R2O+jWHHNB1yFUCe5VeEplyWj?=
 =?us-ascii?Q?TusEUe6u2wi1Q31oMW3pSkdb+lRpRG+wJLUYYKQcwXbN+eLbsBXAjklmJxxy?=
 =?us-ascii?Q?UvXkX9eBZdEkiwG0w0oWC98mdm5tCDGiFonL6opdDun0oYrmzzQrzE7WrQ8H?=
 =?us-ascii?Q?j7RlVxs07pV2/T+5vJZUCgW3nrVmqf/F1A4I/u1I8Dm+4Nfsvqi2SZL0TRY+?=
 =?us-ascii?Q?DmHHBnP2Wz6PRManpS8OZMneW/NAK6i8dnOjioG7VylZf3DYneZ3/suXtKUZ?=
 =?us-ascii?Q?vvUb6N5Yh5XLRGAN/mtrZuj2/COpKt8McWJYz3GS+NeHTMwA+vPwoX9hKfmc?=
 =?us-ascii?Q?9jqI89ibajaZyAO5zoSY8MxlKSDGH3lhtVt+DN08gbDPWdawhKZ3FSYy3+N4?=
 =?us-ascii?Q?BQULM2cOhl2ymGIyWs4YNBSX/BNH+XFD3BOoBVoPZ7qWSk763N+91TaahnN5?=
 =?us-ascii?Q?NCak7FQ7riX5BOT03RSbbNbL7zf/pWASCvyThM1TLyrBzoeQjFX36Qgg8zU5?=
 =?us-ascii?Q?L3pD+mY8SlAigO51QU4rxT2+PXnERQCh7zMy8DEDOFTPzMTFzjGHtumKSq6A?=
 =?us-ascii?Q?dLn8fylt+nU8wpBKcc0hcWRbRrf/FXtbTkaR67cYh++9DZlGnpbgaiSFARWe?=
 =?us-ascii?Q?UHhE7wqaIcU+Bb6aABMifcPot/VhTELMPu33+Zw6RX90zE9Fev+I7UphqhHD?=
 =?us-ascii?Q?ogl4ZhSvf7HXQqDr/146qcYopQbgrLb0SWOaTh5MyokL11m9I94tI8+eaIFi?=
 =?us-ascii?Q?XSg7oGXdvlaxq3zl3tZEqGQ/p94h2tr2g1yC/1gyMLZUCGcYhW3QU5/MjlZ1?=
 =?us-ascii?Q?MylTkKFM1LC2UMpx/HH6QXfvDNPB8jARkPgt/Z+uywDYK0RNqtjZ1P9BEh5l?=
 =?us-ascii?Q?bJMRGhurVDztv3ysnGry0nYWE88SfbB+c5g5fxvovYQP5IdWX6pjJINRPULn?=
 =?us-ascii?Q?2Mh+5T5V/ATCDmk6KJlr/IbR0SRA6CGTAXNsqG1OLCX8fxkM5575CSlIn6r2?=
 =?us-ascii?Q?8eDZk83qAEe3dtizlHQmomAqyNVf54G354qwVhyBRhCldaRTxliHvK2W/eIH?=
 =?us-ascii?Q?PiZQmNhPgnEd2LCkmGT2cHmiD21oTqZ2KeCyn9CBh/D42ij0rxv5s6U+oEZK?=
 =?us-ascii?Q?MFwZweEphFNdKtlHhpGtxAxeN7ebl0Q9HRk4Pd3eOcbWDPjAyctwpdHvYW9p?=
 =?us-ascii?Q?JU48KxfuB2k/ASh+zX/IGajqnFs//t/6IOA2z8Y4HU/gz40q/S4qCrP7aP8g?=
 =?us-ascii?Q?V/xmMIvovtQNo9dlxF6fSuHBkhsk0lJdQ/hqZogf5iO9KKar9IWsc+mIEkOG?=
 =?us-ascii?Q?p4Xq6haI3CuJYl/MFqrdUp+awjgJ/sTrXmEXcWGO+nFN2xl0XCEUD37xtz8H?=
 =?us-ascii?Q?qmITR/rJ/t1em66Ly9ekrJ/Nvq2Ypk8PHXSKgD7EvfDLsc9PCpfcHRi0CJDG?=
 =?us-ascii?Q?J26TqA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a401fe0d-d214-4d50-0212-08d9b65df856
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:17.0468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oqdpLSmifq5iUwQs6lzJnMgAiGIz7v9xdRCHyXknodJdv2Fae4kcMH3lK1rp4luI/8N+IjZKg86lI9QDRo9xV+Sti7yM6oNoR0W+LO3qCQ=
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

We want iotests pass with both the default zlib compression and with
IMGOPTS='compression_type=zstd'.

Actually the only test that is interested in real compression type in
test output is 287 (test for qcow2 compression type), so implement
specific option for it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/060.out       |  2 +-
 tests/qemu-iotests/061.out       | 12 ++++++------
 tests/qemu-iotests/082.out       | 14 +++++++-------
 tests/qemu-iotests/198.out       |  4 ++--
 tests/qemu-iotests/287           |  8 ++++----
 tests/qemu-iotests/common.filter |  8 ++++++++
 tests/qemu-iotests/common.rc     | 14 +++++++++++++-
 7 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/tests/qemu-iotests/060.out b/tests/qemu-iotests/060.out
index b74540bafb..329977d9b9 100644
--- a/tests/qemu-iotests/060.out
+++ b/tests/qemu-iotests/060.out
@@ -17,7 +17,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: true
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 7ecbd4dea8..139fc68177 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -525,7 +525,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -552,7 +552,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: foo
@@ -567,7 +567,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file raw: false
@@ -583,7 +583,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -597,7 +597,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
@@ -612,7 +612,7 @@ virtual size: 64 MiB (67108864 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     data file: TEST_DIR/t.IMGFMT.data
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 077ed0f2c7..d0dd333117 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -17,7 +17,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 4096
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -31,7 +31,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 8192
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -329,7 +329,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 4096
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -342,7 +342,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 8192
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -639,7 +639,7 @@ virtual size: 128 MiB (134217728 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
@@ -652,7 +652,7 @@ virtual size: 130 MiB (136314880 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: false
     refcount bits: 16
     corrupt: false
@@ -665,7 +665,7 @@ virtual size: 132 MiB (138412032 bytes)
 cluster_size: 65536
 Format specific information:
     compat: 1.1
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     lazy refcounts: true
     refcount bits: 16
     corrupt: false
diff --git a/tests/qemu-iotests/198.out b/tests/qemu-iotests/198.out
index 3952708444..805494916f 100644
--- a/tests/qemu-iotests/198.out
+++ b/tests/qemu-iotests/198.out
@@ -36,7 +36,7 @@ image: json:{ /* filtered */ }
 file format: IMGFMT
 virtual size: 16 MiB (16777216 bytes)
 Format specific information:
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     encrypt:
         ivgen alg: plain64
         hash alg: sha256
@@ -81,7 +81,7 @@ virtual size: 16 MiB (16777216 bytes)
 backing file: TEST_DIR/t.IMGFMT.base
 backing file format: IMGFMT
 Format specific information:
-    compression type: zlib
+    compression type: COMPRESSION_TYPE
     encrypt:
         ivgen alg: plain64
         hash alg: sha256
diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index 5427ad5456..6414640b21 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -61,13 +61,13 @@ echo
 echo "=== Testing compression type incompatible bit setting for zlib ==="
 echo
 _make_test_img -o compression_type=zlib 64M
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 echo
 echo "=== Testing compression type incompatible bit setting for zstd ==="
 echo
 _make_test_img -o compression_type=zstd 64M
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 echo
 echo "=== Testing zlib with incompatible bit set ==="
@@ -75,7 +75,7 @@ echo
 _make_test_img -o compression_type=zlib 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 3
 # to make sure the bit was actually set
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
@@ -87,7 +87,7 @@ echo
 _make_test_img -o compression_type=zstd 64M
 $PYTHON qcow2.py "$TEST_IMG" set-header incompatible_features 0
 # to make sure the bit was actually unset
-_qcow2_dump_header | grep incompatible_features
+_qcow2_dump_header --no-filter-compression | grep incompatible_features
 
 if $QEMU_IMG info "$TEST_IMG" >/dev/null 2>&1 ; then
     echo "Error: The image opened successfully. The image must not be opened."
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 2b2b53946c..75cc241580 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -247,6 +247,7 @@ _filter_img_info()
         -e "/block_state_zero: \\(on\\|off\\)/d" \
         -e "/log_size: [0-9]\\+/d" \
         -e "s/iters: [0-9]\\+/iters: 1024/" \
+        -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
         -e "s/uuid: [-a-f0-9]\\+/uuid: 00000000-0000-0000-0000-000000000000/" | \
     while IFS='' read -r line; do
         if [[ $format_specific == 1 ]]; then
@@ -337,5 +338,12 @@ _filter_authz_check_tls()
     $SED -e 's/TLS x509 authz check for .* is denied/TLS x509 authz check for DISTINGUISHED-NAME is denied/'
 }
 
+_filter_qcow2_compression_type_bit()
+{
+    $SED -e 's/\(incompatible_features\s\+\)\[3\(, \)\?/\1[/' \
+         -e 's/\(incompatible_features.*\), 3\]/\1]/' \
+         -e 's/\(incompatible_features.*\), 3\(,.*\)/\1\2/'
+}
+
 # make sure this script returns success
 true
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 5dea310ea0..9885030b43 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -699,6 +699,7 @@ _img_info()
             -e "s#$TEST_DIR#TEST_DIR#g" \
             -e "s#$SOCK_DIR/fuse-#TEST_DIR/#g" \
             -e "s#$IMGFMT#IMGFMT#g" \
+            -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
             -e "/^disk size:/ D" \
             -e "/actual-size/ D" | \
         while IFS='' read -r line; do
@@ -998,12 +999,23 @@ _require_one_device_of()
 
 _qcow2_dump_header()
 {
+    if [[ "$1" == "--no-filter-compression" ]]; then
+        local filter_compression=0
+        shift
+    else
+        local filter_compression=1
+    fi
+
     img="$1"
     if [ -z "$img" ]; then
         img="$TEST_IMG"
     fi
 
-    $PYTHON qcow2.py "$img" dump-header
+    if [[ $filter_compression == 0 ]]; then
+        $PYTHON qcow2.py "$img" dump-header
+    else
+        $PYTHON qcow2.py "$img" dump-header | _filter_qcow2_compression_type_bit
+    fi
 }
 
 # make sure this script returns success
-- 
2.31.1


