Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373A54E3EDC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:55:16 +0100 (CET)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWe2d-00070q-9z
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:55:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbF-0005Pr-UU
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdbE-0002fC-B2
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647952010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a0Ug6BcKbKxS45V8dZYSmqaHnuxwo5vyDgEZiDLY6s4=;
 b=Lb5Ur/BnaVehZcE3OowpS2s/FLGlwXxjGCErmQksePOhZH2mDMI3TH+1Jlgx41xD5o08cD
 PnNQuvXrQLGt0lZfZFSglql7nbQA6aJQK9qSftOmtckGyEwy1lraXZDkdBf74peDrCBWX/
 zOG7lCHfGoqjlSbtaX+3+b4GcVXTKh4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-CLtkCxJmMf-WGKn_0reRLw-1; Tue, 22 Mar 2022 08:26:49 -0400
X-MC-Unique: CLtkCxJmMf-WGKn_0reRLw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C4B73C14CCB;
 Tue, 22 Mar 2022 12:26:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EECB43E901;
 Tue, 22 Mar 2022 12:26:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] Simplify HOST_LONG_BITS
Date: Tue, 22 Mar 2022 16:25:48 +0400
Message-Id: <20220322122601.927238-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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
index f2274b24cbf5..8b070dee21c4 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -245,13 +245,7 @@ extern "C" {
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


