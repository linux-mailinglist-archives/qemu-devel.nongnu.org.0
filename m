Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88A3389AA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:09:17 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKejM-0007t0-Ts
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKebw-0006kO-NG
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKebq-0002CH-VC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anZGjpekYslS55upOI4Avz282/asVORYsyeL1008Bbg=;
 b=iEh0KjNcWOCIn4vaJi844PA39MK4jSmb2nSgKGtAi5xd+nhZT9RRYhaiMqcVFV5bPQ75EA
 qNP3wmcO3q6VM0r2DrxQMneof7DV/EX8qMpa2+M7I/9FLIzPrlptV9t5ZmtjwRvb79eV7p
 htbGTvsVtTn7N+YrjgOiCPNrqLq+Fh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-apTzP48zPGiiytaV92962w-1; Fri, 12 Mar 2021 05:01:26 -0500
X-MC-Unique: apTzP48zPGiiytaV92962w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0BE983DD20
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:01:25 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8322B610A8;
 Fri, 12 Mar 2021 10:01:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 02/27] vhost-user-gpu: glFlush before notifying clients
Date: Fri, 12 Mar 2021 14:00:43 +0400
Message-Id: <20210312100108.2706195-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

For similar reasons as commit 3af1671852 ("spice: flush on GL update
before notifying client"), vhost-user-gpu must ensure the GL state is
flushed before sharing its rendering result.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/virgl.c     | 3 +++
 contrib/vhost-user-gpu/meson.build | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 8bb3c563d9..9e6660c7ab 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -16,6 +16,8 @@
 #include <virglrenderer.h>
 #include "virgl.h"
 
+#include <epoxy/gl.h>
+
 void
 vg_virgl_update_cursor_data(VuGpu *g, uint32_t resource_id,
                             gpointer data)
@@ -372,6 +374,7 @@ virgl_cmd_resource_flush(VuGpu *g,
 
     VUGPU_FILL_CMD(rf);
 
+    glFlush();
     if (!rf.resource_id) {
         g_debug("bad resource id for flush..?");
         return;
diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index 2fc2320b52..0ce1515a10 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -2,7 +2,7 @@ if 'CONFIG_TOOLS' in config_host and 'CONFIG_VIRGL' in config_host \
     and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host \
     and pixman.found()
   executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
-             dependencies: [qemuutil, pixman, gbm, virgl, vhost_user],
+             dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl],
              install: true,
              install_dir: get_option('libexecdir'))
 
-- 
2.29.0


