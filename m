Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F0511825
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:12:34 +0200 (CEST)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhT7-0007na-KI
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPK-0001eU-MN; Wed, 27 Apr 2022 09:08:38 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPI-0002aD-8Q; Wed, 27 Apr 2022 09:08:38 -0400
Received: by mail-ej1-x635.google.com with SMTP id r13so3300021ejd.5;
 Wed, 27 Apr 2022 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dnJjsjGHKfmzwr3f/1bnJkY/tqC3jmYO2C5GoU6b+4=;
 b=IisSWpCQp3mSbP9xxrX69AsSg/LU73qD/eYtqGLXaU0HAeKBTYL1ddwsmHy9YPMMxd
 L25VkahwPZZ9tESmQCJxFvsO8d1jmJq16EB9vyURPrXj6V/tDWHKt3xhz0LlK86k1TE7
 Cn3VlkbURYufom94y0+a2cg97kEmn+qG05iBWZVueYh+Q0z2bRjBYV3ADFKQKMSaUSjj
 XPwwbcpF6iae4k3aFVfTFQq/O5NVMqCwjhd5Jw26fqQZPfb20/P8rDFK9lhiY+U4pLGy
 yj+atiGc4OPTqMOGoozxr48RYPDsLBVdz9uoP35jxq0UtHFUALx1zH6hqbDhCyMpNlXz
 l2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2dnJjsjGHKfmzwr3f/1bnJkY/tqC3jmYO2C5GoU6b+4=;
 b=AZo4frEf/Hv3Mc0Tp5DYwRA4xSWMgsym42azr0dMQPn7BBmzsYlssajfPhlZWu8/qw
 EWM6HFhTC8JBMtTV7MG1H30Oeu5VrTtOlAsN9EIZgwh3tgTgHU7vnVlOtKaKH5YN3P0H
 rWbSW5V+74NR9EiUVDPvblE/xwh2V5pysqFIeYpwSszfuMsW9NUcon1SE8hDaORgT8SO
 2D/FElwAJyxcMu4a9+nQATR6q8iDvXQCU9YVOZu26u12P/fvvxKkNINN0+bstzyrdgEg
 uXrvEgR3Mna2hYF3j3KsjxwFETGG9hSWPtH3XB2ggS0pLdcLbTVWSI3BiRY5ds0zZipR
 sE5g==
X-Gm-Message-State: AOAM5317WnMdeVFkgjOYEXha9peaiFnMy+7zH9EyaEoLFxfuFCjCLIc9
 RqrEh30kwpCmLSedQv8R1Fa0znhVnewUuw==
X-Google-Smtp-Source: ABdhPJyvcK7gvoXkAOqThiMigzGShiMBPZjN1R3vNmCR9jnMCu/Cj4Zh1nrAW1e0x7pf+OhOVvdlHQ==
X-Received: by 2002:a17:906:174f:b0:6d0:5629:e4be with SMTP id
 d15-20020a170906174f00b006d05629e4bemr26480264eje.525.1651064914072; 
 Wed, 27 Apr 2022 06:08:34 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170906654800b006f38daa8447sm4712447ejn.145.2022.04.27.06.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:08:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] coroutine-lock: introduce qemu_co_queue_enter_all
Date: Wed, 27 Apr 2022 15:08:29 +0200
Message-Id: <20220427130830.150180-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427130830.150180-1-pbonzini@redhat.com>
References: <20220427130830.150180-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because qemu_co_queue_restart_all does not release the lock, it should
be used only in coroutine context.  Introduce a new function that,
like qemu_co_enter_next, does release the lock, and use it whenever
qemu_co_queue_restart_all was used outside coroutine context.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h   | 13 +++++++++++++
 ui/console.c               |  2 +-
 util/qemu-coroutine-lock.c |  7 +++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c23d41e1ff..e5954635f6 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -234,6 +234,19 @@ void qemu_co_queue_restart_all(CoQueue *queue);
     qemu_co_enter_next_impl(queue, QEMU_MAKE_LOCKABLE(lock))
 bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock);
 
+/**
+ * Empties the CoQueue, waking the waiting coroutine one at a time.  Unlike
+ * qemu_co_queue_all, this function releases the lock during aio_co_wake
+ * because it is meant to be used outside coroutine context; in that case, the
+ * coroutine is entered immediately, before qemu_co_enter_all returns.
+ *
+ * If used in coroutine context, qemu_co_enter_all is equivalent to
+ * qemu_co_queue_all.
+ */
+#define qemu_co_enter_all(queue, lock) \
+    qemu_co_enter_all_impl(queue, QEMU_MAKE_LOCKABLE(lock))
+void qemu_co_enter_all_impl(CoQueue *queue, QemuLockable *lock);
+
 /**
  * Checks if the CoQueue is empty.
  */
diff --git a/ui/console.c b/ui/console.c
index 1752f2ec88..afe3159394 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -218,7 +218,7 @@ static void gui_setup_refresh(DisplayState *ds)
 void graphic_hw_update_done(QemuConsole *con)
 {
     if (con) {
-        qemu_co_queue_restart_all(&con->dump_queue);
+        qemu_co_enter_all(&con->dump_queue, NULL);
     }
 }
 
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5705cfea2e..5b0342faed 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -108,6 +108,13 @@ bool coroutine_fn qemu_co_queue_next(CoQueue *queue)
     return qemu_co_enter_next_impl(queue, NULL);
 }
 
+void qemu_co_enter_all_impl(CoQueue *queue, QemuLockable *lock)
+{
+    while (qemu_co_enter_next_impl(queue, lock)) {
+        /* just loop */
+    }
+}
+
 bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
-- 
2.35.1



