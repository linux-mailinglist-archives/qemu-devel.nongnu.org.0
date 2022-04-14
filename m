Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878EA501ABF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:04:35 +0200 (CEST)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3pa-0004lr-MP
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jN-0004lJ-Ri
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jM-0005sA-Ag
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso6480640wml.1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3S+twEeplTAQujNKOjHmSIQb0RCwmynjNUyC+p0Vtnk=;
 b=h5+OXO6imqlhVDI97sPO2ZYvf6DcwQljNcYdxitvX7RR2222ZFabPdRvuAsTjjuNBE
 WUHSY/KrBVYgdV9LfnkxWsKYJYeSITHBj2cnHjCJAr+br+bgRy/TXpFI0tRrj2UR0uea
 KQfiqbWFTF3x29poak4PfAWv+JRgA6gFwC3CtU+c1LEs04mMvT66ZnbQzw8RgFOLyi/t
 6up9RrwqVQARAOcwwhfID6z6il60A2YAmBHvzE2aZwtUTRZvvW+S6RDx43/2+k/QKP6b
 hwFmoOqPZ6BP6aD6hBDjilqeYg7V3qM4dYpFiexBazK+6Ahq59AxDUSjfbZbpFIMJs+p
 RVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3S+twEeplTAQujNKOjHmSIQb0RCwmynjNUyC+p0Vtnk=;
 b=4N5lO+5VgP7Bnk+/9bZK/JFA47bDvglD78/ojoRa7aSD9lUdlcneI0axM4qr40RMXU
 UilJIqokeYZm8nfcB4AGhDzrSUT2hQ3O8sMcVHYj+LeQ5vkrXVKrFvHWEHMt1iKsdccj
 uMRCYWn/jwHpun5FmNePjHrDP0DKM2t5kVbX4ZvcCkWyX+gbj6KZfTE/IoHgwAVcIVNH
 HuUtaaFylbqYRmcv6ixYyUxLqYJQ6L/vEIpy9oBzVJUxe+ai+qxUcu8MfPfngQD8+6oi
 0oy+h/ceZSicxbI43/RRk55XDJQ6c935xys5jXSTtz6WTVV5/yBUz60XKF0YAo5i9suM
 3IjA==
X-Gm-Message-State: AOAM531Fz9VqTqpVSlYaJOMdNjqZsweBxRfYmo6/s9h27PV8RbCjLtBY
 Wmq+6m92ijyiZ7yQSaoVJwP/tRk69VHc1Q==
X-Google-Smtp-Source: ABdhPJyYUpXcHDDfXzfMGSeOuHtbeEMOXOTcc8BYpUIM9IDbrnzRAP5sgBwxsUGoC4M9PVwC+BLYrA==
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr4201512wml.72.1649959086860; 
 Thu, 14 Apr 2022 10:58:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 1/9] nbd: safeguard against waking up invalid
 coroutine
Date: Thu, 14 Apr 2022 19:57:48 +0200
Message-Id: <20220414175756.671165-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The .reply_possible field of s->requests is never set to false.  This is
not a problem as it is only a safeguard to detect protocol errors,
but it's sloppy.  In fact, the field is actually not necessary at all,
because .coroutine is set to NULL in NBD_FOREACH_REPLY_CHUNK after
receiving the last chunk.  Thus, replace .reply_possible with .coroutine
and move the check before deciding the fate of this request.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 691d4b05dc..d29bee1122 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -58,7 +58,6 @@ typedef struct {
     Coroutine *coroutine;
     uint64_t offset;        /* original offset of the request */
     bool receiving;         /* sleeping in the yield in nbd_receive_replies */
-    bool reply_possible;    /* reply header not yet received */
 } NBDClientRequest;
 
 typedef enum NBDClientState {
@@ -454,15 +453,15 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
+        ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
+        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].coroutine) {
+            nbd_channel_error(s, -EINVAL);
+            return -EINVAL;
+        }
         if (s->reply.handle == handle) {
             /* We are done */
             return 0;
         }
-        ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
-        if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].reply_possible) {
-            nbd_channel_error(s, -EINVAL);
-            return -EINVAL;
-        }
         nbd_recv_coroutine_wake_one(&s->requests[ind2]);
     }
 }
@@ -505,7 +504,6 @@ static int nbd_co_send_request(BlockDriverState *bs,
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
-    s->requests[i].reply_possible = true;
 
     request->handle = INDEX_TO_HANDLE(s, i);
 
-- 
2.35.1



