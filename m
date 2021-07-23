Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CC63D3E3C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:11:13 +0200 (CEST)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yhc-0005sC-BE
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybB-0000D8-Bu
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:34 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yb9-0005X8-Mg
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:33 -0400
Received: by mail-wr1-x430.google.com with SMTP id l4so3095696wrs.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PPI621meN9sJrxAgzk9pLnBrmGAkbqEosNwrArAkihY=;
 b=XzsI0PTPeIomitRVvlXgaIQdK5OlW/gQyFQ9NEsMjcOlHwLwgbWWrDh1Ag4KvD5Lv6
 yp0uFhXxDr8+hLq3J/V8Wnwf/IT6v4qErZrs7JARw3bc6Il88kW/fuNW1lE9GecMMo6h
 jRuUKGtMJysC1enN7z92n1qAZYbR3DvCavmz388SDS9FaWtYUAoKNTz1YBEg6LPOhDtB
 GRfTWAXdTTb1mwjluIxwxC6AZnQG+/0NHg0QzfpQjaow+FlWQD0LDvmtyVSt1pb5cheB
 hQzp6VTvcqDk3RSNLuollfSQWzJdkA8zGD+AXMKPyTZW07rLw6pngwC/n67RUxMJSh9M
 iXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PPI621meN9sJrxAgzk9pLnBrmGAkbqEosNwrArAkihY=;
 b=bJoKznSTMOqhYqZN90yH2e7S4kiZVOZTjQZntchLDx2oAtPjuntALFwWa6EmrRwvN9
 4T/Devs6ysQb0fkSZJAse0bmNJD8uY9DoDYO2/Hu9Numc11h4iZZGvNd5jFyExXASUhc
 +UMFwj4IjUQCzy1adp3UY0HH/BWgMGwzjHGkhLtvJYpsiRSG3GlNIkYdGe4Ms31sLRBw
 4fq1+y7jhDHnQABSha+5G8NSPjydSFWeseB4KijtVTs7MJHE0+dSPcVszMQuhNVGfeZp
 GHr2k7bbcrD8Ec9cfnXseaQ6kmqnkFS1d2XZe3rOWj9P0JEt5SdAcUK4QUPO+uO7mtng
 WraQ==
X-Gm-Message-State: AOAM530ZAYvRebQG8dK29lEEPyM2a0TyIZAqTDtbUVwv9bwJDdWUlHdi
 RzV/F3wQNXJJiyyLiqdBiMq30g==
X-Google-Smtp-Source: ABdhPJx9xwmuSyDE+9OWqkgC1t26jdLrZ/ehPUx7fjFQFFYScFPWelCqaNFcqmHA9oMlqWkYH65IJw==
X-Received: by 2002:a05:6000:1248:: with SMTP id
 j8mr6299018wrx.391.1627059869096; 
 Fri, 23 Jul 2021 10:04:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm32285145wri.31.2021.07.23.10.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75EA21FF8C;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/28] docs: collect the disparate device emulation docs into
 one section
