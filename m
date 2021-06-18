Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499F3AD2E2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:32:22 +0200 (CEST)
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKE0-00045U-S7
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBg-0001M6-9v
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:29:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBe-0001Oo-9R
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:29:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so4393635pjo.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wv3mpzlnfIAV57P1hJ2KU7zBQ0rbv6sTsg7IkpZV+ig=;
 b=eohdhx1Le9dx+kBF603qyjYyLeZMaFsfSjtGUL0HjEgXFMgBg6GWoghxr5EWH6nURM
 ge94K+Dr77XWpZ2yLBsaVPjf8xUxhDPRJ3dI8mPNsUD/i53CfCGyNkCl6adhZclMupnC
 j368vxseNLl7FqrrvJyIX6Yq8Czct8mhFgW4gxHx9tKHpo7CapP/vygY2MpqZvOAjmdN
 2aPcq1/284vwURTrkqRplMyPhEbFFUmQoGsXRRI2k9D6uQUDtu3XyZoryjbPl9uDv6Kx
 huP7ADMJqoEkqzehMmjATAwkG6S2oAeciGtaQAy3/xwR/gw8AO4VG+fmU560htfrCNTF
 gC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wv3mpzlnfIAV57P1hJ2KU7zBQ0rbv6sTsg7IkpZV+ig=;
 b=RHMThiuwOnUEMOuu/Xosc/qgY13mI28vJVLsVmUk/gH7d3sP36HCkG2R0Bb3mQvP8s
 BK9mI0uaGFxkSQ7a5i2UC5gQxz1d92O4SsW0BbCzvCjFnOZRYGVGlVg2b+l7wt0ZtPji
 kNn2EY7P5qx/xhUcL1UlshOHNSx6/lbBnios8wyZJMlsSKs2CyrBcd+YMF+cJ4dvCIos
 mIfVFFm3RcRyJTVDZ84+dKF405aOWd/iGam5ukGOiDDc9AhRfa2ydwKCBB30CysDo2bv
 Q7Hn+JXnIs+JEt0tmfpj5ostMFfHo4XS9gmjMoiQ6t6cOSyLRC1ExdkOAN5D2XcTW/JZ
 BdDw==
X-Gm-Message-State: AOAM532yIfnILEFFfdsAa46mFoVyEbW5jCqDVNkqODBQel1PWeAVakgw
 b34XOyQGaajnpNeEraEZng4MuFreFK1Zfg==
X-Google-Smtp-Source: ABdhPJzP5RgehM9Ys6+aDj7YcBAGKPL1A8iXFTiTHlC0CeZWdK4X0V+PESpzKj5gdP84EsT4BBhlLQ==
X-Received: by 2002:a17:90a:d18f:: with SMTP id
 fu15mr3577991pjb.107.1624044592562; 
 Fri, 18 Jun 2021 12:29:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] linux-user: Move signal trampolines to new page
Date: Fri, 18 Jun 2021 12:29:28 -0700
Message-Id: <20210618192951.125651-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is my guess that the majority of the flakiness with the
linux-user signals.c test is due to a race condition between
translation and page writes.  I vaguely recall a bug report
about this, but I cannot find it now.

Since the vast majority of "self-modifying code" is due to
signal delivery, work around this by allocating a new page,
into which we write the signal handlers.

A better workaround would be to implement the vdso that is
required by many guests.  However, that is a much larger
problem, and some guests do not define a vdso in upstream
linux.  This serves as a decent fallback.

Neither bit of work, I will note, solves the posited race
condition described above.

Changes for v2:
  * Add r-b tags
  * Split arm v2_frame patch (phil)
  * Split mips install_sigtramp patch (phil)
  * Fix some arithmetic in a couple of setup_sigtramp (phil)


r~


Richard Henderson (23):
  linux-user: Add infrastructure for a signal trampoline page
  linux-user/aarch64: Implement setup_sigtramp
  linux-user/arm: Split out v2_frame
  linux-user/arm: Force v2 frames for fdpic
  linux-user/arm: Implement setup_sigtramp
  linux-user/alpha: Implement setup_sigtramp
  linux-user/cris: Implement setup_sigtramp
  linux-user/hexagon: Implement setup_sigtramp
  linux-user/hppa: Document non-use of setup_sigtramp
  linux-user/i386: Implement setup_sigtramp
  linux-user/m68k: Implement setup_sigtramp
  linux-user/microblaze: Implement setup_sigtramp
  linux-user/mips: Tidy install_sigtramp
  linux-user/mips: Implement setup_sigtramp
  linux-user/nios2: Document non-use of setup_sigtramp
  linux-user/openrisc: Implement setup_sigtramp
  linux-user/ppc: Implement setup_sigtramp
  linux-user/riscv: Implement setup_sigtramp
  linux-user/s390x: Implement setup_sigtramp
  linux-user/sh4: Implement setup_sigtramp
  linux-user/sparc: Implement setup_sigtramp
  linux-user/xtensa: Implement setup_sigtramp
  linux-user: Remove default for TARGET_ARCH_HAS_SIGTRAMP_PAGE

 linux-user/aarch64/target_signal.h    |   2 +
 linux-user/alpha/target_signal.h      |   1 +
 linux-user/arm/target_signal.h        |   2 +
 linux-user/cris/target_signal.h       |   2 +
 linux-user/hexagon/target_signal.h    |   2 +
 linux-user/hppa/target_signal.h       |  14 ++
 linux-user/i386/target_signal.h       |   2 +
 linux-user/m68k/target_signal.h       |   2 +
 linux-user/microblaze/target_signal.h |   2 +
 linux-user/mips/target_signal.h       |   1 +
 linux-user/mips64/target_signal.h     |   2 +
 linux-user/nios2/target_signal.h      |   3 +
 linux-user/openrisc/target_signal.h   |   2 +
 linux-user/ppc/target_signal.h        |   2 +
 linux-user/qemu.h                     |   7 +
 linux-user/riscv/target_signal.h      |   2 +
 linux-user/s390x/target_signal.h      |   2 +
 linux-user/sh4/target_signal.h        |   2 +
 linux-user/sparc/target_signal.h      |   4 +
 linux-user/x86_64/target_signal.h     |   3 +
 linux-user/xtensa/target_signal.h     |   2 +
 linux-user/aarch64/signal.c           |  28 ++--
 linux-user/alpha/signal.c             |  34 +++--
 linux-user/arm/signal.c               | 190 +++++++++++++++-----------
 linux-user/cris/signal.c              |  29 ++--
 linux-user/elfload.c                  |  13 ++
 linux-user/hexagon/signal.c           |  19 ++-
 linux-user/i386/signal.c              |  42 +++---
 linux-user/m68k/signal.c              |  47 +++----
 linux-user/microblaze/signal.c        |  24 +++-
 linux-user/mips/signal.c              |  39 ++++--
 linux-user/openrisc/signal.c          |  24 ++--
 linux-user/ppc/signal.c               |  34 ++---
 linux-user/riscv/signal.c             |  22 +--
 linux-user/s390x/signal.c             |  24 ++--
 linux-user/sh4/signal.c               |  40 +++---
 linux-user/signal.c                   |   3 +
 linux-user/sparc/signal.c             |  32 +++--
 linux-user/xtensa/signal.c            |  50 ++++---
 39 files changed, 488 insertions(+), 267 deletions(-)

-- 
2.25.1


