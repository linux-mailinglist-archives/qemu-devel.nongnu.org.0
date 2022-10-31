Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A582D6137A2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZH-00020G-Ri; Mon, 31 Oct 2022 09:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYj-0007wq-Gs
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYR-0001CY-PM
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:32 -0400
Received: by mail-wr1-x431.google.com with SMTP id j15so15913525wrq.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XU7O+UNtQHK0PQrxtqZKMMbhGdxiprFywvtXBpjX8JY=;
 b=vY3IJKyrZURe+n8p/kawjU8a2F0GRZo9qU5rgX6mVoo+nYRMYOP9pVmH/q0tdIoj4a
 OsQVezuy/pxTYCqD3pf8OvVSRWODAnGZXaXqrktfSr2sl/BCJQqG4iS/n9PdKsUSaiQd
 PKyLJzGM3vTPyi4pr6WINQFtj84bxfIiHQAVkA1cAjdcOUkNEDRozoJIYGWAmBYqn/TG
 DYdCPLa1A2OekptKNwjl1kgDgVp4V1mVPMgzxTcf6+EMcIkWK13y7vjawQh/DeuKRddR
 L/oU/75nuAL0i65x/nICcttipz5CQWo908w4oWvDBgGcwustYY/kfveqMHO+RHDIDOsF
 JRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XU7O+UNtQHK0PQrxtqZKMMbhGdxiprFywvtXBpjX8JY=;
 b=Yazh9fF19fecHsFXUsuNHfOiJNRYXpdTVPwpmrXr6U2CIelTS1d4ijuojPBKOFp9o6
 xzPQF2tW8+1lBkFsCvIadDXerumoByhittRmdDW8+xWRurXfH9y9fLC5xbvg+0Sno5yf
 u/rdE7wbi9ObBLAXCk3o/44q+89hK/RhJjJHjtI6Qk29mBpNfwFqlSfAU1VcGEcgJQAa
 n3ebv0CDg3SULPorulJIWGU1saS7KvTmUA82b/eWu4t5pctvEjLbX4CTnVAsLA++RMc1
 0pG+2WIurRGeW9PQ9Y9qwIap8rvUeGlrDatdzIovCAMAWkIdiP4IDnBvekawxQU80CIQ
 lXPQ==
X-Gm-Message-State: ACrzQf1skd5fOaSVnN1N8eVgMogivM7VWuW1NIgaeqcDjgh+RLkLv/BJ
 kCdxGYlmXaEFv1qFhXzEOROb4w==
X-Google-Smtp-Source: AMsMyM53PNnwGcq1guF2U6zqWm3zFkTfUEEHUulAj/I1lpvY0fkJP2z6lfiq++yp55zRjDpfFApiMA==
X-Received: by 2002:adf:e94b:0:b0:236:64a5:4038 with SMTP id
 m11-20020adfe94b000000b0023664a54038mr8474876wrn.321.1667221811844; 
 Mon, 31 Oct 2022 06:10:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ci8-20020a5d5d88000000b0023662245d3csm7125943wrb.95.2022.10.31.06.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8A5F1FFB7;
 Mon, 31 Oct 2022 13:10:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL for 7.2 00/31] testing and plugins updates
Date: Mon, 31 Oct 2022 13:09:39 +0000
Message-Id: <20221031131010.682984-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The following changes since commit 7208429223963c405c62fa2611398f1aa8033593:

  Merge tag 'mem-2022-10-28' of https://github.com/davidhildenbrand/qemu into staging (2022-10-30 18:31:59 -0400)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-testing-for-7.2-311022-2

for you to fetch changes up to d3a489107970a4e73e373d0d426731c2134f01a6:

  tests/vm: use -o IdentitiesOnly=yes for ssh (2022-10-31 13:00:18 +0000)

