Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26B3D47F0
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:43:51 +0200 (CEST)
Received: from localhost ([::1]:56512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7HwU-0001Qb-Dp
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7HsC-000301-0j; Sat, 24 Jul 2021 09:39:24 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:24064 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m7HsA-0004Sk-7P; Sat, 24 Jul 2021 09:39:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAouD5uZmZcuLEY1KM/BivkbPLSU2E2azBrBExMJxICYE6CKQ+itNPzQcps6YBc768oukEEXp+ZWDUXlrXg9NPrBrJRFOVarj8cXj1IiBBMqHPb/TjA05ULHAthwe2Um3n7jHNtmetCxW2L3jH1yNrgkZ4dp1QC5uxXnFH1Jg7VZDwi+6qGdflxP2/ZH+lZikz4BcZoQBH9BE2sjJblxMaJddqDTNJVRAPwLrBABVmKdh0nWk4tr9SDy/VIzpci7dpy1Z6OemifxYkt9uiWwH8Sfqjv7hAWbxeX611iA++DQn7euw6BDY3mrVxHR10yUitorO1ccmjPlz4VIODbsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx7tSFNU37zRBwGzH6FG7HBMSlhLhlT4vMImllsBWNE=;
 b=ilq68ZqTbHZ7Ib3BImsl+88rhsVGO3FreBxOANyglcACtr/liu26MEXqedoJWbzNPK4/qjaApuAa5mwu6/Y3DXb4Y7nXHZQMRCsEeX+ndhc9+Cc4RvjykqncqcHqhRUbKMFyvkJ46xRdjLNmhThUUhmrXSq4CoHc8UWspSxRVPwhBWR6mGq+BqcAh87fx5NjzsRi+u4h0VADVcjT71X+sXhZlZCeJ66zbhBfAIDywsEZWxsnjE/RqRcxGtXSpzh2e6tSQFEr+/AAT0NNWSFzbN4xdpyJnIuFNUgPQM107KIP4hnXd3mGTFwGDCI3Jm/J7DgiPbM7+WpHBWrHDtEUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx7tSFNU37zRBwGzH6FG7HBMSlhLhlT4vMImllsBWNE=;
 b=rsEcS4nJvX11IRNWVNO6sufHhH9VW261HKDZgrLSDHkxegmvD++jMpc30DzZ4Bys5e+0J5odQ1J1oo2COm6rhyC9xbMREQdHBSxoigZdBzMFOgBMyFMNHJahM1ilRpkBZx0Y6k5pKAiRXtg0XcywGcNI940woEcWLXy7ZIHsekM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6805.eurprd08.prod.outlook.com (2603:10a6:20b:396::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Sat, 24 Jul
 2021 13:39:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 13:39:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 3/3] qcow2: handle_dependencies(): relax conflict detection
Date: Sat, 24 Jul 2021 16:38:46 +0300
Message-Id: <20210724133846.64614-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210724133846.64614-1-vsementsov@virtuozzo.com>
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR05CA0200.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0200.eurprd05.prod.outlook.com (2603:10a6:3:f9::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Sat, 24 Jul 2021 13:39:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b7a679-6617-4b04-eecb-08d94ea86b6b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6805788373CDDB381899BCF7C1E69@AS8PR08MB6805.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4w47YNTrM/ijM3R9fgXFST9IcYmaZiEFSG/jY6oUVlEVHf/zam01UT4KbY9QbzKNkoGoWltTDZgX8YwtKAYbrg4WpRk8wU/W0y2thc0a3sLJQgm0W9QHaSM5ws08+VKQRBhjq1XwnTXqH0cpliTHkG+7x+9yARja+arkqRpN/vq+DnIzdmMPVP/AL5Gw8IVcSdmZkPG2ZdIIbXujOu2haUasOdDvKY3aLPY/f72MHPzNnPVet3LI3/oyHgrZvlq/7W8eVTgNSSlM2K3kryPR/pe3hhywf5PdTm2w21Jq8IIuXY6TOKOqWvNRLY+uWDMHHVzbh0XH5tq7PJucrJoflGZfiSoE9Ki6YYsWocvGHgWiSIo/ZvySKvSERcjGjoBPPGyHY+FCyfozD6baJTETdKW69Chxo4KM+wsgyOEa18/UbFN94nejppw+QFI4XCC4lxhsZV4pwYmMrXhM3IuJWmf1ZaOXllqLm8NhXCofm8q1tK0ah48NbJ5wUH7Q9ThXM2S3JAtmQhy4Fct0uyQJwVSTtHOgSEOH4JUJcOo4BY+XHbI4SUziMimSmp8zylEVYrfnRt00KBZXr9sLPiGeXsaLY2sQpM2e+RJ1mw5Rh2dFwyZsO1EU6OVF7SFJ3KuUlmjYOvgOYoeuPRTcrd+rjfxeh0/8ve/GUvTPlfRnrMqSscydtYx/CxhmrEO9x0prWHL45TozrkW6n1gCGC9liJFusJFa00zrWxSwOMsHd9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(39830400003)(376002)(478600001)(186003)(6486002)(66946007)(8676002)(6506007)(5660300002)(956004)(2616005)(66556008)(8936002)(66476007)(6666004)(36756003)(2906002)(6512007)(6916009)(26005)(86362001)(4326008)(1076003)(316002)(52116002)(107886003)(83380400001)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V25LV2hqd1htakhwNUFHeDVJYVpHZHJ0cHZ2aGViemhUaE9TQkIwdXhPOGNk?=
 =?utf-8?B?VnhaOE1XSzhmbGREY210K1J0U05PcTdPQVNkOWFEbDloS25aVUZCcVZURjd3?=
 =?utf-8?B?T21Xa2IrTzlTdUF0b3Qremhwemppa3ZHK0VRVW03YThMd3dHMXp5alY5Qjc0?=
 =?utf-8?B?UEFLQTNualZqMnk3ZTM2U3hObHhyVzhqYk5uTlZjVHN3MldnM3AyMDNtN2F3?=
 =?utf-8?B?eE0veDZ6TDgrM3NPcXBHdzlXM2xGOWxoVmhNSDVRV2JMczNXTnpscU9VcjJB?=
 =?utf-8?B?UGRlYVF1cFhkdXZxUVFQTU5BSzhpeUQ5dVpERCtUMnJud254VWR6aUJvSVNO?=
 =?utf-8?B?WGpyYWdjL3Q5TEVTSm1nSmlLODhsdTdhTHkzcm5tS3YxUFBWaHJxcWRGN0Nx?=
 =?utf-8?B?OUpmQ1B4UGJaekZUdlpUY21hd1F6dDIxMTZKT3JPSUcrN3dUT000NmFFb2VB?=
 =?utf-8?B?ZWw4V0lnYzlqSWtDdUMrRzJuU05zOGNJaW91a1VLTnI1cTBSTlA1QStGOXJE?=
 =?utf-8?B?cGx0NVRGS2RkRVBMZnd1SU9oMFlmbmJ0TU45a0NYbmoxK1d3YkZneS9CL3Vr?=
 =?utf-8?B?MXVYRUV2d0hsbGhCWlkzc2F6SFhRNGVmY3BDQXRKNTJ1SzhJL2x1WnZRTUNn?=
 =?utf-8?B?NFcvaFNWd3hVam9EWStObHI4WjVONnBROWErS29TeXlFOVB3aXNqNlRkelFP?=
 =?utf-8?B?TjBQOWpjTGhPaHNoV1pYN2RsL2ZWSm0yUzJ3ZmYyZkNkcGlONk9QVS9WQXdB?=
 =?utf-8?B?RkhKTFZCeEdMb3BQM0Y3cjZka20rcGpreG40RU43cXVnaXB5QUkzMnBsK01F?=
 =?utf-8?B?UDZMMVgyZVVramJCRURnenNtVXhyY0Fab21PWDFZWktvbHo5cVF5c0xvWGpF?=
 =?utf-8?B?MDhDb016L0Z0YnVIZFlocEZab1dHOWhUY2RGaDRBaXBhT3c1YWdRRjRpNWdW?=
 =?utf-8?B?LzN4Rk9ZcVFGd3gzUlQ2S25xYksxRjVPcHo4cncwQjdjWndFWTJHVDZUTnlj?=
 =?utf-8?B?aXhNMmsvbDJIZVA2b1NNQzhENkNjeFdkc1FIVnZPK0xDYys1L0pnVENLUHhC?=
 =?utf-8?B?WXJtTkx2VUlDU0xmVE5OaWJLQnVjdHN4eThJbUt5YnFZQ0pXTGFLWHhzMjZI?=
 =?utf-8?B?cktnbkZYOWZSd2VTWEVnbWxLWGlSR3RXQTJSTVM0VTNFTGJsUHdyWnRPUUZX?=
 =?utf-8?B?M1Z1ak1Tc3d5Ymx5VW1rWmdlSmI1djFyMWFxUlI2NW9JYWNmd251TkV4d2w2?=
 =?utf-8?B?S0JCZm8xekRBWWp0SndBRyszOUhiVDNocVZmeFp0ZjN1dkhFSmpidHZjUGk2?=
 =?utf-8?B?dXdnLytrRGxFUS9DOHNySzFUNFRVTTVjZ0NKTFpIdVFyVVg3UGhLaVFRSEJ0?=
 =?utf-8?B?aG5WM25QRGIraURvM0JXc3Z5VUlkSUF5UkZTckhSUUVzVEVwR05oci85b0py?=
 =?utf-8?B?OTN3V09MbnVCRG8yNzJ5eGpxcis0eHhvM25RQ1pZRDZaZEJvT0ZpKytNbHNn?=
 =?utf-8?B?Y3pnSmthUWI3QWRLUnlLb3VZeDVJUEdnN2w5OXJ3UXJ0ZWRlcEpRcDZmaXI2?=
 =?utf-8?B?dTZTY2NXMEpyVkRmT21jdUhZQVlTQWUyeWwzdmZRelFaWnJSVnpNS2N5djll?=
 =?utf-8?B?QXNaRmZCZWwzYUFkM054cTFBbEFrdnN3L1hDZ3FlTnR0TkJXTVoyVVo0UEFO?=
 =?utf-8?B?WHRiSS9lTTE5dDVZZFZtZDBsano5MWtMMGNYcVFuYjhFQ3UzTVU4aFBDcWI1?=
 =?utf-8?Q?+vVpmdaYBJtSXFQGxdh2+XhiiJEi64wgVONptcz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b7a679-6617-4b04-eecb-08d94ea86b6b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 13:39:11.4657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsP1ekJatmAk3HvFVSuqhyib8E1ghDQ90mKtxz0r/RRyLq5dW1PT73cZSgt8UvO/GLXDwMx30GpU3u5QLp/5+sw1DyoQggommOMDFS6XgpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6805
Received-SPF: pass client-ip=40.107.21.132;
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

There is no conflict and no dependency if we have parallel writes to
different subclusters of one cluster when cluster itself is already
allocated. So, relax extra dependency.

Measure performance:
First, prepare build/qemu-img-old and build/qemu-img-new images.

cd scripts/simplebench
./img_bench_templater.py

Paste the following to stdin of running script:

qemu_img=../../build/qemu-img-{old|new}
$qemu_img create -f qcow2 -o extended_l2=on /ssd/x.qcow2 1G
$qemu_img bench -c 100000 -d 8 [-s 2K|-s 2K -o 512|-s $((1024*2+512))] \
        -w -t none -n /ssd/x.qcow2

The result:

All results are in seconds

------------------  ---------  ---------
                    old        new
-s 2K               6.7 ± 15%  6.2 ± 12%
                                 -7%
-s 2K -o 512        13 ± 3%    11 ± 5%
                                 -16%
-s $((1024*2+512))  9.5 ± 4%   8.4
                                 -12%
------------------  ---------  ---------

So small writes are more independent now and that helps to keep deeper
io queue which improves performance.

271 iotest output becomes racy for three allocation in one cluster.
Second and third writes may finish in different order. Second and
third requests don't depend on each other any more. Still they both
depend on first request anyway. Keep only one for consistent output.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-cluster.c      | 11 +++++++++++
 tests/qemu-iotests/271     |  4 +---
 tests/qemu-iotests/271.out |  2 --
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 967121c7e6..8f56de5516 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1403,6 +1403,17 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
             continue;
         }
 
+        if (old_alloc->keep_old_clusters &&
+            (end <= l2meta_cow_start(old_alloc) ||
+             start >= l2meta_cow_end(old_alloc)))
+        {
+            /*
+             * Clusters intersect but COW areas don't. And cluster itself is
+             * already allocated. So, there is no actual conflict.
+             */
+            continue;
+        }
+
         /* Conflict */
 
         if (start < old_start) {
diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
index 599b849cc6..939e88ee88 100755
--- a/tests/qemu-iotests/271
+++ b/tests/qemu-iotests/271
@@ -866,7 +866,7 @@ echo
 
 _concurrent_io()
 {
-# Allocate three subclusters in the same cluster.
+# Allocate two subclusters in the same cluster.
 # This works because handle_dependencies() checks whether the requests
 # allocate the same cluster, even if the COW regions don't overlap (in
 # this case they don't).
@@ -876,7 +876,6 @@ break write_aio A
 aio_write -P 10 30k 2k
 wait_break A
 aio_write -P 11 20k 2k
-aio_write -P 12 40k 2k
 resume A
 aio_flush
 EOF
@@ -888,7 +887,6 @@ cat <<EOF
 open -o driver=$IMGFMT $TEST_IMG
 read -q -P 10 30k 2k
 read -q -P 11 20k 2k
-read -q -P 12 40k 2k
 EOF
 }
 
diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
index 81043ba4d7..d94c8fe061 100644
--- a/tests/qemu-iotests/271.out
+++ b/tests/qemu-iotests/271.out
@@ -721,6 +721,4 @@ wrote 2048/2048 bytes at offset 30720
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 2048/2048 bytes at offset 20480
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-wrote 2048/2048 bytes at offset 40960
-2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.29.2


