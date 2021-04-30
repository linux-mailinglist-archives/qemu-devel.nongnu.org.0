Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933736FE12
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:53:56 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVSl-0000zl-3L
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVPM-0007t2-Iu
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVPE-0000qs-6M
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619797814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rePuRUmiJLdH/917Gz9nV9f0upTX5GXwfFmefbXYyi0=;
 b=bGfUaHaqe7EtOr4Hi6UsnWS1yHlX7hfaRMuSooV7M2fksf27Q1uOR1splGG0QC6FoKCwIi
 BEhIGYN8BQ+j3RGeXej+myn7hSB3TaTkiqbuh5GdooxgZ+uhpTpMTS9WsUGD69w9dRwvJU
 It4TkgdQ+I0g+N3Y5ACPs2nWjKHZkho=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-23B2BKk8PQm8iWBZTx5H9w-1; Fri, 30 Apr 2021 11:50:13 -0400
X-MC-Unique: 23B2BKk8PQm8iWBZTx5H9w-1
Received: by mail-wr1-f69.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso3394768wre.8
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rePuRUmiJLdH/917Gz9nV9f0upTX5GXwfFmefbXYyi0=;
 b=snge5AGH02vCkAeqI9ksGHRqglY2CP4GYF7shNHtqeo/MslfBQ6jqJFQLWciJG2dax
 V1UEhV96ipP1bjq1di/0AZQx58s/cLjTEGpc4ss2jdf9nt+VE2ng3+Z7NwJEEkiS/e/W
 XznB5EYAHhL2ssK1F8n5hhKdFp3dg98hMQEamvKm67OUb7i+hShMqZmf/DlAlKYIKXbe
 KoLHymhhokLetz6HZX2g72coFeEhOVqGZOZiYnvoDNtQSbR2hjMSUDGw2sxlaT9bDhhs
 2HpcaKabUCrGojHNZpnXuiWcHXwoRjT2xOmMm/QvLKb0I5zCfnQg3O6ZL3SbEYGMg1Ev
 ndFg==
X-Gm-Message-State: AOAM531Iw9CqVXQiqjtZtyzfqIQtReRp+NGCF2PNdfozopcsGe8h0WFN
 14ir/wDNEuTFiKl/K37Fg9An0fUf7X6VJTG2GCBCU/ScHORMLg0Uo+PjIdnwkH5CAEPBG0ASiFb
 lUiA/GY1V87WVGsxwRK9Pyq+GXCmZvK48wSTO9mw+aZEhUl+ujw8llqMgxJhHuLzE
X-Received: by 2002:a5d:648e:: with SMTP id o14mr4567351wri.27.1619797811704; 
 Fri, 30 Apr 2021 08:50:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyffMx0y3ZAkVjuP/N2GjT+l6HIG1+RM1o58430MeT8aaNw2e6UYVpEyBNS772g5Uo8a3kqpA==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr4567316wri.27.1619797811433; 
 Fri, 30 Apr 2021 08:50:11 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d13sm2734708wrx.29.2021.04.30.08.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 08:50:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] ui: Fix memory leak in qemu_xkeymap_mapping_table()
Date: Fri, 30 Apr 2021 17:50:09 +0200
Message-Id: <20210430155009.259755-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor qemu_xkeymap_mapping_table() to have a single exit point,
so we can easily free the memory allocated by XGetAtomName().

This fixes when running a binary configured with --enable-sanitizers:

  Direct leak of 22 byte(s) in 1 object(s) allocated from:
      #0 0x561344a7473f in malloc (qemu-system-x86_64+0x1dab73f)
      #1 0x7fa4d9dc08aa in XGetAtomName (/lib64/libX11.so.6+0x2a8aa)

Fixes: 2ec78706d18 ("ui: convert GTK and SDL1 frontends to keycodemapdb")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/x_keymap.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/ui/x_keymap.c b/ui/x_keymap.c
index 555086fb6bd..2ce7b899615 100644
--- a/ui/x_keymap.c
+++ b/ui/x_keymap.c
@@ -56,6 +56,7 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
 {
     XkbDescPtr desc;
     const gchar *keycodes = NULL;
+    const guint16 *map;
 
     /* There is no easy way to determine what X11 server
      * and platform & keyboard driver is in use. Thus we
@@ -83,21 +84,21 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
     if (check_for_xwin(dpy)) {
         trace_xkeymap_keymap("xwin");
         *maplen = qemu_input_map_xorgxwin_to_qcode_len;
-        return qemu_input_map_xorgxwin_to_qcode;
+        map = qemu_input_map_xorgxwin_to_qcode;
     } else if (check_for_xquartz(dpy)) {
         trace_xkeymap_keymap("xquartz");
         *maplen = qemu_input_map_xorgxquartz_to_qcode_len;
-        return qemu_input_map_xorgxquartz_to_qcode;
+        map = qemu_input_map_xorgxquartz_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "evdev")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x70)) {
         trace_xkeymap_keymap("evdev");
         *maplen = qemu_input_map_xorgevdev_to_qcode_len;
-        return qemu_input_map_xorgevdev_to_qcode;
+        map = qemu_input_map_xorgevdev_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "xfree86")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x63)) {
         trace_xkeymap_keymap("kbd");
         *maplen = qemu_input_map_xorgkbd_to_qcode_len;
-        return qemu_input_map_xorgkbd_to_qcode;
+        map = qemu_input_map_xorgkbd_to_qcode;
     } else {
         trace_xkeymap_keymap("NULL");
         g_warning("Unknown X11 keycode mapping '%s'.\n"
@@ -109,6 +110,10 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
                   "  - xprop -root\n"
                   "  - xdpyinfo\n",
                   keycodes ? keycodes : "<null>");
-        return NULL;
+        map = NULL;
     }
+    if (keycodes) {
+        XFree((void *)keycodes);
+    }
+    return map;
 }
-- 
2.26.3


