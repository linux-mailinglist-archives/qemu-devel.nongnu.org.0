Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2EE4791D7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 17:49:14 +0100 (CET)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGPx-0004Qv-0A
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 11:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myGNy-0002ca-8P; Fri, 17 Dec 2021 11:47:10 -0500
Received: from mail-eopbgr40121.outbound.protection.outlook.com
 ([40.107.4.121]:35531 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myGNv-0008DQ-Ob; Fri, 17 Dec 2021 11:47:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldz8ljwymoppWl0NrZweeHLuSgrOOSyIx1p+ujlshWl3NM7kXqgy4mVD/0QJmpyaF8XE84vmv/B0lwmb+H0cSe8VGVbYFW7xgyE62V9/0l2nvVFKOKv3H4YKZBdYfLlcbKr/55Y8+UnWHWlPolJqzVHRnTFRAlt2fzhAcm/S4XkZbANUrpxmM4sMXx8c3J2M9XySMVMiavjp1gDWx6/MXK2pFwcnXC12U3WPlgcMu8hV1I4JV/2tD0Jbs3VemsExv5mwbZU+oyL1mJOPicDkBHf7FYidn1VX3fwZp2O95HOiCvDqbKxsdS/8ytU/L1gM3UVEewiXouXyQWH32jlRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4miMG3Oab9hhFZOAYw1MKZFIkoUiB2FyO1PtzuUDtVg=;
 b=Jqe54PnAv8haSIxxZwshWgvwMECAtCM0Wkjvx6xv7xpi23AbTm6hsYM80sIC40yqFTNqOlPNHAxFejR2uaZ96s58LQwVYj4avjALk4GbO2gVap8SNh/4GfDOXIvBiv7U1MRz4ZqE3wzJoxhCf9y+QGhqoBbpPH3YPvdvF61IK/nKeLP4GBsiwu2VpeNXRm3I2aAYKzwWS4l6VC71B0SzBGPvV7saHOg+MPxG01Hg5AGCVju3b2c8qj9jUiUVDB6eG/h7+RStVBBoTVOrO7Cg3F3Eo4xgxcg/3RAR3QUD9/QtyxanrLIK/LZgXs+yae4QwcPVdjg9w+hYnqJKDFGl2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4miMG3Oab9hhFZOAYw1MKZFIkoUiB2FyO1PtzuUDtVg=;
 b=Q/txW1KyedLsEqVeZImvU6WLj81AHXnePiVvfXFJDz51zZNij7Jw+v2G/t1iAr10nsybnhZJVKPQi44mZXCAly+NQRcBT8bmm95PU2Mh6LNXiHGPL6EDDWuQQNkqENQb9j25LBuQDGfJYec51MY+C+nmpMah5QF6U4yFizpiIPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3955.eurprd08.prod.outlook.com (2603:10a6:208:12d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Fri, 17 Dec
 2021 16:47:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 17 Dec 2021
 16:47:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, pl@kamp.de
Subject: [PATCH v2 2/2] qemu-img: make is_allocated_sectors() more efficient
Date: Fri, 17 Dec 2021 17:46:54 +0100
Message-Id: <20211217164654.1184218-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 58d6fc3a-eb34-4a08-91de-08d9c17cdaa7
X-MS-TrafficTypeDiagnostic: AM0PR08MB3955:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB395579950D5439322B433A4BC1789@AM0PR08MB3955.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d62JrLBVr6VHbfKym1A6KDOkmkvFnnoIxijIBQOpWULU8DgXBO7eq4VYn3PM73S9dyeTglUQJyC0bZDcm6np+h8qy5f8ggtzd8czMXTSt3LyNgQEI7+OcIOYP4QrnQtvQWHuDJcK6R5GVXKPG6V+oUBUX9wtG2YKTwq2AbDEkC/vOS/leHrxmotQohcT9V5obhmXSS6naK1Tj8Nq00/QZyF4o1jdfNGPGIpMrXlZCpnul3196HnEkhg9Holjm4KHdcjegdvjftX7ND2R7l7rMsIT/se3TmVBUw8pbCGpzT3hjsPsw1E0QqtIXdARDkzwA/houHroq7HKjr1jkGiqsJRfMP93pUMxKTE+y6wbvHPy7nUY2IHIHzG2gCOJFMm3j1Rp3OKUbgiwnK55gVv88ewDNH6J+4wh5KhAOIcdxE1dFswrmowMpBN8Gdxs5cr7ZGX9FAFwyVKwXddhKpeAlLYoNnp5nyNG9spu0VxnL8QNyjagI+SctxFIsNRqwd+UH67MUucf+Yf3bGSzQ/THbKozq7v/lOHyZ7CrylJ25aPnoJ1w2N0bJjbfnuP2OF37HPjVxyjYv7rX36Feago54GXyiFyWMnIKzKVzwajJEJ3Z8JB12kTFOfg4QWiIO3+K5Q/kxQgSN7NlHuwK9gDBXnOof/jPoVXwPcmgG6uo3NZpDmk1qGRIk4dGXg6xr+cQqlIRyPfkyT70YwB5lTWljQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(36756003)(38350700002)(26005)(6916009)(38100700002)(8676002)(52116002)(6506007)(508600001)(8936002)(2906002)(5660300002)(316002)(186003)(86362001)(1076003)(6666004)(66476007)(2616005)(66556008)(66946007)(6512007)(83380400001)(956004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rwFtZohm7ajjYMbmkHjqJhsLjKxba4CSl8dzvbvhKHHY65P0arnfbLfJlCRd?=
 =?us-ascii?Q?8Cx4ToFooDhQKd2jk4AdOR/HlM7XFdsniogVMWAjq5B1JJsvNIXLjUeAiJDg?=
 =?us-ascii?Q?DMPT6t4lLRgXZxiMns+oBADuDpV7DfZjSD9DNA311DL4l24KyovC4MTF1kSN?=
 =?us-ascii?Q?FQTlT2FDcDB3XjkneUP0X3byjSbFwRW/a9TN7MgOaN7XoeDReMUQFcb12ihG?=
 =?us-ascii?Q?QDhNtDk4ZUJt4CDZOJsLAxprd6hLfhhriP/X3NNUqbgiSY3/D1sxct+6KZTJ?=
 =?us-ascii?Q?mr/2M3ehlT43gsg6+Mi7lFF7ktyBNE7qK01/fEED9BDKoFAokesdkD5IZOGv?=
 =?us-ascii?Q?nuoEM7eFtbei6LTMvKz5arsrnqwMoMeTuHax3TSWlutg4T3JPD3mA/7xoaYR?=
 =?us-ascii?Q?7xuG9V7eG2LqIm1HA95fMs6w7dD17usr9CmIoNixtyVFHLgcFKQqohI9KLbg?=
 =?us-ascii?Q?hrFzODAS1rJgm1P10iO5bm/L70LNOAyyWa+YnNDzOoDLYwIFny/Cu5ERVldi?=
 =?us-ascii?Q?FZoMlS3uVctsR/Qix2vvqz6B14ve/emaxOWCctNaXn9s9kty8VgUlMJx1uGw?=
 =?us-ascii?Q?gxw0vj2cAbeE1Hyb+jfdNWEIYBGy7yMv38nQ3TS9bndmx85GzJ0+dy4aBLUd?=
 =?us-ascii?Q?kWgG3DsdBIrl1B2/jzFWH5Pq/qn3XB1j4BCr86M8fXwQKjqXLmzCNcJ1JVxR?=
 =?us-ascii?Q?VFCPVXIHYA9m6TogAewjUfVLINb2BWCrISy+El1pRrB2f7j0G8NIYzK6eCr/?=
 =?us-ascii?Q?FAI1P6qjLmq8xTuqCHe0MiRT7/SfE2nWDsJYG1tuOEfoca5e5VpCwx/RzLHq?=
 =?us-ascii?Q?NSielvhUzGp8FjXbeh8nnudz4WgLpBCLwVa/N3rBfMIEJF1S6xrGwCaa77Uk?=
 =?us-ascii?Q?i5ZKi1WcZcUq6VE+/ghOv+M/tGPbz58kv4itWsWDxtOPk/AVxAHzL+vb0cgc?=
 =?us-ascii?Q?xcL116wW5yAM/Kr1moftExlZGeKTf5T9ZjocBTQXPE81m78eUEotlhwWp1hj?=
 =?us-ascii?Q?Q/fQLu2UMRAdq6dRYYMbg7uuC87CPYf0l6uiNAVs9+3AiL53xLBi/srcBBH7?=
 =?us-ascii?Q?RsiwAnOySwB8fYhhfxMg8CTUxWsSYp88A1ogDKw+qGGaKMY4d9ToFy+FmooJ?=
 =?us-ascii?Q?P4H3vM/VNJJVt0VMJYwxGPdE60Iq44IUSd5ir5qddCMHsg2Xj8stFyQXKLWm?=
 =?us-ascii?Q?BvkE/Qtqf4uza36wLZ0vDyMhZpWq79G7tCN7rN8jBkVVPvg70ToDfKxhpf3f?=
 =?us-ascii?Q?cNFcY4MhPBNX5G14YVT3cEGVQYymJ33EChRTk1xbxjdNWXP5yVbQIBKWaKYA?=
 =?us-ascii?Q?J7DrFMHHBOmq14JpCTbYywePS70UzBO8FL+Dc6LHxDkAra/XzxeNg7l0q7AL?=
 =?us-ascii?Q?udGeaaU+RMY/1Y8oe6a8dJpV1lOi6tv6vY948jjJIbggWK8ngAxF7zANRYWO?=
 =?us-ascii?Q?rRcj+H1W7zpDpC2rBrz9SpxibD3wVd+nccmayIP99BafWWVAxcpWGc86yaBD?=
 =?us-ascii?Q?i3hFXEJN8j89b/UyBh/IqI1kbXjsB7EI2KbYCOE7kdpOH3aYfAATCqnJ/Zz6?=
 =?us-ascii?Q?gKzxVrH8wOzsXFYhfGhOfu4rwBOQyXY6xhO+a7Ka82LFRwCWlGDBKRlFEsyE?=
 =?us-ascii?Q?R5BGpHDcNMQNubOLcdLBSLe6VubXyxSuKnrAQec86bdEqXXzySc8WEsqwpaf?=
 =?us-ascii?Q?xluhgguDxDKJ2Wy/5Cq7m5/6Py4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d6fc3a-eb34-4a08-91de-08d9c17cdaa7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 16:47:03.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOpGZ5LjMikGNb/X+2SoYv4VpSsh1F8BfuWkTi3SkP+v0WeLc6LcifKZy40fQlfjPVlcT2A9bDcL2nMzIWlw1qu2fvWPVLE8bqm5O147z3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3955
Received-SPF: pass client-ip=40.107.4.121;
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

Consider the case when the whole buffer is zero and end is unaligned.

If i <= tail, we return 1 and do one unaligned WRITE, RMW happens.

If i > tail, we do on aligned WRITE_ZERO (or skip if target is zeroed)
and again one unaligned WRITE, RMW happens.

Let's do better: don't fragment the whole-zero buffer and report it as
ZERO: in case of zeroed target we just do nothing and avoid RMW. If
target is not zeroes, one unaligned WRITE_ZERO should not be much worse
than one unaligned WRITE.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-img.c                 | 23 +++++++++++++++++++----
 tests/qemu-iotests/122.out |  8 ++------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index f036a1d428..d7ddfcc528 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1171,19 +1171,34 @@ static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
         }
     }
 
+    if (i == n) {
+        /*
+         * The whole buf is the same.
+         * No reason to split it into chunks, so return now.
+         */
+        *pnum = i;
+        return !is_zero;
+    }
+
     tail = (sector_num + i) & (alignment - 1);
     if (tail) {
         if (is_zero && i <= tail) {
-            /* treat unallocated areas which only consist
-             * of a small tail as allocated. */
+            /*
+             * For sure next sector after i is data, and it will rewrite this
+             * tail anyway due to RMW. So, let's just write data now.
+             */
             is_zero = false;
         }
         if (!is_zero) {
-            /* align up end offset of allocated areas. */
+            /* If possible, align up end offset of allocated areas. */
             i += alignment - tail;
             i = MIN(i, n);
         } else {
-            /* align down end offset of zero areas. */
+            /*
+             * For sure next sector after i is data, and it will rewrite this
+             * tail anyway due to RMW. Better is avoid RMW and write zeroes up
+             * to aligned bound.
+             */
             i -= tail;
         }
     }
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index 69b8e8b803..e18766e167 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -201,9 +201,7 @@ convert -S 4k
 { "start": 8192, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 12288, "length": 4096, "depth": 0, "present": false, "zero": true, "data": false},
 { "start": 16384, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 20480, "length": 46080, "depth": 0, "present": false, "zero": true, "data": false},
-{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 20480, "length": 67088384, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 4k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
@@ -215,9 +213,7 @@ convert -c -S 4k
 
 convert -S 8k
 [{ "start": 0, "length": 24576, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 24576, "length": 41984, "depth": 0, "present": false, "zero": true, "data": false},
-{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 24576, "length": 67084288, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 8k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
-- 
2.31.1


