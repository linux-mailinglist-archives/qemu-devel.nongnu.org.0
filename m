Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6633CC096
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:42:48 +0200 (CEST)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZLr-0003JP-0r
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKY-0000pG-SY
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:26 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKX-0000vo-7x
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:26 -0400
Received: by mail-pf1-x431.google.com with SMTP id q10so10329102pfj.12
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBPJifU9GtWbjqUjju7TjXsVo8JptnGEdyri+DE68Ho=;
 b=cgw7S3OeN36khEmadBwAUQvCwAx5WBZmkm11UGgUVjpxAC0r7Y+wT7fMfTXzh+zHVb
 MYCzrqreVst2faIY5lAwwMOQKvJNLne00Kio7sFYGeFDYwCcQW1efU+riCE/aAsBEjZV
 LeVXNueYTuPbgdkt73hZZJZG8fq4Prj+1n5g9SpQIzuW83Ztc4y7HTH+cSaUHglbsYYR
 7MXfxwpBU/4b8Kc1XE1qX6IpHoYbI5D2HyW/1OSvnbc1kBqyMr8zLrPqv+vzjz2TMzrS
 LHKoolzuUjeuAkThrOUWxVzKhFQ5ChTbQjjmgpYIgr0KVZJRQi4WUwsFc7WITTsQn0Rx
 Fimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBPJifU9GtWbjqUjju7TjXsVo8JptnGEdyri+DE68Ho=;
 b=GOUiRSS/2ucpNvIWAFYcYZPRaWuVqgx9LlGLpJV/Nj3/nRv1o6fBOc42uYy2v1UW0n
 IJRblecaOdRiIym3U78Wd84Wn+Is7rCOpcyOKmFsIagSDC95S7Zvx8kn/Y06y2jAvZJi
 EYRkr0rqL/pYtw11rcYSjvjQWhqEo6i7rvG9j5seMFhWdizKlT0fPD8DeYBV4UtshDGI
 FcfX1QrfhDtvhjMY08pX6cy4naVyScKYXEt8YC5GQWF+WZo/ekxHVD8Afv1avgbj4dOD
 obb+xRtQ6qgMwDumf2sZkYFxgMQvWvjTVydBizBQ6Cm46FynpC7RGQ2c+a2Mk/CZLZjy
 PZzA==
X-Gm-Message-State: AOAM531UHH0rK6Njj43NW6LD6XgmqsAoT753HAxUACPQ67zIU86zA+2F
 JWh92gIGQEgZrb55NIn2zDkV7UpeyaGkcg==
X-Google-Smtp-Source: ABdhPJwwiiCBlzS+6G3VTcNoaEn8ovQJnK4f8n/XLQkmzEuCr17H7mve/4HvEWa/dXO7IMCxasADPQ==
X-Received: by 2002:aa7:96dc:0:b029:32e:1b8f:2a3d with SMTP id
 h28-20020aa796dc0000b029032e1b8f2a3dmr13382694pfq.43.1626486083273; 
 Fri, 16 Jul 2021 18:41:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] Atomic cleanup + clang-12 build fix
Date: Fri, 16 Jul 2021 18:41:10 -0700
Message-Id: <20210717014121.1784956-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Version 2 bears little relation to version 1, in that I no longer
turn off the warning, which merely hid the problem until link time
failed to find libatomic symbols.

In the process, I found bugs wrt handling of guest memory in target/
with respect to atomics, fixed by unifying the api between softmmu
and user-only and removing some ifdefs under target/.

Unification of the api allowed some further cleanups.

I think that patches 1-6 fix all of the bugs, and that 7-11 are only
cleanup and could be left to next cycle.


r~


Richard Henderson (11):
  qemu/atomic: Use macros for CONFIG_ATOMIC64
  qemu/atomic: Simplify typeof_strip_qual
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
 accel/tcg/atomic_template.h   | 141 ++++++++---------
 accel/tcg/tcg-runtime.h       |  46 ------
 include/qemu/atomic.h         | 284 ++++------------------------------
 include/qemu/stats64.h        |   2 +-
 include/tcg/tcg.h             |  78 +++++-----
 softmmu/timers-state.h        |   2 +-
 trace/mem-internal.h          |  50 ------
 trace/mem.h                   |  50 ++++--
 accel/tcg/cputlb.c            |  49 +-----
 accel/tcg/user-exec.c         |  41 ++---
 linux-user/hppa/cpu_loop.c    |   2 +-
 target/arm/helper-a64.c       |   8 +-
 target/i386/tcg/mem_helper.c  |  15 +-
 target/m68k/op_helper.c       |  19 +--
 target/ppc/mem_helper.c       |  16 +-
 target/s390x/tcg/mem_helper.c |  19 +--
 tcg/tcg-op.c                  |  47 +-----
 util/qsp.c                    |   4 +-
 accel/tcg/atomic_common.c.inc | 107 +++++++++++--
 20 files changed, 324 insertions(+), 663 deletions(-)
 delete mode 100644 trace/mem-internal.h

-- 
2.25.1


