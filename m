Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC84C3534
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:57:17 +0100 (CET)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJIh-0001wo-N1
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:57:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ0X-000150-OH
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ0K-0003Py-JG
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcjvjcaDtVmzu8OGH23h2GJ6X2ENvGSrBr5zKq8PWRY=;
 b=WVkWgXydtpyO/BsRXWGSuFQzrEA/73bA7BWvROaGAyxNVrHpVgiHUDX4d5ATeXY2eSk2Dv
 5dG1DuTnOQMyObOF4x8ulMobSIcE08gzZVDNbqFQK9IGN2PX7eOPMdtAY6UMIFMvj3PIz4
 2+Z0GHrwJKWtD1aYjktByHypvB98elk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-PQKB3HKyM0-ceOkyz1VBTA-1; Thu, 24 Feb 2022 13:38:14 -0500
X-MC-Unique: PQKB3HKyM0-ceOkyz1VBTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EBE91006AA6;
 Thu, 24 Feb 2022 18:38:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EF052B448;
 Thu, 24 Feb 2022 18:38:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib workaround
Date: Thu, 24 Feb 2022 22:36:54 +0400
Message-Id: <20220224183701.608720-6-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124;
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This workaround was added in commit 95df51a4 ("w32: Always use standard
instead of native format strings"), as it claimed glib was using
__printf__ attribute. This is surprising, since glib has always used
G_GNUC_PRINTF which, as the name implies, uses __gnu_printf__ when
possible.

Apparently, the workaound is no longer relevant though, I don't see
the warnings.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 2704c314dcac..eb29b72c14d7 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -73,14 +73,6 @@
 #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
                                    sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
 
-#if !defined(__clang__) && defined(_WIN32)
-/*
- * Map __printf__ to __gnu_printf__ because we want standard format strings even
- * when MinGW or GLib include files use __printf__.
- */
-# define __printf__ __gnu_printf__
-#endif
-
 #ifndef __has_warning
 #define __has_warning(x) 0 /* compatibility with non-clang compilers */
 #endif
-- 
2.35.1.273.ge6ebfd0e8cbb


