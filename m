Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1890E6A4364
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:53:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdvU-0006Xy-7b; Mon, 27 Feb 2023 08:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvR-0006Wn-8X
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:21 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvP-0005SO-1M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3XS1OUhyx8F00pLyA4M+P/g9wFBdCCBdkTuXPMG1gHs=; b=q4e7+6JRSlRWX8PrEz0+SKdqbn
 b8dM6JBb9qqFdrMbRuLK80ZRcMWtHZCKTS+z+hCnyENT5AWQFn73lKBCg5DPlPMrxKXtuo97bcZgO
 m5EIIo9c6dTAT68GwmGlX3nIFq7HxdYXlrDQb5graO/z0RPOWlDfwFGa5cZryAVeC6/Q=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v3 00/27] Replace TARGET_TB_PCREL with CF_PCREL
Date: Mon, 27 Feb 2023 14:51:35 +0100
Message-Id: <20230227135202.9710-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset entirely replaces the macro TARGET_TB_PCREL with
a field in TranslationBlock.cflags called CF_PCREL, and is a
first step towards removing target-specific assumptions from
non-target/ directories.

The grand goal is to allow for heterogeneous QEMU binaries
consisting of multiple frontends.

RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html

Changes in v2:
  * Setting of CF_PCREL (previously patch 3) was split in two and moved
    up front (to patch 2 and 3);

  * Replacing of TARGET_TB_PCREL (previously patch 2) was split into
    four patches (patches [4,7]), one for each affected submodule;

  * Removal of TARGET_TB_PCREL (previously patch 3) was moved into
    separate patches, one for each submodule (patches [8,10]);

  * Patch 11 was introduced in response to feedback, and removes
    CF_PCREL checks in functions in tb-jmp-cache.h, these functions were
    always called in a context where CF_PCREL was already being checked.
    These tb-jmp-cache.h functions were then removed in favour of manual
    inlining;

  * Patches [12,26] replaces calls to tb_pc() with a member access
    tb->pc, the motivation being that tb_pc() was (almost) always called
    in a context where CF_PCREL was already being checked;

  * Finally patch 27 removes tb_pc() which is no longer used.

Changes in v3:
  * Added reviewed-bys on remaining patches.

Anton Johansson (27):
  include/exec: Introduce `CF_PCREL`
  target/i386: set `CF_PCREL` in `x86_cpu_realizefn`
  target/arm: set `CF_PCREL` in `arm_cpu_realizefn`
  accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`
  include/exec: Replace `TARGET_TB_PCREL` with `CF_PCREL`
  target/arm: Replace `TARGET_TB_PCREL` with `CF_PCREL`
  target/i386: Replace `TARGET_TB_PCREL` with `CF_PCREL`
  include/exec: Remove `TARGET_TB_PCREL` define
  target/arm: Remove `TARGET_TB_PCREL` define
  target/i386: Remove `TARGET_TB_PCREL` define
  accel/tcg: Move jmp-cache `CF_PCREL` checks to caller
  accel/tcg: Replace `tb_pc()` with `tb->pc`
  target/tricore: Replace `tb_pc()` with `tb->pc`
  target/sparc: Replace `tb_pc()` with `tb->pc`
  target/sh4: Replace `tb_pc()` with `tb->pc`
  target/rx: Replace `tb_pc()` with `tb->pc`
  target/riscv: Replace `tb_pc()` with `tb->pc`
  target/openrisc: Replace `tb_pc()` with `tb->pc`
  target/mips: Replace `tb_pc()` with `tb->pc`
  target/microblaze: Replace `tb_pc()` with `tb->pc`
  target/loongarch: Replace `tb_pc()` with `tb->pc`
  target/i386: Replace `tb_pc()` with `tb->pc`
  target/hppa: Replace `tb_pc()` with `tb->pc`
  target/hexagon: Replace `tb_pc()` with `tb->pc`
  target/avr: Replace `tb_pc()` with `tb->pc`
  target/arm: Replace `tb_pc()` with `tb->pc`
  include/exec: Remove `tb_pc()`

 accel/tcg/cpu-exec.c                    | 64 +++++++++++++++++--------
 accel/tcg/internal.h                    | 10 ++--
 accel/tcg/perf.c                        |  2 +-
 accel/tcg/tb-jmp-cache.h                | 42 +---------------
 accel/tcg/tb-maint.c                    | 10 ++--
 accel/tcg/translate-all.c               | 16 +++----
 include/exec/cpu-defs.h                 |  3 --
 include/exec/exec-all.h                 | 21 ++------
 target/arm/cpu-param.h                  |  2 -
 target/arm/cpu.c                        | 17 ++++---
 target/arm/translate-a64.c              |  8 ++--
 target/arm/translate.c                  |  6 +--
 target/arm/translate.h                  |  2 +-
 target/avr/cpu.c                        |  3 +-
 target/hexagon/cpu.c                    |  4 +-
 target/hppa/cpu.c                       |  8 ++--
 target/i386/cpu-param.h                 |  4 --
 target/i386/cpu.c                       |  5 ++
 target/i386/helper.c                    |  2 +-
 target/i386/tcg/tcg-cpu.c               |  8 ++--
 target/i386/tcg/translate.c             | 26 +++++-----
 target/loongarch/cpu.c                  |  6 ++-
 target/microblaze/cpu.c                 |  4 +-
 target/mips/tcg/exception.c             |  3 +-
 target/mips/tcg/sysemu/special_helper.c |  2 +-
 target/openrisc/cpu.c                   |  4 +-
 target/riscv/cpu.c                      |  7 ++-
 target/rx/cpu.c                         |  3 +-
 target/sh4/cpu.c                        |  6 ++-
 target/sparc/cpu.c                      |  4 +-
 target/tricore/cpu.c                    |  3 +-
 31 files changed, 152 insertions(+), 153 deletions(-)

--
2.39.1

