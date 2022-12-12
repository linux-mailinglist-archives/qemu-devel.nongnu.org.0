Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BAE649F69
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:08:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iQQ-0001lC-0Z; Mon, 12 Dec 2022 08:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPg-0001L5-Ri
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPa-0000fk-1I
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670850001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGQrLDmE0jIV0YVet0Ys7nedRpXWcsJekGch0hOBTMg=;
 b=hfCEd3YZcnUkK6A0/WzQ4/VsmTQCIBxyIc0tY+E/Gh9mToLBSPv/lvp4aA0tE4/9MJfqhM
 9VNGUK7uEHHdCBNtRoHQXudJasrhuAIaYdfHCKh+qF7G2DZLNQJTGpPm34tz7sgsjCvNP4
 8lQi4eZzRlN0x3Ce6WZhxAaPFlnncrU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-XXzWzbX9PsyUGx3yPgObEQ-1; Mon, 12 Dec 2022 07:59:59 -0500
X-MC-Unique: XXzWzbX9PsyUGx3yPgObEQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c21-20020adfa315000000b002425bf67a87so2203921wrb.19
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGQrLDmE0jIV0YVet0Ys7nedRpXWcsJekGch0hOBTMg=;
 b=KtcsUW9LkpyWnjc/Je225JuDsfy8y/VUVxcbeRAWBgPoU/GFVnddTsxUHPzKNI4bZa
 +zmYqbbl5pjcGY25QlN47LpgSEOj5gt8vLtPyJ+NkDkB0jR75eshUtGAa27WvZZXex7f
 ywL1s8AXwLFHrzRKQggSDlt2skUa5LG1nGBZRqN9AhzklcgdnOHAWHPQ9Le8xYV+Hdoh
 441Y3YU8+B2LW3eoaQgs7wAlzCiAdSeOtz+r+QNdmA1kedr6FmpX3Vx87PBwVkH88moB
 i4vT9bSEM3Ch+bI8fc3JY05A3mZcug0ZX0BG91jPkbJSUQs9J+flGO5AWxtj6ZUhIpti
 I46Q==
X-Gm-Message-State: ANoB5pnMU9sAon4nWBgW3i88PjiZwprEfwZ3Kd9dHNpWWrQT7XS4bRPM
 Kv+5NLmZ68OY3y51atU99CvhPknAc1jgND3TTz1m13lQJMQkWTHExGMZvjmEolcDFN3xx/NUcdt
 N0gcL2L6Ut0ZZMhfIXhsYy6Uwd8rW7zwLWRUeqwe2fe0FzFYnXxAm4Wm6v/AH+z7NiOk=
X-Received: by 2002:a05:600c:4f89:b0:3d1:caf1:3f56 with SMTP id
 n9-20020a05600c4f8900b003d1caf13f56mr12088776wmq.9.1670849998072; 
 Mon, 12 Dec 2022 04:59:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6LUDfwHpwPE1dLQS1ajGvsVKxa4DRC9ZO5o93XBe16wW6kNzV2+4Kqfb25/l6Rju3gEaDaFQ==
X-Received: by 2002:a05:600c:4f89:b0:3d1:caf1:3f56 with SMTP id
 n9-20020a05600c4f8900b003d1caf13f56mr12088759wmq.9.1670849997785; 
 Mon, 12 Dec 2022 04:59:57 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bi27-20020a05600c3d9b00b003d225cdb68esm5054917wmb.0.2022.12.12.04.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 12/15] block: limit bdrv_co_yield_to_drain to drain_begin
Date: Mon, 12 Dec 2022 13:59:17 +0100
Message-Id: <20221212125920.248567-13-pbonzini@redhat.com>
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

Since bdrv_drained_end does not poll anymore, it need not jump out of
coroutine context.  This in turn enables the removal of the "begin"
field in BdrvCoDrainData.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/block/io.c b/block/io.c
index f4444b7777d9..695c8f3f5faa 100644
--- a/block/io.c
+++ b/block/io.c
@@ -233,7 +233,6 @@ typedef struct {
     Coroutine *co;
     BlockDriverState *bs;
     bool done;
-    bool begin;
     bool poll;
     BdrvChild *parent;
 } BdrvCoDrainData;
@@ -275,15 +274,9 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         AioContext *ctx = bdrv_get_aio_context(bs);
         aio_context_acquire(ctx);
         bdrv_dec_in_flight(bs);
-        if (data->begin) {
-            bdrv_do_drained_begin(bs, data->parent, data->poll);
-        } else {
-            assert(!data->poll);
-            bdrv_do_drained_end(bs, data->parent);
-        }
+        bdrv_do_drained_begin(bs, data->parent, data->poll);
         aio_context_release(ctx);
     } else {
-        assert(data->begin);
         bdrv_drain_all_begin();
     }
 
@@ -292,7 +285,6 @@ static void bdrv_co_drain_bh_cb(void *opaque)
 }
 
 static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
-                                                bool begin,
                                                 BdrvChild *parent,
                                                 bool poll)
 {
@@ -309,7 +301,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .co = self,
         .bs = bs,
         .done = false,
-        .begin = begin,
         .parent = parent,
         .poll = poll,
     };
@@ -348,7 +339,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, BdrvChild *parent,
     IO_OR_GS_CODE();
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, true, parent, poll);
+        bdrv_co_yield_to_drain(bs, parent, poll);
         return;
     }
 
@@ -394,10 +385,6 @@ static void bdrv_do_drained_end(BlockDriverState *bs, BdrvChild *parent)
 {
     int old_quiesce_counter;
 
-    if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, false, parent, false);
-        return;
-    }
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
@@ -472,7 +459,7 @@ void bdrv_drain_all_begin(void)
     GLOBAL_STATE_CODE();
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true, NULL, true);
+        bdrv_co_yield_to_drain(NULL, NULL, true);
         return;
     }
 
-- 
2.38.1


