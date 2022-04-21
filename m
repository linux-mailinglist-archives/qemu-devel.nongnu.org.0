Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1254C50A1E7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:14:48 +0200 (CEST)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXa2-0007aC-T5
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDg-0004es-33
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXDe-0006D7-7t
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sfjP9Xnjt6boYf8jomJEEutGXaa/gWUk0KPTC0nSBac=;
 b=OEVTD4s7506CosJTObFYOlYBeeSBs9SlNZ+EDxg697vVToOYBP3Bl9lkwz59/U7xQLzAEe
 GGgNJ3mgAr6tyFLWjIqNgOvKtIwTHkczHtZJxJmjZxt0lA9Qa9D1w8EHW2f7fYZLrAeLgI
 ObA3rsx/ZQLAxRlmNT9ZCh9m0Mbclfg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-so9airaPOz6BQUEDIghBmw-1; Thu, 21 Apr 2022 09:51:35 -0400
X-MC-Unique: so9airaPOz6BQUEDIghBmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 128EB3C37F32;
 Thu, 21 Apr 2022 13:51:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE13C27DB5;
 Thu, 21 Apr 2022 13:51:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] compiler.h: add QEMU_SANITIZE_{ADDRESS,THREAD}
Date: Thu, 21 Apr 2022 17:49:29 +0400
Message-Id: <20220421134940.2887768-20-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Simplify a bit pre-compiler conditions.

For TSAN, QEMU already has CONFIG_TSAN, but it is only set when the
fiber API is present. (I wonder whether supporting TSAN without the
fiber API is really relevant)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-27-marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index f12c0fb581ec..f20a76e4a286 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -106,6 +106,14 @@
 #define __has_attribute(x) 0 /* compatibility with older GCC */
 #endif
 
+#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
+# define QEMU_SANITIZE_ADDRESS 1
+#endif
+
+#if defined(__SANITIZE_THREAD__) || __has_feature(thread_sanitizer)
+# define QEMU_SANITIZE_THREAD 1
+#endif
+
 /*
  * GCC doesn't provide __has_attribute() until GCC 5, but we know all the GCC
  * versions we support have the "flatten" attribute. Clang may not have the
-- 
2.36.0


