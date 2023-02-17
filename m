Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A869AF1A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:10:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2NS-0004kf-FH; Fri, 17 Feb 2023 10:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NH-0004fo-Au
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NF-0007MN-0h
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2UYGn9QpFoYxPa048xNDTxh9AzE9v4f9aKDt/o+N5I=;
 b=V4RtqPLsOqLQMyZSpBiEGJRO8mZ0bsCfgaqOihqnV6Blzu37Cs1pmwIbIZjt5AWEwOrkPw
 Wgh03XzLMHJwgAYrR3teIrl60VvTSQm1VixciHRvTpuVwjVraZ62iI979DyKXDY/UePth6
 XqDjfILuIuS7MMDBtswW7kAZ00vOHUg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-OoYowb4VMcy87FyAX3UqtQ-1; Fri, 17 Feb 2023 10:10:02 -0500
X-MC-Unique: OoYowb4VMcy87FyAX3UqtQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FA2280D0FF;
 Fri, 17 Feb 2023 15:10:02 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49ABB492C14;
 Fri, 17 Feb 2023 15:10:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 02/22] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings in FreeBSD
Date: Fri, 17 Feb 2023 16:09:34 +0100
Message-Id: <20230217150954.283920-2-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

FreeBSD implements pthread headers using TSA (thread safety analysis)
annotations, therefore when an application is compiled with
-Wthread-safety there are some locking/annotation requirements that the
user of the pthread API has to follow.

This will also be the case in QEMU, since bsd-user/mmap.c uses the
pthread API. Therefore when building it with -Wthread-safety the
compiler will throw warnings because the functions are not properly
annotated. We need TSA to be enabled because it ensures that the
critical sections of an annotated variable are properly locked.

In order to make the compiler happy and avoid adding all the necessary
macros to all callers (lock functions should use TSA_ACQUIRE, while
unlock TSA_RELEASE, and this applies to all users of pthread_mutex_lock
and pthread_mutex_unlock), simply use TSA_NO_TSA to supppress such
warnings.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20230117135203.3049709-3-eesposit@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 bsd-user/qemu.h         | 5 +++--
 include/exec/exec-all.h | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 0ceecfb6df..4e7b8b1c06 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -36,6 +36,7 @@ extern char **environ;
 #include "target_os_signal.h"
 #include "target.h"
 #include "exec/gdbstub.h"
+#include "qemu/clang-tsa.h"
 
 /*
  * This struct is used to hold certain information about the image.  Basically,
@@ -234,8 +235,8 @@ int target_msync(abi_ulong start, abi_ulong len, int flags);
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
index 54585a9954..0e36f4d063 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #endif
 #include "qemu/interval-tree.h"
+#include "qemu/clang-tsa.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
@@ -759,8 +760,8 @@ static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
 }
 
 #if defined(CONFIG_USER_ONLY)
-void mmap_lock(void);
-void mmap_unlock(void);
+void TSA_NO_TSA mmap_lock(void);
+void TSA_NO_TSA mmap_unlock(void);
 bool have_mmap_lock(void);
 
 /**
-- 
2.39.2


