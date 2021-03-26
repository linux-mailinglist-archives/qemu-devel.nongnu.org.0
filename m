Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E034B0F0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 21:55:54 +0100 (CET)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtUn-00005S-NE
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 16:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPse8-0000hE-5l; Fri, 26 Mar 2021 16:01:30 -0400
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:54454 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPse2-0006Yw-Ou; Fri, 26 Mar 2021 16:01:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOuM2ulre/DctLfeOCdlDQKzyZemUxqQruB8GQbQBboQaYKZbIE2l7IWOqtTDuDitjUvj4eXHPlQjy79d+usiEhGCEzcucJA83IHqgpr6ll3ww/NNbUDI4FS4V1+gnuZP0D9rZkr4UAUb6s16AzQbWgoegjE4sjHk4n/X+ZGfbale2TJB908oTXLfPnNc/1E+WpMeonVAqXRQkphOaUWhXbigkdzMIfsL7ggcIkHQlN87+nyBhkRrSysUsNXpQsxa0zKlf8+NuhAS3fL/aiB2MiqysKZWqvbnayURRNfcUz30/tPwgT78H5yKROjSELeAsroujeYAro8PyZYkjJVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8nutQesDe9eA/HMXAa+hRoGEk58wVXnWzmdLiomi6k=;
 b=DpV1a+1PkpQAGReb5eR6qzBN6sCkMCRnbNAEU5M7cyiKVVZ+eGUs+wz6RuQhofv3/d13PumOkHTtB6UqnKDn2ejSGOdRYqLOQJqtm+fhQxCJ88a6FxKHdXc7mHC3U3IbbhjBVh48dBzzgif+h7HdXFxYhE4rIvP0TNmh8UZX9DspxLaKBvoV203O140uiSAmRtUts81wbofCMBYDgVvhlTuDIQJI7xcJs0W2UK9/uaTwYpgRWCgceAP0dbN0gEZKgEJKql3urO5W4uxfFfprLqhTSQcXEUZ/enBwjoKuLQQf+74FUbcJQqbay8Po6i74wvB/HqXXIUUkX6o0R1zTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8nutQesDe9eA/HMXAa+hRoGEk58wVXnWzmdLiomi6k=;
 b=BoRhcNGGHe24DyZE9Z4F+gxPxm/9PqmwkIoBudSjm2aOSoUZXKLmXyAxl77elKRWAnWsndWSxl1EjpY07C8SEtX2/QGTsGnKL5oO9XMZCMWyl0lAV10SzyJL52oWcUzx8yg7C7E8CRbk/WPmIQsRBlFTaS0bQtW5GGKhAKCssws=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 20:01:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 20:01:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v5 6/6] qcow2: do not discard host clusters during in-flight
 writes
