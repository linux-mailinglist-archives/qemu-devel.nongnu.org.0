Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73348259514
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 17:46:52 +0200 (CEST)
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD8Ul-0000Ak-Bs
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 11:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD85u-00057o-A3
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:21:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD85s-0006gD-Ei
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598973667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=wIU+Gjr/wlaKraNDq73BuROkbWVgOHLIVHsn0y4wpwE=;
 b=PmAs99JWjMsYbKa8c664afZCSOU06BgRK0VQTO5PYHpVtOyQ+61y7KB023MbYtqgSVmcZA
 +u75B+zfcLr6MY4ET/f26//fc/i3Ye36a8SfXY+AtIAZYlutkI1ukLAiSPnTzWfyDBaSJm
 8VQjLPXLQEbKTdKQJ/TP2iXxsgwJ7Zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-xz8jqJtkMjuc2gE1ZG0OfA-1; Tue, 01 Sep 2020 11:21:05 -0400
X-MC-Unique: xz8jqJtkMjuc2gE1ZG0OfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 851D7107B270;
 Tue,  1 Sep 2020 15:21:04 +0000 (UTC)
Received: from thuth.com (ovpn-112-188.ams2.redhat.com [10.36.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ABF95D9CC;
 Tue,  1 Sep 2020 15:21:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/8] meson: fix keymaps without qemu-keymap
Date: Tue,  1 Sep 2020 17:20:48 +0200
Message-Id: <20200901152050.255165-7-thuth@redhat.com>
In-Reply-To: <20200901152050.255165-1-thuth@redhat.com>
References: <20200901152050.255165-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

In case the qemu-keymap tool generating them is neither installed on the
system nor built from sources (due to xkbcommon not being available)
qemu will not find the keymaps when started directly from the build
tree,

This happens because commit ddcf607fa3d6 ("meson: drop keymaps symlink")
removed the symlink to the source tree, and the special handling for
install doesn't help in case we do not install qemu.

Lets fix that by simply copying over the file from the source tree as
fallback.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20200827102617.14448-1-kraxel@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/keymaps/meson.build | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index b737c82230..e102dd56b4 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -38,19 +38,29 @@ if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
 else
   native_qemu_keymap = qemu_keymap
 endif
+
 t = []
 foreach km, args: keymaps
-  t += custom_target(km,
-                     build_by_default: true,
-                     output: km,
-                     command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                     install_dir: config_host['qemu_datadir'] / 'keymaps')
+  if native_qemu_keymap.found()
+    # generate with qemu-kvm
+    t += custom_target(km,
+                       build_by_default: true,
+                       output: km,
+                       command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+                       install_dir: config_host['qemu_datadir'] / 'keymaps')
+  else
+    # copy from source tree
+    t += custom_target(km,
+                       build_by_default: true,
+		       input: km,
+                       output: km,
+                       command: ['cp', '@INPUT@', '@OUTPUT@'],
+                       install_dir: config_host['qemu_datadir'] / 'keymaps')
+  endif
 endforeach
-if t.length() > 0
+
+if native_qemu_keymap.found()
   alias_target('update-keymaps', t)
-else
-  # install from the source tree
-  install_data(keymaps.keys(), install_dir: config_host['qemu_datadir'] / 'keymaps')
 endif
 
 install_data(['sl', 'sv'], install_dir: config_host['qemu_datadir'] / 'keymaps')
-- 
2.18.2


