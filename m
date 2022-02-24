Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E634C3542
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:02:37 +0100 (CET)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJNr-00015L-JH
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:02:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ18-0001Fz-KS
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ13-0003Sy-G0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2z12ta4xtWfGl+Tz2GxV7yMJHecg9zDtt0Vhgl/N1oM=;
 b=Lr2iyKZ5BJ/28w939xDI+ZfCYMnQ2M2J6Q4pjMycfhRNJBf56pj6A8ypKJyUEZN2iwkuxM
 vYia3mP6Me322cW2L3H27sEC4pKlqKkX7BAqRlb2r27ooi9hzkSL5A64gXxV3UVFmpbSzX
 2qIeVbaGkJa31TxBgAcJTPE5gcPT89I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-00dvP6wgNSu7zFYvBRyqmw-1; Thu, 24 Feb 2022 13:38:31 -0500
X-MC-Unique: 00dvP6wgNSu7zFYvBRyqmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4547801AAD;
 Thu, 24 Feb 2022 18:38:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B19872B583;
 Thu, 24 Feb 2022 18:38:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] Simplify HOST_LONG_BITS
Date: Thu, 24 Feb 2022 22:36:56 +0400
Message-Id: <20220224183701.608720-8-marcandre.lureau@redhat.com>
In-Reply-To: <20220224183701.608720-1-marcandre.lureau@redhat.com>
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Simplify the macro, not depending on headers defines, but compiler
predefined __SIZEOF__POINTER__ only.

Available since gcc 4.3 and clang 2.8.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 74473867f3f6..cea7303c78a4 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -261,13 +261,7 @@ G_NORETURN extern void QEMU_ERROR("code path is reachable")
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


