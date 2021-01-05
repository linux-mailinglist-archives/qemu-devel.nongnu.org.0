Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7562EB17D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:37:53 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqHI-0006VS-5M
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:37:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq05-0002Dc-Ge
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:05 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq00-0006QR-6t
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:05 -0500
Received: by mail-pj1-x1035.google.com with SMTP id m5so10706pjv.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FpZTomEGCGNDKmcVGSAjfQbvjaXGQOC5HT6xGAjGLfI=;
 b=g1+jRzRTeHuRUBpno17ZgDkTQHUsXe11LlwZZwBqgFWSSOhIcknaQa1sUnEL0yzpX0
 dmQV+k+zUkCEIxE2W8wUWcnkcL7qOEW8+eJGl19+K+KqFDuJHPH9GfHMrDXpulSsENQN
 Tgy00NL6lZ3BwtL0UP+y9KBxGMTmo7vDp/ZKKiRhqHyQnZTU/UoL4NNfHdqZoHHPyfi3
 c6oEyNnRf+ROgK33K8e3HDCxqupttoi5BEd9IDqHq0UBgtBJBGI+BnybG3OtC3nArOLM
 xyu1I/AFkc3JNPNLz3gr9bdgQCc0KMzsPbxHe7k3a5LYpaB0Mghe6sBuBLhCVvMRag1P
 Agsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FpZTomEGCGNDKmcVGSAjfQbvjaXGQOC5HT6xGAjGLfI=;
 b=pQgSwGowAtFt/svi7nXqu1w8qTaIGqp5E6fJ0cpX5jMKTmRHx0/wFkk/zMO8RbAZ9K
 mKa/0ZTgFZEc22lZ/7nX1kmxoswcXGz3o6A8XFQJkVs76xlRL1X3nEwdZJFv34D/BAb8
 DfCIPTWTMxPfDYnCyS19x9aNQP89nqrNgPMZAAEQy/fUw7tcC5Wrx6o6q+jClHXX5t73
 BGALXe2+PIjjUl8OXkj3uEWNmt4hOgMVg+FcDuTWoAmvdTkm9JXuvbTguHF8ACt09Fmm
 kE83OeNm8iS7tt0091FPi9O4NxOnpQW12ds2nu4+78cXtfXVAqwJ1Ef7a6pIdqlAvHTi
 nyug==
X-Gm-Message-State: AOAM530KfD1N4w9x8DopUxVYOl/OI6DJFBt7/0LtAQdDhNeihHjxJ749
 wpWN3N0z6GgfA8dZQ27pEvyXhnD9moUlog==
X-Google-Smtp-Source: ABdhPJwGFeJAnJayxUwkNbCk9nT+n5HbvVN6He+bNHD2bbm4R0FKptFxBc7fY7d3rHrr4KfkdNT6tw==
X-Received: by 2002:a17:902:7489:b029:da:5aed:8ebf with SMTP id
 h9-20020a1709027489b02900da5aed8ebfmr235242pll.35.1609867198276; 
 Tue, 05 Jan 2021 09:19:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:19:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/43] Mirror map JIT memory for TCG
Date: Tue,  5 Jan 2021 07:19:07 -1000
Message-Id: <20210105171950.415486-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v5:
  * Protect MAP_JIT with !splitwx.
  * Improve comments for in_code_gen_buffer.
  * Update qemu-options.hx.

Thanks to Joelle for all of the reviews on v4.
The patches still without review are:

17-tcg-Add-accel-tcg-split-wx-property.patch
27-tcg-ppc-Use-tcg_tbrel_diff.patch
28-tcg-ppc-Use-tcg_out_mem_long-to-reset-TCG_REG_TB.patch
29-tcg-ppc-Support-split-wx-code-generation.patch
30-tcg-sparc-Use-tcg_tbrel_diff.patch
31-tcg-sparc-Support-split-wx-code-generation.patch
32-tcg-s390-Use-tcg_tbrel_diff.patch
33-tcg-s390-Support-split-wx-code-generation.patch
37-accel-tcg-Add-mips-support-to-alloc_code_gen_buff.patch
38-tcg-mips-Do-not-assert-on-relocation-overflow.patch
39-tcg-mips-Support-split-wx-code-generation.patch
40-tcg-arm-Support-split-wx-code-generation.patch

I'll be happy with even a glance and an Acked-by across some of
these non-x86 tcg backends, just to see if I've done something
obviously wrong.


r~


Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Joelle van Dyne <j@getutm.app>

