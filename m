Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC42D7F37
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:14:20 +0100 (CET)
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnrv-0003Ym-6g
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLM-0006yh-Dy; Fri, 11 Dec 2020 13:40:40 -0500
Received: from mail-eopbgr70129.outbound.protection.outlook.com
 ([40.107.7.129]:29411 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLH-0008CX-4f; Fri, 11 Dec 2020 13:40:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdz5ow0gD90jsWUGEsDsFIgLswgY+NZaZ9uwd+0Qu+fjD5BljgKPOzpSTD4fk/0b5tLJZrNLm9svDoTJSaj5hXF0M6DaIJdn2dWfNwufYz/lfUcNV9Q0B9NeIA2b9MK2R7TcRoZqNoVboaCVZM+TQN+IVKmEP6A3JU8xTx7pcqv8BBEXIiv/GzOu8IkSu5qJY9bsRoaceN3wuAgvRZUm+P/Mfz8Zc5QnH6qGvVVMUIrWRg15HBioEDAKNCo7Uw9Bi3EA2e11teaEF8dtqUi9SogomYDeeORCYypSFGfOaPDPMKJUZYe0S7/R8lIHgVA+MqGNXVCFwi0ugRCkaGQdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTSfc+E8g2/NKFqqZDnmTcVdcIFBezSaCL0qjDWN8ow=;
 b=adJv4TKpOdZM5GHsuNVcj+IqCHCgz924hLvqLE7VkCP7F+v91kHQqs47/4vc3wKxIaK15fJ/PJNHsIK0xI+0LL8sxLcaHdfSJsgdTEySMEBvUfhO7U08PWzKCH8gkN67XqtOVcpy8rjPyP80LlduPTcwU1lkKVoI2eSWMMVIexKWFRmX9unbvzyIRrVlAPZAUGwIYnlDKy4VzcMseg3oa2MPQiyFi359W6RmQxEI1QJUDrvtd+S9SxOQN2gU0DgTk4dCRNT383ExEdzOputi6oyb8jj7fQ7PTnbhZT2G3vU4OK61BE0dthbIAS19If6QHau0JDnz5zo3VEhtpag8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTSfc+E8g2/NKFqqZDnmTcVdcIFBezSaCL0qjDWN8ow=;
 b=UJLRXCGnKUe1xk26mxZcq2aBHCYXPjJfE3eijm3agR3J7eNUt4eL66f29qDnS88SVSsaKEbD/b01vD+Fg2wY3b8/A9qnxlPr4kcpP4M7ebBlcLZ+woQ6qbenQ9DCkN2FDs+eWr67zT46vnu2oIPZc4iigq7XrmNsrJasa9iFXlg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:59 +0000
To: qemu-block@nongnu.org
Subject: [PATCH v4 14/16] block/io: support int64_t bytes in bdrv_co_p{read,
 write}v_part()
Date: Fri, 11 Dec 2020 21:39:32 +0300
Message-Id: <20201211183934.169161-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366bedbe-2017-4876-ab8a-08d89e0429ea
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB49152B4D8434D6F18DA5A605C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lH6ZzusVT8RBfhsz/C+gCW/O0rlJ5yRrUCNU3Tmyk1w63Mcvfph4tpmJPQD9eK1zkb++jDmiw0xQeFC2U/A/yYp5lusUvpzhSE75I4/Kcwoom2n21j7dKcBIq/IY3JlsA2EqpwzOfFeRSBDrrKDojUIGpo0as9eaalmOOE/8HA8fO4DvVbsZ+e+fAHxl9CnxLyao2wCb8MbV2+OccNbdDp3oq6HgL5ifJYIDSHZMl2pSQCPeb7U/E5v6UsEHFkuzmz5PcpRnThodFocPJnwJZIipgmtlqfoVz9sl1TIvnJjHlQGJ8m0k6o4CrpeX+O/c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+yGTTswj25ytM2tzA0zrXa8xUiwZ5FYB3dqOeWREe5128Oi5DSYSX2Kat7Sp?=
 =?us-ascii?Q?xBcgyYuOVKg2NugtaWaOTctww1ZjKfFOYZfqBXB71h70JOQxrvnW+ORmUU6+?=
 =?us-ascii?Q?khR9GxCMdFtOZISbZrgYT+qiWIOfpnpooyMqM452ESXpvKPBrXqTA8p3Xu0B?=
 =?us-ascii?Q?SvcYq/jQ34Bj+mg5Xdi33SMHXUrrme7MC7GygeqriU+q/DbG41O3Nm3Jmj+V?=
 =?us-ascii?Q?NAdVWwmBudXdRyemh3IslfZPoi9DfHg/2avvsYqN4a83DdOWmHeD6nhgbAYz?=
 =?us-ascii?Q?DlTsu/08ZUOa66WnVEjUdYM6fiZybYg+uUuhXCRIs0z9p4wZDIE3bnpOFHrE?=
 =?us-ascii?Q?3Rcvk+AHwQY/Hw+Y/KZdrb7HNrTqALwlyHxBjX3IO6rAeeXM76n2BV8xJoLS?=
 =?us-ascii?Q?GZI4dxnnJcZRzqtXSPVj46ehNU0lLCpU3Cprut0h1Z837FSpWPZIgDWg+TyP?=
 =?us-ascii?Q?UPRqJyD8WrWUN17N9IfTThNT5VrYmPkI3x81NxwxFALp3Be9Poj181t2s91G?=
 =?us-ascii?Q?UBId03dcWMkLbbIe9J+Idlpuqke91anakNyLurNzqZNsfrITLVgZiv1JfJXD?=
 =?us-ascii?Q?KjSv+sy9+hX3vG/wXde7baMRGi+gkPljkOtuYEKZf3FlerutxXfUriasBl6R?=
 =?us-ascii?Q?lPfQ62gL9MDv7po77ZPW2xPGp1IWldjQlHUXypA63KBlaaSIkyiwJ3SHVJtq?=
 =?us-ascii?Q?JXu56mQoVFlDvtBTJFVzKUihMZBWnuC2aEmpyBqV3rUzRl7Zt8tA8TrT/9ws?=
 =?us-ascii?Q?XnnNAJNuLhmr9U0xDc3Rx0B5sH5NNc2XwQ6H+HzcvHVVgxHexG+L0NWRDYEY?=
 =?us-ascii?Q?qj4YtdzxTe/I3wZtPFJP8N/HPeoYjEsURMzKvKVHbbtOxGQlWZjZbJHIVsG5?=
 =?us-ascii?Q?w7ncRetuqPQ09C440tYJtoqYgLIUxMPvwtIUf6eSrYpkRtOz9SVUQy0Nx3fi?=
 =?us-ascii?Q?VHmc5vZKW1giGKOnTRjxilpNy3VGOc0Wuhlq+CDPF5x1zeOGo1wRQYyZJKQJ?=
 =?us-ascii?Q?gKIJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:59.2620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 366bedbe-2017-4876-ab8a-08d89e0429ea
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0pv7wSERpavysGjS9oYKq0ZBMVjttjZbWwfsr9wa705KUji6yriuW/pCtNA08fJrQ9qNb/5LqtDtgGVt1n8G3MxrA8fQllQCDyGxogcRo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.129;
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, prepare bdrv_co_preadv_part() and bdrv_co_pwritev_part() and their
remaining dependencies now.

bdrv_pad_request() is updated simultaneously, as pointer to bytes passed
to it both from bdrv_co_pwritev_part() and bdrv_co_preadv_part().

So, all callers of bdrv_pad_request() are updated to pass 64bit bytes.
bdrv_pad_request() is already good for 64bit requests, add
corresponding assertion.

Look at bdrv_co_preadv_part() and bdrv_co_pwritev_part().
Type is widening, so callers are safe. Let's look inside the functions.

In bdrv_co_preadv_part() and bdrv_aligned_pwritev() we only pass bytes
to other already int64_t interfaces (and some obviously safe
calculations), it's OK.

In bdrv_co_do_zero_pwritev() aligned_bytes may become large now, still
it's passed to bdrv_aligned_pwritev which supports int64_t bytes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  4 ++--
 block/io.c                | 14 ++++++++------
 block/trace-events        |  4 ++--
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 04c1e5cb58..55b1039872 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1031,13 +1031,13 @@ int coroutine_fn bdrv_co_preadv(BdrvChild *child,
     int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes,
+    int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
     int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
 int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes,
+    int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
 
 static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
diff --git a/block/io.c b/block/io.c
index 93a89a56e3..5200658224 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1697,11 +1697,13 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
  */
 static int bdrv_pad_request(BlockDriverState *bs,
                             QEMUIOVector **qiov, size_t *qiov_offset,
-                            int64_t *offset, unsigned int *bytes,
+                            int64_t *offset, int64_t *bytes,
                             BdrvRequestPadding *pad, bool *padded)
 {
     int ret;
 
+    bdrv_check_qiov_request(*offset, *bytes, *qiov, *qiov_offset, &error_abort);
+
     if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
         if (padded) {
             *padded = false;
@@ -1736,7 +1738,7 @@ int coroutine_fn bdrv_co_preadv(BdrvChild *child,
 }
 
 int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes,
+    int64_t offset, int64_t bytes,
     QEMUIOVector *qiov, size_t qiov_offset,
     BdrvRequestFlags flags)
 {
@@ -1745,7 +1747,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     BdrvRequestPadding pad;
     int ret;
 
-    trace_bdrv_co_preadv(bs, offset, bytes, flags);
+    trace_bdrv_co_preadv_part(bs, offset, bytes, flags);
 
     if (!bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
@@ -2089,7 +2091,7 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
 
 static int coroutine_fn bdrv_co_do_zero_pwritev(BdrvChild *child,
                                                 int64_t offset,
-                                                unsigned int bytes,
+                                                int64_t bytes,
                                                 BdrvRequestFlags flags,
                                                 BdrvTrackedRequest *req)
 {
@@ -2163,7 +2165,7 @@ int coroutine_fn bdrv_co_pwritev(BdrvChild *child,
 }
 
 int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
-    int64_t offset, unsigned int bytes, QEMUIOVector *qiov, size_t qiov_offset,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset,
     BdrvRequestFlags flags)
 {
     BlockDriverState *bs = child->bs;
@@ -2173,7 +2175,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     int ret;
     bool padded = false;
 
-    trace_bdrv_co_pwritev(child->bs, offset, bytes, flags);
+    trace_bdrv_co_pwritev_part(child->bs, offset, bytes, flags);
 
     if (!bdrv_is_inserted(bs)) {
         return -ENOMEDIUM;
diff --git a/block/trace-events b/block/trace-events
index a5f6ffb7da..91a0f70575 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -11,8 +11,8 @@ blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 
 # io.c
-bdrv_co_preadv(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
-bdrv_co_pwritev(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
+bdrv_co_preadv_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
+bdrv_co_pwritev_part(void *bs, int64_t offset, int64_t bytes, unsigned int flags) "bs %p offset %" PRId64 " bytes %" PRId64 " flags 0x%x"
 bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int count, int flags) "bs %p offset %"PRId64" count %d flags 0x%x"
 bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
 bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
-- 
2.25.4


