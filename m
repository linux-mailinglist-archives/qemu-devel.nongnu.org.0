Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB8675633
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:57:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrs4-0007li-91; Fri, 20 Jan 2023 08:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrs1-0007lC-JX
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:53 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pIrrz-0001mq-7b
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:55:53 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 7F3C45FD7A;
 Fri, 20 Jan 2023 16:48:06 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:8f3f:2197:162b:4096])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wlngUQ0WWiE1-JpDStUHs; Fri, 20 Jan 2023 16:48:05 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674222485; bh=0SRBKZnysXyosxKSj1Sfn7uJHGrM42Cqy1GYWxRXmZ4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=N1W66G29Vv1IVDcILYVKa2vHQp5I0QLHT92PQg8M+mMEVyGUN8j9MEYrRoQHBiCtC
 OVnLozDzG28W73BzwWTRKs/o4s9/frHeRPTOWXQOldecpThzkA3BEJOgkONWD6T2JE
 JKXxKISrXJK+WgTzySnttBJaTSGwZy+5gpC6hxHM=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
Subject: [PATCH 2/4] backends/hostmem: move memory region preallocation logic
 into a helper
Date: Fri, 20 Jan 2023 16:47:47 +0300
Message-Id: <20230120134749.550639-3-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

...so that we don't have to duplicate it in multiple places throughout
the file.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 backends/hostmem.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 747e7838c0..842bfa9eb7 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -216,10 +216,26 @@ static bool host_memory_backend_get_prealloc(Object *obj, Error **errp)
     return backend->prealloc;
 }
 
+static bool do_prealloc_mr(HostMemoryBackend *backend, Error **errp)
+{
+    Error *local_err = NULL;
+    int fd = memory_region_get_fd(&backend->mr);
+    void *ptr = memory_region_get_ram_ptr(&backend->mr);
+    uint64_t sz = memory_region_size(&backend->mr);
+
+    qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads,
+                      backend->prealloc_context, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return false;
+    }
+
+    return true;
+}
+
 static void host_memory_backend_set_prealloc(Object *obj, bool value,
                                              Error **errp)
 {
-    Error *local_err = NULL;
     HostMemoryBackend *backend = MEMORY_BACKEND(obj);
 
     if (!backend->reserve && value) {
@@ -233,17 +249,7 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
     }
 
     if (value && !backend->prealloc) {
-        int fd = memory_region_get_fd(&backend->mr);
-        void *ptr = memory_region_get_ram_ptr(&backend->mr);
-        uint64_t sz = memory_region_size(&backend->mr);
-
-        qemu_prealloc_mem(fd, ptr, sz, backend->prealloc_threads,
-                          backend->prealloc_context, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
-        backend->prealloc = true;
+        backend->prealloc = do_prealloc_mr(backend, errp);
     }
 }
 
@@ -399,12 +405,8 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
          * specified NUMA policy in place.
          */
         if (backend->prealloc) {
-            qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
-                              backend->prealloc_threads,
-                              backend->prealloc_context, &local_err);
-            if (local_err) {
-                goto out;
-            }
+            do_prealloc_mr(backend, errp);
+            return;
         }
     }
 out:
-- 
2.25.1


