Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473C12F4285
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 04:31:18 +0100 (CET)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzWsP-0007on-Ap
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 22:31:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kzWr5-00076e-L4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 22:29:55 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:33752 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kzWr3-0007lk-4L
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 22:29:55 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C0645412FC;
 Wed, 13 Jan 2021 03:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1610508588; x=
 1612322989; bh=kp5dFxIcIBZu7xl47ldJ3t9jE42yKrH7/RPBI9fOeME=; b=A
 FUfarRMD0lkL0cxPuB4Y1O3zqu/E4xcfEB4SoxG31fDuEltFhI7LBdHztjcyT4RR
 iEjr9R4evbh6mWHYT51p7Olb9VZMHE1uv+eg+AkO/pZ8PREC8B8Mufws9RzhgKPb
 18K6WYF6imoNKjkM+MqvlWLMOah1W/Bw3qYfl5LWTU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdoNP_-VX4Wj; Wed, 13 Jan 2021 06:29:48 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8636D411F9;
 Wed, 13 Jan 2021 06:29:48 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 13
 Jan 2021 06:29:48 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3] tcg: Fix execution on Apple Silicon
Date: Wed, 13 Jan 2021 06:28:07 +0300
Message-ID: <20210113032806.18220-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pages can't be both write and executable at the same time on Apple
Silicon. macOS provides public API to switch write protection [1] for
JIT applications, like TCG.

1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
v2: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00146.html
Changes since v2:
 - Wrapped pthread_jit_write_protect_np() with __builtin_available() [1]
   to allow build with modern SDK while targeting older macOS (Joelle)
 - Dropped redundant calls to pthread_jit_write_protect_supported_np()
   (Alex)

v1: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00073.html
Changes since v1:

 - Pruned not needed fiddling with W^X and dropped symmetry from write
   lock/unlock and renamed related functions.
   Similar approach is used in JavaScriptCore [2].

 - Moved jit helper functions to util/osdep
																		  As outlined in osdep.h, this matches to (2):
   * In an ideal world this header would contain only:
   *  (1) things which everybody needs
   *  (2) things without which code would work on most platforms but
   *      fail to compile or misbehave on a minority of host OSes

 - Fixed a checkpatch error

 - Limit new behaviour only to macOS 11.0 and above, because of the
   following declarations:

   __API_AVAILABLE(macos(11.0))
   __API_UNAVAILABLE(ios, tvos, watchos)
   void pthread_jit_write_protect_np(int enabled);

   __API_AVAILABLE(macos(11.0))
   __API_UNAVAILABLE(ios, tvos, watchos)
   int pthread_jit_write_protect_supported_np(void);

 1. https://developer.apple.com/videos/play/wwdc2017/411/
 2. https://bugs.webkit.org/attachment.cgi?id=402515&action=prettypatch

 accel/tcg/cpu-exec.c      |  2 ++
 accel/tcg/translate-all.c |  9 +++++++++
 include/qemu/osdep.h      |  7 +++++++
 tcg/tcg.c                 |  1 +
 util/osdep.c              | 20 ++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e0df9b6a1d..014810bf0a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -185,6 +185,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     }
 #endif /* DEBUG_DISAS */
 
+    qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
     /*
@@ -405,6 +406,7 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 {
     uintptr_t old;
 
+    qemu_thread_jit_write();
     assert(n < ARRAY_SIZE(tb->jmp_list_next));
     qemu_spin_lock(&tb_next->jmp_lock);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9de6ff9dd..f5f4c7cc17 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1083,6 +1083,12 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
 {
     void *buf;
 
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+    if (__builtin_available(macOS 11.0, *)) {
+        flags |= MAP_JIT;
+    }
+#endif
     buf = mmap(NULL, size, prot, flags, -1, 0);
     if (buf == MAP_FAILED) {
         error_setg_errno(errp, errno,
@@ -1669,7 +1675,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
 static void tb_phys_invalidate__locked(TranslationBlock *tb)
 {
+    qemu_thread_jit_write();
     do_tb_phys_invalidate(tb, true);
+    qemu_thread_jit_execute();
 }
 
 /* invalidate one TB
@@ -1871,6 +1879,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 #endif
 
     assert_memory_lock();
+    qemu_thread_jit_write();
 
     phys_pc = get_page_addr_code(env, pc);
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..929e970b0e 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -123,6 +123,10 @@ extern int daemon(int, int);
 #include "sysemu/os-posix.h"
 #endif
 
+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+#endif
+
 #include "glib-compat.h"
 #include "qemu/typedefs.h"
 
@@ -686,4 +690,7 @@ char *qemu_get_host_name(Error **errp);
  */
 size_t qemu_get_host_physmem(void);
 
+void qemu_thread_jit_write(void);
+void qemu_thread_jit_execute(void);
+
 #endif
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 472bf1755b..16b044eae7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1112,6 +1112,7 @@ void tcg_prologue_init(TCGContext *s)
     s->pool_labels = NULL;
 #endif
 
+    qemu_thread_jit_write();
     /* Generate the prologue.  */
     tcg_target_qemu_prologue(s);
 
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..e211939a0c 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -606,3 +606,23 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
     return readv_writev(fd, iov, iov_cnt, true);
 }
 #endif
+
+#if defined(MAC_OS_VERSION_11_0) && \
+    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+void qemu_thread_jit_execute(void)
+{
+    if (__builtin_available(macOS 11.0, *)) {
+        pthread_jit_write_protect_np(true);
+    }
+}
+
+void qemu_thread_jit_write(void)
+{
+    if (__builtin_available(macOS 11.0, *)) {
+        pthread_jit_write_protect_np(false);
+    }
+}
+#else
+void qemu_thread_jit_write(void) {}
+void qemu_thread_jit_execute(void) {}
+#endif
-- 
2.30.0


