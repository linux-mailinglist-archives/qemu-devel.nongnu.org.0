Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A821C3906F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:53:54 +0200 (CEST)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaJV-0004bx-O8
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llZ01-0001lF-4k
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:29:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llYzy-0002j4-OA
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:29:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n2so32801518wrm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4yZ3Scg1qTEkImpfESz/S8s0r+eLz6mR36tZkVG/Vo=;
 b=DL3hMu77YqVzC2J5ysm2dBBLaicMpSO/rCQlHopUQWuz4SElFaQHHiuAk34MNuBHgp
 I8UCJjAkKpUkXMr/UZ4Ah/k8C05IvX2z63mSwctYExaES8yy/7HzL7uhSN5LEeyW4Zrl
 Jsg3+IRQP0zXHVpWxrJReeSsACmK4jTvIdrISyuwLWsADUqnvGD9FAQVgUXW0Z3+oqUm
 8wkUaMgcjtchgP/UqvySREp1CZelb+R2drkqdW8mag+T1ti3BldVrfFqxHqMlpYbmWBw
 4kQdeuEEV6cGw6VnZy2QNO5/ORsjZ/Ywxlkmwb6s4HK/sGlyB8cHAxRf8PhvGNftPHYT
 exkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=B4yZ3Scg1qTEkImpfESz/S8s0r+eLz6mR36tZkVG/Vo=;
 b=H85LjWpMtGIq4zk7YBD1scdwtltIozY5G+kdcCL/jkYy2+b1vS3ayIprn60qk520F8
 EgEWXxB1qctwHT3uiNYUGUBoejBPWh1q1oxvMVxGxuh35rp4sfnRLJJlIbCZ4S1n6CCO
 mDoBpDknRWwa7Vwrfk1R58KvSj/X7RX2/2eztHDUJ4sKYVRbFdwMezbM8Z4JG7Ikpq/d
 nS5ISJXxeJZJX38LhfsbkQfPV8cvkRYc90TSgzydPImQ/2luKvAsbNrgiORAy/SEE3wV
 vNbvNQws1QiFbAnTiNq96SpRMp3WLDtN1zvgh5WAONE7zGsljVTpC5mzcumvYYB+1N9C
 v6tA==
X-Gm-Message-State: AOAM5335J0fucome3S1UIgWZCHT4K3sX7Xd//dM10yaXfeTOk7WTrBeZ
 DhuKK3rhlUkd3l8FUBcRjXug6PsWCC+xRg==
X-Google-Smtp-Source: ABdhPJzANshGLul/ldr7AM8iJkqY6/G3xF0PDL+nJyqVj5XRyC0DptYIm3Xs6it/DmH42PHoJoszAg==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr8553954wrs.201.1621956576813; 
 Tue, 25 May 2021 08:29:36 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c194sm3192653wme.46.2021.05.25.08.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:29:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Add jobs to build standalone machines
Date: Tue, 25 May 2021 17:29:24 +0200
Message-Id: <20210525152924.4171401-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The --without-default-devices configure option removes the
'default=y' from Kconfig files. It is useful to test missing
Kconfig dependencies for users wanting to have QEMU (system)
binaries with a particular subset of machines builtin.

If a machine can be built standalone, it can certainly be
built as part of a set. So the best way to test for regressions
is to test each machine individually.

As this is painful to test manually, add CI jobs to do it [*].
Since all jobs follow the same template, to ease maintenance
we generate the jobs using the jsonnet tool, which emit a YAML
file filled with all our jobs.

Since there is no "--enable-my-config" option, we have to write
the standalone config manually, overwritting each target .mak
file in default-configs/devices/.

The job is set to manual (there is no change in the current
set of jobs), but can be started automatically by setting the
QEMU_CI_STANDALONE_MACHINE_TESTING variable.

