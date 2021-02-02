Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A984330C1FD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:41:02 +0100 (CET)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wrV-0006pv-NW
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wfw-0002Kn-Nx
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:29:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wfv-0003k6-2O
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lN/zrAVgjUgHVJw9bt4R0pSPcAByrbjFLBRCvcxIKls=;
 b=HLsZcFFTbFIYtFSq8AfnZvRAoTTlueDfcJtDWb6rsigOHSJE4bV//cTHqKYnDpBXaFkvyK
 JJT9AsCQ+K2IPupWLQHPwoMgGejBuo/u5bXiNqhXn+jrJ9TW9kuCcObpnRhg+iTp4vaat7
 HJRz7cEmCVkuJhHXpU0EmePK/59CYeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-ZoYoDh1WM4ugpR2XgSw-Lg-1; Tue, 02 Feb 2021 09:29:00 -0500
X-MC-Unique: ZoYoDh1WM4ugpR2XgSw-Lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D05803F43
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:29:00 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079CD5C1CF;
 Tue,  2 Feb 2021 14:28:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/20] ui: check hw requirements during DCL registration
Date: Tue,  2 Feb 2021 18:26:18 +0400
Message-Id: <20210202142625.609070-14-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 ui/console.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index a645418ada..47124e8cad 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1476,12 +1476,34 @@ static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl)
     return false;
 }
 
+static bool dpy_compatible_with(QemuConsole *con, DisplayChangeListener *dcl, Error **errp)
+{
+    ERRP_GUARD();
+    int flags;
+
+    flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
+
+    if (flags & GRAPHIC_FLAGS_GL && !console_has_gl(con)) {
+        error_setg(errp, "The console requires a GL context.");
+        return false;
+
+    }
+
+    if (flags & GRAPHIC_FLAGS_DMABUF && !displaychangelistener_has_dmabuf(dcl)) {
+        error_setg(errp, "The console requires display DMABUF support.");
+        return false;
+    }
+
+    return true;
+}
+
 void register_displaychangelistener(DisplayChangeListener *dcl)
 {
     static const char nodev[] =
         "This VM has no graphic display device.";
     static DisplaySurface *dummy;
     QemuConsole *con;
+    Error *err = NULL;
 
     assert(!dcl->ds);
 
@@ -1496,6 +1518,11 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
         dcl->con->gl = dcl;
     }
 
+    if (dcl->con && !dpy_compatible_with(dcl->con, dcl, &err)) {
+        error_report_err(err);
+        exit(1);
+    }
+
     trace_displaychangelistener_register(dcl, dcl->ops->dpy_name);
     dcl->ds = get_alloc_displaystate();
     QLIST_INSERT_HEAD(&dcl->ds->listeners, dcl, next);
-- 
2.29.0


