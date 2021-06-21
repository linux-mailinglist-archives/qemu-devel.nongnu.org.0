Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF16C3AF931
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:20:38 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTDZ-0003An-Ph
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBv-0000Tp-0W
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:55 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBs-0005rN-TX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:18:54 -0400
Received: by mail-pj1-x1032.google.com with SMTP id h16so10886032pjv.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSdgCExREE1K1FI7Jix4PXH0SkOBwo1uK8HZFGelUDo=;
 b=fhOTUu8sToPFfq0bJO6rNVTk9riu9UmutpC2Oy/Go1f8uJIskPrXSa3VYhfbmTRwhz
 OVtMu5wWTX81pxX4iFdv+C7KfXi3elIliJW7Ie2d9KMqU8jgavPnnh9782tcKQ9aeFLr
 JdIsX5FTPZjrX+8lOV1zgIiWH66t1DuYBnR7KyG0ShV/cIJ1toGSIS9DXbJcytOCQ94o
 cgFVQrKuX2ubPbo9CjNe5VFrilm9gbCAjzM4SQeiejFXlaA3eQEo5QEIRwfMDBNuLqCw
 r5oLhQI1M7yaqkS68EveAMwe16C9tojoVz8RyQ3Pkl1QLrn1j13wcC/u8SFdJuqkF+1m
 XLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JSdgCExREE1K1FI7Jix4PXH0SkOBwo1uK8HZFGelUDo=;
 b=HpRlBhZ8b91nZ4TxSAmZoFbjDrYtMH1mwmW5jwolU3ARFqBolhQv6j2NIRMyFgUf09
 I+YupYV3K/1wHS3z4AERf2OWzkrHv3K1uLgD97rEW7FLS1hlDandr6L7/H3tUpWF1oni
 2FePdFwGYeyoht+CZracb/VrnBP7CmmVRW/6yxKvggMep9sPDirHCHIbpxd/zR2iqR5r
 TvbH07PFfC99AKCLP2ZiC131pBcW2He0fEO06Pzeb1qUqQ3qfxiP9TIXGBXSr1ZF74pG
 psh1r/qBBiKAY0BRnMoEsR0bDwdZK8EldJM0q/F7VjUShv12P3LfPJP2Wqvr3Xf0gZj2
 yKgw==
X-Gm-Message-State: AOAM532C0uq3WcTG4/3YyT/Ut/1FPF44HRMjeCnWRFgee+Rn2TnUWTBR
 32Ymxw0KRxAHGqNEeBIq+SN0ofpwzhlM5Q==
X-Google-Smtp-Source: ABdhPJzrHZQmzjwmlWQebcPD3X7HTEjSSBNvaTAzZd3ZU9NK0hpha4f8W0Yg2ZHYpxqXc6QgKG5XnA==
X-Received: by 2002:a17:90a:3802:: with SMTP id
 w2mr489968pjb.218.1624317530718; 
 Mon, 21 Jun 2021 16:18:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/29] tcg: bswap improvements
Date: Mon, 21 Jun 2021 16:18:20 -0700
Message-Id: <20210621231849.1871164-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has been on my to-do list for several years, and I've
finally spent a rainy weekend doing something about it.

The current tcg bswap opcode is fairly strict: for swaps smaller
than the TCGv size, it requires zero-extended input and provides
zero-extended output.

This has meant that various tcg/ backends have their own handling
of bswap when it comes to memory, to minimize overhead for stores
(which do not care about zero-extended output) or for signed loads
(which would rather not sign-extend after zero-extending).

Solve this by adding some operation flags to the tcg bswap opcode:

  TCG_BSWAP_IZ  -- Input is Zero extended
  TCG_BSWAP_OZ  -- Output is Zero extended
  TCG_BSWAP_OS  -- Output is Sign extended

For instance, bswap before store would not set any of these flags,
allowing unextended input and producing unextended output.

