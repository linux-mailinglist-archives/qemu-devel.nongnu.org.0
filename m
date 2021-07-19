Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7C3CD1E4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:28:57 +0200 (CEST)
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QW8-0007fy-Sj
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QU6-0005Y0-DE
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5QU4-00070w-Q2
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626690407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXyUdxjLrFQMcQ2tdQFKYQ2gZH4g3u7zcAqocSfF5XQ=;
 b=e+obH9YFINMYyzaJ3nJQBKwgNs4SAK5LfYrTORmy1N5NjtmIQSmHAweJqEdk7Oj3/XIBDk
 KM/xBVSLLi4/s/9J4COc9TvMYRXkdznUCHyCWj2XKTtieet2OruIn9Ac2Ey665j0SfgaG0
 dZ9qpm3GI55HfdfZ0ueE8MK4rJSyJc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-NWK2z930M8mWn1AMgfFOaA-1; Mon, 19 Jul 2021 06:26:46 -0400
X-MC-Unique: NWK2z930M8mWn1AMgfFOaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FA41100C660;
 Mon, 19 Jul 2021 10:26:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-201.ams2.redhat.com [10.36.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD805D6A1;
 Mon, 19 Jul 2021 10:26:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/5] ci: build & store windows installer
Date: Mon, 19 Jul 2021 12:26:36 +0200
Message-Id: <20210719102640.2610368-2-thuth@redhat.com>
In-Reply-To: <20210719102640.2610368-1-thuth@redhat.com>
References: <20210719102640.2610368-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Build windows installer for qemu in gitlab CI,
store the result as artifact.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210623091137.1156959-2-kraxel@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml               | 5 +++++
 .gitlab-ci.d/crossbuilds.yml                       | 6 ++++++
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 3 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 1be541174c..7d3ad00a1e 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -11,6 +11,11 @@
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+    - if grep -q "EXESUF=.exe" config-host.mak;
+      then make installer;
+      version="$(git describe --match v[0-9]*)";
+      mv -v qemu-setup*.exe qemu-setup-${version}.exe;
+      fi
 
 # Job to cross-build specific accelerators.
 #
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 6b3865c9e8..4ff3aa3cfc 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -160,6 +160,9 @@ cross-win32-system:
     job: win32-fedora-cross-container
   variables:
     IMAGE: fedora-win32-cross
+  artifacts:
+    paths:
+      - build/qemu-setup*.exe
 
 cross-win64-system:
   extends: .cross_system_build_job
@@ -167,6 +170,9 @@ cross-win64-system:
     job: win64-fedora-cross-container
   variables:
     IMAGE: fedora-win64-cross
+  artifacts:
+    paths:
+      - build/qemu-setup*.exe
 
 cross-amd64-xen-only:
   extends: .cross_accel_build_job
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index ff706040c4..d3f13666e8 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -13,6 +13,7 @@ ENV PACKAGES \
     hostname \
     make \
     meson \
+    mingw32-nsis \
     mingw64-bzip2 \
     mingw64-curl \
     mingw64-glib2 \
-- 
2.27.0


