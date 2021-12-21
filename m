Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC0C47BA98
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:20:00 +0100 (CET)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZRH-00015t-Gd
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAL-0004Vc-Um
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAJ-00022p-J2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNXmFK4YyLv1sjoSdTZFSAPfzmwLAVcRBp73aEfewwg=;
 b=E3kX8V9uujVFq5NAuvdEJHGiyhyeHdLQhBix5e3vlnP4bi8q/KJHEVBhpjvhwgiC2jWJq8
 nE6sXfp5oxA6XOEKADdoA5c4oEKejbdSaI0Moqfcy/i4A3DYG3akco29a6LMgPl7unjpVm
 8tinHUt2+FRnIfUB1wWDOYL4Z3XFxwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-tTTaU49kOn2IH4foMbLXtQ-1; Tue, 21 Dec 2021 02:02:25 -0500
X-MC-Unique: tTTaU49kOn2IH4foMbLXtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C55AA8042DB;
 Tue, 21 Dec 2021 07:02:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B92077444;
 Tue, 21 Dec 2021 07:02:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/36] ui: make gl_block use a counter
Date: Tue, 21 Dec 2021 10:58:31 +0400
Message-Id: <20211221065855.142578-13-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
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


