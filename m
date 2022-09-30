Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C285C5F14DC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:29:39 +0200 (CEST)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNZi-0002sV-Ch
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWg-0005t3-2l
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:30 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWe-0005Mx-Am
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:29 -0400
Received: by mail-qk1-x72b.google.com with SMTP id x18so3609322qkn.6
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=L5ZJM5S5TI9rdZ43cJv1bMuJBrs+6bSNi/2kqSiX1/c=;
 b=uOpxaB9vPkPCGH+7f0RlzsWeIV9MYy38p+LQQAm8HOaLAUvDP0yNjcb7rJSBxDJERD
 Px7JA8TzU+nXHd1BCRCGIfL3T+dVvitXDzNSd1F+qOH6BhLgQq4Qv7CNV/lIiPcL+M9i
 u3T0IrZT+TJTzFHETZsYoumIiQt5kGeuLJL6IM9VMLwnTQ0fJsTFrUdoiKaGFLYFqQj/
 63A6JfKUABn8zdE3YaznwliIWXtLWeyf/UzT+DOHVjdeJFrAej/IRH/XwFI78JjJK/U0
 HGdVIVNrkF9paRlZR6ccTo5BkccuuQ0386ZivJwh/kIJzWPHpRd/BlzOck3qWNkk/Zdx
 5/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=L5ZJM5S5TI9rdZ43cJv1bMuJBrs+6bSNi/2kqSiX1/c=;
 b=uW+NLbzDCoi2itpRugLDyAaZZ1MWC48vMvV4VpNpkIwUH8sATVkEyTmlXvNh4+QS+9
 DRNaAxM7zB13hVvKzlXRMoi/V5i5/eJKVziH6giXrSCZq8fQG3UQqI+uTvpaAhlvCfkF
 HkqDGvJl61LKlDI4kfvERz6iTnvZoVYYPGKpPueIUr5LSgoM0/w9DByaN+k7ZzA2SxCW
 Mx6mCgVVb2b2DMjrIHQhH+y2b+6ScoO4eCPWax0yOTmCjzL70/DAGTZQNf5t4xHg8O08
 P/dHgsAi7zdSp9yq3pWDVedo/hji2ZKnyPCNRV6FmIggxeX/DPQOh+JHxxQRzPR5ftEg
 Kfcw==
X-Gm-Message-State: ACrzQf0G+y4WzEMOEE6kmUUparXIdD1ztkywXKGgaL3nDDX2fSWSqR3a
 PWNWZXQdGrFC8sWWim8NUpR0HxgKZxvuMA==
X-Google-Smtp-Source: AMsMyM5nr5e+ZDTTXB2eXgMDC8dCWjNWUG+WABZhlrvwhdIMltYPMv+smYSEfpyF15SGp11xxkQaEQ==
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id
 ea10-20020a05620a488a00b006ce5caa37d1mr7468012qkb.37.1664573187231; 
 Fri, 30 Sep 2022 14:26:27 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org,
	alex.bennee@linux.org
Subject: [PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL
Date: Fri, 30 Sep 2022 14:26:04 -0700
Message-Id: <20220930212622.108363-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v6:
  * CPUTLBEntryFull is now completely reviewed.

  * Incorporated the CPUClass caching patches,
    as I will add a new use of the cached value.

  * Move CPUJumpCache out of include/hw/core.h.  While looking at
    Alex's review of the patch, I realized that adding the virtual
    pc value unconditionally would consume 64kB per cpu on targets
    that do not require it.  Further, making it dynamically allocated
    (a consequence of core.h not having the structure definition to
    add to CPUState), means that we save 64kB per cpu when running
    with hardware virtualization (kvm, xen, etc).

  * Add CPUClass.get_pc, so that we can always use or filter on the
    virtual address when logging.

Patches needing review:

  13-accel-tcg-Do-not-align-tb-page_addr-0.patch
  14-accel-tcg-Inline-tb_flush_jmp_cache.patch (new)
  16-hw-core-Add-CPUClass.get_pc.patch (new)
  17-accel-tcg-Introduce-tb_pc-and-log_pc.patch (mostly new)
  18-accel-tcg-Introduce-TARGET_TB_PCREL.patch


r~


Alex Bennée (3):
  cpu: cache CPUClass in CPUState for hot code paths
  hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
  cputlb: used cached CPUClass in our hot-paths

Richard Henderson (15):
  accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
  accel/tcg: Drop addr member from SavedIOTLB
  accel/tcg: Suppress auto-invalidate in probe_access_internal
  accel/tcg: Introduce probe_access_full
  accel/tcg: Introduce tlb_set_page_full
  include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
  accel/tcg: Remove PageDesc code_bitmap
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start
  accel/tcg: Do not align tb->page_addr[0]
  accel/tcg: Inline tb_flush_jmp_cache
  include/hw/core: Create struct CPUJumpCache
  hw/core: Add CPUClass.get_pc
  accel/tcg: Introduce tb_pc and log_pc
  accel/tcg: Introduce TARGET_TB_PCREL

 accel/tcg/internal.h                    |  10 +
 accel/tcg/tb-hash.h                     |   1 +
 accel/tcg/tb-jmp-cache.h                |  29 +++
 include/exec/cpu-common.h               |   1 +
 include/exec/cpu-defs.h                 |  48 ++++-
 include/exec/exec-all.h                 |  75 ++++++-
 include/exec/plugin-gen.h               |   7 +-
 include/hw/core/cpu.h                   |  28 ++-
 include/qemu/typedefs.h                 |   1 +
 include/tcg/tcg.h                       |   2 +-
 accel/tcg/cpu-exec.c                    | 122 +++++++----
 accel/tcg/cputlb.c                      | 259 ++++++++++++++----------
 accel/tcg/plugin-gen.c                  |  22 +-
 accel/tcg/translate-all.c               | 200 ++++++++----------
 accel/tcg/translator.c                  |   2 +-
 cpu.c                                   |   9 +-
 hw/core/cpu-common.c                    |   3 +-
 hw/core/cpu-sysemu.c                    |   5 +-
 plugins/core.c                          |   2 +-
 target/alpha/cpu.c                      |   9 +
 target/arm/cpu.c                        |  17 +-
 target/arm/mte_helper.c                 |  14 +-
 target/arm/sve_helper.c                 |   4 +-
 target/arm/translate-a64.c              |   2 +-
 target/avr/cpu.c                        |  10 +-
 target/cris/cpu.c                       |   8 +
 target/hexagon/cpu.c                    |  10 +-
 target/hppa/cpu.c                       |  12 +-
 target/i386/cpu.c                       |   9 +
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/loongarch/cpu.c                  |  11 +-
 target/m68k/cpu.c                       |   8 +
 target/microblaze/cpu.c                 |  10 +-
 target/mips/cpu.c                       |   8 +
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/nios2/cpu.c                      |   9 +
 target/openrisc/cpu.c                   |  10 +-
 target/ppc/cpu_init.c                   |   8 +
 target/riscv/cpu.c                      |  17 +-
 target/rx/cpu.c                         |  10 +-
 target/s390x/cpu.c                      |   8 +
 target/s390x/tcg/mem_helper.c           |   4 -
 target/sh4/cpu.c                        |  12 +-
 target/sparc/cpu.c                      |  10 +-
 target/tricore/cpu.c                    |  11 +-
 target/xtensa/cpu.c                     |   8 +
 tcg/tcg.c                               |   8 +-
 trace/control-target.c                  |   2 +-
 49 files changed, 723 insertions(+), 358 deletions(-)
 create mode 100644 accel/tcg/tb-jmp-cache.h

-- 
2.34.1


