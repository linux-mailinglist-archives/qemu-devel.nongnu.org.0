Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9012B47B550
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:44:48 +0100 (CET)
Received: from localhost ([::1]:58358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQSd-00032h-34
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:44:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPd-0000A7-2h
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:41 -0500
Received: from [2607:f8b0:4864:20::435] (port=41780
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzQPb-0002vG-9o
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:41:40 -0500
Received: by mail-pf1-x435.google.com with SMTP id m1so8787305pfk.8
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pZgZQlrp1MduzEECmFq0MQfhMjHjbg/2DZlWoJmR1pc=;
 b=AMHN3IsrGZiAG0o/9zILPve+xFXgyzdjl0a6ZVqvxF15WbB+LQu0dPJa/yzXPxYIUc
 +4o/XKkcAvtQJ3L4s7gXTxHkdLOscle9brYEZ+obsrS8oSu3vqkiNW7vMVRnumsd/CRX
 lA3+FK8OSGbXVgEyAC0kg8eTn8OB4UU1xDg0mGe+AaPn+uo/OyesXP5TvAuk1MOA+zUX
 4/WZ7jhyzM/Xlcv2cdBAS26wYRRtSW2xuQ53Dm9t5fL3qXDzHJwr1Pro7j7YCaX0coCr
 HYyA28rLlNCGZuZr8kigei/6UhiChrJh/bg38AAD71OS5sdOw25o6FVhRzOWOuVvGflE
 JKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pZgZQlrp1MduzEECmFq0MQfhMjHjbg/2DZlWoJmR1pc=;
 b=vjYN+V94/s945IH6KO9FYGY/mezUmB+j5QCOVxQNPSJ4Jahfq7xhXcyZLYxjoYxSkk
 wM8mZ6f8vRXICX1UhPUEO5+CDsXSfq3tfmiq65In8wNqwa5ffCrjcOa35lcx7S2OER1K
 s4ywMm+/mj5Jol2cZ6O2IiU954rn9x5+E5x4pXL/zZMtmP/E1XQFACiZDGsF2zWNr3AC
 yneFrhnBJlNFDP/ajiI8Qo2DQBGz4h9oro21OQUhB3xVrMEJn/L6zi2t4vgy1AJ8VvP+
 RZKNhbbLa7OjWHCZJ6DHQkEbGxP8HfxFp3H78l9I+5hEgoDJ3AR0IyXJZR6qYqBVOp6M
 Pp3w==
X-Gm-Message-State: AOAM533i3L0NrXHcS0sm/gvNC+D6jX7sb5pKTMMvlOrZZTdz7EuKPkXI
 rgyBADJJQW1NLCalP1sIl2mk8fS3pX8Alg==
X-Google-Smtp-Source: ABdhPJxyYbQCLox8CozISdrK8rG4Ph4z5/fbiFwwPhiix0WlRq5gpowteKJRb1kijw5rnYKUQR/OfQ==
X-Received: by 2002:a63:6603:: with SMTP id a3mr52582pgc.578.1640036497645;
 Mon, 20 Dec 2021 13:41:37 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id u10sm12508748pfm.58.2021.12.20.13.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:41:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] linux-user: prctl improvements
Date: Mon, 20 Dec 2021 13:41:29 -0800
Message-Id: <20211220214135.189157-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is split out from a larger patch set for unaligned accesses.
The changes in target/ have no effect without the changes in tcg/,
but this allows the syscall to be handled separately.


r~


Richard Henderson (6):
  linux-user: Split out do_prctl and subroutines
  linux-user: Disable more prctl subcodes
  linux-user: Add code for PR_GET/SET_UNALIGN
  target/alpha: Implement prctl_unalign_sigbus
  target/hppa: Implement prctl_unalign_sigbus
  target/sh4: Implement prctl_unalign_sigbus

 include/hw/core/cpu.h                     |   3 +
 linux-user/aarch64/target_prctl.h         | 160 +++++++
 linux-user/aarch64/target_syscall.h       |  23 -
 linux-user/alpha/target_prctl.h           |   1 +
 linux-user/arm/target_prctl.h             |   1 +
 linux-user/cris/target_prctl.h            |   1 +
 linux-user/generic/target_prctl_unalign.h |  27 ++
 linux-user/hexagon/target_prctl.h         |   1 +
 linux-user/hppa/target_prctl.h            |   1 +
 linux-user/i386/target_prctl.h            |   1 +
 linux-user/m68k/target_prctl.h            |   1 +
 linux-user/microblaze/target_prctl.h      |   1 +
 linux-user/mips/target_prctl.h            |  88 ++++
 linux-user/mips/target_syscall.h          |   6 -
 linux-user/mips64/target_prctl.h          |   1 +
 linux-user/mips64/target_syscall.h        |   6 -
 linux-user/nios2/target_prctl.h           |   1 +
 linux-user/openrisc/target_prctl.h        |   1 +
 linux-user/ppc/target_prctl.h             |   1 +
 linux-user/riscv/target_prctl.h           |   1 +
 linux-user/s390x/target_prctl.h           |   1 +
 linux-user/sh4/target_prctl.h             |   1 +
 linux-user/sparc/target_prctl.h           |   1 +
 linux-user/x86_64/target_prctl.h          |   1 +
 linux-user/xtensa/target_prctl.h          |   1 +
 target/alpha/cpu.h                        |   5 +
 target/hppa/cpu.h                         |   5 +-
 target/sh4/cpu.h                          |   4 +
 cpu.c                                     |  20 +-
 linux-user/syscall.c                      | 490 +++++++++-------------
 target/alpha/translate.c                  |  31 +-
 target/hppa/translate.c                   |  19 +-
 target/sh4/translate.c                    |  50 ++-
 33 files changed, 600 insertions(+), 355 deletions(-)
 create mode 100644 linux-user/aarch64/target_prctl.h
 create mode 100644 linux-user/alpha/target_prctl.h
 create mode 100644 linux-user/arm/target_prctl.h
 create mode 100644 linux-user/cris/target_prctl.h
 create mode 100644 linux-user/generic/target_prctl_unalign.h
 create mode 100644 linux-user/hexagon/target_prctl.h
 create mode 100644 linux-user/hppa/target_prctl.h
 create mode 100644 linux-user/i386/target_prctl.h
 create mode 100644 linux-user/m68k/target_prctl.h
 create mode 100644 linux-user/microblaze/target_prctl.h
 create mode 100644 linux-user/mips/target_prctl.h
 create mode 100644 linux-user/mips64/target_prctl.h
 create mode 100644 linux-user/nios2/target_prctl.h
 create mode 100644 linux-user/openrisc/target_prctl.h
 create mode 100644 linux-user/ppc/target_prctl.h
 create mode 100644 linux-user/riscv/target_prctl.h
 create mode 100644 linux-user/s390x/target_prctl.h
 create mode 100644 linux-user/sh4/target_prctl.h
 create mode 100644 linux-user/sparc/target_prctl.h
 create mode 100644 linux-user/x86_64/target_prctl.h
 create mode 100644 linux-user/xtensa/target_prctl.h

-- 
2.25.1


