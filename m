Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DE4BA011
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:26:09 +0100 (CET)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfrM-0006NJ-Q3
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfRn-0006Vc-V7
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:59:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfRm-0001FG-F0
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xd1wCtHOUdWyn1wICNVybJ+lJ9wf6hUnyrfwpvgaL18=;
 b=iH8sBHdpYROy43in0GjTfBq75CZ3PSukMolqPzQCUvBKbwZ/8WyY1ibtsGZGGi7f0lZ48J
 5KLAv6p57brLOwsvpZIzdn4ezpZ+bRh9u5Y7fJH8yjAl44zISK6JaJz7WvAgJ98A5mMvZW
 IE9aUu6YIUfP4T9ckqGtZhIrX2u95A8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-r9lW0J1fPEatWSOsSTpzSg-1; Thu, 17 Feb 2022 06:59:39 -0500
X-MC-Unique: r9lW0J1fPEatWSOsSTpzSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 098BF1853028;
 Thu, 17 Feb 2022 11:59:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A79773146;
 Thu, 17 Feb 2022 11:59:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] ui/console: fix texture leak when calling
 surface_gl_create_texture()
Date: Thu, 17 Feb 2022 15:58:19 +0400
Message-Id: <20220217115829.2314347-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Make surface_gl_create_texture() idempotent: if the surface is already
bound to a texture, do not create a new one.

This fixes texture leaks when there are multiple DBus listeners, for
example.

Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console-gl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/console-gl.c b/ui/console-gl.c
index 7c9894a51d99..8e3c9a3c8c01 100644
--- a/ui/console-gl.c
+++ b/ui/console-gl.c
@@ -49,6 +49,10 @@ void surface_gl_create_texture(QemuGLShader *gls,
     assert(gls);
     assert(QEMU_IS_ALIGNED(surface_stride(surface), surface_bytes_per_pixel(surface)));
 
+    if (surface->texture) {
+        return;
+    }
+
     switch (surface->format) {
     case PIXMAN_BE_b8g8r8x8:
     case PIXMAN_BE_b8g8r8a8:
-- 
2.34.1.428.gdcc0cd074f0c


