Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1323BA4FE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:21:16 +0200 (CEST)
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQb6-0007yU-1h
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQX6-0001O6-AE; Fri, 02 Jul 2021 17:17:08 -0400
Received: from mail-eopbgr60106.outbound.protection.outlook.com
 ([40.107.6.106]:49763 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lzQX4-0003iz-DK; Fri, 02 Jul 2021 17:17:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tm10mBlIrheUgQnEg7GkacU7QEUt0WKQlnVjO3H0f7qXAer9dsPzZSQyq6MlId2RdgHeu2LPpT2oiutJXZgAHbOiNuQT72zLo1uCzp6hIfsLfkDf/ff7GjH27xxl4WoJinh4RIERDA+dF1VS36lCOGDjNQEFu8CopBbVk1nQJ5TTe1LOduTvPF8GhzeRy51PE0oHo0idHIyyQi4XGEFM8N34d/j0Bgqom/yBZ1+Q1vYqVeE/hW39Tqql4TvE21nl11npZn0sojk3nS0nsA9sT7EbUWCzOyXZGHNpBtxV1QL2LN4VFh9qtELugSPutsDslTMsrlvQU26QIpRjypvHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnQ3MLb4m/IpmNDawoA5xHvgWSnjbQNXpj3z3re3Z+o=;
 b=LuF8IG5RAH1wzcZaux+mtX683WRTzPFXgt11YrtxIOg51acoYGI2x5VbvCu5Y2KzdwUNyh+P5d7O3hD6FvipPuFrdr+9eohpxAuREsEAMFfPRW/oKrJpm+QZ9eQfQ0SwP1P+jzgCBP95YrFjueIuOEfJsrawnQeT/TZAyBmRR/W2N35LxKbDqx4mppsE6FO6KCYu2gdgreKqHm1XMUU9dnnDGnUhmVNj936kbNCcnZPnvwmmXMD1wsOwKM3XY3mbDsOTXNjejJdh5oVTLExbtYXiblQ5ON7OgeHBpZPIcErKQ/YLlNgNQRdUq2uVl0iNP5IzfohRPK+Doc0r0Jrlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnQ3MLb4m/IpmNDawoA5xHvgWSnjbQNXpj3z3re3Z+o=;
 b=jdEHnZZt8V5ji9ZDyOXpVKtVEGYNBNen6Y7n1AJkSITvZfhCsWCncvraSe3uoL876L4zv8ZJOWvxyZPxB76+ZpOqCvKjIAsrlzhz8ylm3OvS6InaT3IndoaN5Ua5/5gwH+iXAkY46T0KACD0Ht3EdU9mOcFCJcU45jo5FNWOPzE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4691.eurprd08.prod.outlook.com (2603:10a6:20b:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 21:16:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 21:16:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, dem@openvz.org
Subject: [PATCH 3/3] block/mirror: fix active mirror dead-lock in
 mirror_wait_on_conflicts
Date: Sat,  3 Jul 2021 00:16:36 +0300
Message-Id: <20210702211636.228981-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702211636.228981-1-vsementsov@virtuozzo.com>
References: <20210702211636.228981-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR02CA0112.eurprd02.prod.outlook.com
 (2603:10a6:7:29::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:7:29::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 21:16:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24742fcc-b251-4019-757c-08d93d9eb821
X-MS-TrafficTypeDiagnostic: AM6PR08MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4691FE256A4975628A3B5256C11F9@AM6PR08MB4691.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 22+7hlfHGVsysDYygm5jDUnrMxnqoeivlbiK/ti13Yw4ZE5jt1Rulnzavx01CuAh8oqisReMJ3lnMjLYIGkoolwtP9vRbkv9f4VRkKmWmwdg0YGHgap7xB3tSo+IeBfmBFy/byyvG/Zyb/F6v+IZwEMtBl9bo83Ut9EvmXvQj7Jhi7NwtWoBaCPiPWvXGoVnYYLIjvrujI2LjFSjM2CEy/WfrCpEK235p+Oys801JPkOd+ScYnpMRIssxxprgTuqmLSGTQPQBgBqC3pVBPU/TL27aOvVq/x14FzXU/J/75LY5Pl9589k5hlNPVeOMfVQ6/9h5POS7o8spQjSniUoOVBEG+ultxSD8vTjhJaBk2ORYooMXlRyjBAxnNAJD0bBnUCsQUO50/AViz6YKReUJRmnq/FP0YIENreITVX0hBrfY0n9VUrJJIq3Fdb2krp8JVBqseTp9ST5tyPegZ3zj8d3LaS0KVP10U4ECmYi77ukqWj+/NOkh8ThpFe8Z5U8pYHd4G7qbUmguibOR8UAb5dJ4aoDBYitDrnF+SYiKO5ndSotqVG7MxOe/VgXRZ4FJ1lFJTNPG+Kct4j2OdO+tz+B70tibX+TzFkoQftjSUJt31SXX/PUa0s/0vynt0mXWWIDcr7urKtb3kogGffFI0Cw/3tSpSGjgZYgHQLoGvLr5AgqCAHUzYz3GIQ+zf9PVS69AVoWTxoiiPpkPR5d/qwYNG385pff726wsjuPGetmJogJuToTubzBf3Cl3JSF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39830400003)(376002)(346002)(1076003)(86362001)(316002)(2906002)(52116002)(4326008)(38350700002)(8676002)(66476007)(66556008)(5660300002)(38100700002)(66946007)(16526019)(956004)(6916009)(83380400001)(6666004)(107886003)(36756003)(6486002)(186003)(478600001)(26005)(6512007)(6506007)(2616005)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9/F1goRWEKPt80zvPfgmlhKVdbfQjCIhrOHAewxPedO8wvn+Cg6NJViwMwWo?=
 =?us-ascii?Q?gpKyXxPc0c5QIBvauCT12zYOySd433SP/oNer04jVGM6kbMfQ6xKSYajI6GC?=
 =?us-ascii?Q?Zl1dWroR/9zmVpbZst7RPnczh1WE1EYPG7QzHoNqIGe2hTJEWO6g+lcg+66r?=
 =?us-ascii?Q?yOQ7zHo0s6YYA4h9YrK0bLbEZnmOAL++SF2x8co7xqzfntdPj6NUKakb6AaR?=
 =?us-ascii?Q?lPz+BZ6/ywAu/TuBKwBGmYFCtIFKbry94P0NNedlhZ27WE8MuPk0LcTSnGcc?=
 =?us-ascii?Q?n+f/2OJAgBex5CRLMjCWhekc110ebqqETYO1YEv7xq2XI4NDC3SVaLBr6gC2?=
 =?us-ascii?Q?236yNdGsqZpqDyFqBncLmsvLWWWpm+hFgnpINwMFmSanW1imSeGvxITsLe7t?=
 =?us-ascii?Q?za0vq0csdZbNFVLXuPrG1Zhw7d8HGODeDhgUoR1sbS3tbgjiDopaTHZd/Gag?=
 =?us-ascii?Q?kUQB0aP/z1LFaMkr3sbAWgdWMslbfIBEh25ck6BZbciiC+uhgHbtwDVYmBtg?=
 =?us-ascii?Q?eQcevWd18dQlqaHLAEOEHym5oUlS1LkBL/gsDn2+pT+8KmBefBxBOZ8fiCCS?=
 =?us-ascii?Q?KljheoNYeSmxDtnyjgRa0w0IMlaMjw7tJ8/V4BQ/OIAqAbwVMGiSzcfqSrL0?=
 =?us-ascii?Q?Otkw6t1yS2B60TOcq0xfhJm2zQFciy+0SV3pypEB0gfRCE5RhMIgUsCQkP19?=
 =?us-ascii?Q?zd5pxCcbgle+paNzeRkKf5pybnWRhssfBBKiCXD4dLAmX/rlL6y3Xf1AHIWN?=
 =?us-ascii?Q?Sr95YNfSAebJ3THZ6l2N2LpE0mUxqofZYbyafPmyu5fI/RIiahBybJcyrlPX?=
 =?us-ascii?Q?UuuhHycSLAQEMqwtKq+Cz0UhitjinLUJUSWIH+Gx6MhPG5gCpkNNOw2kPncv?=
 =?us-ascii?Q?4BBmBEUBq67YMqEKoPksSvBi+JuhGmGgj3vMr31B+2fEKgiLd+gQ5LIe9Pl8?=
 =?us-ascii?Q?ojYt4WeNJp7fl3hEBEjmkgjTyRAKZzCf/TTY6GeEVwMfyz5oxENWJzA0+uO1?=
 =?us-ascii?Q?CpBZ82VinwezvF/qP8k34Axcs+h+OYixR0UdkPBl77QNb51WCKmdriUAvGzg?=
 =?us-ascii?Q?Qf4FufqXLOkUbDmjT1FEGRVZ2nhgc3lcPVX8IwYr75FlsLiP4nyT60CDdpBF?=
 =?us-ascii?Q?J7DcTEMVAXvwU3/ZcAA5vKh5wg50Rr8reVc6t9zmuwUKT0fLP1TFpKWF4DeI?=
 =?us-ascii?Q?gcCZ/skZIlA4ILo8rOVfkMcWjB8XhWNCmoVeIljP49h4rxqmGD50CXo9VhWB?=
 =?us-ascii?Q?3l6VY6yFhlfoc4yfmKfsQIznB8aVJB15dJ17q9JZQ67EnR7DVBPbuvaXss3C?=
 =?us-ascii?Q?SyIA47CzQRD6mbwvHBBE3lNi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24742fcc-b251-4019-757c-08d93d9eb821
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 21:16:55.5084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/RPOXvlZWM/0KcfASGmB0anEW3TR1AzwaLfpNzL8vBy4XZksqYDPF4icbYBSEAWAHuVk8doD50Z1EcJi5U2VxGMSZ2Py9duwa+g1Kf116A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4691
Received-SPF: pass client-ip=40.107.6.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It's possible that requests start to wait each other in
mirror_wait_on_conflicts(). To avoid it let's use same technique as in
block/io.c in bdrv_wait_serialising_requests_locked() /
bdrv_find_conflicting_request(): don't wait on intersecting request if
it is already waiting for some other request.

For details of the dead-lock look at testIntersectingActiveIO()
test-case which we actually fixing now.

Fixes: d06107ade0ce74dc39739bac80de84b51ec18546
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Note, that I failed to run the test on d06107ade0ce74d, that introduces
active mirror. But it seems that the problem should exit in it too, and
it's better to leave "Fixes:" tag than don't do it.

 block/mirror.c         | 12 ++++++++++++
 tests/qemu-iotests/151 | 18 +++++-------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index ad6aac2f95..98fc66eabf 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -107,6 +107,7 @@ struct MirrorOp {
     bool is_in_flight;
     CoQueue waiting_requests;
     Coroutine *co;
+    MirrorOp *waiting_for_op;
 
     QTAILQ_ENTRY(MirrorOp) next;
 };
@@ -159,7 +160,18 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
             if (ranges_overlap(self_start_chunk, self_nb_chunks,
                                op_start_chunk, op_nb_chunks))
             {
+                /*
+                 * If the operation is already (indirectly) waiting for us, or
+                 * will wait for us as soon as it wakes up, then just go on
+                 * (instead of producing a deadlock in the former case).
+                 */
+                if (op->waiting_for_op) {
+                    continue;
+                }
+
+                self->waiting_for_op = op;
                 qemu_co_queue_wait(&op->waiting_requests, NULL);
+                self->waiting_for_op = NULL;
                 break;
             }
         }
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index ab46c5e8ba..93d14193d0 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -143,10 +143,6 @@ class TestActiveMirror(iotests.QMPTestCase):
         self.potential_writes_in_flight = False
 
     def testIntersectingActiveIO(self):
-        # FIXME: test-case is dead-locking. To reproduce dead-lock just drop
-        # this return statement
-        return
-
         # Fill the source image
         result = self.vm.hmp_qemu_io('source', 'write -P 1 0 2M')
 
@@ -180,18 +176,14 @@ class TestActiveMirror(iotests.QMPTestCase):
 
         # Now we resumed 1, so 2 and 3 goes to the next iteration of while loop
         # in mirror_wait_on_conflicts(). They don't exit, as bitmap is dirty
-        # due to request 4. And they start to wait: 2 wait for 3, 3 wait for 2
-        # - DEAD LOCK.
-        # Note that it's important that we add request 4 at last: requests are
-        # appended to the list, so we are sure that 4 is last in the list, so 2
-        # and 3 now waits for each other, not for 4.
+        # due to request 4.
+        # In the past at that point 2 and 3 would wait for each other producing
+        # a dead-lock. Now this is fixed and they will wait for request 4.
 
         self.vm.hmp_qemu_io('source', 'resume B')
 
-        # Resuming 4 doesn't help, 2 and 3 already dead-locked
-        # To check the dead-lock run:
-        #    gdb -p $(pidof qemu-system-x86_64) -ex 'set $job=(MirrorBlockJob *)jobs.lh_first' -ex 'p *$job->ops_in_flight.tqh_first' -ex 'p *$job->ops_in_flight.tqh_first->next.tqe_next'
-        # You'll see two MirrorOp objects waiting on each other
+        # After resuming 4, one of 2 and 3 goes first and set in_flight_bitmap,
+        # so the other will wait for it.
 
         result = self.vm.qmp('block-job-set-speed', device='mirror', speed=0)
         self.assert_qmp(result, 'return', {})
-- 
2.29.2


