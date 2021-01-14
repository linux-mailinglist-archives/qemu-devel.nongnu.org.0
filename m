Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A72F6193
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:12:51 +0100 (CET)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02Qk-0002Qa-Ln
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HJ-0001L2-Vp
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HH-0007wr-Ly
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvPAoxhTesrHou+9PyRxzeoIdLsDHpTcXF4NMwfFY6s=;
 b=OHiHpHc5ot9qjRPJFTpf4Z3uO17EOFCT12n2B8lSXeAF4wmtPdYAxCnhJg91M0znpU4tmH
 B5nAxf9XduL3Kqpg94CQ5UMY+73LDXlmbhVmN+XX/wtglUqQgO9tLNIF2SS2uoRfZYgiPs
 OIfcgYYnYFdnYauY3X3NuVGELHfb8G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-LsP_xLB8Na-ysYmuTZHlpA-1; Thu, 14 Jan 2021 08:02:59 -0500
X-MC-Unique: LsP_xLB8Na-ysYmuTZHlpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D07B4180A09F;
 Thu, 14 Jan 2021 13:02:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0ACA5F708;
 Thu, 14 Jan 2021 13:02:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/25] tests/docker: use explicit docker.io registry
Date: Thu, 14 Jan 2021 13:02:24 +0000
Message-Id: <20210114130245.1654081-5-berrange@redhat.com>
In-Reply-To: <20210114130245.1654081-1-berrange@redhat.com>
References: <20210114130245.1654081-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is good practice to use an explicit registry for referencing the base
image. This is because some distros will inject their own registries
into the search path. For example registry.fedoraproject.org comes ahead
of docker.io. Using an explicit registry avoids wasting time querying
multiple registries for images that they won't have.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/centos7.docker             | 2 +-
 tests/docker/dockerfiles/centos8.docker             | 2 +-
 tests/docker/dockerfiles/debian-xtensa-cross.docker | 2 +-
 tests/docker/dockerfiles/debian10.docker            | 2 +-
 tests/docker/dockerfiles/debian11.docker            | 2 +-
 tests/docker/dockerfiles/ubuntu.docker              | 2 +-
 tests/docker/dockerfiles/ubuntu1804.docker          | 2 +-
 tests/docker/dockerfiles/ubuntu2004.docker          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index d47c96135c..66d805dec3 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -1,4 +1,4 @@
-FROM centos:7
+FROM docker.io/centos:7
 RUN yum install -y epel-release centos-release-xen-48
 
 RUN yum -y update
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 0c90c3d4d5..a95350466a 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,4 +1,4 @@
-FROM centos:8.3.2011
+FROM docker.io/centos:8
 
 RUN dnf -y update
 ENV PACKAGES \
diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
index ba4148299c..2f11b3b7bc 100644
--- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
+++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
@@ -5,7 +5,7 @@
 # using a prebuilt toolchains for Xtensa cores from:
 # https://github.com/foss-xtensa/toolchain/releases
 #
-FROM debian:stretch-slim
+FROM docker.io/library/debian:stretch-slim
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 9d42b5a4b8..a1a0c18fc1 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -7,7 +7,7 @@
 # On its own you can't build much but the docker-foo-cross targets
 # build on top of the base debian image.
 #
-FROM debian:buster-slim
+FROM docker.io/library/debian:buster-slim
 
 # Duplicate deb line as deb-src
 RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
diff --git a/tests/docker/dockerfiles/debian11.docker b/tests/docker/dockerfiles/debian11.docker
index 5adfd62d55..febf884f8f 100644
--- a/tests/docker/dockerfiles/debian11.docker
+++ b/tests/docker/dockerfiles/debian11.docker
@@ -8,7 +8,7 @@
 # On its own you can't build much but the docker-foo-cross targets
 # build on top of the base debian image.
 #
-FROM debian:bullseye-slim
+FROM docker.io/library/debian:bullseye-slim
 
 # Duplicate deb line as deb-src
 RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index 9dec1c4bc6..ef44b0e360 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -9,7 +9,7 @@
 # system won't pick up that it has changed.
 #
 
-FROM ubuntu:20.04
+FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
     ccache \
     clang \
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index aacea8627a..751e6503f8 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -1,4 +1,4 @@
-FROM ubuntu:18.04
+FROM docker.io/library/ubuntu:18.04
 ENV PACKAGES \
     ccache \
     clang \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 52810d4e27..32caf57b5d 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,4 +1,4 @@
-FROM ubuntu:20.04
+FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES flex bison \
     ccache \
     clang-10\
-- 
2.29.2


