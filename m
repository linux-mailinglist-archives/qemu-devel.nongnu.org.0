Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD046781C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:22:56 +0100 (CET)
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8Wd-0008PG-6X
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IV-0001sb-MP; Fri, 03 Dec 2021 08:08:19 -0500
Received: from mail-eopbgr40107.outbound.protection.outlook.com
 ([40.107.4.107]:61828 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IT-00071J-B0; Fri, 03 Dec 2021 08:08:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocAUYJ8KvBtxI0k9XiUVh4Sl7UcklrUVRROxwceGsqfLHsPljDA43EphMvYN9k6WAbnNb7MYimZ3Yn0Ej7kiRhW3B38W4z6fPyb1HIMo2ZHukfh/k3KHI7b7nj+4e0S68Rpu000tHk2vaoqH/rax81MKBDYmnUbbDLYfpiJHnPVR3MSyQbbiBJ2xcOXPPGmDiKImjL3KRMK/20dh5Deop8Cz5nScNtV/O2b7psuu2KAIwgUZxbLeTVEox4K8CZh2wusYBft1DXH5SpYBiEYro3Oo1p36yul75nWh+YAJ/IfHSTpfGu+J3pjrU7fcUswkUISSMP8gCUiq/PqeY+jBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMMaY+uBj34V+ZOKyD8G44E8xsq2GC3/gsYcDTSOu/I=;
 b=fhzqPy3haKZHYneYkkQxiu6v/cNxVYeNeeFNzkJ0OJYUxuWfGwJWad4oLe+9Fl3oHr2T0HMkm/gb55EqlqBiqnJ3KjdrBbeqnzKbgqLgQrZ4XgtUD44A70cPjQK+vI9Rl7A7/6kSQIxAsFDHvslkwNkuAPRdjQq3qpjoooR+ZT5AiTCdvgEvN17HRAf/2KmPjAz7vfBYFp6EUtNMPUCvo2t3dfcq7fO6ZuVzhOrR2tpTutYpPdXqQHObnzPLEgReLkh/V2HNkglnJr2V5aLYhxCfnhJPmMRgGBKbh8X1JEonfXlYttVSqrWZeRCRuwYelrr/q1LCqatIJzjgentKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMMaY+uBj34V+ZOKyD8G44E8xsq2GC3/gsYcDTSOu/I=;
 b=YScVdf2sbywFglMaKV4InPC274mEkhbpoDdOJ9q1fzUiihRJ2BnZQNBvU78eT8agK43Cz+0QluciKYdxZ8dcA6YHo+IBUHjXGZXYySRFQNbMhh4MFROXFjYPTtT2Dvh5ADErGZZfMgmEyPMVJWddnwRZWpcELqU/r3PNHJfaR9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v4 05/19] iotest 303: explicit compression type
