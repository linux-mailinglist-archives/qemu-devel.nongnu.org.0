Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A384E3E9B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:39:35 +0100 (CET)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdnS-00025p-Tb
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:39:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbH-0005Pv-61
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbE-0002fp-BQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647952015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdRSnVVqZ+dqsypANZakqWIZ1OZr6YbIfISstvIDBMU=;
 b=iF8cgzX2t/ZUIYznqn93h1+NOYsZCoUshldmSMYleEH32lTIy4yapp4GoDcx/2/Q8afLzF
 HZvP7wh/UZ9LKTJmp/W2A0suDYZHjES5zPYVwM9DKpdsekfHuKxnsaxIofeKd/uE/aw4LH
 DxwXW8aJnkgSER4FZXLys0kLmmUQfxk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-cwpj4IiRO-21kZgVYDuCyA-1; Tue, 22 Mar 2022 08:26:54 -0400
X-MC-Unique: cwpj4IiRO-21kZgVYDuCyA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD6C41044560;
 Tue, 22 Mar 2022 12:26:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABF9C401E90;
 Tue, 22 Mar 2022 12:26:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] Move HOST_LONG_BITS to compiler.h
Date: Tue, 22 Mar 2022 16:25:49 +0400
Message-Id: <20220322122601.927238-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This will help to make common code independent.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/compiler.h | 5 +++++
 include/qemu/osdep.h    | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 0a5e67fb970e..d9359859d435 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -7,6 +7,11 @@
 #ifndef COMPILER_H
 #define COMPILER_H
 
+#define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
+
+/* HOST_LONG_BITS is the size of a native pointer in bits. */
+#define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)
+
 #if defined __clang_analyzer__ || defined __COVERITY__
 #define QEMU_STATIC_ANALYSIS 1
 #endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 8b070dee21c4..9f06bf536fb1 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -244,9 +244,6 @@ extern "C" {
 #define TIME_MAX TYPE_MAXIMUM(time_t)
 #endif
 
-/* HOST_LONG_BITS is the size of a native pointer in bits. */
-#define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)
-
 /* Mac OSX has a <stdint.h> bug that incorrectly defines SIZE_MAX with
  * the wrong type. Our replacement isn't usable in preprocessor
  * expressions, but it is sufficient for our needs. */
-- 
2.35.1.273.ge6ebfd0e8cbb


