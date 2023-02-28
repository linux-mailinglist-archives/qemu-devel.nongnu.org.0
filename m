Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2C96A5F8A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:20:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5W2-0006cm-Tj; Tue, 28 Feb 2023 14:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5W1-0006ce-Dp
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:19:57 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Vy-0005f5-VK
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:19:57 -0500
Received: by mail-ed1-x52e.google.com with SMTP id da10so44541559edb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwYY7NV09cuWvizRWq2tp0nWcEdq1eb5rB5IMzSHL4s=;
 b=wqsw2txH5VO9O9QSv5ebkcEyxfPgnY+FELStlf4FepgUBeNpTFGnqqJ4gq3vZkpexC
 ZHdvotIhm5zd3YYHaXd3ne04C3vOacnN7ijJfjJQefztaM//HDb8dKRaverH7PPnT64E
 exdarxk2J4huwVE60jtnoOg+kxmbMBZk+ykJAYxruiArxInGorUiwANICTVxt0enRWrk
 6aCfliBG4jMG5pwdEdN1NXqz0A5jMK5n24zwejIHbsvp2vccZFxYhPqAuhrdCbek8IH5
 iwTNdbZ/ud8De+OFg6vD63z63cDX5f5H2sLZZnyofovYPglUV+L+Cl3VL9WwCHOypnxV
 QGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JwYY7NV09cuWvizRWq2tp0nWcEdq1eb5rB5IMzSHL4s=;
 b=6ds/+3qLrJ2769DhIXeeFCGTy//K93nIT6N0XDZAVXX2m58v0G1wJhTSZFpBbXztB9
 BAOminIP34ujKsU1jI5CcUmRdMK0y+xSbYC3fG3uddHtGZgkix2oqQLQVHco2zLRdvOn
 BaHZ3Bo7Ot3BTJpswQqbxzzd6kyAkaGi0Cy1G/UEZ+wUTYKK7US4rOxprkKugQyrxYW8
 tR8Hmh5GRYVuGgu2a7VYR3ufe8yeLRvVa9wiaf9No+KmOXYb2LavTB4ogV3utDji8Oqf
 m8Ygw6qz2WGkzGw147sDGq1YyKMGWHbMUyVmtFXCOt7sR2Iw7WNJfJlH4A/W+Cug786O
 ml6w==
X-Gm-Message-State: AO0yUKUOm+2bl2p3Uv0VdKfGA+QDnJfzZvD8hmDTRF/PVHdsFqiIulPo
 759l5h96dryfoVca4NXfPwwUavNQoZqDJlP1
X-Google-Smtp-Source: AK7set8Wwa0HzBK4Xm/mBzkz1rVg/9Ben3QpACIrPxR8rAtIIa9HNJ70Dtlx9YxEgay2pR6dGrpExg==
X-Received: by 2002:a05:600c:474f:b0:3eb:2e27:2d0c with SMTP id
 w15-20020a05600c474f00b003eb2e272d0cmr3192099wmo.1.1677611663157; 
 Tue, 28 Feb 2023 11:14:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b003e2066a6339sm13120526wmf.5.2023.02.28.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:14:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83DED1FFBA;
 Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 18/24] tests/lcitool: append user setting stanza to
 dockerfiles
Date: Tue, 28 Feb 2023 19:06:47 +0000
Message-Id: <20230228190653.1602033-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

