Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB923D03EF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:39:39 +0200 (CEST)
Received: from localhost ([::1]:51600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xSj-0008NN-Sc
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQg-0005us-8y
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQe-00008X-JD
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:29 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y3so7697171plp.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjFrMix0rAum/ifwiHX9BX7Nm9JAluHQJboKHkQ1z7M=;
 b=wGPYSpNyaFKfeCrE1mX8GhTbTSHM7684P6hzbJktiUExliwuOBW4jNXjyFaqVRXYtR
 MneG4y0+K7PdqewNbNdeNZaEEXU6qiblihxOvwkPEIebsVBLca3LUumtNVV7WP95DNfP
 TpRG9VOfQpgpIBN5w4ooF3Jy/qQ8MkmprX8Pu/WP08TL4z9YCFnDkaQL6pQ+U+6gc5Dw
 PfluWgh6pk8VlGk30nZJcW+lJ/5PZ4UjukoUfjNPRQP8V95v0e7t/UKsBNE07LylPKNR
 +jQBtm1MqvDgNbVVmPqrc7AvGFMKaPBYxPnw3a3NzYq2TYA7DPs/1YgD96vS+8jGXZKz
 LPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjFrMix0rAum/ifwiHX9BX7Nm9JAluHQJboKHkQ1z7M=;
 b=ECCqB/IZodUjZlL5Hc3MQL9xED+j/VppUHoe8rr/lupDT7z+vmORtQKwTez/w8evvX
 giATZdKwkhbbs5AIxjDolsF5KNp9+gLRYsBCiFoogA291XulGFSJhWaTuLBUk1xuxkUe
 UjcBXBvNNwE1GVMZQfIbsJ5v1KR/DoStSnMvZkLg65KSwX0dSjmF5QLMqSKaSGfV/Az2
 d+Qswad2iRi3sKbAhF7pn19yXPVNcc/1BJldIgzvqcnBrwt06zzFhF7cw7qqzn3/TH5F
 FAPCgpx3xiLKz5/ebzzEmcxIZdxV6ihGWLZ19beLtom3H7SPCroBzXDq7Dx+4TGQ5Gve
 onPw==
X-Gm-Message-State: AOAM533pLCvXpHjuWwTe4cLbcF/xzkKTcHO7R1+B/jTS5l2XOOezpQjw
 rLzlz0Aui21O8u4uKCuIaAayTjQJBWkR0A==
X-Google-Smtp-Source: ABdhPJzi40zsyRbQlpGShhJ+1VnGtTKfzIes0oI9MBG5AzHhi4uLu5cwD9+tz68jlLDCXkztawakjA==
X-Received: by 2002:a17:90a:f40a:: with SMTP id
 ch10mr403350pjb.149.1626817046904; 
 Tue, 20 Jul 2021 14:37:26 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/10] Atomic cleanup + clang-12 build fix
Date: Tue, 20 Jul 2021 11:37:13 -1000
Message-Id: <20210720213723.630552-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

This is intended to fix building with clang-12 on i386.

In the process, I found bugs wrt handling of guest memory in target/
with respect to atomics, fixed by unifying the api between softmmu
and user-only and removing some ifdefs under target/.

Unification of the api allowed some further cleanups.

Changes for v4:
  * Use _Generic for typechecking of CONFIG_ATOMIC64 macros (pmm).
  * Style nits in tcg-op.c (pmm).

Changes for v3:
  * Dropped the typeof_strip_qual patch with broader testing.
  * Squashed an include fix for trace/mem.h, with plugins enabled.


All patches have at least one R-b; barring further comment
I plan to include this in a pull request tomorrow.


r~


Richard Henderson (10):
  qemu/atomic: Use macros for CONFIG_ATOMIC64
  qemu/atomic: Remove pre-C11 atomic fallbacks
  qemu/atomic: Add aligned_{int64,uint64}_t types
  tcg: Rename helper_atomic_*_mmu and provide for user-only
  accel/tcg: Standardize atomic helpers on softmmu api
  accel/tcg: Fold EXTRA_ARGS into atomic_template.h
  accel/tcg: Remove ATOMIC_MMU_DECLS
  accel/tcg: Expand ATOMIC_MMU_LOOKUP_*
  trace: Fold mem-internal.h into mem.h
  accel/tcg: Push trace info building into atomic_common.c.inc

 configure                     |   7 -
 accel/tcg/atomic_template.h   | 141 +++++++++----------
 accel/tcg/tcg-runtime.h       |  46 -------
 include/qemu/atomic.h         | 247 +++++-----------------------------
 include/qemu/stats64.h        |   2 +-
 include/tcg/tcg.h             |  78 +++++------
 softmmu/timers-state.h        |   2 +-
 trace/mem-internal.h          |  50 -------
 trace/mem.h                   |  50 +++++--
 accel/tcg/cputlb.c            |  49 +------
 accel/tcg/user-exec.c         |  41 +++---
 linux-user/hppa/cpu_loop.c    |   2 +-
 plugins/core.c                |   2 +-
 target/arm/helper-a64.c       |   8 +-
 target/i386/tcg/mem_helper.c  |  15 +--
 target/m68k/op_helper.c       |  19 +--
 target/ppc/mem_helper.c       |  16 +--
 target/s390x/tcg/mem_helper.c |  19 +--
 tcg/tcg-op.c                  |  51 ++-----
 util/qsp.c                    |   4 +-
 accel/tcg/atomic_common.c.inc | 107 +++++++++++++--
 21 files changed, 329 insertions(+), 627 deletions(-)
 delete mode 100644 trace/mem-internal.h

-- 
2.25.1


