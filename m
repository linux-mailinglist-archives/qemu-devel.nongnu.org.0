Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226704D85B4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:07:23 +0100 (CET)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkPu-0005OC-Ri
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:07:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJE-0004Kr-Vj
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkJD-00031a-DJ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647262822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ow2T12UgMkr9jPaFKMWSsZHcAQuUHyxTS6a7PG+DSSE=;
 b=BYkXlerFJ0uLxLUnE0cq26zpvHESWxUquP7VE4LLPTnjgLxbfrUfKgzIQM8mknK24Zt+4P
 qWl+PN4xRKUgbmmf5GBcHJjsT5g/Buzcr8Q5YEk2jxI0/uj4yeerEVxSljIrQzlwdD4hbo
 KDEIxtks/VS7CfnDt1W+NfisEnvcu5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-3Q-Oc8UcOcm1TszVoBKS7A-1; Mon, 14 Mar 2022 09:00:19 -0400
X-MC-Unique: 3Q-Oc8UcOcm1TszVoBKS7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 591F9802E5B;
 Mon, 14 Mar 2022 13:00:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35F16674C63;
 Mon, 14 Mar 2022 13:00:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] ui/shader: fix potential leak of shader on error
Date: Mon, 14 Mar 2022 16:59:34 +0400
Message-Id: <20220314125940.1866728-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
References: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Value of 0 for program and shaders are silently ignored and indicate error.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.35.1.273.ge6ebfd0e8cbb


