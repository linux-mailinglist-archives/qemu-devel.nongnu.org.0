Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656303F5BFD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:23:47 +0200 (CEST)
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITas-0005L2-8S
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITTA-0002oD-PQ; Tue, 24 Aug 2021 06:15:48 -0400
Received: from mail-am6eur05on2091.outbound.protection.outlook.com
 ([40.107.22.91]:59744 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mITT8-00055n-Fw; Tue, 24 Aug 2021 06:15:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/CPy2xE1HHCtYUk3FWrJNjexIUH/gXN9aalZO6kvlf8cbBkibPwTLx0I9fLm8rmuZuklCAcpGbeqguLNM1KV5YuoZG5HVnHRk3IXqmL0ZVqfAt5zb3PwSWiunlqKezJTHnXvWrnpVmRiQUSYXBLT3qOxcHC6OJRWREBil6ET3hHpNTRuXeHwO2iiuQpuEPglWkHtVXyi3ZdiqceWHsFmL42PodRaHy4pGVcylyf4/W+Xfdkn//7zp06qpkCJZST8tEMcQK66wOTBO+O/hS6NC+PBTo3bEwjUmGYSr2bUIgU6Xp0kUd7pGu+UW+CRBRt8ZEliaeGI9OiipsVlR+iaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXcNwm+eMUS1pPN8JsAiHf+F+pcIAIM+ARCw8vz4nOk=;
 b=O2v9iNMEveZ+cei80n0TGTemEvhZQ/bcYf5Yq00mKBW/aswFAy/vB9SFq8P43/sDqSl6Ui0ckZNXNSaocZ3YnSJBk1z8OMctufzqbVMyzMG89MtQmtHiBH6Y7DNY6IYu4dUogginfi0w1z5IvPK9e2GHFn4u/MOSMsV8JjcINottOI2x9nFEbClPrc07dwOjwNhHRP5oQdEmyAqKUMmLaCvyw3e7w8DJC2BL0LqYbKt71rcWthQEQoN+36j2UMYuyCGd5QzSpL74x7tp7F0Y/BoVYY2vlKyXvYzTX/VtApifLtruYP3qXM7tR5vUnz0qEo0brt/jVWA0tX5teGci8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXcNwm+eMUS1pPN8JsAiHf+F+pcIAIM+ARCw8vz4nOk=;
 b=P+zIZki5tsoxA7h0aWVDu2961pG8DTLoDA8f3c002Ia86qN0ZlDAudTxShHzw9MtjsRlGZwHdZVN3IZiyub0818Gu+pjVlzqf+DiJ9mtI6ei0hae3IPoZPokWcSeAKGIokaBUZziU6c38t2It52PnWtiZYLU5RfVNnTtDp/kM2Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 10:15:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 10:15:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH v2 3/3] qcow2: handle_dependencies(): relax conflict detection
