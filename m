Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314CF62045A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:59:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC0c-00044j-GR; Mon, 07 Nov 2022 18:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0a-00044X-Io
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:28 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0Y-0007gk-KD
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id w14so18501729wru.8
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MKjW0BrJWZq77neMmk8YH4P6rDKUM9j5IJDTgvuIJVc=;
 b=vjn0HZlvdbDqyaPwahrtuTHfPKEvZoiLGuahiHnx0n8FY2Mb5hEpuL93P67cJ2CPcw
 bT9RpW1bJbBQB8eMfLZZneADR7NS+hx5TeJUa/i4wdDiAwflIe+NmNdYZuoFcjCUM8Ju
 y2T53lv1gUeD6kvApqrdzDUdt2OK0i5PKEb+LBnd3TbBa5Fir1W8+LvW3+HfgPY3zZo+
 F4dknPoMdWKvM8ztHmnSkCEG9vRMD/GXcl1ZuIT90JB3H2j4ilYCjBvfyhm0bFPZuYcR
 rvHnLBZoh1YOrJkkTzqRSes7gcXtrjoKPizM21fjFxBknkTVmLb5rD/l7awSPf0erhxq
 d11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MKjW0BrJWZq77neMmk8YH4P6rDKUM9j5IJDTgvuIJVc=;
 b=3NxOlshQbIkPOsjGxgb84X7J99EcTdEdX/+1pmU4o8CVvgJqsdLWfDqKqNP7weliUy
 sfz9Hwgqg/mAYlNoERqiEva2TxAnKP2rupJio2z1hlIZTWnXFboi8Jdfo9CfKZeWUxpA
 MdZZwMMypGDp9AinTZH/ZIn0lyZR7Bf9BBmLcUjRfMJNkb63gxN5oL9mLsl8T3w3G4V8
 po5pqCC7yDkC/hm11mubEkdY3Hp61szN44xzyniBzOof0Q56/AegHpliuj8ZUz9HtGL1
 QkaXOxeQfT69DV+AmfpIQe1GkDK4r8Z7g8RtsNx5twt9c3qO9SlZCKgN0BEiewWIwZoT
 Hvyw==
X-Gm-Message-State: ACrzQf3ZKiT5HltNtppYXxZSzejutOwxLCeBNRAntyNg3MLuPwJXeQLs
 k5DDRUz8KwgI6N9vklow0NqoJX609h1tng==
X-Google-Smtp-Source: AMsMyM5VmsUV1u0TCaEatPa98y71TgASMnbXBcdQT4i++Etr9l65qIzVnx10dH8uWQuO7B8CL3sFPQ==
X-Received: by 2002:adf:ef82:0:b0:234:ef87:dc8d with SMTP id
 d2-20020adfef82000000b00234ef87dc8dmr34533579wro.297.1667865504156; 
 Mon, 07 Nov 2022 15:58:24 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a7bc046000000b003cf7055c014sm9452311wmc.1.2022.11.07.15.58.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 00/14] MIPS patches for 2022-11-08
Date: Tue,  8 Nov 2022 00:58:08 +0100
Message-Id: <20221107235822.71458-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

The following changes since commit cd706454c6cd239a477cb227caf3e3dfbb742d1a:

  Merge tag 'pull-request-2022-11-06' of https://gitlab.com/thuth/qemu into staging (2022-11-07 05:44:44 -0500)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20221108

for you to fetch changes up to 617fbc31a25e699c4f7cdf0b5d172322516afb20:

  MAINTAINERS: Inherit from nanoMIPS (2022-11-08 00:39:03 +0100)

----------------------------------------------------------------
MIPS patches queue

- Remove -Wclobbered in nanoMIPS disassembler (Richard Henderson)
- Fix invalid string formats in nanoMIPS disassembler (myself)
- Allow Loongson-2F to access XKPHYS in kernel mode (Jiaxun Yang)
- Octeon opcode fixes (Jiaxun Yang, Pavel Dovgalyuk)
- MAINTAINERS nanoMIPS update

----------------------------------------------------------------

Jiaxun Yang (4):
  target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
  target/mips: Cast offset field of Octeon BBIT to int16_t
  target/mips: Disable DSP ASE for Octeon68XX
  target/mips: Don't check COP1X for 64 bit FP mode

Pavel Dovgalyuk (1):
  target/mips: Enable LBX/LWX/* instructions for Octeon

Philippe Mathieu-Daudé (5):
  disas/nanomips: Fix invalid PRId64 format calling img_format()
  disas/nanomips: Fix invalid PRIx64 format calling img_format()
  disas/nanomips: Use G_GNUC_PRINTF to avoid invalid string formats
  disas/nanomips: Remove headers already included by "qemu/osdep.h"
  MAINTAINERS: Inherit from nanoMIPS

Richard Henderson (4):
  disas/nanomips: Move setjmp into nanomips_dis
  disas/nanomips: Merge insn{1,2,3} into words[3]
  disas/nanomips: Split out read_u16
  disas/nanomips: Tidy read for 48-bit opcodes

 MAINTAINERS                   |   8 +-
 disas/nanomips.c              | 154 +++++++++++++++-------------------
 target/mips/cpu-defs.c.inc    |   4 +-
 target/mips/cpu.c             |   6 ++
 target/mips/tcg/octeon.decode |   2 +-
 target/mips/tcg/translate.c   |  14 ++--
 6 files changed, 87 insertions(+), 101 deletions(-)

-- 
2.38.1


