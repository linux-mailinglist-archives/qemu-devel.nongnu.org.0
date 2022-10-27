Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD46101A2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:29:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mD-0002M8-5F; Thu, 27 Oct 2022 14:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kE-0001KF-5W
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7k9-0003Jy-3r
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:44 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r186-20020a1c44c3000000b003cf4d389c41so2030948wma.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/adwAFZ63f0egdoUeNtPmC7hcRqr2O28N5vBAO5qN1w=;
 b=QFd0DhZYTrLcdoSwlU2Uv30QUKXUpWCo2H5l6vWD2APYV+cgiXM5VdX4f2E9iuh486
 L54GxO2VKxcHbyA/3UaIWF2fWfgCHo2kHXL8EItR61eaXy5qmf7XqKu/ZFUl5O0/F+N+
 slPpdE1fKMn6Kvakn2f71+7I44fqH3loQ8AEIcrKdm0XdOjXjyuo+5DMvl6nZXM1P1bR
 PpD2xDpQ/VmzhkXye++h5ncw5yXc7lPsjPyzvN0noQTnf2UK1U/lymbJBFd5jDWPkqcO
 a5jzMe7gW3LAz9h36eulDTIbRFuLuvp0rIfmDux6SyoZwxdQQgzcm+rqU2VR9tr5tSXq
 QuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/adwAFZ63f0egdoUeNtPmC7hcRqr2O28N5vBAO5qN1w=;
 b=temeKxgDMKNb4+CO/o7ecs0HIgt2d3I5hBBYju4Z0DSSyC7SF6cKvL3dS1Z51RKK27
 3496HGBM7LLYmTlpS76YI9Xvo/ARSbbiSTHGu0U6HY9tXbLZFqkshcwoFu35Xi1+sySR
 KlD5tsyx5t9HirLef4dTM4md9cUsuhMkezn5aAblcmM4eXiZoFpFlg6EoqhPYNcWCumQ
 cgdGfwJM6IGJOmAnFt2vwn2L0bfaUPOCa3/SITG0LoiWh5Uzr2Yk4XxCuNKuQHjhSdvL
 MdP+DHBYehNBneS2fmgdBWHkcgiwIv8CHqDdD86l5D9p3NSArOMEKdMMLaJq0l1VskMI
 w4gw==
X-Gm-Message-State: ACrzQf2zoN+fvxPVESIfwaGO08ISyVTn7hpl2teSnOqUt3j4alZ+Afbm
 ti0FzQY1z5WJIwyT9prw4LJftw==
X-Google-Smtp-Source: AMsMyM78082smglCKkv/CYGufgEsQduiWc9sYp/oqmjrkibddY8J0BdOWMWBbuPtxcNhHCj43CMiVQ==
X-Received: by 2002:a05:600c:3548:b0:3c6:f7cb:1567 with SMTP id
 i8-20020a05600c354800b003c6f7cb1567mr6804820wmq.161.1666895798195; 
 Thu, 27 Oct 2022 11:36:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003c6c2ff7f25sm2449338wms.15.2022.10.27.11.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 198691FFB7;
 Thu, 27 Oct 2022 19:36:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 00/30] testing/next pre-PR
Date: Thu, 27 Oct 2022 19:36:06 +0100
Message-Id: <20221027183637.2772968-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

Pretty much everything is reviewed now except the late breaking fixes
mentioned bellow. Consider this a pre-PR series for the pull req I'm
going to send in on Haloween (hopefully no hidden gremlins though).

The following still need review:

  - tests/unit: cleanups for test-io-channel-command
  - contrib/plugins: protect execlog's last_exec expansion
  - tests/docker: update fedora-win[32|64]-cross with lcitool

Alex Bennée (19):
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

Bin Meng (5):
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  block/vvfat: Unify the mkdir() call
  hw/usb: dev-mtp: Use g_mkdir()

Ilya Leoshkevich (1):
  tests/vm: use -o IdentitiesOnly=yes for ssh

Paolo Bonzini (1):
  tests/tcg: include CONFIG_PLUGIN in config-host.mak

Peter Maydell (1):
  tests/avocado: raspi2_initrd: Wait for guest shutdown message before
    stopping

Richard Henderson (1):
  tests/tcg/nios2: Tweak 10m50-ghrd.ld

 configure                                     |  17 +-
 include/exec/translator.h                     |  17 ++
 block/vvfat.c                                 |   9 +-
 contrib/plugins/execlog.c                     |  38 ++-
 hw/usb/dev-mtp.c                              |   4 +-
 semihosting/arm-compat-semi.c                 |   3 +-
 target/s390x/tcg/translate.c                  |  14 +-
 tcg/tcg.c                                     |   3 +-
 tests/unit/test-io-channel-command.c          |  45 ++--
 util/qemu-sockets.c                           |   5 +-
 MAINTAINERS                                   |  29 ++-
 contrib/plugins/Makefile                      |   1 +
 tests/avocado/boot_linux.py                   |   1 +
 tests/avocado/boot_linux_console.py           |   7 +-
 tests/avocado/info_usernet.py                 |   3 +
 tests/avocado/vnc.py                          |   1 +
 tests/docker/dockerfiles/alpine.docker        |   2 +-
 tests/docker/dockerfiles/centos8.docker       |   2 +-
 .../dockerfiles/debian-all-test-cross.docker  |   2 +
 .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
 tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
 .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
 .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
 .../dockerfiles/debian-hexagon-cross.docker   |   2 +-
 .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
 .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
 .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
 .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++---
 .../dockerfiles/fedora-win64-cross.docker     | 138 +++++++---
 tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
 tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
 tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
 tests/docker/test-mingw                       |  16 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/refresh                         |  48 ++--
 tests/tcg/nios2/10m50-ghrd.ld                 |  14 +-
 tests/tcg/nios2/Makefile.softmmu-target       |   3 +-
 tests/tcg/sh4/Makefile.target                 |  12 -
 tests/vm/basevm.py                            |   3 +-
 41 files changed, 1670 insertions(+), 1450 deletions(-)

-- 
2.34.1


