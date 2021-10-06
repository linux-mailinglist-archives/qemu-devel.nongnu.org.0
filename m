Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDCD423F38
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:30:25 +0200 (CEST)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY704-0008Bv-Pr
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6o5-000580-Qd; Wed, 06 Oct 2021 09:18:02 -0400
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:17182 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mY6o3-0004EY-IX; Wed, 06 Oct 2021 09:18:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExA0PBOdsrS6au0vu8pE0eA1Sg4eHTT0VenCKwJyvWLClZnYlKEpVthtID9VtS56j9X9ocv9PQcYLoUQswyT0FbbR2kxZbMffL5V1jSNPbToEBzgDLW860W2J7syDzsXVRBwpjvgboYI0IYsXmiqqR0u2A/dKO/BnZQSTGEB+fovlVY+qESGffpfJKwlp1oEu3Jy1vOTP5oFghynuH5ut+fdCf30uDv+eonQ7z0oCqMJw0CJJFOpYli1LfKKe8DTG3bzV2jmgCGcTmomlQDgUucYhu6hLA+AGhSvhTJYks9yyz+gTaGoFHENCPPrXoQHK5gvx+/5ktnSS+qd+SjQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yMGPrKpfcEKPCeNoWjgcR8Eo0AlXE489gBQrg0NCiw=;
 b=nlvrVKyytPgZWWQCa4BljXEZVEF1bmAsoqdBbOQVsE1NbCADklweUE5caWWfb6wdLFSSs1E5PJAEAnnfLth1lMHd+YXDo0VZABGFsll1W0IDYX8EBdNb2sdgMewW+2rpVk1RBGfaOfkgXkFef4iHyRFlmuT3Hp44bFxf0hVj3hOW1vvJJwYAZg6x6zOYWEnWff0loAkvHkEJXXNMjA62M8ii4omPGqadyvzOGdGj0sA+3cH/Ge1UC9K9GUofUoAFAQzpFKkLGLKVaMZsICHq0uxqZ42gUV3RApgCfhlo+3Wv0ds7wJKsjNXzFifOt5CBnTgToHL/paenKfGXNMnZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yMGPrKpfcEKPCeNoWjgcR8Eo0AlXE489gBQrg0NCiw=;
 b=uhcggESxzBdgxfHN05j35rwZ3fGMRgOQwm8E9U/jW4FDzLYFJOTHpix/flS/iJrbUkMQ8p0mIFNPLYtjL+lBEMYpZ/jLmnJDy7Wkc6qN5LJWUn1uIdYVxV1MKqzR2OpM0BASjhHBaoj2bLOy+GkXUX5rJhY5O6QVCfbO6jD7DoY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 13:17:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 13:17:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, eblake@redhat.com,
 vsementsov@virtuozzo.com, stefanha@redhat.com
