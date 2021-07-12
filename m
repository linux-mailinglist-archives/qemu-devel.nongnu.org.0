Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCDC3C5D59
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:36:11 +0200 (CEST)
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w6U-0006EO-2H
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2vhq-00029f-EW
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:10:42 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2vho-0000VI-RR
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:10:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id gb6so34465772ejc.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwTsHQTyaZdjZEZPVvyPq5Hx1sancaThnHYknvhLFNw=;
 b=bB5bpi73uFcagpAQ4GRZxqCD7rTjqdWqTJso5iw5L6P7UXLYNlI4DExs5BzQliQIJJ
 ev8cJHEW/L5Smd1y/M3jKgPYkcl1Fq5RmRCP8KhbO5c0qkCfpHbWDewuUAqzoruAZ3ai
 8X4OFrGg6dZ+9vqSKNjNI7VnLiAUfxQFzkHa05zDpqx0K511CXnQ1jE4zGa06d51eNXf
 3s/JkpH0w3ws4GzrqMMQo+iQdK8qKOsNye6o2JJlQ0W1UvHa4qetoD9h2VGu2zY8FHK1
 R/OLj+Tni+vVcReXd06dB3525RUTy3xvdHHoZ4VFie3c4bdpm3f4IrYdp+kEXZ0jEC7n
 GPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jwTsHQTyaZdjZEZPVvyPq5Hx1sancaThnHYknvhLFNw=;
 b=OTKkBz0+YSbpuz1tvjq8KCT2v8ffsTIr77/+0WDJ+u4F2VGNNzigpp1fburJjRcLNt
 M0uz+Gs1L6nvW5y/k9tKiifE5jmgOmyJD9QWzhzMsrXBzEfD/27ycp3irEAnHrpg4Y0U
 Coerva6LM+qMSj6hW0hJzP5mryL4RMQbB8UlH1wr6bJoaE59irM0+0UcASvCy3vwbbZ5
 yH7sw2HDeN0FNqtQfFE3gWPcRhAk3KDJ/ugt/UDLc6wBG/Dc5frIjyoM1zvlYR9TLpiU
 +GanJ7BGOrZHkQUZ2qQe8ma67d5JP1X2CGPxO4lGyUpLXtIL47CxLUD+Bz0vSTz2JGyT
 LGfQ==
X-Gm-Message-State: AOAM531AAmE6S/ULXfN0LvcLvEDDVfV8H6h699xUR+R2U/3RBup2OvV0
 DxjmqO4J9GKqx4BKyYLrkNYuvZeSdbQ=
X-Google-Smtp-Source: ABdhPJxfEB7nLNvI/xs2EfzL9DGHT5gAkgjmUBxllwvsJv7S8f94IHoRd+ETORs57RSvKZPUVwEQgQ==
X-Received: by 2002:a17:906:4ad2:: with SMTP id
 u18mr14095314ejt.549.1626095439152; 
 Mon, 12 Jul 2021 06:10:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i14sm1688664eja.91.2021.07.12.06.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 06:10:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] io_uring: move LuringState typedef to block/aio.h
Date: Mon, 12 Jul 2021 15:10:30 +0200
Message-Id: <20210712131030.465621-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LuringState typedef is defined twice, in include/block/raw-aio.h and
block/io_uring.c.  Move it in include/block/aio.h, which is included
everywhere the typedef is needed, since include/block/aio.h already has
to define the forward reference to the struct.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io_uring.c        | 4 ++--
 include/block/aio.h     | 8 ++++----
 include/block/raw-aio.h | 1 -
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 00a3ee9fb8..aa856a4c5d 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -46,7 +46,7 @@ typedef struct LuringQueue {
     QSIMPLEQ_HEAD(, LuringAIOCB) submit_queue;
 } LuringQueue;
 
-typedef struct LuringState {
+struct LuringState {
     AioContext *aio_context;
 
     struct io_uring ring;
@@ -56,7 +56,7 @@ typedef struct LuringState {
 
     /* I/O completion processing.  Only runs in I/O thread.  */
     QEMUBH *completion_bh;
-} LuringState;
+};
 
 /**
  * luring_resubmit:
diff --git a/include/block/aio.h b/include/block/aio.h
index 807edce9b5..8e2e4fe10f 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -54,7 +54,7 @@ typedef void IOHandler(void *opaque);
 struct Coroutine;
 struct ThreadPool;
 struct LinuxAioState;
-struct LuringState;
+typedef struct LuringState LuringState;
 
 /* Is polling disabled? */
 bool aio_poll_disabled(AioContext *ctx);
@@ -209,7 +209,7 @@ struct AioContext {
      * State for Linux io_uring.  Uses aio_context_acquire/release for
      * locking.
      */
-    struct LuringState *linux_io_uring;
+    LuringState *linux_io_uring;
 
     /* State for file descriptor monitoring using Linux io_uring */
     struct io_uring fdmon_io_uring;
@@ -513,10 +513,10 @@ struct LinuxAioState *aio_setup_linux_aio(AioContext *ctx, Error **errp);
 struct LinuxAioState *aio_get_linux_aio(AioContext *ctx);
 
 /* Setup the LuringState bound to this AioContext */
-struct LuringState *aio_setup_linux_io_uring(AioContext *ctx, Error **errp);
+LuringState *aio_setup_linux_io_uring(AioContext *ctx, Error **errp);
 
 /* Return the LuringState bound to this AioContext */
-struct LuringState *aio_get_linux_io_uring(AioContext *ctx);
+LuringState *aio_get_linux_io_uring(AioContext *ctx);
 /**
  * aio_timer_new_with_attrs:
  * @ctx: the aio context
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 251b10d273..af0ea0fba4 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -59,7 +59,6 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s);
 #endif
 /* io_uring.c - Linux io_uring implementation */
 #ifdef CONFIG_LINUX_IO_URING
-typedef struct LuringState LuringState;
 LuringState *luring_init(Error **errp);
 void luring_cleanup(LuringState *s);
 int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
-- 
2.31.1


