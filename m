Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80E62554B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOf5-00063c-5s; Fri, 11 Nov 2022 02:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOf2-00063I-L8
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:13 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOez-0007UR-M6
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:12 -0500
Received: by mail-pf1-x42a.google.com with SMTP id b29so4205544pfp.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=vBGIJWW2AGgQuMegg1njMuYQmdOCeqraoTElqm5NQfU=;
 b=S08bIyjVsBTg7EYZw10EcFH483hrB0QtIrvBAzkYNx892O0rLpQVZSpzFPeN7cGt5f
 1iQXApNKC6W4ysoKt86eZLt32qbZiCINbzHrliZU51iLD4eeLP8ulUpDoLOXY+8/PUd1
 Nv03lXvfg2NI/qos7wEQMFkBaXcQEFgwbeEYBsOmWf5G95j3mi5pWxMwXPzQJwidO5Tg
 4BtGwHqEm9k0PWHfy2MUe0+m1CjZYyIXNi7Gku+1qx2NMOKpJOH130ULdFK4uGXfJRSR
 S9MOZsPbkTsi/pMF7z4RKjNRHlz4mfRr7cBsIltmcEGAZNKeTH0VsmeIxyT5s8tRU8vb
 oXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vBGIJWW2AGgQuMegg1njMuYQmdOCeqraoTElqm5NQfU=;
 b=djkbEvzmilUgS+zvsRevc0Wd51PYRRlr3jFFTS4JWH927NHUvFoNaorpotbrBuu7hE
 fczEBzpDcreTveTmfx3+yTWFFIVonkPkuSzgyHUcLAu6bMjysPfSxDxOKvDQf3GS0W4H
 0oY65p5emLO4GlDXeUXBr/3GdpOj+sNsKUSEb0C2NnBBlNDHDZUMip7as0i428jF2MHl
 MfHUcUx46rCaX+FOvqxGBdFAdo8BvmBt5vA/GgHXLaZXXNzPwsAr7B7xlCCf/7piJfje
 UWpCyyJWJVkhT5+co7bbVH1G8WdVZOTe+Cutn6uLY03qzp3iDlNr9EkXU3Bsdkh9C+SV
 2+iw==
X-Gm-Message-State: ANoB5pkQ+fvNbKXS6B88iNPrgUFiQo8DQawzMaHhxmczVv+lCWCQd5/g
 TXACmqHrCLuN5nThh8zjk7dK7niOQqNPxVDo
X-Google-Smtp-Source: AA0mqf6SgvPeoXWDHuCF7V0Zssgw35ePELdtT7MYhxyJ+Xf3HHqtX+nYLQWlNssbjhSn/lk0mQH4jg==
X-Received: by 2002:a63:e742:0:b0:460:aa47:280a with SMTP id
 j2-20020a63e742000000b00460aa47280amr632181pgk.188.1668152467388; 
 Thu, 10 Nov 2022 23:41:07 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 00/45] tcg: Support for Int128 with helpers
Date: Fri, 11 Nov 2022 17:40:16 +1000
Message-Id: <20221111074101.2069454-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

This is working toward improving atomicity within TCG, especially
with respect to Arm FEAT_LSE2, which guarantees that any operation
that does not cross a 16-byte boundary is treated atomically.

(Incidentally, I've also stumbled across language in the Intel SDM
that shows the feature is required there too, and the guarantee is
even bigger -- anything that does not cross a cache line boundary.
Given that we've only ever got 16-byte atomic operations on other
hosts, there's no chance of supporting full cache line generically.
But we could turn on the same "within 16" atomicity that will be
used for FEAT_LSE2.)

That goal is somewhat down the road.  This patch set contains two
items: paired register allocation and TCGv_i128 usage with helpers.

