Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACBB25B053
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 17:56:28 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDV7b-00005c-UV
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 11:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1K-00010k-Dv
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47490
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1I-0005T4-I5
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599061795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=P0vsjf7jIJJfpBQQWbMLmX5lc5WBp0zXOClEw8sEddo=;
 b=WFT22ARaFCTALfCR090Hpc3/k5IikmmMnbtywOr5aZl5HNc3UexdxukkAUu0OFqPb4Q8vV
 hdiAS11iE/0IWFQaKviHn+okTY/fbbFmYUPNjSO8/NzkbGfcHcQwSj00Li7YrpweADMe7x
 8GoahdL08cxzQYlImdSy6Uly7TPHIak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-NMsHqHtZN3CFo_NXvuCg1Q-1; Wed, 02 Sep 2020 11:49:49 -0400
X-MC-Unique: NMsHqHtZN3CFo_NXvuCg1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E48C10ABDBA;
 Wed,  2 Sep 2020 15:49:48 +0000 (UTC)
Received: from thuth.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 682C35D9CC;
 Wed,  2 Sep 2020 15:49:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 06/15] meson: fix keymaps without qemu-keymap
Date: Wed,  2 Sep 2020 17:49:23 +0200
Message-Id: <20200902154932.390595-7-thuth@redhat.com>
In-Reply-To: <20200902154932.390595-1-thuth@redhat.com>
References: <20200902154932.390595-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
[thuth: Rebased, changed "config_host['qemu_datadir']" to "qemu_datadir"]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/keymaps/meson.build | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index bbac83ece3..2e2e0dfa3b 100644
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
-                     install_dir: qemu_datadir / 'keymaps')
+  if native_qemu_keymap.found()
+    # generate with qemu-kvm
+    t += custom_target(km,
+                       build_by_default: true,
+                       output: km,
+                       command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+                       install_dir: qemu_datadir / 'keymaps')
+  else
+    # copy from source tree
+    t += custom_target(km,
+                       build_by_default: true,
+                       input: km,
+                       output: km,
+                       command: ['cp', '@INPUT@', '@OUTPUT@'],
+                       install_dir: qemu_datadir / 'keymaps')
+  endif
 endforeach
-if t.length() > 0
+
+if native_qemu_keymap.found()
   alias_target('update-keymaps', t)
-else
-  # install from the source tree
-  install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
 install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
-- 
2.18.2


