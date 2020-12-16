Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7237D2DC585
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:42:43 +0100 (CET)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpap0-0004sJ-HA
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpadE-0000CX-7q
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpad2-00017S-Nv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgAzG+5FM79lHfJRIIMj/P/qXojudU28ll/oBXTxbeo=;
 b=aIt40cp1xgVkM6HVbg76CDKRVhTR3r3B38PvPQUVfVqPsNnDsGfWcq3wh9B/X4yrWf6ywB
 l+Ei33m77GysEaEjuOiePiBOcTL7VvrjEFY5ucPetpKVthv1BIbbqAQOKQZWeoeuvXi6ku
 Hm2fUDWfGXGbArNw2MhI//Zg8syeWbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-bLk2IA_sNcmG6uID8gcp-A-1; Wed, 16 Dec 2020 12:30:17 -0500
X-MC-Unique: bLk2IA_sNcmG6uID8gcp-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553BB10054FF;
 Wed, 16 Dec 2020 17:30:16 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7777410023B2;
 Wed, 16 Dec 2020 17:30:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/12] tcg/optimize: Add fallthrough annotations
Date: Wed, 16 Dec 2020 18:29:47 +0100
Message-Id: <20201216172949.57380-11-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to compile this file with -Werror=implicit-fallthrough,
we need to add some fallthrough annotations to the case statements
that might fall through. Unfortunately, the typical "/* fallthrough */"
comments do not work here as expected since some case labels are
wrapped in macros and the compiler fails to match the comments in
this case. But using __attribute__((fallthrough)) seems to work fine,
so let's use that instead (by introducing a new QEMU_FALLTHROUGH
macro in our compiler.h header file).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201211152426.350966-11-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/compiler.h | 11 +++++++++++
 tcg/optimize.c          |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 1b9e58e82b..df9ec08f8a 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -222,4 +222,15 @@ extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
 #define qemu_build_not_reached()  g_assert_not_reached()
 #endif
 
+/**
+ * In most cases, normal "fallthrough" comments are good enough for
+ * switch-case statements, but sometimes the compiler has problems
+ * with those. In that case you can use QEMU_FALLTHROUGH instead.
+ */
+#if __has_attribute(fallthrough)
+# define QEMU_FALLTHROUGH __attribute__((fallthrough))
+#else
+# define QEMU_FALLTHROUGH do {} while (0) /* fallthrough */
+#endif
+
 #endif /* COMPILER_H */
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 220f4601d5..7ca71de956 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -855,6 +855,7 @@ void tcg_optimize(TCGContext *s)
             if ((arg_info(op->args[1])->mask & 0x80) != 0) {
                 break;
             }
+            QEMU_FALLTHROUGH;
         CASE_OP_32_64(ext8u):
             mask = 0xff;
             goto and_const;
@@ -862,6 +863,7 @@ void tcg_optimize(TCGContext *s)
             if ((arg_info(op->args[1])->mask & 0x8000) != 0) {
                 break;
             }
+            QEMU_FALLTHROUGH;
         CASE_OP_32_64(ext16u):
             mask = 0xffff;
             goto and_const;
@@ -869,6 +871,7 @@ void tcg_optimize(TCGContext *s)
             if ((arg_info(op->args[1])->mask & 0x80000000) != 0) {
                 break;
             }
+            QEMU_FALLTHROUGH;
         case INDEX_op_ext32u_i64:
             mask = 0xffffffffU;
             goto and_const;
@@ -886,6 +889,7 @@ void tcg_optimize(TCGContext *s)
             if ((arg_info(op->args[1])->mask & 0x80000000) != 0) {
                 break;
             }
+            QEMU_FALLTHROUGH;
         case INDEX_op_extu_i32_i64:
             /* We do not compute affected as it is a size changing op.  */
             mask = (uint32_t)arg_info(op->args[1])->mask;
-- 
2.27.0


