Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8508F4D9A3F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:20:01 +0100 (CET)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5Dc-0006Vv-KU
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:20:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nU52Q-0004Xr-SN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nU52P-0005iW-Aq
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647342504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbbUg//qRoFA4XnRL+atwQNCbvmj6ejSuiXPrARpYxE=;
 b=B+IdURglmZJRlkPxMnRE7aNzJ7NWX8gijmQtnjpOBGdFb9gvqa1jY3G9AKdiATa7qUNbFE
 XcWx3vdCWpXeE6vW9lHwxWQbjiaNVRCry7DJTxw8e6Rne+jDukAOYG1uFhu/Y7KkqjGpUp
 pw2ypdde1fESzDXBn5fUF+7Gz4Wzvcw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-B8QurfghNgmowbhEeb_1Jw-1; Tue, 15 Mar 2022 07:08:21 -0400
X-MC-Unique: B8QurfghNgmowbhEeb_1Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9701D1C01E87;
 Tue, 15 Mar 2022 11:08:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52A414010A01;
 Tue, 15 Mar 2022 11:08:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/12] ui/console: egl-headless is compatible with non-gl
 listeners
Date: Tue, 15 Mar 2022 15:07:30 +0400
Message-Id: <20220315110739.2095676-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
References: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fix a regression introduced by commit 5e79d516e ("ui: split the GL
context in a different object").

Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.35.1.273.ge6ebfd0e8cbb


