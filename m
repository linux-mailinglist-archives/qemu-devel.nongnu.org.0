Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06043CC5D8
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:26:10 +0200 (CEST)
Received: from localhost ([::1]:57638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pwv-0006VC-T9
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvG-0003sz-Ec
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvC-0002hh-Rh
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:26 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so9533138pjo.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kmvuqh9/piIrnTAkSagt41MJuI3l75ShDmGM2Mkc1IU=;
 b=Ck9ArdvIg41fhU//MfCbsbMc79ZhA0sgABXqsiJH+LM7wVuCWFiX9BBSZ41jDDhViP
 PtIbKPLc86c/8MVT8sbG/gjfQRE1NKhiTXYTr3NAC+OpnZESXpIOWQL4pRBNe1ODMYCi
 3+rIbckeRmQW5wuuRGvwYSp5oYysjCEVj3UFCRFlop2J+NgPY2QNFxpoaD7RNySTTL++
 DPxw3nmR5uwxxFiz3iGNvzPf+azFtnJ8Lptkviw/XiEDLrhf5gVZzjJq/uJ4r0lg1DlB
 IIYceRMXS3k/ad6R1LW2UTSu+WQ7RWgewBp2S2yPW1Kwzdszrg1upE6aB72q9wy/+tYB
 rRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kmvuqh9/piIrnTAkSagt41MJuI3l75ShDmGM2Mkc1IU=;
 b=TR7VUMBN9Ygu4FjLJ0LUW270ugTbEcZbhtuOfe+bNstxvQ0Kxg90IFHHzkaWDS49aR
 u3UoRXgSq5MqFUNHK+WyELH4+mhMfQ8IJi7+RYEA5IdG5rq2Wn3Ha7TnadxXj2lr/f/z
 X0mdoboWcqAE5J6jj+orAnrQqpL/X1XoWHYzLFa8Eco4r6tBXacD2ZiWx2SlK+26kGdy
 wU3mttSQ0WM/qw/UT4rneamWN95bzkpzZ2ii5tVLF7niW9A+Lixh6qwqx7x+nz+dUid6
 Ik0+Je9qd3gSCWALJpvOCf2m5hiNHMA693B8EnxIVFFip29nghYnRhYOgXMSQfS14gKT
 oz9A==
X-Gm-Message-State: AOAM531zdxJbFaokTqlld8dtlXvorh+21uXgu/G5KjwU2WmOhBbwq0s9
 omKj40zO9o+hFYnkIlBSZvyOpsTkHZ5+vA==
X-Google-Smtp-Source: ABdhPJwi7GtNj7aUI9CAZWXccpEPbYd1mfOuxDG/1Cfnx1DoYCmPfoPLqEEqmmdNs+z33iwu+6iSnw==
X-Received: by 2002:a17:902:8c83:b029:11b:3f49:f88c with SMTP id
 t3-20020a1709028c83b029011b3f49f88cmr12501405plo.63.1626549860351; 
 Sat, 17 Jul 2021 12:24:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/10] Atomic cleanup + clang-12 build fix
Date: Sat, 17 Jul 2021 12:24:09 -0700
Message-Id: <20210717192419.2066778-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is intended to fix building with clang-12 on i386.
In the process, I found bugs wrt handling of guest memory in target/
with respect to atomics, fixed by unifying the api between softmmu
and user-only and removing some ifdefs under target/.

Unification of the api allowed some further cleanups.

I think that patches 1-5 fix all of the bugs, and that 6-10 are only
cleanup and could be left to next cycle.

Changes for v3:
  * Dropped the typeof_strip_qual patch with broader testing.
  * Squashed an include fix for trace/mem.h, with plugins enabled.
  * Applied Phil's R-b.


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
 accel/tcg/atomic_template.h   | 141 +++++++++-----------
 accel/tcg/tcg-runtime.h       |  46 -------
 include/qemu/atomic.h         | 243 ++++------------------------------
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
 tcg/tcg-op.c                  |  47 ++-----
 util/qsp.c                    |   4 +-
 accel/tcg/atomic_common.c.inc | 107 +++++++++++++--
 21 files changed, 321 insertions(+), 627 deletions(-)
 delete mode 100644 trace/mem-internal.h

-- 
2.25.1


