Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397A478DF9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:41:29 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEQK-0007XM-85
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:41:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEND-000541-Gm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEN9-000715-GQ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639751889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5dC8hDfVVT7XCxwJuEf3jf06NPq72if0VJ11FfXd2E=;
 b=aKiWBuob7HWL3z0UmHeTb4l3r1B07ES3P6PWwqUmX06SO5UDe7cQvdgIbPt0uHQkqHGOfl
 J5Lu3qyjZ0m2o6efL09frvz4HB8aa9Ixl5jI3DlFSjhx695hG1Y5dEYXC2FfiZdy59HCiv
 YyfjJu9VSD6Qz9W+Vd54VYogHh9eBdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-K0tObQ0jMg-IBJ6Bok6SWg-1; Fri, 17 Dec 2021 09:38:08 -0500
X-MC-Unique: K0tObQ0jMg-IBJ6Bok6SWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A53021006AA0;
 Fri, 17 Dec 2021 14:38:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC7655ED4D;
 Fri, 17 Dec 2021 14:38:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 01/36] ui/vdagent: add CHECK_SPICE_PROTOCOL_VERSION
Date: Fri, 17 Dec 2021 18:37:21 +0400
Message-Id: <20211217143756.1831099-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build  | 5 +++++
 ui/vdagent.c | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index ae67ca28ab38..58718691d7fc 100644
--- a/meson.build
+++ b/meson.build
@@ -1487,6 +1487,11 @@ config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('CONFIG_SPICE_PROTOCOL', spice_protocol.found())
+if spice_protocol.found()
+config_host_data.set('CONFIG_SPICE_PROTOCOL_MAJOR', spice_protocol.version().split('.')[0])
+config_host_data.set('CONFIG_SPICE_PROTOCOL_MINOR', spice_protocol.version().split('.')[1])
+config_host_data.set('CONFIG_SPICE_PROTOCOL_MICRO', spice_protocol.version().split('.')[2])
+endif
 config_host_data.set('CONFIG_SPICE', spice.found())
 config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 19e8fbfc96f1..1f8fc77ee8f3 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -17,6 +17,14 @@
 
 #include "spice/vd_agent.h"
 
+#define CHECK_SPICE_PROTOCOL_VERSION(major, minor, micro) \
+    (CONFIG_SPICE_PROTOCOL_MAJOR > (major) ||             \
+     (CONFIG_SPICE_PROTOCOL_MAJOR == (major) &&           \
+      CONFIG_SPICE_PROTOCOL_MINOR > (minor)) ||           \
+     (CONFIG_SPICE_PROTOCOL_MAJOR == (major) &&           \
+      CONFIG_SPICE_PROTOCOL_MINOR == (minor) &&           \
+      CONFIG_SPICE_PROTOCOL_MICRO >= (micro)))
+
 #define VDAGENT_BUFFER_LIMIT (1 * MiB)
 #define VDAGENT_MOUSE_DEFAULT true
 #define VDAGENT_CLIPBOARD_DEFAULT false
-- 
2.34.1.8.g35151cf07204


