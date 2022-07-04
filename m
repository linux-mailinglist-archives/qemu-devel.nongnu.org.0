Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4743A565F84
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 00:50:08 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8UtK-0006nB-Qv
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 18:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8UsN-00065f-KG; Mon, 04 Jul 2022 18:49:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1o8UsK-0007AR-Gl; Mon, 04 Jul 2022 18:49:07 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 264LdnJK024155;
 Mon, 4 Jul 2022 22:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Vn+z2Woy2uM0q9g/X8sy9N3VeFE2NXGis3eNEeJfcWU=;
 b=KhV4NXgY+J4I15SOrIAsRRlXLcbS759nqSDdrZ4A+V/H7ALGg9ZwJT3yEy6vyeTseU0A
 2E20r33PYr1OtBlmnrQL0Xnqpo0/ntb+MhbkMUPWNz2ycGOzecT5gi1NdD2Ib0UEXw6N
 xZk+VNVvNpvGOL4YwQLk38pHqa/TGT7guhM+n5zIxJAWwfmYvRjYnOzHvNkpYGQ2t6rL
 hNIaYIv/wLOJT5oDoA9V1UsxfVyQsSmH+XN7gGOZrxSSYMDvY3XQfIiNCnCYD5GItBQo
 7R/lOFWAPS7EjiHLwOEnLOaAi3pcdnDX0BIg+SOUJ723bjLMkqCU4ALEEl+PKKeCIew6 eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h47yvs59t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 22:48:52 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 264Me11n002133;
 Mon, 4 Jul 2022 22:48:52 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h47yvs59c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 22:48:52 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 264MZUrJ001109;
 Mon, 4 Jul 2022 22:48:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3h2dn8u5fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 22:48:49 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 264Mmk7w22413788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jul 2022 22:48:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F26411C04C;
 Mon,  4 Jul 2022 22:48:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB40811C04A;
 Mon,  4 Jul 2022 22:48:45 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.47.233])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Jul 2022 22:48:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [RFC] gitlab: introduce s390x wasmtime job
Date: Tue,  5 Jul 2022 00:48:44 +0200
Message-Id: <20220704224844.2903473-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IhIsOOMOdaJMA1LwHcYEJOf9ivqi29a7
X-Proofpoint-ORIG-GUID: R9DeyFXw5LCxtmJ_Zo5-HBf0mJjKcnFs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_19,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1011 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207040099
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

wasmtime is a WebAssembly runtime, which includes a large testsuite.
This testsuite uses qemu-user (aarch64 and s390x are supported) in
order to exercise foreign architectures. Over time it found several
regressions in qemu itself, and it would be beneficial to catch the
similar ones earlier.

To this end, this patch introduces a job that runs stable wasmtime
testsuite against qemu-s390x. The job is split into the following
components:

- A script for running the tests. Usable on developers' machines:

    qemu$ mkdir build
    qemu$ cd build
    qemu/build$ ../tests/wasmtime/test s390x

- A script for building the tests (build-toolchain.sh).

- A dockerfile describing an image with the prebuilt testsuite
  (debian-s390x-wasmtime-cross.docker).

- gitlab job definition for building the image.

- gitlab job definition for using the image to run the tests.

It's possible to use this with aarch64 as well, but it segfaults at
the moment, therefore this patch does not provide job definitions for
it. This needs to be investigated separately.

The example of a resulting pipeline can be seen at [1].

The test job runs for about 30 minutes mostly due to unnecessary
rebuilds. They will be gone once [2] is integrated and makes it to a
stable release.

This patch depends on madvise(MADV_DONTNEED) passthrough support [3].

[1] https://gitlab.com/iii-i/qemu/-/pipelines/579677396
[2] https://github.com/bytecodealliance/wasmtime/pull/4377
[3] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00112.html

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 .gitlab-ci.d/container-cross.yml              | 10 +++
 .gitlab-ci.d/container-template.yml           |  2 +-
 .gitlab-ci.d/qemu-project.yml                 |  1 +
 .gitlab-ci.d/wasmtime-template.yml            |  6 ++
 .gitlab-ci.d/wasmtime.yml                     |  9 ++
 tests/docker/Makefile.include                 |  6 ++
 .../build-toolchain.sh                        | 83 +++++++++++++++++++
 .../debian-s390x-wasmtime-cross.docker        | 16 ++++
 tests/wasmtime/test                           | 39 +++++++++
 9 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 .gitlab-ci.d/wasmtime-template.yml
 create mode 100644 .gitlab-ci.d/wasmtime.yml
 create mode 100755 tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh
 create mode 100644 tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker
 create mode 100755 tests/wasmtime/test

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index b7963498a3..b3c4b76a16 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -138,6 +138,16 @@ s390x-debian-cross-container:
   variables:
     NAME: debian-s390x-cross
 
