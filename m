Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C0B3B168D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:13:42 +0200 (CEST)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyx3-0006Y4-G5
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvyvQ-0004PX-8P
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvyvN-00080L-1q
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624439515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lc5+MlIaN0SpBeuLPgviWkcFxoVDKJsKZrBsgN0Ih9I=;
 b=OJG+NTOjgjNNkf0l/e/ujiSA6+4najsmXHTzX/cK/KDN7XE4ZE+xr8TO94zLwEWte8fvUi
 L2mT4ltTd7CE6gffjy38R5iB8cJIrWhhPHOwT3Lu4CsfEFDm/MYuX2TO0L+TtkCkMHBf6a
 kOxRmbcK86B1p72K4IHIPXTddCKZ3C4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-qH-kJLY1PCeIP6SpMFvkPA-1; Wed, 23 Jun 2021 05:11:54 -0400
X-MC-Unique: qH-kJLY1PCeIP6SpMFvkPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61BDE100CA89;
 Wed, 23 Jun 2021 09:11:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CEF65C1CF;
 Wed, 23 Jun 2021 09:11:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 659971800916; Wed, 23 Jun 2021 11:11:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] ci: build & store windows installer
Date: Wed, 23 Jun 2021 11:11:35 +0200
Message-Id: <20210623091137.1156959-2-kraxel@redhat.com>
In-Reply-To: <20210623091137.1156959-1-kraxel@redhat.com>
References: <20210623091137.1156959-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build windows installer for qemu in gitlab CI,
store the result as artifact.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml               | 5 +++++
 .gitlab-ci.d/crossbuilds.yml                       | 6 ++++++
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 3 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 1be541174c91..7d3ad00a1eb9 100644
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
index 6b3865c9e83e..4ff3aa3cfcdd 100644
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
index f53007ac865e..5fbfe8892896 100644
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
2.31.1


