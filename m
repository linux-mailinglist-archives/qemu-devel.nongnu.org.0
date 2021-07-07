Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB23BE8AC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:19:28 +0200 (CEST)
Received: from localhost ([::1]:60250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17SZ-0004XY-Ea
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R1-0002Kp-SX
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17Qz-0001eP-5g
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so11458255wmq.1
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJcxLW0IQWGQYkFHuq2WwNtRYGg/VOaji52euE5QMYg=;
 b=RGAjq7TttSoigCz+cm3HOmA9R9c1DSCrkOh6RccAzxnP3yA7lILqEp36yzG6raBPbG
 a7NV4/2ASzcnnMfhCVC7OQE+lIm+Nz8TUT1I8FleHutEtb/cj2yaGJyU9tdkKGw8aFqn
 PWpXBrhGQR5+IVaY6nbV6JRGwYA45PZjfCkTu0FlWCwaLJBaSKyIeevRvQi78UehPjkM
 8jci/EE9p0vL/MK7/2FcVZebH1DSrtsQfTv+wbC2rMHi0KFJcyZebmnjYxCQ61rREJJy
 CoOq4dNosI0/MRT2RCnQECw5ntFiOlQ6s0/XEeAshAKQXLEXyNjBOGxRK7OySbOF8Irc
 39nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJcxLW0IQWGQYkFHuq2WwNtRYGg/VOaji52euE5QMYg=;
 b=ejwGCTWxF2sLC7KPPBk7/8H4ctww5xGJaG2tUQtiSbG8khWOtXGFYwieGevnt//Fhq
 yWn1kynXdGSChtd1KGLm+lSeP9epeWHIILFux8z7FNQx2eomvTfPxg7AvdBjdAIE4LJS
 D3LAN6vYP/jVQVnDmeksrhxMkV7bih093jb1CUGlHDtEyUEurxASSRYvk/F+b5pVI2ya
 AsVAQ+G9Xo8ffYR6P1eT5xHEM6USICBodiUObwxtw+GI0aBI6ChLjQ+AXe8L6i7ApGbj
 r2cT3UYx08x4OlFyNsp62GtJLaNbHfr+1KXhzyK2iVihb7y3/prV6sjD9qDSKEe97eVt
 4ZTg==
X-Gm-Message-State: AOAM532iG5MdI6qcUhWeTcrL1tYl2MN4sLXvzir44CeYMYznHnW0EMcL
 8lyvSf8ZLOslDJS3Ily6gVf/4w==
X-Google-Smtp-Source: ABdhPJzH8xNIax9ecR4hib7v6EYC7F9/FKuETKvfof+lM9+DTInyatB+h5/iOXncR6YYnWurqs3Mhg==
X-Received: by 2002:a7b:c41a:: with SMTP id k26mr2716545wmi.117.1625663867175; 
 Wed, 07 Jul 2021 06:17:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm4998966wru.6.2021.07.07.06.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 06:17:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4AA381FF7E;
 Wed,  7 Jul 2021 14:17:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH for 6.1 v2 0/5] custom device configs
Date: Wed,  7 Jul 2021 14:17:39 +0100
Message-Id: <20210707131744.26027-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the second edition of the custom config patches. The first 3
patches are well reviewed but the last two could do with some
attention. I assume this should be merged through Paolo's tree?

The final two need review:

 - configure: allow the selection of alternate config in the build
 - configs: rename default-configs to configs and reorganise

Alex Bennée (4):
  hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
  hw/arm: move CONFIG_V7M out of default-devices
  configs: rename default-configs to configs and reorganise
  configure: allow the selection of alternate config in the build

