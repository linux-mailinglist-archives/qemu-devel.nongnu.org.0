Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34B366445
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:16:24 +0200 (CEST)
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4Hm-00082m-Nn
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fh-0006SB-K9
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4FZ-0002oB-RY
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:10 -0400
Received: by mail-pf1-x430.google.com with SMTP id q2so3114324pfk.9
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=HNyPkvynFx2NHSsF8eDqjG9fu9ueMrRzd2XsD9tmXYA=;
 b=C7zjT9UjGVhTbipx0OuvTlmYLieyT5BeiXPol9llIReJk7Pwi2HDwlcUbYDqVKhrZu
 9iIlJDCkqy6f588ubP8v6+/RDTySeH/4wG2mngDvWc3XdwY0cA6HaiBzJRvYrUULPYrq
 oD68+g7orYNneVdjUvKPjFPa+jb5irKwxnxx5VPV5eAjPCBHGDP8MINIeekQCbNG9Bsa
 CJa2NaT1kxla/oLH0pvDaA5lEaGzC5VjFv/z7O1WOljjboizsqYfllwMQM+PuI3dI44w
 e2Sui1no4Bp7HnmYN9vzprZrN5Y6i+D6CETu5ziNyBC7qxELoLqUUxBfc5wPJXMqNNFp
 ZBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HNyPkvynFx2NHSsF8eDqjG9fu9ueMrRzd2XsD9tmXYA=;
 b=PyrRIyViBpHKsMbrtbVACnUrW/4b52Vt7GqKnBln52tdF2D7G7WA73Di00YY5/vEa7
 kx56OtYLDcICrdAQh9eOQExo9rk6qQqowf20t7O645s/DAYM3nACnP12B9G+GBhKzDsK
 84lA3orCwqRvK8k70lH+4gnN6JV+1mCL6vwNbWHmYJn7DiE/TTGXOZs53ndTa8/A0ZIA
 3YRiJAt0skGtKm91ISGifLeDMXTubK6FctYz7g8mfL7XAOugZBDoWTAqrqmeIDhifhNM
 V0vBnqmTPdk4jy3jmpw655Io/dDmk11R/4LbVRf9rAXkjE9clDeWdsP8Z9DIdDVV0upS
 olWw==
X-Gm-Message-State: AOAM5327yON/Cj8HwzN3jm02zNqK+wy5IUZMuhMiiqwEnLX5T4N8RzwC
 tHtDvGLwDPQaPP7B3nNhiP9VZNpaE4jw+UBX
X-Google-Smtp-Source: ABdhPJxkvXKSnjJ+S0GbVMUWNzc1mYKtgfDCWWs6ap+tLyQQRNAehHVNjDlp/se8A4IDj9m125F/UA==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr20745794pgi.133.1618978443584; 
 Tue, 20 Apr 2021 21:14:03 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:03 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 00/17] support subsets of bitmanip extension
Date: Wed, 21 Apr 2021 12:13:42 +0800
Message-Id: <20210421041400.22243-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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

This patchset implements RISC-V B-extension v0.93 version Zba, Zbb and
Zbs subset instructions. Some Zbp instructions are also implemented as
they have similar behavior with their Zba-, Zbb- and Zbs-family
instructions or for Zbb pseudo instructions (e.g. rev8, orc.b).

Specification:
https://github.com/riscv/riscv-bitmanip/blob/master/bitmanip-0.93.pdf

The port is available here:
https://github.com/sifive/qemu/tree/rvb-upstream-v5

To test rvb implementation, specify cpu argument with 'x-b=true' or
'x-b=true,bext_spec=v0.93'to enable B-extension support.

Changelog:

v5:
 * add bext_spec cpu option, default set to v0.93.
 * rebase master branch.

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

Frank Chang (5):
  target/riscv: rvb: count bits set
  target/riscv: add gen_shifti() and gen_shiftiw() helper functions
  target/riscv: rvb: generalized reverse
  target/riscv: rvb: generalized or-combine
  target/riscv: rvb: add b-ext version cpu option

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
 target/riscv/cpu.c                      |  27 ++
 target/riscv/cpu.h                      |   5 +
 target/riscv/helper.h                   |   9 +
 target/riscv/insn32-64.decode           |  33 ++
 target/riscv/insn32.decode              |  54 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 417 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvi.c.inc |  54 +--
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                | 314 ++++++++++++++++++
 10 files changed, 960 insertions(+), 56 deletions(-)
 create mode 100644 target/riscv/bitmanip_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

--
2.17.1


