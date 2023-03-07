Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38876AECF7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaU-000608-RE; Tue, 07 Mar 2023 12:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaS-0005yF-5b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:56 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaN-0000AF-3G
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:52 -0500
Received: by mail-pl1-x630.google.com with SMTP id ky4so15026777plb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ATzBhvg5gGYzI88PosZ54GUxsm5tDMF+0yKYAr/Cq7c=;
 b=GBNY3rCFV+x1CI9iZCcGQRnsxIvwRWMVf/JP7xhqkHJ5IgHxzGpt9AwlLEQd0GznC7
 xph+fPqVt7TDXSYa1jVCoEckbmtSODbHADM1BC/y5gaYrIpTNGqau1xl1rE90fNZzE+J
 REwKrBVdUNhfNgMj1aLPndo5bj9ZCPsp/jAz9t/hb+e2W+jj2jdbM51mlNA1RXUO2DeQ
 hyXxbne4ws2St19XgU5CwyO0lf0cp69+bp72aCnshr0CCtkrehEeBZgmHM+V8jBDuvBP
 QNWhcym1y9kaWgtDR6NyXUD+VaYM5N24wul5uNS8XTBpDYz3laR6ujxUhUPhJJ35suJB
 jYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ATzBhvg5gGYzI88PosZ54GUxsm5tDMF+0yKYAr/Cq7c=;
 b=ZA3socMgogK5atybIV9GtRTxpzuzEgBZnVWpUO9yrO35YXgIrhb+TbgcbDxB/2cSdv
 NPM+ZOfVOoe8uKJ77b1aqbpjA1yG0ULQXgJC21N8HGbW2pjG1O5+1Y8IWKPUhOhiGYI4
 r9FgN5l3ESfXGxadxoKpIwVjyXTSgSJQktyJhKc2BFP990jmlr3o5MDcoGOt1KDNXbRJ
 YdbiEs9SXkrkUecxVgGECxODcxsfA1U/mlX885npVRH9piBU4u3jZggYLRe2Zj5jzDIY
 davsZ8aEeP+X3rZSuOstB0lOufRy9XtCTSW9l3nWVjnNtcWszDZnISLdlAp2SwBTQFT0
 xnqA==
X-Gm-Message-State: AO0yUKUFSF5ZEQtDz+e/Pn9Yj9rpZh3f/23OmRenBCFK5GjVFIqr1r5D
 SI4BAr//UHcn6Z4ZsWvNqizmKongrRheDOswqYw=
X-Google-Smtp-Source: AK7set/2E5h6lckEJ87y38oonGuaYRm0oz4BTrBtfQ9clNVgR14VDWvBq+00YgxpOjCpjhDIlTsILQ==
X-Received: by 2002:a17:903:32cf:b0:19d:1d32:fbe with SMTP id
 i15-20020a17090332cf00b0019d1d320fbemr18487944plr.20.1678211929245; 
 Tue, 07 Mar 2023 09:58:49 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/67] tcg patch queue
Date: Tue,  7 Mar 2023 09:57:41 -0800
Message-Id: <20230307175848.2508955-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230307

for you to fetch changes up to 19458933164e4a74a15618cacc20365b20f04697:

  tcg: Replace tcg_const_i64 in tcg-op.c (2023-03-07 08:23:55 -0800)

----------------------------------------------------------------
accel/tcg: Fix NB_MMU_MODES to 16
Balance of the target/ patchset which eliminates tcg_temp_free
Portion of the target/ patchset which eliminates tcg_const

----------------------------------------------------------------
Anton Johansson via (23):
      include/exec: Set default `NB_MMU_MODES` to 16
      target/alpha: Remove `NB_MMU_MODES` define
      target/arm: Remove `NB_MMU_MODES` define
      target/avr: Remove `NB_MMU_MODES` define
      target/cris: Remove `NB_MMU_MODES` define
      target/hexagon: Remove `NB_MMU_MODES` define
      target/hppa: Remove `NB_MMU_MODES` define
      target/i386: Remove `NB_MMU_MODES` define
      target/loongarch: Remove `NB_MMU_MODES` define
      target/m68k: Remove `NB_MMU_MODES` define
      target/microblaze: Remove `NB_MMU_MODES` define
      target/mips: Remove `NB_MMU_MODES` define
      target/nios2: Remove `NB_MMU_MODES` define
      target/openrisc: Remove `NB_MMU_MODES` define
      target/ppc: Remove `NB_MMU_MODES` define
      target/riscv: Remove `NB_MMU_MODES` define
      target/rx: Remove `NB_MMU_MODES` define
      target/s390x: Remove `NB_MMU_MODES` define
      target/sh4: Remove `NB_MMU_MODES` define
      target/sparc: Remove `NB_MMU_MODES` define
      target/tricore: Remove `NB_MMU_MODES` define
      target/xtensa: Remove `NB_MMU_MODES` define
      include/exec: Remove guards around `NB_MMU_MODES`

