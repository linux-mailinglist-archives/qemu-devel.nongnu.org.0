Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F34CC11F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:23:15 +0100 (CET)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnIQ-0006hP-4x
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnD2-0006Hy-9c
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:17:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nPnCq-0004b0-Pm
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646320648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5UXBbPNXLil1hOoIPFAnhK29v4gBpfr/LryecHSPs6o=;
 b=OXH2iq1YJD1EWqlLM0uWIk0WGYS0AhGe0K9WEWRbvc7VNgF4pE2c/SNok5lmvvp4Z4jGSC
 BDhsSN/uXwfLYVoV11FKwwED9zX+1bYN5d8l9ktN8fj/GWQNnIV2vW2L/Z/HLVrhkMvLCO
 ndm4xPUUtuf1zUrfUMuCQfeygyE0w3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-JptkSJYcM06yQyXqQ1VIiQ-1; Thu, 03 Mar 2022 10:17:25 -0500
X-MC-Unique: JptkSJYcM06yQyXqQ1VIiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C52351DF;
 Thu,  3 Mar 2022 15:17:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BE6A7BCDC;
 Thu,  3 Mar 2022 15:16:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 01/31] main-loop.h: introduce qemu_in_main_thread()
Date: Thu,  3 Mar 2022 10:15:46 -0500
Message-Id: <20220303151616.325444-2-eesposit@redhat.com>
In-Reply-To: <20220303151616.325444-1-eesposit@redhat.com>
References: <20220303151616.325444-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When invoked from the main loop, this function is the same
as qemu_mutex_iothread_locked, and returns true if the BQL is held.
When invoked from iothreads or tests, it returns true only
if the current AioContext is the Main Loop.

This essentially just extends qemu_mutex_iothread_locked to work
also in unit tests or other users like storage-daemon, that run
in the Main Loop but end up using the implementation in
stubs/iothread-lock.c.

Using qemu_mutex_iothread_locked in unit tests defaults to false
because they use the implementation in stubs/iothread-lock,
making all assertions added in next patches fail despite the
AioContext is still the main loop.

See the comment in the function header for more information.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/main-loop.h | 24 ++++++++++++++++++++++++
 softmmu/cpus.c           |  5 +++++
 stubs/iothread-lock.c    |  5 +++++
 3 files changed, 34 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 8dbc6fcb89..bc42b5939d 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -242,9 +242,33 @@ AioContext *iohandler_get_aio_context(void);
  * must always be taken outside other locks.  This function helps
  * functions take different paths depending on whether the current
  * thread is running within the main loop mutex.
+ *
+ * This function should never be used in the block layer, because
+ * unit tests, block layer tools and qemu-storage-daemon do not
+ * have a BQL.
+ * Please instead refer to qemu_in_main_thread().
  */
 bool qemu_mutex_iothread_locked(void);
 
+/**
+ * qemu_in_main_thread: return whether it's possible to safely access
+ * the global state of the block layer.
+ *
+ * Global state of the block layer is not accessible from I/O threads
+ * or worker threads; only from threads that "own" the default
+ * AioContext that qemu_get_aio_context() returns.  For tests, block
+ * layer tools and qemu-storage-daemon there is a designated thread that
+ * runs the event loop for qemu_get_aio_context(), and that is the
+ * main thread.
+ *
+ * For emulators, however, any thread that holds the BQL can act
+ * as the block layer main thread; this will be any of the actual
+ * main thread, the vCPU threads or the RCU thread.
+ *
+ * For clarity, do not use this function outside the block layer.
+ */
+bool qemu_in_main_thread(void);
+
 /**
  * qemu_mutex_lock_iothread: Lock the main loop mutex.
  *
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 035395ae13..422aa52746 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -480,6 +480,11 @@ bool qemu_mutex_iothread_locked(void)
     return iothread_locked;
 }
 
+bool qemu_in_main_thread(void)
+{
+    return qemu_mutex_iothread_locked();
+}
+
 /*
  * The BQL is taken from so many places that it is worth profiling the
  * callers directly, instead of funneling them all through a single function.
diff --git a/stubs/iothread-lock.c b/stubs/iothread-lock.c
index 5b45b7fc8b..ff7386e42c 100644
--- a/stubs/iothread-lock.c
+++ b/stubs/iothread-lock.c
@@ -6,6 +6,11 @@ bool qemu_mutex_iothread_locked(void)
     return false;
 }
 
+bool qemu_in_main_thread(void)
+{
+    return qemu_get_current_aio_context() == qemu_get_aio_context();
+}
+
 void qemu_mutex_lock_iothread_impl(const char *file, int line)
 {
 }
-- 
2.31.1