Date: Fri, 26 Mar 2021 23:00:45 +0300
Message-Id: <20210326200045.363290-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210326200045.363290-1-vsementsov@virtuozzo.com>
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0166.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0166.eurprd05.prod.outlook.com (2603:10a6:3:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 20:01:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8589224e-b10a-4f44-e577-08d8f091e5a6
X-MS-TrafficTypeDiagnostic: AS8PR08MB5877:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB58770ACCBBB07626A470FA2FC1619@AS8PR08MB5877.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HaKQ/EVKMaQRzsQYS9TfClQsZGQnSOPcu6XJ+c/nK84/Tsh93mtasOhXHAblj3/AQqorCSq5wv7xegGqLhUEKPkJtNiC0rY/sCxJEm0670lQROcH1FYXrr8vKxaN6lVGgS80oHUxPA9GoutgvytwqWy44+7yiYtIKnx+L3wWuF9g5N3wMZ/bYf2Hl3ufLJrqc5XPVd0nRsOikBfJXlhg0KhRyrDJpyCh/a/ZatombJcMIsDEwa9uDP1m6oaaTBvKne5LnUCnNgu/vY5AC9OxjeoQZsy6oA+gY5TM1DPpUzWW2qBYtEZ0zDDhNdeNnNl5eoU+x1HhZUKuZBsJHmj9Z5UsiBRGp8cMWSe0mnvkxnvKmzoB0s6PHpQ1BMnzYqZW8pITaiPxWziiUMyznAaqwAE62ZKPJny+DfLBhMxSlxzQV24BXnCZKrmk4/kR98mJyrxtxUFdfFmU1rcPygd98Pe9likCRYDHgVD29+Ebkji68ptM1bqL0RuOWeIr83+OvoPteLNBPwsL9UQa1/r+mGSCv0+AD2ax7+5JDYi277uqId1GTqdBTQTCeDzo0meCh6cYbk0TNmwPrUdxNzLcI7LQMSxQIuHWjt+uniX1Wn0BnHELctIyDW+v1yreyvLB3WpqNkRsPZGWvbDoO96i2sMlv0vMV1HQjOEm3AMd1AxC+NIdb8M5Uk2FbLD33EID
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(376002)(136003)(396003)(1076003)(316002)(6486002)(52116002)(36756003)(6916009)(86362001)(8936002)(956004)(107886003)(5660300002)(2616005)(4326008)(26005)(16526019)(186003)(83380400001)(38100700001)(6506007)(6666004)(69590400012)(478600001)(66946007)(2906002)(66556008)(66476007)(8676002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rlX9B5udantUnfch3wHXtyvCeCgxYAli48jBxUaZnEwyQxQaI087/6i+ZDeO?=
 =?us-ascii?Q?+5ZQs39das2wgzdUYOWkLtNu/ZESrzxGYWQCWFcgyiDEL5dy7J0WOpYFKAHA?=
 =?us-ascii?Q?N+kOfN7EQqNJhQT3fiJuoM26h2bHV5ntQxZeXDcIA+14bsjg3kWGqNii4qa+?=
 =?us-ascii?Q?2InCKv0qut3k03X62IXzHBTavOd47aU2QbWzc4PuvFLHs7oiI8TC4p/CPqsH?=
 =?us-ascii?Q?xlLhXkECPWnUf9OpqtkJJAHCqmoKqIRdVAcqk7Xf5Tb6DW8m1kg17uhshx4+?=
 =?us-ascii?Q?+vaTd/7c6h/A2sVIivOTqrokWM/dHdMlqa4+ckYMApOW+rw9WCiVcqUoAB6E?=
 =?us-ascii?Q?rDvmSzOZZoaqgWaE9qGOzHeHdhpd2raaz9yQ1wtOJozrcv4jk8JCEmOIzDv+?=
 =?us-ascii?Q?o/ci0tuWHU5QCu7znzFrXsQLypmHGQxX1rE9E0AzKKW4CnqS0oV0safEX71V?=
 =?us-ascii?Q?dIW1ZsclxCVRM6SPlGvOsqNnvc5hVaIg1MOdWs+jlAOaFqjGOwXpc1oz7xRv?=
 =?us-ascii?Q?cCPpB14h4l95DuFb4BBkInXab7qgS9VrEaybS65Hw+JG2zd6cleprHJ3xXRY?=
 =?us-ascii?Q?AtrqDwYIUBhi5MoLNWW6ESYoEx0kAXBF6mXgga+OW0vu60eoEGAeo1Kb5T/c?=
 =?us-ascii?Q?RxU0BqxX70TXg+bhTvpH5MVJeN8hf/HJ05AsyZSthoAfSbasxAgnQlBxWdj9?=
 =?us-ascii?Q?AxprCFIgBWIjUZ+Rjai0wQ86VvRE1NlD7kmopGsJftmfSj1u8WJ/YCp+vGie?=
 =?us-ascii?Q?slUaRwmx3xqHbw7o7hSYMPFhn48izZBemOZnQzl4NoM8DTO1NPDRu8nCmXuA?=
 =?us-ascii?Q?5vZJfPQUYFMR06z+oZae+c8liuGsc3+CYAa2pkXZ/amCxFHQLJToB2oAtGak?=
 =?us-ascii?Q?n6uXTZG2RsuzGeysGo5PKwVjPdI3uIm6OYSWFr1a8O52EaRQr3ChtVoqbShE?=
 =?us-ascii?Q?+DFtYvB++O/qK4obIOMg6Bn5pxTDFWKt5akTzqE1kJOK9xPjcw/0lpvPAlWH?=
 =?us-ascii?Q?+XbedRvn4PHVHYP2ul+jOCCfk2Ot1WpwV6ePNVs4aBko6cKk9QT6wsxGdG7v?=
 =?us-ascii?Q?ZrzZQXiA0uKruKxbUCmLf9Tg3S2I7hKApw7ItklTHPAhfyL9ajLzFHzwP2xT?=
 =?us-ascii?Q?9sQoQpiCfwEG4CfzGUaLx0GN9e3P9tKBWFXH3wD73kacJJ/3zD/0oA+RSLiA?=
 =?us-ascii?Q?wW3OAUeD4phBW+TruPHGzgkX5lgp5g9tTQumK4nFn1odomrsfF18IzOPq2/o?=
 =?us-ascii?Q?W5lrX578aJ4oGw12aPgPwQP/4BxzDLuJc+ofyJEHYparpevr85x0fKDIhEVo?=
 =?us-ascii?Q?TqZ6ulxjGAToXQNdzgO34sTI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8589224e-b10a-4f44-e577-08d8f091e5a6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 20:01:08.8292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pH+jkZ83ZvtN4tjiJ9S2r84ZYixbFR6379Y+LSsFehhQCd/VdugIIDYrl7BTTSns0qrzQ77Nerk3TUi87k0P5dKtR+SWgsd5X6Q4OKkz908=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877
Received-SPF: pass client-ip=40.107.21.133;
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

Finally, after all the preparations, when we have the whole
infrastructure of inflight-write-counters prepared in previous commits,
let's fix the following bug:

1. Start write to qcow2. Assume guest cluster G and corresponding host
   cluster is H.

2. The write requests come to the point of data writing to .file. The
   write to .file is started and qcow2 mutex is unlocked.

3. At this time refcount of H becomes 0. For example, it may be due to
   discard operation on qcow2 node, or rewriting compressed data by
   normal write, or some operation with snapshots..

4. Next, some operations occurs and leads to allocation of H for some
   other needs: it may be another write-to-qcow2-node operation, or
   allocation of L2 table or some other data or metadata cluster
   allocation.

5. So, at this point H is used for something other. Assume, L2 table is
   written into H.

6. And now, our write from [2] finishes. And pollutes L2 table in H.
   That's a bug.

To fix the bug we now have inflight-write-counters, which work in a
way that cluster is not "free" (and therefore will not be reused
and we don't fall into use-after-free described above) until both
refcount and inflight-writes-counter are zero for this cluster.

So, we have the only remaining action: actually call
qcow2_inflight_writes_inc() and qcow2_inflight_writes_dec() in
corresponding places.

Note: both functions don't rely on s->lock being held or not. But we
should call qcow2_inflight_writes_inc() in the same s->lock critical
section where we allocated host cluster (or get an offset of existing
cluster from metadata). Otherwise we risk that discard will interrupt
at s->lock unlocking (it should only schedule other coroutines to be
entered on next our yield, but let's be absolutely safe).

Iotest qcow2-discard-during-rewrite is enabled, as it works now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c                                 | 21 ++++++++++++++++++-
 .../tests/qcow2-discard-during-rewrite        |  2 +-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 0a5bd4ea4e..d021c9d3ac 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2550,6 +2550,9 @@ out_unlocked:
 
 out_locked:
     qcow2_handle_l2meta(bs, &l2meta, false);
+
+    qcow2_inflight_writes_dec(bs, host_offset, bytes);
+
     qemu_co_mutex_unlock(&s->lock);
 
     qemu_vfree(crypt_buf);
@@ -2609,6 +2612,8 @@ static coroutine_fn int qcow2_co_pwritev_part(
             goto out_locked;
         }
 
+        qcow2_inflight_writes_inc(bs, host_offset, cur_bytes);
+
         qemu_co_mutex_unlock(&s->lock);
 
         if (!aio && cur_bytes != bytes) {
@@ -4099,10 +4104,17 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
             goto fail;
         }
 
+        qcow2_inflight_writes_inc(bs, host_offset, cur_bytes);
+
         qemu_co_mutex_unlock(&s->lock);
+
         ret = bdrv_co_copy_range_to(src, src_offset, s->data_file, host_offset,
                                     cur_bytes, read_flags, write_flags);
+
         qemu_co_mutex_lock(&s->lock);
+
+        qcow2_inflight_writes_dec(bs, host_offset, cur_bytes);
+
         if (ret < 0) {
             goto fail;
         }
@@ -4538,13 +4550,20 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
     }
 
     ret = qcow2_pre_write_overlap_check(bs, 0, cluster_offset, out_len, true);
-    qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
+        qemu_co_mutex_unlock(&s->lock);
         goto fail;
     }
 
+    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
+
+    qemu_co_mutex_unlock(&s->lock);
+
     BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
     ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+
+    qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
+
     if (ret < 0) {
         goto fail;
     }
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
index 7f0d8a107a..2e2e0d2cb0 100755
--- a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# group: quick disabled
+# group: quick
 #
 # Test discarding (and reusing) host cluster during writing data to it.
 #
-- 
2.29.2


