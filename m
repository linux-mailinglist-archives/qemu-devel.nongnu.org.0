Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD2450656
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:10:22 +0100 (CET)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmcgf-0008Im-3p
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:10:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmcdE-0005Ir-Bd
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mmcdA-0000QU-IT
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636985199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lUvCsSBfAiIgyz5Z6/lXZnAjZIOjo61a6SHecThuT9I=;
 b=W0vO59x+/CTJmjR4ObcANYxWJIYlbMBaYTyqhf2k8qcVFb5cAASChAOATr7Oe+ydmYND43
 7aQV0z3ZU/0IYEDYHABiIsKTPG/0Ik74381lp6aqktxx34T4Y4v8wH+ByrX/J7BL3Wzbt1
 eefx+aoLTflNDwgZAN9+Bn1SJfW+NxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-tSFPavVrMcOAGXtkXd2qaQ-1; Mon, 15 Nov 2021 09:06:30 -0500
X-MC-Unique: tSFPavVrMcOAGXtkXd2qaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F73DCC627;
 Mon, 15 Nov 2021 14:06:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABB0D67842;
 Mon, 15 Nov 2021 14:06:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Date: Mon, 15 Nov 2021 15:06:23 +0100
Message-Id: <20211115140623.104116-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gitlab also provides runners with Windows, we can use them to
test compilation with MSYS2, in both, 64-bit and 32-bit.

However, it takes quite a long time to set up the VM, so to
stay in the 1h time frame, we can only compile and check one
target here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 "make check" recently broke on MSYS2, and nobody noticed since apparently
 hardly anybody looks at the cirrus-CI output ... so here's another try
 to get some more test coverage in this area in the gitlab-CI instead.
 Patch needs to be applied after the "tests/unit/test-smp-parse:
 Make an unified name for the tested machine" patch to get "make check"
 fixed first.

 RFC -> v1:
 - Use cache to speed up installation a little bit
 - Add a 32-bit builder, too

 .gitlab-ci.d/qemu-project.yml |  1 +
 .gitlab-ci.d/windows.yml      | 98 +++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 .gitlab-ci.d/windows.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index b3d79bc429..871262fe0e 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -11,3 +11,4 @@ include:
   - local: '/.gitlab-ci.d/static_checks.yml'
   - local: '/.gitlab-ci.d/custom-runners.yml'
   - local: '/.gitlab-ci.d/cirrus.yml'
+  - local: '/.gitlab-ci.d/windows.yml'
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
new file mode 100644
index 0000000000..309f7e7fb8
--- /dev/null
+++ b/.gitlab-ci.d/windows.yml
@@ -0,0 +1,98 @@
+.shared_msys2_builder:
+  tags:
+  - shared-windows
+  - windows
+  - windows-1809
+  cache:
+    key: "${CI_JOB_NAME}-cache"
+    paths:
+      - ${CI_PROJECT_DIR}/msys64/var/cache
+  needs: []
+  stage: build
+  timeout: 70m
+  before_script:
+  - If ( !(Test-Path -Path msys64\var\cache ) ) {
+      mkdir msys64\var\cache
+    }
+  - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
+      Invoke-WebRequest
+      "https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe"
+      -outfile "msys64\var\cache\msys2.exe"
+    }
+  - msys64\var\cache\msys2.exe -y
+  - ((Get-Content -path .\msys64\etc\\post-install\\07-pacman-key.post -Raw)
+      -replace '--refresh-keys', '--version') |
+     Set-Content -Path ${CI_PROJECT_DIR}\msys64\etc\\post-install\\07-pacman-key.post
+  - .\msys64\usr\bin\bash -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
+  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core update
+  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal update
+  - taskkill /F /FI "MODULES eq msys-2.0.dll"
+
+msys2-64bit:
+  extends: .shared_msys2_builder
+  script:
+  - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
+      diffutils git grep make sed
+      mingw-w64-x86_64-capstone
+      mingw-w64-x86_64-curl
+      mingw-w64-x86_64-cyrus-sasl
+      mingw-w64-x86_64-gcc
+      mingw-w64-x86_64-glib2
+      mingw-w64-x86_64-gnutls
+      mingw-w64-x86_64-libnfs
+      mingw-w64-x86_64-libpng
+      mingw-w64-x86_64-libssh
+      mingw-w64-x86_64-libtasn1
+      mingw-w64-x86_64-libusb
+      mingw-w64-x86_64-libxml2
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
+  - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
+  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
+  - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
+      --enable-capstone=system'
+  - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
+  - .\msys64\usr\bin\bash -lc 'make -j2'
+  - .\msys64\usr\bin\bash -lc 'make check'
+
+msys2-32bit:
+  extends: .shared_msys2_builder
+  script:
+  - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
+      diffutils git grep make sed
+      mingw-w64-i686-capstone
+      mingw-w64-i686-curl
+      mingw-w64-i686-cyrus-sasl
+      mingw-w64-i686-gcc
+      mingw-w64-i686-glib2
+      mingw-w64-i686-gnutls
+      mingw-w64-i686-gtk3
+      mingw-w64-i686-libgcrypt
+      mingw-w64-i686-libjpeg-turbo
+      mingw-w64-i686-libssh
+      mingw-w64-i686-libtasn1
+      mingw-w64-i686-libusb
+      mingw-w64-i686-libxml2
+      mingw-w64-i686-lzo2
+      mingw-w64-i686-ninja
+      mingw-w64-i686-pixman
+      mingw-w64-i686-pkgconf
+      mingw-w64-i686-python
+      mingw-w64-i686-snappy
+      mingw-w64-i686-usbredir "
+  - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
+  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
+  - mkdir output
+  - cd output
+  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu
+      --enable-capstone=system"
+  - ..\msys64\usr\bin\bash -lc 'make -j2'
+  - ..\msys64\usr\bin\bash -lc 'make check'
-- 
2.27.0


