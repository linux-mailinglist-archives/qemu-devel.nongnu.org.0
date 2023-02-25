Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46A66A27FD
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:00:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqPP-0000Lj-4c; Sat, 25 Feb 2023 03:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPI-0000LE-R8
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:52 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPG-0004oW-SH
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 03:59:52 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so472606plf.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 00:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W5Dq8tNQ7vqT23pi8EJ4sQhJjuVbWctx/4+OGVog4Ac=;
 b=hw3bhKXUPPfSxaNvvkMteKwMu0APpKD8T/SNzHemhlKxfvz4CPu7GeHFyjXCdFrlHO
 PEJJ9RKItp0DHtLkXwv+sMW2H6Ov5/o17oFGg3Q0VpmOdn9l4JZELzPDX1cMP40+dn4c
 ZJaUUz6WjKzAaTb8aKYE6vWCrwl4mWKJL7vw+afsVAh9LSXhm3ad0j7V4PbrJUwI7RQr
 igs8eLXPJLMiRLeMP1Vz72oJ9Y2b6xo9pvqBo62VCcBk7WEQb13QuaishlIDNDbno4Y2
 mCldHgMF/MscIs5cyMePDNioeCpWzBmIhrkrqqx5WcK0gNyrCPbOdz28eyRT7Um5dKmb
 vd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W5Dq8tNQ7vqT23pi8EJ4sQhJjuVbWctx/4+OGVog4Ac=;
 b=k8kYT4aREdl7tDOeGnbyBLTVrtejQO7ubDyXOS7wyuXaWNPIMvU9BRwr6YMMEGnfjt
 3tGwBtfHcN17jKQILCG8TJAek/e4FChbPN9i0SfCNydn9MFC340ngqCf1+6oqyjwhEAz
 5eAVkRR4lFeMkYzrTZddSeErzvn58qrQYrz/bSJMZ6BodanGtBzqyj010gGJCm5JXeMX
 4MMpAeg7H/qnImapf1MVenRQ9Xn+65AuuKH68A5MZrofxJdbqO9jl0l7Ro9vDbB+pb5X
 LMq1wwLBehM/K6Jt1WPZHxFtMHJh+LweEPg2eaY3leC42I061k7oPC5jCBaRfqlAqaEL
 feNw==
X-Gm-Message-State: AO0yUKUnmlU9ZMmMYlSH1x7giYo2ARQpWR0ST4cpDO9G/th/hwJugQbS
 rYaAs21t277o5xbLOYrsPDVneW/yRGykg9rWNWc=
X-Google-Smtp-Source: AK7set+tiaYSmeacRpceQOwR31EMZBjIy80djR7AOwTgfojr0VTaRUg0Sc/U3XuUZA0SgiKTZULTQw==
X-Received: by 2002:a05:6a20:12c4:b0:bf:6cd3:9510 with SMTP id
 v4-20020a056a2012c400b000bf6cd39510mr23223539pzg.24.1677315589127; 
 Sat, 25 Feb 2023 00:59:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.00.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 00:59:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v3 00/30] tcg: Simplify temporary usage
Date: Fri, 24 Feb 2023 22:59:15 -1000
Message-Id: <20230225085945.1798188-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

The biggest pitfall for new users of TCG is the fact that "normal"
temporaries die at branches, and we must therefore use a different
"local" temporary in that case.

The following patch set changes that, so that the "normal" temporary
is the one that lives across branches, and there is a special temporary
that dies at the end of the extended basic block, and this special
case is reserved for tcg internals.

Patches lacking review:
  07-tcg-Add-liveness_pass_0.patch
  10-tcg-Use-tcg_constant_i32-in-tcg_gen_io_start.patch
  14-tcg-Use-tcg_constant_ptr-in-do_dup.patch
  17-tcg-Don-t-re-use-TEMP_TB-temporaries.patch
  30-tcg-Update-docs-devel-tcg-ops.rst-for-temporary-c.patch


r~


