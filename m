Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22D698AC0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUT0-0003No-MM; Wed, 15 Feb 2023 21:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSw-0003NK-Ka
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:46 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUSu-0005Pn-D5
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:57:46 -0500
Received: by mail-pg1-x544.google.com with SMTP id a23so396097pga.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xvJ4NeWVJ610aX54/Bzy6QPno51JAnAfAKXTPACuCbU=;
 b=pVPmd7Dk9YamlVeC8Mk/AwasfhfGmgFTYgO5qHWEpjzCQGLqeo/0FcDxRMDY6Nzwrh
 sFet/9+CnoeG/bEh0HKDuUVVgTj7F7Q+DKDwNKjPpKhOtsfXm35vla4Z19Pm3HZpFc76
 nn2B++OpENWMc5TzwD929N/UVMIhYhANp5L00MRneAMFnNhszY4SbG6XI81vMQMFvYBH
 zPfv9iwiWG/Jq6BikXaetoG3qCWP1UL0b7SeMpIg6+P9IlOSDBQ5/gTQriL9RCLKl08P
 5D9scCeuWErXj2xVSIlWUcWxb9xZ27QD+SPqyvqRElNcdfkFWXLKRnj3TGw22JimBNjf
 oeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xvJ4NeWVJ610aX54/Bzy6QPno51JAnAfAKXTPACuCbU=;
 b=0vJ7kfTvE8xa/XMJi+OM2jajBC4TKx5htbJ/1jPUp+CNuE+9xJsWW7QRwrULnBN6ZL
 RufLAbkdj47cwHXUDUxWZIBk9YjRMiPWAInvtNrsBTdmBGBRXClHyytN6uUQZJMwXSVI
 mH9/If5/bzGaOnPhb1d5hbDfEZ98dfzT05fmnpcBsy+90doGddquLhOwrIqiwrTrNaaa
 wRQzudSashU3Be8a9koPmAFWM/QRBsl3Vxg11spshjbxQRr013AlHePdp0XJlci6KhRr
 EjyOmy7ZJHF7skT7GQjASvASHNYgzWnvdF3PHZVq8rtuvBsgrAULHis+TlhH6R+XYvMZ
 6ZOg==
X-Gm-Message-State: AO0yUKUO9iHnt3KJnNXR6iaD5lIfbcG1NvB9IFE3/8bOl+jPBReAY9ts
 nwnKzxxt7lyEfYyD5tq3fzGrZQy/ABDdbgLo/+XAlQ==
X-Google-Smtp-Source: AK7set/6en6khUiObOVcpFyQG+f+Mv/q5AJsvcgYwaRPldRfl9W5wEzfvj5aX0jncD0uXQFxR6W4tg==
X-Received: by 2002:a62:64d1:0:b0:5a8:bec0:d6d9 with SMTP id
 y200-20020a6264d1000000b005a8bec0d6d9mr4236609pfb.30.1676516262664; 
 Wed, 15 Feb 2023 18:57:42 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.57.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:57:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/30] tcg: Improve atomicity support
Date: Wed, 15 Feb 2023 16:57:09 -1000
Message-Id: <20230216025739.1211680-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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

Version 1 was back in November:
https://lore.kernel.org/qemu-devel/20221118094754.242910-1-richard.henderson@linaro.org/

Prerequisites, and there were many, are now upstream.
Changes are too many to mention.  But at least I've fixed
the clang and darwin build problems Phil reported.

The main objective here is to support Arm FEAT_LSE2, which says that any
single memory access that does not cross a 16-byte boundary is atomic.
This is the MO_ATOM_WITHIN16 control.

While I'm touching all of this, a secondary objective is to handle the
atomicity of the IBM machines.  Both Power and s390x treat misaligned
accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
ptr % 4 == 2 will appear as four 3-byte accesses.
This is the MO_ATOM_SUBALIGN control.

By default, acceses are atomic only if aligned, which is the current
behaviour of the tcg code generator (mostly, anyway, there were bugs).
This is the MO_ATOM_IFALIGN control.

Further, one can say that a large memory access is really a set of
contiguous smaller accesses, and we need not provide more atomicity
than that (modulo MO_ATOM_WITHIN16).  This is the MO_ATMAX_* control.

While I've had a go at documenting all of this, I'm certain it could
be improved -- soliciting suggestions.


r~


