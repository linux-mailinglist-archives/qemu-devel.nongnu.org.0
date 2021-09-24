Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733941792A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:02:54 +0200 (CEST)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTob7-0005SH-1u
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXs-0002d3-Lx
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:33 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXp-0006rM-VL
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:31 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id f2so6679745qvx.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cWn+D8WLEAHhYELSPFQ7ITM4yRpVArK0m6kKNDdRQLc=;
 b=NHjWPdfgDggkYDvNPlPFkjhKeu5zYvaX37gvhJBHnpPvU+mfzCyg/rvq3s2Ijl7k1a
 OytoywhhrR9Lh2l7WctrEBCG4TI78qqaaLp8k10tuPjozvcI6sz2W9HkN3zluts0pmJI
 Odkel9q+ZFmkQ0tCPNtsI4feaKl4H5xheONbskSJer1ed9tVbtl26VlPWiMyWPNT/OrG
 MXDofGAuJ6viioorhTni+wNbyCSILN9r1vCNB5CvKtK6Ci7H5jNBkBFZ2II9PmSe+Ghe
 BaZVZXH5mBGUMycq6glK94kQDeHSk5fgvafuY9SK++r7fNWAtczK/zu+131chTDHjSBg
 J1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cWn+D8WLEAHhYELSPFQ7ITM4yRpVArK0m6kKNDdRQLc=;
 b=eZDzwPgPn6pWupWWGZIH24UR5Du2hpjDMnXLyaUgl190uOVS7JJNqHtXohZa9uGztH
 Km+3auboe0V4V1L9XJm8ib6PMJU7VMGzn+3UL6UijAxBCRIat6FkU/xYW8aZ4itTjgX8
 Qqb0lCTY+8pjQZ2THTla6ZbgYwjcjV+B49IhYBoKfS3Yk3ygV0uFkVd2Ky9zf/dr05z/
 IvYEzTmcsqjUvF/dx3yfqEe0HezOzC9cDQo3buoruSUj4H9k8myvaUed0cHOKHyDpYnx
 bSIbjxpIrHjLN/wvBvkjhrKx3GXhURZaTasJkwLgW92IwXUKsFcqcAeE0/DxpEvq/3WX
 Lj6A==
X-Gm-Message-State: AOAM532AIEAeR+aHQ93/20ga/KVItvTPemrx1oluMVia1tNTEpYvQsUl
 ThBYtu87bCFMr6kGpDP/pXFLb/4Cm5SagA==
X-Google-Smtp-Source: ABdhPJwpxlFxORckEnQPc1Cg+FKE+sT+hrKhNVzohFaukn1UX4sHnPux6AGHjIUfbscS6suioahy0Q==
X-Received: by 2002:a0c:906c:: with SMTP id o99mr11264531qvo.43.1632502768344; 
 Fri, 24 Sep 2021 09:59:28 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/27] linux-user: Move signal trampolines to new page
Date: Fri, 24 Sep 2021 12:58:59 -0400
Message-Id: <20210924165926.752809-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
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

Supercedes: 20210706234932.356913-1-richard.henderson@linaro.org
("[PATCH v2 00/36] linux-user: Signal trampolines and vdsos")

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


Richard Henderson (27):
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
  linux-user/nios2: Properly emulate EXCP_TRAP
  linux-user/nios2: Map a real kuser page
  linux-user/nios2: Fixes for signal frame setup
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
 target/nios2/cpu.h                    |   5 +-
 linux-user/aarch64/signal.c           |  34 +-
 linux-user/alpha/signal.c             |  34 +-
 linux-user/arm/signal.c               | 590 ++++++++++----------------
 linux-user/cris/signal.c              |  29 +-
 linux-user/elfload.c                  |  49 +++
 linux-user/hexagon/signal.c           |  19 +-
 linux-user/i386/signal.c              |  65 ++-
 linux-user/m68k/signal.c              |  47 +-
 linux-user/microblaze/signal.c        |  24 +-
 linux-user/mips/signal.c              |  39 +-
 linux-user/nios2/cpu_loop.c           |  84 ++--
 linux-user/nios2/signal.c             |  51 +--
 linux-user/openrisc/signal.c          |  22 +-
 linux-user/ppc/signal.c               |  40 +-
 linux-user/riscv/signal.c             |  22 +-
 linux-user/s390x/signal.c             |  24 +-
 linux-user/sh4/signal.c               |  40 +-
 linux-user/signal.c                   |   3 +
 linux-user/sparc/signal.c             |  40 +-
 linux-user/xtensa/signal.c            |  56 ++-
 target/nios2/translate.c              |  26 +-
 43 files changed, 744 insertions(+), 659 deletions(-)

-- 
2.25.1


