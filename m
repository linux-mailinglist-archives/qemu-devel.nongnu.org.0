Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4867C9C3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:22:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0JR-0002kn-By; Thu, 26 Jan 2023 06:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0JP-0002d4-7a
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:59 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0JN-0001ty-Bn
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:58 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so1412335pjb.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TT0osGopTDhuI/yhr4FFhg/4bwyCAiItzeE97MDNRcA=;
 b=s42/mkc644cVQALLvqB0JIA+RfA3aarYT6Vz1h1h6f8uDNkrXsuXaI9BEyrkf/lw/S
 rNKtgH7OPGUgWZdnZeaHWsl06UWbEg/XlWczIEzxBVJ/x0EVccPhhIzmZvC5MFZZceHa
 oj+mdTEuKfV8Ry4N7lxYl2MIHScl4r883RkX+WJeS71F9KtminDbyqO/qBaxrid8LroD
 B0v3NmB53ZKWsZ4jTuv3PIGDFXO+6GQTYYcIa0k4E8kIwZLkLvHtV4Gh7OkOoZW3eogw
 daDEchOCiEmcLtJLuSgJapc5Nwb5BA2cqRm5ytUhReht7wO8xTX2mhw9ibcMUpBUAovo
 Bh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TT0osGopTDhuI/yhr4FFhg/4bwyCAiItzeE97MDNRcA=;
 b=aziouzM+JjMgFE9W3qM/AAlqwJXnFuWkIguTKQjVVgavvATn0lIO0db9oKHz7iwI7T
 TGACgS2ugL52J1WeSLRwC/wysK5otwoMEDtFhKX0VFHwKbfCg2V2qNYUrt46aTigeDMY
 od7g+1/2scrKf4uXGko0XYgsL6Oe2AueCT9T+1j7MyD25jyOCWHmCPbasfrrbltdjH/V
 ZAVGoAXOU1IeNt8qQmV33iHl4TaLJNG96ptEIPPw+enwpJWpp4Wwt8aanE8DtCGQLv25
 rv58Xfqgz6ps0B4yZXP8hdl3Hl3wBB/KQhO4dxB6D9uS0ndjGjqhIdpu9Fb/du+fSKLy
 5CLw==
X-Gm-Message-State: AO0yUKWb+o7Rm00+wIdPVFgqIjrFHr9p/1Aigy/vsWyf8Me3SEnwoHp1
 Q1vS8IHa1ic+ZRifrcyNetoeuw==
X-Google-Smtp-Source: AK7set8VWa8Nrbn2UTex9DrRpUDOOXldJarA5Qh/gJV3fp/C9pUe3SbSFk14HnfzWO6HTu952LWUsg==
X-Received: by 2002:a17:90b:38ca:b0:229:ee6d:4178 with SMTP id
 nn10-20020a17090b38ca00b00229ee6d4178mr1800865pjb.38.1674732056069; 
 Thu, 26 Jan 2023 03:20:56 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a468e00b00229d7f2abd4sm849520pjf.54.2023.01.26.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:20:55 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 12/13] tests/avocado: Add igb test
Date: Thu, 26 Jan 2023 20:19:42 +0900
Message-Id: <20230126111943.38695-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126111943.38695-1-akihiko.odaki@daynix.com>
References: <20230126111943.38695-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

This automates ethtool tests for igb registers, interrupts, etc.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS                                   |  1 +
 .../org.centos/stream/8/x86_64/test-avocado   |  1 +
 tests/avocado/igb.py                          | 38 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 tests/avocado/igb.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 127fd92541..c0831aeb56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2225,6 +2225,7 @@ igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/igb*
+F: tests/avocado/igb.py
 F: tests/qtest/igb-test.c
 F: tests/qtest/libqos/igb.c
 
diff --git a/scripts/ci/org.centos/stream/8/x86_64/test-avocado b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
index 7aeecbcfb8..7e07dbcc89 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/test-avocado
+++ b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
@@ -37,6 +37,7 @@ make get-vm-images
     tests/avocado/cpu_queries.py:QueryCPUModelExpansion.test \
     tests/avocado/empty_cpu_model.py:EmptyCPUModel.test \
     tests/avocado/hotplug_cpu.py:HotPlugCPU.test \
+    tests/avocado/igb.py:IGB.test \
     tests/avocado/info_usernet.py:InfoUsernet.test_hostfwd \
     tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu \
     tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt \
diff --git a/tests/avocado/igb.py b/tests/avocado/igb.py
new file mode 100644
index 0000000000..abf5dfa07f
--- /dev/null
+++ b/tests/avocado/igb.py
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# ethtool tests for igb registers, interrupts, etc
+
+from avocado_qemu import LinuxTest
+
+class IGB(LinuxTest):
+    """
+    :avocado: tags=accel:kvm
+    :avocado: tags=arch:x86_64
+    :avocado: tags=distro:fedora
+    :avocado: tags=distro_version:31
+    :avocado: tags=machine:q35
+    """
+
+    timeout = 180
+
+    def test(self):
+        self.require_accelerator('kvm')
+        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
+        kernel_hash = '5b6f6876e1b5bda314f93893271da0d5777b1f3c'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        initrd_url = self.distro.pxeboot_url + 'initrd.img'
+        initrd_hash = 'dd0340a1b39bd28f88532babd4581c67649ec5b1'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+
+        # Ideally we want to test MSI as well, but it is blocked by a bug
+        # fixed with:
+        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=28e96556baca7056d11d9fb3cdd0aba4483e00d8
+        kernel_params = self.distro.default_kernel_params + ' pci=nomsi'
+
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_params,
+                         '-accel', 'kvm',
+                         '-device', 'igb')
+        self.launch_and_wait()
+        self.ssh_command('dnf -y install ethtool')
+        self.ssh_command('ethtool -t eth1 offline')
-- 
2.39.0


