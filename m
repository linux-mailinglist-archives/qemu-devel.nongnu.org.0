Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD0A25C123
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 14:39:40 +0200 (CEST)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDoWh-0007l6-V7
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 08:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDoP5-0004jb-2M
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:31:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37847
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDoP2-0008HT-1Q
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599136303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=IGT2ePio+C2hsEldTT04onhkAN0WzzQ5DzluG26/Gv8=;
 b=I0DazbsOh8ZzFsYaUZopUfoRjXSqd3Zo+J0oLBiPxpP/p3a4wJJbY6O0sLUAe0IWaQ95Gl
 rXw+Hloo2vBe1kTBEsv3aMdETAKjJAcFD9dWD5Z2dhQyE6r82D/gjRChVvGNgkYP9uQ9kI
 LEJ3LK1BMdSSXCySSuUzrMpyXXb8yIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-dibmwhefOXOC44RhflhQ8w-1; Thu, 03 Sep 2020 08:31:39 -0400
X-MC-Unique: dibmwhefOXOC44RhflhQ8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A44110ABDC2;
 Thu,  3 Sep 2020 12:31:38 +0000 (UTC)
Received: from thuth.com (ovpn-114-10.ams2.redhat.com [10.36.114.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26BCF60250;
 Thu,  3 Sep 2020 12:31:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v3 06/15] meson: fix keymaps without qemu-keymap
Date: Thu,  3 Sep 2020 14:31:30 +0200
Message-Id: <20200903123130.451577-2-thuth@redhat.com>
In-Reply-To: <20200903123130.451577-1-thuth@redhat.com>
References: <20200903123130.451577-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:58:20
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
Cc: kraxel@redhat.com
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
[thuth: Rebased, changed "config_host['qemu_datadir']" to "qemu_datadir",
        added Gerd's UNLINK fix to configure script]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                   |  9 +++++++++
 pc-bios/keymaps/meson.build | 28 +++++++++++++++++++---------
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index 5645575688..be5434793c 100755
--- a/configure
+++ b/configure
@@ -8065,6 +8065,9 @@ fi
 # so the build tree will be missing the link back to the new file, and
 # tests might fail. Prefer to keep the relevant files in their own
 # directory and symlink the directory instead.
+# UNLINK is used to remove symlinks from older development versions
+# that might get into the way when doing "git update" without doing
+# a "make distclean" in between.
 DIRS="tests tests/tcg tests/tcg/lm32 tests/qapi-schema tests/qtest/libqos"
 DIRS="$DIRS tests/qtest tests/qemu-iotests tests/vm tests/fp tests/qgraph"
 DIRS="$DIRS docs docs/interop fsdev scsi"
@@ -8081,6 +8084,7 @@ LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/acceptance tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
+UNLINK="pc-bios/keymaps"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.elf \
@@ -8101,6 +8105,11 @@ for f in $LINKS ; do
         symlink "$source_path/$f" "$f"
     fi
 done
+for f in $UNLINK ; do
+    if [ -L "$f" ]; then
+        rm -f "$f"
+    fi
+done
 
 (for i in $cross_cc_vars; do
   export $i
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