Date: Fri,  3 Dec 2021 14:07:23 +0100
Message-Id: <20211203130737.2924594-6-vsementsov@virtuozzo.com>
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
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2eb3425-267d-4866-aed6-08d9b65df3bd
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB4515360F4ABD373AAB276603C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P5BgIQoWlwxBIU6+y7cpjtBNoGl2diOeAOmrMMVkpldyKpag8EIFlsskMjhEFxdR5OTUzyF0DjkhKhScgbCwNMjMWilNLwKBW2xgKK+q6H2AHcI2u0fFPSnDH54uI2tKCAqclEt/CQYSw0zcthwPhYBm4j8/uI1qjmytjsUkH+MaKLuR+3MAszRjYu8E09v0VW9QehIfBc0cDaGcil6J24tGn8yPl9gy+8eCv67p/T1C0Wy6P/nNQ1tONHmv14IlFFGBElCVnV5fM3eAuPGfFol1enILCTmtTBjLEh/Kx6mUPjhkYHE3C8MwExa6LkXxQuu+tEeLUUCBjPB9xECEeoE0554K5sjr9KDryoNtth9RIqSArM5WVjKl5V0YDdvDOb/st0ZlMkWAQjG6n9OKP1qotjovFEnmFGYexpLZpGmUUdtG5StGRcDS5L+qpY+m6v9X6Z8MiwTt/pblx+q3q4Tb/gtyOw38Q7QhqydxMTpT8l5/rj9oBw2hJn+lqFM3OyNPjHj8hQMwJSOsXlpiwwhZ/sqKk1U/V6AXT4Q8c5A/EhhcOF+VHXol+q0c3osGO/bJSlzXSTXzTYiHnI6T/6zjPb9k0emL8ScXoGFOddh4EwwG88euqP1JyUFaveQEP4grLz29LXIEoRtNJGKjPJU203jUG4nY83vHyHsk0xJAH/bi+ZygZnX57EjNoF6yGdcOPL+pP8xjkdaAWbNnbSsUQ4btZKh12LDN3OYN92U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?otAd1t3Dm7Ly34lnuPKIFiVFKEBLB66V/QZKcDtm3kDdN43Lx4N4l0zc/I4p?=
 =?us-ascii?Q?OMW4jtPM7p5te6pAn8BKatWmFwH/T7wBvKaa35ALl3wxvcZ00nilA0I5qyKY?=
 =?us-ascii?Q?9hfn6KQmOOX89zsKg6h6LvO4KyQ2uDkM7wlMqgkS0ioNmkrvz2Jihe2EJusK?=
 =?us-ascii?Q?kqL96N1j9h+GdYzeRVgU2HQx2I9bew/3+S2xRsKTKh7t5J7c4XV3hUT5MJ6E?=
 =?us-ascii?Q?HygkjZvdmgwB/TeonyxaM1GDXFveGwwpJR+H/A83gJRnJZPEgDI/DEtc0O6h?=
 =?us-ascii?Q?o9/4cC3/2zYmKKegogQG81tuAwp0qAuFnPQ4s75QmpFyRK5s/Ti49W+xSqTo?=
 =?us-ascii?Q?dS1rF0Eu5Km6mKyBAxeh2GRkb4tSkomGjOM0/fr2V8RVHRwvPSF9z22Pq5lg?=
 =?us-ascii?Q?QywmU2kqafIlOimHjPX00UiB1nZEUQKqCkxZsShRdOgav2s9Zh/44gQ5whxq?=
 =?us-ascii?Q?qhfAcVxpgXo7Nn93MCWCUTwgceNi/y7+oh+/tbSX04T5FqfOL9xUSlp4xsaF?=
 =?us-ascii?Q?nz2IQKJiXTCyczX0UXSWAjrDtR5ag3l4cObqDoNEXvl9MUK1JFqUuKD/lPA7?=
 =?us-ascii?Q?RLBEisC2gU7T8fW8JRt9M8mxsF6mcMnTKq1nZR6ZGp6hQNPDfXeU3FXbxrPi?=
 =?us-ascii?Q?ipf2OnHmsX+yrsUP0+2zxDHE5LSFqGx8XbkG0+ZenDRSLUbefaeRi0PLJOmA?=
 =?us-ascii?Q?64lqzCH1Jh3H/5afDI/FAzmfCIwb6O2CXf0yEb2bLDkirmbju8T4NufE9iVj?=
 =?us-ascii?Q?VM6YamKAFaX0LfmSfwf4jG+Zo33SJejwmzZLn7JoroDKlR0IwxUqor4zUEhM?=
 =?us-ascii?Q?pm1Wn6DH6IWEeh8c5YuDTnOzPYt3KbfNT0ny6afWJcLLZ8AIKx46A6Gha+sd?=
 =?us-ascii?Q?tXEFQd93cofvY7AsUodyDUho3k3sd33bO1GXn77VWVooObkh+CzVlA7gHC+2?=
 =?us-ascii?Q?QI8Sd1TYjbduHwyJKX8Q1KiLR5fxRp9IOjSpGTbBfodoCkFLGydJxaQsy0XD?=
 =?us-ascii?Q?rcQjag5s/nP+K51ufX+QnYI7n3SEfolhbVEEMzqC2TJ+4qQ1MbRV8+VFiRxP?=
 =?us-ascii?Q?meSnkZfXXlLzuLH+IEU233zbDzEFCbWdFXKoAEEI/szg8nfPoSrQmbdB5Jw2?=
 =?us-ascii?Q?fDpsSKTG/sTyfF2jviBnHAAxE+BZcYTwRWUzPhqmxsIVQ/aBFnWOgFTXlR78?=
 =?us-ascii?Q?IzTZznyMSAQrL0IV26yZlRhH6a63JC3IrQsUAfgteXX48OcNEoHrTINTw5Pb?=
 =?us-ascii?Q?Ngs7K/Nnexxqmg0QFkEbjy/qnWSkKVbnLd7vqYhAb/4g6YwZN8ESxPRadSPg?=
 =?us-ascii?Q?0C4HAEHT5zDdovlIaOTqg4+sQ52q7DznQ1y3PQuKG8vtiVTfbiG3O3pI7tL7?=
 =?us-ascii?Q?+aS1SeYqZnnq+qipJt0iTHPVH157vSU4qe9uWJYYMXy3+ijMXSXi/5WDGVVq?=
 =?us-ascii?Q?VkoVmLgXWmcINcVb5IrhKrubPJ0ARdOOGIACR9yQFVUDXBUBXqCHG60ENJ9o?=
 =?us-ascii?Q?77LPIS2B5o6WvvNHr7mxq4z8DnKY4sCpqUFSskp3eUDMX5FNOQdSGVUlTuDB?=
 =?us-ascii?Q?JEvYCXkyt32mUQ1bzFJN/3WG/JHt7/YgcsqBwTewUxK4M4MIr83i7rEbAlCe?=
 =?us-ascii?Q?TtHVM50wHpAK2LPWsd0ryGnrZd0kfOBcasSCsGNhaEsT9IO/Nw0skdx9QkWq?=
 =?us-ascii?Q?D5yWGw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2eb3425-267d-4866-aed6-08d9b65df3bd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:09.0370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a13xJUnR9ZNrV67b8UGs62QvOrpbrjA/LSSjRuo4S4+XHMds1ZMc69nbuuZReCe4n2LW0GM61ISxLOqVe+hmi5KEtPchvz0otH3E8jvyu/0=
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

