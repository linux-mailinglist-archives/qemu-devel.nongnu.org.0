Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E126E9DE9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:31:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbqC-0007G4-R3; Thu, 20 Apr 2023 17:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbqA-0007Ex-G0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:18 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ppbq7-0005Xb-Bw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HDaAjt4zxXxW1DLTvbHRkHD5qHjrbYrm5n6xAiUrU9c=; b=VoPURCWL9FX3zMK+dAGEMScAs9
 kcf6ogRoBCq790YodnZiGBoCh5IaTF0XlLKeTwzbNSIg/fDN1QEVCMdyTkbjZa0HOUcRlhGA/95gb
 tlgH38cBI2HAj1UrxjXqwS1jl4jiK4T183z9igeGTr6NuRq82YjiMUKq73ruWU/YCIRc=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com
Subject: [PATCH 0/8] Start replacing target_ulong with vaddr
Date: Thu, 20 Apr 2023 23:28:42 +0200
Message-Id: <20230420212850.20400-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a first patchset in removing target_ulong from non-target/
directories.  As use of target_ulong is spread accross the codebase we
are attempting to target as few maintainers as possible with each
patchset in order to ease reviewing.

The following instances of target_ulong remain in accel/ and tcg/
    - atomic helpers (atomic_common.c.inc), cpu_atomic_*()
      (atomic_template.h,) and cpu_[st|ld]*()
      (cputlb.c/ldst_common.c.inc) are only used in target/ and can
      be pulled out into a separate target-specific file;

    - Calls to cpu_get_tb_cpu_state() cast pc and cs_base to
      target_ulong in order to avoid having to touch the target/
      directory in this patchset;

    - walk_memory_regions() is used in user-exec.c and
      linux-user/elfload.c;

    - helper_ret_*_mmu() is used in tcg/*/tcg-target.c.inc and
      tcg/tci.c;

    - Functions in translate-all.c dealing with TCGContext.gen_insn_data
      will be switched off target_ulong once gen_insn_data and
      TARGET_INSN_START_WORDS have been dealt with;

    - kvm_find_sw_breakpoint() in kvm-all.c used in target/;

    - The last address when looking up page flags for an interval
      [start,last] in pageflags_find()/pageflags_next() is still
      target_long.  I'm not sure why this is required.  This only
      seems relevant on 32-bit guests since the addresses passed
      to the interval tree are uint64_t's, are we relying on a
      sign extension here for some reason?

    - CPUTLBEntry and functions that read from it will be left for a
      later date;

Smaller patchsets implementing above changes will follow.

Finally, the grand goal is to allow for heterogeneous QEMU binaries
consisting of multiple frontends.

RFC: https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html

Anton Johansson (8):
  accel: Replace `target_ulong` with `vaddr` in TB/TLB
  accel: Replace target_ulong with vaddr in probe_*()
  accel/tcg: Replace target_ulong with vaddr in *_mmu_lookup()
  accel/tcg: Replace target_ulong with vaddr in helper_unaligned_*()
  accel/tcg: Replace target_ulong with vaddr in translator_*()
  accel/tcg: Replace target_ulong with vaddr in page_*()
  cpu: Replace target_ulong with vaddr in tb_invalidate_phys_addr()
  tcg: Replace target_ulong with vaddr in tcg_gen_code()

 accel/stubs/tcg-stub.c       |   6 +-
 accel/tcg/cpu-exec.c         |  49 ++++-----
 accel/tcg/cputlb.c           | 195 +++++++++++++++++------------------
 accel/tcg/internal.h         |   6 +-
 accel/tcg/tb-hash.h          |  12 +--
 accel/tcg/tb-jmp-cache.h     |   2 +-
 accel/tcg/tb-maint.c         |   2 +-
 accel/tcg/translate-all.c    |  15 +--
 accel/tcg/translator.c       |  10 +-
 accel/tcg/user-exec.c        |  59 ++++++-----
 cpu.c                        |   2 +-
 include/exec/cpu-all.h       |  10 +-
 include/exec/cpu-defs.h      |   4 +-
 include/exec/cpu_ldst.h      |   6 +-
 include/exec/exec-all.h      |  98 +++++++++---------
 include/exec/translate-all.h |   2 +-
 include/exec/translator.h    |   6 +-
 include/qemu/plugin-memory.h |   2 +-
 include/tcg/tcg-ldst.h       |   4 +-
 include/tcg/tcg.h            |   2 +-
 tcg/tcg.c                    |   2 +-
 21 files changed, 247 insertions(+), 247 deletions(-)

--
2.39.1

