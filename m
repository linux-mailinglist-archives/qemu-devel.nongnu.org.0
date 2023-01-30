Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72063681C05
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbFs-0007l5-2F; Mon, 30 Jan 2023 15:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFg-0007Q6-Mb
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:48 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbFc-0005Bc-NM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:59:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id 203so7478108pfx.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kmX60ZBdC6CPmmCcxYxjzRt8wJ05cO/bLL2h6sfGeIA=;
 b=BNXDUsgLWQkPFJCJ5FK7SS2zFczlrmQVEZvdimcnR8jNFFFl+X71RXWtaG0EVLI09d
 HHiAUedQ4fjmVSHLDztbdWU7JiyhbBAN1ei6vN6FFH6AnB7JFydHxdeON6N+65+D2Yw5
 GpOWzJur71pLj8PeNs9AciS6AxE+LZsZ89enho1ndzRBPA1wznnbjcMB4SO1y1EnSt+i
 y3kzKOM/gzRwMjnVYW9O3lAmfr/GIUtCzclO1XE3w3nMWwYxZInEa9qKDcveQHA192e8
 8UYCC0611TI3//+Wzb0wroxbmyO2tpHpsLnUk5T6IXIbH4vzdBWLYx1LhQT7aftXlfgL
 W2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kmX60ZBdC6CPmmCcxYxjzRt8wJ05cO/bLL2h6sfGeIA=;
 b=vpWeUMC71p7+t7VmGoS0iTQCtxJnrQ85LZwn1F4c3L8WmyiOZeC7WS1QV8+0VSwjRW
 UOg+r3QjArQJttRN55zosYT3twOyf8qr/miuzp1Pz+x42HHww4n6iEsJORVmmwHZwCMj
 IFVfsW3FVy9efqiijsBwOXupS8NYclKsub+5SoVDeyb2EJWm2ZQ8W9JUdRY1pyVfbmGZ
 jFOWGmXTWMVCb51uGwsud2RUxxmrgW/twsOyAHBHDW+pUJF29D+LjvZ3848QvmbzlCcZ
 hJ3GvgtruHKAcXFHLcvxQ89b5kC+lve9fjSjhhayYCDtHW0HfBepTcSlBhn8aDV56R7i
 1sOg==
X-Gm-Message-State: AFqh2krw8KsAQ7UkeY9stSFYCXXtO27DsjjA2jBBgFVRf7j+snnJ9ntk
 RJce0UF7l54Kh0YfqiDwwy5XB3W58kPuCbrL
X-Google-Smtp-Source: AMrXdXt858duVEmpPyi9l64Efhx+Um6NAupubzYUIARnx4pdMejXDHHZNys/setmMkhqoUd4MfIOXA==
X-Received: by 2002:a62:1884:0:b0:58b:c7f8:623c with SMTP id
 126-20020a621884000000b0058bc7f8623cmr42948412pfy.27.1675112378841; 
 Mon, 30 Jan 2023 12:59:38 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.12.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:59:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 00/27] tcg: Simplify temporary usage
Date: Mon, 30 Jan 2023 10:59:07 -1000
Message-Id: <20230130205935.1157347-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Based-on: 20230126043824.54819-1-richard.henderson@linaro.org
("[PATCH v5 00/36] tcg: Support for Int128 with helpers")

The biggest pitfall for new users of TCG is the fact that "normal"
temporaries die at branches, and we must therefore use a different
"local" temporary in that case.

The following patch set changes that, so that the "normal" temporary
is the one that lives across branches, and there is a special temporary
that dies at the end of the extended basic block, and this special
case is reserved for tcg internals.

TEMP_LOCAL is renamed TEMP_TB, which I believe to be more explicit and
less confusing.  TEMP_NORMAL is removed entirely.

I thought about putting in a proper full-power liveness analysis pass.
This would have eliminated the differences between all non-global
temporaries, and would have noticed when TEMP_LOCAL finally dies
within a translation and avoid any final writeback.
But I came to the conclusion that it was too expensive in runtime,
and so retaining some distinction in the types was required.

In addition, I found that the usage of temps within plugin-gen.c
(9 per guest memory operation) meant that we *must* have some form
of temp that can be re-used.  (There is one x86 instruction which
generates 62 memory operations; 62 * 9 == 558, which is larger than
our current TCG_MAX_TEMPS.)

However I did add a new liveness pass which, with a single pass over
the opcode stream, can see that a TEMP_LOCAL is only live within a
single extended basic block, and thus may be transformed to TEMP_EBB.

With this, and by not recycling TEMP_LOCAL, we can get identical code
out of the backend even when changing the front end translators are
adjusted to use TEMP_LOCAL for everything.

Benchmarking one test case, qemu-arm linux-test, the new liveness pass
comes in at about 1.6% on perf, but I can't see any difference in
wall clock time before and after the patch set.


r~


Richard Henderson (27):
  tcg: Adjust TCGContext.temps_in_use check
  accel/tcg: Pass max_insn to gen_intermediate_code by pointer
  accel/tcg: Use more accurate max_insns for tb_overflow
  tcg: Remove branch-to-next regardless of reference count
  tcg: Rename TEMP_LOCAL to TEMP_TB
  tcg: Add liveness_pass_0
  tcg: Remove TEMP_NORMAL
  tcg: Pass TCGTempKind to tcg_temp_new_internal
  tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
  tcg: Add tcg_gen_movi_ptr
  tcg: Use tcg_temp_ebb_new_* in tcg/
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

 docs/devel/tcg-ops.rst                      | 103 ++++----
 target/hexagon/idef-parser/README.rst       |   4 +-
 include/exec/gen-icount.h                   |   8 +-
 include/exec/translator.h                   |   4 +-
 include/tcg/tcg-op.h                        |   7 +-
 include/tcg/tcg.h                           |  64 ++---
 target/arm/translate-a64.h                  |   1 -
 target/hexagon/gen_tcg.h                    |   4 +-
 accel/tcg/plugin-gen.c                      |  33 +--
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
 target/i386/tcg/translate.c                 |  29 +--
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
 tcg/tcg-op-gvec.c                           | 270 ++++++++++----------
 tcg/tcg-op.c                                | 258 +++++++++----------
 tcg/tcg.c                                   | 270 +++++++++++---------
 target/cris/translate_v10.c.inc             |  10 +-
 target/mips/tcg/nanomips_translate.c.inc    |   4 +-
 target/ppc/translate/spe-impl.c.inc         |   8 +-
 target/ppc/translate/vmx-impl.c.inc         |   4 +-
 target/hexagon/README                       |   8 +-
 target/hexagon/gen_tcg_funcs.py             |  18 +-
 46 files changed, 640 insertions(+), 677 deletions(-)

-- 
2.34.1


