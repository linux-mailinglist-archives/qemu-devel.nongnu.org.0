Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E006064BE66
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:28:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cma-0000Z3-B6; Tue, 13 Dec 2022 16:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5CmY-0000Yr-Ed
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:46 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5CmW-00039x-Qp
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:46 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 y18-20020a0568301d9200b0067082cd4679so680397oti.4
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=1FLZ5z2Hvx6GbWBJaeUbXjHtWCO4hjHMCO2mm4pHT8I=;
 b=ugRZXVvUge1bvliRsrsQvKbEFY6lgJHG5mO+9oUdF3DmjXCoMpqOlXaqlJgTbNU1eH
 qskn1adK53Qn1FD8cxPKBk8zem/Zoh51zZTM5KWlU/EvzVbhmRYusTGhq9pA0WN8GGRO
 cC2aXbf8qvJGi9IGgt1Zc9d29G818/DWA9ZommPsPrWu3i3m1ipNkgYlWFpEpqo8wbOl
 28HUqvz4eLuF2BiJgrXkNcJRVv2tGQjRwLzlPiffUy+Mnlpa3N2wluXdncJRtsAazvRP
 NM3IZODIgLxENxCzu23mPrUi4LdGgZk0rrfP585S7uF+5jT/hnvUaUH18rF+dmgSQTV9
 0APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1FLZ5z2Hvx6GbWBJaeUbXjHtWCO4hjHMCO2mm4pHT8I=;
 b=DFxTAcZfVrESuxIQnUDzu5uK53ABW1IbJhv1kPSRpbw+WGDZyB/noYfIVyjZvOEfNy
 0+Snmj/ENkWQlt1S7GMNpqeU3rWuCa7BOvqe07hwYoSmjb8ELBQqqzrSVpC/YSb51Xuu
 P5HjrXrj1p8108PkH7QtQ65tQ/O6QOUUrTDP2KIXcJR3lUvqOZlXbe6219jjd41xWOwN
 befBtZDGPJsWFRj/G/YYI72W+1Lx0jilYjXsMWRrqUQjyE7a8vmpQFblQdgoWqY4y7/L
 A3Pp3qON8tuVAW/pmd2L5LYMRdYP7G+FfnLim/rBxupuWRL8LimkKyrofNiUhA2/+Jsj
 H2MQ==
X-Gm-Message-State: ANoB5pn9tyLLFehBbfZQ/+VY0y+QQjAf8e6tJR+1JmxwR8FLpP//iH0J
 Y3/Y7sW34/xEqQK3CSsqBY3q2JD34QMgQHmei5g=
X-Google-Smtp-Source: AA0mqf42Vrf6X0ExVC3oiDtsiduGO/3dOCorNDPJA/8yjnIFgJl5i7BHife3Tl8aS/rG75b+Oeuctg==
X-Received: by 2002:a9d:5f02:0:b0:66d:a5fa:5c54 with SMTP id
 f2-20020a9d5f02000000b0066da5fa5c54mr10257059oti.1.1670966743188; 
 Tue, 13 Dec 2022 13:25:43 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/27] tcg misc patches
Date: Tue, 13 Dec 2022 15:25:14 -0600
Message-Id: <20221213212541.1820840-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

For v4, I've sorted some of the reviewed patches to the beginning
of the queue and omitted them; this was not possible for all.
This set begins with the first patch that is missing review.
I've not tested this set separately, so in case it doesn't apply,
the entire tree is

  https://gitlab.com/rth7680/qemu/-/tree/tcg-next

Patches lacking review:
  01-tcg-Fix-tcg_reg_alloc_dup.patch
  02-tcg-Centralize-updates-to-reg_to_temp.patch
  03-tcg-Remove-check_regs.patch
  04-tcg-Introduce-paired-register-allocation.patch
  05-accel-tcg-Set-cflags_next_tb-in-cpu_common_initfn.patch
  06-target-sparc-Avoid-TCGV_-LOW-HIGH.patch
  09-tcg-Simplify-calls-to-temp_sync-vs-mem_coherent.patch
  17-accel-tcg-plugin-Don-t-search-for-the-function-po.patch
  20-tcg-Vary-the-allocation-size-for-TCGOp.patch
  22-tcg-Reorg-function-calls.patch
  23-tcg-Convert-typecode_to_ffi-from-array-to-functio.patch
  24-tcg-Factor-init_ffi_layouts-out-of-tcg_context_in.patch
  25-tcg-Move-ffi_cif-pointer-into-TCGHelperInfo.patch
  26-tcg-aarch64-Merge-tcg_out_callr-into-tcg_out_call.patch


r~


Philippe Mathieu-Daudé (2):
  tcg: Convert typecode_to_ffi from array to function
  tcg: Factor init_ffi_layouts() out of tcg_context_init()

Richard Henderson (25):
  tcg: Fix tcg_reg_alloc_dup*
  tcg: Centralize updates to reg_to_temp
  tcg: Remove check_regs
  tcg: Introduce paired register allocation
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
  tcg: Vary the allocation size for TCGOp
  tcg: Use output_pref wrapper function
  tcg: Reorg function calls
  tcg: Move ffi_cif pointer into TCGHelperInfo
  tcg/aarch64: Merge tcg_out_callr into tcg_out_call
  tcg: Add TCGHelperInfo argument to tcg_out_call

 include/exec/helper-head.h       |    2 +-
 include/tcg/tcg-op.h             |   35 +-
 include/tcg/tcg.h                |   96 +-
 tcg/aarch64/tcg-target.h         |    3 +-
 tcg/arm/tcg-target.h             |    3 +-
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
 tcg/tcg.c                        | 1591 +++++++++++++++++++-----------
 tcg/aarch64/tcg-target.c.inc     |   19 +-
 tcg/arm/tcg-target.c.inc         |   10 +-
 tcg/i386/tcg-target.c.inc        |    5 +-
 tcg/loongarch64/tcg-target.c.inc |    7 +-
 tcg/mips/tcg-target.c.inc        |    3 +-
 tcg/ppc/tcg-target.c.inc         |   34 +-
 tcg/riscv/tcg-target.c.inc       |    7 +-
 tcg/s390x/tcg-target.c.inc       |   12 +-
 tcg/sparc64/tcg-target.c.inc     |    3 +-
 tcg/tci/tcg-target.c.inc         |    3 +-
 30 files changed, 1285 insertions(+), 780 deletions(-)

-- 
2.34.1


