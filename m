Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD743BD925
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:55:55 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mUM-0007zj-JQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mT1-0006cf-Kt
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mSz-0007ui-Oj
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625583268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7A2oDsTLBGaJIfi9ny0/gldGbN1G7mlq1bGFv21O3w=;
 b=Rz22jo+Bw8oyOAanL0hgpdcPX83eFDS1uncESwPLeSx0sNkJ37G5S4ccJhJUAyW9z9S9Kn
 RedO/XZ4bvhoKY7DO2Lwvj/7dC04eE7yezDG5LfF1lNyIdN7RjAaozuVmQGQubmxyn4Zd2
 Fg5thqPsf6eyTRj14OO+E6tTPK5fU+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-0V_kCTtaMdy5NySEPGV7jw-1; Tue, 06 Jul 2021 10:54:27 -0400
X-MC-Unique: 0V_kCTtaMdy5NySEPGV7jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D48A3824F89
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 14:54:26 +0000 (UTC)
Received: from thuth.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9437A5D6A1;
 Tue,  6 Jul 2021 14:54:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] softmmu/vl: Deprecate the old grab options
Date: Tue,  6 Jul 2021 16:54:12 +0200
Message-Id: <20210706145413.1449571-3-thuth@redhat.com>
In-Reply-To: <20210706145413.1449571-1-thuth@redhat.com>
References: <20210706145413.1449571-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: libvir-list@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The alt_grab and ctrl_grab parameter of the -display sdl option prevent
the QAPIfication of the "sdl" part of the -display option, so we should
eventually remove them. And since this feature is also rather niche anyway,
we should not clutter the top-level option list with these, so let's
also deprecate the "-alt-grab" and the "-ctrl-grab" options while we're
at it.

Once the deprecation period of "alt_grab" and "ctrl_grab" is over, we
then can finally switch the -display sdl option to use QAPI internally,
too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst | 10 ++++++++++
 qemu-options.hx            | 12 ++++++++----
 softmmu/vl.c               |  6 ++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 70e08baff6..89069856f1 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -138,6 +138,16 @@ an underscore between "window" and "close").
 The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
+``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
+
+``-ctrl-grab`` and ``-display sdl,ctrl_grab=on`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=rctrl`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 144afad8d1..5a76544e8b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1834,9 +1834,11 @@ SRST
         the mouse grabbing in conjunction with the "g" key. `<mods>` can be
         either `lshift-lctrl-lalt` or `rctrl`.
 
-        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing
+        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing.
+        This parameter is deprecated - use ``grab-mod`` instead.
 
-        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing
+        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing.
+        This parameter is deprecated - use ``grab-mod`` instead.
 
         ``gl=on|off|core|es`` : Use OpenGL for displaying
 
@@ -1921,7 +1923,8 @@ SRST
 ``-alt-grab``
     Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that
     this also affects the special keys (for fullscreen, monitor-mode
-    switching, etc).
+    switching, etc). This option is deprecated - please use
+    ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
 ERST
 
 DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
@@ -1931,7 +1934,8 @@ SRST
 ``-ctrl-grab``
     Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this
     also affects the special keys (for fullscreen, monitor-mode
-    switching, etc).
+    switching, etc). This option is deprecated - please use
+    ``-display sdl,grab-mod=rctrl`` instead.
 ERST
 
 DEF("no-quit", 0, QEMU_OPTION_no_quit,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 506b88b1a2..47cd47c840 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1039,6 +1039,7 @@ static void parse_display(const char *p)
                 } else {
                     goto invalid_sdl_args;
                 }
+                warn_report("alt_grab is deprecated, use grab-mod instead.");
             } else if (strstart(opts, ",ctrl_grab=", &nextopt)) {
                 opts = nextopt;
                 if (strstart(opts, "on", &nextopt)) {
@@ -1048,6 +1049,7 @@ static void parse_display(const char *p)
                 } else {
                     goto invalid_sdl_args;
                 }
+                warn_report("ctrl_grab is deprecated, use grab-mod instead.");
             } else if (strstart(opts, ",window_close=", &nextopt) ||
                        strstart(opts, ",window-close=", &nextopt)) {
                 if (strstart(opts, ",window_close=", NULL)) {
@@ -3237,9 +3239,13 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_alt_grab:
                 alt_grab = 1;
+                warn_report("-alt-grab is deprecated, please use "
+                            "-display sdl,grab-mod=lshift-lctrl-lalt instead.");
                 break;
             case QEMU_OPTION_ctrl_grab:
                 ctrl_grab = 1;
+                warn_report("-ctrl-grab is deprecated, please use "
+                            "-display sdl,grab-mod=rctrl instead.");
                 break;
             case QEMU_OPTION_no_quit:
                 dpy.has_window_close = true;
-- 
2.27.0