Date: Fri, 23 Jul 2021 18:03:28 +0100
Message-Id: <20210723170354.18975-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we are at it add a brief preamble that explains some of the
common concepts in QEMU's device emulation which will hopefully lead
to less confusing about our dizzying command line options.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210720232703.10650-3-alex.bennee@linaro.org>

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
new file mode 100644
index 0000000000..8adf05f606
--- /dev/null
+++ b/docs/system/device-emulation.rst
@@ -0,0 +1,89 @@
+.. _device-emulation:
+
+Device Emulation
+----------------
+
+QEMU supports the emulation of a large number of devices from
+peripherals such network cards and USB devices to integrated systems
+on a chip (SoCs). Configuration of these is often a source of
+confusion so it helps to have an understanding of some of the terms
+used to describes devices within QEMU.
+
+Common Terms
+~~~~~~~~~~~~
+
+Device Front End
+================
+
+A device front end is how a device is presented to the guest. The type
+of device presented should match the hardware that the guest operating
+system is expecting to see. All devices can be specified with the
+``--device`` command line option. Running QEMU with the command line
+options ``--device help`` will list all devices it is aware of. Using
+the command line ``--device foo,help`` will list the additional
+configuration options available for that device.
+
+A front end is often paired with a back end, which describes how the
+host's resources are used in the emulation.
+
+Device Buses
+============
+
+Most devices will exist on a BUS of some sort. Depending on the
+machine model you choose (``-M foo``) a number of buses will have been
+automatically created. In most cases the BUS a device is attached to
+can be inferred, for example PCI devices are generally automatically
+allocated to the next free address of first PCI bus found. However in
+complicated configurations you can explicitly specify what bus
+(``bus=ID``) a device is attached to along with its address
+(``addr=N``).
+
+Some devices, for example a PCI SCSI host controller, will add an
+additional buses to the system that other devices can be attached to.
+A hypothetical chain of devices might look like:
+
+  --device foo,bus=pci.0,addr=0,id=foo
+  --device bar,bus=foo.0,addr=1,id=baz
+
+which would be a bar device (with the ID of baz) which is attached to
+the first foo bus (foo.0) at address 1. The foo device which provides
+that bus is itself is attached to the first PCI bus (pci.0).
+
+
+Device Back End
+===============
+
+The back end describes how the data from the emulated device will be
+processed by QEMU. The configuration of the back end is usually
+specific to the class of device being emulated. For example serial
+devices will be backed by a ``--chardev`` which can redirect the data
+to a file or socket or some other system. Storage devices are handled
+by ``--blockdev`` which will specify how blocks are handled, for
+example being stored in a qcow2 file or accessing a raw host disk
+partition. Back ends can sometimes be stacked to implement features
+like snapshots.
+
+While the choice of back end is generally transparent to the guest,
+there are cases where features will not be reported to the guest if
+the back end is unable to support it.
+
+Device Pass Through
+===================
+
+Device pass through is where the device is actually given access to
+the underlying hardware. This can be as simple as exposing a single
+USB device on the host system to the guest or dedicating a video card
+in a PCI slot to the exclusive use of the guest.
+
+
+Emulated Devices
+~~~~~~~~~~~~~~~~
+
+.. toctree::
+   :maxdepth: 1
+
+   devices/ivshmem.rst
+   devices/net.rst
+   devices/nvme.rst
+   devices/usb.rst
+   devices/virtio-pmem.rst
diff --git a/docs/system/ivshmem.rst b/docs/system/devices/ivshmem.rst
similarity index 100%
rename from docs/system/ivshmem.rst
rename to docs/system/devices/ivshmem.rst
diff --git a/docs/system/net.rst b/docs/system/devices/net.rst
similarity index 100%
rename from docs/system/net.rst
rename to docs/system/devices/net.rst
diff --git a/docs/system/nvme.rst b/docs/system/devices/nvme.rst
similarity index 100%
rename from docs/system/nvme.rst
rename to docs/system/devices/nvme.rst
diff --git a/docs/system/usb.rst b/docs/system/devices/usb.rst
similarity index 100%
rename from docs/system/usb.rst
rename to docs/system/devices/usb.rst
diff --git a/docs/system/virtio-pmem.rst b/docs/system/devices/virtio-pmem.rst
similarity index 100%
rename from docs/system/virtio-pmem.rst
rename to docs/system/devices/virtio-pmem.rst
diff --git a/docs/system/index.rst b/docs/system/index.rst
index fda4b1b705..64a424ae99 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -11,15 +11,12 @@ or Hypervisor.Framework.
 
    quickstart
    invocation
+   device-emulation
    keys
    mux-chardev
    monitor
    images
-   net
    virtio-net-failover
-   usb
-   nvme
-   ivshmem
    linuxboot
    generic-loader
    guest-loader
@@ -30,7 +27,6 @@ or Hypervisor.Framework.
    gdb
    managed-startup
    cpu-hotplug
-   virtio-pmem
    pr-manager
    targets
    security
-- 
2.20.1