[*] https://docs.gitlab.com/ee/ci/yaml/#trigger-child-pipeline-with-generated-configuration-file

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Example: https://gitlab.com/philmd/qemu/-/pipelines/309272883

Based-on: <20210525082556.4011380-1-f4bug@amsat.org>
---
 .gitlab-ci.d/qemu-project.yml             |  1 +
 .gitlab-ci.d/standalone-jobs-template.yml | 32 ++++++++++
 .gitlab-ci.d/standalone-jobs.jsonnet      | 74 +++++++++++++++++++++++
 .gitlab-ci.d/standalone-jobs.yml          | 27 +++++++++
 .gitlab-ci.yml                            |  3 +
 5 files changed, 137 insertions(+)
 create mode 100644 .gitlab-ci.d/standalone-jobs-template.yml
 create mode 100644 .gitlab-ci.d/standalone-jobs.jsonnet
 create mode 100644 .gitlab-ci.d/standalone-jobs.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 64cb2ba1da5..4018c48761c 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -9,3 +9,4 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/buildtest.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
+  - local: '/.gitlab-ci.d/standalone-jobs.yml'
diff --git a/.gitlab-ci.d/standalone-jobs-template.yml b/.gitlab-ci.d/standalone-jobs-template.yml
new file mode 100644
index 00000000000..23e60cb4069
--- /dev/null
+++ b/.gitlab-ci.d/standalone-jobs-template.yml
@@ -0,0 +1,32 @@
+.native_build_standalone_job_template:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS:
+      --without-default-devices
+      --disable-user
+      --disable-tools
+      --disable-docs
+  before_script:
+    - JOBS=$(expr $(nproc) + 1)
+  script:
+    - for target in $TARGETS ; do
+        echo > default-configs/devices/${target}-softmmu.mak ;
+        for line in $DEVICE_CONFIGS ; do
+          echo "$line"
+          echo "$line" > default-configs/devices/${target}-softmmu.mak ;
+        done ;
+      done
+    - mkdir build
+    - cd build
+    - ../configure --enable-werror $CONFIGURE_ARGS --target-list="$TARGETS"
+      || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - QEMU_BINS=$(echo $(for target in $TARGETS; do echo qemu-system-${target//-softmmu/}; done))
+    - make -j"$JOBS" $QEMU_BINS
+    - for binary in $QEMU_BINS ; do
+        for machine in $(./$binary -M help | egrep -v "^(Supported|none)" | awk '{print $1}') ; do
+            echo "=== testing $machine with $binary ===" ;
+            echo q | ./$binary -M $machine -nodefaults -display none $TESTING_ARGS -monitor stdio -S || exit 1 ;
+        done ;
+      done
diff --git a/.gitlab-ci.d/standalone-jobs.jsonnet b/.gitlab-ci.d/standalone-jobs.jsonnet
new file mode 100644
index 00000000000..6f403a51091
--- /dev/null
+++ b/.gitlab-ci.d/standalone-jobs.jsonnet
@@ -0,0 +1,74 @@
+local param_job(targets, configs, cmdline="") =
+  {
+    extends: ".native_build_standalone_job_template",
+
+    variables: {
+      TARGETS: targets,
+      DEVICE_CONFIGS: configs,
+      TESTING_ARGS: cmdline,
+    }
+  };
+
+{
+  include: { "local": "/.gitlab-ci.d/standalone-jobs-template.yml" },
+
+  // alpha
+    "alpha dp264": param_job("alpha-softmmu", "CONFIG_DP264=y"),
+
+  // arm
+
+  // avr
+    "avr arduino": param_job("avr-softmmu", "CONFIG_ARDUINO=y"),
+
+  // cris
+
+  // hexagon
+
+  // hppa
+    "hppa dino": param_job("hppa-softmmu", "CONFIG_DINO=y"),
+
+  // i386
+    "x86 isapc": param_job("i386-softmmu", "CONFIG_ISAPC=y"),
+    "x86 microvm": param_job("x86_64-softmmu", "CONFIG_MICROVM=y"),
+
+  // m68k
+
+  // microblaze
+    "mb zynqmp-pmu": param_job("microblaze-softmmu", "CONFIG_XLNX_ZYNQMP_PMU=y"),
+    "mb ml605": param_job("microblaze-softmmu", "CONFIG_PETALOGIX_ML605=y"),
+    "mb s3adsp1800": param_job("microblaze-softmmu", "CONFIG_PETALOGIX_S3ADSP1800=y"),
+
+  // mips
+    "mips jazz": param_job("mips64-softmmu", "CONFIG_FULOONG=y"),
+    "mips loongson3v": param_job("mips64-softmmu", "CONFIG_LOONGSON3V=y"),
+    "mips malta": param_job("mips-softmmu mipsel-softmmu", "CONFIG_MALTA=y", "-bios /dev/null"),
+
+  // nios2
+    "nios2 10m50": param_job("nios2-softmmu", "CONFIG_NIOS2_10M50=y"),
+    "nios2 nommu": param_job("nios2-softmmu", "CONFIG_NIOS2_GENERIC_NOMMU=y"),
+
+  // openrisc
+    "or1k sim": param_job("or1k-softmmu", "CONFIG_OR1K_SIM=y"),
+
+  // ppc
+
+  // riscv
+    "riscv opentitan": param_job("riscv32-softmmu", "CONFIG_OPENTITAN=y"),
+
+  // rx
+    "rx gdbsim": param_job("rx-softmmu", "CONFIG_RX_GDBSIM=y", "-bios /dev/null"),
+
+  // s390x
+    "s390 ccw": param_job("s390x-softmmu", "CONFIG_S390_CCW_VIRTIO=y"),
+
+  // sh4
+
+  // sparc
+
+  // tricore
+    "triboard": param_job("tricore-softmmu", "CONFIG_TRIBOARD=y"),
+
+  // xtensa
+    "xtensa sim": param_job("xtensaeb-softmmu", "CONFIG_XTENSA_SIM=y CONFIG_SEMIHOSTING=y"),
+    "xtensa virt": param_job("xtensa-softmmu", "CONFIG_XTENSA_VIRT=y CONFIG_SEMIHOSTING=y"),
+}
diff --git a/.gitlab-ci.d/standalone-jobs.yml b/.gitlab-ci.d/standalone-jobs.yml
new file mode 100644
index 00000000000..b094173ff12
--- /dev/null
+++ b/.gitlab-ci.d/standalone-jobs.yml
@@ -0,0 +1,27 @@
+build-standalone-machines:
+  stage: containers
+  image: alpine:latest
+  script:
+    - apk add -U jsonnet
+    - jsonnet .gitlab-ci.d/standalone-jobs.jsonnet > standalone-jobs-generated.yml
+  artifacts:
+    paths:
+      - standalone-jobs-generated.yml
+  rules:
+    # Automatically add the jobs if QEMU_CI_STANDALONE_MACHINE_TESTING is set
+    - if: '$QEMU_CI_STANDALONE_MACHINE_TESTING'
+      when: on_success
+    # Otherwise, set to manual (the jobs are created but not run).
+    - when: manual
+      allow_failure: true
+
+trigger-standalone-machines:
+  stage: containers-layer2
+  needs:
+    - job: build-standalone-machines
+    - job: amd64-fedora-container
+  trigger:
+    include:
+      - artifact: standalone-jobs-generated.yml
+        job: build-standalone-machines
+    strategy: depend
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 830c5b7af97..8122b0fab3a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -35,6 +35,9 @@
 #
 # - QEMU_CI_AVOCADO_TESTING
 #   If set, tests using the Avocado framework will be run
+#
+# - QEMU_CI_STANDALONE_MACHINE_TESTING
+#   If set, jobs that build QEMU with a single machine will be added
 
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.26.3


