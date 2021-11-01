Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE904411CE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 02:19:21 +0100 (CET)
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhLyq-0007Nv-A3
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 21:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mhLxQ-00064e-1g
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 21:17:52 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:38636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mhLxN-00051M-88
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 21:17:51 -0400
Received: by mail-io1-xd30.google.com with SMTP id v65so19709214ioe.5
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 18:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHQCKbgdBi/VpqRMvZvRmQBf96l2TrMFAgEVLDV/9Fc=;
 b=L/fpr8qsFmkmGl9qwHVOuXFOwZm3gCWLN7dLULbgZq6tlel78ICYWUyT+RO7zY4vfm
 P0CS9xHOAZu/3H8e1qk4WbTif1DsL5t2FnvjTbZ9DD0D+KHIKUrreFwc54gukOxg9N5n
 HT143h6foDAuub+UV34YW56hFeF6E4vZBQN44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHQCKbgdBi/VpqRMvZvRmQBf96l2TrMFAgEVLDV/9Fc=;
 b=cUi2egNaHCLAQR4Q9+aqs5k2QnWYFe7N+tZDN1n9M66yCre1fQlpqFNGG3RKD6tfwb
 9WMC8wdcYkWpldx6b3i7LMSa2FMB7gPld3ecPVKw++34fzYMW+A55C6T10Cce3fQbque
 SgIHuDYVNGULMBW4JYyAWA4BNRm4NRIIBdhjHzZyrs13w2IzH3ogmS4+91Ud4kd2xZ2M
 ufdY/5X8rVeehJHAZdHzSMh1kazAT/93JMXNmX35mAXc/p4bkxOxFzA+uQDb35fBrX3J
 nXn/YjAg7qgArF1YoCw/RE24+ggtBbnVY4RQx9vQ1ig69l6ZPlDEXM9/wCZKFRy70yDF
 5MSA==
X-Gm-Message-State: AOAM531rCBqkTdg8gNH75YJCY1PPrRVHaRKFguWe02tCSM+fDET4Xp3i
 Kkq0jEvH4fWKkBctyv2YiGFfFA==
X-Google-Smtp-Source: ABdhPJzvpwgZ3Rxq+XU7vJ4PELhglUb5r/MMAIWOoYHbz2m0PCagdeBJjSlLTH6/9FfEkd+TMc99VA==
X-Received: by 2002:a05:6602:3281:: with SMTP id
 d1mr19027660ioz.84.1635729466680; 
 Sun, 31 Oct 2021 18:17:46 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id f11sm4351109ilu.82.2021.10.31.18.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 18:17:45 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH 00/31] passage: Define a standard for firmware data flow
Date: Sun, 31 Oct 2021 19:17:02 -0600
Message-Id: <20211101011734.1614781-1-sjg@chromium.org>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=sjg@chromium.org; helo=mail-io1-xd30.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 =?UTF-8?q?Fran=C3=A7ois=20Ozog?= <francois.ozog@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jerry Van Baren <vanbaren@cideas.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Simon Glass <sjg@chromium.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


This series adds a standard way of passing information between different
firmware phases. This already exists in U-Boot at a very basic level, in
the form of a bloblist containing an spl_handoff structure, but the intent
here is to define something useful across projects.

The need for this is growing as firmware fragments into multiple binaries
each with its own purpose. Without any run-time connection, we must rely
on build-time settings which are brittle and painful to keep in sync.

This feature is named 'standard passage' since the name is more unique
than many others that could be chosen, it is a passage in the sense that
information is flowing from one place to another and it is standard,
because that is what we want to create.

The implementation is simply a pointer to a bloblist in a register, with
an extra register to point to a devicetree, for more complex data, if one
is present in the bloblist. This should cover all cases (small memory
footprint as well as complex data flow) and be easy enough to implement on
all architectures.

The core bloblist code is relicensed to BSD-3-Clause in case it is useful
in non-GPL projects but there is no requirement to use the same code.

This series includes tweaks to the bloblist implementation in U-Boot to
make it more suitable for the task, including:

   - Allocate tags explicitly in the enum
   - Put the magic number first
   - Define a process for adding tags

The emphasis is on enabling open communcation between binaries, not
enabling passage of secret, undocumented data, although this is possible
in a private environment.

This series is built on the OF_BOARD series It is available at
u-boot-dm/pass-working or:

https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/073b5c156f222c69a98b8ebcaa563d1ff10eb217


