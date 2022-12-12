Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F275649FB6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:14:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iQN-0001iJ-R5; Mon, 12 Dec 2022 08:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPm-0001NS-CY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPk-0000sy-3y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670850011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gd/g5oZBc2il3aJRL+xDn5boPt0eOLClpJBG9Q7t/O0=;
 b=GognHn6eeUwd1lt24P8ngE6FdOrMBk3qU/IKFWaWQ7HgApghkpP7KfXRqSHt2qvBoBZSg3
 t1i/W8yaAiIdwwN96NJzWrmDg+ASMg+rD6LPYowBqsAvm4UwER7XpZv3hqpQgrZTCHBz2G
 YbztR7GPpq/v0IZgIXs4syiuwUat898=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-nFGcYlG0P2C6539lyW5FEg-1; Mon, 12 Dec 2022 08:00:10 -0500
X-MC-Unique: nFGcYlG0P2C6539lyW5FEg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso3324495wma.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gd/g5oZBc2il3aJRL+xDn5boPt0eOLClpJBG9Q7t/O0=;
 b=aWbcyk5iYXrsszsCpWOdKjscnSlrm1s90FtY5ZwRkX3G3JGrKBxEpn7GIJK5nISVQn
 v4pRzUPRYgLoLB43++iuI9GXnExBo0pywzWqbWT1K1dmQSNfYiNaCmpDbGrGRUmtqvdV
 9DxgEqlXG/93PGfrDBVBHNVlw2vRTvL4v6WKfiVDndiQH+Jxau+pwQOhVZP+UCZqREgC
 S6x/IZraYX0d6uS/4qTvQLO8uLT3uWCPb8nnmalQl9h6e1IJytLpmU++6W34Re51nGNp
 SGwhVPz6CrZrXiBGOumrnGNCf3wbLuN8u5z/mOP0cTi5krQ5NDfO7R2lgHczK+k8F8Fv
 B1DQ==
X-Gm-Message-State: ANoB5pmZe0HAy8w9Yh37beiK0fUld39/ClmFn9R7z28mXPkqBS3HNUzT
 xHOYzeP0nNsgqSybMVJAGgAiOlHAVMVVwE2hasGLyZY70Vsxn7I1TuUoS58eCM1Ed9+yR1nCpf5
 n+DmKABI7HdaS/WxCbUHMucmTslIP7uAzcdYwm4AGkadVmfscLh8yi7iv3z52z520EpU=
X-Received: by 2002:adf:db01:0:b0:241:c600:39a2 with SMTP id
 s1-20020adfdb01000000b00241c60039a2mr9274210wri.22.1670850008535; 
 Mon, 12 Dec 2022 05:00:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7SiG9LHrN5b+W/CeYIQZafBUXBoCS8xXfGOxMhVOCmhkhs87cnElEUqRxMFlKZYU6HNf5hVg==
X-Received: by 2002:adf:db01:0:b0:241:c600:39a2 with SMTP id
 s1-20020adfdb01000000b00241c60039a2mr9274188wri.22.1670850008147; 
 Mon, 12 Dec 2022 05:00:08 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d5604000000b00241ce5d605dsm8837072wrv.110.2022.12.12.05.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 05:00:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 15/15] block: only get out of coroutine context for polling
Date: Mon, 12 Dec 2022 13:59:20 +0100
Message-Id: <20221212125920.248567-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The drained_begin callbacks are not polling, all they do is schedule
any operations that must complete before bdrv_drained_end().  As such,
they can be called before bdrv_co_yield_to_drain().  Thus, the only
remaining task left for bdrv_co_drain_bh_cb() is the BDRV_POLL_WHILE()
loop.  This patch extracts it into two new functions bdrv_drain_wait()
and bdrv_drain_all_wait(), so that it is easily accessible from
bdrv_co_drain_bh_cb().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c | 77 +++++++++++++++++++++++++++---------------------------
 1 file changed, 38 insertions(+), 39 deletions(-)

diff --git a/block/io.c b/block/io.c
index a75f42ee13cb..fc4bc38ee9d5 100644
--- a/block/io.c
+++ b/block/io.c
@@ -245,13 +245,8 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool ignore_bds_parents)
     return false;
 }
 
