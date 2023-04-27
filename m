Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B46F0892
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:46:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oG-0001tC-GA; Thu, 27 Apr 2023 11:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o4-0001oT-Ma
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o1-0004ig-TB
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so88630025e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610312; x=1685202312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wgoxuz1ScUhHkzTThSzzMJt+lGCLt4B0IMA+ZNFLE5U=;
 b=VtfEyePgldBXMvdP4EEwz9pqZkXnoLX8evZp/jpzOah47K7lpdi92VTbnjqD7UqFJo
 MyIRfACj5u3NsOpvbi2oOb3lBjR5ER7y+iw9gvumNrtCffk65PdEoRiOQHFnKUUMIvuw
 z8J6OfXsrct/WQ46S+Gse883bdmd1tqRx5f/jE/KX0IPUMU5p1i4A+vxF1zV66sv0VOe
 A4oUd94RLgdYzdjeZ80zQOx5dXCwbrCj61xepD/VWorZo8QVjpKJm79c+AzwEnBX8Dir
 Ve6hPsIkEF2v3EMw7xiHRdxUIohJsmiUGbJxmUtvZZqslJzkUjFXTd4IdRqo0mMu6B43
 9slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610312; x=1685202312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wgoxuz1ScUhHkzTThSzzMJt+lGCLt4B0IMA+ZNFLE5U=;
 b=kHqRu/FwSTFESbwYAUA92lOwviKZrsH5msns266AhSDhm0YV4FFERaXnIUblxRLcbW
 k6x4hVvczaifvioGMIejvpRfWkC8MEFaDZxj/RhV1THf+ksaQQzPTnaT/FOfWVBIap9B
 68Nf+XI0mwJewjWetcSyMqnjNRaeUNIvz2L9rizNrQorbNPCoaPkXr7EjCq9qA+QWQ/g
 UoFLA4oh+hXfoXCUQk4txi3gB1NI9AUtsGhNSeZbmaui5adaqKJ6LDvmZbyiujn7bDi3
 U/r2g07falLhETX9oDwZ0I9ubIgJ/uW6fOvwM23UGttWPz/LFcIqIJ41AMHaUqsfvgMT
 Gfjg==
X-Gm-Message-State: AC+VfDwdo095mvT2kbeal712O7pveX1fAVXYffZMW1PyGmLkkivU/CM0
 r8LpUloxy6EmpQ1Sr4queZdOdA==
X-Google-Smtp-Source: ACHHUZ6SBm3nCyCucBBCTDKxWU+aGBnLtVXBar5/vI4SwKwRZNOT7tH5gph4E3Poz94kkZ8iG88lKg==
X-Received: by 2002:a7b:cc1a:0:b0:3f1:969f:c9d0 with SMTP id
 f26-20020a7bcc1a000000b003f1969fc9d0mr1799033wmh.4.1682610311838; 
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a1c7c18000000b003f183127434sm21666087wmc.30.2023.04.27.08.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E56AE1FFBA;
 Thu, 27 Apr 2023 16:45:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: [PULL 02/18] tests/avocado: use the new snapshots for testing
Date: Thu, 27 Apr 2023 16:44:54 +0100
Message-Id: <20230427154510.1791273-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230424092249.58552-3-alex.bennee@linaro.org>

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


