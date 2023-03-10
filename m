Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77076B5132
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1painU-0001FU-51; Fri, 10 Mar 2023 14:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painR-0001Ed-Jt
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:57 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painQ-0004eM-4N
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:57 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so6164406pja.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n2ldLpi0//dw1v+GWWc+CD5NADqZ1XFTEPmDyXqgJG0=;
 b=yKmi0Qynh2F/IADM4ggKI/HdBbYpDM6jkOnVhve5L/R9EwPs3kWKvUoJ9rUTzljxqZ
 O/R1c6H2cKxyaUtH3rC5dJ8POdM4E5N2daiBdUdhLpnsI2hXxua+jTz7hjEeHDfqGnUC
 LGKzPOqBYKx/6oQAKS9b7LqxY++5XsxRd84+m9Os8Dj88i/2UaWoYzv/hEiuPcF5942Y
 M21Z18XphRxN8thybPkJYmAw6+MAEv8nhE1//W1qozP8vp2Gb4G5ggKdgVUtky/bVCsL
 GXBlJp5TW4BNo3TUWwgbdkqz39DKzJmUlxSJEM1i7pjxVtr4EXFGxGE0TpOM9TVqu/gS
 VeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2ldLpi0//dw1v+GWWc+CD5NADqZ1XFTEPmDyXqgJG0=;
 b=yU0UFq9y6CFCRHt/GERaU6x5r4tzSCNsm9fAbnj48RXpyoENlNYj4HRtJjF+E42WuY
 gLU2HHKF6yuWrA3dYTl++pYMUmicJEEisvbYPbemEeikHKWBWk8dDfyzccuW4p/aNiRH
 bBxyF9g+oZGQGTx87Pl+ewHaR304pViJl4Ark5GdVpiPm7mWuzm9Vuy9WrcTWfuj/0vp
 9ZdY6s3xAopaYF5c//f3Zshw7awexjHsZ1m/L4N3pTcug8n8v/+E2YGhWwegWSfg+1OO
 6pTuNn/Y4GErZpgjPnZMyyUoqHWOfXqpxpZFtNz7PlDfxTxWjU4duykOIFO7xcGWScTr
 k0/g==
X-Gm-Message-State: AO0yUKVKXPAplyG2gC7YbMNZS/4UJWI19vzuvh/KYuHH+8zIhnP10txA
 LfPmkjBkNRlbmBHxFfeJTX+f10vBISjKtLMI9pI=
X-Google-Smtp-Source: AK7set/+tIzm2ZGgTF+c8SeIkBGffhd6piGMzCXkyAqczvAuH599YU/heQZ2LBDVe/4uqVC/WI0vMw==
X-Received: by 2002:a17:902:db05:b0:19c:da7f:a238 with SMTP id
 m5-20020a170902db0500b0019cda7fa238mr33014847plx.31.1678477973373; 
 Fri, 10 Mar 2023 11:52:53 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 0/7] plugin: fix clearing of plugin_mem_cbs on TB exit
Date: Fri, 10 Mar 2023 11:52:45 -0800
Message-Id: <20230310195252.210956-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Changes for v2:
  * Use plugin_gen_disable_mem_helpers,
  * Remove plugin_gen_disable_mem_helpers from tcg_gen_exit_tb.
  * Break include loop with hw/core/cpu.h and qemu/plugins.h.
  * Inline plugin_gen_disable_mem_helpers.


r~


Richard Henderson (7):
  tcg: Clear plugin_mem_cbs on TB exit
  tcg: Drop plugin_gen_disable_mem_helpers from tcg_gen_exit_tb
  include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
  *: Add missing includes of qemu/error-report.h
  *: Add missing includes of qemu/plugin.h
  include/qemu: Split out plugin-event.h
  include/qemu/plugin: Inline qemu_plugin_disable_mem_helpers

 include/hw/core/cpu.h          |  2 +-
 include/qemu/plugin-event.h    | 26 ++++++++++++++++++++++++++
 include/qemu/plugin.h          | 27 ++++++---------------------
 accel/accel-softmmu.c          |  2 +-
 accel/tcg/cpu-exec-common.c    |  3 +++
 accel/tcg/cpu-exec.c           |  5 +----
 block/monitor/block-hmp-cmds.c |  1 +
 cpu.c                          |  1 +
 dump/dump.c                    |  1 +
 dump/win_dump.c                |  1 +
 hw/arm/collie.c                |  2 ++
 hw/arm/cubieboard.c            |  1 +
 hw/arm/musicpal.c              |  2 ++
 hw/arm/npcm7xx_boards.c        |  2 ++
 hw/arm/nseries.c               |  2 ++
 hw/arm/omap_sx1.c              |  2 ++
 hw/arm/orangepi.c              |  1 +
 hw/arm/palm.c                  |  2 ++
 hw/core/machine-smp.c          |  2 ++
 hw/i386/sgx.c                  |  1 +
 hw/loongarch/acpi-build.c      |  1 +
 hw/loongarch/virt.c            |  2 ++
 hw/m68k/next-cube.c            |  1 +
 hw/m68k/q800.c                 |  1 +
 hw/m68k/virt.c                 |  1 +
 hw/openrisc/boot.c             |  1 +
 hw/ppc/spapr_softmmu.c         |  2 ++
 hw/riscv/opentitan.c           |  1 +
 hw/riscv/shakti_c.c            |  1 +
 hw/riscv/virt-acpi-build.c     |  1 +
 linux-user/elfload.c           |  1 +
 linux-user/exit.c              |  1 +
 linux-user/syscall.c           |  1 +
 plugins/core.c                 | 11 -----------
 target/i386/cpu.c              |  1 +
 target/i386/host-cpu.c         |  1 +
 target/s390x/cpu_models.c      |  1 +
 target/s390x/diag.c            |  2 ++
 tcg/tcg-op.c                   |  1 -
 39 files changed, 79 insertions(+), 39 deletions(-)
 create mode 100644 include/qemu/plugin-event.h

-- 
2.34.1


