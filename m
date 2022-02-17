Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE494B9FE3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:14:42 +0100 (CET)
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfgH-0001xA-A1
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:14:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTf-0000BV-Ms
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTV-0001g6-Ls
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yyXhf8G9dzE4M0R0S2f9nB5x+AV4ZbUq+v95MQcfIwg=;
 b=iiyDHYksdOHE6jXyl9a4TdKsngMCWW+g4i1lQQMZyC0WziOp+/QsvYS+eqktpxNcCrSjHT
 jeBVh3BmEg6pN4W2A9WnRnLbb9FZn8zHEVlFA4X2iwFCHoUdzZyj5eI2bI7j9bBTQ8TN32
 7uNyCfeMJ0OcbLnvh09FUgYuSK9VZHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-TLe_ED54PyeTMLpWNH8xpA-1; Thu, 17 Feb 2022 07:01:21 -0500
X-MC-Unique: TLe_ED54PyeTMLpWNH8xpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C1481091DA1;
 Thu, 17 Feb 2022 12:01:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 350ED2AA97;
 Thu, 17 Feb 2022 12:01:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] ui/shader: fix potential leak of shader on error
Date: Thu, 17 Feb 2022 15:58:26 +0400
Message-Id: <20220217115829.2314347-10-marcandre.lureau@redhat.com>
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

Value of 0 for program and shaders are silently ignored and indicate error.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/shader.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ui/shader.c b/ui/shader.c
index e8b8d321b7c7..4c80fc831f68 100644
--- a/ui/shader.c
+++ b/ui/shader.c
@@ -130,15 +130,17 @@ static GLuint qemu_gl_create_link_program(GLuint vert, GLuint frag)
 static GLuint qemu_gl_create_compile_link_program(const GLchar *vert_src,
                                                   const GLchar *frag_src)
 {
-    GLuint vert_shader, frag_shader, program;
+    GLuint vert_shader, frag_shader, program = 0;
 
     vert_shader = qemu_gl_create_compile_shader(GL_VERTEX_SHADER, vert_src);
     frag_shader = qemu_gl_create_compile_shader(GL_FRAGMENT_SHADER, frag_src);
     if (!vert_shader || !frag_shader) {
-        return 0;
+        goto end;
     }
 
     program = qemu_gl_create_link_program(vert_shader, frag_shader);
+
+end:
     glDeleteShader(vert_shader);
     glDeleteShader(frag_shader);
 
-- 
2.34.1.428.gdcc0cd074f0c


