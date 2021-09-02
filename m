Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036713FEE6C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:09:18 +0200 (CEST)
Received: from localhost ([::1]:48278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmSx-0002st-Sr
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9y-0005Bw-Ve
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9w-00074T-JH
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sk/MbQHGrW2wOM0H5ZZaRI/aoRqGzYqvlSSR3juL2Bk=;
 b=Rtd3r6RNVc82txLATZQYEFOIDmy5/JeFJY1yB/dWcTwHSgmpyXTWko9fzZ0ouuvwupFiC8
 sTkORBAZB/EyNFdUTfkGzUDBy7N8/jSTrQ5qTEV2fY8Q6UYWN71wlSmpMgBLYYJM4twEl8
 I8PevHUTmn3f275mlhFFeSDTYuMX+JQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-zd1EeT5lOtOsW6M53vC9kg-1; Thu, 02 Sep 2021 08:49:33 -0400
X-MC-Unique: zd1EeT5lOtOsW6M53vC9kg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE0751083E8F;
 Thu,  2 Sep 2021 12:49:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10E891000358;
 Thu,  2 Sep 2021 12:49:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/13] softmmu/vl: Add a "grab-mod" parameter to the -display
 sdl option
Date: Thu,  2 Sep 2021 14:49:09 +0200
Message-Id: <20210902124911.822423-12-thuth@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The -display sdl option is not using QAPI internally yet, and uses hand-
crafted parsing instead (see parse_display() in vl.c), which is quite
ugly, since most of the other code is using the QAPIfied DisplayOption
already. Unfortunately, the "alt_grab" and "ctrl_grab" use underscores in
their names which has recently been forbidden in new QAPI code, so
a straight conversion is not possible. While we could add some exceptions
to the QAPI schema parser for this, the way these parameters have been
designed was maybe a bad idea anyway: First, it's not possible to enable
both parameters at the same time, thus instead of two boolean parameters
it would be better to have only one multi-choice parameter instead.
Second, the naming is also somewhat unfortunate since the "alt_grab"
parameter is not about the ALT key, but rather about the left SHIFT key
that has to be used additionally when the parameter is enabled.

So instead of trying to QAPIfy "alt_grab" and "ctrl_grab", let's rather
introduce an alternative to these parameters instead, a new parameter
called "grab-mod" which can either be set to "lshift-lctrl-lalt" or to
"rctrl". In case we ever want to support additional modes later, we can
then also simply extend the list of supported strings here.

Message-Id: <20210825092023.81396-2-thuth@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx |  6 +++++-
 softmmu/vl.c    | 15 ++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..0bff756ded 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1834,7 +1834,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_SDL)
     "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off][,gl=on|core|es|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,grab-mod=<mod>][,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
@@ -1880,6 +1880,10 @@ SRST
         window; see the SDL documentation for other possibilities).
         Valid parameters are:
 
+        ``grab-mod=<mods>`` : Used to select the modifier keys for toggling
+        the mouse grabbing in conjunction with the "g" key. `<mods>` can be
+        either `lshift-lctrl-lalt` or `rctrl`.
+
         ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing
 
         ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea05bb39c5..2176e3c5ae 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1017,15 +1017,24 @@ static void parse_display(const char *p)
          * parse_display_qapi() due to some options not in
          * DisplayOptions, specifically:
          *   - ctrl_grab + alt_grab
-         *     Not clear yet what happens to them long-term.  Should
-         *     replaced by something better or deprecated and dropped.
+         *     They can't be moved into the QAPI since they use underscores,
+         *     thus they will get replaced by "grab-mod" in the long term
          */
 #if defined(CONFIG_SDL)
         dpy.type = DISPLAY_TYPE_SDL;
         while (*opts) {
             const char *nextopt;
 
-            if (strstart(opts, ",alt_grab=", &nextopt)) {
+            if (strstart(opts, ",grab-mod=", &nextopt)) {
+                opts = nextopt;
+                if (strstart(opts, "lshift-lctrl-lalt", &nextopt)) {
+                    alt_grab = 1;
+                } else if (strstart(opts, "rctrl", &nextopt)) {
+                    ctrl_grab = 1;
+                } else {
+                    goto invalid_sdl_args;
+                }
+            } else if (strstart(opts, ",alt_grab=", &nextopt)) {
                 opts = nextopt;
                 if (strstart(opts, "on", &nextopt)) {
                     alt_grab = 1;
-- 
2.27.0


