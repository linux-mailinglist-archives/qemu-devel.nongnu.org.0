Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F630C1DD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:37:03 +0100 (CET)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wne-00037D-LS
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wfo-0002Bq-Ca
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:28:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wfk-0003fb-1Q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:28:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGEYaMdQF0uuuI2IAqAAi7C/Z/1gz+tjJgCi42jCNic=;
 b=jQ7+aixLBn0Jk6wLXu1+d3PFWIUFPfa+Jn85fzlNCdJzpSAOhi0Ro9Pzj3GjX2lC1QngC3
 ZQmSVS0qhNBAZRKxF5u137G5eNeVeVx+FbOmQP0LPVr3AWvjYPtKPQs8gI7/gJsaoBymRJ
 BVCYdHDKQpE2DHUZUVKqA1/mqf6OOoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-VPP3ppp-PzScfSen2lblsg-1; Tue, 02 Feb 2021 09:28:49 -0500
X-MC-Unique: VPP3ppp-PzScfSen2lblsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0E92AFA80
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:28:48 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0F44100164C;
 Tue,  2 Feb 2021 14:28:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 12/20] ui: add a DCLOps callback to check dmabuf support
Date: Tue,  2 Feb 2021 18:26:17 +0400
Message-Id: <20210202142625.609070-13-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |  2 ++
 ui/console.c         | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 0595aa9953..875885d9c7 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -224,6 +224,8 @@ typedef struct DisplayChangeListenerOps {
                                    uint32_t backing_height,
                                    uint32_t x, uint32_t y,
                                    uint32_t w, uint32_t h);
+    /* optional (default to true if has dpy_gl_scanout_dmabuf) */
+    bool (*dpy_has_dmabuf)(DisplayChangeListener *dcl);
     /* optional */
     void (*dpy_gl_scanout_dmabuf)(DisplayChangeListener *dcl,
                                   QemuDmaBuf *dmabuf);
diff --git a/ui/console.c b/ui/console.c
index b5bc3f7699..a645418ada 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1463,6 +1463,19 @@ bool console_has_gl(QemuConsole *con)
     return con->gl != NULL;
 }
 
+static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl)
+{
+    if (dcl->ops->dpy_has_dmabuf) {
+        return dcl->ops->dpy_has_dmabuf(dcl);
+    }
+
+    if (dcl->ops->dpy_gl_scanout_dmabuf) {
+        return true;
+    }
+
+    return false;
+}
+
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
-- 
2.29.0


