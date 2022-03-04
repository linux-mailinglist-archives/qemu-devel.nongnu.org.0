Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DA4CD99A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:01:36 +0100 (CET)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBJ9-0000sG-C9
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5a-0004se-Vs
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5Z-0007LH-Cq
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xnz9gUdPLjEfkILxFU1TG62D3jDVigV1WYKRGuoacbk=;
 b=Z7rLTrCUGkZdxXuGnlC/ktz2DOCETxVMjO2ANiURtK6Ln48KzWXNrcv2FkQy1KpQfX22mU
 4BCQuV+cAjZILpK3Lo32AzAmUwB75eJ7Zb5fdn9G5q0/d2z2w//GEkOsJ5fYvSCRs/a5Ly
 fH1F/qks5fJ+QD1GTL6DcnNxKDMLdDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-B1BSifLgOAWRjBHe_wFDLg-1; Fri, 04 Mar 2022 11:47:29 -0500
X-MC-Unique: B1BSifLgOAWRjBHe_wFDLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 948F0801DDC;
 Fri,  4 Mar 2022 16:47:28 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 995A983BF9;
 Fri,  4 Mar 2022 16:47:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/50] cpus: use coroutine TLS macros for iothread_locked
Date: Fri,  4 Mar 2022 17:46:30 +0100
Message-Id: <20220304164711.474713-10-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

qemu_mutex_iothread_locked() may be used from coroutines. Standard
__thread variables cannot be used by coroutines. Use the coroutine TLS
macros instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220222140150.27240-5-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 softmmu/cpus.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 035395ae13..d1ff3cfea1 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "monitor/monitor.h"
+#include "qemu/coroutine-tls.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
@@ -473,11 +474,11 @@ bool qemu_in_vcpu_thread(void)
     return current_cpu && qemu_cpu_is_self(current_cpu);
 }
 
-static __thread bool iothread_locked = false;
+QEMU_DEFINE_STATIC_CO_TLS(bool, iothread_locked)
 
 bool qemu_mutex_iothread_locked(void)
 {
-    return iothread_locked;
+    return get_iothread_locked();
 }
 
 /*
@@ -490,13 +491,13 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line)
 
     g_assert(!qemu_mutex_iothread_locked());
     bql_lock(&qemu_global_mutex, file, line);
-    iothread_locked = true;
+    set_iothread_locked(true);
 }
 
 void qemu_mutex_unlock_iothread(void)
 {
     g_assert(qemu_mutex_iothread_locked());
-    iothread_locked = false;
+    set_iothread_locked(false);
     qemu_mutex_unlock(&qemu_global_mutex);
 }
 
-- 
2.35.1