Subject: [PATCH 07/12] block-backend: drop blk_prw, use block-coroutine-wrapper
Date: Wed,  6 Oct 2021 15:17:13 +0200
Message-Id: <20211006131718.214235-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006131718.214235-1-vsementsov@virtuozzo.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0296.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0296.eurprd06.prod.outlook.com (2603:10a6:20b:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 13:17:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 184c0d98-f9c7-4711-49cd-08d988cba9ff
X-MS-TrafficTypeDiagnostic: AM6PR08MB2981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB2981595F3626E5FDBF6318ADC1B09@AM6PR08MB2981.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qsaJ4/NhM2KGvHL5IPpAu2JThw3/mEFKGRTVa1c0GwjMp2151f+wD4lpfT0cNUXVtCaojmX143aC5VWoD01FV/aoCE1IFk6ne2L0/9oWscY5jKoEKuTQBExtcLukJ/9nYs6fItP/WrioBQlpK5nbGj+8cNWxPgOJNSASRRl9eZV53D6FCNmyS76TkruvwzIQ/cSD1Vl0E+/YoQXtlfU/ldOmAEk/5p4lyLSIhEfLNJtBqmZzVIWoGYcKsxzPV1SJ0ZUc4CuVonHYWPrF5tE6i6+JQLbo65PhQb9RT3vHbAKxPfeBPFdysDNUzsbbyMaCRFIBl21j5UIyoesBfwALaQe0xVCQtUP8okWowx0dVLfWzBpNLmgdjo5TN9XGQ71SKe71/X2jev5bB8IOsCZn0GTeCqQPKstbW5GOen+tJr0Tb14pbbtbpOuhfELf2jl4pI91aipUSFRF5sUlpE4Ds3FQuFYEp7jyN/IWOZImMQIlakP7vqYC1nsdX0JVichkG0dnyrO6l8bPOfB92Z9+Q4WEqnddnzHFoepyHKZ2Rb+rJvBVzulBYbkb1knV3ia2a0PkMDkqd9IuJB3//dCfB/55PTPEGnRg/40ntOj6pVNLWcz76wSIv+YcC7vVDA3fQhcixntbSmY2mAbPu0G2pzdFO51g/KEM7rPcKU28naxpUP7vlyIBnxvvaxHtpfYKC1PiBr8UpvdlvzwsIcwxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2906002)(36756003)(6512007)(6666004)(83380400001)(38100700002)(38350700002)(1076003)(6486002)(508600001)(316002)(86362001)(6506007)(6916009)(26005)(52116002)(66556008)(66476007)(66946007)(5660300002)(186003)(8676002)(956004)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QjUm3u3MWdWACB+sVj6iFx0OBT+2FSrNxomU5OrSQ/ALFwEwoIbPjjzS6xnOCcyXe03/ez5oYSWnTau0Qv2VVz5uB/gI0mSAY211gHBlNkg+gHr4/77PiGgsaquEwv+5J06ww1uL/TqSrkH8zkOW9h2Jxn3SDruUr6hvJLszKRyPnKlPFmHqaO+9Q6nFNsXzUxTEbb0VWs6Dcr82qzQkWkCo4uGW1aXkzkrzXyyKDcpfypXhW2MkiF2Ty2JKPu/zfFwabSwzXvDkcY3dIKFofiFkJWs0ceSDZBeaIKnRxHTTzEUgDllmO459diXLyHeJQ4Hj5tDCMXdlJp/hVRkGQvPFBFUbKP/6JZXrQrfs6u2EPdastW4MqF6H1DgxXtZmiOAD76qb3l79FkD+VHgnUDfp2N4C2eSPjdvstX0kYW8plxsZxqABFrQdB8IjcH6GzhFNCtbK3RtLmNvHmHpvEyOUgVnJMbFp4Y3gWY4eNlRboUBoq8afQX4TwGLBtLqabLy4TtgvuPXrUaYhVgFD7ofmf9+D3IKSRnCvPCHkDnF0krlapug4WmytS93inXB7uTd9sQliOCVnUnpioDjeIRJqEha9I8XoMZpoBuJJQXFDMmd50jbUeucGgqPT9OhuBT8OTdwfq0pGxBM7o4MoeIu+s53RIKnxNs3MrUnuaf6ZH+2DFzS1gkOBxuSQuhk+Xs0gg3AuOGgzPWsWXxaetVzV+T5YwxydPGIoPJab7LqWZgMc6ku2D0lfeL84v0+t
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184c0d98-f9c7-4711-49cd-08d988cba9ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 13:17:36.3485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxfuUy+/8cp4KvpK4JDhZcNp1zbx1IlYvEyAfknZOR77mdcTTNX+rhiE0Itq12NjknCOuF6s1OPldVUo5jdHqfuPkajmi81k1QJ195fsNjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2981
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Let's drop hand maid coroutine wrappers and use coroutine wrapper
generation like in block/io.c.

Now, blk_foo() functions are written in same way as blk_co_foo() ones,
but wrap blk_do_foo() instead of blk_co_do_foo().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/coroutines.h    |  30 ++++++++
 block/block-backend.c | 155 ++++++++++++++++--------------------------
 2 files changed, 90 insertions(+), 95 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 35a6c49857..c8c14a29c8 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -75,4 +75,34 @@ int coroutine_fn
 nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
 
 
+int generated_co_wrapper
+blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
+              QEMUIOVector *qiov, BdrvRequestFlags flags);
+int coroutine_fn
+blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
+                 QEMUIOVector *qiov, BdrvRequestFlags flags);
+
+
+int generated_co_wrapper
+blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                    QEMUIOVector *qiov, size_t qiov_offset,
+                    BdrvRequestFlags flags);
+int coroutine_fn
+blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
+                       QEMUIOVector *qiov, size_t qiov_offset,
+                       BdrvRequestFlags flags);
+
+int generated_co_wrapper
+blk_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+int coroutine_fn
+blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
+
+int generated_co_wrapper
+blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+int coroutine_fn
+blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
+
+int generated_co_wrapper blk_do_flush(BlockBackend *blk);
+int coroutine_fn blk_co_do_flush(BlockBackend *blk);
+
 #endif /* BLOCK_COROUTINES_INT_H */
diff --git a/block/block-backend.c b/block/block-backend.c
index 8100d65b43..403cecea98 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -14,6 +14,7 @@
 #include "sysemu/block-backend.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/coroutines.h"
 #include "block/throttle-groups.h"
 #include "hw/qdev-core.h"
 #include "sysemu/blockdev.h"
@@ -1204,7 +1205,7 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
                  QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
@@ -1249,7 +1250,7 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags)
@@ -1306,6 +1307,20 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
     return blk_co_pwritev_part(blk, offset, bytes, qiov, 0, flags);
 }
 
