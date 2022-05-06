Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD451DFD4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 21:53:37 +0200 (CEST)
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn41A-0007zu-41
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 15:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nn40A-00078h-I0
 for qemu-devel@nongnu.org; Fri, 06 May 2022 15:52:34 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nn408-0005h0-SX
 for qemu-devel@nongnu.org; Fri, 06 May 2022 15:52:34 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so7589342pji.3
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kw6dv+V+o7s89jtN8u1lck1ESGaoall06sV0IX9gCMA=;
 b=QzVR7B3V83b6GeqCAX5i/DWfOJf3sXZX4ESS8rKR7sz4QUNaF7tZkWvFCpXyuJKirn
 MfbolVGGXgPUqVfjCcmry7eJkGnd7T6A2XwqGgAiui5TuLxIsjiqaR/Mk+lJGIltiTSa
 DaziBabtNDYnPn4PA8XYkTqLOSYonfYu8JXsECwXH/0/F1lvZkLYSK7KbsES6KgOyZ0X
 z7+lgb1DzLMxrynoAzqaXj3YYq8jWzOsZXbC3Y5B4BrpLPWk+/NBz+Ez3yyaqEnL4VGI
 4IgRZiRpfbqg9+mZG4+G5jUdgIz2AJ89kL9mo8dAG0rq1C18OEjiCdJwAtZ/JvwNrf+w
 8K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kw6dv+V+o7s89jtN8u1lck1ESGaoall06sV0IX9gCMA=;
 b=SACivBJdBCqFzw2S7EylxmuJGNIeDMGMV6R/7dJmse0ZSYbvrrMhYYG3sriqrz63Ic
 lFR3bxWTDs0yMS3UvQuN5NIS05+FCTDDoVKGukM6bnDKprwLrab+iRT6zTBmdgDjom56
 7+HeGdThUrFezNd/fj7fQIN8aULbElCULTHLD1MKGtjyVs0eh7Ji/UOh5CKw7gJbhIMs
 O+uEmOXiYPnNru+5dvJKPzMZJ5/LAP9vRsmok00D0yeO1Cm/CDJdYyaAXgHKrLjc92Y7
 6EGJ+lpbJikxhkZzEKF+CA0tY99g4oX2XHV1tc9EuJr4s/YFEYGIwe2P4V9FsYoUQnsv
 oqNA==
X-Gm-Message-State: AOAM532Oe9Z0WzNIMuSCaTZ2txOCr2TRADH8hDFIyFiaTdszx65vhlLd
 9C+djzE+AEuk2Cy++naCHY2v5NtC6gU=
X-Google-Smtp-Source: ABdhPJyL0A43uReEqezi+OkDHERTotzZcoEJdEdOFUvgooe15XWtkkdEOCCLyucBPpqqfArTllFWrQ==
X-Received: by 2002:a17:90b:1895:b0:1dc:76e9:e9a0 with SMTP id
 mn21-20020a17090b189500b001dc76e9e9a0mr6018041pjb.68.1651866750764; 
 Fri, 06 May 2022 12:52:30 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:5ef0:be36:e4fa:f949])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a170902740600b0015e8d4eb219sm2157740pll.99.2022.05.06.12.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 12:52:30 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 00/18] target/xtensa updates for v7.1
Date: Fri,  6 May 2022 12:52:13 -0700
Message-Id: <20220506195213.3835272-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

please pull the following updates for the target/xtensa.

The following changes since commit 823a3f11fb8f04c3c3cc0f95f968fef1bfc6534f:

  Update version for v7.0.0 release (2022-04-19 18:44:36 +0100)

are available in the Git repository at:

  https://github.com/OSLL/qemu-xtensa.git tags/20220506-xtensa

for you to fetch changes up to 5e1d80a3fc16d5dbe7d677af6ba4df94d68c75d2:

  tests/tcg/xtensa: fix vectors and checks in timer test (2022-04-27 10:15:23 -0700)

----------------------------------------------------------------
target/xtensa updates for v7.1:

- expand test coverage to big-endian, MMUv3, cores without windowed
  registers or loop option;
- import lx106 core (used in the esp8266 IoT chips);
- use tcg_constant_* in the front end;
- add clock input to the xtensa CPU;
- fix reset state of the xtensa MX PIC.

----------------------------------------------------------------
Max Filippov (17):
      tests/tcg/xtensa: allow testing big-endian cores
      target/xtensa: fix missing tcg_temp_free in gen_window_check
      target/xtensa: use tcg_contatnt_* for numeric literals
      target/xtensa: use tcg_constant_* for exceptions
      target/xtensa: use tcg_constant_* for TLB opcodes
      target/xtensa: use tcg_constant_* for numbered special registers
      target/xtensa: use tcg_constant_* for FPU conversion opcodes
      target/xtensa: use tcg_constant_* for remaining opcodes
      target/xtensa: add clock input to xtensa CPU
      hw/xtensa: fix reset value of MIROUT register of MX PIC
      tests/tcg/xtensa: fix build for cores without windowed registers
      tests/tcg/xtensa: restore vecbase SR after test
      tests/tcg/xtensa: fix watchpoint test
      tests/tcg/xtensa: remove dependency on the loop option
      tests/tcg/xtensa: enable autorefill phys_mem tests for MMUv3
      tests/tcg/xtensa: enable mmu tests for MMUv3
      tests/tcg/xtensa: fix vectors and checks in timer test

Simon Safar (1):
      target/xtensa: import core lx106

 MAINTAINERS                                   |    1 +
 hw/xtensa/mx_pic.c                            |    2 +-
 target/xtensa/core-lx106.c                    |   52 +
 target/xtensa/core-lx106/core-isa.h           |  470 ++
 target/xtensa/core-lx106/gdb-config.c.inc     |   83 +
 target/xtensa/core-lx106/xtensa-modules.c.inc | 7668 +++++++++++++++++++++++++
 target/xtensa/cores.list                      |    1 +
 target/xtensa/cpu.c                           |   15 +
 target/xtensa/cpu.h                           |    5 +
 target/xtensa/op_helper.c                     |    7 +-
 target/xtensa/translate.c                     |  173 +-
 tests/tcg/xtensa/Makefile.softmmu-target      |    4 +-
 tests/tcg/xtensa/crt.S                        |    2 +
 tests/tcg/xtensa/test_break.S                 |   86 +-
 tests/tcg/xtensa/test_mmu.S                   |  182 +-
 tests/tcg/xtensa/test_phys_mem.S              |   10 +-
 tests/tcg/xtensa/test_sr.S                    |    2 +
 tests/tcg/xtensa/test_timer.S                 |   68 +-
 tests/tcg/xtensaeb/Makefile.softmmu-target    |    5 +
 19 files changed, 8575 insertions(+), 261 deletions(-)
 create mode 100644 target/xtensa/core-lx106.c
 create mode 100644 target/xtensa/core-lx106/core-isa.h
 create mode 100644 target/xtensa/core-lx106/gdb-config.c.inc
 create mode 100644 target/xtensa/core-lx106/xtensa-modules.c.inc
 create mode 100644 tests/tcg/xtensaeb/Makefile.softmmu-target

-- 
Thanks.
-- Max

