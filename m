Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C149B700BF3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:35:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmv-0003Gk-22; Fri, 12 May 2023 11:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmq-0003GM-9e
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmo-000602-Hi
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so6639268f8f.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905664; x=1686497664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=VBRXQxUoFYIt5dqOcTecX23QtO3eKxqKiwABiKeHvF0=;
 b=lRhA3MBkjn3dhmZiWsMAb4wsi+XsOv2YcSLM7rIaBjtC91cG+1+PQzQu/OOychDw5O
 6JlcS8/fvUBpCduGJXm21yEeh24PUK6ZXR+MREpxSZqsk4wwjbGbYV73r0418kWiPJva
 sJM14w9t2fkZ7CGdVx5Vkwfp9BO3FwxvgCEYHHx0HGq4A+0v2BZYqIgZRYhCsLlWFM/X
 yPKgNvKXiBXQkTVlP0HGhLKcomtD1iUL2nQq8CeJZcp27K34FI0j2CCgNl1HolfA79gX
 JEFViqUUmlmoPePskgHBNKdzscxrhnByxY8L3s9GIj7n2lBHNEid1q0lGCi4gIdlL6nE
 sy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905664; x=1686497664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VBRXQxUoFYIt5dqOcTecX23QtO3eKxqKiwABiKeHvF0=;
 b=E2qtu7m4dirRN3DPNghfDJV4VnsRzPgo1fqV4Bbcpb0IqZZrmpJm967gteFhYagaaY
 5+vR2TVWdubsxjzWkHnURKPbqMG1uwwl2FsfqainDKnhU5g7C2MN8IdKgnLExMgD3Op9
 szG3YHxYfAuUugSennomUDGIv8nUJlJBq43+tgSNyvRS1FOP3nwiZ7diQABs2EfK3ND0
 cjX/8CK0MgawBda34y03vnz/qV5/gTO65HLEUj91zOED00TaJtSyDPzb5aCQSJPS+4kL
 URObkHHgtXY5Okhd2jL+qyRL0iGnkH2ufaNse8iNYT9qa0GDxao2vklwFHLRYGE3/T5H
 uuDA==
X-Gm-Message-State: AC+VfDyKQgufVnnyhTYwqCZrdl8rYB2qJsDecvBpGEnQItDBNBjo2/1i
 +TVQbeZQkujwy8RA3K7U4Cz7Bs5gmcfT4Ns1MbI=
X-Google-Smtp-Source: ACHHUZ5m8/UGvYvwgpEc6OWsmWLtkfNh94PAyISfWBE+YolHmidwrpR0xsx6s9Corjjh/jhfJUh4VQ==
X-Received: by 2002:a5d:6b0b:0:b0:306:77da:13a with SMTP id
 v11-20020a5d6b0b000000b0030677da013amr16077034wrw.25.1683905664664; 
 Fri, 12 May 2023 08:34:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] target-arm queue
Date: Fri, 12 May 2023 16:34:11 +0100
Message-Id: <20230512153423.3704893-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi; here's a relatively small target-arm queue, pretty much all
bug fixes. (There are a few non-arm patches that I've thrown in
there too for my convenience :-))

thanks
-- PMM

The following changes since commit 278238505d28d292927bff7683f39fb4fbca7fd1:

  Merge tag 'pull-tcg-20230511-2' of https://gitlab.com/rth7680/qemu into staging (2023-05-11 11:44:23 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230512

for you to fetch changes up to 478dccbb99db0bf8f00537dd0b4d0de88d5cb537:

  target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input size check (2023-05-12 16:01:25 +0100)

----------------------------------------------------------------
target-arm queue:
 * More refactoring of files into tcg/
 * Don't allow stage 2 page table walks to downgrade to NS
 * Fix handling of SW and NSW bits for stage 2 walks
 * MAINTAINERS: Update Akihiko Odaki's email address
 * ui: Fix pixel colour channel order for PNG screenshots
 * docs: Remove unused weirdly-named cross-reference targets
 * hw/mips/malta: Fix minor dead code issue
 * Fixes for the "allow CONFIG_TCG=n" changes
 * tests/qtest: Don't run cdrom boot tests if no accelerator is present
 * target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input size check

----------------------------------------------------------------
Akihiko Odaki (1):
      MAINTAINERS: Update Akihiko Odaki's email address

Fabiano Rosas (3):
      target/arm: Select SEMIHOSTING when using TCG
      target/arm: Select CONFIG_ARM_V7M when TCG is enabled
      tests/qtest: Don't run cdrom boot tests if no accelerator is present

Peter Maydell (6):
      target/arm: Don't allow stage 2 page table walks to downgrade to NS
      target/arm: Fix handling of SW and NSW bits for stage 2 walks
      ui: Fix pixel colour channel order for PNG screenshots
      docs: Remove unused weirdly-named cross-reference targets
      hw/mips/malta: Fix minor dead code issue
      target/arm: Correct AArch64.S2MinTxSZ 32-bit EL1 input size check

Richard Henderson (2):
      target/arm: Move translate-a32.h, arm_ldst.h, sve_ldst_internal.h to tcg/
      target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/

 MAINTAINERS                              |  4 +-
 docs/system/devices/igb.rst              |  2 +-
 docs/system/devices/ivshmem.rst          |  2 -
 docs/system/devices/net.rst              |  2 +-
 docs/system/devices/usb.rst              |  2 -
 docs/system/keys.rst                     |  2 +-
 docs/system/linuxboot.rst                |  2 +-
 docs/system/target-i386.rst              |  4 --
 target/arm/helper.h                      |  8 +--
 target/arm/internals.h                   | 12 +++-
 target/arm/{ => tcg}/arm_ldst.h          |  0
 target/arm/{ => tcg}/helper-a64.h        |  0
 target/arm/{ => tcg}/helper-mve.h        |  0
 target/arm/{ => tcg}/helper-sme.h        |  0
 target/arm/{ => tcg}/helper-sve.h        |  0
 target/arm/{ => tcg}/sve_ldst_internal.h |  0
 target/arm/{ => tcg}/translate-a32.h     |  0
 hw/mips/malta.c                          |  5 +-
 target/arm/gdbstub64.c                   |  2 +-
 target/arm/helper.c                      | 15 ++++-
 target/arm/ptw.c                         | 95 +++++++++++++++++++-------------
 target/arm/tcg/pauth_helper.c            |  6 +-
 tests/qtest/cdrom-test.c                 | 10 ++++
 ui/console.c                             |  4 +-
 target/arm/Kconfig                       |  9 +--
 25 files changed, 109 insertions(+), 77 deletions(-)
 rename target/arm/{ => tcg}/arm_ldst.h (100%)
 rename target/arm/{ => tcg}/helper-a64.h (100%)
 rename target/arm/{ => tcg}/helper-mve.h (100%)
 rename target/arm/{ => tcg}/helper-sme.h (100%)
 rename target/arm/{ => tcg}/helper-sve.h (100%)
 rename target/arm/{ => tcg}/sve_ldst_internal.h (100%)
 rename target/arm/{ => tcg}/translate-a32.h (100%)