Richard Henderson (30):
  tcg: Adjust TCGContext.temps_in_use check
  accel/tcg: Pass max_insn to gen_intermediate_code by pointer
  accel/tcg: Use more accurate max_insns for tb_overflow
  tcg: Remove branch-to-next regardless of reference count
  tcg: Rename TEMP_LOCAL to TEMP_TB
  tcg: Use noinline for major tcg_gen_code subroutines
  tcg: Add liveness_pass_0
  tcg: Remove TEMP_NORMAL
  tcg: Pass TCGTempKind to tcg_temp_new_internal
  tcg: Use tcg_constant_i32 in tcg_gen_io_start
  tcg: Add tcg_gen_movi_ptr
  tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
  tcg: Use tcg_temp_ebb_new_* in tcg/
  tcg: Use tcg_constant_ptr in do_dup
  accel/tcg/plugin: Use tcg_temp_ebb_*
  accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
  tcg: Don't re-use TEMP_TB temporaries
  tcg: Change default temp lifetime to TEMP_TB
  target/arm: Drop copies in gen_sve_{ldr,str}
  target/arm: Don't use tcg_temp_local_new_*
  target/cris: Don't use tcg_temp_local_new
  target/hexagon: Don't use tcg_temp_local_new_*
  target/hppa: Don't use tcg_temp_local_new
  target/i386: Don't use tcg_temp_local_new
  target/mips: Don't use tcg_temp_local_new
  target/ppc: Don't use tcg_temp_local_new
  target/xtensa: Don't use tcg_temp_local_new_*
  exec/gen-icount: Don't use tcg_temp_local_new_i32
  tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
  tcg: Update docs/devel/tcg-ops.rst for temporary changes

 docs/devel/tcg-ops.rst                      | 230 +++++++++-------
 target/hexagon/idef-parser/README.rst       |   4 +-
 include/exec/gen-icount.h                   |  12 +-
 include/exec/translator.h                   |   4 +-
 include/tcg/tcg-op.h                        |   7 +-
 include/tcg/tcg.h                           |  64 ++---
 target/arm/translate-a64.h                  |   1 -
 target/hexagon/gen_tcg.h                    |   4 +-
 accel/tcg/plugin-gen.c                      |  32 +--
 accel/tcg/translate-all.c                   |   2 +-
 accel/tcg/translator.c                      |   6 +-
 target/alpha/translate.c                    |   2 +-
 target/arm/translate-a64.c                  |   6 -
 target/arm/translate-sve.c                  |  38 +--
 target/arm/translate.c                      |   8 +-
 target/avr/translate.c                      |   2 +-
 target/cris/translate.c                     |   8 +-
 target/hexagon/genptr.c                     |  16 +-
 target/hexagon/idef-parser/parser-helpers.c |   4 +-
 target/hexagon/translate.c                  |   4 +-
 target/hppa/translate.c                     |   5 +-
 target/i386/tcg/translate.c                 |  29 +-
 target/loongarch/translate.c                |   2 +-
 target/m68k/translate.c                     |   2 +-
 target/microblaze/translate.c               |   2 +-
 target/mips/tcg/translate.c                 |  59 ++---
 target/nios2/translate.c                    |   2 +-
 target/openrisc/translate.c                 |   2 +-
 target/ppc/translate.c                      |   8 +-
 target/riscv/translate.c                    |   2 +-
 target/rx/translate.c                       |   2 +-
 target/s390x/tcg/translate.c                |   2 +-
 target/sh4/translate.c                      |   2 +-
 target/sparc/translate.c                    |   2 +-
 target/tricore/translate.c                  |   2 +-
 target/xtensa/translate.c                   |  18 +-
 tcg/optimize.c                              |   2 +-
 tcg/tcg-op-gvec.c                           | 189 +++++++------
 tcg/tcg-op.c                                | 258 +++++++++---------
 tcg/tcg.c                                   | 280 ++++++++++++--------
 target/cris/translate_v10.c.inc             |  10 +-
 target/mips/tcg/nanomips_translate.c.inc    |   4 +-
 target/ppc/translate/spe-impl.c.inc         |   8 +-
 target/ppc/translate/vmx-impl.c.inc         |   4 +-
 target/hexagon/README                       |   8 +-
 target/hexagon/gen_tcg_funcs.py             |  18 +-
 46 files changed, 681 insertions(+), 695 deletions(-)

-- 
2.34.1


