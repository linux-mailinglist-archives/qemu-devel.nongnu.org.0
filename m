Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2B4BA022
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:29:50 +0100 (CET)
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfuv-0002VM-6Y
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:29:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTD-0008ES-IV
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTC-0001eu-1D
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLkvJRjLKNBuAEw2de7FXHN2e3+VFXy5HXa+jAEnO9Y=;
 b=bYub0DGcbSfWWpXDrRyoVsiYanYA2WPqq+FKb+d6yya2Q5EWy6dInAAY8AKExHE9trTYuA
 6xy8qLr86et44AoxiWTeQjSS5meTbxiJGa/mnyDBN5lcU84dgonEcQ8Yp+7fCnWCBe3On7
 Xydn7jpYXEjq2eUJCsG34Yi/3prpehA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-6Vcv8Q64Pzy6p1QjZgrqzw-1; Thu, 17 Feb 2022 07:01:06 -0500
X-MC-Unique: 6Vcv8Q64Pzy6p1QjZgrqzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 706FE1091DA2;
 Thu, 17 Feb 2022 12:01:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6513327CD2;
 Thu, 17 Feb 2022 12:01:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] ui/console: egl-headless is compatible with non-gl
 listeners
Date: Thu, 17 Feb 2022 15:58:23 +0400
Message-Id: <20220217115829.2314347-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
 kraxel@redhat.com, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fix a regression introduced by commit 5e79d516e ("ui: split the GL
context in a different object").

Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/egl-headless.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 9aff115280bc..7a30fd977765 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -170,6 +170,14 @@ static bool
 egl_is_compatible_dcl(DisplayGLCtx *dgc,
                       DisplayChangeListener *dcl)
 {
+    if (!dcl->ops->dpy_gl_update) {
+        /*
+         * egl-headless is compatible with all 2d listeners, as it blits the GL
+         * updates on the 2d console surface.
+         */
+        return true;
+    }
+
     return dcl->ops == &egl_ops;
 }
 
-- 
2.34.1.428.gdcc0cd074f0c