Richard Henderson (44):
      target/mips: Drop tcg_temp_free from micromips_translate.c.inc
      target/mips: Drop tcg_temp_free from msa_translate.c
      target/mips: Drop tcg_temp_free from mxu_translate.c
      target/mips: Drop tcg_temp_free from nanomips_translate.c.inc
      target/mips: Drop tcg_temp_free from octeon_translate.c
      target/mips: Drop tcg_temp_free from translate_addr_const.c
      target/mips: Drop tcg_temp_free from tx79_translate.c
      target/mips: Drop tcg_temp_free from vr54xx_translate.c
      target/mips: Drop tcg_temp_free from translate.c
      target/s390x: Drop free_compare
      target/s390x: Drop tcg_temp_free from translate_vx.c.inc
      target/s390x: Drop tcg_temp_free from translate.c
      target/s390x: Remove assert vs g_in2
      target/s390x: Remove g_out, g_out2, g_in1, g_in2 from DisasContext
      tcg: Create tcg/tcg-temp-internal.h
      target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
      target/avr: Avoid use of tcg_const_i32 throughout
      target/cris: Avoid use of tcg_const_i32 throughout
      target/hppa: Avoid tcg_const_i64 in trans_fid_f
      target/hppa: Avoid use of tcg_const_i32 throughout
      target/i386: Avoid use of tcg_const_* throughout
      target/m68k: Avoid tcg_const_i32 when modified
      target/m68k: Avoid tcg_const_i32 in bfop_reg
      target/m68k: Avoid tcg_const_* throughout
      target/mips: Split out gen_lxl
      target/mips: Split out gen_lxr
      target/mips: Avoid tcg_const_tl in gen_r6_ld
      target/mips: Avoid tcg_const_* throughout
      target/ppc: Split out gen_vx_vmul10
      target/ppc: Avoid tcg_const_i64 in do_vector_shift_quad
      target/rx: Use tcg_gen_abs_i32
      target/rx: Use cpu_psw_z as temp in flags computation
      target/rx: Avoid tcg_const_i32 when new temp needed
      target/rx: Avoid tcg_const_i32
      target/s390x: Avoid tcg_const_i64
      target/sh4: Avoid tcg_const_i32 for TAS.B
      target/sh4: Avoid tcg_const_i32
      tcg/sparc: Avoid tcg_const_tl in gen_edge
      target/tricore: Split t_n as constant from temp as variable
      target/tricore: Rename t_off10 and use tcg_constant_i32
      target/tricore: Use setcondi instead of explicit allocation
      target/tricore: Drop some temp initialization
      target/tricore: Avoid tcg_const_i32
      tcg: Replace tcg_const_i64 in tcg-op.c

 include/exec/cpu-defs.h                   |   9 +-
 include/tcg/tcg-temp-internal.h           |  83 +++
 include/tcg/tcg.h                         |  54 --
 target/alpha/cpu-param.h                  |   2 -
 target/arm/cpu-param.h                    |   2 -
 target/avr/cpu-param.h                    |   1 -
 target/cris/cpu-param.h                   |   1 -
 target/hexagon/cpu-param.h                |   2 -
 target/hppa/cpu-param.h                   |   1 -
 target/i386/cpu-param.h                   |   1 -
 target/loongarch/cpu-param.h              |   1 -
 target/m68k/cpu-param.h                   |   1 -
 target/microblaze/cpu-param.h             |   1 -
 target/microblaze/cpu.h                   |   2 +-
 target/mips/cpu-param.h                   |   1 -
 target/nios2/cpu-param.h                  |   1 -
 target/openrisc/cpu-param.h               |   1 -
 target/ppc/cpu-param.h                    |   1 -
 target/riscv/cpu-param.h                  |   1 -
 target/rx/cpu-param.h                     |   2 -
 target/s390x/cpu-param.h                  |   1 -
 target/sh4/cpu-param.h                    |   1 -
 target/sparc/cpu-param.h                  |   2 -
 target/tricore/cpu-param.h                |   1 -
 target/xtensa/cpu-param.h                 |   1 -
 accel/tcg/plugin-gen.c                    |   1 +
 target/avr/translate.c                    |  48 +-
 target/cris/translate.c                   |  46 +-
 target/hppa/translate.c                   |  35 +-
 target/i386/tcg/translate.c               |  83 +--
 target/m68k/translate.c                   | 229 +++++----
 target/mips/tcg/msa_translate.c           |   9 -
 target/mips/tcg/mxu_translate.c           |  55 +-
 target/mips/tcg/octeon_translate.c        |  23 -
 target/mips/tcg/translate.c               | 819 +++++-------------------------
 target/mips/tcg/translate_addr_const.c    |   7 -
 target/mips/tcg/tx79_translate.c          |  45 +-
 target/mips/tcg/vr54xx_translate.c        |   4 -
 target/rx/translate.c                     |  84 ++-
 target/s390x/tcg/translate.c              | 208 +-------
 target/sh4/translate.c                    |  35 +-
 target/sparc/translate.c                  |  14 +-
 target/tricore/translate.c                | 462 ++++++++---------
 tcg/tcg-op-gvec.c                         |   1 +
 tcg/tcg-op-vec.c                          |   1 +
 tcg/tcg-op.c                              |  13 +-
 tcg/tcg.c                                 |   1 +
 target/cris/translate_v10.c.inc           |  26 +-
 target/mips/tcg/micromips_translate.c.inc |  12 +-
 target/mips/tcg/nanomips_translate.c.inc  | 143 +-----
 target/ppc/translate/vmx-impl.c.inc       |  99 ++--
 target/s390x/tcg/translate_vx.c.inc       | 143 ------
 52 files changed, 843 insertions(+), 1977 deletions(-)
 create mode 100644 include/tcg/tcg-temp-internal.h

