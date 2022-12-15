Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197C64DFEA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 18:44:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5sHS-0002TW-4K; Thu, 15 Dec 2022 12:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5sHN-0002SL-Rm
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:44:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5sHK-0001ET-Ct
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671126257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mIKTm/+KdI/wbQkhjFpIrJY+9bn3DtX7y7zX4wc7ww=;
 b=X1g2wjH+UmkYPpHv5UhICXVo9s6YQcZrOENECAM+x7m1J9zWNee+0E83yEcn45Y59ELTw2
 djNg9SUPAuRFxGl9Gv57QquUTr/F8Vx8Q1KsUjhfD455zbn/0vr5GywBGUFoF05F6NiIbP
 +G46mx1yshR7RIaZ0NC6nRAf/60xbDQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-Ao3bKXLTNQuLH-5j-U9NGg-1; Thu, 15 Dec 2022 12:44:16 -0500
X-MC-Unique: Ao3bKXLTNQuLH-5j-U9NGg-1
Received: by mail-wm1-f70.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso4273wmh.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 09:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mIKTm/+KdI/wbQkhjFpIrJY+9bn3DtX7y7zX4wc7ww=;
 b=iWsgJmZi0NKzmp2i1RLmMX9Tp83qQeQEM6LsdujyKjM1yatGkiUnbV8jmoM6WRZKIH
 J4n5eaUW9TM4rO9p07DHl6nIYo9qmv+y+2hsLJaF+6IPhsNoZcX+83PPVIpBXxcS1pEx
 5mUwGgdE4b4ymNmR4zu1wUhrq9oFxyuwnPvSjomCp8+zmqs8+v2KTxxfe7eBTnyQBT14
 Q10f3EjOrICpXohb+A4kQALlkwRjABtVv3Olv8dx3NGxEwfY161xedDEXU74QkiN4rMU
 lJ/+F50DU0ifr3b8KuN9e3dg57h9Ayrfzg52I+OdV1bO9tVM+WLdk32f1UoOe03ON2/Z
 eCiA==
X-Gm-Message-State: ANoB5pnVi84NV4kpl0RlIwJAtMaHPHd53s4tzv99V4eQFb8/clXH0qSm
 ZcFScR45DBIqRqLfAfA+JSjiXyIriI41RDVBuyGY4Q53IOm4SZHNz6izMY3BTZQawqzL5EbDcW9
 8lqnFME9/eCD2E05i2X0SLm8HDrai9Mr2EZnasBIHfKN/F9cN40fheBHfduO43n7ZXcA=
X-Received: by 2002:a05:600c:3549:b0:3c6:e61e:ae8c with SMTP id
 i9-20020a05600c354900b003c6e61eae8cmr30941823wmq.28.1671126254309; 
 Thu, 15 Dec 2022 09:44:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf75eGCOGbN+4uJXChElCP2HAxIROl3Kve/LnxGuekxsU4sumzfhLsqygaPsYXshvefNjneHJw==
X-Received: by 2002:a05:600c:3549:b0:3c6:e61e:ae8c with SMTP id
 i9-20020a05600c354900b003c6e61eae8cmr30941805wmq.28.1671126253977; 
 Thu, 15 Dec 2022 09:44:13 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c501e00b003cf4d99fd2asm7354198wmr.6.2022.12.15.09.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 09:44:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: afaria@redhat.com,
	qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 2/2] block: Add no_coroutine_fn and coroutine_mixed_fn marker
Date: Thu, 15 Dec 2022 18:44:07 +0100
Message-Id: <20221215174407.500414-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221215174407.500414-1-pbonzini@redhat.com>
References: <20221215174407.500414-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

These can be used for example with the vrc tool from
https://github.com/bonzini/vrc:

    # find functions that *really* cannot be called from no_coroutine_fn
    (vrc) load --loader clang libblock.fa.p/meson-generated_.._block_block-gen.c.o
    # The comma is an "AND".  The "path" here consists of a single node
    (vrc) paths [no_coroutine_fn,!coroutine_mixed_fn]
    bdrv_remove_persistent_dirty_bitmap
    bdrv_create
    bdrv_can_store_new_dirty_bitmap

    # find how coroutine_fns end up calling a mixed function
    (vrc) load --loader clang --force libblock.fa.p/*.c.o
    # regular expression search
    (vrc) paths [coroutine_fn] [!no_coroutine_fn]* [coroutine_mixed_fn]
    ...
    bdrv_pread <- vhdx_log_write <- vhdx_log_write_and_flush <- vhdx_co_writev
    ...

Signed-off-by: Alberto Faria <afaria@redhat.com>
[Rebase, add coroutine_mixed_fn. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/block-common.h | 11 +++++++----
 include/qemu/coroutine.h     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 4749c46a5e7e..cce79bd00135 100644
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
index b0c97f6fb7ad..5f5ab8136a3a 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -28,6 +28,27 @@
  * These functions are re-entrant and may be used outside the global mutex.
  */
 
+/**
+ * Mark a function that can suspend when executed in coroutine context,
+ * but can handle running in non-coroutine context too.
+ *
+ * Functions that execute in coroutine context cannot be called directly from
+ * normal functions.  In the future it would be nice to enable compiler or
+ * static checker support for catching such errors.  This annotation might make
+ * it possible and in the meantime it serves as documentation.
+ *
+ * For example:
+ *
+ *   static void coroutine_fn foo(void) {
+ *       ....
+ *   }
+ */
+#ifdef __clang__
+#define coroutine_mixed_fn __attribute__((__annotate__("coroutine_mixed_fn")))
+#else
+#define coroutine_mixed_fn
+#endif
+
 /**
  * Mark a function that executes in coroutine context
  *
@@ -48,6 +69,18 @@
 #define coroutine_fn
 #endif
 
+/**
+ * Mark a function that should never be called from a coroutine context
+ *
+ * This typically means that there is an analogous, coroutine_fn function that
+ * should be used instead.
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


