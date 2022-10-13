Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1737E5FD5B5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:46:49 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisvY-0004vX-2n
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois68-0005Vx-PQ
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois66-0006tf-UU
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75aaRgM87BFiU3rnRHF1gDGcnxHnw1Bq62+6vjBmCu0=;
 b=h5dWkXHdBFIiFxQlihN71RDABphEOtX3mlG3tnKpVPKDNDDp2zdVgeI3DwMYBRdP6E6Ytk
 T8AdU7qVB9mZGiycPWGZvs6m/KClGs68aEXvg+bqW4ynzFipQjvxXaka0LoCvCl/Qzq9Rd
 OdJuuYJHtaCkYhBUlBVEUp1dg27e3OM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-xZSsFKy6PeW339ik0obOOg-1; Thu, 13 Oct 2022 02:53:36 -0400
X-MC-Unique: xZSsFKy6PeW339ik0obOOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7339A86EB2D;
 Thu, 13 Oct 2022 06:53:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B8E40CA41C;
 Thu, 13 Oct 2022 06:53:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 26A6B18009DA; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [PULL 14/26] ui/gtk-egl: egl context needs to be unbound in the end
 of gd_egl_switch
Date: Thu, 13 Oct 2022 08:52:12 +0200
Message-Id: <20221013065224.1864145-15-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongwon Kim <dongwon.kim@intel.com>

A thread often fails to bind an egl context to itself after guest VM is
rebooted because the context is still owned by another thread. It is not
very clear what condition makes this happen but this can be prevented
by unbinding the context from the thread in the end of gd_egl_switch.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20220928215805.4661-1-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-egl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index b5bffbab2522..35f917ceb15e 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -195,6 +195,9 @@ void gd_egl_switch(DisplayChangeListener *dcl,
     if (resized) {
         gd_update_windowsize(vc);
     }
+
+    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
+                   EGL_NO_CONTEXT);
 }
 
 QEMUGLContext gd_egl_create_context(DisplayGLCtx *dgc,
-- 
2.37.3