Richard Henderson (30):
  include/qemu/cpuid: Introduce xgetbv_low
  include/exec/memop: Add bits describing atomicity
  accel/tcg: Add cpu_in_serial_context
  accel/tcg: Introduce tlb_read_idx
  accel/tcg: Reorg system mode load helpers
  accel/tcg: Reorg system mode store helpers
  accel/tcg: Honor atomicity of loads
  accel/tcg: Honor atomicity of stores
  tcg/tci: Use cpu_{ld,st}_mmu
  tcg: Unify helper_{be,le}_{ld,st}*
  accel/tcg: Implement helper_{ld,st}*_mmu for user-only
  tcg: Add 128-bit guest memory primitives
  meson: Detect atomic128 support with optimization
  tcg/i386: Add have_atomic16
  accel/tcg: Use have_atomic16 in ldst_atomicity.c.inc
  accel/tcg: Add aarch64 specific support in ldst_atomicity
  tcg/aarch64: Detect have_lse, have_lse2 for linux
  tcg/aarch64: Detect have_lse, have_lse2 for darwin
  accel/tcg: Add have_lse2 support in ldst_atomicity
  tcg: Introduce TCG_OPF_TYPE_MASK
  tcg: Add INDEX_op_qemu_{ld,st}_i128
  tcg/i386: Introduce tcg_out_mov2
  tcg/i386: Introduce tcg_out_testi
  tcg/i386: Use full load/store helpers in user-only mode
  tcg/i386: Replace is64 with type in qemu_ld/st routines
  tcg/i386: Mark Win64 call-saved vector regs as reserved
  tcg/i386: Examine MemOp for atomicity and alignment
  tcg/i386: Support 128-bit load/store with have_atomic16
  tcg/i386: Add vex_v argument to tcg_out_vex_modrm_pool
  tcg/i386: Honor 64-bit atomicity in 32-bit mode

 docs/devel/loads-stores.rst      |   36 +-
 docs/devel/tcg-ops.rst           |   11 +-
 meson.build                      |   52 +-
 accel/tcg/internal.h             |    5 +
 accel/tcg/tcg-runtime.h          |    3 +
 include/exec/cpu-defs.h          |    7 +-
 include/exec/cpu_ldst.h          |   26 +-
 include/exec/memop.h             |   36 +
 include/qemu/cpuid.h             |   25 +
 include/tcg/tcg-ldst.h           |   70 +-
 include/tcg/tcg-opc.h            |    8 +
 include/tcg/tcg.h                |   22 +-
 tcg/aarch64/tcg-target.h         |    5 +
 tcg/arm/tcg-target.h             |    2 +
 tcg/i386/tcg-target.h            |    4 +
 tcg/loongarch64/tcg-target.h     |    1 +
 tcg/mips/tcg-target.h            |    2 +
 tcg/ppc/tcg-target.h             |    2 +
 tcg/riscv/tcg-target.h           |    2 +
 tcg/s390x/tcg-target.h           |    2 +
 tcg/sparc64/tcg-target.h         |    2 +
 tcg/tci/tcg-target.h             |    2 +
 accel/tcg/cpu-exec-common.c      |    3 +
 accel/tcg/cputlb.c               | 1767 ++++++++++++++++++------------
 accel/tcg/tb-maint.c             |    2 +-
 accel/tcg/user-exec.c            |  478 +++++---
 tcg/optimize.c                   |   15 +-
 tcg/tcg-op.c                     |  246 +++--
 tcg/tcg.c                        |    8 +-
 tcg/tci.c                        |  127 +--
 util/bufferiszero.c              |    3 +-
 accel/tcg/ldst_atomicity.c.inc   | 1370 +++++++++++++++++++++++
 tcg/aarch64/tcg-target.c.inc     |   87 +-
 tcg/arm/tcg-target.c.inc         |   45 +-
 tcg/i386/tcg-target.c.inc        | 1228 ++++++++++++++-------
 tcg/loongarch64/tcg-target.c.inc |   25 +-
 tcg/mips/tcg-target.c.inc        |   40 +-
 tcg/ppc/tcg-target.c.inc         |   30 +-
 tcg/riscv/tcg-target.c.inc       |   51 +-
 tcg/s390x/tcg-target.c.inc       |   38 +-
 tcg/sparc64/tcg-target.c.inc     |   37 +-
 tcg/tci/tcg-target.c.inc         |    3 +-
 42 files changed, 4236 insertions(+), 1692 deletions(-)
 create mode 100644 accel/tcg/ldst_atomicity.c.inc

-- 
2.34.1