-static bool bdrv_drain_poll_top_level(BlockDriverState *bs)
-{
-    return bdrv_drain_poll(bs, false);
-}
-
-static void bdrv_do_drained_begin(BlockDriverState *bs, bool poll);
-
+static void bdrv_drain_wait(BlockDriverState *bs);
+static void bdrv_drain_all_wait(void);
 static void bdrv_co_drain_bh_cb(void *opaque)
 {
     BdrvCoDrainData *data = opaque;
@@ -262,18 +257,17 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         AioContext *ctx = bdrv_get_aio_context(bs);
         aio_context_acquire(ctx);
         bdrv_dec_in_flight(bs);
-        bdrv_do_drained_begin(bs, data->poll);
+        bdrv_drain_wait(bs);
         aio_context_release(ctx);
     } else {
-        bdrv_drain_all_begin();
+        bdrv_drain_all_wait();
     }
 
     data->done = true;
     aio_co_wake(co);
 }
 
-static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
-                                                bool poll)
+static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs)
 {
     BdrvCoDrainData data;
     Coroutine *self = qemu_coroutine_self();
@@ -288,7 +282,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .co = self,
         .bs = bs,
         .done = false,
-        .poll = poll,
     };
 
     if (bs) {
@@ -319,15 +312,10 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
     }
 }
 
-static void bdrv_do_drained_begin(BlockDriverState *bs, bool poll)
+void bdrv_do_drained_begin_quiesce(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
 
-    if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, poll);
-        return;
-    }
-
     /* Stop things in parent-to-child order */
     if (qatomic_fetch_inc(&bs->quiesce_counter) == 0) {
         aio_disable_external(bdrv_get_aio_context(bs));
@@ -336,6 +324,23 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool poll)
             bs->drv->bdrv_drain_begin(bs);
         }
     }
+}
+
+void bdrv_drained_begin(BlockDriverState *bs)
+{
+    IO_OR_GS_CODE();
+    bdrv_do_drained_begin_quiesce(bs);
+    bdrv_drain_wait(bs);
+}
+
+static void bdrv_drain_wait(BlockDriverState *bs)
+{
+    IO_OR_GS_CODE();
+
+    if (qemu_in_coroutine()) {
+        bdrv_co_yield_to_drain(bs);
+        return;
+    }
 
     /*
      * Wait for drained requests to finish.
@@ -346,20 +351,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool poll)
      * includes other nodes in the same AioContext and therefore all child
      * nodes.
      */
-    if (poll) {
-        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs));
-    }
-}
-
-void bdrv_do_drained_begin_quiesce(BlockDriverState *bs)
-{
-    bdrv_do_drained_begin(bs, false);
-}
-
-void bdrv_drained_begin(BlockDriverState *bs)
-{
-    IO_OR_GS_CODE();
-    bdrv_do_drained_begin(bs, true);
+    BDRV_POLL_WHILE(bs, bdrv_drain_poll(bs, false));
 }
 
 /**
@@ -438,11 +430,6 @@ void bdrv_drain_all_begin(void)
     BlockDriverState *bs = NULL;
     GLOBAL_STATE_CODE();
 
-    if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true);
-        return;
-    }
-
     /*
      * bdrv queue is managed by record/replay,
      * waiting for finishing the I/O requests may
@@ -464,18 +451,30 @@ void bdrv_drain_all_begin(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_begin(bs, false);
+        bdrv_do_drained_begin_quiesce(bs);
         aio_context_release(aio_context);
     }
 
     /* Now poll the in-flight requests */
-    AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());
+    bdrv_drain_all_wait();
 
     while ((bs = bdrv_next_all_states(bs))) {
         bdrv_drain_assert_idle(bs);
     }
 }
 
+static void bdrv_drain_all_wait(void)
+{
+    GLOBAL_STATE_CODE();
+
+    if (qemu_in_coroutine()) {
+        bdrv_co_yield_to_drain(NULL);
+        return;
+    }
+
+    AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());
+}
+
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
 {
     GLOBAL_STATE_CODE();
-- 
2.38.1


