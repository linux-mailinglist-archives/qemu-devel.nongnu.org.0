Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0AB4F80A9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:35:25 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSI8-000689-SX
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAs-00079S-Ev
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:49 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAp-0007uu-KA
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:46 -0400
Received: by mail-lf1-x136.google.com with SMTP id x17so499172lfa.10
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSQ4Rb5stH3jPxFRnbnfeu8WtYBEo9ZLDuhjrTBqWZM=;
 b=CTYyiyJmD7QzF/cl3Cn+3Rdil/ByNGt2aU+VatplqgnCRCzW+OTjlVxAAi49JLESqf
 u1AlDzJ+iFZLzDfiGDqJf1IWqUDCE+jHQ7srA6uWVW2CsTV02Yhp3WzKDxeIglUnWTQ8
 KotFSNTbkKVuwoL71MGqIn0CU5VzJ5W1kFgY9YYvT1teeweQ578Uyjjv5lRN8hzMI0I+
 VjksByQW/dO5oZv+iH1Cy6pEaIbfm9yWgd2OFtbKVlBqPVGXJzLr8rG1v27Qeyn+a1WH
 2ddnChM2opUnWtNyK2koohBXQ+glv5nw3E1D0hH3RqHiIpokNPgkdt9MiBScrB7GyTOZ
 kumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSQ4Rb5stH3jPxFRnbnfeu8WtYBEo9ZLDuhjrTBqWZM=;
 b=TaIMCfyV7gr1/dQymSEQD+/szsav4iMv6dstOCdinbBH58sXbpYmfIsOVw2EYn8NSY
 ay/NEBhy5Oexme6IlzkskoCzQ9tLegU9n4PEqNeVNRUHRYxk5Wlh6dpyEPK3weoNGK9P
 a1tQWCU2Va8JadQ5/Yw8SwFOvuA/dkE1AgiWJxQd7FRPUUHsz3ntLSZxjKIPDN/4JpcG
 y00ysyDRdJkqiUo5q4DX5pexG/6vHbhSqM1Ctm4Z7Ys3uceav10jBHCGMFVVbets3nPb
 DiH4inRmYYc4dLEtD5SAIP/OF6SfksD/KLTV+nCT12du++r85NWril29+NdoVwCLtv47
 lEXA==
X-Gm-Message-State: AOAM5327MX6gqg+mTUfG1CmEKqcimzEMBHXqUbWzU51G/g5BbiGhz4mS
 GvDhmlEij0FNDZs6y3d4uNNZ4A==
X-Google-Smtp-Source: ABdhPJznslG+AV0XKo8/2GIpsURAv9E1/+AyUXZgivXLvB7Yd/yIVOzACwKDu5X9WJKlE6Sgu8KR7A==
X-Received: by 2002:a05:6512:ad4:b0:44a:3366:20eb with SMTP id
 n20-20020a0565120ad400b0044a336620ebmr9462774lfu.379.1649338061944; 
 Thu, 07 Apr 2022 06:27:41 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:41 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 6/7] block/copy-before-write: implement cbw-timeout option
Date: Thu,  7 Apr 2022 16:27:25 +0300
Message-Id: <20220407132726.85114-7-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
References: <20220407132726.85114-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x136.google.com
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
bs->in_flight during block_copy operation even if it's timed-out.
Background "cancelled" block_copy operations will finish at some point
and will want to access state. We should care to not free the state in
.bdrv_close() earlier.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 qapi/block-core.json      |  8 +++++++-
 block/copy-before-write.c | 23 ++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6b870b2f37..682b599a4a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4206,12 +4206,18 @@
 # @on-cbw-error: Behavior on failure of copy-before-write operation.
 #                Default is @break-guest-write. (Since 7.1)
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
index fc13c7cd44..1bc2e7f9ba 100644
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
@@ -423,6 +442,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
             ON_CBW_ERROR_BREAK_GUEST_WRITE;
+    s->cbw_timeout_ns = opts->has_cbw_timeout ?
+        opts->cbw_timeout * NANOSECONDS_PER_SECOND : 0;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-- 
2.35.1


