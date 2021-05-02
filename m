Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8450370FB4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:21:05 +0200 (CEST)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLOa-0001M9-5A
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMQ-0008Ag-Rm
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:50 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMO-0002pE-UH
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:50 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v13so1856070ple.9
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FnKIvYRhqbh2eE+ZT/G5+WgVP1rbStnMg2rdovvQbUc=;
 b=hlzpxXyemqnUpFGUdmieQ059keX+5iRJY+ZQtDzHhYAF7pCmEqIhRPR6aUx8WObmIv
 a/cNIeic5V22Ze+uL6UPWyzr+/v23Qx8XQhErUFJmipN+/f1L6hCTihSMwziIwXhZ9Kn
 EJQ/Y6BvpSiRfe8C/gJ2lqOb5Ue+4G13Yo/SsEpj+Xi9Dsso05/M5GXfLr4OaP2MUVES
 kd+UGLN8jfxrv1D9/b2M2/p7jO188AiDiaDISAXKBGDjUT+Lk9t8eJRfUqGLpaD4wuxd
 GPoXOWGC2eRtSa/EqH43l43DLkKWlH3ZHcEXmmKE2B0+kSTs8uxoArkh232b4jgg7CFp
 NZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FnKIvYRhqbh2eE+ZT/G5+WgVP1rbStnMg2rdovvQbUc=;
 b=MABWtwVG1tF+gCbqGO5GdKmZRlbNoquJtt20QSMVkmitk/SVNZhuPgh9PEbMOEUu95
 7P4IosyIpZdMALphWFbv3x5e94ZIsIkH1CsQsvYzT0mPsL1y0ajtB1NugkG18BgW4DIY
 EqnWvs6naGsNSMJFJn5UxuwUo+0Vtv9b69nMzFJfC7e+hZtIP6vapAK5cPicV2vJheNS
 jFKpdkiPLA8KgFNQoF8QfVphNbuoPe0XN+MQKwmoy09wdZu21vsE2RbWxgzfW9TrhNEe
 RvWz8ZVltO+C9fTC2YvP1cmu5wPyAOd1nv7kYsdnVKFLmELb25B8jN7pM5jR29+XCZbe
 E5cg==
X-Gm-Message-State: AOAM530qhxyZnKwxDBVrLQbAlO+Ny//cMYao+bve1fFVviP++ymi9WTp
 34fJPvPu9dRkomIA1ync6ho2+GeylTAe6g==
X-Google-Smtp-Source: ABdhPJyxVt8ghFiKjrN3jTa5ajUbB5oRCI+AkpaL5ZvTYPAFp8Zor0pOb0JDyhoRp4KB4Fiumylu3w==
X-Received: by 2002:a17:90a:4dc7:: with SMTP id
 r7mr18559403pjl.174.1619997526086; 
 Sun, 02 May 2021 16:18:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/28] tcg: Clean up code_gen_buffer allocation
Date: Sun,  2 May 2021 16:18:16 -0700
Message-Id: <20210502231844.1977630-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: <20210314212724.1917075-1-richard.henderson@linaro.org>
("tcg: Workaround macOS 11.2 mprotect bug")

Since I ran out of time at softfreeze, I put in a much smaller
patch to workaround the macOS bug.  But I think the cleanup is
still a good thing.


r~


Richard Henderson (28):
  meson: Split out tcg/meson.build
  meson: Split out fpu/meson.build
  tcg: Re-order tcg_region_init vs tcg_prologue_init
  tcg: Remove error return from tcg_region_initial_alloc__locked
  tcg: Split out tcg_region_initial_alloc
  tcg: Split out tcg_region_prologue_set
  tcg: Split out region.c
  accel/tcg: Inline cpu_gen_init
  accel/tcg: Move alloc_code_gen_buffer to tcg/region.c
  accel/tcg: Rename tcg_init to tcg_init_machine
  tcg: Create tcg_init
  accel/tcg: Merge tcg_exec_init into tcg_init_machine
  accel/tcg: Pass down max_cpus to tcg_init
  tcg: Introduce tcg_max_ctxs
  tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
  tcg: Replace region.end with region.total_size
  tcg: Rename region.start to region.after_prologue
  tcg: Tidy tcg_n_regions
  tcg: Tidy split_cross_256mb
  tcg: Move in_code_gen_buffer and tests to region.c
  tcg: Allocate code_gen_buffer into struct tcg_region_state
  tcg: Return the map protection from alloc_code_gen_buffer
  tcg: Sink qemu_madvise call to common code
  util/osdep: Add qemu_mprotect_rw
  tcg: Round the tb_size default from qemu_get_host_physmem
  tcg: Merge buffer protection and guard page protection
  tcg: When allocating for !splitwx, begin with PROT_NONE
  tcg: Move tcg_init_ctx and tcg_ctx from accel/tcg/

 meson.build               |  12 +-
 accel/tcg/internal.h      |   2 +
 include/qemu/osdep.h      |   1 +
 include/sysemu/tcg.h      |   2 -
 include/tcg/tcg.h         |  15 +-
 tcg/aarch64/tcg-target.h  |   1 +
 tcg/arm/tcg-target.h      |   1 +
 tcg/i386/tcg-target.h     |   2 +
 tcg/internal.h            |  40 ++
 tcg/mips/tcg-target.h     |   6 +
 tcg/ppc/tcg-target.h      |   2 +
 tcg/riscv/tcg-target.h    |   1 +
 tcg/s390/tcg-target.h     |   3 +
 tcg/sparc/tcg-target.h    |   1 +
 tcg/tci/tcg-target.h      |   1 +
 accel/tcg/tcg-all.c       |  33 +-
 accel/tcg/translate-all.c | 439 +----------------
 bsd-user/main.c           |   1 -
 linux-user/main.c         |   1 -
 tcg/region.c              | 994 ++++++++++++++++++++++++++++++++++++++
 tcg/tcg.c                 | 636 ++----------------------
 util/osdep.c              |   9 +
 fpu/meson.build           |   1 +
 tcg/meson.build           |  14 +
 24 files changed, 1141 insertions(+), 1077 deletions(-)
 create mode 100644 tcg/internal.h
 create mode 100644 tcg/region.c
 create mode 100644 fpu/meson.build
 create mode 100644 tcg/meson.build

-- 
2.25.1


