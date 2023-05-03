Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9FC6F50A8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:09:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Qk-0007PT-KB; Wed, 03 May 2023 02:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qi-0007Ne-Fh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:36 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qe-0001ee-0k
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:35 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f315735514so10500895e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097050; x=1685689050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3AOGf1mW/Zk+3fKqoUBt0itSEU2Fna4GeoK0odilRc0=;
 b=QbV9TAGUxENWelmgt2jK18RQjjewGQqrYU3IueA1/f7OKDdXWs+HRWR9JTm3MYYYzs
 v1Y+DL3tNadtXjv1ThQUP9S9WumZDzBbu0zQYnYqonGScNMuDuCCRnE3B/H1ce/lHpgG
 AVvACYzFBm5Jc0Z6s2zavm3Il+rdBRNmHa+Rz2Of/NVd7aErsgT+mam3Kpp3G5V9n+XC
 W/OBEtGOZw6CaL/9BHf4JkQkR9Kv1Bb8mpK5j/H6fZhogCDMEUQi7COQypziuydCGfYG
 NzsAAdDSspNuDjEd0H4xMtysRHtPHGNA5/jPkXX5G74XLgUbRzt7TLSR1AZaJo7+aUXG
 XQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097050; x=1685689050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3AOGf1mW/Zk+3fKqoUBt0itSEU2Fna4GeoK0odilRc0=;
 b=MHVJRz2IdZ2QNtD7tWOuF7CDsDXTPE+12fREtyn+5TW4iSYqx27Bdw9xJefTLDRmnT
 QvQ3pUgWAViDRqVh58IA7geXkEaxIyRozNaE6uGdSE6oSi9IX4afuW2He1eLKP2HeOJt
 jpk/0WaWQW4djKUKrYTXjdA+JquJ0lS5PcDwIPI4/nQsPMvfsG6feZX3O5eWcb1oo+5x
 YdWB9xT4EJZKXyHOoIHXxsU9n7tsmUaybVZ7pnfqTQlla3DghMchWvVZL9duj1WF8YVO
 U8dmh5iIGBo9TDWWYOqrF57lJbEcMTE8Vzb8+s2ThGHrGt8q4sKG9Dtswu0YaZqXVl8e
 z0WA==
X-Gm-Message-State: AC+VfDwNm8hr4V2TqQqFVza/dsFKtqSnQuSDw4pFM/CjfdnqZCylrrDX
 HUtLUwe29lMLFDvzp/rLCxGZTBXILCIIZIgSvRrV0A==
X-Google-Smtp-Source: ACHHUZ5CdYQvppb7s6tyuDvtv05BRWDOt2RU30F81vzZOeo4o44SjVd4aABQhNANl+sXFv0oJjCxiw==
X-Received: by 2002:adf:ee8a:0:b0:304:af8d:e27d with SMTP id
 b10-20020adfee8a000000b00304af8de27dmr754885wro.0.1683097050313; 
 Tue, 02 May 2023 23:57:30 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 00/54] tcg: Simplify calls to load/store helpers
Date: Wed,  3 May 2023 07:56:35 +0100
Message-Id: <20230503065729.1745843-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v1: https://lore.kernel.org/qemu-devel/20230408024314.3357414-1-richard.henderson@linaro.org/
v2: https://lore.kernel.org/qemu-devel/20230411010512.5375-1-richard.henderson@linaro.org/
v3: https://lore.kernel.org/qemu-devel/20230424054105.1579315-1-richard.henderson@linaro.org/

There are several changes to the load/store helpers coming, and making
sure that those changes are properly reflected across all of the backends
was harrowing.

I have gone back and restarted by hoisting the code out of the backends
and into tcg.c.  We already have all of the parameters for the host
function call abi for "normal" helpers, we simply need to apply that to
the load/store slow path.

No major changes for v4.  A few patches upstreamed, and one new one
based on Phil's review.


r~


