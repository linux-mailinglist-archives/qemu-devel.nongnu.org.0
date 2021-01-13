Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8714C2F450B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:18:15 +0100 (CET)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzaQ2-0000CI-Hn
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaLx-0006gJ-Sy
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:02 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaLu-0003hR-6q
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:01 -0500
Received: by mail-pf1-x436.google.com with SMTP id q20so672966pfu.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 23:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=0k5VWgUZmBykkLgQPNEXBKI1BcCXiLtvx6YuEbb6Vsc=;
 b=SoHdg1NJ+Je663oIlDKORYyG/lW9DdCEvlehdSAIiPylK8r38WYU9ZL1aH7FyMJYyU
 bcSecHDwFdoPEKaJZZFL5NfMOEVxfeOpsPrEjzk2duYyblfoGrgmHhnN+z8fKdoN3t4q
 UFZd2q7B6Nlkg7DbeiEa5cnfrfGMEI1pmiba/RklVFJDNxaJKy+l0PzhuWV7L1kyM+Eu
 4I09hX069LhZUeTVW972gNE4UgWIZK/F00G+jSTUVa1g9WLtoWSTTdlKuyf0P3uViwfk
 N+2Pd3NGhzq4FvXh2tsUon0Vbw884slO2UuVNZ41eo3ijbjohM4iOaPgv1Zx37iFKnpN
 WGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0k5VWgUZmBykkLgQPNEXBKI1BcCXiLtvx6YuEbb6Vsc=;
 b=TiUEA98cNI8mxgcdKDbOsdabgk4jDRk2BuedQzfO0+rHhDd9zKh3EgtbZWgZTyDzJb
 tdffZfwTMq3yytaq6PDyYO2Kw2i1uG7/J/YCRbNeDQBes1j+vIooay12VMQwhZvVDx8B
 z+mDTWN7VG+otGKWi5E6FGpwjvGqeVI4J/mUgya3nTjbpRhWIEuro0rZoASSDrT0BvSe
 feZOCnNYrZ9ij9E/w1y2HmqtQXNMVT6hI8mZHp+lATWekbIuzRPiGjm4B7VEZAu3jOgI
 fhagK+fYMVzvydOCjhMsafJKriFdEGkUrQBAtWeK5hSMuaL1N1cYSxljIif1+cbKoHw2
 kJyw==
X-Gm-Message-State: AOAM530cUQ4xv3XY4cySUAyC0HJ2MMfDriq/SZcyzIHlCO4Pb3jiNmSf
 M7QN0sX7TyD5hVY3/hQeAF84/z/MSDJLJJYK
X-Google-Smtp-Source: ABdhPJzlzkt1QJCRiHW+UpGPVOkT/cGipYGFzqOjcAK7yu50f7Sfx0Hv+pufFIgHKtLXGWu+irQeOg==
X-Received: by 2002:a65:608e:: with SMTP id t14mr840773pgu.436.1610522035497; 
 Tue, 12 Jan 2021 23:13:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:13:54 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v4 00/16] support subsets of bitmanip extension
Date: Wed, 13 Jan 2021 15:13:32 +0800
Message-Id: <20210113071350.24852-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

This patchset implements RISC-V B-extension 0.93 version Zbb, Zbs and
Zba subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zbb-, Zbs- and Zba-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v4

To test rvb implementation, specify cpu argument with 'x-b=true' to
enable B-extension support.

Changelog:

v4:
 * Remove 'rd != 0' checks from immediate shift instructions.

v3:
 * Convert existing immediate shift instructions to use gen_shifti()
   and gen_shiftiw() interfaces.
 * Rename *u.w instructions to *.uw.
 * Rename sb* instructions to b*.
 * Rename pcnt* instructions to cpop*.

v2:
 * Add gen_shifti(), gen_shiftw(), gen_shiftiw() helper functions.
 * Remove addwu, subwu and addiwu instructions as they are not longer
   exist in latest draft.
 * Optimize implementation with cleaner tcg ops.

Frank Chang (4):
  target/riscv: rvb: count bits set
  target/riscv: add gen_shifti() and gen_shiftiw() helper functions
  target/riscv: rvb: generalized reverse
  target/riscv: rvb: generalized or-combine

Kito Cheng (12):
  target/riscv: reformat @sh format encoding for B-extension
  target/riscv: rvb: count leading/trailing zeros
  target/riscv: rvb: logic-with-negate
  target/riscv: rvb: pack two words into one register
  target/riscv: rvb: min/max instructions
  target/riscv: rvb: sign-extend instructions
  target/riscv: rvb: single-bit instructions
  target/riscv: rvb: shift ones
  target/riscv: rvb: rotate (left/right)
  target/riscv: rvb: address calculation
  target/riscv: rvb: add/shift with prefix zero-extend
  target/riscv: rvb: support and turn on B-extension from command line

 target/riscv/bitmanip_helper.c          | 102 ++++++
 target/riscv/cpu.c                      |   4 +
 target/riscv/cpu.h                      |   2 +
 target/riscv/helper.h                   |   9 +
 target/riscv/insn32-64.decode           |  33 ++
 target/riscv/insn32.decode              |  54 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 415 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  54 +--
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 314 ++++++++++++++++++
 10 files changed, 932 insertions(+), 56 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