Philippe Mathieu-Daudé (1):
  meson: Introduce target-specific Kconfig

 configure                                     | 30 ++++++++++++++++---
 .../devices/aarch64-softmmu/default.mak       |  2 +-
 configs/devices/aarch64-softmmu/minimal.mak   |  9 ++++++
 .../devices/alpha-softmmu/default.mak         |  0
 .../devices/arm-softmmu/default.mak           |  3 --
 .../devices/avr-softmmu/default.mak           |  0
 .../devices/cris-softmmu/default.mak          |  0
 .../devices/hppa-softmmu/default.mak          |  0
 .../devices/i386-softmmu/default.mak          |  0
 .../devices/m68k-softmmu/default.mak          |  0
 .../devices/microblaze-softmmu/default.mak    |  0
 .../devices/microblazeel-softmmu/default.mak  |  2 +-
 .../devices/mips-softmmu/common.mak           |  0
 .../devices/mips-softmmu/default.mak          |  2 +-
 .../devices/mips64-softmmu/default.mak        |  2 +-
 .../devices/mips64el-softmmu/default.mak      |  2 +-
 .../devices/mipsel-softmmu/default.mak        |  2 +-
 .../devices/nios2-softmmu/default.mak         |  0
 .../devices/or1k-softmmu/default.mak          |  0
 .../devices/ppc-softmmu/default.mak           |  0
 .../devices/ppc64-softmmu/default.mak         |  2 +-
 .../devices/riscv32-softmmu/default.mak       |  0
 .../devices/riscv64-softmmu/default.mak       |  0
 .../devices/rx-softmmu/default.mak            |  0
 .../devices/s390x-softmmu/default.mak         |  0
 .../devices/sh4-softmmu/default.mak           |  0
 .../devices/sh4eb-softmmu/default.mak         |  2 +-
 .../devices/sparc-softmmu/default.mak         |  0
 .../devices/sparc64-softmmu/default.mak       |  0
 .../devices/tricore-softmmu/default.mak       |  0
 .../devices/x86_64-softmmu/default.mak        |  2 +-
 .../devices/xtensa-softmmu/default.mak        |  0
 configs/devices/xtensaeb-softmmu/default.mak  |  3 ++
 .../targets/aarch64-linux-user.mak            |  0
 .../targets/aarch64-softmmu.mak               |  0
 .../targets/aarch64_be-linux-user.mak         |  0
 .../targets/alpha-linux-user.mak              |  0
 .../targets/alpha-softmmu.mak                 |  0
 .../targets/arm-linux-user.mak                |  0
 .../targets/arm-softmmu.mak                   |  0
 .../targets/armeb-linux-user.mak              |  0
 .../targets/avr-softmmu.mak                   |  0
 .../targets/cris-linux-user.mak               |  0
 .../targets/cris-softmmu.mak                  |  0
 .../targets/hexagon-linux-user.mak            |  0
 .../targets/hppa-linux-user.mak               |  0
 .../targets/hppa-softmmu.mak                  |  0
 .../targets/i386-bsd-user.mak                 |  0
 .../targets/i386-linux-user.mak               |  0
 .../targets/i386-softmmu.mak                  |  0
 .../targets/m68k-linux-user.mak               |  0
 .../targets/m68k-softmmu.mak                  |  0
 .../targets/microblaze-linux-user.mak         |  0
 .../targets/microblaze-softmmu.mak            |  0
 .../targets/microblazeel-linux-user.mak       |  0
 .../targets/microblazeel-softmmu.mak          |  0
 .../targets/mips-linux-user.mak               |  0
 .../targets/mips-softmmu.mak                  |  0
 .../targets/mips64-linux-user.mak             |  0
 .../targets/mips64-softmmu.mak                |  0
 .../targets/mips64el-linux-user.mak           |  0
 .../targets/mips64el-softmmu.mak              |  0
 .../targets/mipsel-linux-user.mak             |  0
 .../targets/mipsel-softmmu.mak                |  0
 .../targets/mipsn32-linux-user.mak            |  0
 .../targets/mipsn32el-linux-user.mak          |  0
 .../targets/nios2-linux-user.mak              |  0
 .../targets/nios2-softmmu.mak                 |  0
 .../targets/or1k-linux-user.mak               |  0
 .../targets/or1k-softmmu.mak                  |  0
 .../targets/ppc-linux-user.mak                |  0
 .../targets/ppc-softmmu.mak                   |  0
 .../targets/ppc64-linux-user.mak              |  0
 .../targets/ppc64-softmmu.mak                 |  0
 .../targets/ppc64abi32-linux-user.mak         |  0
 .../targets/ppc64le-linux-user.mak            |  0
 .../targets/riscv32-linux-user.mak            |  0
 .../targets/riscv32-softmmu.mak               |  0
 .../targets/riscv64-linux-user.mak            |  0
 .../targets/riscv64-softmmu.mak               |  0
 .../targets/rx-softmmu.mak                    |  0
 .../targets/s390x-linux-user.mak              |  0
 .../targets/s390x-softmmu.mak                 |  0
 .../targets/sh4-linux-user.mak                |  0
 .../targets/sh4-softmmu.mak                   |  0
 .../targets/sh4eb-linux-user.mak              |  0
 .../targets/sh4eb-softmmu.mak                 |  0
 .../targets/sparc-linux-user.mak              |  0
 .../targets/sparc-softmmu.mak                 |  0
 .../targets/sparc32plus-linux-user.mak        |  0
 .../targets/sparc64-linux-user.mak            |  0
 .../targets/sparc64-softmmu.mak               |  0
 .../targets/tricore-softmmu.mak               |  0
 .../targets/x86_64-bsd-user.mak               |  0
 .../targets/x86_64-linux-user.mak             |  0
 .../targets/x86_64-softmmu.mak                |  0
 .../targets/xtensa-linux-user.mak             |  0
 .../targets/xtensa-softmmu.mak                |  0
 .../targets/xtensaeb-linux-user.mak           |  0
 .../targets/xtensaeb-softmmu.mak              |  0
 default-configs/devices/xtensaeb-softmmu.mak  |  3 --
 meson.build                                   |  8 +++--
 Kconfig                                       |  1 +
 MAINTAINERS                                   | 22 +++++++-------
 hw/arm/Kconfig                                |  4 +++
 target/Kconfig                                | 19 ++++++++++++
 target/alpha/Kconfig                          |  2 ++
 target/arm/Kconfig                            |  6 ++++
 target/avr/Kconfig                            |  2 ++
 target/cris/Kconfig                           |  2 ++
 target/hppa/Kconfig                           |  2 ++
 target/i386/Kconfig                           |  5 ++++
 target/m68k/Kconfig                           |  2 ++
 target/microblaze/Kconfig                     |  2 ++
 target/mips/Kconfig                           |  6 ++++
 target/nios2/Kconfig                          |  2 ++
 target/openrisc/Kconfig                       |  2 ++
 target/ppc/Kconfig                            |  5 ++++
 target/riscv/Kconfig                          |  5 ++++
 target/rx/Kconfig                             |  2 ++
 target/s390x/Kconfig                          |  2 ++
 target/sh4/Kconfig                            |  2 ++
 target/sparc/Kconfig                          |  5 ++++
 target/tricore/Kconfig                        |  2 ++
 target/xtensa/Kconfig                         |  2 ++
 tests/Makefile.include                        |  2 +-
 126 files changed, 145 insertions(+), 35 deletions(-)
 rename default-configs/devices/aarch64-softmmu.mak => configs/devices/aarch64-softmmu/default.mak (82%)
 create mode 100644 configs/devices/aarch64-softmmu/minimal.mak
 rename default-configs/devices/alpha-softmmu.mak => configs/devices/alpha-softmmu/default.mak (100%)
 rename default-configs/devices/arm-softmmu.mak => configs/devices/arm-softmmu/default.mak (89%)
 rename default-configs/devices/avr-softmmu.mak => configs/devices/avr-softmmu/default.mak (100%)
 rename default-configs/devices/cris-softmmu.mak => configs/devices/cris-softmmu/default.mak (100%)
 rename default-configs/devices/hppa-softmmu.mak => configs/devices/hppa-softmmu/default.mak (100%)
 rename default-configs/devices/i386-softmmu.mak => configs/devices/i386-softmmu/default.mak (100%)
 rename default-configs/devices/m68k-softmmu.mak => configs/devices/m68k-softmmu/default.mak (100%)
 rename default-configs/devices/microblaze-softmmu.mak => configs/devices/microblaze-softmmu/default.mak (100%)
 rename default-configs/devices/microblazeel-softmmu.mak => configs/devices/microblazeel-softmmu/default.mak (54%)
 rename default-configs/devices/mips-softmmu-common.mak => configs/devices/mips-softmmu/common.mak (100%)
 rename default-configs/devices/mips-softmmu.mak => configs/devices/mips-softmmu/default.mak (56%)
 rename default-configs/devices/mips64-softmmu.mak => configs/devices/mips64-softmmu/default.mak (62%)
 rename default-configs/devices/mips64el-softmmu.mak => configs/devices/mips64el-softmmu/default.mak (88%)
 rename default-configs/devices/mipsel-softmmu.mak => configs/devices/mipsel-softmmu/default.mak (55%)
 rename default-configs/devices/nios2-softmmu.mak => configs/devices/nios2-softmmu/default.mak (100%)
 rename default-configs/devices/or1k-softmmu.mak => configs/devices/or1k-softmmu/default.mak (100%)
 rename default-configs/devices/ppc-softmmu.mak => configs/devices/ppc-softmmu/default.mak (100%)
 rename default-configs/devices/ppc64-softmmu.mak => configs/devices/ppc64-softmmu/default.mak (79%)
 rename default-configs/devices/riscv32-softmmu.mak => configs/devices/riscv32-softmmu/default.mak (100%)
 rename default-configs/devices/riscv64-softmmu.mak => configs/devices/riscv64-softmmu/default.mak (100%)
 rename default-configs/devices/rx-softmmu.mak => configs/devices/rx-softmmu/default.mak (100%)
 rename default-configs/devices/s390x-softmmu.mak => configs/devices/s390x-softmmu/default.mak (100%)
 rename default-configs/devices/sh4-softmmu.mak => configs/devices/sh4-softmmu/default.mak (100%)
 rename default-configs/devices/sh4eb-softmmu.mak => configs/devices/sh4eb-softmmu/default.mak (55%)
 rename default-configs/devices/sparc-softmmu.mak => configs/devices/sparc-softmmu/default.mak (100%)
 rename default-configs/devices/sparc64-softmmu.mak => configs/devices/sparc64-softmmu/default.mak (100%)
 rename default-configs/devices/tricore-softmmu.mak => configs/devices/tricore-softmmu/default.mak (100%)
 rename default-configs/devices/x86_64-softmmu.mak => configs/devices/x86_64-softmmu/default.mak (55%)
 rename default-configs/devices/xtensa-softmmu.mak => configs/devices/xtensa-softmmu/default.mak (100%)
 create mode 100644 configs/devices/xtensaeb-softmmu/default.mak
 rename {default-configs => configs}/targets/aarch64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/aarch64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/aarch64_be-linux-user.mak (100%)
 rename {default-configs => configs}/targets/alpha-linux-user.mak (100%)
 rename {default-configs => configs}/targets/alpha-softmmu.mak (100%)
 rename {default-configs => configs}/targets/arm-linux-user.mak (100%)
 rename {default-configs => configs}/targets/arm-softmmu.mak (100%)
 rename {default-configs => configs}/targets/armeb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/avr-softmmu.mak (100%)
 rename {default-configs => configs}/targets/cris-linux-user.mak (100%)
 rename {default-configs => configs}/targets/cris-softmmu.mak (100%)
 rename {default-configs => configs}/targets/hexagon-linux-user.mak (100%)
 rename {default-configs => configs}/targets/hppa-linux-user.mak (100%)
 rename {default-configs => configs}/targets/hppa-softmmu.mak (100%)
 rename {default-configs => configs}/targets/i386-bsd-user.mak (100%)
 rename {default-configs => configs}/targets/i386-linux-user.mak (100%)
 rename {default-configs => configs}/targets/i386-softmmu.mak (100%)
 rename {default-configs => configs}/targets/m68k-linux-user.mak (100%)
 rename {default-configs => configs}/targets/m68k-softmmu.mak (100%)
 rename {default-configs => configs}/targets/microblaze-linux-user.mak (100%)
 rename {default-configs => configs}/targets/microblaze-softmmu.mak (100%)
 rename {default-configs => configs}/targets/microblazeel-linux-user.mak (100%)
 rename {default-configs => configs}/targets/microblazeel-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips64el-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips64el-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mipsel-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mipsel-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mipsn32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mipsn32el-linux-user.mak (100%)
 rename {default-configs => configs}/targets/nios2-linux-user.mak (100%)
 rename {default-configs => configs}/targets/nios2-softmmu.mak (100%)
 rename {default-configs => configs}/targets/or1k-linux-user.mak (100%)
 rename {default-configs => configs}/targets/or1k-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc64abi32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc64le-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv32-softmmu.mak (100%)
 rename {default-configs => configs}/targets/riscv64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/rx-softmmu.mak (100%)
 rename {default-configs => configs}/targets/s390x-linux-user.mak (100%)
 rename {default-configs => configs}/targets/s390x-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sh4-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sh4-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sh4eb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sh4eb-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sparc-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sparc32plus-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/tricore-softmmu.mak (100%)
 rename {default-configs => configs}/targets/x86_64-bsd-user.mak (100%)
 rename {default-configs => configs}/targets/x86_64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/x86_64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/xtensa-linux-user.mak (100%)
 rename {default-configs => configs}/targets/xtensa-softmmu.mak (100%)
 rename {default-configs => configs}/targets/xtensaeb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/xtensaeb-softmmu.mak (100%)
 delete mode 100644 default-configs/devices/xtensaeb-softmmu.mak
 create mode 100644 target/Kconfig
 create mode 100644 target/alpha/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/avr/Kconfig
 create mode 100644 target/cris/Kconfig
 create mode 100644 target/hppa/Kconfig
 create mode 100644 target/i386/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/microblaze/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/openrisc/Kconfig
 create mode 100644 target/ppc/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/rx/Kconfig
 create mode 100644 target/s390x/Kconfig
 create mode 100644 target/sh4/Kconfig
 create mode 100644 target/sparc/Kconfig
 create mode 100644 target/tricore/Kconfig
 create mode 100644 target/xtensa/Kconfig

-- 
2.20.1


