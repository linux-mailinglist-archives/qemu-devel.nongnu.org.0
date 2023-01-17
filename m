Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF9670CD5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:11:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6k-0003Ke-50; Tue, 17 Jan 2023 18:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6Z-0003I1-Qx
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:10:59 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6X-0001IE-1C
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:10:58 -0500
Received: by mail-pg1-x536.google.com with SMTP id v3so23201423pgh.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ztVOwiy3fDaIDnlE922OGQ54wli9ZyFZlLEgG6zuVCk=;
 b=t4WJbDOzguTwv8NiEDkngWVv7ECDA6aOZAkQ2FLAJNFdOf0bLaYYe+BI1D+XdYsBJQ
 iAP/y4fNxkvvOi80fvYTa8b0vcyN5B61mP2UPJCn8K3YMUJczl+kYtokbZzQOr1pVvFs
 RS9f78avTatFWt6vWH94WRzGYzf/jcPdOyPskgGJ3shaJyluQgz/NbVdEe2DodLMPpnA
 CQWNGbisRdYAmkQsUUs/GRyOvUFjp2JjXmbjuJQQjAjSczKTSl4mBL2pH70daN/wGdEI
 6afoUKvs12+7uYk9lvnz9g07KIX+afXKpKvzDr/GyBaRoHFsipZv0MAQKqJUdSyGE2sj
 nlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ztVOwiy3fDaIDnlE922OGQ54wli9ZyFZlLEgG6zuVCk=;
 b=AGTLa4+0JZAv1hvLt6kSDR5eBIujh10Km1EbyIC23iKsfBBtC9ePuy5w0sjM3Va+he
 zDStsehS22ny828VSL+F1RLzQrLxmeCjKP/weozDZcKPYMopNkjpMuHkCS456F93Fr4f
 XK6aT3O/XOegJXOxW1WQx3nREcxHlxTiNKeErXwlyCJeFgo5/dGXKzxlj64QQ+Wjv5kV
 NY7DR6dW6zGWruLIoQcA+7bZ/I0QHm1L9YRbseVJkVgZ5ySKCJKfmGS494os0MxlJIpW
 ciHTFKBxk6XGHqHRjJZ2NN0ItCXTc+fVULAwl20I1rZ1Eb7pwx6e5vbeLWfNTIOqBl1r
 g0KQ==
X-Gm-Message-State: AFqh2kpsZnYXH7Uvl8FXm5jNdVBGZvGNzy8VFyzuxjZSwwgp68NRTkzL
 26JTZQXkpj1JMUgUS9XhmnJoyYdf1AfpeeWa
X-Google-Smtp-Source: AMrXdXtG4TNHC9kXXA9P9iB+chAeWJGXxc4DWnLNFJ6TMAmzTl4SSXe04JvihNMm5jr+xsLz9r+ZfQ==
X-Received: by 2002:a05:6a00:26cc:b0:589:62bd:14d with SMTP id
 p12-20020a056a0026cc00b0058962bd014dmr4648434pfw.1.1673997055028; 
 Tue, 17 Jan 2023 15:10:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:10:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/22] tcg patch queue
Date: Tue, 17 Jan 2023 13:10:29 -1000
Message-Id: <20230117231051.354444-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Second pull for this week, since this set is large enough by itself.


r~


The following changes since commit 7c9236d6d61f30583d5d860097d88dbf0fe487bf:

  Merge tag 'pull-tcg-20230116' of https://gitlab.com/rth7680/qemu into staging (2023-01-17 10:24:16 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230117

for you to fetch changes up to 493c9b19a7fb7f387c4fcf57d3836504d5242bf5:

  tcg/riscv: Implement direct branch for goto_tb (2023-01-17 22:36:17 +0000)

----------------------------------------------------------------
tcg: Fix race conditions in (most) goto_tb implementations

----------------------------------------------------------------
Richard Henderson (22):
      tcg: Split out tcg_out_exit_tb
      tcg/i386: Remove unused goto_tb code for indirect jump
      tcg/ppc: Remove unused goto_tb code for indirect jump
      tcg/sparc64: Remove unused goto_tb code for indirect jump
      tcg: Replace asserts on tcg_jmp_insn_offset
      tcg: Introduce set_jmp_insn_offset
      tcg: Introduce get_jmp_target_addr
      tcg: Split out tcg_out_goto_tb
      tcg: Rename TB_JMP_RESET_OFFSET_INVALID to TB_JMP_OFFSET_INVALID
      tcg: Add gen_tb to TCGContext
      tcg: Add TranslationBlock.jmp_insn_offset
      tcg: Change tb_target_set_jmp_target arguments
      tcg: Move tb_target_set_jmp_target declaration to tcg.h
      tcg: Always define tb_target_set_jmp_target
      tcg: Remove TCG_TARGET_HAS_direct_jump
      tcg/aarch64: Reorg goto_tb implementation
      tcg/ppc: Reorg goto_tb implementation
      tcg/sparc64: Remove USE_REG_TB
      tcg/sparc64: Reorg goto_tb implementation
      tcg/arm: Implement direct branch for goto_tb
      tcg/riscv: Introduce OPC_NOP
      tcg/riscv: Implement direct branch for goto_tb

 include/exec/exec-all.h          |   5 +-
 include/tcg/tcg.h                |  14 ++-
 tcg/aarch64/tcg-target.h         |   6 +-
 tcg/arm/tcg-target.h             |   5 -
 tcg/i386/tcg-target.h            |   9 --
 tcg/loongarch64/tcg-target.h     |   3 -
 tcg/mips/tcg-target.h            |   5 -
 tcg/ppc/tcg-target.h             |   7 +-
 tcg/riscv/tcg-target.h           |   4 -
 tcg/s390x/tcg-target.h           |  11 ---
 tcg/sparc64/tcg-target.h         |   4 -
 tcg/tci/tcg-target.h             |   4 -
 accel/tcg/cpu-exec.c             |  21 ++--
 accel/tcg/translate-all.c        |  10 +-
 tcg/tcg-op.c                     |  14 +--
 tcg/tcg.c                        |  42 +++++---
 tcg/aarch64/tcg-target.c.inc     | 106 ++++++++++-----------
 tcg/arm/tcg-target.c.inc         |  89 +++++++++++------
 tcg/i386/tcg-target.c.inc        |  68 +++++++------
 tcg/loongarch64/tcg-target.c.inc |  66 +++++++------
 tcg/mips/tcg-target.c.inc        |  59 +++++++-----
 tcg/ppc/tcg-target.c.inc         | 193 ++++++++++++-------------------------
 tcg/riscv/tcg-target.c.inc       |  65 +++++++++----
 tcg/s390x/tcg-target.c.inc       |  67 ++++++++-----
 tcg/sparc64/tcg-target.c.inc     | 201 +++++++++++++++------------------------
 tcg/tci/tcg-target.c.inc         |  31 +++---
 26 files changed, 528 insertions(+), 581 deletions(-)

