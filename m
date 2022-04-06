Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF24F689D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:14:59 +0200 (CEST)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncABG-0003T4-Fw
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5E-0000OQ-9N
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:44 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5A-0001yS-F8
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:43 -0400
Received: by mail-lj1-x234.google.com with SMTP id c15so4315857ljr.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ENmWFN7sIJ5AH9c9BqRXvLC/5EA/2JEQfd9vHLRWLo=;
 b=rCnzh7A8a0iasWaR+3W5o/oA6Q7Kl0AJj7UZ4Po+mh1v1Ra3P/+PM4oFN7NCFcqPlw
 HnoIUYe+U0jLVUTY1F4jE+Sn+VbWl0Xd/14OJNaRLDtvTGb+hERdyIk+TRguaxhUj32g
 Fa+vzOV8WHEZXdt9hKHF3+a0GljZkyHlJ8it2B8OoII4r5dmGTtzJq5nRXz1TgzT8RM1
 Vwo8ofM0QSGQ+BREWthSdwKLMZejzPFqEzpYGx+deX+iGPr3dfq86I3w4w1O4BOUXC7T
 g6Jiv03QwLPpoXyQOTRJDS0ttKgNW3l66aP8+NsStEXUpVrlgmiLeIxwTNhG6J7q+Q1L
 0kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ENmWFN7sIJ5AH9c9BqRXvLC/5EA/2JEQfd9vHLRWLo=;
 b=fTp7hO7tG7sZZ6rft5LS+rmoExolWfvgXmTHGT2FGMsJwnBnn0UOS9IiaDgvJcrYMv
 gLjFawSBw2SJVxiZpuruZDX0f02GC0GbL7Gta8wySlJ+h/+wywOA9LYC1Q+WXSkaWXuj
 DrnHKd1cyKIjTztnuXu2K86VuTJjnQ4qapsSISsXFJKVOrZTty491io8Bnbnra6tUwYx
 MbV3R6sPYxAzhhiZ4KqwSoxEjZBnTLj61/49qiPR5oqnZbROk7j8GWnIMBugTLII1JBK
 Uq9qf/WYLvvYteQ8Fi3t5+lYjNphuAN2v9VqcEi2COkL/heeNkmO7yha2y9zrZzTnXQq
 DaDQ==
X-Gm-Message-State: AOAM531jnuGoX6xD8AMvcaH0s6GzBfv1Vvl9JwCGYQWJErc1G+Dc0Myi
 eGkz+tdFyjVVMQxX5LaMWkm4Ow==
X-Google-Smtp-Source: ABdhPJzJClnjdhpRSYhuRrWmF0+Df6pnnycgnJZaJ/6Lvb94A/3xdBfrzpMm1lJPmJpmC9/eXvuuQQ==
X-Received: by 2002:a2e:9e13:0:b0:247:e32a:ddce with SMTP id
 e19-20020a2e9e13000000b00247e32addcemr6390017ljk.9.1649268518801; 
 Wed, 06 Apr 2022 11:08:38 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:38 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 6/7] block/copy-before-write: implement cbw-timeout option
Date: Wed,  6 Apr 2022 21:08:00 +0300
Message-Id: <20220406180801.374844-7-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406180801.374844-1-vsementsov@openvz.org>
References: <20220406180801.374844-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some scenarios, when copy-before-write operations lasts too long
time, it's better to cancel it.

Most useful would be to use the new option together with
on-cbw-error=break-snapshot: this way if cbw operation takes too long
time we'll just cancel backup process but do not disturb the guest too
much.

Note the tricky point of realization: we keep additional point in
bs->in_fligth during block_copy operation even if it's timed-out.
Background "cancelled" block_copy operations will finish at some point
and will want to access state. We should care to not free the state in
.bdrv_close() earlier.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 qapi/block-core.json      |  8 +++++++-
 block/copy-before-write.c | 23 ++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 085f1666af..e9cd7e88f6 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4206,12 +4206,18 @@
 # @on-cbw-error: Behavior on failure of copy-before-write operation.
 #                Default is @break-guest-write. (Since 7.0)
 #
+# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in seconds
+#               for copy-before-write operation. When a timeout occurs,
+#               the respective copy-before-write operation will fail, and
+#               the @on-cbw-error parameter will decide how this failure
+#               is handled. Default 0. (Since 7.1)
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
   'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
-            '*on-cbw-error': 'OnCbwError' } }
+            '*on-cbw-error': 'OnCbwError', '*cbw-timeout': 'uint32' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index b7487e4ffe..13992d28c2 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -42,6 +42,7 @@ typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     OnCbwError on_cbw_error;
+    uint32_t cbw_timeout_ns;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -83,6 +84,14 @@ static coroutine_fn int cbw_co_preadv(
     return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
+static void block_copy_cb(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    bs->in_flight--;
+    aio_wait_kick();
+}
+
 /*
  * Do copy-before-write operation.
  *
@@ -111,7 +120,16 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    ret = block_copy(s->bcs, off, end - off, true, 0, NULL, NULL);
+    /*
+     * Increase in_flight, so that in case of timed-out block-copy, the
+     * remaining background block_copy() request (which can't be immediately
+     * cancelled by timeout) is presented in bs->in_flight. This way we are
+     * sure that on bs close() we'll previously wait for all timed-out but yet
+     * running block_copy calls.
+     */
+    bs->in_flight++;
+    ret = block_copy(s->bcs, off, end - off, true, s->cbw_timeout_ns,
+                     block_copy_cb, bs);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
@@ -377,6 +395,7 @@ static BlockdevOptions *cbw_parse_options(QDict *options, Error **errp)
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
     qdict_del(options, "on-cbw-error");
+    qdict_del(options, "cbw-timeout");
 
 out:
     visit_free(v);
@@ -422,6 +441,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
             ON_CBW_ERROR_BREAK_GUEST_WRITE;
+    s->cbw_timeout_ns = opts->has_cbw_timeout ?
+        opts->cbw_timeout * NANOSECONDS_PER_SECOND : 0;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-- 
2.35.1


