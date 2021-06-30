Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45753B8727
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:37:00 +0200 (CEST)
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydCs-0007PQ-5M
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd94-0005Jx-IB
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd8q-0000Iy-HI
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625070767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ydAJNihEcdfk3BDCQib5K3UK+CJuTNdU2Xrhsb3NEI=;
 b=gCsWBrrt0QiqjSHymX8d7DE27V5v78CcKBl8TZ1nnR+3qPiYkFrSKEtIABJ+PeKNJoay8A
 DXQa3fWndrZoSDBQYABUIpKMg8B154zLcgVPeDuKm+J/PQ7J29hFfFxRYVJxkEO4rMXirl
 0LAzsRb2/jAVZrKI1SPPdWoqug3c/B4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-rUuPGFuKO3iD-I04HnbOIg-1; Wed, 30 Jun 2021 12:32:45 -0400
X-MC-Unique: rUuPGFuKO3iD-I04HnbOIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE8219253C2
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 16:32:44 +0000 (UTC)
Received: from thuth.com (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF0F85C1A3;
 Wed, 30 Jun 2021 16:32:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: [PATCH 2/4] ui: Fix the "-display sdl,window_close=..." parameter
Date: Wed, 30 Jun 2021 18:32:29 +0200
Message-Id: <20210630163231.467987-3-thuth@redhat.com>
In-Reply-To: <20210630163231.467987-1-thuth@redhat.com>
References: <20210630163231.467987-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the QAPI schema, there is a "-" and not a "_" between
"window" and "close", and we're also talking about "window-close"
in the long parameter description in qemu-options.hx, so we should
make sure that we rather use the variant with the "-" by default
instead of only allowing the one with the "_" here. The old way
still stays enabled for compatibility, but we deprecate it, so that
we can switch to a QAPIfied parameter one day more easily.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst | 6 ++++++
 qemu-options.hx            | 2 +-
 softmmu/vl.c               | 7 ++++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..bb624d3170 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,12 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+``-display sdl,window_close=...`` (since 6.1)
+'''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
+an underscore between "window" and "close").
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index ba3ca9da1d..ae56fa4f28 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1784,7 +1784,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_SDL)
     "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off]\n"
-    "            [,window_close=on|off][,gl=on|core|es|off]\n"
+    "            [,window-close=on|off][,gl=on|core|es|off]\n"
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index cee6339580..36b761677d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1089,7 +1089,12 @@ static void parse_display(const char *p)
                 } else {
                     goto invalid_sdl_args;
                 }
-            } else if (strstart(opts, ",window_close=", &nextopt)) {
+            } else if (strstart(opts, ",window_close=", &nextopt) ||
+                       strstart(opts, ",window-close=", &nextopt)) {
+                if (strstart(opts, ",window_close=", NULL)) {
+                    warn_report("window_close with an underscore is deprecated,"
+                                " please use window-close instead.");
+                }
                 opts = nextopt;
                 dpy.has_window_close = true;
                 if (strstart(opts, "on", &nextopt)) {
-- 
2.27.0


