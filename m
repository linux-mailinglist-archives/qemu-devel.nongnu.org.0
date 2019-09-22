Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5579BA06F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Sep 2019 05:57:31 +0200 (CEST)
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBt06-0003Gj-CY
	for lists+qemu-devel@lfdr.de; Sat, 21 Sep 2019 23:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iBsxk-0001Kf-0x
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iBsxi-00083o-BU
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36011)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iBsxi-00083B-3s
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 23:55:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id y22so6995063pfr.3
 for <qemu-devel@nongnu.org>; Sat, 21 Sep 2019 20:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nkp5DxXrfb5+kqCil3lm91S8kYDhJGMwbCnbuLySTx4=;
 b=pDlDtViwFswECgq5fIIHTWqsxHhZ4vxt8+11mwEvzJF5fkeomn5hWREiLs2FBWSDQc
 1l5/ozNFopY+ps7fCAWcCbuT1MyhwbJ5s33Rem4GkwZMIeMQBeL4olkfh/Z+pcJdNudc
 5iRIEHcL8QGq6+hOSU8KFgJ0Gmz7bDClZ0Zi4u0+DUIhLX6AUNKUMx51FR2bXAO9koGk
 UVIINZgd5ifbernsw9QzRsuL39Lbb30PP7e6sJa7336O5PfMV+W2z6KGxDhiDWtV+TVz
 fsUeMg8NzBjiZZCcys08s91pHQT03XEunGMeq++0xgEYtcP29cNKupy5krQPMwHx0VK2
 mflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nkp5DxXrfb5+kqCil3lm91S8kYDhJGMwbCnbuLySTx4=;
 b=afocY6+KIwuJl8JX9tkc+xGuCSGeGOstrMonGGCvPjU5JcMZYoBKJxIyOEaIb224Ch
 /blNq65AWUT8IACZP0bAuXNKScCS3Zy2V1yWIwUP/nlsJr5o6RImGbhm64L3o70gVdoj
 aydA2vWGK0CA915N0cWDsMt3P0umDMP3S0vnXPjS82aBOJ3yAjrZsMyMXR/RtE1qI2+5
 XgjuhYNnvEH9JU/c8AwFu9Qj8ZYZKQqGcrNN7/VfGg609XHSxpvIkXa9lHlDRLTOn+wp
 2R/BIrFMk/21QWZkGpuuIaBzFmNhF5LsydVvJzo4o89JAJuAfjuKpjT4W2j7hRWyUr2D
 Uv/A==
X-Gm-Message-State: APjAAAXNYmHCgUJxSGOHbPRsG5HnL5EMXxsGLYBKucQFihCwuxme8HUL
 NSs/2o6NT06Tx0F9KDOuV2H/dszvIcU=
X-Google-Smtp-Source: APXvYqy8vQHUvPIxxlFbbTOCZpxuNREuR6dYs44PaTpvJx062vojoqOiJ2Hc6bC0XVhfs8seBKuMUA==
X-Received: by 2002:a62:75d2:: with SMTP id q201mr26448034pfc.43.1569124500577; 
 Sat, 21 Sep 2019 20:55:00 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z4sm6452921pjt.17.2019.09.21.20.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 20:54:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/20] Move rom and notdirty handling to cputlb
Date: Sat, 21 Sep 2019 20:54:38 -0700
Message-Id: <20190922035458.14879-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::433
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, stefanha@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok!  Third time is the charm, because this time it works.

New to v3:

  * Covert io_mem_rom with a new TLB_ROM bit.

  * This in turn means that there are no longer any special RAM
    case along along the MMIO path -- they all have devices on
    the other end.

  * This in turn means that we can fold the bulk of 
    memory_region_section_get_iotlb into tlb_set_page_with_attrs,
    a couple of redundant tests vs the MemoryRegion.
    The result in patch 14 is, IMO, much more understandable.

  * Fold away uses of cpu->mem_io_pc in tb_invalidate_phys_page__locked,
    the cause of the problems for my previous two patch sets.

    BTW, I was correct with my guess in the v2 cover letter that the use
    of memory_notdirty_write_{prepare,complete} within atomic_mmu_lookup
    must have been broken, for not setting mem_io_pc.  :-P

  * Fix a missed use of cpu->mem_io_pc in tb_check_watchpoint,
    which meant that the previous TLB_WATCHPOINT cleanup was a
    titch broken.

The remaining two users of cpu->mem_io_pc are hw/misc/mips_itu.c and
target/i386/helper.c.  I haven't looked, but I assume that these are
legitimately on the MMIO path, and there probably isn't a decent way
to remove the uses.


r~


Richard Henderson (20):
  exec: Use TARGET_PAGE_BITS_MIN for TLB flags
  exec: Split out variable page size support to exec-vary.c
  exec: Use const alias for TARGET_PAGE_BITS_VARY
  exec: Restrict TARGET_PAGE_BITS_VARY assert to CONFIG_DEBUG_TCG
  exec: Promote TARGET_PAGE_MASK to target_long
  exec: Tidy TARGET_PAGE_ALIGN
  exec: Cache TARGET_PAGE_MASK for TARGET_PAGE_BITS_VARY
  cputlb: Disable __always_inline__ without optimization
  cputlb: Replace switches in load/store_helper with callback
  cputlb: Introduce TLB_BSWAP
  exec: Adjust notdirty tracing
  cputlb: Move ROM handling from I/O path to TLB path
  cputlb: Move NOTDIRTY handling from I/O path to TLB path
  cputlb: Partially inline memory_region_section_get_iotlb
  cputlb: Merge and move memory_notdirty_write_{prepare,complete}
  cputlb: Handle TLB_NOTDIRTY in probe_access
  cputlb: Remove cpu->mem_io_vaddr
  cputlb: Remove tb_invalidate_phys_page_range is_cpu_write_access
  cputlb: Pass retaddr to tb_invalidate_phys_page_fast
  cputlb: Pass retaddr to tb_check_watchpoint

 Makefile.target                |   2 +-
 accel/tcg/translate-all.h      |   8 +-
 include/exec/cpu-all.h         |  48 ++--
 include/exec/cpu-common.h      |   3 -
 include/exec/exec-all.h        |   6 +-
 include/exec/memory-internal.h |  65 ------
 include/hw/core/cpu.h          |   2 -
 include/qemu-common.h          |   6 +
 include/qemu/compiler.h        |  11 +
 accel/tcg/cputlb.c             | 388 +++++++++++++++++++--------------
 accel/tcg/translate-all.c      |  51 ++---
 exec-vary.c                    |  88 ++++++++
 exec.c                         | 192 +---------------
 hw/core/cpu.c                  |   1 -
 memory.c                       |  20 --
 trace-events                   |   4 +-
 16 files changed, 403 insertions(+), 492 deletions(-)
 create mode 100644 exec-vary.c

-- 
2.17.1