For the cross-compilation use-case it is important to add the host
user to the dockerfile so we can map them to the docker environment
when cross-building files.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - don't apply USER/UID to cirrus images
---
 tests/docker/dockerfiles/alpine.docker            |  5 +++++
 tests/docker/dockerfiles/centos8.docker           |  5 +++++
 .../docker/dockerfiles/debian-amd64-cross.docker  |  5 +++++
 tests/docker/dockerfiles/debian-amd64.docker      |  5 +++++
 .../docker/dockerfiles/debian-arm64-cross.docker  |  5 +++++
 .../docker/dockerfiles/debian-armel-cross.docker  |  5 +++++
 .../docker/dockerfiles/debian-armhf-cross.docker  |  5 +++++
 .../dockerfiles/debian-mips64el-cross.docker      |  5 +++++
 .../docker/dockerfiles/debian-mipsel-cross.docker |  5 +++++
 .../dockerfiles/debian-ppc64el-cross.docker       |  5 +++++
 .../docker/dockerfiles/debian-s390x-cross.docker  |  5 +++++
 .../docker/dockerfiles/fedora-win32-cross.docker  |  5 +++++
 .../docker/dockerfiles/fedora-win64-cross.docker  |  5 +++++
 tests/docker/dockerfiles/fedora.docker            |  5 +++++
 tests/docker/dockerfiles/opensuse-leap.docker     |  5 +++++
 tests/docker/dockerfiles/ubuntu2004.docker        |  5 +++++
 tests/docker/dockerfiles/ubuntu2204.docker        |  5 +++++
 tests/lcitool/refresh                             | 15 +++++++++++++++
 18 files changed, 100 insertions(+)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 56cf14e553..33e4823400 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -124,3 +124,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 1291ae1b04..28c5e7e43c 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -134,3 +134,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 856db95100..5d03b5c22d 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -169,3 +169,8 @@ ENV ABI "x86_64-linux-gnu"
 ENV MESON_OPTS "--cross-file=x86_64-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-linux-gnu-
 ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user,i386-softmmu,i386-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index e3dba71ad5..febc46e700 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -155,3 +155,8 @@ RUN git clone https://github.com/luigirizzo/netmap.git /usr/src/netmap
 RUN cd /usr/src/netmap && git checkout v11.3
 RUN cd /usr/src/netmap/LINUX && ./configure --no-drivers --no-apps --kernel-dir=$(ls -d /usr/src/linux-headers-*-amd64) && make install
 ENV QEMU_CONFIGURE_OPTS --enable-netmap
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b00e9e9bcf..b9501a21bc 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -168,3 +168,8 @@ ENV ABI "aarch64-linux-gnu"
 ENV MESON_OPTS "--cross-file=aarch64-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
 ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index fb1129f256..f21742ede5 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -167,3 +167,8 @@ ENV ABI "arm-linux-gnueabi"
 ENV MESON_OPTS "--cross-file=arm-linux-gnueabi"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabi-
 ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user,armeb-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 7a2b864a38..decdeda6f2 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -168,3 +168,8 @@ ENV ABI "arm-linux-gnueabihf"
 ENV MESON_OPTS "--cross-file=arm-linux-gnueabihf"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
 ENV DEF_TARGET_LIST arm-softmmu,arm-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 5a3340e964..1df05fcf20 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -165,3 +165,8 @@ ENV ABI "mips64el-linux-gnuabi64"
 ENV MESON_OPTS "--cross-file=mips64el-linux-gnuabi64"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=mips64el-linux-gnuabi64-
 ENV DEF_TARGET_LIST mips64el-softmmu,mips64el-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 422fdebe8f..019b8dcaff 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -165,3 +165,8 @@ ENV ABI "mipsel-linux-gnu"
 ENV MESON_OPTS "--cross-file=mipsel-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=mipsel-linux-gnu-
 ENV DEF_TARGET_LIST mipsel-softmmu,mipsel-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 78d7ae6211..3ceab4c502 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -167,3 +167,8 @@ ENV ABI "powerpc64le-linux-gnu"
 ENV MESON_OPTS "--cross-file=powerpc64le-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=powerpc64le-linux-gnu-
 ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index d06ea3605a..6c216dde48 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -166,3 +166,8 @@ ENV ABI "s390x-linux-gnu"
 ENV MESON_OPTS "--cross-file=s390x-linux-gnu"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=s390x-linux-gnu-
 ENV DEF_TARGET_LIST s390x-softmmu,s390x-linux-user
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 21ed1c6081..a5689b616b 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -100,3 +100,8 @@ ENV ABI "i686-w64-mingw32"
 ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw32.meson"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-w64-mingw32-
 ENV DEF_TARGET_LIST i386-softmmu
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 95d30e7936..c066c20241 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -100,3 +100,8 @@ ENV ABI "x86_64-w64-mingw32"
 ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw64.meson"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32-
 ENV DEF_TARGET_LIST x86_64-softmmu
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 8e06d080b8..4dd1fce890 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -146,3 +146,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 568c1c979f..7ea22a8c1e 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -137,3 +137,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 75233064de..ed5855295f 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -146,3 +146,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 30b9e56793..6fea090f02 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -145,3 +145,8 @@ ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
+# As a final step configure the user (if env is defined)
+ARG USER
+ARG UID
+RUN if [ "${USER}" ]; then \
+  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index cc9e34ac87..c0d7ad5516 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -53,6 +53,15 @@ def generate(filename, cmd, trailer):
         content += trailer
     atomic_write(filename, content)
 
+# Optional user setting, this will always be the last thing added
+# so maximise the number of layers that are cached
+add_user_mapping = [
+    "# As a final step configure the user (if env is defined)",
+    "ARG USER",
+    "ARG UID",
+    "RUN if [ \"${USER}\" ]; then \\",
+    "  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi\n"
+]
 
 def generate_dockerfile(host, target, cross=None, trailer=None):
     filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
@@ -60,6 +69,12 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
     if cross is not None:
         cmd.extend(["--cross", cross])
     cmd.extend([target, "qemu"])
+
+    if trailer is not None:
+        trailer += "\n".join(add_user_mapping)
+    else:
+        trailer = "\n".join(add_user_mapping)
+
     generate(filename, cmd, trailer)
 
 
-- 
2.39.2


