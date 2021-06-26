Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDDB3B4D21
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:38:12 +0200 (CEST)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx1xD-0004UN-E5
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vg-0001kM-FK
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:36 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1ve-0000Dv-IE
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:36 -0400
Received: by mail-pg1-x535.google.com with SMTP id h4so10122235pgp.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9QQcCLbaFTfNCOHDP1+bw4qrhgbzPMDuZ45oMkrp3w=;
 b=Xe1GrInZgTiQNH2OSz9q7PugC0pscRHmjsnktgMs0JU/vvjBgo+4KpQpex5roeU01t
 BtaEIqG1WblaVoqDdqYS7Dksu9253PbR3awb1iTvrc2qSXbZL08v+nfKwltz/rb4ciXO
 nBdHP7MjVgwPAv/7BUZI+teWAIC54OKK/G9sWu/5eIgOkDaFlZB+tuAww9PmPAbNjep1
 7kdPlPXi5xz8uwW/1qGlQtAcXDXCjjtPBiLMO2/iImYy1TDNhKoaOw6PrWnszdXo+klW
 2o+A6X4ghrv34tyNwzhdd6BLp5mdsetvM3HHKI9gjlrZb4LmwAH5pava4cTm8cFpApLD
 RFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9QQcCLbaFTfNCOHDP1+bw4qrhgbzPMDuZ45oMkrp3w=;
 b=I3JGAtSC7RKLM6fJpqtun68AKO3NZS3Y5prVwz9f5SCPRPczyJK2tEWx3eWphJHvNM
 ffhtkkA5fq8C6X9pcaKwUGFNmUFuLPBB11JeTlWRstQutR58bDuNSVLJ6ythA8fz3wZI
 mZrhdFBAai5UuOXhrZoSaNYwMdrO9lqFtixnYp+szWyQWdVbLLPC3S0zd6RBLzXUn5Aq
 0BHeIMMtKVV6WirKB3IowP0QRVqoO0yFgVIt+UwKccw1B5BTK82ASw804L1se+5F3PA8
 /9cRxN+0tGnPf90XyUQigHobh3o/GJN2yl5qmauYnWs+o7SvX3z0cowgbvJv5cVR8/cg
 BRjA==
X-Gm-Message-State: AOAM532KKegjesGWqTA6LXbS7DDp69j+IqU5X5kbnQY8SEeVbs+4YcGS
 IDmnrh4rNPoFf8l49aFVODF5/C0aAZ8I/Q==
X-Google-Smtp-Source: ABdhPJxvYF4sPiUYOD0uSXIKwmiQahDdqu2hpqG9YLnprs/+EzXgAfTac78E9y4SEnYRk1Vv/tWfpQ==
X-Received: by 2002:a63:f65:: with SMTP id 37mr2490628pgp.367.1624689392766;
 Fri, 25 Jun 2021 23:36:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/29] tcg: bswap improvements
Date: Fri, 25 Jun 2021 23:36:02 -0700
Message-Id: <20210626063631.2411938-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Changes for v3:
  * Comment improvments for mips (phil).
  * Patch 3 is new, rearranging some tcg/aarch64 helpers.

Changes for v2:
  * Merge tcg_out_rev{16,32,64}, which perhaps solves the issue of
    mnemonics vs actual opcodes, and also preps for Phil suggestion
    of adding additional tcg opcodes for hswap and wswap operations.
  * Improve comments for ppc bswap.
  * Improve README entries.

Patches lacking review:

  03-tcg-aarch64-Merge-tcg_out_rev-16-32-64.patch
  11-tcg-ppc-Support-bswap-flags.patch
  12-tcg-ppc-Use-power10-byte-reverse-instructions.patch
  13-tcg-s390-Support-bswap-flags.patch


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
 tcg/mips/tcg-target.c.inc       | 102 +++++------
 tcg/ppc/tcg-target.c.inc        | 230 +++++++++++++++++--------
 tcg/riscv/tcg-target.c.inc      |  64 +++----
 tcg/s390/tcg-target.c.inc       |  34 +++-
 tcg/tci/tcg-target.c.inc        |  23 ++-
 tcg/README                      |  22 ++-
 24 files changed, 704 insertions(+), 527 deletions(-)

-- 
2.25.1


