Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB44A614607
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 09:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opmz6-0006av-2B; Tue, 01 Nov 2022 04:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opmz3-0006Y2-OF
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 04:50:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opmyy-0007Uq-6m
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 04:50:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id bs21so19205406wrb.4
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NcrLVicXtD3QGDzN2URhiDytU8f5/FCn+S8+i1enpp4=;
 b=VwjU/mHqdcjVIg+t7Yc4Xp+bFdzxRWopfjjm8JZSHEvlF+ClKgGVaPUNbUi+gbJzFb
 jhH5C1BFiNChJgjh2rcewH7CqHR6DZsLnIRlB+wiofcBoya2CDn13ReRgsJ+LBHpVFiB
 1G1pdNXBs3Stq9xwmQUu+OxzPTORx2C64Z8Omil6LWU740nk6j7SsKNUpj6GPLQ3LNf3
 YfWYMZ+S7SHhT1yyohdB9j8n+M2UC2orYuGtk5G2kunJY3ocuDpVlzlglMReTS1nF4XJ
 goAzRZVvylx4wojJ6+VIVGUpNaoT6cuHMbko9SyJcU/HmZL+Lrbf3f0sIDUhFSzeLia9
 KkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NcrLVicXtD3QGDzN2URhiDytU8f5/FCn+S8+i1enpp4=;
 b=ssm2WWlEgpHVMfTAhT8GkSmUBlJMEmCqngvoGDv0LDgZxi26BJZtPMI2Qt56D2aCzc
 hfzwpJRZm23Juix5LYKAA2u5jHYFasS27V5lrtdvtgMvxUlBF4/Ql3PcdfNzFl+kTcCY
 VipWQnye7xPPn91t1o/ftTKflz1I2DLnkT9S0fyfZeh+4whDA/fP+lBPlTnPDK1hfrOt
 0HZwOXxLx9jxMsf0kQbI8ECLG9tYD2b/61MJ3san+vUugqhl7lWGgWUQO4XVbwjSPj6a
 IwdsySDJCzCjtX8fkr3qyqZSmRxn7ugjaDb/XBQlxQWJo1kNXlYhd1U8mofjRg9Z9aPn
 0Q5A==
X-Gm-Message-State: ACrzQf2CPmuNEhgaR5llMIRcaYC6bkpY1mZ+faHXqYoiGZU0mIfyWxFc
 S7P3fFrtneaArUXPDvZhyzWd3g==
X-Google-Smtp-Source: AMsMyM5p3cLBoT+QoJLNJfl3nlqnO20RfrDe1EnRCYq2c+/ryqXOAvzKo+3KtSQhK1aRacNVKo4BhA==
X-Received: by 2002:adf:eec6:0:b0:236:aabb:8c90 with SMTP id
 a6-20020adfeec6000000b00236aabb8c90mr3548878wrp.199.1667292643609; 
 Tue, 01 Nov 2022 01:50:43 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w24-20020a1cf618000000b003cf4d99fd2asm9763408wmc.6.2022.11.01.01.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 01:50:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27DD51FFB7;
 Tue,  1 Nov 2022 08:50:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 for 7.2 00/31] testing and plugin updates
Date: Tue,  1 Nov 2022 08:50:42 +0000
Message-Id: <20221101085042.1160204-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

