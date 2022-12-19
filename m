Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A23650DBA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 15:46:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7HO4-00079P-Tk; Mon, 19 Dec 2022 09:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p7HNz-00077F-1g
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:44:59 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1p7HNv-0003ZM-38
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:44:58 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDwEHp007735; Mon, 19 Dec 2022 14:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=haeM0FZyX9ne1ZZhzIIgNTSpdJ0yU8AKrd1bHE4PzIU=;
 b=VFqEmPqCoLR0o4ivFthfFMTok8xRyeMDD9YKgcbAMk0y+yAUmcEIqQvGw+p8A9Gbuv3i
 T2DdUkWIF7bfzJtLZKE8mst8q37XPre02jPtEoD+mhoGOmS3WoYBpAOgf/OL2X3o+Z/S
 k7UMHyscJ2HY24dit1f9dcTa1LuL+Ag/1wlJ0fNuMOnii50jbtw5T0KOXoWkI1aDQPAm
 i3qWO8ri3NKyRzG/FaiFw1nfx9qAv3Js+1fxd3dry1E8kTqYWgsElTF/2QkUnlvO4TAQ
 JRO/u8Ugto9gPe0HAqatQhBNI6DEwIrl310+0ySj91y8yfKoNyIr0sxD7+KiZiZvRdwA /g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mh5c7vhdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 14:44:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BJEio5d022583
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 14:44:50 GMT
Received: from mthiyaga-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 19 Dec 2022 06:44:46 -0800
From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
To: <qemu-devel@nongnu.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, "Wainer dos Santos
 Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
CC: <anjo@rev.ng>, <tsimpson@quicinc.com>, <bcain@quicinc.com>, <ale@rev.ng>, 
 <quic_mathbern@quicinc.com--annotate>, Mukilan Thiyagarajan
 <quic_mthiyaga@quicinc.com>
Subject: [PATCH] tests/docker: use prebuilt toolchain for debian-hexagon-cross
Date: Mon, 19 Dec 2022 20:13:54 +0530
Message-ID: <20221219144354.11659-1-quic_mthiyaga@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VvKuiu5SqERJui5exddDBP0J2sepoX0T
X-Proofpoint-ORIG-GUID: VvKuiu5SqERJui5exddDBP0J2sepoX0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190130
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The current docker image for cross compiling hexagon guests
is manually built since it takes >2 hours to build from source.

This patch:
 1. Solves the above issue by using the prebuilt clang
    toolchain hosted on CodeLinaro [1] and maintained by QUIC [2].
 2. The dockerfile is also switched from multi-stage to single stage
    build to allow the CI docker engine to reuse the layer cache.
 3. Re-enables the hexagon-cross-container job to be always run in
    CI and makes it a non-optional dependency for the
    build-user-hexagon job.

The changes for 1 & 2 together bring down the build time to
~3 minutes in GitLab CI when cache is reused and ~9 minutes
when cache cannot be reused.

[1]: https://github.com/CodeLinaro/hexagon-builder
[2]: https://github.com/quic/toolchain_for_hexagon/releases/

Based-on: <20221215095820.13374-1-quic._5Fmthiyaga@quicinc.com>
 tests/tcg/multiarch: remove unused variable in linux-test
Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
---
 .gitlab-ci.d/buildtest.yml                    |   4 -
 .gitlab-ci.d/container-cross.yml              |  19 +--
 tests/docker/Makefile.include                 |   4 -
 .../debian-hexagon-cross.d/build-toolchain.sh | 141 ------------------
 .../dockerfiles/debian-hexagon-cross.docker   |  53 +++----
 5 files changed, 20 insertions(+), 201 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d21b4a1fd4..93302a96e2 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -275,14 +275,10 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
-# Because the hexagon cross-compiler takes so long to build we don't rely
-# on the CI system to build it and hence this job has an optional dependency
-# declared. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
   needs:
     job: hexagon-cross-container
-    optional: true
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 2d560e9764..5486dc43c6 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -37,28 +37,11 @@ armhf-debian-cross-container:
 # We never want to build hexagon in the CI system and by default we
 # always want to refer to the master registry where it lives.
 hexagon-cross-container:
-  extends: .base_job_template
-  image: docker:stable
+  extends: .container_job_template
   stage: containers
   variables:
     NAME: debian-hexagon-cross
-    GIT_DEPTH: 1
     QEMU_JOB_ONLY_FORKS: 1
