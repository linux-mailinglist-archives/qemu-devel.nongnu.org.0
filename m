Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E34BA042
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:37:12 +0100 (CET)
Received: from localhost ([::1]:50092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKg23-0003Mb-71
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTp-0000C7-Ep
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfTd-0001hW-84
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 07:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WeVsYHrLE4GY7K03Sx9GvPRisdrpjFTU0ZZb4a2/Jkk=;
 b=Ef3ydjDUyJi6EY1y4NXUGAAa/zDSRy7MXApGG6fkOiGf08uqipgniZfXWgTmiKqlwJK7Dp
 TUF9a/r63tdyzq4T/LEQey69bFv1PIih/YGOh/aOn5iyTEq2tNN3oqusqSwwqDGN2r3v7D
 rn8nloBiC3t+wN/P3LngM80mYNrfYOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-6X58ORZGO32woW8v9KrjFw-1; Thu, 17 Feb 2022 07:01:26 -0500
X-MC-Unique: 6X58ORZGO32woW8v9KrjFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F00971091DA1;
 Thu, 17 Feb 2022 12:01:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A066E1BA;
 Thu, 17 Feb 2022 12:01:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] ui/shader: free associated programs
Date: Thu, 17 Feb 2022 15:58:27 +0400
Message-Id: <20220217115829.2314347-11-marcandre.lureau@redhat.com>
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/shader.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/shader.c b/ui/shader.c
index 4c80fc831f68..ab448c41d4c6 100644
--- a/ui/shader.c
+++ b/ui/shader.c
@@ -172,5 +172,8 @@ void qemu_gl_fini_shader(QemuGLShader *gls)
     if (!gls) {
         return;
     }
+    glDeleteProgram(gls->texture_blit_prog);
+    glDeleteProgram(gls->texture_blit_flip_prog);
+    glDeleteProgram(gls->texture_blit_vao);
     g_free(gls);
 }
-- 
2.34.1.428.gdcc0cd074f0c