Richard Henderson (54):
  tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/i386: Generalize multi-part load overlap test
  tcg/i386: Introduce HostAddress
  tcg/i386: Drop r0+r1 local variables from tcg_out_tlb_load
  tcg/i386: Introduce tcg_out_testi
  tcg/i386: Introduce prepare_host_addr
  tcg/i386: Use indexed addressing for softmmu fast path
  tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/aarch64: Introduce HostAddress
  tcg/aarch64: Introduce prepare_host_addr
  tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/arm: Introduce HostAddress
  tcg/arm: Introduce prepare_host_addr
  tcg/loongarch64: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/loongarch64: Introduce HostAddress
  tcg/loongarch64: Introduce prepare_host_addr
  tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/mips: Introduce prepare_host_addr
  tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/ppc: Introduce HostAddress
  tcg/ppc: Introduce prepare_host_addr
  tcg/riscv: Require TCG_TARGET_REG_BITS == 64
  tcg/riscv: Rationalize args to tcg_out_qemu_{ld,st}
  tcg/riscv: Introduce prepare_host_addr
  tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg/s390x: Introduce HostAddress
  tcg/s390x: Introduce prepare_host_addr
  tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data return
  tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
  tcg: Move TCGLabelQemuLdst to tcg.c
  tcg: Replace REG_P with arg_loc_reg_p
  tcg: Introduce arg_slot_stk_ofs
  tcg: Widen helper_*_st[bw]_mmu val arguments
  tcg: Add routines for calling slow-path helpers
  tcg/i386: Convert tcg_out_qemu_ld_slow_path
  tcg/i386: Convert tcg_out_qemu_st_slow_path
  tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Simplify constraints on qemu_ld/st
  tcg/mips: Remove MO_BSWAP handling
  tcg/mips: Reorg tlb load within prepare_host_addr
  tcg/mips: Simplify constraints on qemu_ld/st
  tcg/ppc: Reorg tcg_out_tlb_read
  tcg/ppc: Adjust constraints on qemu_ld/st
  tcg/ppc: Remove unused constraints A, B, C, D
  tcg/ppc: Remove unused constraint J
  tcg/riscv: Simplify constraints on qemu_ld/st
  tcg/s390x: Use ALGFR in constructing softmmu host address
  tcg/s390x: Simplify constraints on qemu_ld/st

 include/tcg/tcg-ldst.h               |  10 +-
 tcg/loongarch64/tcg-target-con-set.h |   2 -
 tcg/loongarch64/tcg-target-con-str.h |   1 -
 tcg/mips/tcg-target-con-set.h        |  13 +-
 tcg/mips/tcg-target-con-str.h        |   2 -
 tcg/mips/tcg-target.h                |   4 +-
 tcg/ppc/tcg-target-con-set.h         |  11 +-
 tcg/ppc/tcg-target-con-str.h         |   7 -
 tcg/riscv/tcg-target-con-set.h       |  10 -
 tcg/riscv/tcg-target-con-str.h       |   1 -
 tcg/riscv/tcg-target.h               |  22 +-
 tcg/s390x/tcg-target-con-set.h       |   2 -
 tcg/s390x/tcg-target-con-str.h       |   1 -
 tcg/tcg-internal.h                   |   4 -
 accel/tcg/cputlb.c                   |   6 +-
 tcg/tcg.c                            | 514 ++++++++++++++-
 tcg/aarch64/tcg-target.c.inc         | 363 +++++------
 tcg/arm/tcg-target.c.inc             | 718 ++++++++------------
 tcg/i386/tcg-target.c.inc            | 700 +++++++++-----------
 tcg/loongarch64/tcg-target.c.inc     | 372 ++++-------
 tcg/mips/tcg-target.c.inc            | 942 ++++++++-------------------
 tcg/ppc/tcg-target.c.inc             | 640 ++++++++----------
 tcg/riscv/tcg-target.c.inc           | 534 +++++----------
 tcg/s390x/tcg-target.c.inc           | 393 +++++------
 tcg/sparc64/tcg-target.c.inc         |   8 +-
 tcg/tcg-ldst.c.inc                   |  14 -
 26 files changed, 2340 insertions(+), 2954 deletions(-)

-- 
2.34.1


