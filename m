Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BB230F16B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:01:25 +0100 (CET)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cO4-00088a-Kh
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cI2-0000B1-JF
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:55:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cI0-0008NU-Qw
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qhXw4Teb4iB7F+1sn1YUEn7LdT1/1iDGCqwCLBci3Y=;
 b=Omi/HR0rOqQi1kQk6cFZiRObbPdEPP8iriXq3T6/L6Lywr5Z+Cxs9ad0ycjT1ungXgCRLV
 dPd7eHjTUhvdROybzc2fdhDgUBNA5ERGo6uybIJJEp8aytD181rNxQgMgbZPrOTqZgAUAq
 PdXT6/bdnvUHO/OKzKWrhUHnOCgia74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-sp4ZturWO_mJOW0rC6cZpQ-1; Thu, 04 Feb 2021 05:55:06 -0500
X-MC-Unique: sp4ZturWO_mJOW0rC6cZpQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA1F3801967
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:55:05 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F9CC722E4;
 Thu,  4 Feb 2021 10:54:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/20] ui: check hw requirements during DCL registration
Date: Thu,  4 Feb 2021 14:52:25 +0400
Message-Id: <20210204105232.834642-14-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index a645418ada..d8cc640c28 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1476,12 +1476,37 @@ static bool displaychangelistener_has_dmabuf(DisplayChangeListener *dcl)
     return false;
 }
 
+static bool dpy_compatible_with(QemuConsole *con,
+                                DisplayChangeListener *dcl, Error **errp)
+{
+    ERRP_GUARD();
+    int flags;
+
+    flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
+
+    if (flags & GRAPHIC_FLAGS_GL &&
+        !console_has_gl(con)) {
+        error_setg(errp, "The console requires a GL context.");
+        return false;
+
+    }
+
+    if (flags & GRAPHIC_FLAGS_DMABUF &&
+        !displaychangelistener_has_dmabuf(dcl)) {
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
 
@@ -1496,6 +1521,11 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
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


