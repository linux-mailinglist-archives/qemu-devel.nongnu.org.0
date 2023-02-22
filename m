Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA469FF6D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWA-0000LK-Qx; Wed, 22 Feb 2023 18:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyW9-0000L2-Kr
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyW7-0005Hm-PO
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:21 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c1so11031922plg.4
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ms4oVvhYyu0L6DgvXN7Buy78Hd7voCWUfTtsA0Yahfw=;
 b=s5owAluL/pKysqX4++Hq5LBVYVzj0Uc1svKhYzS0cPbSfRB3GtI2MsBPWTzJ+b2+yX
 /Ch5tnpfe3zqu2LsTSA2F9zTrG3TqLmnBQiUv/tEjHNdyff4XME5aqR6G8gZwXBqmKPf
 4VTaj2pDkQkGQ4zr6MolQRWHmEB2Ktrk/VrWVATTN2BbiWsHnJUjOIdgGwG2PVPmBM87
 SW6Zd7oomNsp27s3SKIU6JeBeSsHntTvs2AWb9YisyuyOOm+j5f4R7xTZaF+js/C/jQs
 K98JcGRW+el4dNysXAJjD993GEIaIP3mSLJeqZ3eJC+y0eVxx15pME7gYTRueVmp8oiQ
 e/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ms4oVvhYyu0L6DgvXN7Buy78Hd7voCWUfTtsA0Yahfw=;
 b=1ZfB5z6TSpUBU8HrXMfTUWZOn9CQnGgXRZsoERSdDYFCv0onbmS5xzRebVeXwwREhC
 c7Eqty8Hc6uCys+wyW1DAM4TschldP9J5pYdtuO54BVK86STSV3cHQ+zxFyfYCruQWAb
 9fzpl9bsgPclJQah7wCa+jjxLLh03Pax7U741q2P6Ve0r7YZrmCpGgy7rmzpZRoviPg9
 LizZxV0S9+p2sIB4pI7InnkuCl4gvpJb+OvWZyq/7MgnvWDGMd8Tpzct1dS+Vh5RnXLH
 6wSFu9mtS/dUbii7mzSptIlwUVYRS/TvpD5ktVUtksrCly5pK+M8SNbw5uBwG72QWXip
 9NuQ==
X-Gm-Message-State: AO0yUKX77oWFAFHFBZcOPrQDtY/hZTopwtuz6XMaMLetla2VbcgIpw2I
 zceN3C2ptQmMsEQc/SAwrbwxJcUJBqOx9EUwVdk=
X-Google-Smtp-Source: AK7set/VTBScSCHUk77DBa+K4jb9YGUYIBxSeoUtBDhaU4jD94+Wl/2lj+CPgTfNywRZNTaFkoFLzA==
X-Received: by 2002:a17:90a:ba91:b0:236:6e16:6d5b with SMTP id
 t17-20020a17090aba9100b002366e166d5bmr10837862pjr.20.1677108437877; 
 Wed, 22 Feb 2023 15:27:17 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/28] tcg: Simplify temporary usage
Date: Wed, 22 Feb 2023 13:26:47 -1000
Message-Id: <20230222232715.15034-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
  03-accel-tcg-Use-more-accurate-max_insns-for-tb_over.patch
  04-tcg-Remove-branch-to-next-regardless-of-reference.patch
  06-tcg-Add-liveness_pass_0.patch
  14-tcg-Don-t-re-use-TEMP_TB-temporaries.patch
  16-target-arm-Drop-copies-in-gen_sve_-ldr-str.patch
  27-tcg-Update-docs-devel-tcg-ops.rst-for-temporary-c.patch
  28-tcg-Use-noinline-for-major-tcg_gen_code_subroutin.patch


r~


Richard Henderson (28):
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
  tcg: Use noinline for major tcg_gen_code_subroutines

 docs/devel/tcg-ops.rst                      | 103 +++----
 target/hexagon/idef-parser/README.rst       |   4 +-
 include/exec/gen-icount.h                   |   8 +-
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
 tcg/tcg-op-gvec.c                           | 270 +++++++++----------
 tcg/tcg-op.c                                | 258 +++++++++---------
 tcg/tcg.c                                   | 280 ++++++++++++--------
 target/cris/translate_v10.c.inc             |  10 +-
 target/mips/tcg/nanomips_translate.c.inc    |   4 +-
 target/ppc/translate/spe-impl.c.inc         |   8 +-
 target/ppc/translate/vmx-impl.c.inc         |   4 +-
 target/hexagon/README                       |   8 +-
 target/hexagon/gen_tcg_funcs.py             |  18 +-
 46 files changed, 646 insertions(+), 680 deletions(-)

-- 
2.34.1


