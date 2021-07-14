Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC63C876B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:27:41 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gnU-0008QL-H1
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUx-0006xu-HL
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUv-00042q-UC
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3627408wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Kc/AtnrUFUSMDCa/D5pKIGcs4TC9hfXWUXk1KzQyfo=;
 b=gXxrtNdK41KWcebkuolUKtcFpA4cQh0oF4JtES2CX6ISPmmRErVzcwxNeEYXAaIX6J
 DC5ccFPay2nTf0wvxhxw2qUMi752ojDDXs/32ALPMjAvVu9w+eXhftVoH/mpu+QTPO5e
 UMD5y9RW44iD/TixKM0rBZsZkLz0VYFjEXNN729uWRtch4MPA/IIlYmxd8JFOb2IaPbS
 suS+hgFIIXLMETC6bcgcKkQwHg8vk08KOVm9JTXco2UInjaIIR0y5hQITxgFQQehf1Cj
 BJm4s2HgZjlXixvWlDY+ufmRIvCc3fhF/fxK7qRqfyoV0bz2H+GF53iG6w0k3fdsjsp9
 mqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Kc/AtnrUFUSMDCa/D5pKIGcs4TC9hfXWUXk1KzQyfo=;
 b=N+eOZ6SHZyrxmU03Jxfiu69Iq/di5WbAIlyOX+DrIKpKjfhN5mNzExmRUUZlxilTDL
 aJdi3xfpVuOIO0Jn0rhKti2696YMdSLuSVj3X3wpoCUMwLOn9Hx05HEDj4qkSWNPd4BA
 JZtSUwuL/SjhT4TeYd3qhw/dFWy9vGfIx66GRjeciSAmdYPKIkwM/3vatQz6iTt009LS
 xk1k26qBBTBGOqWvPZketYiWr2mSSKiqK6RfrQSZy3+ADT+mET2pW1tyM/qlW5p7Gp+V
 6LlTBwdlIY3miJdBx0/Mp4VP1oDjEhrDAWTs/o7dop0rniIWoa2KyQpqvUaNqYc/WJzA
 hm5A==
X-Gm-Message-State: AOAM533a9qXKvUj+mT3y06tr6faQhQePtGGHtJ6zlH1Cagg1/gVQQrIj
 lDWD5XatXF1txGRRkbXNov+1qQ==
X-Google-Smtp-Source: ABdhPJyrJ9XVW8LJjyjMYyd2PW1bXcwVXxxHlmRNooI4PB0wl8M7vXVsh/kNNMemZNlZEMqIzwpvmw==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr4654051wmb.27.1626275308519; 
 Wed, 14 Jul 2021 08:08:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k13sm3217728wrp.34.2021.07.14.08.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 837201FFB1;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 25/44] tests/docker: expand opensuse-leap package list
Date: Wed, 14 Jul 2021 16:00:17 +0100
Message-Id: <20210714150036.21060-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-16-berrange@redhat.com>
Message-Id: <20210709143005.1554-24-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 6011447181..5a8bee0289 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -2,53 +2,110 @@ FROM registry.opensuse.org/opensuse/leap:15.2
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    Mesa-devel \
+    alsa-lib-devel \
     bc \
     brlapi-devel \
     bzip2 \
+    ca-certificates \
     ccache \
+    clang \
+    ctags \
     cyrus-sasl-devel \
+    dbus-1 \
+    diffutils \
+    findutils \
     gcc \
     gcc-c++ \
+    gcovr \
     gettext-runtime \
     git \
     glib2-devel \
+    glibc-locale \
+    glibc-static \
     glusterfs-devel \
     gtk3-devel \
+    hostname \
+    jemalloc-devel \
     libSDL2-devel \
     libSDL2_image-devel \
     libaio-devel \
+    libasan6 \
     libattr-devel \
+    libbpf-devel \
+    libbz2-devel \
+    libcacard-devel \
     libcap-ng-devel \
+    libcurl-devel \
+    libdrm-devel \
     libepoxy-devel \
     libfdt-devel \
+    libffi-devel \
+    libgcrypt-devel \
     libgnutls-devel \
     libiscsi-devel \
     libjpeg8-devel \
+    libndctl-devel \
+    libnettle-devel \
+    libnfs-devel \
     libnuma-devel \
     libpixman-1-0-devel \
     libpmem-devel \
     libpng16-devel \
+    libpulse-devel \
     librbd-devel \
     libseccomp-devel \
     libspice-server-devel \
     libssh-devel \
+    libtasn1-devel \
+    libubsan1 \
+    libudev-devel \
+    libusb-1_0-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lttng-ust-devel \
     lzo-devel \
     make \
     mkisofs \
+    ncat \
     ncurses-devel \
     ninja \
-    perl \
+    openssh \
+    pam-devel \
+    perl-Test-Harness \
+    perl-base \
+    pkgconfig \
+    python3-Pillow \
+    python3-PyYAML \
+    python3-Sphinx \
     python3-base \
+    python3-numpy \
+    python3-opencv \
+    python3-pip \
+    python3-setuptools \
+    python3-sphinx_rtd_theme \
     python3-virtualenv \
+    python3-wheel \
     rdma-core-devel \
+    rpm \
+    sed \
     snappy-devel \
+    sparse \
+    spice-protocol-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    texinfo \
     usbredir-devel \
+    util-linux \
     virglrenderer-devel \
     vte-devel \
+    which \
     xen-devel \
+    xfsprogs-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
 
-- 
2.20.1


