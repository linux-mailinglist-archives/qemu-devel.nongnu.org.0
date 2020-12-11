Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9762D798D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:39:09 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkVg-0002D5-Ka
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHz-0004if-Bm
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHw-00065A-KZ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dIalpcSMDQ2tujojEC45a7JfPv9bzaYZwv1aq4jd5k=;
 b=b9v35EtlW+EpZrMhYDTU/R8o83p/QR0A6UTZJF/nYXGYTtXs5g7d9zV+ZsktXY5lw9es/U
 HyBUlKu155zKkdh+wsEwLy9rpxX3yQzd8HxqnqPj8ddJ+RnU6HH8DujYTSjAPljroBcmkU
 Sf26VK++pINtKSjLn/VLzPDSZ3WaQrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-rfd2RDYwOVyYJa1-OkicQQ-1; Fri, 11 Dec 2020 10:24:51 -0500
X-MC-Unique: rfd2RDYwOVyYJa1-OkicQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5261800D62;
 Fri, 11 Dec 2020 15:24:49 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8697B100239F;
 Fri, 11 Dec 2020 15:24:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 10/12] tcg/optimize: Add fallthrough annotations
Date: Fri, 11 Dec 2020 16:24:24 +0100
Message-Id: <20201211152426.350966-11-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
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
---
 include/qemu/compiler.h | 11 +++++++++++
 tcg/optimize.c          |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index c76281f354..d831a25da4 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -243,4 +243,15 @@ extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
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


