Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5EE308E1D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:12:44 +0100 (CET)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5a8I-0007e5-Ew
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6G-0005w0-O9
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:36 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5a6D-0007x3-6F
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:10:36 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 8so555010plc.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxbIQHV5NcaMIrUJA8s8pOsB9YXd2so4nhOCP1bNmYw=;
 b=S4GabLX7VLJ30/Er+nt5/ywPTppuTyy3cTKZV14hMDjC4ml9HdS6aFSRl9GV05nNtP
 vQE38IvH47f/GElJ+JQdGCYWqU26mBh50QS9vmh9ZL/UM3DdlXmHTQI+CUzp8Tlr5ZzB
 XFLlQvE7XslEfVdqr3eKI3QO2s4nalHnCZcejNS2as8WYqpyGRqNo6+fRNm5RTGelQIH
 Mhb+wyYEj1NyVf363wqOFYnzi6fAA7SdWamxQKUm8NHBMzJ3cOGbOrNOJc8QeVm+fSvh
 VY4tuRfzuTvRxKQhtL043aqcafWB/kM76sR1m8Se80O4MJo8hX7k0R2FkqqPqzUsYlWV
 39uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxbIQHV5NcaMIrUJA8s8pOsB9YXd2so4nhOCP1bNmYw=;
 b=LDVpZuxrX9jvkuhPYklyS+Y5yP+eoOQlV8wlbcrcbiiB+v7FnYObD7cZFG3CBKmYpD
 RjKRzNEpyZHuOf9iN87F+KbisI23V58jRUQt+t/z3tyCClcCuqh7bYijvxHTAfNlaWMW
 Y+OO/dfr1dnIj46n6ORMVo580NlFyb2CCCDuA7R49plURnAGQCKWZhCHx+Zv9DyBmSWB
 dvS1TUu1leFLdLEYKeqfbWtE4spBFOZBXdLb9xYSZPconpAKgqZevj6aTHldZusdOJf/
 6kjDkW0jnYzp14wXZpI3RjsXGRryeaHwGHVEBM4lyQOhBb4+gUIO0Q/LnmDetnDEG6lX
 xBKw==
X-Gm-Message-State: AOAM530ZSH4bqUZSrZTPwVIyyH9t22OQ30zqqSfXBKR7bhsh8NQHMJfF
 9DxKgdPvxAjdMxpO1dEvZhJuckLbLJ68tFNr
X-Google-Smtp-Source: ABdhPJwkLBiCXl54PbyWQ/MH+Qh85Kq+6uMZASMRKRSFQObAfubtSnQJmlGu0EKvRz2S+Rson+nj3g==
X-Received: by 2002:a17:90a:886:: with SMTP id
 v6mr6238009pjc.143.1611951031418; 
 Fri, 29 Jan 2021 12:10:31 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id d133sm9247265pfd.6.2021.01.29.12.10.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 12:10:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/24] tcg: backend constraints cleanup
Date: Fri, 29 Jan 2021 10:10:04 -1000
Message-Id: <20210129201028.787853-1-richard.henderson@linaro.org>
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

This pulls out constraints to a couple of headers, which
reduces the boilerplate just a little.

I have a longer term goal, which this aids, in which I
move some of the startup-time debug-only validation into
build/compile-time validation.  But not yet.

Changes for v3:
  * Split out tci ifdef removal.
  * Regularize ALL_GENERAL_REGS, SOFTMMU_RESERVE_REGS
    across the backends.
  * Do not lose sparc 'A' constraint (oops).
  * Fix i386 andc constraint set.

Changes for v2:
  * Rename "conset" -> "con-str" and "constr" -> "con-str" (pmm).
  * Fix a bunch of comment spelling mistakes.
  * Add some macro usage comments.

Patches lacking review:
  02-tcg-tci-Remove-TCG_TARGET_HAS_-ifdefs.patch
  03-tcg-i386-Move-constraint-type-check-to-tcg_target.patch
  04-tcg-i386-Tidy-register-constraint-definitions.patch
  05-tcg-i386-Split-out-target-constraints-to-tcg-targ.patch
  11-tcg-riscv-Split-out-target-constraints-to-tcg-tar.patch
  13-tcg-sparc-Split-out-target-constraints-to-tcg-tar.patch
  23-tcg-tci-Split-out-constraint-sets-to-tcg-target-c.patch


r~