-  services:
-    - docker:dind
-  before_script:
-    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
-  script:
-    - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
-    - docker pull $COMMON_TAG
-    - docker tag $COMMON_TAG $TAG
-    - docker push "$TAG"
-  after_script:
-    - docker logout
 
 hppa-debian-cross-container:
   extends: .container_job_template
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fc7a3b7e71..665ddde518 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -109,10 +109,6 @@ debian-toolchain-run = \
 			"PREPARE", $1))
 debian-toolchain = $(call debian-toolchain-run,$(patsubst docker-image-%,%,$1))
 
-docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.docker \
-	$(DOCKER_FILES_DIR)/debian-hexagon-cross.d/build-toolchain.sh
-	$(call debian-toolchain, $@)
-
 docker-image-debian-microblaze-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-microblaze-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
deleted file mode 100755
index 19b1c9f83e..0000000000
--- a/tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh
+++ /dev/null
@@ -1,141 +0,0 @@
-#!/bin/bash
-
-set -e
-
-BASE=$(readlink -f ${PWD})
-
-TOOLCHAIN_INSTALL=$(readlink -f "$TOOLCHAIN_INSTALL")
-ROOTFS=$(readlink -f "$ROOTFS")
-
-TOOLCHAIN_BIN=${TOOLCHAIN_INSTALL}/bin
-HEX_SYSROOT=${TOOLCHAIN_INSTALL}/hexagon-unknown-linux-musl
-HEX_TOOLS_TARGET_BASE=${HEX_SYSROOT}/usr
-
-function cdp() {
-  DIR="$1"
-  mkdir -p "$DIR"
-  cd "$DIR"
-}
-
-function fetch() {
-  DIR="$1"
-  URL="$2"
-  TEMP="$(readlink -f "$PWD/tmp.tar.gz")"
-  wget --quiet "$URL" -O "$TEMP"
-  cdp "$DIR"
-  tar xaf "$TEMP" --strip-components=1
-  rm "$TEMP"
-  cd -
-}
-
-build_llvm_clang() {
-  fetch "$BASE/llvm-project" "$LLVM_URL"
-  cdp "$BASE/build-llvm"
-
-  cmake -G Ninja \
-    -DCMAKE_BUILD_TYPE=Release \
-    -DCMAKE_INSTALL_PREFIX=${TOOLCHAIN_INSTALL} \
-    -DLLVM_ENABLE_LLD=ON \
-    -DLLVM_TARGETS_TO_BUILD="Hexagon" \
-    -DLLVM_ENABLE_PROJECTS="clang;lld" \
-    "$BASE/llvm-project/llvm"
-  ninja all install
-  cd ${TOOLCHAIN_BIN}
-  ln -sf clang hexagon-unknown-linux-musl-clang
-  ln -sf clang++ hexagon-unknown-linux-musl-clang++
-  ln -sf llvm-ar hexagon-unknown-linux-musl-ar
-  ln -sf llvm-objdump hexagon-unknown-linux-musl-objdump
-  ln -sf llvm-objcopy hexagon-unknown-linux-musl-objcopy
-  ln -sf llvm-readelf hexagon-unknown-linux-musl-readelf
-  ln -sf llvm-ranlib hexagon-unknown-linux-musl-ranlib
-
-  # workaround for now:
-  cat <<EOF > hexagon-unknown-linux-musl.cfg
--G0 --sysroot=${HEX_SYSROOT}
-EOF
-}
-
-build_clang_rt() {
-  cdp "$BASE/build-clang_rt"
-  cmake -G Ninja \
-    -DCMAKE_BUILD_TYPE=Release \
-    -DLLVM_CONFIG_PATH="$BASE/build-llvm/bin/llvm-config" \
-    -DCMAKE_ASM_FLAGS="-G0 -mlong-calls -fno-pic --target=hexagon-unknown-linux-musl " \
-    -DCMAKE_SYSTEM_NAME=Linux \
-    -DCMAKE_C_COMPILER="${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang" \
-    -DCMAKE_ASM_COMPILER="${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang" \
-    -DCMAKE_INSTALL_PREFIX=${HEX_TOOLS_TARGET_BASE} \
-    -DCMAKE_CROSSCOMPILING=ON \
-    -DCMAKE_C_COMPILER_FORCED=ON \
-    -DCMAKE_CXX_COMPILER_FORCED=ON \
-    -DCOMPILER_RT_BUILD_BUILTINS=ON \
-    -DCOMPILER_RT_BUILTINS_ENABLE_PIC=OFF \
-    -DCMAKE_SIZEOF_VOID_P=4 \
-    -DCOMPILER_RT_OS_DIR= \
-    -DCAN_TARGET_hexagon=1 \
-    -DCAN_TARGET_x86_64=0 \
-    -DCOMPILER_RT_SUPPORTED_ARCH=hexagon \
-    -DLLVM_ENABLE_PROJECTS="compiler-rt" \
-    "$BASE/llvm-project/compiler-rt"
-  ninja install-compiler-rt
-}
-
-build_musl_headers() {
-  fetch "$BASE/musl" "$MUSL_URL"
-  cd "$BASE/musl"
-  make clean
-  CC=${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
-    CROSS_COMPILE=hexagon-unknown-linux-musl \
-    LIBCC=${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
-    CROSS_CFLAGS="-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --target=hexagon-unknown-linux-musl" \
-    ./configure --target=hexagon --prefix=${HEX_TOOLS_TARGET_BASE}
-  PATH=${TOOLCHAIN_BIN}:$PATH make CROSS_COMPILE= install-headers
-
-  cd ${HEX_SYSROOT}/..
-  ln -sf hexagon-unknown-linux-musl hexagon
-}
-
-build_kernel_headers() {
-  fetch "$BASE/linux" "$LINUX_URL"
-  mkdir -p "$BASE/build-linux"
-  cd "$BASE/linux"
-  make O=../build-linux ARCH=hexagon \
-   KBUILD_CFLAGS_KERNEL="-mlong-calls" \
-   CC=${TOOLCHAIN_BIN}/hexagon-unknown-linux-musl-clang \
-   LD=${TOOLCHAIN_BIN}/ld.lld \
-   KBUILD_VERBOSE=1 comet_defconfig
-  make mrproper
-
-  cd "$BASE/build-linux"
-  make \
-    ARCH=hexagon \
-    CC=${TOOLCHAIN_BIN}/clang \
-    INSTALL_HDR_PATH=${HEX_TOOLS_TARGET_BASE} \
-    V=1 \
-    headers_install
-}
-
-build_musl() {
-  cd "$BASE/musl"
-  make clean
-  CROSS_COMPILE=hexagon-unknown-linux-musl- \
-    AR=llvm-ar \
-    RANLIB=llvm-ranlib \
-    STRIP=llvm-strip \
-    CC=clang \
-    LIBCC=${HEX_TOOLS_TARGET_BASE}/lib/libclang_rt.builtins-hexagon.a \
-    CFLAGS="-G0 -O0 -mv65 -fno-builtin -fno-rounding-math --target=hexagon-unknown-linux-musl" \
-    ./configure --target=hexagon --prefix=${HEX_TOOLS_TARGET_BASE}
-  PATH=${TOOLCHAIN_BIN}/:$PATH make CROSS_COMPILE= install
-  cd ${HEX_TOOLS_TARGET_BASE}/lib
-  ln -sf libc.so ld-musl-hexagon.so
-  ln -sf ld-musl-hexagon.so ld-musl-hexagon.so.1
-  cdp ${HEX_TOOLS_TARGET_BASE}/../lib
-  ln -sf ../usr/lib/ld-musl-hexagon.so.1
-}
-
-build_llvm_clang
-build_kernel_headers
-build_musl_headers
-build_clang_rt
-build_musl
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index c4238e893f..8a0d748343 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -7,44 +7,29 @@
 #
 FROM docker.io/library/debian:11-slim
 
-# Install common build utilities
-RUN apt update && \
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        bison \
+# Install common build utilities
+    apt-get install -y --no-install-recommends \
+        curl \
+        xz-utils \
         ca-certificates \
-        clang \
-        cmake \
+        bison \
         flex \
-        gcc \
-        lld \
-        make \
-        ninja-build \
-        python3 \
-        rsync \
-        wget \
-        xz-utils
-
-ENV TOOLCHAIN_INSTALL /usr/local
-ENV ROOTFS /usr/local
-
-ENV LLVM_URL https://github.com/llvm/llvm-project/archive/bfcd21876adc3498065e4da92799f613e730d475.tar.gz
-ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3691905aa1af6c0778c.tar.gz
-ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.tar.xz
-
-ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
-
-RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
-
-FROM docker.io/library/debian:11-slim
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+        git \
+        ninja-build && \
 # Install QEMU build deps for use in CI
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy bison flex git ninja-build && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
-COPY --from=0 /usr/local /usr/local
-ENV PATH $PATH:/usr/local/bin/
+
+
+ENV TOOLCHAIN_INSTALL /opt
+ENV TOOLCHAIN_RELEASE 15.0.3
+ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl"
+ENV TOOLCHAIN_URL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/v${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
+
+RUN curl -#SL "$TOOLCHAIN_URL" | tar -xJC "$TOOLCHAIN_INSTALL"
+ENV PATH $PATH:${TOOLCHAIN_INSTALL}/${TOOLCHAIN_BASENAME}/x86_64-linux-gnu/bin
-- 
2.17.1


