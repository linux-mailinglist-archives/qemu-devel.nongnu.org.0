Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2455762610B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYiw-00086b-IS; Fri, 11 Nov 2022 13:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYin-00081N-IE
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005Ea-9n
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so3650827wmg.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=55oth95sDG5uXLLYP63sU7Rcz0LDLtRXBEC2GWr0LB4=;
 b=lb8tRJykEVrEvn36XZk3Yv4i1YxM4PpCKqBewx2K+4HeoIG8naaznrmITjin195xEZ
 6WCGtsN6MGiSu4pAK1Ltj+qQ2Z5Pnnjs1lYb1PnNnFSEpHhQaL6DkLnhuK3JgtV9vym3
 4qKxCZ+shslM1bmKIx9oXRYHbJ0CZAp5Ey8jWISRVK9a2Oh82CPrOkNR6XrP311FxzIH
 PEeq9Ns0DJe4Ub1i/QbDaQEgwxt1ZfbXDCy6yXfrRc0vqTjtNrBtTUap2FP5tpoLJbXh
 9wWS86NyzHUdyPCE1uzHIEoQJ9YZ2ScbRCvpwgOGpW+ZaQzJmylyuqCkkpQwH6yU53ui
 Cgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55oth95sDG5uXLLYP63sU7Rcz0LDLtRXBEC2GWr0LB4=;
 b=oujvnrdBKt7ve0dcj1JWjZHQ0ZzSZi8pEs/gUuT8a5yJ7IVWq64Ucm/J91dMN3sFYr
 n05gIdSqMFkvw/pjHq+NtnJhKWluDJJZ+pfyu+vkcM+2M+ByieuIp7qwhy1hveHTGxhk
 XEVUNIqx8sHfjSD8gUEnKWeDW5ro0ZsfwvEipOaubdJrPetvZxexPrqg/70fhN1hpXix
 /AjpHlr29k4JGNVLrGwvv9U1GNHJopj3sZ240TLfVGBX0QNXy3N301JygnxwyLla0Kib
 GKiew0n9iPt07ghC3nSRHT4YD7gT1tztPwKZcgaT82wLOSb+B3hXNJGa/gpoxo1APaJ2
 QL+Q==
X-Gm-Message-State: ANoB5pnFJHwI0WI5Y1dfhfcXwGATQh7VrXSSFMiqIo5vlV6a3GuCeXNv
 B9rh7idgyuUvBKrhvlC98ZHQ9g==
X-Google-Smtp-Source: AA0mqf6CLpHF0EbZcSLGa4Oc9daFjsY6wJYG6ZCDs5LDld4p/VgKCflgBLg0W7R5ZlxJ10psb4hiHw==
X-Received: by 2002:a05:600c:b55:b0:3cf:6ab3:4a0b with SMTP id
 k21-20020a05600c0b5500b003cf6ab34a0bmr2089569wmr.91.1668191136366; 
 Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a5d404b000000b0022ae0965a8asm2481028wrp.24.2022.11.11.10.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84E4C1FFB7;
 Fri, 11 Nov 2022 18:25:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 8.0 v5 00/20] use MemTxAttrs to avoid current_cpu in hw/
Date: Fri, 11 Nov 2022 18:25:15 +0000
Message-Id: <20221111182535.64844-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

This series attempts to improve the modelling of non-CPU writes to
peripherals by expanding the MemTxAttrs to carry more details about
the requester. There are only 3 requester types, the CPU, the PCI bus
and the MACHINE. The last is intended for machine specific buses and
leaves the details of how to decode that information to machine
specific code.

I've extended this beyond just being an Arm only experiment and into
some other machine types. Perhaps the most complicated bit was
tweaking the modelling of the IOAPIC/APIC which gave me the first use
of MTRT_MACHINE (although we don't fully validate the source we do now
correctly drop CPU accesses to the APIC MSI region).

The longer term goal will be to eliminate all the legacy mem
read/write functions and use MemTxAttrs everywhere.

The final patch deprecates the use of current_cpu in hw/ for new code
as a comment. What do people think?

Based-on: 20221111145529.4020801-1-alex.bennee@linaro.org

Alex Bennée (20):
  hw: encode accessing CPU index in MemTxAttrs
  target/arm: ensure TCG IO accesses set appropriate MemTxAttrs
  target/arm: ensure HVF traps set appropriate MemTxAttrs
  target/arm: ensure KVM traps set appropriate MemTxAttrs
  target/arm: ensure m-profile helpers set appropriate MemTxAttrs
  qtest: make read/write operation appear to be from CPU
  hw/intc/gic: use MxTxAttrs to divine accessing CPU
  hw/timer: convert mptimer access to attrs to derive cpu index
  hw/arm: remove current_cpu hack from pxa2xx access
  target/microblaze: initialise MemTxAttrs for CPU access
  target/sparc: initialise MemTxAttrs for CPU access
  target/riscv: initialise MemTxAttrs for CPU access
  target/i386: add explicit initialisation for MexTxAttrs
  hw/audio: explicitly set .requester_type for intel-hda
  hw/i386: update vapic_write to use MemTxAttrs
  include: add MEMTXATTRS_MACHINE helper
  hw/intc: properly model IOAPIC MSI messages
  hw/i386: convert apic access to use MemTxAttrs
  hw/isa: derive CPUState from MemTxAttrs in apm_ioport_writeb
  include/hw: add commentary to current_cpu export

 include/exec/memattrs.h           |  76 +++++++++++---
 include/hw/core/cpu.h             |  14 +++
 include/hw/i386/apic.h            |   2 +-
 include/hw/i386/ioapic_internal.h |   2 +
 include/hw/isa/apm.h              |   2 +-
 target/i386/cpu.h                 |   4 +-
 hw/acpi/ich9.c                    |   1 -
 hw/acpi/piix4.c                   |   2 +-
 hw/arm/pxa2xx.c                   |   2 +-
 hw/audio/intel-hda.c              |   2 +-
 hw/i386/amd_iommu.c               |   6 +-
 hw/i386/intel_iommu.c             |   2 +-
 hw/i386/kvmvapic.c                |  19 ++--
 hw/i386/x86.c                     |  11 +--
 hw/intc/apic.c                    |  62 ++++++++----
 hw/intc/arm_gic.c                 | 159 +++++++++++++++++++-----------
 hw/intc/ioapic.c                  |  35 +++++--
 hw/isa/apm.c                      |  21 +++-
 hw/isa/lpc_ich9.c                 |   5 +-
 hw/misc/tz-mpc.c                  |   2 +-
 hw/misc/tz-msc.c                  |   6 +-
 hw/pci/pci.c                      |   4 +-
 hw/timer/arm_mptimer.c            |  49 ++++++---
 softmmu/qtest.c                   |  26 ++---
 target/arm/hvf/hvf.c              |   4 +-
 target/arm/kvm.c                  |   9 +-
 target/arm/m_helper.c             |  12 +--
 target/arm/ptw.c                  |   3 +-
 target/arm/tlb_helper.c           |   2 +-
 target/i386/hax/hax-all.c         |   2 +-
 target/i386/nvmm/nvmm-all.c       |   2 +-
 target/i386/sev.c                 |   2 +-
 target/i386/whpx/whpx-all.c       |   2 +-
 target/microblaze/helper.c        |   4 +-
 target/riscv/cpu_helper.c         |   2 +-
 target/sparc/mmu_helper.c         |   6 +-
 36 files changed, 370 insertions(+), 194 deletions(-)

-- 
2.34.1


