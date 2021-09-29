Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8B41C54B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:13:24 +0200 (CEST)
Received: from localhost ([::1]:46452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZOl-0008Lx-OC
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHi-00063s-FB
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:06 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHd-0005zX-HX
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:06 -0400
Received: by mail-oi1-x232.google.com with SMTP id t189so2788343oie.7
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=85Jc7AM89rkpp45BYHfsNe5uuw5UcZrhaUJXuiCTEJo=;
 b=iaQZL4MrhzHAtbS2bE89AyKBqMJC+TDzSMMW37bgdirnhwAX1G5NkxwMdsWGKRD/Jr
 LxrgYuHPAD7r/Jp92CsCqoZIgt+cSP+0E6rPdRBmdikZyf2jOcwXbLIb7ta+vflVo7gF
 hgYs9qiYPcPUrmV4SvIsRJj2yl2V3KpLnumlN6/KTGYDcvGYdktL7sBLt/UMscXFFbHh
 qRZubl9AQUTxCfFAgwYm3VYDDoQeVIVXcMJbCIOoyl7pkXhXUlvGULdq/bBHHgiaWwtr
 qO6TfghcdR+utlLCkbQjVchgkypOkIAVMhDC0PUzPBFH1rIKt0j1GfeQJ/bHOf2oqecp
 1x7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=85Jc7AM89rkpp45BYHfsNe5uuw5UcZrhaUJXuiCTEJo=;
 b=o4yLbW6pIEgkAljvRBchBOW75S01kU7lpXTPMgBVu8pps2ACosGUP36QRkwgBwIuZW
 Y8q/DeD6EJ82M1aKSg5eYZQFuMAR37y1+Q+c4+sGjNqcxc5Pe2SXmHk/wY3xhZymKf4D
 gHNQxB4NTlJuiWeojcrG9lMqkCy28dV+lUbwg1cjsjttoz49M1ohhgjGTGf3e1vod8zp
 /06dlKBa5n3bRsNxeSCGwSj0FzW7JBspb1vjjJ6TDfWXTamwfIEqOx3VtL7Bx1CFo5tw
 f9Ekgr+pPs7LwpyAI7yabOi9/J9Vz26x000UbsgItnO4XIDTGz72EgKtt0dhJpAef/OD
 PXTw==
X-Gm-Message-State: AOAM5310/a8vWg1oKZqLcKFQ00fvtDeZFnQsz03bhUHmQMg/d9WxhOr5
 Tz30FAry+w8+JJutjRkKNM3LX26L/JI9jQ==
X-Google-Smtp-Source: ABdhPJy8YXN7u/+Yy9u0DYbrX9Hm/+cyxBZ2rLsl+lujwvcMAdlMS4ovcHOB9oWULpToLgFeIH5gcQ==
X-Received: by 2002:aca:a852:: with SMTP id r79mr7791912oie.66.1632920758388; 
 Wed, 29 Sep 2021 06:05:58 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:05:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/26] linux-user: Move signal trampolines to new page
Date: Wed, 29 Sep 2021 09:05:27 -0400
Message-Id: <20210929130553.121567-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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

Changes for v5:
  * Fix arm thumb code copy.
  * Re-enable signals test (except hppa & sh4).

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

Richard Henderson (26):
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
  tests/tcg/multiarch: Re-enable signals test for most guests

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
 linux-user/arm/signal.c               | 580 +++++++++-----------------
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
 tests/tcg/hppa/Makefile.target        |   7 +
 tests/tcg/i386/Makefile.target        |   3 -
 tests/tcg/multiarch/Makefile.target   |   8 -
 tests/tcg/sh4/Makefile.target         |   7 +
 43 files changed, 613 insertions(+), 604 deletions(-)

-- 
2.25.1


