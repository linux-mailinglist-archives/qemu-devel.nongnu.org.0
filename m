Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C6410E81
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 04:49:08 +0200 (CEST)
Received: from localhost ([::1]:47372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS9Mh-0001iM-8O
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 22:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iu-0005D8-R2
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:12 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iq-0008CU-5l
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:11 -0400
Received: by mail-pg1-x531.google.com with SMTP id m21so6658134pgu.13
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zp6udU6vABHfcwT1lj6jsBUaWhiJFkUto34nvU8EJkI=;
 b=s0SpX4GRTo/TlrZ+CXhb3V608xcbIPDzEApbITrgbFP3mE0i2/iEiIBrsfKloIVP/Q
 S7fNEmAjqH64nJXfWqPf5X+Ivc9CGFHdH5iCn+w4sBBdaPvJRcI9q6jEiTo9YdS3FqCd
 q3ArKGetbm1JDjuaPY8/Refwh3WMKFMn9RI1Bv4qW0pxH8w11V01uSfLfEAhnprjb5Oz
 O6fZlJv/H8tCHn+BMicLAY+5mh9vvdnGU1I6Xj+ycfEJgr7ZWJztUN6KcHHbXgjWxlZI
 XYG9+BJN5+YwfWzCTKmZNWHpwAG/XIFFG5J9Nupm+p7/elkeCxhxgxsUZDeAa18cqYLu
 m/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zp6udU6vABHfcwT1lj6jsBUaWhiJFkUto34nvU8EJkI=;
 b=WiFgLVCJTTuL/8Nnf37ovF/IOq+4JIewIOQWQdjOvCVQvT9HEQFkBFB6Vrr2YYMLpB
 PES6+dmSPa/MNaTAY85HMiXjD2r8yuLdNt/3m2+ofoeH7wGiAKxc3ADxHFoYAvuUW1zk
 kQqzjnLIkCva9UWfgXTTnOl+tk+b3RD8Wrn8vaGG9arNVUcG53baG7czf3mfiIUO7VPo
 gi2NS2znlZuYzbtundYPu1Bvw7ZNO96RXnq8Q1P4J9X6zzA8GeNM0ihJZsx4JqsN274E
 FVDuuggl7+zMJ63Q1ea5Un5Hwoq+GBCDtjU3J7UXTxCBwbsmzuo8OvTzAPV+rNXE8B3y
 SsqA==
X-Gm-Message-State: AOAM531MsUwymkB5zXLjis8IAo4nOHXLq1mtpss9iUnMH8wKQ6Tr6I3i
 ziW73os9cCEh3osD0aMBalC4EMkDio0few==
X-Google-Smtp-Source: ABdhPJx/v5Z+MJP8lm1OpeW+UfRe4PRjEZYq9jp4Vulj/xR9I5hM9tJKh5VOiayhOEixzImutmpTKg==
X-Received: by 2002:a63:b448:: with SMTP id n8mr21467978pgu.31.1632105906228; 
 Sun, 19 Sep 2021 19:45:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] target/arm: Fix insn exception priorities
Date: Sun, 19 Sep 2021 19:44:58 -0700
Message-Id: <20210920024504.625965-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Raise pc alignment faults.
Fix single-step and pc-align priority over breakpoints.
Not yet fixing insn abort priority over breakpoints.

Based-on: 20210919015718.466207-1-richard.henderson@linaro.org
("linux-user: Clean up siginfo_t handling")

Changes for v3:
  * Rebase on siginfo_t patch set -- while probably only
    force_sig_fault is required, I suspect minor conflicts
    with the other cleanups.
  * Typo fix.

Changes for v2:
  * Handle the exceptions in cpu_loop.
  * Fix how the instruction is raised for aa32 el1.
  * Add pc alignment test cases.


r~


Richard Henderson (6):
  linux-user/aarch64: Handle EC_PCALIGNMENT
  linux-user/arm: Report SIGBUS and SIGSEGV correctly
  target/arm: Take an exception if PC is misaligned
  target/arm: Assert thumb pc is aligned
  target/arm: Suppress bp for exceptions with more priority
  tests/tcg: Add arm and aarch64 pc alignment tests

 target/arm/helper.h               |  1 +
 target/arm/syndrome.h             |  5 ++++
 linux-user/aarch64/cpu_loop.c     | 44 +++++++++++++++++------------
 linux-user/arm/cpu_loop.c         | 39 ++++++++++++++++++++++----
 target/arm/debug_helper.c         | 23 ++++++++++++++++
 target/arm/gdbstub.c              |  9 ++++--
 target/arm/machine.c              |  9 ++++++
 target/arm/tlb_helper.c           | 24 ++++++++++++++++
 target/arm/translate-a64.c        | 23 ++++++++++++++--
 target/arm/translate.c            | 42 +++++++++++++++++++++++-----
 tests/tcg/aarch64/pcalign-a64.c   | 37 +++++++++++++++++++++++++
 tests/tcg/arm/pcalign-a32.c       | 46 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  4 +--
 tests/tcg/arm/Makefile.target     |  4 +++
 14 files changed, 274 insertions(+), 36 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

-- 
2.25.1


