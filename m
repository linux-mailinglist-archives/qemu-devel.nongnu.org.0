Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F648C3A0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:59:54 +0100 (CET)
Received: from localhost ([::1]:48436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cID-0001tQ-HA
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnO-0003Bj-Ou
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:28:02 -0500
Received: from [2a00:1450:4864:20::42c] (port=43742
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnM-0003Rq-GW
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:28:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o3so3580655wrh.10
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fWtsyrztzrr+E9OBKvYDFopI1OZd6GS5DDrBkqtGm8=;
 b=iWe0AEg9Wi/X24MUy0LcB/YNvc9dPUXNjrmNx0bOijxtn2TgdiqwtfUgefjiE6SbaV
 ioR4Cr62L0NbMcuEPzE8LGSpyk3PIwL4FVtspMa58HL2784L5XBYGIWjodWF0Ye1vyM2
 xLZy1avpRFXY0UU5WNOxJqnrhRj2cUE0rRkT+S5JkeIV21u6O6XApd7fh0qACO1Juu4Q
 ZNk6RfLuwlqag8g3yOm/aGam2urGZvdDF43yM/acIAunDxCV8PP9nzSYpXlqYcHAs7FL
 mLcOs3ttO2byAmmAyMoWwYNr+GtcnrGuITRyDUha/J0dzlTnCzmBcMsNNxYW6qFLhloe
 pZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fWtsyrztzrr+E9OBKvYDFopI1OZd6GS5DDrBkqtGm8=;
 b=W0VlAbEDED4JCN+pBxWxvj78rYfqFFZp9dBBoOlj95bueUBHZs0UVOps+QsryJyFt/
 37fDdYgud/AfaOYi4Mdo2X3x0LSGIdOZsTlg+Io6iUS4LA1ODHAwGaLnVQGRW9z0lZBY
 ZbHendIYU7qByLMf5VAMGX5T5s1ykd5KpVsSi5cJYz2QCdKVajWIi4TKBfl0UJtJuRPP
 iLUqip0rENrA2sLXcvBo7ot9HIZbG/O4nReqP5pqvDGK+5q0k6i/vqmni1rdk/zoUF9l
 /LOpn4Vqzpgrk4HpVjEShzF1S41IRy2qfxT7VcHcgXa7gC+zoQ+yFU5Ugne03CetoOox
 sVFg==
X-Gm-Message-State: AOAM53094tsIWjX7/8FTjGdjS+HdB2r2w2xbJKU/AfNssqBGfuZsV1SA
 ZnaOBydf6/q/0M4gWMWR6tbCwA==
X-Google-Smtp-Source: ABdhPJzT/u43m478H9YTRg8h4b3MQtKJwqHTFya6RXs55lufhuy6VTWISbM2Jd4emPh3OlTjRc14hw==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr7710865wra.212.1641986878540; 
 Wed, 12 Jan 2022 03:27:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y8sm12897550wrd.10.2022.01.12.03.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E13DD1FFCA;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/31] tests/docker: auto-generate alpine.docker with lcitool
Date: Wed, 12 Jan 2022 11:27:09 +0000
Message-Id: <20220112112722.3641051-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-19-berrange@redhat.com>
Message-Id: <20220105135009.1584676-19-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 0ac30c8014..97c7a88d1f 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -1,109 +1,122 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile alpine-edge qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
 
-FROM alpine:edge
+FROM docker.io/library/alpine:edge
 
-RUN apk update
-RUN apk upgrade
+RUN apk update && \
+    apk upgrade && \
+    apk add \
+        alsa-lib-dev \
+        attr-dev \
+        bash \
+        bc \
+        bzip2 \
+        bzip2-dev \
+        ca-certificates \
+        capstone-dev \
+        ccache \
+        cdrkit \
+        ceph-dev \
+        clang \
+        ctags \
+        curl-dev \
+        cyrus-sasl-dev \
+        dbus \
+        diffutils \
+        dtc-dev \
+        eudev-dev \
+        findutils \
+        g++ \
+        gcc \
+        gcovr \
+        gettext \
+        git \
+        glib-dev \
+        glib-static \
+        gnutls-dev \
+        gtk+3.0-dev \
+        libaio-dev \
+        libbpf-dev \
+        libcap-ng-dev \
+        libdrm-dev \
+        libepoxy-dev \
+        libffi-dev \
+        libgcrypt-dev \
+        libjpeg-turbo-dev \
+        libnfs-dev \
+        libpng-dev \
+        libseccomp-dev \
+        libselinux-dev \
+        libslirp-dev \
+        libssh-dev \
+        libtasn1-dev \
+        liburing-dev \
+        libusb-dev \
+        libxml2-dev \
+        linux-pam-dev \
+        llvm11 \
+        lttng-ust-dev \
+        lzo-dev \
+        make \
+        mesa-dev \
+        meson \
+        multipath-tools \
+        ncurses-dev \
+        ndctl-dev \
+        net-tools \
+        nettle-dev \
+        nmap-ncat \
+        numactl-dev \
+        openssh-client \
+        pcre-dev \
+        perl \
+        perl-test-harness \
+        pixman-dev \
+        pkgconf \
+        pulseaudio-dev \
+        py3-numpy \
+        py3-pillow \
+        py3-pip \
+        py3-sphinx \
+        py3-sphinx_rtd_theme \
+        py3-virtualenv \
+        py3-yaml \
+        python3 \
+        rpm2cpio \
+        samurai \
+        sdl2-dev \
+        sdl2_image-dev \
+        sed \
+        snappy-dev \
+        sparse \
+        spice-dev \
+        spice-protocol \
+        tar \
+        tesseract-ocr \
+        texinfo \
+        usbredir-dev \
+        util-linux \
+        vde2-dev \
+        virglrenderer-dev \
+        vte3-dev \
+        which \
+        xen-dev \
+        xfsprogs-dev \
+        zlib-dev \
+        zlib-static \
+        zstd-dev && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-	alsa-lib-dev \
-	attr-dev \
-	bash \
-	bc \
-	bzip2 \
-	bzip2-dev \
-	ca-certificates \
-	capstone-dev \
-	ccache \
-	cdrkit \
-	ceph-dev \
-	clang \
-	ctags \
-	curl-dev \
-	cyrus-sasl-dev \
-	dbus \
-	diffutils \
-	dtc-dev \
-	eudev-dev \
-	findutils \
-	g++ \
-	gcc \
-	gcovr \
-	gettext \
-	git \
-	glib-dev \
-	glib-static \
-	gnutls-dev \
-	gtk+3.0-dev \
-	libaio-dev \
-	libbpf-dev \
-	libcap-ng-dev \
-	libdrm-dev \
-	libepoxy-dev \
-	libffi-dev \
-	libgcrypt-dev \
-	libjpeg-turbo-dev \
-	libnfs-dev \
-	libpng-dev \
-	libseccomp-dev \
-	libselinux-dev \
-	libslirp-dev \
-	libssh-dev \
-	libtasn1-dev \
-	liburing-dev \
-	libusb-dev \
-	libxml2-dev \
-	linux-pam-dev \
-	llvm11 \
-	lttng-ust-dev \
-	lzo-dev \
-	make \
-	mesa-dev \
-	meson \
-	multipath-tools \
-	ncurses-dev \
-	ndctl-dev \
-	net-tools \
-	nettle-dev \
-	nmap-ncat \
-	numactl-dev \
-	openssh-client \
-	pcre-dev \
-	perl \
-	perl-test-harness \
-	pixman-dev \
-	pkgconf \
-	pulseaudio-dev \
-	py3-numpy \
-	py3-pillow \
-	py3-pip \
-	py3-sphinx \
-	py3-sphinx_rtd_theme \
-	py3-virtualenv \
-	py3-yaml \
-	python3 \
-	rpm2cpio \
-	samurai \
-	sdl2-dev \
-	sdl2_image-dev \
-	sed \
-	snappy-dev \
-	sparse \
-	spice-dev \
-	spice-protocol \
-	tar \
-	tesseract-ocr \
-	texinfo \
-	usbredir-dev \
-	util-linux \
-	vde2-dev \
-	virglrenderer-dev \
-	vte3-dev \
-	which \
-	xen-dev \
-	xfsprogs-dev \
-	zlib-dev \
-	zlib-static \
-	zstd-dev
-
-RUN apk add $PACKAGES
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index b8cf0a7386..033120e223 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -84,6 +84,7 @@ try:
    generate_dockerfile("ubuntu2004", "ubuntu-2004",
                        trailer="".join(ubuntu2004_tsanhack))
    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
+   generate_dockerfile("alpine", "alpine-edge")
 
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
-- 
2.30.2


