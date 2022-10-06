Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DD5F5F57
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:14:07 +0200 (CEST)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHKn-00023U-Oe
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHI6-00059U-VL
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:18 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHI4-0006vb-WC
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:18 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y8so825744pfp.13
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=pBdeWAmsk0Lq4zjaPrvt5UyirUd5aFVzg7qmqusBt14=;
 b=Sgy8R3WXDG/53DdP8p1xmmuiNgN8PnNSaZKZQ4FTEW+78VOKyaPFAY8rBaQifsPzXW
 2eNUGl9g1WIzFQSEwUveOPvQYnG2+ztP5FtQo2e93S/reSS4qYS03vZ49yLmWh7CVOtI
 +fPCLZzanBKA/zdvSiqmba1qKViFcatLu8E59/rNSTM5sn7E5wiI7GAy4CGjGWAVgVZi
 0k5gr9axenl3jGplftok94iV4Sg2b8L2o1rJIQgwEJDbHWB+B9CXkDGz+JehmBIAhF+E
 0mWtEDd93ni+T4NbJmU3gHH96WOQjx7fZpLUEBTsXxL7aWq1knj9UClPkv9tiBUopNmh
 sqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=pBdeWAmsk0Lq4zjaPrvt5UyirUd5aFVzg7qmqusBt14=;
 b=pJnkkeIR0IJksGpkCMDwo/Etp8fbMIyjYKn95kUCU0sMsl5zdpgYR/fzqqza3I8fbC
 6LQNbshsUhg4k62Kst5ap1eVgvkluY8g1MqMHr8cxXT0ZIKHK9Yt2wNkW+CTfKPPQUgB
 kNHmm9LsdJjEDe0fkH9gu0kHe0kRxmNVbkHtMyuyzy/TtGJ/59OHLz4WF6Gs/U+gVb3p
 9NEg69JZNPRKq4AnjJPQ4RzpUdao2zsnOmmgW8qCLQ7U97h5OCoDcDOJ1oRplrueUGuH
 taxD/flrX5ZEASU1ciz6saxmRV0fhtInocpieepvZV4fBYzv98wsNxsxDJSYOMrCuhTo
 UDxg==
X-Gm-Message-State: ACrzQf23WZCXWCP+zjtOYn+bULDEh8+CiGr0vpZiCQKVnX/odQUjqnOa
 aoJV6eF8OHGj7lW9zC344mixzUEOBg7cHA==
X-Google-Smtp-Source: AMsMyM76/4a0vBNKYdi4YGCazrrqX19VOrVjllX17t2tUFl28bDf8RwVAzpBPS+YSwP7r0pngw5HUw==
X-Received: by 2002:a63:57:0:b0:45a:f9a8:4b89 with SMTP id
 84-20020a630057000000b0045af9a84b89mr1603941pga.184.1665025875181; 
 Wed, 05 Oct 2022 20:11:15 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 00/24] accel/tcg: Rewrite user-only vma tracking
Date: Wed,  5 Oct 2022 20:10:49 -0700
Message-Id: <20221006031113.1139454-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

The primary motivator here are the numerous bug reports (e.g. #290)
about not being able to handle very large memory allocations.
I presume all or most of these are due to guest use of the clang
address sanitizer, which allocates a massive shadow vma.

This patch set copies the linux kernel code for interval trees,
which is what the kernel itself uses for managing vmas.  I then
purge all (real) use of PageDesc from user-only.  This is easy
for user-only because everything tricky happens under mmap_lock();

I have thought only briefly about using interval trees for system
mode too, but the locking situation there is more difficult.  So
for now that code gets moved around but not substantially changed.

The test case from #290 is added to test/tcg/multiarch/.
Before this patch set, on my moderately beefy laptop, it takes 39s
and has an RSS of 28GB before the qemu process is killed.  After
the patch set, the test case successfully allocates 16TB and
completes in 0.013s.


r~


Richard Henderson (24):
  util: Add interval-tree.c
  accel/tcg: Make page_alloc_target_data allocation constant
  accel/tcg: Remove disabled debug in translate-all.c
  accel/tcg: Split out PageDesc to internal.h
  accel/tcg: Split out tb-maint.c
  accel/tcg: Move assert_no_pages_locked to internal.h
  accel/tcg: Drop cpu_get_tb_cpu_state from TARGET_HAS_PRECISE_SMC
  accel/tcg: Remove duplicate store to tb->page_addr[]
  accel/tcg: Introduce tb_{set_}page_addr{0,1}
  accel/tcg: Rename tb_invalidate_phys_page
  accel/tcg: Rename tb_invalidate_phys_page_range and drop end parameter
  accel/tcg: Unify declarations of tb_invalidate_phys_range
  accel/tcg: Use tb_invalidate_phys_page in page_set_flags
  accel/tcg: Call tb_invalidate_phys_page for PAGE_RESET
  accel/tcg: Use interval tree for TBs in user-only mode
  accel/tcg: Use page_reset_target_data in page_set_flags
  accel/tcg: Use tb_invalidate_phys_range in page_set_flags
  accel/tcg: Move TARGET_PAGE_DATA_SIZE impl to user-exec.c
  accel/tcg: Simplify page_get/alloc_target_data
  accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
  accel/tcg: Move page_{get,set}_flags to user-exec.c
  accel/tcg: Use interval tree for user-only page tracking
  accel/tcg: Move PageDesc tree into tb-maint.c for system
  accel/tcg: Move remainder of page locking to tb-maint.c

 accel/tcg/internal.h            |   40 +
 include/exec/cpu-all.h          |   22 +-
 include/exec/exec-all.h         |   75 +-
 include/exec/ram_addr.h         |    2 -
 include/exec/translate-all.h    |    8 +-
 include/qemu/interval-tree.h    |   99 ++
 target/arm/cpu.h                |    8 +
 target/arm/internals.h          |    4 -
 accel/tcg/cpu-exec.c            |    9 +-
 accel/tcg/tb-maint.c            | 1222 ++++++++++++++++++++++
 accel/tcg/translate-all.c       | 1683 +------------------------------
 accel/tcg/translator.c          |    9 +-
 accel/tcg/user-exec.c           |  662 ++++++++++++
 bsd-user/mmap.c                 |    2 -
 cpu.c                           |    4 +-
 linux-user/mmap.c               |    4 -
 target/arm/mte_helper.c         |    5 -
 tests/tcg/multiarch/test-vma.c  |   22 +
 tests/unit/test-interval-tree.c |  209 ++++
 util/interval-tree.c            |  881 ++++++++++++++++
 accel/tcg/meson.build           |    1 +
 tests/unit/meson.build          |    1 +
 util/meson.build                |    1 +
 23 files changed, 3235 insertions(+), 1738 deletions(-)
 create mode 100644 include/qemu/interval-tree.h
 create mode 100644 accel/tcg/tb-maint.c
 create mode 100644 tests/tcg/multiarch/test-vma.c
 create mode 100644 tests/unit/test-interval-tree.c
 create mode 100644 util/interval-tree.c

-- 
2.34.1


