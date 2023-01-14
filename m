Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F2066A93C
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:32:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXtE-0006cA-Gj; Fri, 13 Jan 2023 23:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXtC-0006bd-SC
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:11:30 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXtB-0007Zi-1W
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:11:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so2398261pjg.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rli4HZEvXsso9F4dz6jCJp4UP5tc1yAU04PdvBH668o=;
 b=zO3PoP412N6wIwmqp+r3OBhLJ0aXq0NE5qjFIZKHdzSHcLMb9KJN8BZhRuDgI65ckd
 YaPEEtVRhQx+Cu+drfgJ9zmmL5N2kT7mXsdBfsU+1GDeoP76hVRt6Zlyage/Oa9JFZsb
 gpzCRw15nLwH47CmKwqyiyhEGvyvWRm/blBKb/gNl+qBWqF8IIOynnnuO5pfFIUNt2fm
 SuauIX12gVB87OCrXf5uejsQKcMBFlMhaF3YZQgtip+V5eI9jt9XFFOTLbjrsIceQiOf
 38mZrX5EymSTohWp1nQuLtldhY3JJSKrF659kQysSnYYnv891QeJ/OT7kvg7evss9fg3
 ldTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rli4HZEvXsso9F4dz6jCJp4UP5tc1yAU04PdvBH668o=;
 b=GIsc94ZaGuTncwe/kiMC0tIAjjr8ifKBCy0C/FwUeRrCrOZwmPVzFZx0ZRj/Niowhe
 PPnFgEfdwXh27q53dAbcksyH7cdCRAlpwglLY5b5Kc6Tas7NbAoVZvoFNOL97+Syl/a6
 N4ZhUwGDAiRf5g5Km42WK0PvFi49LIiYj7nD5brS8S6Z/JXtmmavVaVJwxuG1a5SImZu
 3KZzfo6jh6t/znWXqhNP2E60kQIPfyuCow9k+b3P6Mz73KFoOjIWY3sxwr8znHTdaGEk
 pyBh2IA0dQHE1aWHhhCT0UH7bs6FeJVh69Edd0zgecAAc9QeZfWGRsXzXYaEknhWtXAj
 ekPQ==
X-Gm-Message-State: AFqh2kpMRe5E+w6mMv5igWsYDBEB1a86EnvYs18WZDU/BANue/043PW3
 uqa621rbck5dFwQRZPaS2SLNlA==
X-Google-Smtp-Source: AMrXdXvMvYdebFgqCco+blP1rfPphz1GWucj+dtPGSGbPH5sOC8pm6ubMB9Cx99qjeKuQJwLxiQlBw==
X-Received: by 2002:a17:90b:394a:b0:219:9973:2746 with SMTP id
 oe10-20020a17090b394a00b0021999732746mr13298914pjb.0.1673669487964; 
 Fri, 13 Jan 2023 20:11:27 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a63ef55000000b00478bd458bdfsm12244535pgk.88.2023.01.13.20.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:11:27 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: [PATCH v2 13/13] docs/system/devices/igb: Add igb documentation
Date: Sat, 14 Jan 2023 13:10:04 +0900
Message-Id: <20230114041004.36459-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114041004.36459-1-akihiko.odaki@daynix.com>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS                      |  1 +
 docs/system/device-emulation.rst |  1 +
 docs/system/devices/igb.rst      | 70 ++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 docs/system/devices/igb.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 5409f2d625..8a72a29658 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2221,6 +2221,7 @@ F: tests/qtest/fuzz-e1000e-test.c
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
+F: docs/system/devices/igb.rst
 F: hw/net/igb*
 F: tests/avocado/igb.py
 F: tests/qtest/igb-test.c
diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 0506006056..c1b1934e3d 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -93,3 +93,4 @@ Emulated Devices
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
    devices/canokey.rst
+   devices/igb.rst
diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
new file mode 100644
index 0000000000..1a77c82ed8
--- /dev/null
+++ b/docs/system/devices/igb.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+.. _igb:
+
+igb
+---
+
+igb is a family of Intel's gigabit ethernet controllers. In QEMU, 82576
+emulation is implemented in particular. Its datasheet is available at [1]_.
+
+This implementation is expected to be useful to test SR-IOV networking without
+requiring physical hardware.
+
+Limitations
+===========
+
+This igb implementation was tested with Linux Test Project [2]_ during the
+initial development. The command used when testing is:
+
+.. code-block:: shell
+
+  network.sh -6mta
+
+Be aware that this implementation lacks many functionalities available with the
+actual hardware, and you may experience various failures if you try to use it
+with a different operating system other than Linux or if you try functionalities
+not covered by the tests.
+
+Using igb
+=========
+
+Using igb should be nothing different from using another network device. See
+:ref:`pcsys_005fnetwork` in general.
+
+However, you may also need to perform additional steps to activate SR-IOV
+feature on your guest. For Linux, refer to [3]_.
+
+Developing igb
+==============
+
+igb is the successor of e1000e, and e1000e is the successor of e1000 in turn.
+As these devices are very similar, if you make a change for igb and the same
+change can be applied to e1000e and e1000, please do so.
+
+Please do not forget to run tests before submitting a change. As tests included
+in QEMU is very minimal, run some application which is likely to be affected by
+the change to confirm it works in an integrated system.
+
+Testing igb
+===========
+
+A qtest of the basic functionality is available. Run the below at the build
+directory:
+
+.. code-block:: shell
+
+  meson test qtest-x86_64/qos-test
+
+ethtool can test register accesses, interrupts, etc. It is automated as an
+Avocado test and can be ran with the following command:
+
+.. code:: shell
+
+  make check-avocado AVOCADO_TESTS=tests/avocado/igb.py
+
+References
+==========
+
+.. [1] https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eb-gigabit-ethernet-controller-datasheet.pdf
+.. [2] https://github.com/linux-test-project/ltp
+.. [3] https://docs.kernel.org/PCI/pci-iov-howto.html
-- 
2.39.0