+static int coroutine_fn blk_pwritev_part(BlockBackend *blk, int64_t offset,
+                                         int64_t bytes,
+                                         QEMUIOVector *qiov, size_t qiov_offset,
+                                         BdrvRequestFlags flags)
+{
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_pwritev_part(blk, offset, bytes, qiov, qiov_offset, flags);
+    blk_dec_in_flight(blk);
+
+    return ret;
+}
+
 typedef struct BlkRwCo {
     BlockBackend *blk;
     int64_t offset;
@@ -1314,58 +1329,11 @@ typedef struct BlkRwCo {
     BdrvRequestFlags flags;
 } BlkRwCo;
 
-static void blk_read_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, qiov->size,
-                                 qiov, rwco->flags);
-    aio_wait_kick();
-}
-
-static void blk_write_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_pwritev_part(rwco->blk, rwco->offset, qiov->size,
-                                       qiov, 0, rwco->flags);
-    aio_wait_kick();
-}
-
-static int blk_prw(BlockBackend *blk, int64_t offset, uint8_t *buf,
-                   int64_t bytes, CoroutineEntry co_entry,
-                   BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    BlkRwCo rwco = {
-        .blk    = blk,
-        .offset = offset,
-        .iobuf  = &qiov,
-        .flags  = flags,
-        .ret    = NOT_DONE,
-    };
-
-    blk_inc_in_flight(blk);
-    if (qemu_in_coroutine()) {
-        /* Fast-path if already in coroutine context */
-        co_entry(&rwco);
-    } else {
-        Coroutine *co = qemu_coroutine_create(co_entry, &rwco);
-        bdrv_coroutine_enter(blk_bs(blk), co);
-        BDRV_POLL_WHILE(blk_bs(blk), rwco.ret == NOT_DONE);
-    }
-    blk_dec_in_flight(blk);
-
-    return rwco.ret;
-}
-
 int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                       int bytes, BdrvRequestFlags flags)
 {
-    return blk_prw(blk, offset, NULL, bytes, blk_write_entry,
-                   flags | BDRV_REQ_ZERO_WRITE);
+    return blk_pwritev_part(blk, offset, bytes, NULL, 0,
+                            flags | BDRV_REQ_ZERO_WRITE);
 }
 
 int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
@@ -1510,22 +1478,25 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 
 int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int count)
 {
-    int ret = blk_prw(blk, offset, buf, count, blk_read_entry, 0);
-    if (ret < 0) {
-        return ret;
-    }
-    return count;
+    int ret;
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_preadv(blk, offset, count, &qiov, 0);
+    blk_dec_in_flight(blk);
+
+    return ret < 0 ? ret : count;
 }
 
 int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int count,
                BdrvRequestFlags flags)
 {
-    int ret = blk_prw(blk, offset, (void *) buf, count, blk_write_entry,
-                      flags);
-    if (ret < 0) {
-        return ret;
-    }
-    return count;
+    int ret;
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+
+    ret = blk_pwritev_part(blk, offset, count, &qiov, 0, flags);
+
+    return ret < 0 ? ret : count;
 }
 
 int64_t blk_getlength(BlockBackend *blk)
@@ -1582,7 +1553,7 @@ void blk_aio_cancel_async(BlockAIOCB *acb)
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
     blk_wait_while_drained(blk);
@@ -1594,18 +1565,15 @@ blk_co_do_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
     return bdrv_co_ioctl(blk_bs(blk), req, buf);
 }
 
-static void blk_ioctl_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_ioctl(rwco->blk, rwco->offset, qiov->iov[0].iov_base);
-    aio_wait_kick();
-}
-
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf)
 {
-    return blk_prw(blk, req, buf, 0, blk_ioctl_entry, 0);
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_ioctl(blk, req, buf);
+    blk_dec_in_flight(blk);
+
+    return ret;
 }
 
 static void blk_aio_ioctl_entry(void *opaque)
@@ -1625,7 +1593,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn
+int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
@@ -1669,22 +1637,19 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
     return ret;
 }
 
-static void blk_pdiscard_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    QEMUIOVector *qiov = rwco->iobuf;
-
-    rwco->ret = blk_co_do_pdiscard(rwco->blk, rwco->offset, qiov->size);
-    aio_wait_kick();
-}
-
 int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
 {
-    return blk_prw(blk, offset, NULL, bytes, blk_pdiscard_entry, 0);
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_pdiscard(blk, offset, bytes);
+    blk_dec_in_flight(blk);
+
+    return ret;
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
+int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
 
@@ -1721,16 +1686,15 @@ int coroutine_fn blk_co_flush(BlockBackend *blk)
     return ret;
 }
 
-static void blk_flush_entry(void *opaque)
-{
-    BlkRwCo *rwco = opaque;
-    rwco->ret = blk_co_do_flush(rwco->blk);
-    aio_wait_kick();
-}
-
 int blk_flush(BlockBackend *blk)
 {
-    return blk_prw(blk, 0, NULL, 0, blk_flush_entry, 0);
+    int ret;
+
+    blk_inc_in_flight(blk);
+    ret = blk_do_flush(blk);
+    blk_dec_in_flight(blk);
+
+    return ret;
 }
 
 void blk_drain(BlockBackend *blk)
@@ -2218,8 +2182,9 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
 int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
                           int count)
 {
-    return blk_prw(blk, offset, (void *) buf, count, blk_write_entry,
-                   BDRV_REQ_WRITE_COMPRESSED);
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+    return blk_pwritev_part(blk, offset, count, &qiov, 0,
+                            BDRV_REQ_WRITE_COMPRESSED);
 }
 
 int blk_truncate(BlockBackend *blk, int64_t offset, bool exact,
-- 
2.31.1


