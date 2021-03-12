Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBD43389B4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:10:21 +0100 (CET)
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKekO-0001Oz-Lc
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeci-0007Y5-Gj
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKecg-0002cf-S5
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0/It68BtTor5WmZUIcCjF1/wNNhCAIm49SImi80Xr0=;
 b=OvrG33DNMONx6F3HlWVrNSAtkH4PfsppkoXi792I8uJ4Xz7z29ZXO10Jzuq1QBfSMz43EU
 J0BbJklJmyJlI4QAb1zwjFAHfvl8NzW0T1C3F2qKYdiSwLtZjbdMSEbJo5j7PXO/WYvZ2x
 cI/Pp4zSKDqGNjurJ8lbOuN0SWD3WeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-b7rL-K-mM6a8iSpNwF8xew-1; Fri, 12 Mar 2021 05:02:20 -0500
X-MC-Unique: b7rL-K-mM6a8iSpNwF8xew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33CD983DD20
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:02:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB1D01037EBB;
 Fri, 12 Mar 2021 10:02:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 07/27] ui: make gl_block use a counter
Date: Fri, 12 Mar 2021 14:00:48 +0400
Message-Id: <20210312100108.2706195-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Track multiple callers blocking requests.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 53eba2019e..fedb9d8b13 100644
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
2.29.0


