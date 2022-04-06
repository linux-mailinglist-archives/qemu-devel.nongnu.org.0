Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7C4F6898
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:11:12 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncA7a-0003MH-Re
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5E-0000OM-8H
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:44 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA59-0001y6-Nx
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:41 -0400
Received: by mail-lj1-x22b.google.com with SMTP id bx37so4333963ljb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oqg7f41+VM2vEfQWhjrNPCfXrEnJ1rvaBBV839r4i28=;
 b=tZqQOhJ+FJW7OQXuUYaOCWrw+ctsybVQ3DdMTLoihmdJWg8iiVtpICTtiMSvjG/d1q
 4iNDmIjU8x/OKUJsYB6e7Vou44Wl4XUbMpZIGt83xqFlvrvT3Ym1PSJlu1JnnaIShuXr
 j/YDUNCJGf+6jeu6Q+Izc2OE+TKmKWTuIkY7wO4FK18FCnMEUCoN50TCBA+g7vZgPkvq
 VoHYotSBq/6gPOADBm/J43HUxaDdjKCrJDE13sXslgjoKriSaMAJityjsFn+bf39i9MC
 YfYLt2wOqI4olpE80Swa0TxOv9aehFY1Ae8wd6CJCPubZnO/mzV/xHgm1tWcSVaHhbt3
 S/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqg7f41+VM2vEfQWhjrNPCfXrEnJ1rvaBBV839r4i28=;
 b=S9fgHrdaeG1dCcuE7aAo34UWSXNAEryT7GjbGqSBMesIIT+6I4aQ6aOSnKmqSGexro
 ynNzwBiOe9YDbSyYiZXVdgxiT6BPx2ap+TIV2KIe5GPD0ZVCzUhsdWishI2Ni9EnCukI
 pSjpmOgMq1sPSuqXkxP2gZaYeXSB7jiY660NSFJCbQP8RK2HBXRcoDw+2qRsGr+HMVlI
 LnrI/so6HeBISO4yaL6d4w1HFfNmIiS5lKPPygJ0ZQtIiTwr6/+/yMPdnbSb0zAD5RT6
 4jeKsmwKyxNX/2SnijFWC/FxyBdXT7W83t2mIVxCeme0qAWcdXSpoZ/sNliFOZXuT1G/
 WjVA==
X-Gm-Message-State: AOAM533RzWCcaXnRRMhsld5pA5O9JVQstvfMWdTWLlETSn63gAiy4HpY
 JDQ7EbyzehO4GQstZuF+OcNEkA==
X-Google-Smtp-Source: ABdhPJwj3mf0XV/kHzNKQywxGJVrrlMd5vlSUVQyg3lPOi/ADhEJFI3JngUfu6hgRi9NI92mKu1T6w==
X-Received: by 2002:a05:651c:50e:b0:249:89ef:101b with SMTP id
 o14-20020a05651c050e00b0024989ef101bmr5902530ljp.109.1649268518136; 
 Wed, 06 Apr 2022 11:08:38 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:37 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
Date: Wed,  6 Apr 2022 21:07:59 +0300
Message-Id: <20220406180801.374844-6-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406180801.374844-1-vsementsov@openvz.org>
References: <20220406180801.374844-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22b.google.com
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

Add possibility to limit block_copy() call in time. To be used in the
next commit.

As timed-out block_copy() call will continue in background anyway (we
can't immediately cancel IO operation), it's important also give user a
possibility to pass a callback, to do some additional actions on
block-copy call finish.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 include/block/block-copy.h |  4 +++-
 block/block-copy.c         | 33 ++++++++++++++++++++++++++-------
 block/copy-before-write.c  |  2 +-
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 68bbd344b2..ba0b425d78 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -40,7 +40,9 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool ignore_ratelimit);
+                            bool ignore_ratelimit, uint64_t timeout_ns,
+                            BlockCopyAsyncCallbackFunc cb,
+                            void *cb_opaque);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
diff --git a/block/block-copy.c b/block/block-copy.c
index ec46775ea5..bb947afdda 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -883,23 +883,42 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     return ret;
 }
 
+static void coroutine_fn block_copy_async_co_entry(void *opaque)
+{
+    block_copy_common(opaque);
+}
+
 int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool ignore_ratelimit)
+                            bool ignore_ratelimit, uint64_t timeout_ns,
+                            BlockCopyAsyncCallbackFunc cb,
+                            void *cb_opaque)
 {
-    BlockCopyCallState call_state = {
+    int ret;
+    BlockCopyCallState *call_state = g_new(BlockCopyCallState, 1);
+
+    *call_state = (BlockCopyCallState) {
         .s = s,
         .offset = start,
         .bytes = bytes,
         .ignore_ratelimit = ignore_ratelimit,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
+        .cb = cb,
+        .cb_opaque = cb_opaque,
     };
 
-    return block_copy_common(&call_state);
-}
+    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, timeout_ns,
+                          g_free);
+    if (ret < 0) {
+        assert(ret == -ETIMEDOUT);
+        block_copy_call_cancel(call_state);
+        /* call_state will be freed by running coroutine. */
+        return ret;
+    }
 
-static void coroutine_fn block_copy_async_co_entry(void *opaque)
-{
-    block_copy_common(opaque);
+    ret = call_state->ret;
+    g_free(call_state);
+
+    return ret;
 }
 
 BlockCopyCallState *block_copy_async(BlockCopyState *s,
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index ffb05d22f8..b7487e4ffe 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -111,7 +111,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    ret = block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true, 0, NULL, NULL);
     if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
         return ret;
     }
-- 
2.35.1


