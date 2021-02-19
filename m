Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9CE32012F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:08:58 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDxJ-0005jc-Ag
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpc-0003lh-FL
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpa-0005hZ-CG
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfXPLOFRyc3TekUGGzF9HARVFfnCWS05mTmnQHE6c+A=;
 b=FDPwhqEfCWHmwm/Kwu2kQqZpOzBr/Gqsc0y2lXegvTNEftyjDy9E4RtzqQ/troU/DaHKIM
 4d3kACN8A+6UfoajvGm909wtnMfi0zQEmiagDn8Y9rPZ9ThqITee/GdmlEzSgxG8TlI36v
 9T4pF+JuQguXGu6hckyhmkZcmedJoSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-DEpm8Y_fMK2GKmkYixCvBg-1; Fri, 19 Feb 2021 17:00:53 -0500
X-MC-Unique: DEpm8Y_fMK2GKmkYixCvBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE44D801965;
 Fri, 19 Feb 2021 22:00:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6121060BFA;
 Fri, 19 Feb 2021 22:00:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 17B8C1800864; Fri, 19 Feb 2021 23:00:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] spice-app: avoid crash when core spice module doesn't
 loaded
Date: Fri, 19 Feb 2021 23:00:33 +0100
Message-Id: <20210219220036.100654-6-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
References: <20210219220036.100654-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruce Rogers <brogers@suse.com>

When qemu is built with modules, but a given module doesn't load
qemu should handle that gracefully. When ui-spice-core.so isn't
able to be loaded and qemu is invoked with -display spice-app or
-spice, qemu will dereference a null pointer. With this change we
check the pointer before dereferencing and error out in a normal
way.

Signed-off-by: Bruce Rogers <brogers@suse.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210213032318.346093-1-brogers@suse.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/spice-app.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/ui/spice-app.c b/ui/spice-app.c
index 026124ef56a0..4325ac2d9c54 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -129,6 +129,7 @@ static void spice_app_atexit(void)
 static void spice_app_display_early_init(DisplayOptions *opts)
 {
     QemuOpts *qopts;
+    QemuOptsList *list;
     GError *err = NULL;
 
     if (opts->has_full_screen) {
@@ -159,11 +160,16 @@ static void spice_app_display_early_init(DisplayOptions *opts)
             exit(1);
         }
     }
+    list = qemu_find_opts("spice");
+    if (list == NULL) {
+        error_report("spice-app missing spice support");
+        exit(1);
+    }
 
     type_register(&char_vc_type_info);
 
     sock_path = g_strjoin("", app_dir, "/", "spice.sock", NULL);
-    qopts = qemu_opts_create(qemu_find_opts("spice"), NULL, 0, &error_abort);
+    qopts = qemu_opts_create(list, NULL, 0, &error_abort);
     qemu_opt_set(qopts, "disable-ticketing", "on", &error_abort);
     qemu_opt_set(qopts, "unix", "on", &error_abort);
     qemu_opt_set(qopts, "addr", sock_path, &error_abort);
-- 
2.29.2


