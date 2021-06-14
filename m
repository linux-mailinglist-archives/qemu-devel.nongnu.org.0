Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDBE3A5E7D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:40:57 +0200 (CEST)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi9Q-0004rS-By
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6g-00022v-PT
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:06 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6e-0003Tt-0u
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:06 -0400
Received: by mail-pg1-x52e.google.com with SMTP id w31so5539319pga.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wDPTD4GpvOme2ql62Fl+Usvuvp5iZ2PlYtp2Bl0Wg8=;
 b=jxnYpJJzTV9dGIvjaxtLZipWqu/oSH9liIf1TZ8SIBIMCbjZEWg/3jDGkoniOrUb/3
 hukLLPxsFOq35P1NW0aKkkepsLUXX2tE9le0ZruSnI1mbORZKQmP1icAqX3ly657W4r6
 M51CS6JL8YnTUdNAxq1TMEEueariJNz0ORJccH0zaNaTUEN43fXBAmPofyNgNApcftIy
 Iv1ph0duyt1BFpfXxZm5l94ufeZLtuKIlVd+FlnBKp9kzsaHRGvbcEo8oAXuCA6XUJ15
 0wJpMoDWplEI/QmTI74W/DWhr0A2U0R9bInPvZY+eZ7tjTTZLCkYUtZc4es9PzPtnKWX
 kYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0wDPTD4GpvOme2ql62Fl+Usvuvp5iZ2PlYtp2Bl0Wg8=;
 b=Mfm8qR2UJYdCaTZczWTKBugTPaG7/vEP+bkTPia2F6m4OYHSxwmX/FglbsNTY2c6FR
 rGhJ92kn21slxiC1rHYRzB2GSTswzWMxpouKT/nlvm8a84p+1U1Yel/NRkpOu+3YhL+F
 T5C1IXmg52ud0sRFAK7unDMrJWjRhgbGJqu7SJpyWgIpSNVU07BwF9qa3Z2qKvsuJVtv
 Q3zTJccBQHCQhNPnVcDPedfedGeGYe3a0giU4HYF1nhJED36twjra+lcF+OxXi6It+yW
 /4QuXFq1UjTl9S6S6U5dwML7+/DqVk56AK0dC41IufaWxHrgU63stjFZm7VvmOywmjbJ
 7bWQ==
X-Gm-Message-State: AOAM533+n0Cr+IGcUjyRGPAfxHcbjBdi8joLYhTw6mgK93Jeq2wv69EK
 MFgLA0Z9mQ1Aed2C1L4hr5/3PkJ4HXhMlg==
X-Google-Smtp-Source: ABdhPJzIPaoKWE8SuCj26tuTE5QcUTZZszG1NW9259ZuUEex+9r7FOwAoJwTiwdhdGNkWrtggT4Ztw==
X-Received: by 2002:a63:d710:: with SMTP id d16mr15789702pgg.214.1623659881731; 
 Mon, 14 Jun 2021 01:38:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/28] tcg: bswap improvements
Date: Mon, 14 Jun 2021 01:37:32 -0700
Message-Id: <20210614083800.1166166-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

The patch set can be broken into sections:

  * patches 1 - 16 implement the functionality in the backend,
    but do not provide the interface to use it,

  * patch 17 enables the interface,

  * patches 18 - 25 use the new interface in the front ends

  * patches 26 - 28 remove some tcg backend complexity,
    leaving the bswap handling to the middle-end.


r~


Richard Henderson (28):
  tcg: Add flags argument to bswap opcodes
  tcg/i386: Support bswap flags
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
 tcg/optimize.c                  |  56 ++++++-
 tcg/tcg-op.c                    | 143 +++++++++++------
 tcg/tci.c                       |   3 +-
 tcg/aarch64/tcg-target.c.inc    |  99 +++++-------
 tcg/arm/tcg-target.c.inc        | 272 ++++++++++++--------------------
 tcg/i386/tcg-target.c.inc       |  20 ++-
 tcg/mips/tcg-target.c.inc       |  99 ++++++------
 tcg/ppc/tcg-target.c.inc        | 199 ++++++++++++++---------
 tcg/riscv/tcg-target.c.inc      |  64 ++++----
 tcg/s390/tcg-target.c.inc       |  34 +++-
 tcg/tci/tcg-target.c.inc        |  23 ++-
 tcg/README                      |  18 ++-
 23 files changed, 607 insertions(+), 509 deletions(-)

-- 
2.25.1


