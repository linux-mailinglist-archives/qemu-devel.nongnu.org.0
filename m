Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4B4963A7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:17:50 +0100 (CET)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxXp-0002ex-Gv
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:17:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMc-0007Fk-EG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxMW-0007iW-7X
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lKET/CHADYOxeK1L9ugGUmIiq6t005bX20fB6EPZDQ=;
 b=XYbaWjPW1oWIr7CqvqQktrXLWrwYGH8zx+FkREsL+8AQxTb1ymLj73BqQDVxU1lB02vOag
 Q2YVqAQes/kVbgo7wPidrexEHCVWsx4s27GRmZp1Ah6Y/gGI5cEliTGQtkuIA++gZQPdTt
 kRBCgZgn3r+bY6Nw8hlimZEjnHCA3tM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-1jE_0TpoO8G7Nmq52N0gaw-1; Fri, 21 Jan 2022 12:06:04 -0500
X-MC-Unique: 1jE_0TpoO8G7Nmq52N0gaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC43C64083;
 Fri, 21 Jan 2022 17:06:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE31E7EBCA;
 Fri, 21 Jan 2022 17:05:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
Date: Fri, 21 Jan 2022 12:05:12 -0500
Message-Id: <20220121170544.2049944-2-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
index 23bca46b07..fd4e139289 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -485,6 +485,11 @@ bool qemu_mutex_iothread_locked(void)
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


