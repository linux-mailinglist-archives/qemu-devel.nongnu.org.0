Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A128E4FE916
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:49:22 +0200 (CEST)
Received: from localhost ([::1]:36592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMVt-00066O-M5
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMPL-0006gi-6g
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMPG-0008LZ-Gn
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r133-20020a1c448b000000b0038ccb70e239so2501731wma.3
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ba4wfAaB0r3hUFfqpPUdtGRbL5KZe++vSGltbMzRdgE=;
 b=VD3tF5HBMA+CQA7GhK3M/usVIiY+8npj0tnB9Kz1kwGUQ0suGfDRWZEmvAOQ8CHzgW
 cJaY/Nd1B7w1rkf4QxjVF8wOQSqofnlI1thGKljq5izNjIrzILZff8rE5+WO7bJ9XMJZ
 7bbDUOctZUHgm8o220SL4M+bQANoPaMFUwcRnjpGpbuZdr4ZyzmsbrqjND8RN3l/5FgI
 AOhM/lwhutUlgx/INgmtxcBVo/MRXe0bMPSJe+ueix308if2V4vjPT6ZaC7kMxlgRoGp
 FIR2MaYUMDTxrxM4RX50tcX0+6aEIl8cpeO2dz6vtTKDCowhUqhR0rFC1XEqq8ekdrCF
 vF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ba4wfAaB0r3hUFfqpPUdtGRbL5KZe++vSGltbMzRdgE=;
 b=JtlhtLVngrdmdE+6oi4m4tLCBtRAeig2pjBkf3hq/cDlPMjSgEHqkmXnr0wMHPM1vN
 ibx8nXhraLTkc2KhurKSEl+qfACMliTaoeVpf7wF5lephT7n4qWg81tG8md90xVC2m7/
 PnQjdHWErXRrqNbJhybtGJoQUlT/Kq9mWYFOn8zjcWWY29UlY00XmxGif3rg8Iln98AV
 9foJSRJkum8uDSNvZZt3N6OiC0T7YK0ItqNGKKyThhqvPz+N1rlC/e9fQunJiw4bIh8E
 grUr5p63inIF9r9J0FMB0FMDAp6xnWoNhoy+qRyFI+hvvQVBzCTA8r3gm5IGRyvzyM0W
 W+dQ==
X-Gm-Message-State: AOAM5316EYbnv8OCZ8x4btxzai4FzlWgHblfcYxeg0u5Eo5PxhA/4rwl
 ITpDhZgFCExZaQEXKEEaYNG0WCxNcWItoQ==
X-Google-Smtp-Source: ABdhPJy7h6VISrS9vqHg6P7zyEthsdxWdIYfxlmS8tZgpEM1vE3KGJiQtGLdQk2DFTdRVaDMG3YjCQ==
X-Received: by 2002:a05:600c:2307:b0:38e:bf05:677c with SMTP id
 7-20020a05600c230700b0038ebf05677cmr5478690wmo.44.1649792549077; 
 Tue, 12 Apr 2022 12:42:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 7/8] nbd: take receive_mutex when reading
 requests[].receiving
Date: Tue, 12 Apr 2022 21:42:03 +0200
Message-Id: <20220412194204.350889-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

requests[].receiving is set by nbd_receive_replies() under the receive_mutex;
Read it under the same mutex as well.  Waking up receivers on errors happens
after each reply finishes processing, in nbd_co_receive_one_chunk().
If there is no currently-active reply, there are two cases:

* either there is no active request at all, in which case no
element of request[] can have .receiving = true

* or nbd_receive_replies() must be running and waiting for receive_mutex;
in that case it will get back to nbd_co_receive_one_chunk() because
the socket has been shutdown, and all waiting coroutines will wake up
in turn.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6d80bd59e2..8954243f50 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -132,6 +132,7 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->x_dirty_bitmap = NULL;
 }
 
+/* Called with s->receive_mutex taken.  */
 static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
 {
     if (req->receiving) {
@@ -143,12 +144,13 @@ static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
     return false;
 }
 
-static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
+static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s)
 {
     int i;
 
+    QEMU_LOCK_GUARD(&s->receive_mutex);
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        if (nbd_recv_coroutine_wake_one(&s->requests[i]) && !all) {
+        if (nbd_recv_coroutine_wake_one(&s->requests[i])) {
             return;
         }
     }
@@ -169,8 +171,6 @@ static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
     } else {
         s->state = NBD_CLIENT_QUIT;
     }
-
-    nbd_recv_coroutines_wake(s, true);
 }
 
 static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
@@ -433,11 +433,10 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
 
             qemu_coroutine_yield();
             /*
-             * We may be woken for 3 reasons:
+             * We may be woken for 2 reasons:
              * 1. From this function, executing in parallel coroutine, when our
              *    handle is received.
-             * 2. From nbd_channel_error(), when connection is lost.
-             * 3. From nbd_co_receive_one_chunk(), when previous request is
+             * 2. From nbd_co_receive_one_chunk(), when previous request is
              *    finished and s->reply.handle set to 0.
              * Anyway, it's OK to lock the mutex and go to the next iteration.
              */
@@ -931,7 +930,7 @@ static coroutine_fn int nbd_co_receive_one_chunk(
     }
     s->reply.handle = 0;
 
-    nbd_recv_coroutines_wake(s, false);
+    nbd_recv_coroutines_wake(s);
 
     return ret;
 }
-- 
2.35.1



