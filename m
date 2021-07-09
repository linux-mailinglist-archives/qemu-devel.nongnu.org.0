Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079C43C2054
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:54:22 +0200 (CEST)
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1lL3-00088Q-40
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m1lKI-0007Rz-Ne
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m1lKF-00018Z-6H
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625817210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EXCKqwxzaDRPUWAPaZ+uZtKr9ZFK4dkJs7xHXSG/8kA=;
 b=JeQ52TDgc0VMyFuGVOsbx099xxYl8z3AOHynJjY/ck0+y6ewG/r1mJO6soJ6DGbO9TAmxy
 nYKfUXtQal5v94N8R0ruThUGrAMGs02L5YLaIcESIrxJlI/7Tj7ui05EITdXp+EsYsInDP
 2/H3Ub8AvvHC6EJol012CAmrn9hDktc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-x0X_isVXOgGWdFSJzJ2hxw-1; Fri, 09 Jul 2021 03:53:27 -0400
X-MC-Unique: x0X_isVXOgGWdFSJzJ2hxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1204C362FA;
 Fri,  9 Jul 2021 07:53:26 +0000 (UTC)
Received: from thuth.com (ovpn-113-160.ams2.redhat.com [10.36.113.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45E4210074F8;
 Fri,  9 Jul 2021 07:53:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Date: Fri,  9 Jul 2021 09:52:18 +0200
Message-Id: <20210709075218.1796207-1-thuth@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gitlab also provides runners with Windows, we can use them to
test compilation with MSYS2.

However, it takes quite a long time to set up the VM, so to
stay in the 1h time frame, we can only compile and check one
target here. And there is also still a problem with compiling
the multiboot.bin in pc-bios/optionrom/, so this is currently
disabled, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 I'm sending this out as an RFC in case somebody else wants to play
 with this. Considering that the corresponding job in Cirrus-CI compiles
 way more targets within 1 hour, we might rather want to keep using
 the Cirrus-CI job instead?

 .gitlab-ci.d/qemu-project.yml |  1 +
 .gitlab-ci.d/windows.yml      | 59 +++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 .gitlab-ci.d/windows.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 64cb2ba1da..f1a34038af 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -9,3 +9,4 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/buildtest.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
+  - local: '/.gitlab-ci.d/windows.yml'
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
new file mode 100644
index 0000000000..1874a06739
--- /dev/null
+++ b/.gitlab-ci.d/windows.yml
@@ -0,0 +1,59 @@
+.shared_windows_runners:
+  tags:
+  - shared-windows
+  - windows
+  - windows-1809
+
+msys2-build:
+  extends: .shared_windows_runners
+  stage: build
+  before_script:
+  - Invoke-WebRequest
+    "https://github.com/msys2/msys2-installer/releases/download/nightly-x86_64/msys2-base-x86_64-latest.sfx.exe"
+    -outfile "msys2.exe"
+  - .\msys2.exe -y -oC:\
+  - del msys2.exe
+  - ((Get-Content -path C:\msys64\etc\\post-install\\07-pacman-key.post -Raw)
+      -replace '--refresh-keys', '--version') |
+     Set-Content -Path C:\msys64\etc\\post-install\\07-pacman-key.post
+  - C:\msys64\usr\bin\bash -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
+  - C:\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core update
+  - C:\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal update
+  - C:\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
+      diffutils git grep make pkg-config sed
+      mingw-w64-x86_64-capstone
+      mingw-w64-x86_64-curl
+      mingw-w64-x86_64-cyrus-sasl
+      mingw-w64-x86_64-gcc
+      mingw-w64-x86_64-glib2
+      mingw-w64-x86_64-gnutls
+      mingw-w64-x86_64-gtk3
+      mingw-w64-x86_64-libgcrypt
+      mingw-w64-x86_64-libjpeg-turbo
+      mingw-w64-x86_64-libnfs
+      mingw-w64-x86_64-libpng
+      mingw-w64-x86_64-libssh
+      mingw-w64-x86_64-libtasn1
+      mingw-w64-x86_64-libusb
+      mingw-w64-x86_64-libxml2
+      mingw-w64-x86_64-lzo2
+      mingw-w64-x86_64-make
+      mingw-w64-x86_64-nettle
+      mingw-w64-x86_64-ninja
+      mingw-w64-x86_64-pixman
+      mingw-w64-x86_64-pkgconf
+      mingw-w64-x86_64-python
+      mingw-w64-x86_64-SDL2
+      mingw-w64-x86_64-SDL2_image
+      mingw-w64-x86_64-snappy
+      mingw-w64-x86_64-usbredir
+      mingw-w64-x86_64-zstd "
+  - taskkill /F /FI "MODULES eq msys-2.0.dll"
+  script:
+  - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
+  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
+  - C:\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
+      --enable-capstone=system --disable-fdt'
+  - C:\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
+  - C:\msys64\usr\bin\bash -lc 'make -j2'
+  - C:\msys64\usr\bin\bash -lc 'make V=1 check'
-- 
2.27.0


