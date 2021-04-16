Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FEA362833
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:03:46 +0200 (CEST)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTkn-0006Um-58
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThF-0003NE-5g
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThC-0004Ah-LG
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:04 -0400
Received: by mail-pg1-x532.google.com with SMTP id q10so19811615pgj.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Evp4L9R4so9YAj1dmMhARdiMu9PTP5fTYoZIvTA1e28=;
 b=xDCoNfIkLJAr9Kw4aWTbc5EbwVU9T33lwAOHpo+uqkQYQwE4FvGvQ4r1pwbgcSQeJz
 tFuww2wKm5gCp00WyUOHN0tdSnhiDqkT+un4BKMbMoQ8xrie8Ly7mOGWNAPcvEl3SH4a
 qTxzp/eLjZkvzL64WUPwQxzPLRZhuBqnBgc036qq1JH3L44USlEnKhtDM3lfaOPdYGTd
 pOfYMk8JFNMG0+FLYGzbo8RSPJ+0acqu6Kq0cABDpPA7XbTKOzLfDGlDuB1Yg3Wv4Tnb
 oPsiGuoEnTtfKFZukf+1/Rw/6slrOnn0HEehp/gqYSv/O3h7w9bjmOq2EZ6nfC/+QApn
 G9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Evp4L9R4so9YAj1dmMhARdiMu9PTP5fTYoZIvTA1e28=;
 b=tKBWThx+ync8i+wGFdixYy2+0cbc3br0er4Hi9UB0UimIBSyCw2uK9e7zCK6l71QB7
 dNR0/7USar8uF75nOJrcd5satN0z3Mcb9zJyW/WanqeOgZJVgS85l5BxN2zcS6L7VMht
 06C+ppW5B1SvKxl8epjWlxcfGeuK6xxJcmXX58PVO3erTMSSoBNOcIHP95vENzkyTxVl
 Np5UpugerGIKWeebw1DTPZd3zTOWfL3/n7kb3f0cumdec2lCFUUWHZJsQIiEQi+/D41F
 a/GcS3nuFQtAncVaJefgrQtkfuFoBUmvMwo9lcmI6TwXw8oLKlk+SAzogqyd4AyfitoD
 P2zg==
X-Gm-Message-State: AOAM533p1t+qtOy2NkflUGiI/ntCckj9h5GNKK+x35gGor4xw39+mhCC
 KkL3qFFy0wV5kpAtDyFVsx2wK2cACGKgxg==
X-Google-Smtp-Source: ABdhPJzD6xlCrGQz219pwWvrClam/SnmYNweIEBEJeGluXzsOavCWAQZ7IZHZIvXdGqNdQkP9yw0Xw==
X-Received: by 2002:a63:f443:: with SMTP id p3mr490928pgk.378.1618599600865;
 Fri, 16 Apr 2021 12:00:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.11.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 for-6.1 00/39] target/arm: enforce alignment
Date: Fri, 16 Apr 2021 11:59:29 -0700
Message-Id: <20210416185959.1520974-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210416183106.1516563-1-richard.henderson@linaro.org
("[PATCH v5 for-6.1 0/9] target/arm mte fixes")

Patches lacking review:
  02-target-arm-Rename-TBFLAG_A32-SCTLR_B.patch
  03-target-arm-Rename-TBFLAG_ANY-PSTATE_SS.patch
  04-target-arm-Add-wrapper-macros-for-accessing-tbfla.patch
  05-target-arm-Introduce-CPUARMTBFlags.patch
  06-target-arm-Move-mode-specific-TB-flags-to-tb-cs_b.patch
  07-target-arm-Move-TBFLAG_AM32-bits-to-the-top.patch
  08-target-arm-Move-TBFLAG_ANY-bits-to-the-bottom.patch
  09-target-arm-Add-ALIGN_MEM-to-TBFLAG_ANY.patch
  21-target-arm-Enforce-alignment-for-VLDn-all-lanes.patch

Changes for v4:
  * Rebase on mte fixes and fixup minor conflict.

Changes for v3:
  * Move TBFLAG_{A64,A32,M32,AM32} to tb->cs_base, leaving only
    TBFLAG_ANY in tb->flags.  This solves our current problem of
    running out of bits in tb->flags.
  * Dropped "Enforce alignment for sve unpredicated LDR/STR";
    there are more changes required for SVE.

Changes for v2:
  * Rearranged things a bit, which has made it easy to support
    SCTLR.A/CCR.UNALIGN_TRAP.  At least for non-sve code, where
    we issue tcg load/store operations.  Predicated sve load/stores
    will require more work within the helpers.


r~


Richard Henderson (30):
  target/arm: Fix decode of align in VLDST_single
  target/arm: Rename TBFLAG_A32, SCTLR_B
  target/arm: Rename TBFLAG_ANY, PSTATE_SS
  target/arm: Add wrapper macros for accessing tbflags
  target/arm: Introduce CPUARMTBFlags
  target/arm: Move mode specific TB flags to tb->cs_base
  target/arm: Move TBFLAG_AM32 bits to the top
  target/arm: Move TBFLAG_ANY bits to the bottom
  target/arm: Add ALIGN_MEM to TBFLAG_ANY
  target/arm: Adjust gen_aa32_{ld,st}_i32 for align+endianness
  target/arm: Merge gen_aa32_frob64 into gen_aa32_ld_i64
  target/arm: Fix SCTLR_B test for TCGv_i64 load/store
  target/arm: Adjust gen_aa32_{ld,st}_i64 for align+endianness
  target/arm: Enforce word alignment for LDRD/STRD
  target/arm: Enforce alignment for LDA/LDAH/STL/STLH
  target/arm: Enforce alignment for LDM/STM
  target/arm: Enforce alignment for RFE
  target/arm: Enforce alignment for SRS
  target/arm: Enforce alignment for VLDM/VSTM
  target/arm: Enforce alignment for VLDR/VSTR
  target/arm: Enforce alignment for VLDn (all lanes)
  target/arm: Enforce alignment for VLDn/VSTn (multiple)
  target/arm: Enforce alignment for VLDn/VSTn (single)
  target/arm: Use finalize_memop for aa64 gpr load/store
  target/arm: Use finalize_memop for aa64 fpr load/store
  target/arm: Enforce alignment for aa64 load-acq/store-rel
  target/arm: Use MemOp for size + endian in aa64 vector ld/st
  target/arm: Enforce alignment for aa64 vector LDn/STn (multiple)
  target/arm: Enforce alignment for aa64 vector LDn/STn (single)
  target/arm: Enforce alignment for sve LD1R

 target/arm/cpu.h                | 105 ++++++++-----
 target/arm/translate.h          |  38 +++++
 target/arm/neon-ls.decode       |   4 +-
 target/arm/helper-a64.c         |   2 +-
 target/arm/helper.c             | 160 +++++++++++---------
 target/arm/translate-a64.c      | 214 +++++++++++++-------------
 target/arm/translate-sve.c      |   2 +-
 target/arm/translate.c          | 258 +++++++++++++++++---------------
 target/arm/translate-neon.c.inc | 117 ++++++++++++---
 target/arm/translate-vfp.c.inc  |  20 +--
 10 files changed, 555 insertions(+), 365 deletions(-)

-- 
2.25.1


