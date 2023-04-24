Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE456EC8C4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:24:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsPW-00079U-8d; Mon, 24 Apr 2023 05:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPT-00077I-D5
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:22:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPN-0004l1-Ta
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:22:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so3797984f8f.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328172; x=1684920172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blXnV5I8slYMdOD9wjky+sTVJVxiXjflhfvbDxIY+qc=;
 b=QFrTguKCLt2FepLRh0bEe/X1w0ZAlEps11McUj0leDuAh79ndrZ2Y5NuOCMwPrJxQ/
 56wJncPKJiE4qIwh2yxsxrxO8EK6/vVchaTXdkmCknKON9QLw6mXwQ4uo1pbhOfgfQyU
 3S1lkS75cUh1xxErX+Dtk5/+dCFw3bgQwVdzDIo4tYkYCJCWT4LGnDKul/FeOjT3cN5y
 iDe4WrNkwYwxPQV4XEzNVEDJwDTAi+NLO6jOMirEELwUxMy1mtKMoY1u38DEIED7p7zi
 x0pYF3PdVUs6kBOY4t6JKmytSR/YLLdTNBX7vK5hVb7UA4UuC9tyDGL+5rDTb2++Zw4d
 MBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328172; x=1684920172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blXnV5I8slYMdOD9wjky+sTVJVxiXjflhfvbDxIY+qc=;
 b=f5uIuKpEaA47+laBwDa7JJd6SFdY7Owk1kvDhlVbSSQw5V6tCRJrk+n7dMt5vosRKv
 rXESgjBOFYs/FEg/2/2Rp2e4FkU06WBzmdvA93pJmfOcyjJRzrplpxNL/pIucQhWuJBH
 bTMwU/0l9EFjjLtysC+5N7AHbjh9pIiag9OxI8Eed25/dwXR3UwWVncf+L3RcM1f5KE5
 2NIhV0jTMkdViMkMcqx/fS1qbAIulyLF5djvsrNycva8LbKbrirG5RYhnhC8D62yvqik
 i/C2BYYWIfITvUZTcBY2qXN0ndxXkjsTRcbEVG5qWiSAkMy9v9PyAtn73oltWXcvchgD
 oIwA==
X-Gm-Message-State: AAQBX9fC6x45h79q6JAUP6HH+Laot+ko+1w5jvtIztXnwwmwyIwXu+U9
 17NFZacYyk/YV0esdjac249diw==
X-Google-Smtp-Source: AKy350bq91aJ+J10wVsZCckVym/sDILzZiS4UhjASRgIvv8Ou9Ceu06YPSZb2z/HDgwJ7zg55FliTg==
X-Received: by 2002:adf:dfc3:0:b0:2fe:f2d1:dcab with SMTP id
 q3-20020adfdfc3000000b002fef2d1dcabmr9261648wrn.58.1682328172140; 
 Mon, 24 Apr 2023 02:22:52 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d60c9000000b002fbdb797483sm10291054wrt.49.2023.04.24.02.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B01711FFBA;
 Mon, 24 Apr 2023 10:22:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 02/18] tests/avocado: use the new snapshots for testing
