Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583F4023E4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:16:35 +0200 (CEST)
Received: from localhost ([::1]:59830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVLN-0008TM-W7
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNVIr-00076v-SS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:13:58 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNVIo-0005JT-IU
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:13:57 -0400
Received: by mail-ej1-x62d.google.com with SMTP id i21so17798594ejd.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 00:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rl+BLe5Z2hMajLfbeCnwNZ/QgGcIYiAMdh0iYw7EYx8=;
 b=Uq8YPVv7v61Lo9x+2IpZESVaEEYqlqN1P/6f+qYaN8AoGXylNUieCYzi2oapTHwxl5
 HyMpeb/Aq/gKM4tymT+Yql820ohB/fK5mbplqbMlpqInY059Ar+onMO7QTlf53Z3csZe
 4On/2/wGMCUJKB1dFuDl07fJcNzRLlfSza06atgLcn0cNWYFNwc0aqIFoUW24zg/YvZK
 Q9qei74sELU5XZUqaE8JnmkwETdiv67lxqaUlFeSCk2upzAj/NdVQZk8Y0momjdtU7rX
 R3XzXrs7pJzu1rGhq+d5yRKGZYl0GmwRZd986bgrqmCwKxfG3/bcfoJdIk92nMiiEIIk
 kJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Rl+BLe5Z2hMajLfbeCnwNZ/QgGcIYiAMdh0iYw7EYx8=;
 b=m5NMoOM534o2hZeVWH+ctgsKzAp7WtNtW3AIonXflFk3oqGC2ejmtAKFssuULNRUcV
 yzcWweLEmXiwrrczmGBDmwP1/FRdzWUnE97T0RegrbDDKr2YsvdXGQf37gmfh/aXTYaI
 o08vLwvyUugtjNswsbIxouyTOBP/2hlSgbvK8SAd1uVhQEzwbFWqZ0Qwbs2nGuV8TT8Y
 CWVqtqLcHq+8M7igMSUSJkkpLdJsxg9pF0XnFgK3+MHKd0ljIVnogd4Bnayp8XAIOEcR
 j3BCgdaONBY7JsNrIl14fp21pTACekQHpBpt5cY6t0J8ZocMwU3mFu5Ce6YE0dQGm0/f
 WB/w==
X-Gm-Message-State: AOAM532OXg8LW/AWyK0tVHMUJ0nWiX/OXXymB0kWE4oAaguSWlXzEZ+q
 cPeeXyEYb6jwjYW15a09rvxERnNMctw=
X-Google-Smtp-Source: ABdhPJxjr7ykp0TkXV0n/1l4R4WiFJdYEG7lAYo/+FgJ5Tf6j2xvrSdXCsf9eDioWXltIJFaxq0yHg==
X-Received: by 2002:a17:906:3012:: with SMTP id
 18mr17942777ejz.136.1630998832764; 
 Tue, 07 Sep 2021 00:13:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id mb14sm4955153ejb.81.2021.09.07.00.13.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 00:13:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/36] (Mostly) x86 changes for 2021-09-06
Date: Tue,  7 Sep 2021 09:13:48 +0200
Message-Id: <20210907071349.116329-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 127c76bd1aa893122a22677b991c0f31ebef7f09:

  doc: Add the SGX doc (2021-09-07 08:54:57 +0200)

----------------------------------------------------------------
* SGX support (Sean, Yang)
* vGIF and vVMLOAD/VMSAVE support (Lara)
* Fix LA57 support in TCG (Daniel)

----------------------------------------------------------------
v1->v2: now entirely x86 - removed gbm patch and added the first one to fix TCG LA57

v2->v3: fix "target/i386: Moved int_ctl into CPUX86State structure" commit

Daniel P. Berrangé (1):
      target/i386: add missing bits to CR4_RESERVED_MASK

Lara Lazier (7):
      target/i386: VMRUN and VMLOAD canonicalizations
      target/i386: Added VGIF feature
      target/i386: Moved int_ctl into CPUX86State structure
      target/i386: Added VGIF V_IRQ masking capability
      target/i386: Added ignore TPR check in ctl_has_irq
      target/i386: Added changed priority check for VIRQ
      target/i386: Added vVMLOAD and vVMSAVE feature

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
      hw/i386/pc: Account for SGX EPC sections when calculating device memory
      i386/pc: Add e820 entry for SGX EPC section(s)
      i386: acpi: Add SGX EPC entry to ACPI tables
      q35: Add support for SGX EPC
      i440fx: Add support for SGX EPC
      doc: Add the SGX doc

Yang Zhong (7):
      qom: Add memory-backend-epc ObjectOptions support
      hostmem-epc: Add the reset interface for EPC backend reset
      sgx-epc: Add the reset interface for sgx-epc virt device
      sgx-epc: Avoid bios reset during sgx epc initialization
      hostmem-epc: Make prealloc consistent with qemu cmdline during reset
      Kconfig: Add CONFIG_SGX support
      sgx-epc: Add the fill_device_info() callback support

 backends/hostmem-epc.c                   | 118 ++++++++++++++
 backends/meson.build                     |   1 +
 configs/devices/i386-softmmu/default.mak |   1 +
 docs/intel-sgx.txt                       | 167 +++++++++++++++++++
 hw/i386/Kconfig                          |   5 +
 hw/i386/acpi-build.c                     |  22 +++
 hw/i386/fw_cfg.c                         |  10 +-
 hw/i386/meson.build                      |   2 +
 hw/i386/pc.c                             |  15 +-
 hw/i386/pc_piix.c                        |   4 +
 hw/i386/pc_q35.c                         |   3 +
 hw/i386/sgx-epc.c                        | 265 +++++++++++++++++++++++++++++++
 hw/i386/sgx-stub.c                       |  13 ++
 hw/i386/sgx.c                            |  84 ++++++++++
 hw/i386/x86.c                            |  29 ++++
 hw/vfio/common.c                         |   1 +
 include/exec/memory.h                    |  15 +-
 include/hw/i386/pc.h                     |   8 +
 include/hw/i386/sgx-epc.h                |  67 ++++++++
 include/hw/i386/x86.h                    |   1 +
 monitor/hmp-cmds.c                       |  10 ++
 qapi/machine.json                        |  52 +++++-
 qapi/qom.json                            |  19 +++
 qemu-options.hx                          |  10 +-
 softmmu/memory.c                         |   5 +
 softmmu/physmem.c                        |   3 +-
 target/i386/cpu.c                        | 199 +++++++++++++++++++++--
 target/i386/cpu.h                        |  39 +++++
 target/i386/kvm/kvm.c                    |  75 +++++++++
 target/i386/kvm/kvm_i386.h               |   2 +
 target/i386/machine.c                    |  42 ++++-
 target/i386/svm.h                        |   8 +
 target/i386/tcg/seg_helper.c             |   2 +-
 target/i386/tcg/sysemu/excp_helper.c     |   2 +-
 target/i386/tcg/sysemu/misc_helper.c     |  11 +-
 target/i386/tcg/sysemu/svm_helper.c      | 121 +++++++++-----
 36 files changed, 1367 insertions(+), 64 deletions(-)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 docs/intel-sgx.txt
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c
 create mode 100644 include/hw/i386/sgx-epc.h
-- 
2.31.1