Date: Tue, 24 Aug 2021 13:15:17 +0300
Message-Id: <20210824101517.59802-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824101517.59802-1-vsementsov@virtuozzo.com>
References: <20210824101517.59802-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0102CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:7:7d::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 10:15:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8a656e-a7e5-4a98-32cd-08d966e81c34
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB209975102E1CAAD35E5C317BC1C59@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6cZ2+WyaNdL8gwjSfAVrrSa3qRCWIOmh5xnonFfM5ssiHeV00r2M4XI8owF5f3KLg6hMqr3MAlob7iI32uVGEdS8FFPZBo7i6tcre2cwg2cj2oSQOEWKajIKWqYCari8Ttjd5LzzC0mDC4GDU9grdomrBe4hRJWKcdo3BtdBtIyT/IEdcsnHYA6dHV6Xh9gpj4o1HumdryoKk/8raii185nu3l7vyjjMfCPktuno4Z0JlXmptc8fQc5pbO5HRawz0ZonOl6jnwpbdVmM5wbFwbAjnP7IUK6Q4IduCN+9Xi88SV6Eh5kjDNU9ucbPSO5ySZnjxTeXVWdifTgxMpLQNW+NknQEFjJ+GtV0l2ePjsIxqgBao9ludGAXwn+U6PT9lJ9b5l9MZTvXVVZ403JhZI4cdOz2F9xBBj1xIWGKALgp1aOUHWaJ6Njh2XWTLAXX9z7LRC0uZZKazvJg2QQc0zTwnDjs2nFcN9Olii1KKw8/rje+X/ULXl5Vc5cUdZgPf7FiQLEJBjG4O8W6+FZIxnB+6LF9HWccMqihCLUNRCW7wUrzNDvE6V7kLOqudpbr/1qX7MMlRrlxCCeIL1RAtv9aiSrMXPwna2hKAD2ajJicdCnaG80R8LemS+RDjIr8w+ssh+iLzhenqkoFSyqa1KktN4vQFmkNGfkUcm+Nk4LHvyMkpeREKshrZa50/XhCD5mgi/hNc/hTj1mi8+ZVODFPbIKQRvG7AAzVfm5x0wA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(956004)(26005)(5660300002)(8676002)(2906002)(186003)(4326008)(6916009)(1076003)(83380400001)(2616005)(478600001)(6666004)(316002)(6506007)(38350700002)(38100700002)(6512007)(86362001)(6486002)(66946007)(52116002)(66476007)(66556008)(8936002)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHJhRmhzWS9IVWV5ZmU0dEdENklUZFN2bzF5cHNJQWUza25CY3lJTDQ4SjZp?=
 =?utf-8?B?M1BaaFg2aDd6WjFEaTZyOCtPSXE3aStWekpPL2NlUDIzRXFKNjh2NnFKcERq?=
 =?utf-8?B?S21QRTVrd0pCNnd6SzBCRkd3b1pBZjhiUWNydU5XTnhiK083T2dkQkF3YmhM?=
 =?utf-8?B?LzZkN3Ftby9KaG4vZTFSZU50U0Y5Yi9oeDZkai9xSXRVRTIreFBRSWIrQldT?=
 =?utf-8?B?Q1BBdDJZZ1hZaWx4MWtOYWtneWpZYkdVNUVzeHF2ZW5XRDNGUHZpRXZUeUlV?=
 =?utf-8?B?aHlsWGtxd3pCQjFWTjlDcWpWdmdUS0Y4ZXluU3U4OTVDQUVEdXBNcFZzZmtG?=
 =?utf-8?B?cWk1aEtDTHRvci95RzF5WlArYm16SzM2WGJ4NVlCeXdIUmNqVDFvT0ozRjBa?=
 =?utf-8?B?U08wVFAwNGJkMGtLR2dMUUQ0LzY3TnJRWnlxc0E0UlY1ZzliR0QyM0pMbEpV?=
 =?utf-8?B?ZEt0bHBlU1ZQOUk0WTgwR3ZOWE9CdkJQS3VnbjlVNWR0YXdPV1RpTVNteVpH?=
 =?utf-8?B?MU5DOCtrb25NTGZySmdVK3FFc2NtdncyL0llS2VXSVAzMVNOenRaRmh0QlVJ?=
 =?utf-8?B?SWVLem1GSkwrNmliYTBXSXdEczl0Zm45VVI3SEJyWWQrcDJJbG1iTzlZUU1o?=
 =?utf-8?B?QXByb1hmaldFMlR5d1o4NHJHd2t5WVhRcmhmdkkyWExiTmZYUGdHbHZRWlFI?=
 =?utf-8?B?K0pvKzBPRTgxa2JCVnFSYUJzc296dllzUWtocE1HRGtEMVptc2VBVDB4a1Zx?=
 =?utf-8?B?czV5VDljVjRYNjNVYWZtSVJrRVBZMW0wUUVmUmp3MDR5SmQ1eExFVFdGWHR6?=
 =?utf-8?B?Q3pGSnlnWTQraVgzdmxxeUlzRUh3TnA4VEU0ek9jcVBkNVI0Q1ZQZy9VcXdD?=
 =?utf-8?B?UkpJaXp2dm1ZMHRKZ01uVHV4dm8wL1ZVc0UxZDZtOHFEQ3dEYUp5L2RmYUw1?=
 =?utf-8?B?SFZzazFYZGJBc0NxazVuUVpDTy9sWUp4TkdrYlBTSlF0d2Z2UXZFMHdBS2g3?=
 =?utf-8?B?a2FRMlkzRWhyWk1ZQitwZlhMZWJaTVdoRXZtSUY3OFFRS2pMQ3puNnhibFRo?=
 =?utf-8?B?MDlVYmo2L2ZCNldLYklYV3lPR09vcDExcWU3WVlGbFdWeEJUUmFnSi9ncXNm?=
 =?utf-8?B?bHp6VWowNkdLUFFIM29qSkxkRVFOVGZ6ZGdaRUZ6WldnZEpJTlZ4VTlqdXNy?=
 =?utf-8?B?TFZwSGt3a20yaExlSCtHS3hLdGpZVGs2WVFrS1MvS2NZQS9tcU1MblBnRVBV?=
 =?utf-8?B?WjJ6Unpja21zdGJwOUVWRXB2M1dQVVFNNk40MFU2OFZxL3ordVhJckdicnI1?=
 =?utf-8?B?K2JKNzhvMEJEaWhpMHR0ZTlpcHhxdU1LWHdPMUlaMWtIU2Zlb3F3S09iNXdv?=
 =?utf-8?B?VGtkUnBZUVltc3NkQ3plN2M1K0tCeTg3ZzJGRjFhTzV2T3dFM3FrTGRhTkFJ?=
 =?utf-8?B?dThjeHdiejRFUWx0cWcwRk1BRlVPbjRtMXkvUVdCdHFJbVJCQ3ZsVUZxMFQz?=
 =?utf-8?B?QzkyWmpkcTRDUjdxWXNPOURJbGYrUFplRFl2Rno2NFdqa2hSUWM1UnZldllt?=
 =?utf-8?B?eE9xY0lWWE1JdlNmQmx4cXZTOGozNEt3WnRTa29kRlExQ3dBZEpXbEQ3LzRO?=
 =?utf-8?B?MHpPY0UwNEhXVFlIUnBrNWd4Y0UxYlVzWkx6NjZuZGZ4V3hlN2xOem9tTmxa?=
 =?utf-8?B?SEdxS1FNaDI5T2pEakVQM0tKYjQzN2dMOUZaK0lXQlBnWGY0SFprdDFSTVBy?=
 =?utf-8?Q?+NHS03qNJn2L7/GXZSpsrmsXX465UyWbPRendfd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8a656e-a7e5-4a98-32cd-08d966e81c34
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 10:15:34.2290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67Mmq1cAE6MTgnGgWYlZVhAJ3BDFfXN+bd4S0xfqYDBu5nZaD6dT0a9KLHeMnne9SxEfpGxbL9LxMGzgyd3PlJBo9nGQWWUXCE+gIB3nveI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.22.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
different subclusters of one cluster when the cluster itself is already
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
depend on first request anyway. Filter out second and third write
offsets to cover both possible outputs.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-cluster.c      | 11 +++++++++++
 tests/qemu-iotests/271     |  5 ++++-
 tests/qemu-iotests/271.out |  4 ++--
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 9917e5c28c..c1c43a891b 100644
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
index 599b849cc6..d9d391955e 100755
--- a/tests/qemu-iotests/271
+++ b/tests/qemu-iotests/271
@@ -893,7 +893,10 @@ EOF
 }
 
 _make_test_img -o extended_l2=on 1M
-_concurrent_io     | $QEMU_IO | _filter_qemu_io
+# Second an third writes in _concurrent_io() are independent and may finish in
+# different order. So, filter offset out to match both possible variants.
+_concurrent_io     | $QEMU_IO | _filter_qemu_io | \
+    $SED -e 's/\(20480\|40960\)/OFFSET/'
 _concurrent_verify | $QEMU_IO | _filter_qemu_io
 
 # success, all done
diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
index 81043ba4d7..5be780de76 100644
--- a/tests/qemu-iotests/271.out
+++ b/tests/qemu-iotests/271.out
@@ -719,8 +719,8 @@ blkdebug: Suspended request 'A'
 blkdebug: Resuming request 'A'
 wrote 2048/2048 bytes at offset 30720
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-wrote 2048/2048 bytes at offset 20480
+wrote 2048/2048 bytes at offset OFFSET
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-wrote 2048/2048 bytes at offset 40960
+wrote 2048/2048 bytes at offset OFFSET
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.29.2


