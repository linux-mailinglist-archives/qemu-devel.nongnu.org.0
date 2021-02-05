Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA12310579
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:09:10 +0100 (CET)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vEr-0001kV-C7
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v39-0001Ud-VW
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v38-0001FA-0k
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMDSLR/pWQEGW/rdRVaRllWHOCsmrATvxvOmSwGqzUw=;
 b=XXLTOQ+PpmN8pHq0Ths0/gB7NaxnY+YcMBFpITB+dtsZNrqq5Cz+g38c9Q1NIEEyu7LlVR
 5UxMRny6HxipaXxBNZCdhavZKE2U7arBH9hbJ3as027hrK/0AvzeVaXpM9TOU69ucXyFV7
 EpocJ925nCvyQalDF358FN1z2yp3PmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-3WIA_yPTPt6VUDuhCmjR7g-1; Fri, 05 Feb 2021 01:56:59 -0500
X-MC-Unique: 3WIA_yPTPt6VUDuhCmjR7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA7A192CC43
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EA82100F49E;
 Fri,  5 Feb 2021 06:56:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48BE118003BC; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/24] ui: add a DCLOps callback to check dmabuf support
Date: Fri,  5 Feb 2021 07:56:12 +0100
Message-Id: <20210205065620.1726554-17-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-13-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h |  2 ++
 ui/console.c         | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 0595aa9953cf..875885d9c7ce 100644
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
index b5bc3f7699a1..a645418adad5 100644
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
2.29.2