Changes for v2:
  * Merge tcg_out_rev{16,32,64}, which perhaps solves the issue of
    mnemonics vs actual opcodes, and also preps for Phil suggestion
    of adding additional tcg opcodes for hswap and wswap operations.
  * Improve comments for ppc bswap.
  * Improve README entries.

Patches lacking review/ack:

  03-tcg-aarch64-Merge-tcg_out_rev-16-32-64.patch
  11-tcg-ppc-Support-bswap-flags.patch
  12-tcg-ppc-Use-power10-byte-reverse-instructions.patch
  13-tcg-s390-Support-bswap-flags.patch
  14-tcg-mips-Support-bswap-flags-in-tcg_out_bswap16.patch


r~


Richard Henderson (29):
  tcg: Add flags argument to bswap opcodes
  tcg/i386: Support bswap flags
  tcg/aarch64: Merge tcg_out_rev{16,32,64}
  tcg/aarch64: Support bswap flags
  tcg/arm: Support bswap flags
  tcg/ppc: Split out tcg_out_ext{8,16,32}s
  tcg/ppc: Split out tcg_out_sari{32,64}
  tcg/ppc: Split out tcg_out_bswap16
  tcg/ppc: Split out tcg_out_bswap32
  tcg/ppc: Split out tcg_out_bswap64
  tcg/ppc: Support bswap flags
  tcg/ppc: Use power10 byte-reverse instructions
  tcg/s390: Support bswap flags
  tcg/mips: Support bswap flags in tcg_out_bswap16
  tcg/mips: Support bswap flags in tcg_out_bswap32
  tcg/tci: Support bswap flags
  tcg: Handle new bswap flags during optimize
  tcg: Add flags argument to tcg_gen_bswap16_*, tcg_gen_bswap32_i64
  tcg: Make use of bswap flags in tcg_gen_qemu_ld_*
  tcg: Make use of bswap flags in tcg_gen_qemu_st_*
  target/arm: Improve REV32
  target/arm: Improve vector REV
  target/arm: Improve REVSH
  target/i386: Improve bswap translation
  target/sh4: Improve swap.b translation
  target/mips: Fix gen_mxu_s32ldd_s32lddr
  tcg/arm: Unset TCG_TARGET_HAS_MEMORY_BSWAP
  tcg/aarch64: Unset TCG_TARGET_HAS_MEMORY_BSWAP
  tcg/riscv: Remove MO_BSWAP handling

 include/tcg/tcg-op.h            |   8 +-
 include/tcg/tcg-opc.h           |  10 +-
 include/tcg/tcg.h               |  12 ++
 tcg/aarch64/tcg-target.h        |   2 +-
 tcg/arm/tcg-target.h            |   2 +-
 target/arm/translate-a64.c      |  21 +--
 target/arm/translate.c          |   4 +-
 target/i386/tcg/translate.c     |  14 +-
 target/mips/tcg/mxu_translate.c |   6 +-
 target/s390x/translate.c        |   4 +-
 target/sh4/translate.c          |   3 +-
 tcg/optimize.c                  |  56 +++++-
 tcg/tcg-op.c                    | 143 ++++++++++------
 tcg/tcg.c                       |  28 +++
 tcg/tci.c                       |   3 +-
 tcg/aarch64/tcg-target.c.inc    | 125 ++++++--------
 tcg/arm/tcg-target.c.inc        | 295 ++++++++++++++------------------
 tcg/i386/tcg-target.c.inc       |  20 ++-
 tcg/mips/tcg-target.c.inc       |  99 +++++------
 tcg/ppc/tcg-target.c.inc        | 230 +++++++++++++++++--------
 tcg/riscv/tcg-target.c.inc      |  64 +++----
 tcg/s390/tcg-target.c.inc       |  34 +++-
 tcg/tci/tcg-target.c.inc        |  23 ++-
 tcg/README                      |  22 ++-
 24 files changed, 702 insertions(+), 526 deletions(-)

-- 
2.25.1


