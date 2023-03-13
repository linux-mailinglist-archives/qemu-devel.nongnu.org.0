Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F76B7392
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:15:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfBI-0003jR-Vd; Mon, 13 Mar 2023 06:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfB1-0003Gx-8U
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfAw-0004MR-U0
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:13:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678702386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGbDQQUC9o48TybP+tmq1USntKA5OfzCZKVe6QxmWy0=;
 b=NYvLPpFvaj0piKhMLMqB1+zvBa9rskwsmWF3sURPGhDItXFE1B1Mfgph1RAD5PiNWwx9Ny
 a1z0yowtlpKdUr8towM1d7u40/zjX5rlXhBf15gXRu4eSNsec1+HDbYB6LLxaL1C5Lu9y4
 bvIBjl0oWPLiHlEsM2fyvD6tGO+MJLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-AS1syhP8OlS1OUHGM5db1Q-1; Mon, 13 Mar 2023 06:13:04 -0400
X-MC-Unique: AS1syhP8OlS1OUHGM5db1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B094802D2E;
 Mon, 13 Mar 2023 10:13:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83C85C158C2;
 Mon, 13 Mar 2023 10:13:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 12/18] ui/shader: fix #version directive must occur on
 first line
Date: Mon, 13 Mar 2023 14:12:01 +0400
Message-Id: <20230313101207.375125-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230313101207.375125-1-marcandre.lureau@redhat.com>
References: <20230313101207.375125-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

ANGLE fails to compile shaders otherwise.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/shader/texture-blit-flip.vert | 1 -
 ui/shader/texture-blit.frag      | 1 -
 ui/shader/texture-blit.vert      | 1 -
 3 files changed, 3 deletions(-)

diff --git a/ui/shader/texture-blit-flip.vert b/ui/shader/texture-blit-flip.vert
index ba081fa5a6..f7a448d229 100644
--- a/ui/shader/texture-blit-flip.vert
+++ b/ui/shader/texture-blit-flip.vert
@@ -1,4 +1,3 @@
-
 #version 300 es
 
 in vec2  in_position;
diff --git a/ui/shader/texture-blit.frag b/ui/shader/texture-blit.frag
index bfa202c22b..8ed95a46b6 100644
--- a/ui/shader/texture-blit.frag
+++ b/ui/shader/texture-blit.frag
@@ -1,4 +1,3 @@
-
 #version 300 es
 
 uniform sampler2D image;
diff --git a/ui/shader/texture-blit.vert b/ui/shader/texture-blit.vert
index 6fe2744d68..fb48d70665 100644
--- a/ui/shader/texture-blit.vert
+++ b/ui/shader/texture-blit.vert
@@ -1,4 +1,3 @@
-
 #version 300 es
 
 in vec2  in_position;
-- 
2.39.2


