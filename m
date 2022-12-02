Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC9263FFEF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymQ-0002Xb-Ny; Fri, 02 Dec 2022 00:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymO-0002Wo-Nq
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:08 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymH-000360-ER
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:08 -0500
Received: by mail-pj1-x102b.google.com with SMTP id t17so3934310pjo.3
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BSLdjS10gJ2xB4ZQQ7TWy+2NFiacepVlchxlOOVxJdA=;
 b=RRYPJzeifbqMRvKILhH98yhdR2LEkNJoTIBpDUAmMqq/sTCmdPN1JtbunCjqI6sazA
 Xl2ER88E2ZK8iAUyBAybz/u0FYCs27+e4YiqCkgV5QfeKvd/012eqEgFc25iubOqThpk
 y8SQSDG2nmKRR3o7Ns3CQQoLf0LpcCV9e0AkY2Q99199eTFBMdfcJKcURZh9fSSrMZQr
 eGdWT1UPm69gRYrhUm/VeSqP924y6ZcMtYvqTwOUUHWM7Ml8nWoBIb4VN6qYN9XyfWPK
 d15pqFinp3MytHeUA6NMBrqQ4UqSXgFJyTFYeOw2tsGWygH8tfBbt94BE8SGJt5YEzvZ
 9Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BSLdjS10gJ2xB4ZQQ7TWy+2NFiacepVlchxlOOVxJdA=;
 b=3BB2L69iIvOvA+WYb/x9+DNwDlQ0zWwpljZo64KEAO/ikHfMVxjSL+wbhHcD7CuAog
 OzY6XzjciM2xvbLiHWnGHnBlKPFWrgm/6FsM6QSxBvde38XPo+fXg/xI68PgGFi//cat
 h/UoWcRDhXfZe0xqCcZp2OUz31zJng4LYQKqLqO9spk0Tmkd8HT1e5Ea7fxEML7aYUeb
 FukytLYmHWj7zfEQ4k4VgMGWpurALQvUB9UneVHbn/bwPNudhs7ImVIoya6P35Nvjs9Y
 2AKaCFePbtepJlgGNEnFAgJg5GIQfynAOcb/xguEmR7qgFB66iAf2dDSUqa1gkYCfcVu
 HAAA==
X-Gm-Message-State: ANoB5plYAtI8hoLAPYBHp3o3h30O/ZVK1/w+Kcd6t5Xt4ejyfibcRFtm
 uQodzsN+eDKgJGP3bcG1FK8DevIn6e6JtRtx
X-Google-Smtp-Source: AA0mqf4zT/lzK16IfkPKHq6VUP1RBkHX5AEIgk73iQ3OOxqbzOxqswUperCxfCVzzX5tcKhLEGBf8A==
X-Received: by 2002:a17:902:7d94:b0:187:4920:3a7e with SMTP id
 a20-20020a1709027d9400b0018749203a7emr55084394plm.171.1669959599898; 
 Thu, 01 Dec 2022 21:39:59 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.39.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:39:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 00/34] tcg misc patches
Date: Thu,  1 Dec 2022 21:39:24 -0800
Message-Id: <20221202053958.223890-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This contains a few bits that I've queued for 8.0, as well
as the first half of the TCGv_i128 patch set (just prior to
the introduction of TCG_TYPE_I128).

Included are the paired register patches, which have seen
changes since v2, and a bit more testing on s390x host
(which uses register pairs for multiply and divide, so
good testing of the feature without having to bring in
all of the other target/ changes for TCGv_i128).


Patches lacking review:
  04-tcg-Cleanup-trailing-whitespace.patch
  05-tcg-Fix-tcg_reg_alloc_dup.patch
  06-tcg-Centralize-updates-to-reg_to_temp.patch
  07-tcg-Remove-check_regs.patch
  09-tcg-Introduce-paired-register-allocation.patch
  11-accel-tcg-Set-cflags_next_tb-in-cpu_common_initfn.patch
  12-target-sparc-Avoid-TCGV_-LOW-HIGH.patch
  15-tcg-Simplify-calls-to-temp_sync-vs-mem_coherent.patch
  23-accel-tcg-plugin-Don-t-search-for-the-function-po.patch
  27-tcg-Vary-the-allocation-size-for-TCGOp.patch
  29-tcg-Reorg-function-calls.patch
  30-tcg-Convert-typecode_to_ffi-from-array-to-functio.patch
  31-tcg-Factor-init_ffi_layouts-out-of-tcg_context_in.patch
  32-tcg-Move-ffi_cif-pointer-into-TCGHelperInfo.patch
  33-tcg-aarch64-Merge-tcg_out_callr-into-tcg_out_call.patch


