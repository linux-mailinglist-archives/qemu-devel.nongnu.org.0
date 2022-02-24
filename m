Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DE94C353B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:00:00 +0100 (CET)
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJLJ-0005e0-3t
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ16-0001DP-GU
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ12-0003Sv-FR
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtNOEdwWKpLqi2UbwE3lGWljXHp3G//CjWttxxkxiCE=;
 b=RkbATFsbKsaKtzSN+Q2XnYpTXl3DwH4VQS5qq0gxF4gSMe3LSDmUe7sT95SZ/ADls/NNfH
 0l0F/tuiObHdbeDRHRLEe5oBRw9hc++fUnFYjegiwsoE91rztVCdnC7YDtBL604ohtqOwU
 i5MZFb4X1QyTSPy8vECZao7FduzgYIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-tTbXqoF1MhKg_sMGDjULHg-1; Thu, 24 Feb 2022 13:38:36 -0500
X-MC-Unique: tTbXqoF1MhKg_sMGDjULHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B244E1006AAA;
 Thu, 24 Feb 2022 18:38:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C04A31077CA4;
 Thu, 24 Feb 2022 18:38:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] Move HOST_LONG_BITS to compiler.h
Date: Thu, 24 Feb 2022 22:36:57 +0400
Message-Id: <20220224183701.608720-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220224183701.608720-1-marcandre.lureau@redhat.com>
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This will help to make common code independent.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 3 +++
 include/qemu/osdep.h    | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 8c7da00c56ba..553e49aac2ad 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -9,6 +9,9 @@
 
 #define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
 
+/* HOST_LONG_BITS is the size of a native pointer in bits. */
+#define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)
+
 #if defined __clang_analyzer__ || defined __COVERITY__
 #define QEMU_STATIC_ANALYSIS 1
 #endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index cea7303c78a4..4711aad22803 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -260,9 +260,6 @@ G_NORETURN extern void QEMU_ERROR("code path is reachable")
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


