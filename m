Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C226D401D94
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:28:24 +0200 (CEST)
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGXn-0000g1-Oz
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNGWb-000878-CP
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:27:10 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNGWV-0006Bg-BL
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:27:09 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ia27so14154729ejc.10
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D+DTn6N7DVFVZhlUHW7GMrtljKXZv8rFdTum+nxBOmY=;
 b=kPfZRt3SJIIYzxLGxFNsfzLcuj4bXNWPvgUbfg7Lk/AHwhZvdV1WJHAhWkgTk5EqsT
 RH8OzYB+H6yXIkcKJlqTiPCqdkaEqsP4Cl+0e/qxGIZAHidFIMzVF4IG70Keo8ebCHv8
 y+MUd767k+k7oO9gawf9b3cZKwfHiSfg7+msylpC7FoLyLBK+QEnU48sXUT2rUuvfv9n
 30zXCADXr9RZlN8T2oJygcpAxcE3S1/JWQ3vka1V6rS9A6w9EFCCwu727qeLHavKC5wD
 Muc3+QcgwCh5EX/2d3A3RFjtwziyNg06DyQDUV5GTXZUGQOkB63iSQ2GjCwsY6qLqX4O
 6NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=D+DTn6N7DVFVZhlUHW7GMrtljKXZv8rFdTum+nxBOmY=;
 b=SQFGtMxDY5ACSqylgKxyKwyfq7/gzWpOEdAhwjIPn2shj9AQ+fEt9zQKoVoGtEqXOf
 njAF89AsT81NSIGP0xqbEGelY58ieI69/XVl0aIpoeKRCqpc+zspONnHXEI+3FeEAo0G
 9qFyCpwpRqgwO1Q0MeLWRAlhlBAx2Dl1f6x0HWJUxWqD8wXS2+RQB1MspG74ItjO1Gxv
 fOJ5Xi50TobGCCfnFt8hJ+cKiU5r+ZDh1lS3F/5NgGGHgTSESveLod2Jd14RZhWwKG5l
 ja4rg27vnIOHuJL9XC4vwGdJiGLa66HM8mDLC2jeJ2gUqZ4hxG3BCLW+yuWSKevVWw47
 K3DQ==
X-Gm-Message-State: AOAM530KUBs654PIFsld+vn68V/M9oQTzJM1DLCAof6u8GOjFjweOEPb
 7gsuMzDv/WsFSy7MoXW49bnZnRXEFSg=
X-Google-Smtp-Source: ABdhPJyDnvygkqsMDdeHNI299BfR585DuTsQJ63/xq2nnt3a73Kum+Rkm18uxt7gRmSOSh9HkYoTaA==
X-Received: by 2002:a17:906:700f:: with SMTP id
 n15mr14182621ejj.319.1630942021095; 
 Mon, 06 Sep 2021 08:27:01 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e7sm5139739edk.3.2021.09.06.08.27.00 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 08:27:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/36] (Mostly) x86 changes for 2021-09-06
Date: Mon,  6 Sep 2021 17:26:56 +0200
Message-Id: <20210906152657.72046-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

for you to fetch changes up to e423a6e6467abe2994e70670eb197069cc652782:

  doc: Add the SGX doc (2021-09-06 17:24:38 +0200)

----------------------------------------------------------------
* SGX support (Sean, Yang)
* vGIF and vVMLOAD/VMSAVE support (Lara)
* Fix LA57 support in TCG (Daniel)
----------------------------------------------------------------

v1->v2: now entirely x86 - removed gbm patch and added the first one to fix TCG LA57

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
 slirp                                    |   2 +-
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
 37 files changed, 1368 insertions(+), 65 deletions(-)
 create mode 100644 backends/hostmem-epc.c
 create mode 100644 docs/intel-sgx.txt
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 hw/i386/sgx-stub.c
 create mode 100644 hw/i386/sgx.c
 create mode 100644 include/hw/i386/sgx-epc.h
-- 
2.31.1


