Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDBE67548C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:32:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqU2-0002kk-Ec; Fri, 20 Jan 2023 07:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTz-0002gl-I5
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTu-0000Kp-RF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWHPNrzdrXRkrRqhNQxBcgPAcR2xy2ie5+GD9hhpLSA=;
 b=VaAsm6vPMQm/pw+QJITf5KQKZ92NMXhlZGE2WjsSj9rQSiLtjBA318gCZ4md2bBCg9GFpo
 PUcGFdgj5WlYFWDWy7fhXRZVZAkOtlxme9GBXDDzPKKDLTJ0du4F2FkBk6TSIpm1LHmivE
 6yO8d8T8XvKjtJEpGqDmUTP0gOMTUWE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-WlzwSMZAN72FczEL8ct7hA-1; Fri, 20 Jan 2023 07:26:43 -0500
X-MC-Unique: WlzwSMZAN72FczEL8ct7hA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BA462801E53;
 Fri, 20 Jan 2023 12:26:43 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 716C140C6EC4;
 Fri, 20 Jan 2023 12:26:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 05/38] block: Add no_coroutine_fn and coroutine_mixed_fn marker
Date: Fri, 20 Jan 2023 13:26:00 +0100
Message-Id: <20230120122633.84983-6-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Alberto Faria <afaria@redhat.com>

Add more annotations to functions, describing valid and invalid
calls from coroutine to non-coroutine context.

When applied to a function, no_coroutine_fn advertises that it should
not be called from coroutine_fn functions.  This can be because the
function blocks or, in the case of generated_co_wrapper, to enforce
that coroutine_fn functions directly call the coroutine_fn that backs
the generated_co_wrapper.

coroutine_mixed_fn instead is for function that can be called in
both coroutine and non-coroutine context, but will suspend when
called in coroutine context.  Annotating them is a first step
towards enforcing that non-annotated functions are absolutely
not going to suspend.

These can be used for example with the vrc tool:

    # find functions that *really* cannot be called from no_coroutine_fn
    (vrc) load --loader clang libblock.fa.p/meson-generated_.._block_block-gen.c.o
    (vrc) paths [no_coroutine_fn,!coroutine_mixed_fn]
    bdrv_remove_persistent_dirty_bitmap
    bdrv_create
    bdrv_can_store_new_dirty_bitmap

    # find how coroutine_fns end up calling a mixed function
    (vrc) load --loader clang --force libblock.fa.p/*.c.o
    (vrc) paths [coroutine_fn] [!no_coroutine_fn]* [coroutine_mixed_fn]
    ...
    bdrv_pread <- vhdx_log_write <- vhdx_log_write_and_flush <- vhdx_co_writev
    ...

Signed-off-by: Alberto Faria <afaria@redhat.com>
[Rebase, add coroutine_mixed_fn. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221216110758.559947-3-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-common.h | 11 ++++++----
 include/qemu/coroutine.h     | 39 ++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 4749c46a5e..cce79bd001 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -50,11 +50,14 @@
  * - co_wrapper_mixed_bdrv_rdlock are co_wrapper_mixed functions but
  *   automatically take and release the graph rdlock when creating a new
  *   coroutine.
+ *
+ * These functions should not be called from a coroutine_fn; instead,
+ * call the wrapped function directly.
  */
-#define co_wrapper
-#define co_wrapper_mixed
-#define co_wrapper_bdrv_rdlock
-#define co_wrapper_mixed_bdrv_rdlock
+#define co_wrapper                     no_coroutine_fn
+#define co_wrapper_mixed               no_coroutine_fn coroutine_mixed_fn
+#define co_wrapper_bdrv_rdlock         no_coroutine_fn
+#define co_wrapper_mixed_bdrv_rdlock   no_coroutine_fn coroutine_mixed_fn
 
 #include "block/dirty-bitmap.h"
 #include "block/blockjob.h"
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index b0c97f6fb7..569d7a5331 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -48,6 +48,45 @@
 #define coroutine_fn
 #endif
 
+/**
+ * Mark a function that can suspend when executed in coroutine context,
+ * but can handle running in non-coroutine context too.
+ */
+#ifdef __clang__
+#define coroutine_mixed_fn __attribute__((__annotate__("coroutine_mixed_fn")))
+#else
+#define coroutine_mixed_fn
+#endif
+
+/**
+ * Mark a function that should not be called from a coroutine context.
+ * Usually there will be an analogous, coroutine_fn function that should
+ * be used instead.
+ *
+ * When the function is also marked as coroutine_mixed_fn, the function should
+ * only be called if the caller does not know whether it is in coroutine
+ * context.
+ *
+ * Functions that are only no_coroutine_fn, on the other hand, should not
+ * be called from within coroutines at all.  This for example includes
+ * functions that block.
+ *
+ * In the future it would be nice to enable compiler or static checker
+ * support for catching such errors.  This annotation is the first step
+ * towards this, and in the meantime it serves as documentation.
+ *
+ * For example:
+ *
+ *   static void no_coroutine_fn foo(void) {
+ *       ....
+ *   }
+ */
+#ifdef __clang__
+#define no_coroutine_fn __attribute__((__annotate__("no_coroutine_fn")))
+#else
+#define no_coroutine_fn
+#endif
+
 typedef struct Coroutine Coroutine;
 
 /**
-- 
2.38.1


