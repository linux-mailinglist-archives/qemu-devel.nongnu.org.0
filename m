Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC046991F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:37:10 +0100 (CET)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF77-0002CU-Hn
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExR-0007l9-UC
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExO-00030Z-OT
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638800826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXKxVIQfgEzUB9nZN8iSnmE7twiawSE6uxMym8yZJpU=;
 b=K1hkS8Q/zXu/zYT9BF3mTdsIRXkvgp/eoqParorsGj6UQ1LSXFgukoj76ZMeo/pfL9zHYt
 oA/tbw8tNMuIMq3+LJ4+WatF+avt+yoqbp851mS1NAgptPYSsJUlhwK4G8cW9Sgae9t6Ho
 /dbKlToNBs1LaSHYY8st/G1EDo2R5js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-5Kqv5xUcPDG7npSO1FB7zA-1; Mon, 06 Dec 2021 09:27:03 -0500
X-MC-Unique: 5Kqv5xUcPDG7npSO1FB7zA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B66D5102CB3D;
 Mon,  6 Dec 2021 14:26:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B9F310023B8;
 Mon,  6 Dec 2021 14:26:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 4/4] cpus: use coroutine TLS macros for iothread_locked
Date: Mon,  6 Dec 2021 14:26:32 +0000
Message-Id: <20211206142632.116925-5-stefanha@redhat.com>
In-Reply-To: <20211206142632.116925-1-stefanha@redhat.com>
References: <20211206142632.116925-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Warner Losh <imp@bsdimp.com>,
 sguelton@redhat.com
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


