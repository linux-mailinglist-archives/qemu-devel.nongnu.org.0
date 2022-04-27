Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8D511821
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:10:49 +0200 (CEST)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhRP-0003yB-HD
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPJ-0001cG-9G; Wed, 27 Apr 2022 09:08:37 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPH-0002a8-7P; Wed, 27 Apr 2022 09:08:36 -0400
Received: by mail-ej1-x62c.google.com with SMTP id i19so3257180eja.11;
 Wed, 27 Apr 2022 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Enz89Z1b6qSBb2rzFvfNgjaBMJ17Oe/5EegOF+KKJZw=;
 b=kU1L8Gh6NTrPh1Cya+4krAud59q0W7P/wQhAyPmowszLRmiy8f5uH+9s5O40JR5Fyq
 pZGexI1rGbqJtZJBPclCzExRzEhDivl0ryZa7f/4MSM0RHhL/YuzqhrHDghdvxCEP5hO
 +ywKxl6+JiqLvoQXp68/9wujLM9vEkuALskv19YEeUOk5+Ne5SHFzufVa2fagfPdRHBG
 xJH8A5hXFgFgSLjytnqaL0iMCzzFaNI8nqzwvBchBpgl3b2JSZU+2BUN/XohZlIR2ZTf
 ZdU3CDj/hmtcu3gDpuJcXAl9zawiLBwNt9flkonfj2OAJ3ZHfdKWKZYIFq3qW47dRp44
 wDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Enz89Z1b6qSBb2rzFvfNgjaBMJ17Oe/5EegOF+KKJZw=;
 b=PEmy0F39u0BmOeju0oSgJ3Ws2/JDBmsyxAOEMWZTo8hFYzHWdMcGe0VKbZcwkhYiC9
 FiFmVqPs3AJSK7rtjDyp6MdqHsnGDY9KVw1BIuP9FU429dK8dgNDfTgmVKTVk5US7GGQ
 yvlfCkOB2ARqHGIbRTSNSLKJ0jqxhm9b8JvVsYEPP928ByideYMvhP6pGY0U9/oPHVpy
 xxxV+Tjfc9nXIEfZWC1pDEkdSK0Lgt4M2Z4TpdO/cLCOGU5MlEMBditTmRRhM74c7qct
 VcXNxYz1b2NtwcCHD3e1quiqo9bWAV4oeHoEoEcfi514LIcy0saUBKDqhiIIw88bJUGr
 C6ew==
X-Gm-Message-State: AOAM532yks4BlwP4e8X5iXQ+4eUnddC8mZmvF6FLcuzQP3eoriCwsD3p
 5BlhQmFcEqc8WO1AqREkGr+T3oCS4t+6ZQ==
X-Google-Smtp-Source: ABdhPJzIqRUkSNbxbgrpDmLjpkp5gQkCSoJNx56uRguNB3GizjuJHyN5eZGVT+h8l3jUdS+wrhWm+A==
X-Received: by 2002:a17:906:99c1:b0:6db:f0cf:e38c with SMTP id
 s1-20020a17090699c100b006dbf0cfe38cmr26434718ejn.692.1651064913218; 
 Wed, 27 Apr 2022 06:08:33 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170906654800b006f38daa8447sm4712447ejn.145.2022.04.27.06.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:08:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] coroutine-lock: qemu_co_queue_next is a coroutine-only
 qemu_co_enter_next
Date: Wed, 27 Apr 2022 15:08:28 +0200
Message-Id: <20220427130830.150180-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427130830.150180-1-pbonzini@redhat.com>
References: <20220427130830.150180-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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

qemu_co_queue_next is basically the same as qemu_co_enter_next but
without a QemuLockable argument.  That's perfectly fine, but only
as long as the function is marked coroutine_fn.  If used outside
coroutine context, qemu_co_queue_wait will attempt to take the lock
and that is just broken: if you are calling qemu_co_queue_next outside
coroutine context, the lock is going to be a QemuMutex which cannot be
taken twice by the same thread.

The patch adds the marker and reimplements qemu_co_queue_next in terms of
qemu_co_enter_next_impl, to remove duplicated code and to clarify that the
latter also works in coroutine context.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h   |  7 ++++---
 util/qemu-coroutine-lock.c | 21 +++++++--------------
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 284571badb..c23d41e1ff 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -208,11 +208,12 @@ void qemu_co_queue_init(CoQueue *queue);
 void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
 
 /**
- * Removes the next coroutine from the CoQueue, and wake it up.
+ * Removes the next coroutine from the CoQueue, and queue it to run after
+ * the currently-running coroutine yields.
  * Returns true if a coroutine was removed, false if the queue is empty.
- * OK to run from coroutine and non-coroutine context.
+ * Used from coroutine context, use qemu_co_enter_next outside.
  */
-bool qemu_co_queue_next(CoQueue *queue);
+bool coroutine_fn qemu_co_queue_next(CoQueue *queue);
 
 /**
  * Empties the CoQueue; all coroutines are woken up.
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 2669403839..5705cfea2e 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -67,7 +67,7 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
     }
 }
 
-static bool qemu_co_queue_do_restart(CoQueue *queue, bool single)
+void qemu_co_queue_restart_all(CoQueue *queue)
 {
     Coroutine *next;
 
@@ -78,23 +78,10 @@ static bool qemu_co_queue_do_restart(CoQueue *queue, bool single)
     while ((next = QSIMPLEQ_FIRST(&queue->entries)) != NULL) {
         QSIMPLEQ_REMOVE_HEAD(&queue->entries, co_queue_next);
         aio_co_wake(next);
-        if (single) {
-            break;
-        }
     }
     return true;
 }
 
-bool qemu_co_queue_next(CoQueue *queue)
-{
-    return qemu_co_queue_do_restart(queue, true);
-}
-
-void qemu_co_queue_restart_all(CoQueue *queue)
-{
-    qemu_co_queue_do_restart(queue, false);
-}
-
 bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock)
 {
     Coroutine *next;
@@ -115,6 +102,12 @@ bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock)
     return true;
 }
 
+bool coroutine_fn qemu_co_queue_next(CoQueue *queue)
+{
+    /* No unlock/lock needed in coroutine context.  */
+    return qemu_co_enter_next_impl(queue, NULL);
+}
+
 bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
-- 
2.35.1



