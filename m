Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85750B316
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:40:28 +0200 (CEST)
Received: from localhost ([::1]:54206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhoq3-0007o6-Az
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhomZ-0004xQ-MQ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhomY-00062G-1T
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vah4EUzStvUTnkfPSApquSVUx2j9EU2xKdRMAG5/wUk=;
 b=Wv/R0jg3aU92f+GucfCu8y/s2d0zpGpCgScOxmbDni3g2fvISKIS2kuWWtnBl0AGbZLtgH
 RLeFL5btRnchLeJp1eO1TL6VuHeZTpDdes1hY9lC35NH87rUEtuQH65VXdD4HGDjgFGdNF
 y/MuvcnfaggeGCA/A+oDGQMZ/4VYq+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-qlqzq_toNK-J4qOInb1GEQ-1; Fri, 22 Apr 2022 04:36:47 -0400
X-MC-Unique: qlqzq_toNK-J4qOInb1GEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 646B0185A7B2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:36:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83455145BA47;
 Fri, 22 Apr 2022 08:36:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] Use QEMU_SANITIZE_THREAD
Date: Fri, 22 Apr 2022 12:36:30 +0400
Message-Id: <20220422083639.3156978-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/qemu/atomic.h                        | 8 +++++---
 subprojects/libvhost-user/include/compiler.h | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)
 create mode 120000 subprojects/libvhost-user/include/compiler.h

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 112a29910bea..7e8fc8e7cde2 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -15,6 +15,8 @@
 #ifndef QEMU_ATOMIC_H
 #define QEMU_ATOMIC_H
 
+#include "compiler.h"
+
 /* Compiler barrier */
 #define barrier()   ({ asm volatile("" ::: "memory"); (void)0; })
 
@@ -81,7 +83,7 @@
  * no processors except Alpha need a barrier here.  Leave it in if
  * using Thread Sanitizer to avoid warnings, otherwise optimize it away.
  */
-#if defined(__SANITIZE_THREAD__)
+#ifdef QEMU_SANITIZE_THREAD
 #define smp_read_barrier_depends()   ({ barrier(); __atomic_thread_fence(__ATOMIC_CONSUME); })
 #elif defined(__alpha__)
 #define smp_read_barrier_depends()   asm volatile("mb":::"memory")
@@ -146,7 +148,7 @@
 /* See above: most compilers currently treat consume and acquire the
  * same, but this slows down qatomic_rcu_read unnecessarily.
  */
-#ifdef __SANITIZE_THREAD__
+#ifdef QEMU_SANITIZE_THREAD
 #define qatomic_rcu_read__nocheck(ptr, valptr)           \
     __atomic_load(ptr, valptr, __ATOMIC_CONSUME);
 #else
@@ -254,7 +256,7 @@
 #define qatomic_mb_read(ptr)                             \
     qatomic_load_acquire(ptr)
 
-#if !defined(__SANITIZE_THREAD__) && \
+#if !defined(QEMU_SANITIZE_THREAD) && \
     (defined(__i386__) || defined(__x86_64__) || defined(__s390x__))
 /* This is more efficient than a store plus a fence.  */
 # define qatomic_mb_set(ptr, i)  ((void)qatomic_xchg(ptr, i))
diff --git a/subprojects/libvhost-user/include/compiler.h b/subprojects/libvhost-user/include/compiler.h
new file mode 120000
index 000000000000..de7b70697cd2
--- /dev/null
+++ b/subprojects/libvhost-user/include/compiler.h
@@ -0,0 +1 @@
+../../../include/qemu/compiler.h
\ No newline at end of file
-- 
2.36.0


