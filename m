Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A88475B65
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:07:13 +0100 (CET)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxVs7-0005WB-N7
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV98-0001vD-W5
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV97-0001I2-Ei
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639578040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gOQUM1Ij7p0AYRxB6QDTjLDL+wTmJNvB7whEkiQICQ=;
 b=ClEJmNQcAxk9V1ZqOi3KVCEds6PwYWmDeuA64S6gMU3GK0cKfF1bcmG0uZimWUFwxQ5ebx
 vEv7o5L35PX1kiHdL1mhzz03DtV+g58Zy2Y2+Qqc6xIizjIYbASvvAo66LfNLbAL0q1ypq
 Pr/n+TJ/QBL0tZG+zyNQmythRCgjg8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-ogMhA4SYOEGndXoz1wakug-1; Wed, 15 Dec 2021 09:20:40 -0500
X-MC-Unique: ogMhA4SYOEGndXoz1wakug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37791189CD29;
 Wed, 15 Dec 2021 14:20:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01E89101E59B;
 Wed, 15 Dec 2021 14:20:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/18] tests/docker: fully expand the alpine package list
Date: Wed, 15 Dec 2021 14:19:48 +0000
Message-Id: <20211215141949.3512719-18-berrange@redhat.com>
In-Reply-To: <20211215141949.3512719-1-berrange@redhat.com>
References: <20211215141949.3512719-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add many extra alpine packages to cover the various optional QEMU build
dependencies pulled in by other dockerfiles.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 58 +++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index ca4b3b58d2..0ac30c8014 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -7,11 +7,29 @@ RUN apk upgrade
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
 	alsa-lib-dev \
+	attr-dev \
 	bash \
+	bc \
+	bzip2 \
+	bzip2-dev \
+	ca-certificates \
+	capstone-dev \
 	ccache \
+	cdrkit \
+	ceph-dev \
+	clang \
+	ctags \
 	curl-dev \
+	cyrus-sasl-dev \
+	dbus \
+	diffutils \
+	dtc-dev \
+	eudev-dev \
+	findutils \
 	g++ \
 	gcc \
+	gcovr \
+	gettext \
 	git \
 	glib-dev \
 	glib-static \
@@ -20,34 +38,72 @@ ENV PACKAGES \
 	libaio-dev \
 	libbpf-dev \
 	libcap-ng-dev \
+	libdrm-dev \
+	libepoxy-dev \
 	libffi-dev \
+	libgcrypt-dev \
 	libjpeg-turbo-dev \
 	libnfs-dev \
 	libpng-dev \
 	libseccomp-dev \
+	libselinux-dev \
+	libslirp-dev \
 	libssh-dev \
+	libtasn1-dev \
+	liburing-dev \
 	libusb-dev \
 	libxml2-dev \
+	linux-pam-dev \
+	llvm11 \
+	lttng-ust-dev \
 	lzo-dev \
 	make \
 	mesa-dev \
 	meson \
+	multipath-tools \
 	ncurses-dev \
+	ndctl-dev \
+	net-tools \
+	nettle-dev \
+	nmap-ncat \
+	numactl-dev \
+	openssh-client \
+	pcre-dev \
 	perl \
+	perl-test-harness \
+	pixman-dev \
+	pkgconf \
 	pulseaudio-dev \
+	py3-numpy \
+	py3-pillow \
+	py3-pip \
 	py3-sphinx \
 	py3-sphinx_rtd_theme \
+	py3-virtualenv \
+	py3-yaml \
 	python3 \
+	rpm2cpio \
 	samurai \
+	sdl2-dev \
+	sdl2_image-dev \
+	sed \
 	snappy-dev \
+	sparse \
 	spice-dev \
+	spice-protocol \
+	tar \
+	tesseract-ocr \
 	texinfo \
 	usbredir-dev \
+	util-linux \
 	vde2-dev \
 	virglrenderer-dev \
 	vte3-dev \
+	which \
+	xen-dev \
 	xfsprogs-dev \
 	zlib-dev \
-	zlib-static
+	zlib-static \
+	zstd-dev
 
 RUN apk add $PACKAGES
-- 
2.33.1


