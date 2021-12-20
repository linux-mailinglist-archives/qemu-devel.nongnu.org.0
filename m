Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE147B4B9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:07:57 +0100 (CET)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPsy-0002uG-C3
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:07:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqg-00007o-8F
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:34 -0500
Received: from [2607:f8b0:4864:20::42e] (port=34683
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqe-0005sg-2n
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:33 -0500
Received: by mail-pf1-x42e.google.com with SMTP id c2so9775011pfc.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIy33TTFNcI1qOIOQXx4n8S11HOML6ddaL47SHErp14=;
 b=dU0oMNuBUGHf8fl0jeTabRVgkWKYlgsNobtGKfXgmrGjfsetuUEfjw/S29hObRuuHg
 CSB5FX8dOdKGP9nnXSwKGr48QnNj9NmIa/yinOTv21nk4D+2DlFuLWwTOduv4J+Zi+eY
 8MT7aunrmu/L66nWZfJp7+IeE+sqDUnhA/KEMtlJ/4Pz4Xl9eEYclzqG8nXTQ2uh5z34
 uLNeudkx+GG0Iwfo42kprAxoqJuriEP9ZIqICWCWD81SR8ZP4dx+AlnwScqF+E/8qK8e
 gDYvvQqoSqjbnWOsuGEv6c4DHLpjcOVhfo0Yj/q5/+YbsWO2pxQTcP6aZrsZChl/R/r7
 Cbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LIy33TTFNcI1qOIOQXx4n8S11HOML6ddaL47SHErp14=;
 b=mIdzS05FXr1knaM/PhFjm0JVJA4TYGC6lJrpV288G5hLED0ubMSMhu2czJlYAsZ73r
 rO8hdHadGqTPhJ2DQ5mHigfaKsRt1P1535Ce6ZON8j0BNxA+1g7haz4XN4UapxRH8efv
 05qthBbXYjWNBcK5kNyS9rQgc9O7GFjSAoI4ekBk9m4nwBVMoDfCADpkuzQyaZIOLSyv
 6qhERtbk+O6/uRanAQdnsWec5CRvaCBWVPOIt+mGyiiqSVyCy+3Q3aT8xVRbvXVv8cOM
 7GDmH1ofaF1mckdw6TVt3qngTbMAPhv35KAOfLEXz3iQ+gjOt8JSP55kyMH6a69XaIYf
 Tksg==
X-Gm-Message-State: AOAM5311e3Kllmvk1pjxqN6O+xtjDmzF8gqmJK1UbT1h92xtP/NMONAq
 x5TzHkj6yC1dQaChutDXxqL/C4b/icYapw==
X-Google-Smtp-Source: ABdhPJzti1X5i2PVPQk3r/+uzk+7smM1IdacVWrJ/grc5QVL+mZDEGSNOZGd1UUnrKy3atL4gJyWRw==
X-Received: by 2002:aa7:98db:0:b0:4ba:a61b:5de5 with SMTP id
 e27-20020aa798db000000b004baa61b5de5mr11564599pfm.80.1640034330423; 
 Mon, 20 Dec 2021 13:05:30 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/24] linux-user: Clean up siginfo_t handling
Date: Mon, 20 Dec 2021 13:05:04 -0800
Message-Id: <20211220210529.150423-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Changes from v3:
  * Rebase on master,
  * Remove TARGET_NSIGFPE as unused.

Patches lacking review:
  07-linux-user-Remove-TARGET_NSIGFPE.patch
  08-linux-user-hppa-Set-FPE_CONDTRAP-for-COND.patch


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