+s390x-debian-wasmtime-cross-container:
+  extends: .container_job_template
+  stage: containers
+  needs: ['s390x-debian-cross-container']
+  variables:
+    NAME: debian-s390x-wasmtime-cross
+    DOCKER_SCRIPT_ARGS: >
+      --extra-files
+      tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh
+
 sh4-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index c434b9c8f3..8654f89a15 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -15,7 +15,7 @@
     - echo "COMMON_TAG:$COMMON_TAG"
     - ./tests/docker/docker.py --engine docker build
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY/qemu-project/qemu
+          -r $CI_REGISTRY/qemu-project/qemu $DOCKER_SCRIPT_ARGS
     - docker tag "qemu/$NAME" "$TAG"
     - docker push "$TAG"
   after_script:
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 691d9bf5dc..712a27f7a0 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -13,3 +13,4 @@ include:
   - local: '/.gitlab-ci.d/custom-runners.yml'
   - local: '/.gitlab-ci.d/cirrus.yml'
   - local: '/.gitlab-ci.d/windows.yml'
+  - local: '/.gitlab-ci.d/wasmtime.yml'
diff --git a/.gitlab-ci.d/wasmtime-template.yml b/.gitlab-ci.d/wasmtime-template.yml
new file mode 100644
index 0000000000..cbf89c39eb
--- /dev/null
+++ b/.gitlab-ci.d/wasmtime-template.yml
@@ -0,0 +1,6 @@
+.wasmtime_job_template:
+  extends: .base_job_template
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  stage: test
+  script:
+    - srcdir=$(pwd) && cd /build && "$srcdir"/tests/wasmtime/test "$ARCH"
diff --git a/.gitlab-ci.d/wasmtime.yml b/.gitlab-ci.d/wasmtime.yml
new file mode 100644
index 0000000000..2647f28bb1
--- /dev/null
+++ b/.gitlab-ci.d/wasmtime.yml
@@ -0,0 +1,9 @@
+include:
+  - local: '/.gitlab-ci.d/wasmtime-template.yml'
+
+wasmtime-s390x:
+  extends: .wasmtime_job_template
+  needs: ['s390x-debian-wasmtime-cross-container']
+  variables:
+    IMAGE: debian-s390x-wasmtime-cross
+    ARCH: s390x
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ef4518d9eb..172ffc35c8 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -137,6 +137,12 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
 
