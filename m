Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711F478E66
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:49:07 +0100 (CET)
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEXh-0002sl-Sg
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEQS-0001c1-5h
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:41:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEQQ-0000jR-PA
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNXmFK4YyLv1sjoSdTZFSAPfzmwLAVcRBp73aEfewwg=;
 b=VKhI/bfbW1Au0KOrOZ5zZRh8HLbXH8hEV0TEQv8pogE9b+MoVlyVJwcBwqr3XjEd1xfTQX
 w3MlSDYekkKIzWHe5lwGPcsZy8rcisoVD2c+26zcjoYinSAmY4CxiA7D3QVPhTJh1PuIhp
 aI9eVlW05zuC5X1dgtyzaNoLKsBN1uI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-B7L3H6XXMz2OXFZ6pjsEtQ-1; Fri, 17 Dec 2021 09:41:32 -0500
X-MC-Unique: B7L3H6XXMz2OXFZ6pjsEtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF4CF1006AA2;
 Fri, 17 Dec 2021 14:41:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3985CE2D3;
 Fri, 17 Dec 2021 14:41:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 12/36] ui: make gl_block use a counter
Date: Fri, 17 Dec 2021 18:37:32 +0400
Message-Id: <20211217143756.1831099-13-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Track multiple callers blocking requests.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 87f897e46dc4..39f7b66baf54 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -79,7 +79,7 @@ struct QemuConsole {
     DisplaySurface *surface;
     int dcls;
     DisplayChangeListener *gl;
-    bool gl_block;
+    int gl_block;
     int window_id;
 
     /* Graphic console state.  */
@@ -237,10 +237,19 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
 {
     assert(con != NULL);
 
-    con->gl_block = block;
-    if (con->hw_ops->gl_block) {
-        con->hw_ops->gl_block(con->hw, block);
+    if (block) {
+        con->gl_block++;
+    } else {
+        con->gl_block--;
+    }
+    assert(con->gl_block >= 0);
+    if (!con->hw_ops->gl_block) {
+        return;
+    }
+    if ((block && con->gl_block != 1) || (!block && con->gl_block != 0)) {
+        return;
     }
+    con->hw_ops->gl_block(con->hw, block);
 }
 
 void graphic_hw_gl_flushed(QemuConsole *con)
-- 
2.34.1.8.g35151cf07204