----------------------------------------------------------------
testing and plugin updates for 7.2:

  - cleanup win32/64 docker files
  - update test-mingw test
  - add flex/bison to debian-all-test
  - handle --enable-static/--disable-pie in config
  - extend timeouts on x86_64 avocado tests
  - add flex/bison to debian-hexagon-cross
  - use regular semihosting for nios2 check-tcg
  - fix obscure linker error to nios2 softmmu tests
  - various windows portability fixes for tests
  - clean-up of MAINTAINERS
  - use -machine none when appropriate in avocado
  - make raspi2_initrd test detect shutdown
  - disable sh4 rd2 tests on gitlab
  - re-enable threadcount/linux-test for sh4
  - clean-up s390x handling of "ex" instruction
  - better handle new CPUs in execlog plugin
  - pass CONFIG_DEBUG_TCG to plugin builds
  - try and avoid races in test-io-channel-command
  - speed up ssh key checking for tests/vm

----------------------------------------------------------------
Alex Bennée (21):
      tests/lcitool: Rename non-Debian specific helper
      tests/lcitool: Refresh to latest libvirt-ci module
      tests/docker: update fedora-win[32|64]-cross with lcitool
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

 configure                                          |  17 +-
 include/exec/translator.h                          |  17 ++
 block/vvfat.c                                      |   9 +-
 contrib/plugins/execlog.c                          |  38 +++-
 hw/usb/dev-mtp.c                                   |   4 +-
 semihosting/arm-compat-semi.c                      |   3 +-
 target/s390x/tcg/translate.c                       |  14 +-
 tcg/tcg.c                                          |   3 +-
 tests/unit/test-io-channel-command.c               |  45 ++--
 MAINTAINERS                                        |  29 ++-
 contrib/plugins/Makefile                           |   1 +
 tests/avocado/boot_linux.py                        |   1 +
 tests/avocado/boot_linux_console.py                |   7 +-
 tests/avocado/info_usernet.py                      |   3 +
 tests/avocado/vnc.py                               |   1 +
 tests/docker/dockerfiles/alpine.docker             |   2 +-
 tests/docker/dockerfiles/centos8.docker            |   2 +-
 .../dockerfiles/debian-all-test-cross.docker       |   2 +
 tests/docker/dockerfiles/debian-amd64-cross.docker | 234 ++++++++++----------
 tests/docker/dockerfiles/debian-amd64.docker       | 236 ++++++++++-----------
 tests/docker/dockerfiles/debian-arm64-cross.docker | 232 ++++++++++----------
 tests/docker/dockerfiles/debian-armel-cross.docker | 230 ++++++++++----------
 tests/docker/dockerfiles/debian-armhf-cross.docker | 232 ++++++++++----------
 .../docker/dockerfiles/debian-hexagon-cross.docker |   2 +-
 .../dockerfiles/debian-mips64el-cross.docker       | 226 ++++++++++----------
 .../docker/dockerfiles/debian-mipsel-cross.docker  | 226 ++++++++++----------
 .../docker/dockerfiles/debian-ppc64el-cross.docker | 230 ++++++++++----------
 tests/docker/dockerfiles/debian-s390x-cross.docker | 228 ++++++++++----------
 tests/docker/dockerfiles/fedora-win32-cross.docker | 139 ++++++++----
 tests/docker/dockerfiles/fedora-win64-cross.docker | 138 ++++++++----
 tests/docker/dockerfiles/fedora.docker             | 230 ++++++++++----------
 tests/docker/dockerfiles/opensuse-leap.docker      |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker         | 234 ++++++++++----------
 tests/docker/test-mingw                            |  16 +-
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/refresh                              |  48 +++--
 tests/tcg/nios2/10m50-ghrd.ld                      |  14 +-
 tests/tcg/nios2/Makefile.softmmu-target            |   3 +-
 tests/tcg/sh4/Makefile.target                      |  12 --
 tests/vm/basevm.py                                 |   3 +-
 40 files changed, 1668 insertions(+), 1447 deletions(-)

-- 
2.34.1


