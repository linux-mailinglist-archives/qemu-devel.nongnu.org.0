Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A644545B48D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 07:51:25 +0100 (CET)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpm7n-000822-Ll
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 01:51:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm1V-0004Bb-Tw
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:44:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm1S-0004lf-2E
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:44:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xiTos55A0ypbNBhJ1wDIHq4nHbZ6g+YBGsaeillj6wI=;
 b=NaBIsGzMN/WRlE7eC4MfnLsCikggjnZKuwFBfJPEdxwQHgggiWrXaAXzHRU45zy5p78JFC
 8vb9rBununft58nS8wb/k2dldG7/WH2Ng/zoHiKHHzzTWWFUp9BDFU47cI7Nt69EmzHdBB
 t/2voxAOUnDTXAxiGSrvzdI1bbAoQpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-jLmCaAByMySOGQNFS2S-Uw-1; Wed, 24 Nov 2021 01:44:48 -0500
X-MC-Unique: jLmCaAByMySOGQNFS2S-Uw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 342651DDE6;
 Wed, 24 Nov 2021 06:44:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0541060843;
 Wed, 24 Nov 2021 06:44:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 01/31] main-loop.h: introduce qemu_in_main_thread()
Date: Wed, 24 Nov 2021 01:43:48 -0500
Message-Id: <20211124064418.3120601-2-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
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

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/main-loop.h | 13 +++++++++++++
 softmmu/cpus.c           |  5 +++++
 stubs/iothread-lock.c    |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 8dbc6fcb89..6b8fa57c5d 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -245,6 +245,19 @@ AioContext *iohandler_get_aio_context(void);
  */
 bool qemu_mutex_iothread_locked(void);
 
+/**
+ * qemu_in_main_thread: same as qemu_mutex_iothread_locked when
+ * softmmu/cpus.c implementation is linked. Otherwise this function
+ * checks that the current AioContext is the global AioContext
+ * (main loop).
+ *
+ * This is useful when checking that the BQL is held, to avoid
+ * returning false when invoked by unit tests or other users like
+ * storage-daemon that end up using stubs/iothread-lock.c
+ * implementation.
+ */
+bool qemu_in_main_thread(void);
+
 /**
  * qemu_mutex_lock_iothread: Lock the main loop mutex.
  *
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840..3f61a3c31d 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -481,6 +481,11 @@ bool qemu_mutex_iothread_locked(void)
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
2.27.0


