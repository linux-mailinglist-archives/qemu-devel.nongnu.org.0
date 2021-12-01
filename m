Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D54653AE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 18:11:06 +0100 (CET)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msT8L-0003on-KA
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 12:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzV-0000nz-DZ
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzR-0001Lz-1c
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638378112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXKxVIQfgEzUB9nZN8iSnmE7twiawSE6uxMym8yZJpU=;
 b=f70iKCUPcPx+rU9+yD6cHP7xVwtDNAvW33QRP5sEQI93ZNAqI6oOmCi+k2HuF9/IrwmhUz
 yebc+i7U3KdU6H6b9bsZhPKKV2RcenkovqssweWtwWUaC2vE3ow2wgZXENZeVRkB/TUrYo
 kpuzP7d7gOlzvl1AX0RytFdPwY0T5hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-Hw-YXYTPPui8UCe4dnfrsA-1; Wed, 01 Dec 2021 12:01:51 -0500
X-MC-Unique: Hw-YXYTPPui8UCe4dnfrsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C3483DEB4;
 Wed,  1 Dec 2021 17:01:28 +0000 (UTC)
Received: from localhost (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9825860C0F;
 Wed,  1 Dec 2021 17:01:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 4/4] cpus: use coroutine TLS macros for iothread_locked
Date: Wed,  1 Dec 2021 17:01:20 +0000
Message-Id: <20211201170120.286139-5-stefanha@redhat.com>
In-Reply-To: <20211201170120.286139-1-stefanha@redhat.com>
References: <20211201170120.286139-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_mutex_iothread_locked() may be used from coroutines. Standard
__thread variables cannot be used by coroutines. Use the coroutine TLS
macros instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 softmmu/cpus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840..b02d3211e1 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -474,11 +474,11 @@ bool qemu_in_vcpu_thread(void)
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
@@ -491,13 +491,13 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line)
 
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
2.33.1