The next step will be putting these two together to provide atomic
128-bit load/store operations within TCG.  Via, e.g. AArch64 LDP,
Power7 LDQ, or S390x LPQ -- all of which require allocating a pair
of registers.  (Intel will require that I go through AVX, which is
a bit of a complication, but I'll figure that out.)  And then of
course separately via the helpers used by the slow path.

Patches for target/ to use and test this to follow.

Changes for v3:
  * Testing showed that trying to make things "easier" for the
    register allocator on 32-bit hosts by keeping TCGv_i128 as
    a blob was a mistake.  Now split to 4 parts, similar to
    how we treat TCGv_i64 as 2 parts.
  * Fallout from the above is that we now have to support more
    than 14 call arguments, which meant expanding TCGOp.
    Now allocated variable sized, using only the nubmer of
    operands required.  This could in fact result in less memory
    usage on average, but haven't collected any numbers.
  * Implement (non-atomic) load/store on TCGv_i128, which gives
    some of the helpers required for...
  * Implement tcg_gen_atomic_cmpxchg_i128, which will eliminate
    the primary source of 128-bit hacks/ifdefs in target/.

Changes for v2:
  * Fixes and r-b (philmd).
  * Include i386 atomic16 patch, which avoids minor conflicts later.
  * Split a few larger patches.
  * Bug fixes for TCI.


r~


Richard Henderson (45):
  meson: Move CONFIG_TCG_INTERPRETER to config_host
  tcg: Tidy tcg_reg_alloc_op
  tcg: Introduce paired register allocation
  tcg/s390x: Use register pair allocation for div and mulu2
  tcg/arm: Use register pair allocation for qemu_{ld,st}_i64
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
  tcg: Define TCG_TYPE_I128 and related helper macros
  tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,ARG}_NORMAL
  tcg: Allocate objects contiguously in temp_allocate_frame
  tcg: Introduce tcg_out_addi_ptr
  tcg: Add TCG_CALL_{RET,ARG}_BY_REF
  tcg: Introduce tcg_target_call_oarg_reg
  tcg: Add TCG_CALL_RET_BY_VEC
  include/qemu/int128: Use Int128 structure for TCI
  tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
  tcg/tci: Fix big-endian return register ordering
  tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
  tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
  tcg: Add temp allocation for TCGv_i128
  tcg: Add basic data movement for TCGv_i128
  tcg: Add guest load/store primitives for TCGv_i128
  tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
  tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}

 accel/tcg/tcg-runtime.h          |   11 +
 include/exec/cpu_ldst.h          |   10 +
 include/exec/helper-head.h       |    9 +-
 include/qemu/atomic128.h         |   29 +-
 include/qemu/int128.h            |   25 +-
 include/tcg/tcg-op.h             |   50 +-
 include/tcg/tcg.h                |  145 ++-
 tcg/aarch64/tcg-target.h         |    6 +-
 tcg/arm/tcg-target-con-set.h     |    7 +-
 tcg/arm/tcg-target-con-str.h     |    2 +
 tcg/arm/tcg-target.h             |    6 +-
 tcg/i386/tcg-target.h            |   12 +
 tcg/loongarch64/tcg-target.h     |    5 +-
 tcg/mips/tcg-target.h            |    6 +-
 tcg/riscv/tcg-target.h           |   10 +-
 tcg/s390x/tcg-target-con-set.h   |    4 +-
 tcg/s390x/tcg-target-con-str.h   |    8 +-
 tcg/s390x/tcg-target.h           |    5 +-
 tcg/sparc64/tcg-target.h         |    5 +-
 tcg/tcg-internal.h               |   75 +-
 tcg/tci/tcg-target.h             |   10 +
 accel/tcg/cputlb.c               |  112 ++
 accel/tcg/plugin-gen.c           |   54 +-
 accel/tcg/user-exec.c            |   66 ++
 hw/core/cpu-common.c             |    1 +
 target/sparc/translate.c         |   21 +-
 tcg/optimize.c                   |   10 +-
 tcg/tcg-op-vec.c                 |   10 +-
 tcg/tcg-op.c                     |  442 ++++++--
 tcg/tcg.c                        | 1679 +++++++++++++++++++++---------
 tcg/tci.c                        |   66 +-
 util/int128.c                    |   42 +
 accel/tcg/atomic_common.c.inc    |   45 +
 meson.build                      |    4 +-
 tcg/aarch64/tcg-target.c.inc     |   36 +-
 tcg/arm/tcg-target.c.inc         |   68 +-
 tcg/i386/tcg-target.c.inc        |   57 +-
 tcg/loongarch64/tcg-target.c.inc |   24 +-
 tcg/mips/tcg-target.c.inc        |   20 +-
 tcg/ppc/tcg-target.c.inc         |   56 +-
 tcg/riscv/tcg-target.c.inc       |   24 +-
 tcg/s390x/tcg-target.c.inc       |   71 +-
 tcg/sparc64/tcg-target.c.inc     |   22 +-
 tcg/tci/tcg-target.c.inc         |   36 +-
 44 files changed, 2506 insertions(+), 900 deletions(-)

-- 
2.34.1


