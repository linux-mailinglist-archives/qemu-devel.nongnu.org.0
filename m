Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4E6479C5E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:45:49 +0100 (CET)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfeO-0003BO-0H
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:45:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfba-0000Rb-Uu
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:54 -0500
Received: from [2607:f8b0:4864:20::1031] (port=33540
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbZ-0003RT-BD
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:54 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 x1-20020a17090a2b0100b001b103e48cfaso6403904pjc.0
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BE8mYXfCImd27+gkz4uUkp9aT+vH6nolBlTkOGG98cA=;
 b=B2GmcMlQVxo60NLnBbGymKsOt+A6jZP6BYm79KmgITunn3YBpuJqe182Njezk0duKr
 um16wSKXvoXZQpCuXXUEm1qgOUpKAnPWHvQe2qR7q/UdobCDw6DKzU+FVzxZp52C/lxC
 gmmoIjPsUsVFDu8tzLeyiguLTMB9ltXppEWVbNbsMAI0OVMh8K4etTXoZDJaVuH+oR3c
 kkFwfrPz4IE8GCQFaYB1UVrxw9ajq71Fehg8o73v0S0UCUzuV1GOpqK8YGv8yGosXjor
 nBPQyNyeIW0Lj5lG1uLGccagWpR7Lvza77t5hEj4dEdhs1snJWCEkMs+Gm/wzIjypNzl
 L1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BE8mYXfCImd27+gkz4uUkp9aT+vH6nolBlTkOGG98cA=;
 b=FFp6wWe4Z66Vi8mtANL1VVUZJfXOgWML8tgXezdKz+cAn3uHx1xhHN0mNTPNEcD4Bo
 fPbopI5qMQiaPn5XFAII/pWydrjOaqp6z+J/GBPq/I4UmmXEeF3PL0/ZW5PEPUDrmFaY
 RCqEb1hdEXmwPPbdTV9r3o46Qv06aXzbT/40fgNIK40OwGri6cZYmtdV5QW9LlCbYEY7
 INlQwHOXcDUNACXdVLS0n7Lc9rPBe6Y3ThpXU/t5lGRNDK8YmRHwfprL49S8KZWKfmyj
 g9eZrryo1OKHdYrsCJC5lGVtxHt2CzkYECnVi94Yl25mHiDQMDADio3nimhv8kRqIbsI
 Uomw==
X-Gm-Message-State: AOAM531CW3IK+ECF7sS/npRsiluBLf/n4xR23QJhHWcxM614vq7ZwW+K
 IRH5goQ9vhCE3ZXdSZfV9eFYObOcw2LTFQ==
X-Google-Smtp-Source: ABdhPJxWkrb4HEZZPxuKtnrMw7VoJp4Qvw4sa1DidewZTkFrc2Q8m4tgypEgA8RhMsK0Mf/X6vLMpg==
X-Received: by 2002:a17:90b:4390:: with SMTP id
 in16mr2353865pjb.14.1639856571736; 
 Sat, 18 Dec 2021 11:42:51 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/20] tcg: vector improvements
Date: Sat, 18 Dec 2021 11:42:30 -0800
Message-Id: <20211218194250.247633-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some opcodes for compound logic operations that were so
far marked as TODO.  Implement those for PPC and S390X.

We do not want to implement 512-bit width operations, because
those trigger a cluster clock slowdown on the current set of
Intel cpus.  But there are new operations in avx512 that apply
to 128 and 256-bit vectors, which do not trigger the slowdown,
and those are very interesting.


r~


Richard Henderson (20):
  tcg/optimize: Fix folding of vector ops
  tcg: Add opcodes for vector nand, nor, eqv
  tcg/ppc: Implement vector NAND, NOR, EQV
  tcg/s390x: Implement vector NAND, NOR, EQV
  tcg/i386: Detect AVX512
  tcg/i386: Add tcg_out_evex_opc
  tcg/i386: Use tcg_can_emit_vec_op in expand_vec_cmp_noinv
  tcg/i386: Implement avx512 variable shifts
  tcg/i386: Implement avx512 scalar shift
  tcg/i386: Implement avx512 immediate sari shift
  tcg/i386: Implement avx512 immediate rotate
  tcg/i386: Implement avx512 variable rotate
  tcg/i386: Support avx512vbmi2 vector shift-double instructions
  tcg/i386: Expand vector word rotate as avx512vbmi2 shift-double
  tcg/i386: Remove rotls_vec from tcg_target_op_def
  tcg/i386: Expand scalar rotate with avx512 insns
  tcg/i386: Implement avx512 min/max/abs
  tcg/i386: Implement avx512 multiply
  tcg/i386: Implement more logical operations for avx512
  tcg/i386: Implement bitsel for avx512

 include/qemu/cpuid.h          |  20 +-
 include/tcg/tcg-opc.h         |   3 +
 include/tcg/tcg.h             |   3 +
 tcg/aarch64/tcg-target.h      |   3 +
 tcg/arm/tcg-target.h          |   3 +
 tcg/i386/tcg-target-con-set.h |   1 +
 tcg/i386/tcg-target.h         |  17 +-
 tcg/i386/tcg-target.opc.h     |   3 +
 tcg/ppc/tcg-target.h          |   3 +
 tcg/s390x/tcg-target.h        |   3 +
 tcg/optimize.c                |  61 ++++--
 tcg/tcg-op-vec.c              |  27 ++-
 tcg/tcg.c                     |   6 +
 tcg/i386/tcg-target.c.inc     | 386 ++++++++++++++++++++++++++++------
 tcg/ppc/tcg-target.c.inc      |  15 ++
 tcg/s390x/tcg-target.c.inc    |  17 ++
 16 files changed, 472 insertions(+), 99 deletions(-)

-- 
2.25.1


