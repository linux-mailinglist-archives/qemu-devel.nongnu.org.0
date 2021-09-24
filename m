Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF94170DE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:30:55 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjPq-0007jn-NV
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKQ-0007Zx-Nn
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:18 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKO-0000Ms-NK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:18 -0400
Received: by mail-ed1-x535.google.com with SMTP id y89so24041173ede.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G3/K33BBZw0cSjh5NdGczdb+/h/Lf2n9LQGGLlHt3Bo=;
 b=YmPRU3bnxFNA04RrrXf7e4JmuQmQXu/vh6xXwuZ2AGNyxIE/6i9DPZr4h6gmO506Ho
 8I1HZS2lSVk3x1IKZwGvqQkRBaR9aPgobizK/JkWOnC0nAQHZIMMK2n1DeuLYed0XP36
 o6CO+73kODDSWyy361cc/tn+ZeKF3emHz3DnkAPg3lElKMIHbdL/VZZxBvxAOcAxAf2v
 C2Tb8wHJcl9pm12WnEgB1aXvlqYjQtLiwLXjipyuoC9vU3QHNkuhjvOLsG2/GsMx7SIa
 DhRy7khInKdfevF6wE/gPY9iaADrue06uC9aYOYyh+ZgTNj8gZYgfY7fWcP5z1o+yy6g
 z01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=G3/K33BBZw0cSjh5NdGczdb+/h/Lf2n9LQGGLlHt3Bo=;
 b=q3AATud3t7HYi4CPCq/UXrN5/3GzQ5hYVqtZA+2wmUsSGrFAZxhGG0AF/kkTv8749l
 G0DBA/0qlipDHal7WT/BumR8YhW9A8CzpcmI32sDaokyafYgDuR5O5F1PJ/2zcwJyXr6
 n2NUjGhNn9LyKnGrxnsKYAI6LeHTwj+4wSi3/hToJto1fNfbAHuaMMEOwralpvTujx5X
 SKXhEfmpvYTIR3PfV0smZKt1fYa7ui+g7o5UUjonitTVx9voYgEqh+wQiFYpZ0wStIiA
 qh6cJylNFX4m4J6TOqiUjcw3ChZrcgf1lSLeAXwlrwRluE/nd+yl7M6gFLFxW6WhXJ9m
 Sz/g==
X-Gm-Message-State: AOAM530p7rPfQz5SOSis7dMCcydo55x6RUtPV9IifVRgM+hGVmstCp7c
 hcKmj0Sk311ijtnnDq/RvLJURZ2TiTQ=
X-Google-Smtp-Source: ABdhPJzQiJViw8zRJ2ClvogzdH6Qe69gC18IkZKb5fUJehDwB1JgUTbH2jXJCjrS5DqDNgssZyAnbA==
X-Received: by 2002:a50:e089:: with SMTP id f9mr4348141edl.290.1632482711419; 
 Fri, 24 Sep 2021 04:25:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/26] Qemu SGX virtualization
Date: Fri, 24 Sep 2021 13:24:43 +0200
Message-Id: <20210924112509.25061-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This version includes a lot of the changes that were pointed out in
the review of the previous versions.  I apologize for rushing things
in to make it before the conference break.

Paolo

----

Changes from v4:

- removed RESET handling, which will use a dedicated kernel API

- cleaned up stubs with respect to bisection, moving the definition
  of CONFIG_SGX at the beginning of the series [Philippe]

- created new header include/hw/i386/hostmem-epc.h and used
  HostMemoryBackendEpc when applicable in the API

- changed "Since" documentation from 6.1 to 6.2 [Eric]