+docker-image-debian-s390x-wasmtime-cross: \
+    $(DOCKER_FILES_DIR)/debian-s390x-wasmtime-cross.docker \
+    $(DOCKER_FILES_DIR)/debian-s390x-wasmtime-cross.d/build-toolchain.sh
+	$(call debian-toolchain, $@)
+docker-image-debian-s390x-wasmtime-cross: docker-image-debian-s390x-cross
+
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh
new file mode 100755
index 0000000000..a28d61a353
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.d/build-toolchain.sh
@@ -0,0 +1,83 @@
+#!/bin/sh
+
+# Build the stable wasmtime testsuite and run it with qemu-user from $PATH.
+# ".rustup", ".cargo" and "wasmtime" subdirectories will be created or updated
+# in the current directory.
+#
+# Based on https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/.github/workflows/main.yml#L208.
+#
+# Usage:
+#
+#     ./test TARGET_ARCH [CARGO_ARGS ...]
+#
+# where TARGET_ARCH is the architecture to test (aarch64 or s390x) and
+# CARGO_ARGS are the extra arguments passed to cargo test.
+
+set -e -u -x
+
+# Dependency versions.
+export RUSTUP_TOOLCHAIN=1.62.0
+
+# Bump when https://github.com/bytecodealliance/wasmtime/pull/4377 is
+# integrated. Until this moment there will be some unnecessary rebuilds.
+wasmtime_version=0.37.0
+
+# Script arguments.
+arch=$1
+shift
+arch_upper=$(echo "$arch" | tr '[:lower:]' '[:upper:]')
+
+# Install/update Rust.
+export RUSTUP_HOME="$PWD/.rustup"
+export CARGO_HOME="$PWD/.cargo"
+curl \
+    --proto '=https' \
+    --tlsv1.2 \
+    -sSf \
+    https://sh.rustup.rs \
+    | sh -s -- -y \
+        --default-toolchain="$RUSTUP_TOOLCHAIN" \
+        --target=wasm32-wasi \
+        --target=wasm32-unknown-unknown \
+        --target="$arch"-unknown-linux-gnu
+cat >"$CARGO_HOME/config" <<HERE
+[build]
+# Save space by not generating data to speed-up delta builds.
+incremental = false
+
+[profile.test]
+# Save space by not generating debug information.
+debug = 0
+
+[net]
+# Speed up crates.io index update.
+git-fetch-with-cli = true
+HERE
+. "$PWD/.cargo/env"
+
+# Checkout/update wasmtime.
+if [ -d wasmtime ]; then
+    cd wasmtime
+    git fetch --force --tags
+    git checkout v"$wasmtime_version"
+    git submodule update --init --recursive
+else
+    git clone \
+        --depth=1 \
+        --recurse-submodules \
+        --shallow-submodules \
+        -b v"$wasmtime_version" \
+        https://github.com/bytecodealliance/wasmtime.git
+    cd wasmtime
+fi
+
+# Run wasmtime tests.
+export CARGO_BUILD_TARGET="$arch-unknown-linux-gnu"
+runner_var=CARGO_TARGET_${arch_upper}_UNKNOWN_LINUX_GNU_RUNNER
+linker_var=CARGO_TARGET_${arch_upper}_UNKNOWN_LINUX_GNU_LINKER
+eval "export $runner_var=\"qemu-$arch -L /usr/$arch-linux-gnu\""
+eval "export $linker_var=$arch-linux-gnu-gcc"
+export CARGO_PROFILE_DEV_OPT_LEVEL=2
+export WASMTIME_TEST_NO_HOG_MEMORY=1
+export RUST_BACKTRACE=1
+ci/run-tests.sh --locked "$@"
diff --git a/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker
new file mode 100644
index 0000000000..d08a66dcc2
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-s390x-wasmtime-cross.docker
@@ -0,0 +1,16 @@
+# Image containing pre-built wasmtime tests for s390x.
+
+FROM registry.gitlab.com/qemu-project/qemu/qemu/debian-s390x-cross:latest
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+            curl \
+            libglib2.0-dev && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y
+
+RUN mkdir /build
+ADD build-toolchain.sh /build
+RUN cd /build && ./build-toolchain.sh s390x --no-run
diff --git a/tests/wasmtime/test b/tests/wasmtime/test
new file mode 100755
index 0000000000..10e2c3f886
--- /dev/null
+++ b/tests/wasmtime/test
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+# Build qemu-user in the current directory, build the stable wasmtime
+# testsuite, and test them together. ".rustup", ".cargo" and "wasmtime"
+# subdirectories, as well as qemu build files, will be created or updated in
+# the current directory.
+#
+# Based on https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/.github/workflows/main.yml#L208.
+#
+# Usage:
+#
+#     ./test TARGET_ARCH [CARGO_ARGS ...]
+#
+# where TARGET_ARCH is the architecture to test (aarch64 or s390x) and
+# CARGO_ARGS are the extra arguments passed to cargo test.
+
+set -e -u -x
+
+# Script arguments.
+arch=$1
+shift
+
+# Build QEMU.
+srcdir=$(cd "$(dirname "$0")" && pwd)/../..
+docker_files_dir="$srcdir"/tests/docker/dockerfiles
+"$srcdir"/configure \
+    --target-list="$arch"-linux-user \
+    --disable-tools \
+    --disable-slirp \
+    --disable-fdt \
+    --disable-capstone \
+    --disable-docs
+make --output-sync -j"$(nproc)"
+export PATH="$PWD:$PATH"
+
+# Run wasmtime tests.
+exec \
+    "$docker_files_dir"/debian-s390x-wasmtime-cross.d/build-toolchain.sh \
+    "$arch" "$@"
-- 
2.35.3