warn: No match for commit 339bf0c071eff5e6ff1d9ddb3ad5cd02e4cd9ca3 found at https://github.com/stsquad/qemu.git
warn: Are you sure you pushed 'pull-target-arm-20221027-326-g339bf0c071' there?
The following changes since commit 5107fd3effb1cfec3b96d9e819f1605048640e31:

  net/vhost-vdpa.c: Fix clang compilation failure (2022-10-31 13:01:31 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git pull-target-arm-20221027-326-g339bf0c071

for you to fetch changes up to 339bf0c071eff5e6ff1d9ddb3ad5cd02e4cd9ca3:

  tests/vm: use -o IdentitiesOnly=yes for ssh (2022-10-31 20:37:59 +0000)

----------------------------------------------------------------
Alex Bennée (21):
      tests/lcitool: Rename non-Debian specific helper
      tests/docker: update fedora-win[32|64]-cross with lcitool
      tests/lcitool: Refresh to latest libvirt-ci module
      tests/docker: update test-mingw to run single build
      configure: don't enable cross compilers unless in target_list
      configure: fix the --enable-static --disable-pie case
      tests/avocado: extend the timeout for x86_64 tcg tests
      tests/tcg: use regular semihosting for nios2-softmmu
      MAINTAINERS: add entries for the key build bits
      MAINTAINERS: add features_to_c.sh to gdbstub files
      MAINTAINERS: fix-up for check-tcg Makefile changes
      tests/avocado: set -machine none for userfwd and vnc tests
      tests/avocado: disable sh4 rd2 tests on Gitlab
      tests/tcg: re-enable linux-test for sh4
      tests/tcg: re-enable threadcount for sh4
      target/s390x: don't use ld_code2 to probe next pc
      target/s390x: don't probe next pc for EXecuted insns
      target/s390x: fake instruction loading when handling 'ex'
      contrib/plugins: enable debug on CONFIG_DEBUG_TCG
      contrib/plugins: protect execlog's last_exec expansion
      tests/unit: cleanups for test-io-channel-command

Anton Johansson (2):
      tests/docker: Add flex/bison to `debian-all-test`
      tests/docker: Add flex/bison to `debian-hexagon-cross`

Bin Meng (4):
      semihosting/arm-compat-semi: Avoid using hardcoded /tmp
      tcg: Avoid using hardcoded /tmp
      block/vvfat: Unify the mkdir() call
      hw/usb: dev-mtp: Use g_mkdir()

Ilya Leoshkevich (1):
      tests/vm: use -o IdentitiesOnly=yes for ssh

Paolo Bonzini (1):
      tests/tcg: include CONFIG_PLUGIN in config-host.mak

Peter Maydell (1):
      tests/avocado: raspi2_initrd: Wait for guest shutdown message before stopping

Richard Henderson (1):
      tests/tcg/nios2: Tweak 10m50-ghrd.ld

 configure                                          |  17 ++-
 include/exec/translator.h                          |  17 +++
 block/vvfat.c                                      |   9 +-
 contrib/plugins/execlog.c                          |  38 ++++--
 hw/usb/dev-mtp.c                                   |   4 +-
 semihosting/arm-compat-semi.c                      |   3 +-
 target/s390x/tcg/translate.c                       |  14 ++-
 tcg/tcg.c                                          |   3 +-
 tests/unit/test-io-channel-command.c               |  45 ++++---
 MAINTAINERS                                        |  29 ++++-
 contrib/plugins/Makefile                           |   1 +
 tests/avocado/boot_linux.py                        |   1 +
 tests/avocado/boot_linux_console.py                |   7 +-
 tests/avocado/info_usernet.py                      |   3 +
 tests/avocado/vnc.py                               |   1 +
 .../dockerfiles/debian-all-test-cross.docker       |   2 +
 .../docker/dockerfiles/debian-hexagon-cross.docker |   2 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker | 139 +++++++++++++++------
 tests/docker/dockerfiles/fedora-win64-cross.docker | 138 ++++++++++++++------
 tests/docker/test-mingw                            |  16 +--
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/refresh                              |  48 ++++---
 tests/tcg/nios2/10m50-ghrd.ld                      |  14 ++-
 tests/tcg/nios2/Makefile.softmmu-target            |   3 +-
 tests/tcg/sh4/Makefile.target                      |  12 --
 tests/vm/basevm.py                                 |   3 +-
 26 files changed, 396 insertions(+), 175 deletions(-)


-- 
2.34.1