- moved pc_machine_init_sgx_epc to patch 13 ("i386: Update SGX CPUID
  info according to hardware/KVM/user input")

- define x86_cpu_set_sgxlepubkeyhash even for user-mode emulation
  [Philippe]

- converted documentation to rST [Peter]

- cleaned up QMP/HMP commands [Daniel]

- fixed stubs for QMP/HMP commands for --disable-kvm and non-Linux builds

Gitlab CI has been tested already and passes.

----

Sean Christopherson (21):
  memory: Add RAM_PROTECTED flag to skip IOMMU mappings
  hostmem: Add hostmem-epc as a backend for SGX EPC
  i386: Add 'sgx-epc' device to expose EPC sections to guest
  vl: Add sgx compound properties to expose SGX EPC sections to guest
  i386: Add primary SGX CPUID and MSR defines
  i386: Add SGX CPUID leaf FEAT_SGX_12_0_EAX
  i386: Add SGX CPUID leaf FEAT_SGX_12_0_EBX
  i386: Add SGX CPUID leaf FEAT_SGX_12_1_EAX
  i386: Add get/set/migrate support for SGX_LEPUBKEYHASH MSRs
  i386: Add feature control MSR dependency when SGX is enabled
  i386: Update SGX CPUID info according to hardware/KVM/user input
  i386: kvm: Add support for exposing PROVISIONKEY to guest
  i386: Propagate SGX CPUID sub-leafs to KVM
  Adjust min CPUID level to 0x12 when SGX is enabled
  hw/i386/fw_cfg: Set SGX bits in feature control fw_cfg accordingly
  hw/i386/pc: Account for SGX EPC sections when calculating device
    memory
  i386/pc: Add e820 entry for SGX EPC section(s)
  i386: acpi: Add SGX EPC entry to ACPI tables
  q35: Add support for SGX EPC
  i440fx: Add support for SGX EPC
  docs/system: Add SGX documentation to the system manual

Yang Zhong (5):
  Kconfig: Add CONFIG_SGX support
  qom: Add memory-backend-epc ObjectOptions support
  sgx-epc: Add the fill_device_info() callback support
  target/i386: Add HMP and QMP interfaces for SGX
  target/i386: Add the query-sgx-capabilities QMP command

 backends/hostmem-epc.c                   |  82 ++++++++++
 backends/meson.build                     |   1 +
 configs/devices/i386-softmmu/default.mak |   1 +
 docs/system/i386/sgx.rst                 | 165 ++++++++++++++++++++
 docs/system/target-i386.rst              |   1 +
 hmp-commands-info.hx                     |  15 ++
 hw/i386/Kconfig                          |   5 +
 hw/i386/acpi-build.c                     |  22 +++
 hw/i386/fw_cfg.c                         |  10 +-
 hw/i386/meson.build                      |   2 +
 hw/i386/pc.c                             |  15 +-
 hw/i386/pc_piix.c                        |   1 +
 hw/i386/pc_q35.c                         |   1 +
 hw/i386/sgx-epc.c                        | 184 +++++++++++++++++++++++
 hw/i386/sgx-stub.c                       |  26 ++++
 hw/i386/sgx.c                            | 170 +++++++++++++++++++++
 hw/i386/x86.c                            |  29 ++++
 hw/vfio/common.c                         |   1 +
 include/exec/memory.h                    |  15 +-
 include/hw/i386/hostmem-epc.h            |  28 ++++
 include/hw/i386/pc.h                     |   6 +
 include/hw/i386/sgx-epc.h                |  67 +++++++++
 include/hw/i386/sgx.h                    |  12 ++
 include/hw/i386/x86.h                    |   1 +
 include/monitor/hmp-target.h             |   1 +
 monitor/hmp-cmds.c                       |  10 ++
 qapi/machine.json                        |  52 ++++++-
 qapi/misc-target.json                    |  61 ++++++++
 qapi/qom.json                            |  19 +++
 qemu-options.hx                          |  10 +-
 softmmu/memory.c                         |   5 +
 softmmu/physmem.c                        |   3 +-
 target/i386/cpu.c                        | 167 +++++++++++++++++++-
 target/i386/cpu.h                        |  16 ++
 target/i386/kvm/kvm.c                    |  75 +++++++++
 target/i386/kvm/kvm_i386.h               |   2 +
 target/i386/machine.c                    |  20 +++
 target/i386/monitor.c                    |  32 ++++
 tests/qtest/qmp-cmd-test.c               |   2 +
 39 files changed, 1325 insertions(+), 10 deletions(-)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 docs/system/i386/sgx.rst
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c
 create mode 100644 include/hw/i386/hostmem-epc.h
 create mode 100644 include/hw/i386/sgx-epc.h
 create mode 100644 include/hw/i386/sgx.h

-- 
2.31.1


