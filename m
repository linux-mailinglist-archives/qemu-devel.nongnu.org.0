Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018E9649F56
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iQc-0001np-6M; Mon, 12 Dec 2022 08:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPi-0001MT-VP
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPe-0000ic-03
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670850004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGdm71Q4TtbUpgrQrxbMQTKlqvkd/QknlShWaWKaKHQ=;
 b=Kov00nUT3PoRibqxfLJ/fhrf6/qEvzNJSzALbQTVXYKEajqgDQ/WZ1uPEsXEYhI4Gj+wFR
 YbX5bc6poLv0Dx9H2rT7aKp4NM55Rr+Uq9wdjiAK0/6TgrJyl5XeQDzeTbjeeo3gz+7XuP
 qsZX7psT+AfLrQ1WOfBzNPnmgTLm3ZQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-acBC1HDePUSHVyl73bW5Qw-1; Mon, 12 Dec 2022 08:00:03 -0500
X-MC-Unique: acBC1HDePUSHVyl73bW5Qw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so4132629wme.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGdm71Q4TtbUpgrQrxbMQTKlqvkd/QknlShWaWKaKHQ=;
 b=ZWCQkWD3l09ngsn39CUDpHt99WQiyYXBX/QB6fq3H547R8v4GKmlbY9NBUIKFwaahq
 JlCQ6Rihk+xo+2eABYLTC9h5YAK0voLaxPJBJ7Hjut+LjgdJVLB0r9YocY5U4WREnlSY
 XXxqVjHpxzniQl7oGe2PK3mzq7+gS4sXhAFnybbuNMQ4LQQ4Sxft0CWnN6gAfr6XqbXg
 2F9DuSdkKVL8SD9JHIyrtFm3ufzWDdrs7fXyGoaGpbSiYt/ayMlfrf/8SvIrXqwQ3D6i
 f4juRAQPtrxGWcCPoM4BAEJlZBoE01RAt/f0SYTtDHlAhifvHUoAjzQO6vwXs7LzRh5c
 6tkg==
X-Gm-Message-State: ANoB5pndBfnRjmIC6RxpczPCT8dNVsqVZVYAmY3+v8rppZDuJw3Uj0GH
 vutn9XKr3zsOEak8s/3Y6r2Zx26knHbsnVTCnyliS+hwvKoY+JwgfLrjHjURYHHfPBjzKYap456
 SAho7UkUiQ3g02lVFvgdDW+XDUmfwij741ZG8LFwbSise7TG36CVKoG962eiWKFpuwxg=
X-Received: by 2002:a5d:6806:0:b0:242:7a19:b535 with SMTP id
 w6-20020a5d6806000000b002427a19b535mr10979309wru.64.1670850001518; 
 Mon, 12 Dec 2022 05:00:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7X8HZ4VAvf53tX1tToMiImFB90Qr7+1ODLGvPlf1B+0pfcmCNtsVZLHysymFZWIp20qDfkyw==
X-Received: by 2002:a5d:6806:0:b0:242:7a19:b535 with SMTP id
 w6-20020a5d6806000000b002427a19b535mr10979291wru.64.1670850001217; 
 Mon, 12 Dec 2022 05:00:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a056000022200b002420dba6447sm8777865wrz.59.2022.12.12.05.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 05:00:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 13/15] block: second argument of bdrv_do_drained_end is always
 NULL
Date: Mon, 12 Dec 2022 13:59:18 +0100
Message-Id: <20221212125920.248567-14-pbonzini@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Remove it and unify the function with bdrv_drained_end.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/block/io.c b/block/io.c
index 695c8f3f5faa..c2962adf8d2d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -69,14 +69,11 @@ void bdrv_parent_drained_end_single(BdrvChild *c)
     }
 }
 
-static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore)
+static void bdrv_parent_drained_end(BlockDriverState *bs)
 {
     BdrvChild *c;
 
     QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if (c == ignore) {
-            continue;
-        }
         bdrv_parent_drained_end_single(c);
     }
 }
@@ -262,7 +259,6 @@ static bool bdrv_drain_poll_top_level(BlockDriverState *bs,
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
                                   bool poll);
-static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent);
 
 static void bdrv_co_drain_bh_cb(void *opaque)
 {
@@ -381,10 +377,11 @@ void bdrv_drained_begin(BlockDriverState *bs)
  * This function does not poll, nor must any of its recursively called
  * functions.
  */
-static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
+void bdrv_drained_end(BlockDriverState *bs)
 {
     int old_quiesce_counter;
 
+    IO_OR_GS_CODE();
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
@@ -393,17 +390,11 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
         if (bs->drv && bs->drv->bdrv_drain_end) {
             bs->drv->bdrv_drain_end(bs);
         }
-        bdrv_parent_drained_end(bs, parent);
+        bdrv_parent_drained_end(bs);
         aio_enable_external(bdrv_get_aio_context(bs));
     }
 }
 
-void bdrv_drained_end(BlockDriverState *bs)
-{
-    IO_OR_GS_CODE();
-    bdrv_do_drained_end(bs, NULL);
-}
-
 void bdrv_drain(BlockDriverState *bs)
 {
     IO_OR_GS_CODE();
@@ -504,7 +495,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
     g_assert(!bs->refcnt);
 
     while (bs->quiesce_counter) {
-        bdrv_do_drained_end(bs, NULL);
+        bdrv_drained_end(bs);
     }
 }
 
@@ -526,7 +517,7 @@ void bdrv_drain_all_end(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_end(bs, NULL);
+        bdrv_drained_end(bs);
         aio_context_release(aio_context);
     }
 
-- 
2.38.1


