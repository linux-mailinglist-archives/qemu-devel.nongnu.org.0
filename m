Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DEF2DB391
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:23:18 +0100 (CET)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEyi-0006Ur-Sp
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXe-0003Ik-N7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXV-0001Y4-Si
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAqh/JUS8h5bYLu8ntXWEfqqxmikVEJupVuEAhoIFh8=;
 b=Zow+ubc1VqVEnGIY1jjb4YV8QsnLxjErRfg2yQUDLCgH1B/S6hG6fjjqhn4hzJPrUAu1N/
 v0UIKxmuvvQfax92CEtPDNReLcs5+frPF6Nc5PsPt0T9rNJXySZebeYMgXiumoJ73jKNno
 j45JFKtSOJ6pN8X33RPIvWiCIk0WWzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-ZQ9To5JTNFqzh_I4J8w3kQ-1; Tue, 15 Dec 2020 12:55:04 -0500
X-MC-Unique: ZQ9To5JTNFqzh_I4J8w3kQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 576438015D4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:55:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 056285D6BA;
 Tue, 15 Dec 2020 17:55:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/45] qemu/atomic: Drop special case for unsupported compiler
Date: Tue, 15 Dec 2020 12:54:32 -0500
Message-Id: <20201215175445.1272776-33-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit efc6c070aca ("configure: Add a test for the
minimum compiler version") the minimum compiler version
required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.

We can safely remove the special case introduced in commit
a281ebc11a6 ("virtio: add missing mb() on notification").

With clang 3.4, __ATOMIC_RELAXED is defined, so the chunk to
remove (which is x86-specific), isn't reached either.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201210134752.780923-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/atomic.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index c1d211a351..8f4b3a80fb 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -241,23 +241,6 @@
 
 #else /* __ATOMIC_RELAXED */
 
-/*
- * We use GCC builtin if it's available, as that can use mfence on
- * 32-bit as well, e.g. if built with -march=pentium-m. However, on
- * i386 the spec is buggy, and the implementation followed it until
- * 4.3 (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36793).
- */
-#if defined(__i386__) || defined(__x86_64__)
-#if !QEMU_GNUC_PREREQ(4, 4)
-#if defined __x86_64__
-#define smp_mb()    ({ asm volatile("mfence" ::: "memory"); (void)0; })
-#else
-#define smp_mb()    ({ asm volatile("lock; addl $0,0(%%esp) " ::: "memory"); (void)0; })
-#endif
-#endif
-#endif
-
-
 #ifdef __alpha__
 #define smp_read_barrier_depends()   asm volatile("mb":::"memory")
 #endif
-- 
2.26.2



