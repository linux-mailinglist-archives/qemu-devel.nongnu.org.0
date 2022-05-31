Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12945397F5
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 22:32:00 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw8X1-0005E3-Mc
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 16:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8Tr-0002tC-3s
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:28:43 -0400
Received: from mga02.intel.com ([134.134.136.20]:3289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8To-0000Ag-Lj
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654028920; x=1685564920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2crnWDMPAClrE6UpcB2P0Y0+CaGId7DInSqhQnWT50c=;
 b=L8JQINx2SP21fJj9lJTwwwnkwZZVVxJaM2DCawjwfk2TNBAThQXU+1T4
 jijwYw8N3Z8rgLDMqjUqg0pCEZTLspk0QlNsJWPiG9oEZV7t66ybZeJ9g
 fpY5zd44qCSb0/KRUYJoMkdFjvGjlKj810MjAsCTVQETUXSQvNv4v5us3
 jekaUzupvSoxY9YE7Sbcwc6G/ie3i5vhdpUpThGDMUItaRMW4NqnnZ/KC
 guCZNLCVSGljgOjUwq3hF9c3i/gUiPd5cJbgQ7kLQeb4oU/n3lFaVNR/q
 NYlaIGVVbh+m7v5r9oO247YHrTFviqQoGMJ5QkFchUO8iBladjVgUbhiw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263010886"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="263010886"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 13:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="611998601"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2022 13:28:36 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH 1/2] ui/gtk: detach VCS for additional guest displays
Date: Tue, 31 May 2022 13:23:26 -0700
Message-Id: <20220531202327.14636-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531202327.14636-1-dongwon.kim@intel.com>
References: <20220531202327.14636-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=dongwon.kim@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Detaching any addtional guest displays in case there are multiple
displays assigned to the guest OS (e.g. max_outputs=n) so that
all of them are visible upon lauching.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index c57c36749e..abfcf48547 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2304,6 +2304,8 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GtkDisplayState *s = g_malloc0(sizeof(*s));
     GdkDisplay *window_display;
     GtkIconTheme *theme;
+    int n_gfx_vcs = 0;
+    int i;
     char *dir;
 
     if (!gtkinit) {
@@ -2374,7 +2376,14 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     gtk_widget_set_sensitive(s->copy_item,
                              vc && vc->type == GD_VC_VTE);
 #endif
-
+    for (i = 0; i < s->nb_vcs; i++) {
+        if (qemu_console_is_graphic(s->vc[i].gfx.dcl.con)) {
+            if (n_gfx_vcs > 0) {
+                gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
+            }
+            n_gfx_vcs++;
+        }
+    }
     if (opts->has_full_screen &&
         opts->full_screen) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
-- 
2.30.2


