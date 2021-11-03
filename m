Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A5443C17
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:07:10 +0100 (CET)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7YL-00082g-9J
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VF-00054Z-6C
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:57 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VD-0000tZ-KQ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:03:56 -0400
Received: by mail-qv1-xf29.google.com with SMTP id j9so1473851qvm.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NHJ/SF6iOxyqykACaNp1q0DJ2H6kHi8msEbDEmyiepw=;
 b=Ko/ZjUCwXM5Zy2m1W9sHsaEfmEA7iVbzV+VYKSNUEURMGTZKVfkvrWFmSY9t5lX1DN
 zJfWliwnPhvxCvHoh2kYjqU3fo7PCPUxFhPDqTi3eUla8Lm+kaQNFoSvF2t9e7UW6VN3
 VQMl+HwDJnOexwXVxQ1R3O0xzFKQlGiRHHodM6wdL8Xi5SZT9I994jS/QkQviJBdWhDZ
 3LnvzpVinQED0QHLF5Z9MrSyzEKcxyKMtontNlG2OEz31VRicdW9xMdMRje4YsDfLZ3p
 pzRWaZIM7BD/P5LhL9uPzValQ/vxgHh9Xiff4HFRhdOlFIhQeXC6BxxBI80QEBnnwEVu
 wmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NHJ/SF6iOxyqykACaNp1q0DJ2H6kHi8msEbDEmyiepw=;
 b=LvpjREzdob5ePYxALL8lbizIsKxNt7Jl+OVZ6o6dE6CX12otarxQWBPmG4v/kS3xi8
 z6AM8vKtt9LfSKQ8Z91yYjXBIVLLulOdQhFBPdEDvN4BbT0qEaDtQDoLgclnN36mZY3Y
 lO87kO6JmbjsCx0qxXE73e2qMEjJmesZFj3jT8HWlD/fz0vXAwzXv7lxs20I77sbKzXS
 RgMHThQMgvv7OPbyWODmvbcnDnFAPTzcQIFaovCM/J47w4H2BXsrEzhc3X7thTUGFQNm
 D2mayHzoGr7oVQhcHReQkGL+mlSmiSAzoyPjW+md4Hc39ZNX7kwaZF+cddXapAQ+zM6g
 fnLw==
X-Gm-Message-State: AOAM532hIQRy/LpvTydNB/wmtxO5HXvoHsNTui+17R5c0+WvbxtH+3d/
 0TiMf/pL63l5TvEUyaWT4Sqhc+lu9vCzbg==
X-Google-Smtp-Source: ABdhPJzEfD0FBtmTmIFQAVmQHC2woj81nR9pGFLdulleGigWVC1lUHawRRaX2HPK86UQHwbX2w2Nyw==
X-Received: by 2002:ac8:701b:: with SMTP id x27mr42549414qtm.246.1635912234275; 
 Tue, 02 Nov 2021 21:03:54 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/10] target/arm: Fix insn exception priorities
Date: Wed,  3 Nov 2021 00:03:42 -0400
Message-Id: <20211103040352.373688-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Raise pc alignment faults.
Fix single-step and pc-align priority over breakpoints.
Not yet fixing insn abort priority over breakpoints.


r~


Changes for v4:
  * Rebase on master.
  * Split some cleanups into new patches.
  * No special cases in helper_exception_pc_alignment.

Changes for v3:
  * Rebase on siginfo_t patch set -- while probably only
    force_sig_fault is required, I suspect minor conflicts
    with the other cleanups.
  * Typo fix.

Changes for v2:
  * Handle the exceptions in cpu_loop.
  * Fix how the instruction is raised for aa32 el1.
  * Add pc alignment test cases.

Richard Henderson (10):
  target/arm: Hoist pc_next to a local variable in
    aarch64_tr_translate_insn
  target/arm: Hoist pc_next to a local variable in arm_tr_translate_insn
  target/arm: Hoist pc_next to a local variable in
    thumb_tr_translate_insn
  target/arm: Split arm_pre_translate_insn
  target/arm: Advance pc for arch single-step exception
  target/arm: Split compute_fsr_fsc out of arm_deliver_fault
  target/arm: Take an exception if PC is misaligned
  target/arm: Assert thumb pc is aligned
  target/arm: Suppress bp for exceptions with more priority
  tests/tcg: Add arm and aarch64 pc alignment tests

 target/arm/helper.h               |  1 +
 target/arm/syndrome.h             |  5 +++
 linux-user/aarch64/cpu_loop.c     | 46 ++++++++++++----------
 target/arm/debug_helper.c         | 23 +++++++++++
 target/arm/gdbstub.c              |  9 ++++-
 target/arm/machine.c              | 10 +++++
 target/arm/tlb_helper.c           | 63 ++++++++++++++++++++++---------
 target/arm/translate-a64.c        | 23 +++++++++--
 target/arm/translate.c            | 58 ++++++++++++++++++++--------
 tests/tcg/aarch64/pcalign-a64.c   | 37 ++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       | 46 ++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +-
 tests/tcg/arm/Makefile.target     |  4 ++
 13 files changed, 271 insertions(+), 58 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

-- 
2.25.1


