Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A856BCD8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:21:26 +0200 (CEST)
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pnJ-0002cJ-CD
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi5-00027n-0u
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:02 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi0-00024c-MS
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:00 -0400
Received: by mail-pj1-x102b.google.com with SMTP id o15so13815484pjh.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mHWMd8rxjTcZd8VSZBiybJK+Vy8ZjvVBl26hIoOM7Y=;
 b=qgWiSBu5KImlVbg+v6ZIe1LNlGUqcRXzeYkj8mBnaHvIM5PNq03mYcXzqE3LzJN1h9
 1i1hn0O85H9uH646Rmkfuawk048usBPUoNGCV7XqObAAUUbYE73glGdwZOhWggXuZUok
 UOY24fhQdM3j31jD7jsdRQOKX5avIUI70F/XYYAp8FbFgENjN/1QJK2Xhpn9zT7IZFYy
 c5xRrpMqqWQ9Swm+hUDzz6wvZayj5wdCFG8t4QVuPwW0Yne+W9L9kRe+JIjt+KEohpDh
 GTRov9OSusl9cptWHgFllyuUjDIeBHtBaLKBfDruFB04Asbj+M+3YplVSO7a+ajlJorR
 PejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mHWMd8rxjTcZd8VSZBiybJK+Vy8ZjvVBl26hIoOM7Y=;
 b=nczFuHyU1amMzplpM/i9AiQK4SOJFRnajsaRHE0+hegNFExArdEvg1EGFxmDu44Y9/
 uNXnnHs+lY7g2eYql47he643Prq2T0qQ+UdrZ6ktFxazprBh8oAK+TGP1o3KlpF8BgnH
 SqGWbRNuUdLEc9Eed59jWZslmB/UX4sZtPNXJYSU2tXyOHm6jVyQVuZq0kVYQcKTT+Ne
 tvb6abvcWSz4+sOvgOPvyFjXQuDey4+7J4Oz/lgOxvcmhR+0o0NzsE40z7U3RvCX+T0A
 jgQ5z64q+hw1bTGtcEnB/sM+6Mz+vXO0j/4uUyJUqO+MUlcZC7H6x1Xg2dC1Ffb24yKk
 +BYQ==
X-Gm-Message-State: AJIora9BDmAuiZ1vOyXZAXAvEpO8Ef8aj9lKgWCIpq/wL54Upta0+7ze
 I0ACsv1ITxzmX2ZPmlk8ei0AF6kWrYHWog3/
X-Google-Smtp-Source: AGRyM1vF4o9+RHUsmcM9XQMejImEFd2ZfluENSa3HWqLDdHzs5BvseIunODICFxhSo64jDodxquM7A==
X-Received: by 2002:a17:902:ec84:b0:16c:278d:add with SMTP id
 x4-20020a170902ec8400b0016c278d0addmr2174104plg.12.1657293346912; 
 Fri, 08 Jul 2022 08:15:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:15:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 00/45] target/arm: Scalable Matrix Extension
Date: Fri,  8 Jul 2022 20:44:55 +0530
Message-Id: <20220708151540.18136-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Changes for v6:
  * Some sub-word big-endian addressing fixups (pmm).
  * Logic errors for BFMOPA/FMOPA (pmm).
  * Fix for PR_SME_SET_VL hflags rebuild.

r~

Richard Henderson (45):
  target/arm: Handle SME in aarch64_cpu_dump_state
  target/arm: Add infrastructure for disas_sme
  target/arm: Trap non-streaming usage when Streaming SVE is active
  target/arm: Mark ADR as non-streaming
  target/arm: Mark RDFFR, WRFFR, SETFFR as non-streaming
  target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA, FTSSEL as
    non-streaming
  target/arm: Mark PMULL, FMMLA as non-streaming
  target/arm: Mark FTSMUL, FTMAD, FADDA as non-streaming
  target/arm: Mark SMMLA, UMMLA, USMMLA as non-streaming
  target/arm: Mark string/histo/crypto as non-streaming
  target/arm: Mark gather/scatter load/store as non-streaming
  target/arm: Mark gather prefetch as non-streaming
  target/arm: Mark LDFF1 and LDNF1 as non-streaming
  target/arm: Mark LD1RO as non-streaming
  target/arm: Add SME enablement checks
  target/arm: Handle SME in sve_access_check
  target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
  target/arm: Implement SME ZERO
  target/arm: Implement SME MOVA
  target/arm: Implement SME LD1, ST1
  target/arm: Export unpredicated ld/st from translate-sve.c
  target/arm: Implement SME LDR, STR
  target/arm: Implement SME ADDHA, ADDVA
  target/arm: Implement FMOPA, FMOPS (non-widening)
  target/arm: Implement BFMOPA, BFMOPS
  target/arm: Implement FMOPA, FMOPS (widening)
  target/arm: Implement SME integer outer product
  target/arm: Implement PSEL
  target/arm: Implement REVD
  target/arm: Implement SCLAMP, UCLAMP
  target/arm: Reset streaming sve state on exception boundaries
  target/arm: Enable SME for -cpu max
  linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
  linux-user/aarch64: Reset PSTATE.SM on syscalls
  linux-user/aarch64: Add SM bit to SVE signal context
  linux-user/aarch64: Tidy target_restore_sigframe error return
  linux-user/aarch64: Do not allow duplicate or short sve records
  linux-user/aarch64: Verify extra record lock succeeded
  linux-user/aarch64: Move sve record checks into restore
  linux-user/aarch64: Implement SME signal handling
  linux-user: Rename sve prctls
  linux-user/aarch64: Implement PR_SME_GET_VL, PR_SME_SET_VL
  target/arm: Only set ZEN in reset if SVE present
  target/arm: Enable SME for user-only
  linux-user/aarch64: Add SME related hwcap entries

 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   62 +-
 target/arm/cpu.h                  |    7 +
 target/arm/helper-sme.h           |  126 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   18 +
 target/arm/translate-a64.h        |   45 ++
 target/arm/translate.h            |   16 +
 target/arm/sme-fa64.decode        |   60 ++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   41 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  243 +++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   35 +-
 target/arm/cpu64.c                |   11 +
 target/arm/helper.c               |   56 +-
 target/arm/sme_helper.c           | 1140 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  103 ++-
 target/arm/translate-sme.c        |  373 ++++++++++
 target/arm/translate-sve.c        |  393 ++++++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    2 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    3 +
 28 files changed, 2821 insertions(+), 135 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1


