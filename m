Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7B94EEA72
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:31:31 +0200 (CEST)
Received: from localhost ([::1]:59842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDcv-00040u-9d
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:31:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRc-0000LO-5n
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:54 -0400
Received: from [2a00:1450:4864:20::12c] (port=44876
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRW-0006tV-Ak
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:46 -0400
Received: by mail-lf1-x12c.google.com with SMTP id m3so3704210lfj.11
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESo7rdotHdZMR0iHY1h3nO2pJdxOeDhAmWJR8wsYiEQ=;
 b=Mj6UokXRlY9/A1J9aQGWXvKU0AQeHIjtlQSuY6dMclz+/woH3+CU7VclvKqpIcuORT
 q3GMQhArfktEKsgnyczLb8hfG8GjqdUCOuHklOGlFXICzKdxL1h1oS/q8tev5pzc/svH
 0rLMow1HZcW4eB+CV15T1VdFU88dus4QgSgP3IdDwwjVRUr/J4eaKY8ivhekug3wILUR
 GuTBHl4Ao53TFLotld58Tjz2oKIaevf/QrrZpzxGuIvoh8Iyo9OE4i3zptNHBKaHYgbC
 8X+ZzbTUW+rL63VnjsXE+8TPXF6G82r9Org2wRtNEohv+vdToux40zFtQl3wjAnb7bgG
 8/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESo7rdotHdZMR0iHY1h3nO2pJdxOeDhAmWJR8wsYiEQ=;
 b=S6447inYuxsMnMufGw97l7Nxxi4CWcHwirWaRTn1ej/MHLogAajRVNRub/7+pZpBMQ
 146onj5n3GTj7rmkDOttOkg/QhCzkyGwbO99jkByR00X02b936nbjBD++K5XvW0y1QpS
 f24unBPzj6q7skHMM1nFj65HTcfoH+QVC7bel6bRpj9lvIzqsH39mQ08VFlRgkrA19ZH
 0ew0usUcfTkF6XtBKcIiLNkxJUhd8xnNr00nyOfyKA+awkwNu2zR3eLGxXd2fyAcEvSx
 AkHDjV2ZmP86YfHC5ieCAJy3J+OFV5ipgjCPuOGO//O55U4KjdyY4F3V3t8D+6Rz+Px4
 c+AA==
X-Gm-Message-State: AOAM531GcGPxN5p1m4v14dNDZONq1IvU9SmHfj/aoYW2zTEQ3tDs1BFH
 Bj3OiP18dU7NPv3ICppMSl20ag==
X-Google-Smtp-Source: ABdhPJy5/JKGmBUmf/3LDUOGYvAJ5DBqx7xaGpsmUpbmzyZn2gIP1/wNm8N9+C8VEsCfJG4kkqysDA==
X-Received: by 2002:ac2:4dbb:0:b0:44a:da57:33f5 with SMTP id
 h27-20020ac24dbb000000b0044ada5733f5mr1481485lfe.653.1648804778300; 
 Fri, 01 Apr 2022 02:19:38 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:38 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 6/7] block/copy-before-write: implement cbw-timeout option
Date: Fri,  1 Apr 2022 12:19:19 +0300
Message-Id: <20220401091920.287612-7-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401091920.287612-1-vsementsov@openvz.org>
References: <20220401091920.287612-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/copy-before-write.c | 6 +++++-
 qapi/block-core.json      | 5 ++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7ef3f9f4c1..0ea5506f77 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -42,6 +42,7 @@ typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     OnCbwError on_cbw_error;
+    uint32_t cbw_timeout_ns;
 
     /*
      * @lock: protects access to @access_bitmap, @done_bitmap and
@@ -107,7 +108,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    ret = block_copy(s->bcs, off, end - off, true, 0);
+    ret = block_copy(s->bcs, off, end - off, true, s->cbw_timeout_ns);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
@@ -412,6 +413,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
      */
     qdict_extract_subqdict(options, NULL, "bitmap");
     qdict_del(options, "on-cbw-error");
+    qdict_del(options, "cbw-timeout");
 
 out:
     visit_free(v);
@@ -455,6 +457,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     }
     s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
             ON_CBW_ERROR_BREAK_GUEST_WRITE;
+    s->cbw_timeout_ns = opts->has_cbw_timeout ?
+        opts->cbw_timeout * NANOSECONDS_PER_SECOND : 0;
 
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 3f08025114..e077506e0f 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4207,12 +4207,15 @@
 # @on-cbw-error: Behavior on failure of copy-before-write operation.
 #                Default is @break-guest-write. (Since 7.0)
 #
+# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in seconds
+#               for copy-before-write operation. Default 0. (Since 7.0)
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
-- 
2.35.1


