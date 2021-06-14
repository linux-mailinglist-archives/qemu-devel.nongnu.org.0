Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579203A5B4F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 03:21:42 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsbIK-0006UC-Sp
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 21:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsbHM-0005iu-Df
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 21:20:40 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsbHH-0006nZ-T1
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 21:20:40 -0400
Received: by mail-pl1-x629.google.com with SMTP id v13so5698353ple.9
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 18:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfq9ahxtPWumPFUA7GxsNTNfOq8eJnxJvP1+ExRJxfQ=;
 b=q7rqLPjXqMgcrE0piHL5sG5B7rN21ytSviwcBvse3kx5HAvzaFw99YRToM33U2NbAM
 4bEXtSPmJkYGt2o/pgljna/SaD/ODk+Y9OKhViyrcvaTq8dDmc2JDnLapIaz6gCa2NWa
 NVfxpoZiw5/WNhBZC77QAx3+MkIgz/5SG4E2aG8irXyDeCnS5lZv6UWoY+VIbu6Cc8k/
 ssQ40Nh8kpxwC5q1VzfFb74Aq8E9qg4tb38+bgs5CXGnCNUopoHJrlYfbq3MIKZ+1XvY
 tIbDBxHgitNWWIlFBI5pUkNwHSY+u/B5Yub261cZFRH5StKEqdCZVaBOYjzD7pjGd99s
 cGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfq9ahxtPWumPFUA7GxsNTNfOq8eJnxJvP1+ExRJxfQ=;
 b=oEu9BPvLd1iv0V1as7hTzStZBtkgdSXflNh8VLlAIHEKfP660yteAnAYj2S7znWW/k
 yaR1YG84eZ5qhZ6kcUznMi7yusrJUVstNfbyG1esxipa4Pm/ez0ck9oSI+kdIi8QqQDS
 xTPHzS7JVCyXq4ylmXb4nHUl8jDX4RRqoMBalnexrjL1SHlffZtLhpNdVcBLZzVSnJRn
 JYm+xsYBLLdd1u+nBreUjszoJ6DVlxJA34v5tVrf2D00etMa6oo28KME1d9F5g79Sbgs
 04Y8gzHU6k4xcRGMjQUbxDZHtAu8UqgOc8dyzGBu3k20b/ajX4NJySiIGK7mflAWJbwX
 n7og==
X-Gm-Message-State: AOAM533f3ABRGLltuun334E7kEGYcBcJFNrhnEXyOgdJedtHYGayYE0M
 pt27PhqQ26QDvF3jOIWtul7UKCrLUOkSew==
X-Google-Smtp-Source: ABdhPJxOlWcfJN/Os+scWAlQ39Q4euo83ddWYcaRZ+eS4VRy7cX627OAxCHpnu94KNOr8jakKLh8Og==
X-Received: by 2002:a17:902:c702:b029:114:7fc8:cf76 with SMTP id
 p2-20020a170902c702b02901147fc8cf76mr14750413plp.84.1623633633301; 
 Sun, 13 Jun 2021 18:20:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id d15sm15724359pjr.47.2021.06.13.18.20.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 18:20:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/34] tcg patch queue
Date: Sun, 13 Jun 2021 18:20:30 -0700
Message-Id: <20210614012031.1081133-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2 fixes an error in patch 22 wrt MacOS.
It's a shame we don't have public CI for that.


r~


The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210613

for you to fetch changes up to a5a8b84772e13066c6c45f480cc5b5312bbde08e:

  docs/devel: Explain in more detail the TB chaining mechanisms (2021-06-13 17:42:40 -0700)

----------------------------------------------------------------
Clean up code_gen_buffer allocation.
Add tcg_remove_ops_after.
Fix tcg_constant_* documentation.
Improve TB chaining documentation.
Fix float32_exp2.
Fix arm tcg_out_op function signature.

----------------------------------------------------------------
Jose R. Ziviani (1):
      tcg/arm: Fix tcg_out_op function signature

Luis Pires (1):
      docs/devel: Explain in more detail the TB chaining mechanisms

Richard Henderson (32):
      meson: Split out tcg/meson.build
      meson: Split out fpu/meson.build
      tcg: Re-order tcg_region_init vs tcg_prologue_init
      tcg: Remove error return from tcg_region_initial_alloc__locked
      tcg: Split out tcg_region_initial_alloc
      tcg: Split out tcg_region_prologue_set
      tcg: Split out region.c
      accel/tcg: Inline cpu_gen_init
      accel/tcg: Move alloc_code_gen_buffer to tcg/region.c
      accel/tcg: Rename tcg_init to tcg_init_machine
      tcg: Create tcg_init
      accel/tcg: Merge tcg_exec_init into tcg_init_machine
      accel/tcg: Use MiB in tcg_init_machine
      accel/tcg: Pass down max_cpus to tcg_init
      tcg: Introduce tcg_max_ctxs
      tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
      tcg: Replace region.end with region.total_size
      tcg: Rename region.start to region.after_prologue
      tcg: Tidy tcg_n_regions
      tcg: Tidy split_cross_256mb
      tcg: Move in_code_gen_buffer and tests to region.c
      tcg: Allocate code_gen_buffer into struct tcg_region_state
      tcg: Return the map protection from alloc_code_gen_buffer
      tcg: Sink qemu_madvise call to common code
      util/osdep: Add qemu_mprotect_rw
      tcg: Round the tb_size default from qemu_get_host_physmem
      tcg: Merge buffer protection and guard page protection
      tcg: When allocating for !splitwx, begin with PROT_NONE
      tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/
      tcg: Introduce tcg_remove_ops_after
      tcg: Fix documentation for tcg_constant_* vs tcg_temp_free_*
      softfloat: Fix tp init in float32_exp2

 docs/devel/tcg.rst        | 101 ++++-
 meson.build               |  12 +-
 accel/tcg/internal.h      |   2 +
 include/qemu/osdep.h      |   1 +
 include/sysemu/tcg.h      |   2 -
 include/tcg/tcg.h         |  28 +-
 tcg/aarch64/tcg-target.h  |   1 +
 tcg/arm/tcg-target.h      |   1 +
 tcg/i386/tcg-target.h     |   2 +
 tcg/mips/tcg-target.h     |   6 +
 tcg/ppc/tcg-target.h      |   2 +
 tcg/riscv/tcg-target.h    |   1 +
 tcg/s390/tcg-target.h     |   3 +
 tcg/sparc/tcg-target.h    |   1 +
 tcg/tcg-internal.h        |  40 ++
 tcg/tci/tcg-target.h      |   1 +
 accel/tcg/tcg-all.c       |  32 +-
 accel/tcg/translate-all.c | 439 +-------------------
 bsd-user/main.c           |   3 +-
 fpu/softfloat.c           |   2 +-
 linux-user/main.c         |   1 -
 tcg/region.c              | 999 ++++++++++++++++++++++++++++++++++++++++++++++
 tcg/tcg.c                 | 649 +++---------------------------
 util/osdep.c              |   9 +
 tcg/arm/tcg-target.c.inc  |   3 +-
 fpu/meson.build           |   1 +
 tcg/meson.build           |  14 +
 27 files changed, 1266 insertions(+), 1090 deletions(-)
 create mode 100644 tcg/tcg-internal.h
 create mode 100644 tcg/region.c
 create mode 100644 fpu/meson.build
 create mode 100644 tcg/meson.build

