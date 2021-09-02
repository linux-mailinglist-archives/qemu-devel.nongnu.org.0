Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C467F3FEE65
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:08:52 +0200 (CEST)
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmSZ-0002Qi-Po
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLmA0-0005IL-G4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9y-000754-IC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQQAW8Rb5AEQvgaGxy3djvSVBI1Ixd29wh+C8dJ/vyI=;
 b=fGr32lTq7BroCSpyRej+CCKwlpk2l1I1URbJgxkrlXIW5/aHxhSkGDDfahnl3/Pc+74fI9
 xRlzZHc0/nS2SZ/GcVih6MIiHCNYALQLAN7nTI/Ee4pLV36eKsdXKgh6b+ymT4vGdbuDOK
 IoJNj1szPFSRWG8R9ErdC3DXNAHTUS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-VsvnvTirOUmesDGKvAqhDw-1; Thu, 02 Sep 2021 08:49:35 -0400
X-MC-Unique: VsvnvTirOUmesDGKvAqhDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21BE5107ACCA;
 Thu,  2 Sep 2021 12:49:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4912A100AE35;
 Thu,  2 Sep 2021 12:49:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/13] softmmu/vl: Deprecate the old grab options
Date: Thu,  2 Sep 2021 14:49:10 +0200
Message-Id: <20210902124911.822423-13-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The alt_grab and ctrl_grab parameter of the -display sdl option prevent
the QAPIfication of the "sdl" part of the -display option, so we should
eventually remove them. And since this feature is also rather niche anyway,
we should not clutter the top-level option list with these, so let's
also deprecate the "-alt-grab" and the "-ctrl-grab" options while we're
at it.

Once the deprecation period of "alt_grab" and "ctrl_grab" is over, we
then can finally switch the -display sdl option to use QAPI internally,
too.

Message-Id: <20210825092023.81396-3-thuth@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 qemu-options.hx           | 12 ++++++++----
 softmmu/vl.c              |  6 ++++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1e1a5e96ad..65d8b4370f 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -138,6 +138,16 @@ an underscore between "window" and "close").
 The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
+``-alt-grab`` and ``-display sdl,alt_grab=on`` (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
+
+``-ctrl-grab`` and ``-display sdl,ctrl_grab=on`` (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,grab-mod=rctrl`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index 0bff756ded..4f46233527 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1884,9 +1884,11 @@ SRST
         the mouse grabbing in conjunction with the "g" key. `<mods>` can be
         either `lshift-lctrl-lalt` or `rctrl`.
 
-        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing
+        ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing.
+        This parameter is deprecated - use ``grab-mod`` instead.
 
-        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing
+        ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing.
+        This parameter is deprecated - use ``grab-mod`` instead.
 
         ``gl=on|off|core|es`` : Use OpenGL for displaying
 
@@ -1971,7 +1973,8 @@ SRST
 ``-alt-grab``
     Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that
     this also affects the special keys (for fullscreen, monitor-mode
-    switching, etc).
+    switching, etc). This option is deprecated - please use
+    ``-display sdl,grab-mod=lshift-lctrl-lalt`` instead.
 ERST
 
 DEF("ctrl-grab", 0, QEMU_OPTION_ctrl_grab,
@@ -1981,7 +1984,8 @@ SRST
 ``-ctrl-grab``
     Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this
     also affects the special keys (for fullscreen, monitor-mode
-    switching, etc).
+    switching, etc). This option is deprecated - please use
+    ``-display sdl,grab-mod=rctrl`` instead.
 ERST
 
 DEF("no-quit", 0, QEMU_OPTION_no_quit,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2176e3c5ae..e9346b49d2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1043,6 +1043,7 @@ static void parse_display(const char *p)
                 } else {
                     goto invalid_sdl_args;
                 }
+                warn_report("alt_grab is deprecated, use grab-mod instead.");
             } else if (strstart(opts, ",ctrl_grab=", &nextopt)) {
                 opts = nextopt;
                 if (strstart(opts, "on", &nextopt)) {
@@ -1052,6 +1053,7 @@ static void parse_display(const char *p)
                 } else {
                     goto invalid_sdl_args;
                 }
+                warn_report("ctrl_grab is deprecated, use grab-mod instead.");
             } else if (strstart(opts, ",window_close=", &nextopt) ||
                        strstart(opts, ",window-close=", &nextopt)) {
                 if (strstart(opts, ",window_close=", NULL)) {
@@ -3245,9 +3247,13 @@ void qemu_init(int argc, char **argv, char **envp)
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


