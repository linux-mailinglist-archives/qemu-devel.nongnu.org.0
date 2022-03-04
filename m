Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E384CDD28
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:10:22 +0100 (CET)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDJl-0007on-1i
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:10:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDCk-0006gi-Fu
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDCg-0001IK-6v
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646420577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDyMCL+WNqokqeRg1184B87VJ2cSo0YlCiIByD/SOjg=;
 b=jA3/RBsFQNizonZs+/v/LW73QhvJ/V4oRL+oPOh/j7AVXeaOH0aHh/0zRsUG0PQfpGZ7wS
 Qg8DSSrbkBHEE/la9ZyQL40WyqfitZoksxyMKnR0ehSz7rOdyD0F54+33N7CMlniOXXVgp
 TKrOvdY3qrlLJCwPJGAN9efMB7QBMIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-nADfQsWNOHK0P7eo5IdJDQ-1; Fri, 04 Mar 2022 14:02:56 -0500
X-MC-Unique: nADfQsWNOHK0P7eo5IdJDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E14B824FB6;
 Fri,  4 Mar 2022 19:02:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2076860BF1;
 Fri,  4 Mar 2022 19:01:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] softmmu: remove is_daemonized() method
Date: Fri,  4 Mar 2022 18:56:20 +0000
Message-Id: <20220304185620.3272401-9-berrange@redhat.com>
In-Reply-To: <20220304185620.3272401-1-berrange@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are no longer any users of this method, so it can be removed to
prevent future accidental (mis)use.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/sysemu/os-posix.h | 2 --
 include/sysemu/os-win32.h | 5 -----
 os-posix.c                | 5 -----
 stubs/is-daemonized.c     | 9 ---------
 stubs/meson.build         | 1 -
 5 files changed, 22 deletions(-)
 delete mode 100644 stubs/is-daemonized.c

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 390f3f8396..2c375f5b49 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -57,8 +57,6 @@ int os_mlock(void);
 typedef struct timeval qemu_timeval;
 #define qemu_gettimeofday(tp) gettimeofday(tp, NULL)
 
-bool is_daemonized(void);
-
 /**
  * qemu_alloc_stack:
  * @sz: pointer to a size_t holding the requested usable stack size
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 4879f8731d..a81f4fa9c1 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -76,11 +76,6 @@ typedef struct {
 } qemu_timeval;
 int qemu_gettimeofday(qemu_timeval *tp);
 
-static inline bool is_daemonized(void)
-{
-    return false;
-}
-
 static inline int os_mlock(void)
 {
     return -ENOSYS;
diff --git a/os-posix.c b/os-posix.c
index f598a52a4f..bd1140ab22 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -232,11 +232,6 @@ void os_set_line_buffering(void)
     setvbuf(stdout, NULL, _IOLBF, 0);
 }
 
-bool is_daemonized(void)
-{
-    return daemonize;
-}
-
 int os_mlock(void)
 {
 #ifdef HAVE_MLOCKALL
diff --git a/stubs/is-daemonized.c b/stubs/is-daemonized.c
deleted file mode 100644
index 8f63325bb2..0000000000
--- a/stubs/is-daemonized.c
+++ /dev/null
@@ -1,9 +0,0 @@
-#include "qemu/osdep.h"
-
-/* Win32 has its own inline stub */
-#ifndef _WIN32
-bool is_daemonized(void)
-{
-    return false;
-}
-#endif
diff --git a/stubs/meson.build b/stubs/meson.build
index d359cbe1ad..3d092b808e 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -18,7 +18,6 @@ if linux_io_uring.found()
 endif
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
-stub_ss.add(files('is-daemonized.c'))
 if libaio.found()
   stub_ss.add(files('linux-aio.c'))
 endif
-- 
2.34.1


