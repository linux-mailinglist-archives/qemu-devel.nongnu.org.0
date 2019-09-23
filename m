Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F376BBB28
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 20:20:34 +0200 (CEST)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCSwr-0007b0-2m
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 14:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iCSoT-0000v1-87
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iCSoR-0000pD-GQ
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iCSoR-0000n3-6h
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:51 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 331743058359;
 Mon, 23 Sep 2019 18:11:50 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-231.bos.redhat.com [10.18.17.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E7981001B00;
 Mon, 23 Sep 2019 18:11:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] docker: remove unused debian-sid
Date: Mon, 23 Sep 2019 14:11:39 -0400
Message-Id: <20190923181140.7235-6-jsnow@redhat.com>
In-Reply-To: <20190923181140.7235-1-jsnow@redhat.com>
References: <20190923181140.7235-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 23 Sep 2019 18:11:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

debian-sid is listed as a partial image, so we cannot run tests against i=
t.
Since it isn't used by any other testable image, remove it for now as it
is prone to bitrot.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/Makefile.include              |  2 +-
 tests/docker/dockerfiles/debian-sid.docker | 35 ----------------------
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-sid.docker

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
index 7bcd97101e..d7b1082b5b 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -5,7 +5,7 @@
 DOCKER_SUFFIX :=3D .docker
 DOCKER_FILES_DIR :=3D $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another ima=
ge)
-DOCKER_PARTIAL_IMAGES :=3D debian9 debian10 debian-sid
+DOCKER_PARTIAL_IMAGES :=3D debian9 debian10
 DOCKER_PARTIAL_IMAGES +=3D debian9-mxe debian-bootstrap
 DOCKER_IMAGES :=3D $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_=
DIR)/*.docker))))
 DOCKER_TARGETS :=3D $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
diff --git a/tests/docker/dockerfiles/debian-sid.docker b/tests/docker/do=
ckerfiles/debian-sid.docker
deleted file mode 100644
index 2a1bcc33b2..0000000000
--- a/tests/docker/dockerfiles/debian-sid.docker
+++ /dev/null
@@ -1,35 +0,0 @@
-#
-# Debian Sid Base
-#
-# Currently we can build all our guests with cross-compilers in the
-# latest Debian release (Buster). However new compilers will first
-# arrive in Sid. However Sid is a rolling distro which may be broken
-# at any particular time. To try and mitigate this we use Debian's
-# snapshot archive which provides a "stable" view of what state Sid
-# was in.
-#
-
-# This must be earlier than the snapshot date we are aiming for
-FROM debian:sid-20190812-slim
-
- # Use a snapshot known to work (see http://snapshot.debian.org/#Usage)
-ENV DEBIAN_SNAPSHOT_DATE "20190820"
-RUN sed -i "s%^deb \(https\?://\)deb.debian.org/debian/\? \(.*\)%deb [ch=
eck-valid-until=3Dno] \1snapshot.debian.org/archive/debian/${DEBIAN_SNAPS=
HOT_DATE} \2%" /etc/apt/sources.list
-
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sou=
rces.list
-
-# Install common build utilities
-RUN apt update && \
-    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        bison \
-        build-essential \
-        ca-certificates \
-        flex \
-        git \
-        pkg-config \
-        psmisc \
-        python \
-        texinfo || { echo "Failed to build - see debian-sid.docker notes=
"; exit 1; }
--=20
2.21.0


