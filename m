Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CB6531D4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:33:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yvr-0004zQ-Hh; Wed, 21 Dec 2022 08:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7yvj-0004rT-FM
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7yvg-0005ew-80
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671628479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MmzfLG/LqVAe/JsmFSl4ucPanloDlrjr2xEdy0/zqKA=;
 b=e0JC7QL4kxSeLzF/oOxSG0D6qsf8pFgcVbhfc1mRPbqzs04NqXcO/5Z8O+Ubvd5hVpHPvL
 kIQGbbER17aCrkOzYpH58Udq9Vqs0tDTCdL+PsqlyCLiTY008hqUIiFFDA36oAnqN/O2RI
 jYX8AMOKFExJ6EzQHmlc4ZU2TvNdbD0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-cvxQdcGyM5SizrCE7llGvg-1; Wed, 21 Dec 2022 08:14:38 -0500
X-MC-Unique: cvxQdcGyM5SizrCE7llGvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05D928027F8;
 Wed, 21 Dec 2022 13:14:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D139614152F4;
 Wed, 21 Dec 2022 13:14:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A464521E6939; Wed, 21 Dec 2022 14:14:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 5/5] coroutine: Use Coroutine typedef name instead of
 structure tag
Date: Wed, 21 Dec 2022 14:14:35 +0100
Message-Id: <20221221131435.3851212-6-armbru@redhat.com>
In-Reply-To: <20221221131435.3851212-1-armbru@redhat.com>
References: <20221221131435.3851212-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/block/aio.h | 7 +++----
 util/async.c        | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 3a546e7515..8fba6a3584 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -52,7 +52,6 @@ typedef void QEMUBHFunc(void *opaque);
 typedef bool AioPollFn(void *opaque);
 typedef void IOHandler(void *opaque);
 
-struct Coroutine;
 struct ThreadPool;
 struct LinuxAioState;
 struct LuringState;
@@ -694,7 +693,7 @@ static inline bool aio_node_check(AioContext *ctx, bool is_external)
  * is the context in which the coroutine is running (i.e. the value of
  * qemu_get_current_aio_context() from the coroutine itself).
  */
-void aio_co_schedule(AioContext *ctx, struct Coroutine *co);
+void aio_co_schedule(AioContext *ctx, Coroutine *co);
 
 /**
  * aio_co_reschedule_self:
@@ -717,7 +716,7 @@ void coroutine_fn aio_co_reschedule_self(AioContext *new_ctx);
  * context.  The coroutine must not be entered by anyone else while
  * aio_co_wake() is active.
  */
-void aio_co_wake(struct Coroutine *co);
+void aio_co_wake(Coroutine *co);
 
 /**
  * aio_co_enter:
@@ -726,7 +725,7 @@ void aio_co_wake(struct Coroutine *co);
  *
  * Enter a coroutine in the specified AioContext.
  */
-void aio_co_enter(AioContext *ctx, struct Coroutine *co);
+void aio_co_enter(AioContext *ctx, Coroutine *co);
 
 /**
  * Return the AioContext whose event loop runs in the current thread.
diff --git a/util/async.c b/util/async.c
index 14d63b3091..0657b75397 100644
--- a/util/async.c
+++ b/util/async.c
@@ -640,7 +640,7 @@ void coroutine_fn aio_co_reschedule_self(AioContext *new_ctx)
     }
 }
 
-void aio_co_wake(struct Coroutine *co)
+void aio_co_wake(Coroutine *co)
 {
     AioContext *ctx;
 
@@ -653,7 +653,7 @@ void aio_co_wake(struct Coroutine *co)
     aio_co_enter(ctx, co);
 }
 
-void aio_co_enter(AioContext *ctx, struct Coroutine *co)
+void aio_co_enter(AioContext *ctx, Coroutine *co)
 {
     if (ctx != qemu_get_current_aio_context()) {
         aio_co_schedule(ctx, co);
-- 
2.38.1


