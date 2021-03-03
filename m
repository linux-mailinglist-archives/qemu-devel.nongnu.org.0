Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8E332B7DD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:43:57 +0100 (CET)
Received: from localhost ([::1]:46616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQr6-0008R4-6U
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHQph-0007g2-He
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:42:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHQpf-0005Ei-OP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614775347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=20U0L7sZSyiRkqIT2+9P3efvWI7ED9JdihB6qw0d1pQ=;
 b=fOFMbOt74/EtwEDJSAyXY6RP66obFeA7f7zmDq/N5JQV1jDF6rw2ORSjH804n/KqFWodIF
 ycEVvclYGvUYnLkG2kB7EEKw6G7L2pTWS5EPJQ7/SvKifVuCEcluT7sQqNzx9whVDv1gg1
 /1jYJgf4z2nXwn3hnX7kPOGfAqmu1tE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-1Jot_JlwPYyGW94yijATQQ-1; Wed, 03 Mar 2021 07:42:25 -0500
X-MC-Unique: 1Jot_JlwPYyGW94yijATQQ-1
Received: by mail-wm1-f72.google.com with SMTP id y9so1754987wma.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 04:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=20U0L7sZSyiRkqIT2+9P3efvWI7ED9JdihB6qw0d1pQ=;
 b=CmJBC0SNFGtnZjAIc5xZjXyArFDm+QXbFNo/8DhuiO2TR5lt66f3Ue0+93T+2c9Xmr
 sI7NK2fpUV7bCH/8C+suWFs98+DtcdjiLsAe+eeSSl8HvvHfSdWd9HYgcpcUF/btoCAM
 SykuvKwG7zcL2OQT5KYtpJYPYGGTsu1T2875QFJnbJUGsQznA+Bk3Z8pbK2RUDk3THKN
 XPaL6RcFcxiDHd2NdOw8zWlJcj/GqiXbjwbQ3y1/kWpzTTAJNjIy18NsirFQV73vdqLg
 cQdsJyLuuLT+3CS7oy+zb8MBh93O2wZXD5tw/4YEhtj/Qd9xcM9DZ6D0vWxdl1N6iwVA
 QgnA==
X-Gm-Message-State: AOAM531ofPA+K2lZcIBTPqDUeqTbUGGUAvbYOSbGUBz1HtmoRrXgXvIP
 gzPjzwlsOvZkKIXWGaaWPvKpCzuqC7Sh1BPTECA5kzABbOIJWupXvzCbnwAlT2LP8at+ZrkAAUO
 /MXBgyhp0Gyd7Wig=
X-Received: by 2002:a5d:6181:: with SMTP id j1mr26802037wru.11.1614775344363; 
 Wed, 03 Mar 2021 04:42:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN7zBfxpmCOcIHQiHfcclvDK2des+2KjF1RvYKEq5RmozAhzZijrlJhliFem3x4dGeAS/enA==
X-Received: by 2002:a5d:6181:: with SMTP id j1mr26802010wru.11.1614775344099; 
 Wed, 03 Mar 2021 04:42:24 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z21sm5949439wma.29.2021.03.03.04.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:42:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] docker: Base Fedora MinGW cross containers on the base Fedora
 image
Date: Wed,  3 Mar 2021 13:42:22 +0100
Message-Id: <20210303124222.1485332-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only difference between fedora-winXX-cross.docker and
fedora.docker is the specific QEMU_CONFIGURE_OPTS environment
variable. All the rest can be inherited from the generic Fedora
image.
Basing the cross containers on the generic Fedora allows us to
- save registry/local storage
- use more tools in the cross container (ccache for example).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/containers.yml                   |  4 ++
 tests/docker/Makefile.include                 |  2 +
 .../dockerfiles/fedora-win32-cross.docker     | 41 +------------------
 .../dockerfiles/fedora-win64-cross.docker     | 37 +----------------
 4 files changed, 10 insertions(+), 74 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e233..1f7f82ece65 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -222,11 +222,15 @@ i386-fedora-cross-container:
 
 win32-fedora-cross-container:
   <<: *container_job_definition
+  stage: containers-layer2
+  needs: ['amd64-fedora-container']
   variables:
     NAME: fedora-win32-cross
 
 win64-fedora-cross-container:
   <<: *container_job_definition
+  stage: containers-layer2
+  needs: ['amd64-fedora-container']
   variables:
     NAME: fedora-win64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7cab761bf5b..5aa99df32ad 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -144,6 +144,8 @@ docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
+docker-image-fedora-win32-cross: docker-image-fedora
+docker-image-fedora-win64-cross: docker-image-fedora
 
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 81b5659e9c5..425f05c3e98 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,41 +1,4 @@
-FROM fedora:33
-
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    bc \
-    bzip2 \
-    diffutils \
-    findutils \
-    gcc \
-    gettext \
-    git \
-    hostname \
-    make \
-    meson \
-    mingw32-bzip2 \
-    mingw32-curl \
-    mingw32-glib2 \
-    mingw32-gmp \
-    mingw32-gnutls \
-    mingw32-gtk3 \
-    mingw32-libjpeg-turbo \
-    mingw32-libpng \
-    mingw32-libtasn1 \
-    mingw32-nettle \
-    mingw32-nsis \
-    mingw32-pixman \
-    mingw32-pkg-config \
-    mingw32-SDL2 \
-    perl \
-    perl-Test-Harness \
-    python3 \
-    python3-PyYAML \
-    tar \
-    which
-
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
-ENV FEATURES mingw
+FROM qemu/fedora
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-w64-mingw32-
+ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --cross-prefix=i686-w64-mingw32-
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index bcb428e7242..abdbce2a145 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,37 +1,4 @@
-FROM fedora:33
-
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    bc \
-    bzip2 \
-    diffutils \
-    findutils \
-    gcc \
-    gettext \
-    git \
-    hostname \
-    make \
-    meson \
-    mingw64-bzip2 \
-    mingw64-curl \
-    mingw64-glib2 \
-    mingw64-gmp \
-    mingw64-gtk3 \
-    mingw64-libjpeg-turbo \
-    mingw64-libpng \
-    mingw64-libtasn1 \
-    mingw64-pixman \
-    mingw64-pkg-config \
-    perl \
-    perl-Test-Harness \
-    python3 \
-    python3-PyYAML \
-    tar \
-    which
-
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
-ENV FEATURES mingw
+FROM qemu/fedora
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32- --disable-capstone
+ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32- --disable-capstone
-- 
2.26.2