r~


Mark Cave-Ayland (1):
  tcg: convert tcg/README to rst

Philippe Mathieu-Daudé (3):
  tcg/s390x: Fix coding style
  tcg: Convert typecode_to_ffi from array to function
  tcg: Factor init_ffi_layouts() out of tcg_context_init()

Richard Henderson (30):
  meson: Move CONFIG_TCG_INTERPRETER to config_host
  tcg: Cleanup trailing whitespace
  tcg: Fix tcg_reg_alloc_dup*
  tcg: Centralize updates to reg_to_temp
  tcg: Remove check_regs
  tcg: Tidy tcg_reg_alloc_op
  tcg: Introduce paired register allocation
  tcg: Remove TCG_TARGET_STACK_GROWSUP
  accel/tcg: Set cflags_next_tb in cpu_common_initfn
  target/sparc: Avoid TCGV_{LOW,HIGH}
  tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
  tcg: Add temp_subindex to TCGTemp
  tcg: Simplify calls to temp_sync vs mem_coherent
  tcg: Allocate TCGTemp pairs in host memory order
  tcg: Move TCG_TYPE_COUNT outside enum
  tcg: Introduce tcg_type_size
  tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
  tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with TCG_TARGET_CALL_ARG_I64
  tcg: Replace TCG_TARGET_EXTEND_ARGS with TCG_TARGET_CALL_ARG_I32
  tcg: Use TCG_CALL_ARG_EVEN for TCI special case
  accel/tcg/plugin: Don't search for the function pointer index
  accel/tcg/plugin: Avoid duplicate copy in copy_call
  accel/tcg/plugin: Use copy_op in append_{udata,mem}_cb
  tci: MAX_OPC_PARAM_IARGS is no longer used
  tcg: Vary the allocation size for TCGOp
  tcg: Use output_pref wrapper function
  tcg: Reorg function calls
  tcg: Move ffi_cif pointer into TCGHelperInfo
  tcg/aarch64: Merge tcg_out_callr into tcg_out_call
  tcg: Add TCGHelperInfo argument to tcg_out_call

 docs/devel/atomics.rst           |    2 +
 docs/devel/index-tcg.rst         |    1 +
 docs/devel/tcg-ops.rst           |  941 +++++++++++++++++
 docs/devel/tcg.rst               |    2 +-
 meson.build                      |    4 +-
 include/exec/helper-head.h       |    2 +-
 include/tcg/tcg-op.h             |   35 +-
 include/tcg/tcg.h                |   96 +-
 tcg/aarch64/tcg-target.h         |    4 +-
 tcg/arm/tcg-target.h             |    4 +-
 tcg/i386/tcg-target.h            |    2 +
 tcg/loongarch64/tcg-target.h     |    3 +-
 tcg/mips/tcg-target.h            |    4 +-
 tcg/riscv/tcg-target.h           |    7 +-
 tcg/s390x/tcg-target.h           |    3 +-
 tcg/sparc64/tcg-target.h         |    3 +-
 tcg/tcg-internal.h               |   58 +-
 tcg/tci/tcg-target.h             |    7 +
 accel/tcg/plugin-gen.c           |   54 +-
 hw/core/cpu-common.c             |    1 +
 target/sparc/translate.c         |   21 +-
 tcg/optimize.c                   |   10 +-
 tcg/tcg-op-vec.c                 |   10 +-
 tcg/tcg-op.c                     |   49 +-
 tcg/tcg.c                        | 1655 +++++++++++++++++++-----------
 tcg/tci.c                        |    1 -
 tcg/aarch64/tcg-target.c.inc     |   19 +-
 tcg/arm/tcg-target.c.inc         |   10 +-
 tcg/i386/tcg-target.c.inc        |    5 +-
 tcg/loongarch64/tcg-target.c.inc |    7 +-
 tcg/mips/tcg-target.c.inc        |    3 +-
 tcg/ppc/tcg-target.c.inc         |   36 +-
 tcg/riscv/tcg-target.c.inc       |    7 +-
 tcg/s390x/tcg-target.c.inc       |   32 +-
 tcg/sparc64/tcg-target.c.inc     |    3 +-
 tcg/tci/tcg-target.c.inc         |    7 +-
 tcg/README                       |  784 --------------
 37 files changed, 2259 insertions(+), 1633 deletions(-)
 create mode 100644 docs/devel/tcg-ops.rst
 delete mode 100644 tcg/README

-- 
2.34.1