Simon Glass (31):
  Makefile: Correct TPL rule for OF_REAL
  kconfig: Add support for conditional values
  dm: core: Allow getting some basic stats
  stddef: Avoid warning with clang with offsetof()
  fdt: Drop SPL_BUILD macro
  bloblist: Put the magic number first
  bloblist: Rename the SPL tag
  bloblist: Drop unused tags
  bloblist: Use explicit numbering for the tags
  bloblist: Support allocating the bloblist
  bloblist: Use LOG_CATEGORY to simply logging
  bloblist: Use 'phase' consistently for bloblists
  bloblist: Refactor Kconfig to support alloc or fixed
  arm: qemu: Add an SPL build
  bloblist: Add functions to obtain base address and size
  passage: Support an incoming passage
  passage: Support a control devicetree
  passage: arm: Accept a passage from the previous phase
  passage: spl: Support adding the dtb to the passage bloblist
  passage: spl: Support passing the passage to U-Boot
  passage: Record where the devicetree came from
  passage: Report the devicetree source
  passage: Add a qemu test for ARM
  bloblist: doc: Bring in the API documentation
  bloblist: Relicense to allow BSD-3-Clause
  sandbox: Add a way of checking structs for standard passage
  passage: Add documentation
  passage: Add docs for spl_handoff
  x86: Move Intel GNVS file into the common include directory
  passage: Add checks for pre-existing blobs
  WIP: RFC: Add a gitlab test

 .gitlab-ci.yml                                |   6 +
 MAINTAINERS                                   |  10 +
 Makefile                                      |   2 +-
 arch/arm/cpu/armv7/start.S                    |   7 +-
 arch/arm/dts/qemu-arm-u-boot.dtsi             |  22 ++
 arch/arm/lib/crt0.S                           |   4 +
 arch/arm/mach-qemu/Kconfig                    |   9 +
 arch/sandbox/cpu/spl.c                        |   2 +-
 arch/x86/cpu/apollolake/acpi.c                |   2 +-
 arch/x86/cpu/broadwell/cpu_from_spl.c         |   4 +-
 arch/x86/cpu/intel_common/acpi.c              |   2 +-
 .../include/asm/arch-apollolake/global_nvs.h  |   2 +-
 arch/x86/lib/spl.c                            |   2 +-
 arch/x86/lib/tpl.c                            |   2 +-
 board/emulation/qemu-arm/Kconfig              |  23 +-
 board/emulation/qemu-arm/MAINTAINERS          |   1 +
 board/emulation/qemu-arm/Makefile             |   1 +
 board/emulation/qemu-arm/spl.c                |  27 ++
 board/google/chromebook_coral/coral.c         |   2 +-
 board/sandbox/Makefile                        |   3 +-
 board/sandbox/stdpass_check.c                 | 107 ++++++
 cmd/bdinfo.c                                  |   2 +
 common/Kconfig                                | 161 ++++++++-
 common/bloblist.c                             | 124 +++++--
 common/board_f.c                              |  48 ++-
 common/board_r.c                              |  18 +
 common/spl/spl.c                              |  74 +++-
 configs/qemu_arm_spl_defconfig                |  78 +++++
 doc/board/emulation/qemu-arm.rst              |  38 +++
 doc/develop/bloblist.rst                      |  28 +-
 doc/develop/index.rst                         |   1 +
 doc/develop/std_passage.rst                   | 319 ++++++++++++++++++
 drivers/core/device.c                         |  11 +
 drivers/core/root.c                           |   7 +
 drivers/core/uclass.c                         |  13 +
 drivers/serial/serial-uclass.c                |   3 +-
 dts/Kconfig                                   |  12 +
 include/asm-generic/global_data.h             |  35 ++
 include/bloblist.h                            | 175 +++++++---
 include/dm/device.h                           |  11 +-
 include/dm/root.h                             |   8 +
 include/dm/uclass-internal.h                  |   7 +
 include/fdtdec.h                              |  40 ++-
 include/handoff.h                             |   8 +-
 .../x86/include/asm => include}/intel_gnvs.h  |   0
 include/linux/kconfig.h                       |  18 +
 include/linux/stddef.h                        |   8 +-
 include/spl.h                                 |  15 +
 include/stdpass/README                        |   4 +
 include/stdpass/tpm2_eventlog.h               |  42 +++
 include/stdpass/vboot_ctx.h                   | 267 +++++++++++++++
 lib/asm-offsets.c                             |   5 +
 lib/fdtdec.c                                  |  65 +++-
 scripts/config_whitelist.txt                  |   1 +
 test/bloblist.c                               |  21 +-
 test/dm/core.c                                |  41 +++
 test/py/tests/test_passage.py                 |  11 +
 57 files changed, 1798 insertions(+), 161 deletions(-)
 create mode 100644 arch/arm/dts/qemu-arm-u-boot.dtsi
 create mode 100644 board/emulation/qemu-arm/spl.c
 create mode 100644 board/sandbox/stdpass_check.c
 create mode 100644 configs/qemu_arm_spl_defconfig
 create mode 100644 doc/develop/std_passage.rst
 rename {arch/x86/include/asm => include}/intel_gnvs.h (100%)
 create mode 100644 include/stdpass/README
 create mode 100644 include/stdpass/tpm2_eventlog.h
 create mode 100644 include/stdpass/vboot_ctx.h
 create mode 100644 test/py/tests/test_passage.py

-- 
2.33.1.1089.g2158813163f-goog