Date: Mon, 24 Apr 2023 10:22:33 +0100
Message-Id: <20230424092249.58552-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The tuxboot images now have a stable snapshot URL so we can enable the
checksums and remove the avocado warnings. We will have to update as
old snapshots retire but that won't be too frequent.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/tuxrun_baselines.py | 170 +++++++++++++++++++++++++-----
 1 file changed, 144 insertions(+), 26 deletions(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index d343376faa..e8749717e9 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -77,20 +77,33 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
-    def fetch_tuxrun_assets(self, dt=None):
+    def fetch_tuxrun_assets(self, csums=None, dt=None):
         """
         Fetch the TuxBoot assets. They are stored in a standard way so we
         use the per-test tags to fetch details.
         """
-        base_url = f"https://storage.tuxboot.com/{self.tuxboot}/"
-        kernel_image =  self.fetch_asset(base_url + self.image)
-        disk_image_zst = self.fetch_asset(base_url + "rootfs.ext4.zst")
+        base_url = f"https://storage.tuxboot.com/20230331/{self.tuxboot}/"
+
+        # empty hash if we weren't passed one
+        csums = {} if csums is None else csums
+        ksum = csums.get(self.image, None)
+        isum = csums.get("rootfs.ext4.zst", None)
+
+        kernel_image =  self.fetch_asset(base_url + self.image,
+                                         asset_hash = ksum,
+                                         algorithm = "sha256")
+        disk_image_zst = self.fetch_asset(base_url + "rootfs.ext4.zst",
+                                         asset_hash = isum,
+                                         algorithm = "sha256")
 
         cmd = f"{self.zstd} -d {disk_image_zst} -o {self.workdir}/rootfs.ext4"
         process.run(cmd)
 
         if dt:
-            dtb = self.fetch_asset(base_url + dt)
+            dsum = csums.get(dt, None)
+            dtb = self.fetch_asset(base_url + dt,
+                                   asset_hash = dsum,
+                                   algorithm = "sha256")
         else:
             dtb = None
 
@@ -149,7 +162,9 @@ def run_tuxtest_tests(self, haltmsg):
         else:
             self.vm.wait()
 
-    def common_tuxrun(self, dt=None,
+    def common_tuxrun(self,
+                      csums=None,
+                      dt=None,
                       drive="virtio-blk-device",
                       haltmsg="reboot: System halted",
                       console_index=0):
@@ -158,7 +173,7 @@ def common_tuxrun(self, dt=None,
         special with the command line we can process most things using
         the tag metadata.
         """
-        (kernel, disk, dtb) = self.fetch_tuxrun_assets(dt)
+        (kernel, disk, dtb) = self.fetch_tuxrun_assets(csums, dt)
 
         self.prepare_run(kernel, disk, drive, dtb, console_index)
         self.vm.launch()
@@ -182,7 +197,11 @@ def test_arm64(self):
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        sums = {"Image" :
+                "ce95a7101a5fecebe0fe630deee6bd97b32ba41bc8754090e9ad8961ea8674c7",
+                "rootfs.ext4.zst" :
+                "bbd5ed4b9c7d3f4ca19ba71a323a843c6b585e880115df3b7765769dbd9dd061"}
+        self.common_tuxrun(csums=sums)
 
     def test_arm64be(self):
         """
@@ -194,7 +213,11 @@ def test_arm64be(self):
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        sums = { "Image" :
+                 "e0df4425eb2cd9ea9a283e808037f805641c65d8fcecc8f6407d8f4f339561b4",
+                 "rootfs.ext4.zst" :
+                 "e6ffd8813c8a335bc15728f2835f90539c84be7f8f5f691a8b01451b47fb4bd7"}
+        self.common_tuxrun(csums=sums)
 
     def test_armv5(self):
         """
@@ -206,7 +229,15 @@ def test_armv5(self):
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="virtio-blk-pci",
+        sums = { "rootfs.ext4.zst" :
+                 "17177afa74e7294da0642861f08c88ca3c836764299a54bf6d1ce276cb9712a5",
+                 "versatile-pb.dtb" :
+                 "0bc0c0b0858cefd3c32b385c0d66d97142ded29472a496f4f490e42fc7615b25",
+                 "zImage" :
+                 "c95af2f27647c12265d75e9df44c22ff5228c59855f54aaa70f41ec2842e3a4d" }
+
+        self.common_tuxrun(csums=sums,
+                           drive="virtio-blk-pci",
                            dt="versatile-pb.dtb")
 
     def test_armv7(self):
@@ -219,7 +250,12 @@ def test_armv7(self):
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        sums = { "rootfs.ext4.zst" :
+                 "ab1fbbeaddda1ffdd45c9405a28cd5370c20f23a7cbc809cc90dc9f243a8eb5a",
+                 "zImage" :
+                 "4c7a22e9f15875bec06bd2a29d822496571eb297d4f22694099ffcdb19077572" }
+
+        self.common_tuxrun(csums=sums)
 
     def test_armv7be(self):
         """
@@ -232,7 +268,12 @@ def test_armv7be(self):
         :avocado: tags=console:ttyAMA0
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun()
+        sums = {"rootfs.ext4.zst" :
+                "42ed46dd2d59986206c5b1f6cf35eab58fe3fd20c96b41aaa16b32f3f90a9835",
+                "zImage" :
+                "7facc62082b57af12015b08f7fdbaf2f123ba07a478367853ae12b219afc9f2f" }
+
+        self.common_tuxrun(csums=sums)
 
     def test_i386(self):
         """
@@ -243,7 +284,12 @@ def test_i386(self):
         :avocado: tags=image:bzImage
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="virtio-blk-pci")
+        sums = {"bzImage" :
+                "a3e5b32a354729e65910f5a1ffcda7c14a6c12a55e8213fb86e277f1b76ed956",
+                "rootfs.ext4.zst" :
+                "f15e66b2bf673a210ec2a4b2e744a80530b36289e04f5388aab812b97f69754a" }
+
+        self.common_tuxrun(csums=sums, drive="virtio-blk-pci")
 
     def test_mips32(self):
         """
@@ -256,7 +302,12 @@ def test_mips32(self):
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
+        sums = { "rootfs.ext4.zst" :
+                 "fc3da0b4c2f38d74c6d705123bb0f633c76ed953128f9d0859378c328a6d11a0",
+                 "vmlinux" :
+                 "bfd2172f8b17fb32970ca0c8c58f59c5a4ca38aa5855d920be3a69b5d16e52f0" }
+
+        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_mips32el(self):
         """
@@ -268,7 +319,12 @@ def test_mips32el(self):
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
+        sums = { "rootfs.ext4.zst" :
+                 "e799768e289fd69209c21f4dacffa11baea7543d5db101e8ce27e3bc2c41d90e",
+                 "vmlinux" :
+                 "8573867c68a8443db8de6d08bb33fb291c189ca2ca671471d3973a3e712096a3" }
+
+        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_mips64(self):
         """
@@ -280,7 +336,12 @@ def test_mips64(self):
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
+        sums = { "rootfs.ext4.zst" :
+                 "69d91eeb04df3d8d172922c6993bb37d4deeb6496def75d8580f6f9de3e431da",
+                 "vmlinux" :
+                 "09010e51e4b8bcbbd2494786ffb48eca78f228e96e5c5438344b0eac4029dc61" }
+
+        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_mips64el(self):
         """
@@ -291,7 +352,12 @@ def test_mips64el(self):
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
+        sums = { "rootfs.ext4.zst" :
+                 "fba585368f5915b1498ed081863474b2d7ec4e97cdd46d21bdcb2f9698f83de4",
+                 "vmlinux" :
+                 "d4e08965e2155c4cccce7c5f34d18fe34c636cda2f2c9844387d614950155266" }
+
+        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_ppc32(self):
         """
@@ -302,7 +368,12 @@ def test_ppc32(self):
         :avocado: tags=image:uImage
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="virtio-blk-pci")
+        sums = { "rootfs.ext4.zst" :
+                 "8885b9d999cc24d679542a02e9b6aaf48f718f2050ece6b8347074b6ee41dd09",
+                 "uImage" :
+                 "1a68f74b860fda022fb12e03c5efece8c2b8b590d96cca37a8481a3ae0b3f81f" }
+
+        self.common_tuxrun(csums=sums, drive="virtio-blk-pci")
 
     def test_ppc64(self):
         """
@@ -316,7 +387,12 @@ def test_ppc64(self):
         :avocado: tags=extradev:driver=spapr-vscsi
         :avocado: tags=root:sda
         """
-        self.common_tuxrun(drive="scsi-hd")
+        sums = { "rootfs.ext4.zst" :
+                 "1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff",
+                 "vmlinux" :
+                 "f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728" }
+
+        self.common_tuxrun(csums=sums, drive="scsi-hd")
 
     def test_ppc64le(self):
         """
@@ -329,7 +405,12 @@ def test_ppc64le(self):
         :avocado: tags=extradev:driver=spapr-vscsi
         :avocado: tags=root:sda
         """
-        self.common_tuxrun(drive="scsi-hd")
+        sums = { "rootfs.ext4.zst" :
+                 "b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906",
+                 "vmlinux" :
+                 "979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2" }
+
+        self.common_tuxrun(csums=sums, drive="scsi-hd")
 
     def test_riscv32(self):
         """
@@ -337,7 +418,14 @@ def test_riscv32(self):
         :avocado: tags=machine:virt
         :avocado: tags=tuxboot:riscv32
         """
-        self.common_tuxrun()
+        sums = { "Image" :
+                 "89599407d7334de629a40e7ad6503c73670359eb5f5ae9d686353a3d6deccbd5",
+                 "fw_jump.elf" :
+                 "f2ef28a0b77826f79d085d3e4aa686f1159b315eff9099a37046b18936676985",
+                 "rootfs.ext4.zst" :
+                 "7168d296d0283238ea73cd5a775b3dd608e55e04c7b92b76ecce31bb13108cba" }
+
+        self.common_tuxrun(csums=sums)
 
     def test_riscv64(self):
         """
@@ -345,7 +433,14 @@ def test_riscv64(self):
         :avocado: tags=machine:virt
         :avocado: tags=tuxboot:riscv64
         """
-        self.common_tuxrun()
+        sums = { "Image" :
+                 "cd634badc65e52fb63465ec99e309c0de0369f0841b7d9486f9729e119bac25e",
+                 "fw_jump.elf" :
+                 "6e3373abcab4305fe151b564a4c71110d833c21f2c0a1753b7935459e36aedcf",
+                 "rootfs.ext4.zst" :
+                 "b18e3a3bdf27be03da0b285e84cb71bf09eca071c3a087b42884b6982ed679eb" }
+
+        self.common_tuxrun(csums=sums)
 
     def test_s390(self):
         """
@@ -355,7 +450,13 @@ def test_s390(self):
         :avocado: tags=image:bzImage
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="virtio-blk-ccw",
+        sums = { "bzImage" :
+                 "0414e98dd1c3dafff8496c9cd9c28a5f8d04553bb5ba37e906a812b48d442ef0",
+                 "rootfs.ext4.zst" :
+                 "88c37c32276677f873a25ab9ec6247895b8e3e6f8259134de2a616080b8ab3fc" }
+
+        self.common_tuxrun(csums=sums,
+                           drive="virtio-blk-ccw",
                            haltmsg="Requesting system halt")
 
     # Note: some segfaults caused by unaligned userspace access
@@ -370,9 +471,14 @@ def test_sh4(self):
         :avocado: tags=root:sda
         :avocado: tags=console:ttySC1
         """
+        sums = { "rootfs.ext4.zst" :
+                 "3592a7a3d5a641e8b9821449e77bc43c9904a56c30d45da0694349cfd86743fd",
+                 "zImage" :
+                 "29d9b2aba604a0f53a5dc3b5d0f2b8e35d497de1129f8ee5139eb6fdf0db692f" }
+
         # The test is currently too unstable to do much in userspace
         # so we skip common_tuxrun and do a minimal boot and shutdown.
-        (kernel, disk, dtb) = self.fetch_tuxrun_assets()
+        (kernel, disk, dtb) = self.fetch_tuxrun_assets(csums=sums)
 
         # the console comes on the second serial port
         self.prepare_run(kernel, disk,
@@ -395,7 +501,13 @@ def test_sparc64(self):
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
+
+        sums = { "rootfs.ext4.zst" :
+                 "ad2f1dc436ab51583543d25d2c210cab478645d47078d30d129a66ab0e281d76",
+                 "vmlinux" :
+                 "e34313e4325ff21deaa3d38a502aa09a373ef62b9bd4d7f8f29388b688225c55" }
+
+        self.common_tuxrun(csums=sums, drive="driver=ide-hd,bus=ide.0,unit=0")
 
     def test_x86_64(self):
         """
@@ -407,4 +519,10 @@ def test_x86_64(self):
         :avocado: tags=root:sda
         :avocado: tags=shutdown:nowait
         """
-        self.common_tuxrun(drive="driver=ide-hd,bus=ide.0,unit=0")
+        sums = { "bzImage" :
+                 "2bc7480a669ee9b6b82500a236aba0c54233debe98cb968268fa230f52f03461",
+                 "rootfs.ext4.zst" :
+                 "b72ac729769b8f51c6dffb221113c9a063c774dbe1d66af30eb593c4e9999b4b" }
+
+        self.common_tuxrun(csums=sums,
+                           drive="driver=ide-hd,bus=ide.0,unit=0")
-- 
2.39.2


