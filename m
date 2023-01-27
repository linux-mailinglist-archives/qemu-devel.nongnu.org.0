Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CA67E944
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 16:17:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLQSQ-0006IJ-Pq; Fri, 27 Jan 2023 10:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSO-0006HZ-Mv
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:00 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pLQSM-0007ef-MV
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 10:16:00 -0500
Received: by mail-wm1-x335.google.com with SMTP id m15so3677327wms.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 07:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v/loKsrqNXhKulPQFnHuZ1LK4Lzmu4sWulORUgMyhTs=;
 b=iyhes9sJ/dpEnxEF/MtSp/w9m7mBKCwAwt1eWVs5mFQU2KgrP5/prUZBjoADxLX3nF
 +G7PAxCvGFO+n63J25agYzAh7MqSL+4KqmogsTcsBEoLBef2xwPqW/c6QkzoHqPBxiGA
 +M89wa5OI/q8meeDRWEDDPuI5mAybm3FCg3QLi8iTmj+7ZOv+V5+YGf1ZeVbFHcMSXIh
 +cJx4nO+idV1EmAn5stv6OyrD1MCAyjH4zdD+26xTy+WWqK4qZhxo5PYRuc6Zx8IwlFy
 PBQgxJkuSISJTDdbkGftcZcJvZcQtV8WFvwsdOz2HnOj8WNUb37ywkXFqi8Ze9959f+m
 RBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v/loKsrqNXhKulPQFnHuZ1LK4Lzmu4sWulORUgMyhTs=;
 b=EliTDFnBqRpJaNIXB8T6bzOKAZY4Ok8rFJ/65zJpSa8jzGuGfjo/nDl+rDUpCzk3Ae
 I7WIe0oWe36he7bKPX91y9ZVrmyHrEGdJY6A1t6R/CyGLld5NlfhipZv4KAbz2EtEEQj
 jLiMInrVnQA7iAZaaqz6hJj76qqxTaH+JMWB5quj29A2IsEjQZrf4okDjGOY8KLwkRik
 DkxiKwXkXZkgIkTY4kqGgNZWe463T/xmJGE7DJMPQZ+LUTi8ep04lNCUOLbxYA9So9AX
 oQDCDwzUk+r157LmMYVDvBaOTj1wtx9MHypZDPvSGz5asObrCHyzcxRKLbtkxdfUXJWn
 DwwA==
X-Gm-Message-State: AFqh2kpm5ttmuwZXhKXzSndH5oW7qR4bltAlgA4eYW8jX2jqo6aT7l8v
 hrAXx1CSbz62CUCUm/Ci1YA5xw==
X-Google-Smtp-Source: AMrXdXsR6gdrAsjZ8Po2e4mtIRfSx/7/gaAPBRHMQcHjIgNDG1tWAJ+MgAqe7I3SRcOa8tRzcwvwsA==
X-Received: by 2002:a05:600c:22d2:b0:3d1:f0f1:ceb4 with SMTP id
 18-20020a05600c22d200b003d1f0f1ceb4mr39395678wmg.19.1674832556337; 
 Fri, 27 Jan 2023 07:15:56 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 07:15:55 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 00/16] arm: Run Arm CCA VMs with KVM
Date: Fri, 27 Jan 2023 15:07:13 +0000
Message-Id: <20230127150727.612594-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The Arm Realm Management Extension (RME), part of the Arm Confidential
Computing Architecture (CCA), enables running confidential virtual
machines in a new "Realm" security state. While the host still manages
the resources of a guest running in a Realm, it cannot access them.

This series adds some support to QEMU for launching a guest in a Realm
with KVM. The KVM changes for CCA have been posted at [1].

Patches 2-4 introduce a new RmeGuest object that inherits from
ConfidentialGuestSupport and enable it for the virt machine. Like other
confidential guest architectures, launching a Realm VM requires two
command-line parameters:

	-object rme-guest,id=<id>,<parameters>
	-M confidential-guest-support=<id>

