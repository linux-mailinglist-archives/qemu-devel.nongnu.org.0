Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1964151E1A6
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 00:45:07 +0200 (CEST)
Received: from localhost ([::1]:33952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn6h7-0006Lz-Oa
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 18:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nn6fu-0005B3-WE
 for qemu-devel@nongnu.org; Fri, 06 May 2022 18:43:51 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nn6fs-00050s-Sf
 for qemu-devel@nongnu.org; Fri, 06 May 2022 18:43:50 -0400
Received: by mail-pf1-x433.google.com with SMTP id 204so4590753pfx.3
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 15:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=34kUrbV+fMKR5tRSaJpFEXUZtoE6lcj6qSX+WXl/vUM=;
 b=fvU6WgCxzsHrzmpf/dtmvDOlGYFdGtCVYJgca9n09sLAroVJ3Mm6d+GXs+KJ3EUN4l
 dXecoB5NBjV7BjKbfe38UMX2ttaGySXG6tswQ8idO5z5w3Z7v5IpRTaqzvemyZGyXFyV
 8oy9pxL3PRUqn+KqLUiGtGlGKf30jgvjT3qHjITj6dIdCYWSM4bMyQyM5exP81xh0TgM
 o0Z6rGKmd+cIm3gnY5bVYqpilTZ3z18Ywwt72H1mD+T53EskPTPJdzFcxLwxmyWZItoE
 Us85CUHkY2Q88CaoVLVKSKWR2byVcbsiiIe/p7AMmtzgzdfo3I7cl5xvyi4A80b4ycUi
 6xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=34kUrbV+fMKR5tRSaJpFEXUZtoE6lcj6qSX+WXl/vUM=;
 b=T3JqEVhz+Ssez+FjC0xPGIonYh4Pwu5wNpaAqBiHiRgvgzAdfsOYFWOKOPV9HHbDlL
 fwatYbZ0h0Vmq+H+1CojTFeBIuUBGVzJOWXQ2wPwI87x+J/S8UMeOVil2zEDgIAKdavh
 bzNRwGblPmyUgjDfcE03yBXeC+QzLWvayCmc2NZ72mmTxya4ALBV+j4jg0khlo6Dv/td
 Vs+/IEiteidu4QR8IH/+H07x7FtQHCzBcRfWe5sBB+fVUEVxhWckMyhZQyBha54CXwq9
 vH1MnKmbMa8GPGLWjyvNTpcgtOJhQ0tEBbQWq2+FUarHBaYYjtb+LwVmHfQcSUqgg3vw
 3Bxg==
X-Gm-Message-State: AOAM532j94Qb44ETnB8dttjImmZrAIQFRxrdIdC7MeyYkYjEUiYCJkCj
 ZZDbw3vxLPNfyUa8wPAM1tZdrxnrLhw=
X-Google-Smtp-Source: ABdhPJxYZvUJhVApqBTQKjR1dqK2Hbeez1RiQKhmVx13/55DEDmjWh1oioAWSbnaLUBsxSBXawj7Aw==
X-Received: by 2002:a63:8343:0:b0:3c6:7789:2243 with SMTP id
 h64-20020a638343000000b003c677892243mr358260pge.361.1651877027174; 
 Fri, 06 May 2022 15:43:47 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:5ef0:be36:e4fa:f949])
 by smtp.gmail.com with ESMTPSA id
 gi2-20020a17090b110200b001d952b8f728sm8054363pjb.2.2022.05.06.15.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:43:46 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL v2 00/18] target/xtensa updates for v7.1
Date: Fri,  6 May 2022 15:43:31 -0700
Message-Id: <20220506224331.3886707-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x433.google.com
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

Changes since v1:
- rebase series to the current master
- drop big-endian tests enabling patch (cannot test it because of the
  test infrastructure change)
- add cache testing opcodes patch

The following changes since commit 31abf61c4929a91275fe32f1fafe6e6b3e840b2a:

  Merge tag 'pull-ppc-20220505' of https://gitlab.com/danielhb/qemu into staging (2022-05-05 13:52:22 -0500)

are available in the Git repository at:

  https://github.com/OSLL/qemu-xtensa.git tags/20220506-xtensa-1

for you to fetch changes up to 59491e97f89eaeee275f57fb6bb40f0152429fb3:

  target/xtensa: implement cache test option opcodes (2022-05-06 15:37:10 -0700)

----------------------------------------------------------------
target/xtensa updates for v7.1:

- expand test coverage to MMUv3, cores without windowed registers or
  loop option;
- import lx106 core (used in the esp8266 IoT chips);
- use tcg_constant_* in the front end;
- add clock input to the xtensa CPU;
- fix reset state of the xtensa MX PIC;
- implement cache testing opcodes.

----------------------------------------------------------------
Max Filippov (17):
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
      target/xtensa: implement cache test option opcodes

Simon Safar (1):
      target/xtensa: import core lx106

 hw/xtensa/mx_pic.c                            |    2 +-
 target/xtensa/core-lx106.c                    |   51 +
 target/xtensa/core-lx106/core-isa.h           |  470 ++
 target/xtensa/core-lx106/gdb-config.c.inc     |   83 +
 target/xtensa/core-lx106/xtensa-modules.c.inc | 7668 +++++++++++++++++++++++++
 target/xtensa/cores.list                      |    1 +
 target/xtensa/cpu.c                           |   15 +
 target/xtensa/cpu.h                           |    5 +
 target/xtensa/op_helper.c                     |    7 +-
 target/xtensa/translate.c                     |  211 +-
 tests/tcg/xtensa/crt.S                        |    2 +
 tests/tcg/xtensa/test_break.S                 |   86 +-
 tests/tcg/xtensa/test_mmu.S                   |  182 +-
 tests/tcg/xtensa/test_phys_mem.S              |   10 +-
 tests/tcg/xtensa/test_sr.S                    |    2 +
 tests/tcg/xtensa/test_timer.S                 |   68 +-
 16 files changed, 8604 insertions(+), 259 deletions(-)
 create mode 100644 target/xtensa/core-lx106.c
 create mode 100644 target/xtensa/core-lx106/core-isa.h
 create mode 100644 target/xtensa/core-lx106/gdb-config.c.inc
 create mode 100644 target/xtensa/core-lx106/xtensa-modules.c.inc

-- 
Thanks.
-- Max

