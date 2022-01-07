Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A1487E55
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:35:04 +0100 (CET)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wt5-0007m6-Kg
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqu-00057i-9M
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:48 -0500
Received: from [2607:f8b0:4864:20::42b] (port=40468
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqs-0007lc-Lg
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:47 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q3so6180388pfs.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qprxjkoevxt+mDhFDpQCbe8uarVTqZku51VqXUNiNP0=;
 b=DNxdvAsaSefdcWzIsjmL/hD2YZ4nxMmfdGxGAd0iOgW6r2qSqq+1IM+263SsgowuGt
 JkjTCeQCJWhCVWHQkJ1MtAeWDzqAWtS9VX6Uj1nOC18JUtAbtGqQNUGd060KbptjDFUe
 Nl6wFL4ZrkFq8E82kF1t46l0scrKEnoAZWp9AeAetBEnbHe9bzjAjxNZjNleaQDVPyTc
 aaNuaULKkIbC318q0ybAYa6J9whehwvVlMgrjAqn9SxLRO9wBP7stGPHMrk0ht/PWxfs
 svdUm6eN5JZKUeQF+i/oRjfJeTrIAZN14EJSovqyBGKk7kfHDVnPXr7m3nLkhK6FOdmC
 K13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qprxjkoevxt+mDhFDpQCbe8uarVTqZku51VqXUNiNP0=;
 b=LvIn+HiiRZ0ckmysdlhhYVcAIkybZz1Jl32Am4dLq/3Fr2/+nSOh/3VUz/MQtSPp8s
 HEEkGvV6LGrKB3F4SELte5Eo/pu+Xtq1qiuoDTn5sajYjHdSxCquTplE59umWRiQ2LYJ
 uAQD7btCeeSjETOsgIYnilzrEiI6EKQecy/q97GtjeU48a6w0hrug+16UhtK186mOn7W
 GaVnC/WlcwJW6KYUwGkudmebPExt6c9a+PNvcQt4NXZ4KVf+PqQYXcC9vnzqmgkud7FJ
 +Vpz+A+7mFXRGxfeFTrDQVt7c2yT+EprbvyP/G2NiHFgyBloTCnWrhtDs4g34R1Lo1yU
 b1HQ==
X-Gm-Message-State: AOAM532RF4xiOFN9OvQJ0ibfsPUsz1NnFf/URGKSOfQecbGH0eC9VxKg
 bmutXVzgVFoMf1Gh1QjF92qWlXls+Suvkw==
X-Google-Smtp-Source: ABdhPJwiVkKUk3M/e8lXeE32MabrykSQKvyFnGtSZiCTkX4cz5DwgH6CV7O94uf9lPia4kaLBeEnVQ==
X-Received: by 2002:a05:6a00:1402:b0:4bc:a31c:72c1 with SMTP id
 l2-20020a056a00140200b004bca31c72c1mr25226003pfu.66.1641591164847; 
 Fri, 07 Jan 2022 13:32:44 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/24] linux-user: Clean up siginfo_t handling
Date: Fri,  7 Jan 2022 13:32:19 -0800
Message-Id: <20220107213243.212806-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Changes from v4:
  * Rebase on master.

All patches are reviewed.


r~


Richard Henderson (24):
  linux-user/alpha: Set TRAP_UNK for bugchk and unknown gentrap
  linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
  linux-user/alpha: Use force_sig_fault
  linux-user/cris: Use force_sig_fault
  linux-user/hppa: Use force_sig_fault
  linux-user/hppa: Use the proper si_code for PRIV_OPR, PRIV_REG,
    OVERFLOW
  linux-user: Remove TARGET_NSIGFPE
  linux-user/hppa: Set FPE_CONDTRAP for COND
  linux-user/i386: Split out maybe_handle_vm86_trap
  linux-user/i386: Use force_sig, force_sig_fault
  linux-user/m68k: Use force_sig_fault
  linux-user/microblaze: Use force_sig_fault
  linux-user/microblaze: Fix SIGFPE si_codes
  linux-user/mips: Improve do_break
  linux-user/mips: Use force_sig_fault
  target/mips: Extract break code into env->error_code
  target/mips: Extract trap code into env->error_code
  linux-user/openrisc: Use force_sig_fault
  linux-user/ppc: Use force_sig_fault
  linux-user/riscv: Use force_sig_fault
  linux-user/s390x: Use force_sig_fault
  linux-user/sh4: Use force_sig_fault
  linux-user/sparc: Use force_sig_fault
  linux-user/xtensa: Use force_sig_fault

 linux-user/syscall_defs.h                 |   3 +-
 target/mips/tcg/translate.h               |   1 +
 linux-user/alpha/cpu_loop.c               |  61 +++-----
 linux-user/cris/cpu_loop.c                |  12 +-
 linux-user/hppa/cpu_loop.c                |  26 ++--
 linux-user/i386/cpu_loop.c                |  78 +++++-----
 linux-user/m68k/cpu_loop.c                |  24 +---
 linux-user/microblaze/cpu_loop.c          |  71 +++++----
 linux-user/mips/cpu_loop.c                | 166 +++++-----------------
 linux-user/openrisc/cpu_loop.c            |  18 +--
 linux-user/ppc/cpu_loop.c                 | 136 ++++--------------
 linux-user/riscv/cpu_loop.c               |  31 +---
 linux-user/s390x/cpu_loop.c               |   7 +-
 linux-user/sh4/cpu_loop.c                 |   6 +-
 linux-user/sparc/cpu_loop.c               |  14 +-
 linux-user/xtensa/cpu_loop.c              |  26 ++--
 target/mips/tcg/translate.c               |  36 ++++-
 target/mips/tcg/micromips_translate.c.inc |  10 +-
 target/mips/tcg/mips16e_translate.c.inc   |   2 +-
 target/mips/tcg/nanomips_translate.c.inc  |   4 +-
 20 files changed, 230 insertions(+), 502 deletions(-)

-- 
2.25.1