Richard Henderson (43):
  tcg: Do not flush icache for interpreter
  util: Extract flush_icache_range to cacheflush.c
  util: Enhance flush_icache_range with separate data pointer
  util: Specialize flush_idcache_range for aarch64
  tcg: Move tcg prologue pointer out of TCGContext
  tcg: Move tcg epilogue pointer out of TCGContext
  tcg: Add in_code_gen_buffer
  tcg: Introduce tcg_splitwx_to_{rx,rw}
  tcg: Adjust TCGLabel for const
  tcg: Adjust tcg_out_call for const
  tcg: Adjust tcg_out_label for const
  tcg: Adjust tcg_register_jit for const
  tcg: Adjust tb_target_set_jmp_target for split-wx
  tcg: Make DisasContextBase.tb const
  tcg: Make tb arg to synchronize_from_tb const
  tcg: Use Error with alloc_code_gen_buffer
  tcg: Add --accel tcg,split-wx property
  accel/tcg: Support split-wx for linux with memfd
  accel/tcg: Support split-wx for darwin/iOS with vm_remap
  tcg: Return the TB pointer from the rx region from exit_tb
  tcg/i386: Support split-wx code generation
  tcg/aarch64: Use B not BL for tcg_out_goto_long
  tcg/aarch64: Support split-wx code generation
  disas: Push const down through host disassembly
  tcg/tci: Push const down through bytecode reading
  tcg: Introduce tcg_tbrel_diff
  tcg/ppc: Use tcg_tbrel_diff
  tcg/ppc: Use tcg_out_mem_long to reset TCG_REG_TB
  tcg/ppc: Support split-wx code generation
  tcg/sparc: Use tcg_tbrel_diff
  tcg/sparc: Support split-wx code generation
  tcg/s390: Use tcg_tbrel_diff
  tcg/s390: Support split-wx code generation
  tcg/riscv: Fix branch range checks
  tcg/riscv: Remove branch-over-branch fallback
  tcg/riscv: Support split-wx code generation
  accel/tcg: Add mips support to alloc_code_gen_buffer_splitwx_memfd
  tcg/mips: Do not assert on relocation overflow
  tcg/mips: Support split-wx code generation
  tcg/arm: Support split-wx code generation
  tcg: Remove TCG_TARGET_SUPPORT_MIRROR
  tcg: Constify tcg_code_gen_epilogue
  tcg: Constify TCGLabelQemuLdst.raddr

 accel/tcg/tcg-runtime.h      |   2 +-
 include/disas/dis-asm.h      |   4 +-
 include/disas/disas.h        |   2 +-
 include/exec/exec-all.h      |   2 +-
 include/exec/gen-icount.h    |   4 +-
 include/exec/log.h           |   2 +-
 include/exec/translator.h    |   2 +-
 include/hw/core/cpu.h        |   3 +-
 include/qemu/cacheflush.h    |  35 ++++
 include/sysemu/tcg.h         |   3 +-
 include/tcg/tcg-op.h         |   2 +-
 include/tcg/tcg.h            |  61 +++++--
 tcg/aarch64/tcg-target.h     |   7 +-
 tcg/arm/tcg-target.h         |   7 +-
 tcg/i386/tcg-target.h        |  10 +-
 tcg/mips/tcg-target.h        |  13 +-
 tcg/ppc/tcg-target.h         |   3 +-
 tcg/riscv/tcg-target.h       |   7 +-
 tcg/s390/tcg-target.h        |  12 +-
 tcg/sparc/tcg-target.h       |  10 +-
 tcg/tci/tcg-target.h         |  10 +-
 accel/tcg/cpu-exec.c         |  41 +++--
 accel/tcg/tcg-all.c          |  26 ++-
 accel/tcg/tcg-runtime.c      |   4 +-
 accel/tcg/translate-all.c    | 311 +++++++++++++++++++++++++++--------
 accel/tcg/translator.c       |   4 +-
 bsd-user/main.c              |   2 +-
 disas.c                      |   2 +-
 disas/capstone.c             |   2 +-
 linux-user/main.c            |   2 +-
 softmmu/physmem.c            |   3 +-
 target/arm/cpu.c             |   3 +-
 target/arm/translate-a64.c   |   2 +-
 target/avr/cpu.c             |   3 +-
 target/hppa/cpu.c            |   3 +-
 target/i386/tcg/tcg-cpu.c    |   3 +-
 target/microblaze/cpu.c      |   3 +-
 target/mips/cpu.c            |   3 +-
 target/riscv/cpu.c           |   3 +-
 target/rx/cpu.c              |   3 +-
 target/sh4/cpu.c             |   3 +-
 target/sparc/cpu.c           |   3 +-
 target/tricore/cpu.c         |   2 +-
 tcg/tcg-op.c                 |  15 +-
 tcg/tcg.c                    |  91 ++++++++--
 tcg/tci.c                    |  60 ++++---
 util/cacheflush.c            | 146 ++++++++++++++++
 util/cacheinfo.c             |   8 +-
 tcg/aarch64/tcg-target.c.inc |  75 +++++----
 tcg/arm/tcg-target.c.inc     |  41 ++---
 tcg/i386/tcg-target.c.inc    |  36 ++--
 tcg/mips/tcg-target.c.inc    |  97 +++++------
 tcg/ppc/tcg-target.c.inc     | 110 ++++++-------
 tcg/riscv/tcg-target.c.inc   | 125 +++++---------
 tcg/s390/tcg-target.c.inc    |  91 +++++-----
 tcg/sparc/tcg-target.c.inc   |  58 +++----
 tcg/tcg-ldst.c.inc           |   2 +-
 tcg/tcg-pool.c.inc           |   6 +-
 tcg/tci/tcg-target.c.inc     |   2 +-
 MAINTAINERS                  |   2 +
 accel/tcg/trace-events       |   2 +-
 qemu-options.hx              |   7 +
 util/meson.build             |   2 +-
 63 files changed, 1017 insertions(+), 591 deletions(-)
 create mode 100644 include/qemu/cacheflush.h
 create mode 100644 util/cacheflush.c

-- 
2.25.1


