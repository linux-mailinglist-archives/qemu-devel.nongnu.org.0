Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B15215D08
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 19:25:39 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUs6-0007aV-8M
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 13:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jsUWU-0004Iv-HF
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 13:03:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40895
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jsUWS-0006fA-Pb
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 13:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594054995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3X7RJpzUMPF8J+wdkMnhsqm3/0vtWeM8YRC6/Q+/O3E=;
 b=ROVHa8k/9sUt8sXMEkHLNctvQnQybsdWlmcqUpWoc54xqktx+6W0p30LpJtbKk6NgGB1lZ
 afe1Cs09frHoQfVo6on4XcJ6hV+oeiqe/X5aK9QPlTP4WzrQ4XoL5mBZm8APlbPCCuHf7r
 81ak9kRVMHxFMzOIMDZBvf4FIvGQ3+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349--bm3n0sWPCmh5AtkpasTGQ-1; Mon, 06 Jul 2020 13:03:14 -0400
X-MC-Unique: -bm3n0sWPCmh5AtkpasTGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15428185B3B7;
 Mon,  6 Jul 2020 17:03:13 +0000 (UTC)
Received: from turbo.com (ovpn-114-213.ams2.redhat.com [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 244BB5BACD;
 Mon,  6 Jul 2020 17:03:10 +0000 (UTC)
From: Christophe de Dinechin <dinechin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] trace: Example of non-tracing recorder use
Date: Mon,  6 Jul 2020 19:02:55 +0200
Message-Id: <20200706170255.1165105-3-dinechin@redhat.com>
In-Reply-To: <20200706170255.1165105-1-dinechin@redhat.com>
References: <20200706170255.1165105-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is a simple example showing how the recorder can be used to
have one "topic" covering multiple entries. Here, the topic is "lock",
the idea being to have the latest lock changes for instance in case of
a crash or hang.

Here are a few use cases:

* Tracing  lock updates:
    RECORDER_TRACES=lock qemu
* Showing lock changes prior to a hang
    RECORDER_TRACES=lock qemu &
    # Wait until hang
    killall -USR2 qemu  # This will trigger a dump
* Graphic visualization of lock states:
    RECORDER_TRACES="lock=state,id" qemu &
    recorder_scope state
    # Hit the 't' key to toggle timing display
    # Hit the 'c' key to dump the screen data as CSV
    cat recorder_scope_data-1.csv

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 util/qemu-thread-common.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/util/qemu-thread-common.h b/util/qemu-thread-common.h
index 2af6b12085..0de07a471f 100644
--- a/util/qemu-thread-common.h
+++ b/util/qemu-thread-common.h
@@ -15,6 +15,9 @@
 
 #include "qemu/thread.h"
 #include "trace.h"
+#include "trace/recorder.h"
+
+RECORDER_DEFINE(lock, 16, "Lock state");
 
 static inline void qemu_mutex_post_init(QemuMutex *mutex)
 {
@@ -23,12 +26,14 @@ static inline void qemu_mutex_post_init(QemuMutex *mutex)
     mutex->line = 0;
 #endif
     mutex->initialized = true;
+    record(lock, "Init state %d for %p", -1, mutex);
 }
 
 static inline void qemu_mutex_pre_lock(QemuMutex *mutex,
                                        const char *file, int line)
 {
     trace_qemu_mutex_lock(mutex, file, line);
+    record(lock, "Locking state %d for %p", 1, mutex);
 }
 
 static inline void qemu_mutex_post_lock(QemuMutex *mutex,
@@ -39,6 +44,7 @@ static inline void qemu_mutex_post_lock(QemuMutex *mutex,
     mutex->line = line;
 #endif
     trace_qemu_mutex_locked(mutex, file, line);
+    record(lock, "Locked state %d for %p", 2, mutex);
 }
 
 static inline void qemu_mutex_pre_unlock(QemuMutex *mutex,
@@ -49,6 +55,7 @@ static inline void qemu_mutex_pre_unlock(QemuMutex *mutex,
     mutex->line = 0;
 #endif
     trace_qemu_mutex_unlock(mutex, file, line);
+    record(lock, "Unkocked state %d for %p", 0, mutex);
 }
 
 #endif
-- 
2.26.2