The test prints qcow2 header fields which depends on chosen compression
type. So, let's be explicit in what compression type we want and
independent of IMGOPTS. Test both existing compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/303     | 23 +++++++++++++++--------
 tests/qemu-iotests/303.out | 30 +++++++++++++++++++++++++++++-
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 425544c064..9dee2bdfb8 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -53,12 +53,19 @@ def add_bitmap(num, begin, end, disabled):
     log('')
 
 
-qemu_img_create('-f', iotests.imgfmt, disk, '10M')
+def test(compression_type: str, json_output: bool) -> None:
+    qemu_img_create('-f', iotests.imgfmt,
+                    '-o', f'compression_type={compression_type}',
+                    disk, '10M')
+    add_bitmap(1, 0, 6, False)
+    add_bitmap(2, 6, 8, True)
 
-add_bitmap(1, 0, 6, False)
-add_bitmap(2, 6, 8, True)
-dump = ['./qcow2.py', disk, 'dump-header']
-subprocess.run(dump)
-# Dump the metadata in JSON format
-dump.append('-j')
-subprocess.run(dump)
+    cmd = ['./qcow2.py', disk, 'dump-header']
+    if json_output:
+        cmd.append('-j')
+
+    subprocess.run(cmd)
+
+
+test('zlib', False)
+test('zstd', True)
diff --git a/tests/qemu-iotests/303.out b/tests/qemu-iotests/303.out
index 7c16998587..b3c70827b7 100644
--- a/tests/qemu-iotests/303.out
+++ b/tests/qemu-iotests/303.out
@@ -80,6 +80,34 @@ extra_data_size           0
 Bitmap table   type            size         offset
 0              all-zeroes      0            0
 
+Add bitmap 1
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 2097152
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 3145728
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 4194304
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 5242880
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+Add bitmap 2
+wrote 1048576/1048576 bytes at offset 6291456
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+wrote 1048576/1048576 bytes at offset 7340032
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
 {
     "magic": 1363560955,
     "version": 3,
@@ -94,7 +122,7 @@ Bitmap table   type            size         offset
     "refcount_table_clusters": 1,
     "nb_snapshots": 0,
     "snapshot_offset": 0,
-    "incompatible_features": 0,
+    "incompatible_features": 8,
     "compatible_features": 0,
     "autoclear_features": 1,
     "refcount_order": 4,
-- 
2.31.1


