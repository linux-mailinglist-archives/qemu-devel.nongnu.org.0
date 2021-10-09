Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA695427D9F
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:23:56 +0200 (CEST)
Received: from localhost ([::1]:47504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJow-00064b-Si
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJdU-0002FS-Ir
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJdT-0000DV-5t
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjcSxsxLZJrUoPXcFLF+bfTEiXLq6QXAzu3eDdzypuM=;
 b=USiNzy+kr+5T0pvllMSSrfxNPOJ34vOWV56CdXceZFgtFPC24I1qMrcntrxc5IRomQjeDg
 evrZ2xdToottaMXnGJIF0V5K/CjhwFrhuXKkXmbkjvC6T26HP4ZzpXu6btcg9AQPy01hPm
 T4vSg2OljOAFDAYtZZRh7a6RevMxpvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-yIh9egYvM5iaFdTzlUc8fg-1; Sat, 09 Oct 2021 17:12:01 -0400
X-MC-Unique: yIh9egYvM5iaFdTzlUc8fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75715A0CAB
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:12:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB96757CA1;
 Sat,  9 Oct 2021 21:11:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/37] ui: make gl_block use a counter
Date: Sun, 10 Oct 2021 01:08:14 +0400
Message-Id: <20211009210838.2219430-14-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Track multiple callers blocking requests.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 3c4012271c..8d641b9530 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -128,7 +128,7 @@ struct QemuConsole {
     DisplaySurface *surface;
     int dcls;
     DisplayChangeListener *gl;
-    bool gl_block;
+    int gl_block;
     int window_id;
 
     /* Graphic console state.  */
@@ -288,10 +288,19 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
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
2.33.0.721.g106298f7f9


