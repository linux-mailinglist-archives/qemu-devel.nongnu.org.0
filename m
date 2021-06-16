Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984A3A8E32
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:18:45 +0200 (CEST)
Received: from localhost ([::1]:48382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKCa-00078J-Dh
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6P-0005MY-OA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:21 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6G-0008JG-2l
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:21 -0400
Received: by mail-pf1-x42b.google.com with SMTP id u18so811773pfk.11
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHSnCIV82Ge9sARBFtd/73rfOAneaeCBmUE5i/C71tA=;
 b=l02ya0BjUqrHPLS7Xgef0H/p9PP0Rrq4vFKS2RxSfokaXpQXbaFm/PaWjrtN6vP5lu
 XDYrd09hE9ml4jMcxUdIDDy1yvcOu4+ExxtZyclJorMQg1oGdE+ja33FbxYY3gKQJ8Fi
 PTYU8BwTUGYoPOcHnwKLHgzCsvpy/dFe5Vjls7qeFoGVGy0TjF5kY/PaRtsyeeNWB2qY
 g4oeFHaokiG3nPq1B3vPHCPqkNWfJfzzCkdonRdE7uIzAW+wpOVDrzBvO/W3Qrs1UAKo
 CR0wK8ynOnpNgeLxC9Xzz/c92pJVKJK1YbNNO4qxERkrszzs7a9WYd5awPvLuSP9ozyI
 G+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHSnCIV82Ge9sARBFtd/73rfOAneaeCBmUE5i/C71tA=;
 b=k10p0UXuClZwlFyzh5jvrkReBZ0XwoXDlPKA66d332d4Mag1S/JmXl+Sw0rpOu8gm9
 tU/VLfR6bu1oxNgvJE7pa2J4pNklbHIiuM79yRsVngR2+lnR1bmpYbJPINbKkQzkLiLp
 Y2jAECZplF3ulBsMtW7SJIx0IgQicv+Mu0cQpjBE2Y49uszznHknnWiuw/RetF26fVpp
 V2HzVajVXuIrrPcv7xtxnFz+ziX6HtsCfC6UkvCbxRsrMUyf7miJpWvL+JzWj2b67suK
 EhipR25GE/Yjn4/sNO7jn3lZFVYlW+a2RiCFO38e40gkc+fMeCmb4ubqiWn1yv6vv1+T
 MR+A==
X-Gm-Message-State: AOAM5322lsvoRZ8AU9potJQZl/NB09oaAXfagS6zhs3R99+l49hNq84w
 ZOn/Tya/U16MV6XEurXqPlo872knyzDhPA==
X-Google-Smtp-Source: ABdhPJx5r+RwRRkAjhVrFRsI+AAwF8i90WZC4RMcLulfPLi2y93S5DIPxpJmqrJwiLXc2UPfHqm7+A==
X-Received: by 2002:a62:e50c:0:b029:2f9:b9b1:d44f with SMTP id
 n12-20020a62e50c0000b02902f9b9b1d44fmr6878395pff.42.1623805930515; 
 Tue, 15 Jun 2021 18:12:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/21] linux-user: Move signal trampolines to new page
Date: Tue, 15 Jun 2021 18:11:48 -0700
Message-Id: <20210616011209.1446045-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


r~


Richard Henderson (21):
  linux-user: Add infrastructure for a signal trampoline page
  linux-user/aarch64: Implement setup_sigtramp
  linux-user/arm: Force v2 frames for fdpic
  linux-user/arm: Implement setup_sigtramp
  linux-user/alpha: Implement setup_sigtramp
  linux-user/cris: Implement setup_sigtramp
  linux-user/hexagon: Implement setup_sigtramp
  linux-user/hppa: Document non-use of setup_sigtramp
  linux-user/i386: Implement setup_sigtramp
  linux-user/m68k: Implement setup_sigtramp
  linux-user/microblaze: Implement setup_sigtramp
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