Patches 5-6 modify the KVM vCPU support. With CCA, KVM does not sit atop
the VM anymore but talks to a new component, the Realm Management
Monitor (RMM) which deals with the Realm stage-2 page tables and CPU
state. So KVM cannot access most vCPU registers anymore except for
passing parameters to RMM when handling VM exits. Likewise, the host
must not access any memory assigned to the guest (or else it gets a
granule protection fault). The private memfd work [2] by Chao Peng will
help with this.

Patches 8-9 deal with loading images into the Realm. Those are measured
by the RMM and part of the initial measurement, which allows a Realm
owner to attest that the Realm is running what it expects. Patches 10-14
pass parameters described in the RMM specification.


This initial posting only provides direct kernel boot with DTB, not
firmware boot. There is ongoing work to extend edk2 to run in a Realm,
which will require changes to QEMU. A few problems will come up:

* The FwCfg device provides kernel images, initrd, ACPI tables etc. This
  isn't an option for CCA because the guest does not trust what the host
  provides at runtime. I suggest to load all those things in Realm
  memory before boot, and pass their address in the device tree which is
  always present at the start of RAM. This will require new properties
  in the device-tree's chosen section.

* The guest firmware probably shouldn't be on an emulated flash device.
  For one thing, it doesn't need flash because it will store all
  variable in RAM. The flash device also relies on read-only mappings
  which are not supported by KVM RME at the moment, and trapping reads
  would break integrity. I suggest to either replace the flash device
  (address 0 of the virt machine) by RAM when RmeGuest is enabled, or
  load the firmware somewhere else in RAM.


Please see [1] for additional resource, including instructions for
building and running the CCA software stack on a model. An example
command-line:

qemu-system-aarch64
	-M virt -cpu host -enable-kvm -M gic-version=3 -smp 2 -m 256M -nographic 
	-M confidential-guest-support=rme0
	-object rme-guest,id=rme0,measurement-algo=sha512
	-kernel Image -initrd rootfs.cpio
	-append 'console=ttyAMA0 earlycon'
	-overcommit mem-lock=on

A branch with these patches is available at [3].

[1] https://lore.kernel.org/kvm/20230127112248.136810-1-suzuki.poulose@arm.com/
[2] https://lore.kernel.org/qemu-devel/20221202061347.1070246-1-chao.p.peng@linux.intel.com/
[3] https://jpbrucker.net/git/qemu cca/rfc-v1

Jean-Philippe Brucker (16):
  NOMERGE: Add KVM Arm RME definitions to Linux headers
  target/arm: Add confidential guest support
  target/arm/kvm-rme: Initialize realm
  hw/arm/virt: Add support for Arm RME
  target/arm/kvm: Split kvm_arch_get/put_registers
  target/arm/kvm-rme: Initialize vCPU
  target/arm/kvm: Select RME VM type for the scratch VM
  target/arm/kvm-rme: Populate the realm with boot images
  hw/arm/boot: Populate realm memory with boot images
  target/arm/kvm-rme: Add measurement algorithm property
  target/arm/kvm-rme: Add Realm Personalization Value parameter
  target/arm/kvm-rme: Add Realm SVE vector length
  target/arm/kvm-rme: Add breakpoints and watchpoints parameters
  target/arm/kvm-rme: Add PMU num counters parameters
  target/arm/kvm: Disable Realm reboot
  target/arm/kvm-rme: Disable readonly mappings

 docs/system/confidential-guest-support.rst |   1 +
 qapi/qom.json                              |  32 +-
 include/sysemu/kvm.h                       |   2 +
 linux-headers/asm-arm64/kvm.h              |  63 +++
 linux-headers/linux/kvm.h                  |  21 +-
 target/arm/cpu.h                           |   3 +
 target/arm/kvm_arm.h                       |  21 +
 accel/kvm/kvm-all.c                        |   8 +-
 hw/arm/boot.c                              |  10 +-
 hw/arm/virt.c                              |  48 +-
 target/arm/helper.c                        |   8 +
 target/arm/kvm-rme.c                       | 505 +++++++++++++++++++++
 target/arm/kvm.c                           |  20 +-
 target/arm/kvm64.c                         |  91 +++-
 target/arm/meson.build                     |   7 +-
 15 files changed, 822 insertions(+), 18 deletions(-)
 create mode 100644 target/arm/kvm-rme.c

-- 
2.39.0


