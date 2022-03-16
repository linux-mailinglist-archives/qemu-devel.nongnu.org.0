Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB424DAE10
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:07:33 +0100 (CET)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQZ2-0008Cc-8w
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:07:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLU-0000jz-O2
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLQ-0007ls-AS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xL6Hc29t1/j/SqgQUtNl/1KLENDgqdHPM9YtWt/3rZc=;
 b=aZmC4KTkGXM9Emp9hSnrfwn+LJlcuZcoClgUwBhkmq78oo0xmpp6UtWbWRvR+jdZdia/FJ
 Mj/RGbmDD9uqZxPIR6fc3ZnJjCWFQ8xWFMR7kl6OlCBftX+RZjR48pgwgWzfd87ghko4ip
 3bJQF3N2xakou1t8Gq5yQhTB+RbidoU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-MCxNz5CDMP-r0U79MPS9cA-1; Wed, 16 Mar 2022 05:53:25 -0400
X-MC-Unique: MCxNz5CDMP-r0U79MPS9cA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 870E33811F2D
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:53:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BEBA404C33F;
 Wed, 16 Mar 2022 09:53:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 12/27] Simplify HOST_LONG_BITS
Date: Wed, 16 Mar 2022 13:53:21 +0400
Message-Id: <20220316095321.2613682-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Simplify the macro, not depending on headers defines, but compiler
predefined __SIZEOF__POINTER__ only.

Available since gcc 4.3 and clang 2.8.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7175ee53a217..de0c0ab02f4d 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -251,13 +251,7 @@ extern "C" {
 #endif
 
 /* HOST_LONG_BITS is the size of a native pointer in bits. */
-#if UINTPTR_MAX == UINT32_MAX
-# define HOST_LONG_BITS 32
-#elif UINTPTR_MAX == UINT64_MAX
-# define HOST_LONG_BITS 64
-#else
-# error Unknown pointer size
-#endif
+#define HOST_LONG_BITS (__SIZEOF_POINTER__ * 8)
 
 /* Mac OSX has a <stdint.h> bug that incorrectly defines SIZE_MAX with
  * the wrong type. Our replacement isn't usable in preprocessor
-- 
2.35.1.273.ge6ebfd0e8cbb