Richard Henderson (24):
  tcg/tci: Drop L and S constraints
  tcg/tci: Remove TCG_TARGET_HAS_* ifdefs
  tcg/i386: Move constraint type check to tcg_target_const_match
  tcg/i386: Tidy register constraint definitions
  tcg/i386: Split out target constraints to tcg-target-con-str.h
  tcg/arm: Split out target constraints to tcg-target-con-str.h
  tcg/aarch64: Split out target constraints to tcg-target-con-str.h
  tcg/ppc: Split out target constraints to tcg-target-con-str.h
  tcg/tci: Split out target constraints to tcg-target-con-str.h
  tcg/mips: Split out target constraints to tcg-target-con-str.h
  tcg/riscv: Split out target constraints to tcg-target-con-str.h
  tcg/s390: Split out target constraints to tcg-target-con-str.h
  tcg/sparc: Split out target constraints to tcg-target-con-str.h
  tcg: Remove TCG_TARGET_CON_STR_H
  tcg/i386: Split out constraint sets to tcg-target-con-set.h
  tcg/aarch64: Split out constraint sets to tcg-target-con-set.h
  tcg/arm: Split out constraint sets to tcg-target-con-set.h
  tcg/mips: Split out constraint sets to tcg-target-con-set.h
  tcg/ppc: Split out constraint sets to tcg-target-con-set.h
  tcg/riscv: Split out constraint sets to tcg-target-con-set.h
  tcg/s390: Split out constraint sets to tcg-target-con-set.h
  tcg/sparc: Split out constraint sets to tcg-target-con-set.h
  tcg/tci: Split out constraint sets to tcg-target-con-set.h
  tcg: Remove TCG_TARGET_CON_SET_H

 tcg/aarch64/tcg-target-con-set.h |  36 ++++
 tcg/aarch64/tcg-target-con-str.h |  24 +++
 tcg/arm/tcg-target-con-set.h     |  35 +++
 tcg/arm/tcg-target-con-str.h     |  22 ++
 tcg/i386/tcg-target-con-set.h    |  55 +++++
 tcg/i386/tcg-target-con-str.h    |  33 +++
 tcg/mips/tcg-target-con-set.h    |  36 ++++
 tcg/mips/tcg-target-con-str.h    |  24 +++
 tcg/ppc/tcg-target-con-set.h     |  42 ++++
 tcg/ppc/tcg-target-con-str.h     |  30 +++
 tcg/riscv/tcg-target-con-set.h   |  30 +++
 tcg/riscv/tcg-target-con-str.h   |  21 ++
 tcg/s390/tcg-target-con-set.h    |  29 +++
 tcg/s390/tcg-target-con-str.h    |  28 +++
 tcg/sparc/tcg-target-con-set.h   |  32 +++
 tcg/sparc/tcg-target-con-str.h   |  23 ++
 tcg/sparc/tcg-target.h           |   4 -
 tcg/tci/tcg-target-con-set.h     |  25 +++
 tcg/tci/tcg-target-con-str.h     |  11 +
 tcg/tcg.c                        | 136 +++++++++++-
 tcg/aarch64/tcg-target.c.inc     | 137 ++++--------
 tcg/arm/tcg-target.c.inc         | 168 +++++----------
 tcg/i386/tcg-target.c.inc        | 317 +++++++++------------------
 tcg/mips/tcg-target.c.inc        | 173 +++++----------
 tcg/ppc/tcg-target.c.inc         | 209 ++++++------------
 tcg/riscv/tcg-target.c.inc       | 135 ++++--------
 tcg/s390/tcg-target.c.inc        | 174 ++++++---------
 tcg/sparc/tcg-target.c.inc       | 156 +++++---------
 tcg/tci/tcg-target.c.inc         | 359 +++++++++++--------------------
 29 files changed, 1244 insertions(+), 1260 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-con-set.h
 create mode 100644 tcg/aarch64/tcg-target-con-str.h
 create mode 100644 tcg/arm/tcg-target-con-set.h
 create mode 100644 tcg/arm/tcg-target-con-str.h
 create mode 100644 tcg/i386/tcg-target-con-set.h
 create mode 100644 tcg/i386/tcg-target-con-str.h
 create mode 100644 tcg/mips/tcg-target-con-set.h
 create mode 100644 tcg/mips/tcg-target-con-str.h
 create mode 100644 tcg/ppc/tcg-target-con-set.h
 create mode 100644 tcg/ppc/tcg-target-con-str.h
 create mode 100644 tcg/riscv/tcg-target-con-set.h
 create mode 100644 tcg/riscv/tcg-target-con-str.h
 create mode 100644 tcg/s390/tcg-target-con-set.h
 create mode 100644 tcg/s390/tcg-target-con-str.h
 create mode 100644 tcg/sparc/tcg-target-con-set.h
 create mode 100644 tcg/sparc/tcg-target-con-str.h
 create mode 100644 tcg/tci/tcg-target-con-set.h
 create mode 100644 tcg/tci/tcg-target-con-str.h

-- 
2.25.1


