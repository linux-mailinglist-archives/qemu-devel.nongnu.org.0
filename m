Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679393D5854
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:11:31 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yWA-0003F4-Ft
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQy-0001X0-LZ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQx-0004he-43
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLt92j6se3ZPoQ2j7PvuNFRPhxUEIwwGwlVDgdMR6qE=;
 b=Dw9ks/WD8H8o/xNl+5hm4beDhbugAlF8K0XnUvVkzmyjLGFssTEZ/NbQJmDV0XbZpNbtH4
 4B3XFbtbbWiX126yEW+NtHHzT2IF6ip6ioRQYTrMZemzJ134PRGWUDnd2o8PdRdb0csU1i
 SOJ4sRu2O0EAfXtmY0527uaUaITuqlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-P9HdAltCO5iPnn_Z-EUuHQ-1; Mon, 26 Jul 2021 07:06:03 -0400
X-MC-Unique: P9HdAltCO5iPnn_Z-EUuHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 536E918C89CF;
 Mon, 26 Jul 2021 11:06:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FBA9710C5;
 Mon, 26 Jul 2021 11:05:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4E6131800906; Mon, 26 Jul 2021 13:05:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] ui/spice: Use HAVE_SPICE_GL for OpenGL checks
Date: Mon, 26 Jul 2021 13:05:40 +0200
Message-Id: <20210726110544.1934386-3-kraxel@redhat.com>
In-Reply-To: <20210726110544.1934386-1-kraxel@redhat.com>
References: <20210726110544.1934386-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Some code in ui/spice used CONFIG_OPENGL for OpenGL conditionals, but
SPICE also depends on CONFIG_GBM and SPICE server whose version is
0.13.1 or later for OpenGL. Always use HAVE_SPICE_GL, which defines the
precise condition.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210714055735.86050-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/spice-app.c  | 3 ++-
 ui/spice-core.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/spice-app.c b/ui/spice-app.c
index 641f4a9d53e3..7e71e18da9ad 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -27,6 +27,7 @@
 #include <gio/gio.h>
 
 #include "ui/console.h"
+#include "ui/spice-display.h"
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/cutils.h"
@@ -175,7 +176,7 @@ static void spice_app_display_early_init(DisplayOptions *opts)
     qemu_opt_set(qopts, "addr", sock_path, &error_abort);
     qemu_opt_set(qopts, "image-compression", "off", &error_abort);
     qemu_opt_set(qopts, "streaming-video", "off", &error_abort);
-#ifdef CONFIG_OPENGL
+#ifdef HAVE_SPICE_GL
     qemu_opt_set(qopts, "gl", opts->has_gl ? "on" : "off", &error_abort);
     display_opengl = opts->has_gl;
 #endif
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 86d43783acac..0371055e6c17 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -1039,6 +1039,6 @@ static void spice_register_config(void)
 opts_init(spice_register_config);
 module_opts("spice");
 
-#ifdef CONFIG_OPENGL
+#ifdef HAVE_SPICE_GL
 module_dep("ui-opengl");
 #endif
-- 
2.31.1


