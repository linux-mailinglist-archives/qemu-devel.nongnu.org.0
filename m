Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B3E66DF68
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmNs-0000wM-9I; Tue, 17 Jan 2023 08:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNo-0000uz-NT
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNn-0005vj-3i
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673963530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UurGh1jCzdqSeHri8S80knH++KQLQoCmKjvTof5uS8=;
 b=ABy/28Tzwjk+RCqDzqIb61Z1Aqq+uXjefcrLjtKgcs3+byN7i02loYfw6hnOuji8e5tsTN
 RmE+QAvFvBhk8JkoCz263sw/hTFQjyea+vEQlcuTjGx4f9ixLnoP8YWjmSRYfsLN7hIVXB
 r7qw85ewU+pxrckF1dSCj/ClRcQtOZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-3A2HjNXKMI-1NS5zBAZ6NA-1; Tue, 17 Jan 2023 08:52:07 -0500
X-MC-Unique: 3A2HjNXKMI-1NS5zBAZ6NA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A42458030CC;
 Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EAD71121318;
 Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
Date: Tue, 17 Jan 2023 08:52:02 -0500
Message-Id: <20230117135203.3049709-3-eesposit@redhat.com>
In-Reply-To: <20230117135203.3049709-1-eesposit@redhat.com>
References: <20230117135203.3049709-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU does not compile when enabling clang's thread safety analysis
(TSA),
because some functions create wrappers for pthread mutexes but do
not use any TSA macro. Therefore the compiler fails.

In order to make the compiler happy and avoid adding all the
necessary macros to all callers (lock functions should use
TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of pthread_mutex_lock/pthread_mutex_unlock),
simply use TSA_NO_TSA to supppress such warnings.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 bsd-user/qemu.h         | 5 +++--
 include/exec/exec-all.h | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index be6105385e..711fdd1b64 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -37,6 +37,7 @@ extern char **environ;
 #include "target_os_signal.h"
 #include "target.h"
 #include "exec/gdbstub.h"
+#include "qemu/clang-tsa.h"
 
 /*
  * This struct is used to hold certain information about the image.  Basically,
@@ -235,8 +236,8 @@ int target_msync(abi_ulong start, abi_ulong len, int flags);
 extern unsigned long last_brk;
 extern abi_ulong mmap_next_start;
 abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size);
-void mmap_fork_start(void);
-void mmap_fork_end(int child);
+void TSA_NO_TSA mmap_fork_start(void);
+void TSA_NO_TSA mmap_fork_end(int child);
 
 /* main.c */
 extern char qemu_proc_pathname[];
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 25e11b0a8d..4f0c0559ac 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #endif
 #include "qemu/interval-tree.h"
+#include "qemu/clang-tsa.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
@@ -758,8 +759,8 @@ static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
 }
 
 #if defined(CONFIG_USER_ONLY)
-void mmap_lock(void);
-void mmap_unlock(void);
+void TSA_NO_TSA mmap_lock(void);
+void TSA_NO_TSA mmap_unlock(void);
 bool have_mmap_lock(void);
 
 /**
-- 
2.39.0


