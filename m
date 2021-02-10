Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ADE317323
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:18:04 +0100 (CET)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xoB-0002oF-JR
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhV-000610-Qw
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhI-0003B9-Rt
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y134so3306669wmd.3
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qzk+/85a77Rh+6wP7aVwaVCiF7hH5djFND2hxFRj0PU=;
 b=IXg0XUaWt2ZW23vsrkVfUsG21hsVeBMECo8tfko4LtjEPp05gHeW4d2JmFLmiPPwGF
 vMyZLWADBAhahKdxQotyEYuhs9g2oijHYPEkIpbGiJr44qBsuUnxLIT6XJSPjEanv3V/
 8GRj6RTmgG35PMB+4nJRSEaqvn8WZT9bbDGFQ43dUGT19cfqtbuNeKF07II+plpZZABF
 yhNE5djxZka4JYv1rx9hUzcAzbw4hxAlGYRyQ4CoLg+FATB37KJ73B4ZWkjomvxvlLwM
 x1kNpl2mrmSTX5zCSLf489ZiyDamv8K6+fcLn1BY3q5KtIRqg+fr442sAAZHzb1hBBmY
 LYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qzk+/85a77Rh+6wP7aVwaVCiF7hH5djFND2hxFRj0PU=;
 b=K9AU7LVquxpeAe6XOj/RVAFX29WdD9OHLyUNChKhgtE5f62DTcDXgWcB/CbbCC/s+X
 /3+u3udiWf9RxfYFEHcTG/sehqYMCOJaNYpolp5Wvj7d+85dB/iVFeSt/div9Y6qUGnK
 Qx6iBwh91Rd9JWTPIIJowyNWeta8Mmp5iLRVvSMn3XwGsysp9bKKs0i/yHxjmB9s/RE2
 /DDcXuaRK9kJGR95DC/pTHYl7nVB2SPOSCQtS++j0Le5jc+Qe0fOiyU5tnxFcTosBYSp
 OyeDUP0bror0+a1wu/wAH8tGL8p+PriH02TTMNXa8iP8B6TJlT9yp1GYwukJt9xWsV57
 u1nw==
X-Gm-Message-State: AOAM533z/NFs5MM4fev8TazM277WheccrkuI/EMLr5P2SojwM2aUrCli
 6Hfxtswq7JkL0KKLXek5qr7BEA==
X-Google-Smtp-Source: ABdhPJwAXT9NlLjUBfUR4N366u5D7CotMxSGSAsw010G82WKIqOhKBeibFvYzREfpPdF1g++JurU9Q==
X-Received: by 2002:a1c:c2c4:: with SMTP id s187mr1199757wmf.97.1612995055074; 
 Wed, 10 Feb 2021 14:10:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s23sm4431461wmc.35.2021.02.10.14.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D2931FF7E;
 Wed, 10 Feb 2021 22:10:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 00/21] plugins/next pre-PR (hwprofile, regression fixes,
 icount count fix)
Date: Wed, 10 Feb 2021 22:10:32 +0000
Message-Id: <20210210221053.18050-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

OK time to start preparing a plugins PR with all the accumulated fixes
over the last few months. Broadly they are:

  - a new API for HW access profiling
  - a bunch of style clean-ups
  - a fix for a regression caused by recent TCG updates
  - Richard's io_recompile clean-ups
  - a fix for an icount/io_recompile miscount

The following patches could still do with some review:
  
 - tests/acceptance: add a new tests to detect counting errors
 - accel/tcg: re-factor non-RAM execution code
 - accel/tcg: cache single instruction TB on pending replay exception
 - accel/tcg: actually cache our partial icount TB
 - tests/acceptance: add a new set of tests to exercise plugins
 - tests/plugin: expand insn test to detect duplicate instructions

Alex Bennée (12):
  hw/virtio/pci: include vdev name in registered PCI sections
  plugins: add API to return a name for a IO device
  plugins: new hwprofile plugin
  accel/tcg/plugin-gen: fix the call signature for inline callbacks
  tests/plugin: expand insn test to detect duplicate instructions
  tests/acceptance: add a new set of tests to exercise plugins
  accel/tcg: actually cache our partial icount TB
  accel/tcg: cache single instruction TB on pending replay exception
  accel/tcg: re-factor non-RAM execution code
  accel/tcg: remove CF_NOCACHE and special cases
  accel/tcg: allow plugin instrumentation to be disable via cflags
  tests/acceptance: add a new tests to detect counting errors

Richard Henderson (4):
  exec: Move TranslationBlock typedef to qemu/typedefs.h
  accel/tcg: Create io_recompile_replay_branch hook
  target/mips: Create mips_io_recompile_replay_branch
  target/sh4: Create superh_io_recompile_replay_branch

zhouyang (5):
  contrib: Don't use '#' flag of printf format
  contrib: Fix some code style problems, ERROR: "foo * bar" should be
    "foo *bar"
  contrib: Add spaces around operator
  contrib: space required after that ','
  contrib: Open brace '{' following struct go on the same line

 docs/devel/tcg-plugins.rst               |  34 +++
 include/exec/exec-all.h                  |   9 +-
 include/exec/tb-context.h                |   1 -
 include/hw/core/cpu.h                    |   4 +-
 include/hw/core/tcg-cpu-ops.h            |  13 +-
 include/qemu/qemu-plugin.h               |   6 +
 include/qemu/typedefs.h                  |   1 +
 target/arm/internals.h                   |   3 +-
 accel/tcg/cpu-exec.c                     |  61 +----
 accel/tcg/plugin-gen.c                   |  32 +--
 accel/tcg/translate-all.c                | 129 ++++------
 accel/tcg/translator.c                   |   2 +-
 contrib/ivshmem-server/main.c            |   2 +-
 contrib/plugins/hotblocks.c              |   2 +-
 contrib/plugins/hotpages.c               |   2 +-
 contrib/plugins/howvec.c                 |  19 +-
 contrib/plugins/hwprofile.c              | 305 +++++++++++++++++++++++
 contrib/plugins/lockstep.c               |   6 +-
 hw/virtio/virtio-pci.c                   |  22 +-
 plugins/api.c                            |  20 ++
 target/cris/translate.c                  |   2 +-
 target/lm32/translate.c                  |   2 +-
 target/mips/cpu.c                        |  18 ++
 target/moxie/translate.c                 |   2 +-
 target/sh4/cpu.c                         |  18 ++
 target/unicore32/translate.c             |   2 +-
 tests/plugin/insn.c                      |  12 +-
 contrib/plugins/Makefile                 |   1 +
 tests/acceptance/tcg_plugins.py          | 134 ++++++++++
 tests/tcg/i386/Makefile.softmmu-target   |  10 +
 tests/tcg/i386/Makefile.target           |   7 +
 tests/tcg/x86_64/Makefile.softmmu-target |  10 +
 32 files changed, 697 insertions(+), 194 deletions(-)
 create mode 100644 contrib/plugins/hwprofile.c
 create mode 100644 tests/acceptance/tcg_plugins.py

-- 
2.20.1


