Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977AF4BDA59
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:46:00 +0100 (CET)
Received: from localhost ([::1]:35274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9wq-0002mY-12
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:45:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9hQ-0004mg-67
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9hJ-0003UM-MX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645453789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKyRJlhWijZAQl/G+XAwpjgnydnM+2Dax5jIraia9Kk=;
 b=cK/DWciQjAbVRrJwDlS8RccYKIiyHuL29bFDSEoXU1IBgESNPFJNzbDxfQfXajBr9S05G0
 FQupDTzKuuLGYfZqb6qqtv6h3qtoy34EuszSCzG6Q/XKiU3VCoeT79f3AMQOFxRODTtR7j
 wNOcvO6C4bGdSL+ojznuEgB8W2ZUfPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-jv3wiu26PkiqiYD9JzyNxQ-1; Mon, 21 Feb 2022 09:29:48 -0500
X-MC-Unique: jv3wiu26PkiqiYD9JzyNxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7522F45;
 Mon, 21 Feb 2022 14:29:46 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8160C7DE48;
 Mon, 21 Feb 2022 14:29:34 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] cpus: use coroutine TLS macros for iothread_locked
Date: Mon, 21 Feb 2022 14:29:07 +0000
Message-Id: <20220221142907.346035-5-stefanha@redhat.com>
In-Reply-To: <20220221142907.346035-1-stefanha@redhat.com>
References: <20220221142907.346035-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Serge Guelton <sguelton@redhat.com>
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
index 035395ae13..005a5c31ef 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -473,11 +473,11 @@ bool qemu_in_vcpu_thread(void)
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
@@ -490,13 +490,13 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line)
 
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
2.34.1


