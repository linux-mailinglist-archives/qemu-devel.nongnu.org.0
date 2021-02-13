Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AA631A9C0
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 04:24:34 +0100 (CET)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAlXt-0004Hh-Qe
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 22:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1lAlWv-0003oG-Pn
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 22:23:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:39292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1lAlWs-0004In-9T
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 22:23:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613186606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XzTQXI3uMyqf+MRhVeLvY3GXbxJ5ZVObgaXqQQrtSTY=;
 b=Ut6Jv4pjaIi/QjpHjn56Rlui6vMarDA0w/xNb9YDz15gmzhYLRMKp2//xy08OLCMPA2SL2
 6Exw9bTQ+8Fmkeo7OVoVYfE0ck0zgLQ/NuUCN7aWrOxskKODXfS/1uvp3wgmYSzpJ6uj/w
 j58OZUY0ptNrDvGkhDcIqmS33alSTNs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6200CADE1;
 Sat, 13 Feb 2021 03:23:26 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	Bruce Rogers <brogers@suse.com>
Subject: [PATCH] spice-app: avoid crash when core spice module doesn't loaded
Date: Fri, 12 Feb 2021 20:23:18 -0700
Message-Id: <20210213032318.346093-1-brogers@suse.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When qemu is built with modules, but a given module doesn't load
qemu should handle that gracefully. When ui-spice-core.so isn't
able to be loaded and qemu is invoked with -display spice-app or
-spice, qemu will dereference a null pointer. With this change we
check the pointer before dereferencing and error out in a normal
way.

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 ui/spice-app.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/ui/spice-app.c b/ui/spice-app.c
index 026124ef56..4325ac2d9c 100644
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
2.30.0


