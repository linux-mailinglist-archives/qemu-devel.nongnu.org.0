Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E8444431F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:10:52 +0100 (CET)
Received: from localhost ([::1]:37978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miGyY-0004kG-Rn
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwe-00025i-Ts
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:52 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwc-0004uj-T5
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:52 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id gh1so3024274qvb.8
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVMZQI8g9tnc1RNoQzspmjc2tzhxkcZ/dPeR3lrxQJc=;
 b=cBbJlLM3lSTzyOzHmd54Y1Uklha/avujNTrPisX3QSJehlKgwEN5mhQ2TNB5PcN/Kr
 0ENnGj6gVTS2OzXkel77VguV0uMlG6RTSnQgNyFzvORum0tpm7TaCfAsOQm3jMdV5qTX
 NQT0wW1qDGRmlZiEVZEJFeuQM4XEwq1JfgAjMoRC69NP9DHYL4iQ572KSPYuIOVIQBNO
 FdgkHDBFqu21a6+A7EMsnqMOJB0i9QWZROojPdOaWWbdsfOWN3wnE6trriUPFLkzXQyj
 XUBKXGCeL26+E6uoebRNghILppy5vjvMWdtD/E7VuuChEmO8G5JAdr7+cPe7UXN8AlGz
 IXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WVMZQI8g9tnc1RNoQzspmjc2tzhxkcZ/dPeR3lrxQJc=;
 b=zhb0M3rlMBTBiZounQ3BOVgE+6f1/2xS22r+IWa0ip7FpjJyW15ldNbIqHWdgaXWJx
 lPZoUyAxajYkS2avGeg+hxN7HEQ/jqjn6mkD7YnYnOM0+2OpWCvkpCP81m2ysEC22K3Q
 kDYUB9Bw72huKhWNihOs6+y//QkRjhW0lht+KPpdQvyhRPMkSyE8uS7AY0YcOh8Z4fna
 TgQ95FYUUlxzEnd44gpgCqcNcTQMxxGvO5Z1rQQnnkQ3dWvAyMzKgtLrOoU4k775aQ3W
 nb9o95GFnWTDzo2/3L9Zf+Ys7Skisk4xdTeILOHYKnSgSlid32kJRvkpb0su79TGxy36
 +QQg==
X-Gm-Message-State: AOAM530+fLX0LJXQQXa3BDP5pyG7JkUxlM421v4jhsPRcROERR0zd7rA
 mqXEv2vba74TPRCvzYl3IcogycAUMW/i1A==
X-Google-Smtp-Source: ABdhPJyPT80fUzkZzhM5OHQVpUeCkMftsnbWb4a0807TF325E2yFdowJLWpocOnBCDUS0RbwJyzKgA==
X-Received: by 2002:a0c:c685:: with SMTP id d5mr11832893qvj.35.1635948528903; 
 Wed, 03 Nov 2021 07:08:48 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/23] linux-user: Clean up siginfo_t handling
Date: Wed,  3 Nov 2021 10:08:24 -0400
Message-Id: <20211103140847.454070-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v2:
  * Rebase on master.
    - force_sig_fault is in,
    - force_sigsegv_for_addr is obviated by cpu_loop_exit_sigsegv,
    - openrisc RANGE and FPE exception abort are upstream.

Patches lacking review:
  07-linux-user-hppa-Set-FPE_CONDTRAP-for-COND.patch
  15-target-mips-Extract-break-code-into-env-error_cod.patch
  16-target-mips-Extract-trap-code-into-env-error_code.patch
  17-linux-user-openrisc-Use-force_sig_fault.patch


r~


Richard Henderson (23):
  linux-user/alpha: Set TRAP_UNK for bugchk and unknown gentrap
  linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
  linux-user/alpha: Use force_sig_fault
  linux-user/cris: Use force_sig_fault
  linux-user/hppa: Use force_sig_fault
  linux-user/hppa: Use the proper si_code for PRIV_OPR, PRIV_REG,
    OVERFLOW
  linux-user/hppa: Set FPE_CONDTRAP for COND
  linux-user/i386: Split out maybe_handle_vm86_trap
  linux-user/i386: Use force_sig, force_sig_fault
  linux-user/m68k: Use force_sig_fault
  linux-user/microblaze: Use force_sig_fault
  linux-user/microblaze: Fix SIGFPE si_codes
  linux-user/mips: Improve do_break
  linux-user/mips: Use force_sig_fault
  target/mips: Extract break code into env->error_code
  target/mips: Extract trap code into env->error_code
  linux-user/openrisc: Use force_sig_fault
  linux-user/ppc: Use force_sig_fault
  linux-user/riscv: Use force_sig_fault
  linux-user/s390x: Use force_sig_fault
  linux-user/sh4: Use force_sig_fault
  linux-user/sparc: Use force_sig_fault
  linux-user/xtensa: Use force_sig_fault

 linux-user/syscall_defs.h                 |   2 +
 target/mips/tcg/translate.h               |   1 +
 linux-user/alpha/cpu_loop.c               |  61 +++-----
 linux-user/cris/cpu_loop.c                |  12 +-
 linux-user/hppa/cpu_loop.c                |  26 ++--
 linux-user/i386/cpu_loop.c                |  78 +++++-----
 linux-user/m68k/cpu_loop.c                |  24 +---
 linux-user/microblaze/cpu_loop.c          |  71 +++++----
 linux-user/mips/cpu_loop.c                | 166 +++++-----------------
 linux-user/openrisc/cpu_loop.c            |  18 +--
 linux-user/ppc/cpu_loop.c                 | 136 ++++--------------
 linux-user/riscv/cpu_loop.c               |  31 +---
 linux-user/s390x/cpu_loop.c               |   7 +-
 linux-user/sh4/cpu_loop.c                 |   6 +-
 linux-user/sparc/cpu_loop.c               |  14 +-
 linux-user/xtensa/cpu_loop.c              |  26 ++--
 target/mips/tcg/translate.c               |  36 ++++-
 target/mips/tcg/micromips_translate.c.inc |  10 +-
 target/mips/tcg/mips16e_translate.c.inc   |   2 +-
 target/mips/tcg/nanomips_translate.c.inc  |   4 +-
 20 files changed, 230 insertions(+), 501 deletions(-)

-- 
2.25.1


