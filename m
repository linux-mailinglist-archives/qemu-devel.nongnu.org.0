Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF396E1C10
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 07:57:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnCOu-0007Lh-3O; Fri, 14 Apr 2023 01:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOr-0007LY-Eu
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pnCOi-0000IU-Jm
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 01:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681451693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXu1iBWmPnnbcqJanHFlz0WgmsKQEotu0q7wUfsyNgQ=;
 b=gLR5+RbMUe1+65pWK4uRr46HH5x9Z8aRbY9Wjadc/9jmeUwuxL+ouINxAYLQdDWkI+/Twb
 CI5mtf0hC6BW7w9KSOk7X/WOGk2hWtVuYF4zE1LlnX3/1SKslt+9qM/dDrvlSTaO+XZzAP
 WZjUSSEXRh0Rv8lMmAeDVIRTYM3Zi7w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-dzCrsnhrOB2WuXAaLA-tKQ-1; Fri, 14 Apr 2023 01:54:52 -0400
X-MC-Unique: dzCrsnhrOB2WuXAaLA-tKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9C5A855304;
 Fri, 14 Apr 2023 05:54:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25A2EC1602A;
 Fri, 14 Apr 2023 05:54:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Kyle Evans <kevans@freebsd.org>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 02/10] tests: add python3-venv dependency
Date: Fri, 14 Apr 2023 01:54:41 -0400
Message-Id: <20230414055449.4028284-3-jsnow@redhat.com>
In-Reply-To: <20230414055449.4028284-1-jsnow@redhat.com>
References: <20230414055449.4028284-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Several debian-based tests need the python3-venv dependency as a
consequence of Debian debundling the "ensurepip" module normally
included with Python.

As mkvenv.py stands as of this commit, Debian requires EITHER:

(A) setuptools and pip, or
(B) ensurepip

mkvenv is a few seconds faster if you have setuptools and pip, so
developers should prefer the first requirement. For the purposes of CI,
the time-save is a wash; it's only a matter of who is responsible for
installing pip and when; the timing is about the same.

Arbitrarily, I chose adding ensurepip to the test configuration because
it is normally part of the Python stdlib, and always having it allows us
a more consistent cross-platform environment.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/dockerfiles/debian-all-test-cross.docker | 3 ++-
 tests/docker/dockerfiles/debian-hexagon-cross.docker  | 3 ++-
 tests/docker/dockerfiles/debian-riscv64-cross.docker  | 3 ++-
 tests/docker/dockerfiles/debian-tricore-cross.docker  | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index 981e9bdc7b..f9f401544a 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -57,7 +57,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         gcc-sh4-linux-gnu \
         libc6-dev-sh4-cross \
         gcc-sparc64-linux-gnu \
-        libc6-dev-sparc64-cross
+        libc6-dev-sparc64-cross \
+        python3-venv
 
 ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
 ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index b99d99f943..c2cfb6a5d0 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -20,7 +20,8 @@ RUN apt-get update && \
         bison \
         flex \
         git \
-        ninja-build && \
+        ninja-build \
+        python3-venv && \
 # Install QEMU build deps for use in CI
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 803afb9573..081404e014 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -28,7 +28,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
     libglib2.0-dev \
     ninja-build \
     pkg-config \
-    python3
+    python3 \
+    python3-venv
 
 # Add ports and riscv64 architecture
 RUN echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list
diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index cfd2faf9a8..269bfa8d42 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -33,7 +33,8 @@ RUN apt update && \
        pkgconf \
        python3-pip \
        python3-setuptools \
-       python3-wheel
+       python3-wheel \
+       python3-venv
 
 RUN curl -#SL https://github.com/bkoppelmann/package_940/releases/download/tricore-toolchain-9.40/tricore-toolchain-9.4.0.tar.gz \
     | tar -xzC /usr/local/
-- 
2.39.2


