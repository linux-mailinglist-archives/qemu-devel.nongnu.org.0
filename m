Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE663BD93D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:57:46 +0200 (CEST)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mW9-0002cZ-3z
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mT1-0006cm-Ui
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0mT0-0007wB-5s
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625583269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7dTxzPftuuEA7D9Quci9ks31+ssbPZXAfmsnGojLSM=;
 b=aIq4sKOmihI/so4Ylu9fF+PG58mNTGnehKPuN8W1+pJHFEL6KvKn+Fb1A+ldABiZ8Sp6te
 V0Wht1D5+22D5O/xBXMUaUecxBSsaCmLK00BdX0AcSW6x0fPAduQ+fV8okXsq/vmu1Ku90
 XMo7Na1UhqceMMjfG32O4lx8h7sQdeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-Mv2l_huHPn-4Shsqb6OBdg-1; Tue, 06 Jul 2021 10:54:25 -0400
X-MC-Unique: Mv2l_huHPn-4Shsqb6OBdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39049824F8A
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 14:54:25 +0000 (UTC)
Received: from thuth.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 114945D6AD;
 Tue,  6 Jul 2021 14:54:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/3] softmmu/vl: Add a "grab-mod" parameter to the -display
 sdl option
Date: Tue,  6 Jul 2021 16:54:11 +0200
Message-Id: <20210706145413.1449571-2-thuth@redhat.com>
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

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx |  6 +++++-
 softmmu/vl.c    | 15 ++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dabc83..144afad8d1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1784,7 +1784,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_SDL)
     "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off][,gl=on|core|es|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,grab-mod=<mod>][,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
@@ -1830,6 +1830,10 @@ SRST
         window; see the SDL documentation for other possibilities).
         Valid parameters are:
 
+        ``grab-mod=<mods>`` : Used to select the modifier keys for toggling
+        the mouse grabbing in conjunction with the "g" key. `<mods>` can be
+        either `lshift-lctrl-lalt` or `rctrl`.
+
         ``alt_grab=on|off`` : Use Control+Alt+Shift-g to toggle mouse grabbing
 
         ``ctrl_grab=on|off`` : Use Right-Control-g to toggle mouse grabbing
diff --git a/softmmu/vl.c b/softmmu/vl.c
index a50c8575a1..506b88b1a2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1013,15 +1013,24 @@ static void parse_display(const char *p)
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


