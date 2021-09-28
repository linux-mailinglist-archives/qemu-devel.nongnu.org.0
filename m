Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6B41A51D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:08:54 +0200 (CEST)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2Y9-0004s3-TQ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QI-0004ZP-0X
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:51 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QF-0005ce-A7
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:45 -0400
Received: by mail-qt1-x835.google.com with SMTP id d8so18568793qtd.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L75RzGYt8Ns3QmfNNc+A2kizp0chwVcFwcXS9969nDE=;
 b=eLaG7NUydscKFRfn/zwkKZ8bx3MGs3B3wlK5AWXA5MjOLMjVLz3zicygCPwjMk0ogj
 EDAfx5XrBMG/c5PTaASR14XzFVsbYAiCf7r7t/KN975+OR2JKaP+jhkJ2gvdRpUPge9Y
 QPMv3e0O29u9vf/9hzLxUtq43ubdtj/ZliccAgKpLeacqGg/5UhOZDs/g0FsnHDmaaFc
 sQbhaJTfEaIef/P5ckKW6KS3FPNor6PTVR9bpOIgp2+nLS9AFj5n1OG7/AY8bFni0e1E
 yb0hhuQI/CCxxXbUR/TdPOXCmtzVOK8ybDyPWjgK2Nz0iuDqFANr7LWwxlXKw/++ePNq
 omlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L75RzGYt8Ns3QmfNNc+A2kizp0chwVcFwcXS9969nDE=;
 b=dlLNpYB7FozBMdvFLG88RV6HERJA28/BCjzxJHBEWY66HMCfrWViIOxPOQg6ikh/yk
 NjPsEQqWfAsWhhegtj9m3nsFGiqvPyNtQSDQjhbBrMXtE5PdY5P41bcWZpEpb19cLLrV
 nUru7QfQr2eN8RpbvzCjw2t9XllWeI+TINiNwooxFWQxayrSOdm+JUJVzLixgbGbKXlU
 L6XyZzb7s9hr7LM8nAzikZGFuGrA+e0GkTmWHxEe6NCoHFGjIWtz2l40zqwCdo4arIBG
 rA9yfZ1xD64ki8UE0ADAPX7CaJ8jDYnepeK3kZEj+PzUm5KqGV6NNaooCfiWca/3OScf
 i/iQ==
X-Gm-Message-State: AOAM533jOfbA5MaZw5atbOqoZ95puhf6vRkcpZME/uKIp75om2rxnL3p
 dz0CJ5XxQvCUGQ7c6gAUlQiQM93+cZuz5w==
X-Google-Smtp-Source: ABdhPJy0C/DeGatEeL/WVbfT0RSzR++tHzBb+96sQL06adQB/UMiiX39RpeKkuMTzTB08cY8FPqeeg==
X-Received: by 2002:ac8:5a:: with SMTP id i26mr3216924qtg.269.1632794441466;
 Mon, 27 Sep 2021 19:00:41 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/25] linux-user: Move signal trampolines to new page
Date: Mon, 27 Sep 2021 22:00:14 -0400
Message-Id: <20210928020039.184412-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Drop nios2 changes -- I still haven't built a full toolchain.
  * Clean up arm changes.
  * Minur i386 pointer type changes.

Changes for v3:
  * Drop vdsos, reinstate setup_sigtramp for all targets.
  * Incorporate nios2 kuser page emulation, which contains
    the sigtramp for that target.

Changes for v2:
  * Add vdsos for aarch64, arm, i386, riscv.
  * Drop setup_sigtramp for any target with a vdso.
  * Drop arm v1 signal support.
  * Simplify ppc encode_trampoline.


r~


Richard Henderson (25):
  linux-user: Add infrastructure for a signal trampoline page
  linux-user/aarch64: Implement setup_sigtramp
  linux-user/arm: Drop v1 signal frames
  linux-user/arm: Drop "_v2" from symbols in signal.c
  linux-user/arm: Implement setup_sigtramp
  linux-user/alpha: Implement setup_sigtramp
  linux-user/cris: Implement setup_sigtramp
  linux-user/hexagon: Implement setup_sigtramp
  linux-user/hppa: Document non-use of setup_sigtramp
  linux-user/i386: Implement setup_sigtramp
  linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not set
  linux-user/m68k: Implement setup_sigtramp
  linux-user/microblaze: Implement setup_sigtramp
  linux-user/mips: Tidy install_sigtramp
  linux-user/mips: Implement setup_sigtramp
  linux-user/nios2: Document non-use of setup_sigtramp
  linux-user/openrisc: Implement setup_sigtramp
  linux-user/ppc: Simplify encode_trampoline
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
 linux-user/hppa/target_signal.h       |  14 +
 linux-user/i386/target_signal.h       |   2 +
 linux-user/m68k/target_signal.h       |   2 +
 linux-user/microblaze/target_signal.h |   2 +
 linux-user/mips/target_signal.h       |   1 +
 linux-user/mips64/target_signal.h     |   2 +
 linux-user/nios2/target_signal.h      |   3 +
 linux-user/openrisc/target_signal.h   |   2 +
 linux-user/ppc/target_signal.h        |   2 +
 linux-user/riscv/target_signal.h      |   2 +
 linux-user/s390x/target_signal.h      |   2 +
 linux-user/sh4/target_signal.h        |   2 +
 linux-user/signal-common.h            |   6 +
 linux-user/sparc/target_signal.h      |   4 +
 linux-user/x86_64/target_signal.h     |   3 +
 linux-user/xtensa/target_signal.h     |   2 +
 linux-user/aarch64/signal.c           |  34 +-
 linux-user/alpha/signal.c             |  34 +-
 linux-user/arm/signal.c               | 583 +++++++++-----------------
 linux-user/cris/signal.c              |  29 +-
 linux-user/elfload.c                  |  14 +
 linux-user/hexagon/signal.c           |  19 +-
 linux-user/i386/signal.c              |  65 ++-
 linux-user/m68k/signal.c              |  47 +--
 linux-user/microblaze/signal.c        |  24 +-
 linux-user/mips/signal.c              |  39 +-
 linux-user/openrisc/signal.c          |  22 +-
 linux-user/ppc/signal.c               |  40 +-
 linux-user/riscv/signal.c             |  22 +-
 linux-user/s390x/signal.c             |  24 +-
 linux-user/sh4/signal.c               |  40 +-
 linux-user/signal.c                   |   3 +
 linux-user/sparc/signal.c             |  40 +-
 linux-user/xtensa/signal.c            |  56 ++-
 39 files changed, 603 insertions(+), 592 deletions(-)

-- 
2.25.1


