Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C9364B1B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:24:19 +0200 (CEST)
Received: from localhost ([::1]:53494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaRO-0007th-0q
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQC-0006bx-41
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:04 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:45644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQA-0002Mk-BY
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:03 -0400
Received: by mail-qk1-x72b.google.com with SMTP id d19so1475738qkk.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S8pTxmjqmypJlm05IkYCrfC0EqI2gnIIgQU/dMJ+5k4=;
 b=brNsas9Pj2zSnHW4u1AA1t+49kwNjsJG8Eo7Y7RPkYAnPMaTWA3MqNzCsGWExA2Sim
 pJWtvEL/QcyqVi4/5SwW4QHhoEdWLPQHaw+OQRQcBJrwBDuwl0A/APrPsyJ2csLVP9qk
 IZ46apmog29qt9vf4ale8AFz3372mTYb1RYeiLJm19KcfoDARUWcdkWHfnKR7U/5wV92
 GeftJhZkHt3peS2vOM9GH5MbLy8oz2oYGpbgqyIHW/UpeVa9MiuP138t/hQAZ4ZF8W1m
 cbP0GUOC52B9niHcla9FV9roklm7coVTCk6UGT72Z+ZMxsvvEQ9XI/NehOGkNpeXYNXT
 axqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S8pTxmjqmypJlm05IkYCrfC0EqI2gnIIgQU/dMJ+5k4=;
 b=kUnEdZSivsopJ5tuUa0Khk/QNykdmufKsuFRwQk2mfmHIC5nzNOpVArA4oNZi4oSSw
 BH/vLc5khiJfAIs5T5OWpTMPdRFjjH8a8xQ+bKe/9lotp6KmU9MQKU7oOfi+vU806JBq
 iuWFVKXV9v+u53oZrm+1iIfrLD7UMbDYLjmcEHLCSHQLpa72vSmlg7b/XV/bGB0yfOwm
 fSyVDi9jKQWzzc4i5UwJcJmZ56r+/bNIMH/RFpQIsD6EqoHZNvgdsMoEI03BcXLLLG7I
 Qu5qb8fCi/wcc+WfJMSm8OiNGGh6Y9QPy4VgSP5CHhKgbAFyiwwpKPJV9S3Vc/qBWAdy
 MPPA==
X-Gm-Message-State: AOAM531HCt96cZlD7zndvEsUqtIDgbOYkg4CTXYge6nTnX8azsM5VkUy
 mg0L6VfIT1tJ3gAeCQMx/8TAuEmJuPewFQ==
X-Google-Smtp-Source: ABdhPJy3GWJFFQ2qMCoq3REetznyMu7+rsZNVyEk5OobQERIrBCoim2iX7OwGWo7HkouHZK0Q2gBQA==
X-Received: by 2002:a37:6508:: with SMTP id z8mr657133qkb.159.1618863781241;
 Mon, 19 Apr 2021 13:23:01 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/31] target/arm: enforce alignment
Date: Mon, 19 Apr 2021 13:22:26 -0700
Message-Id: <20210419202257.161730-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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

Changes for v5:
  * Address review issues.
  * Use cpu_abort in assert_hflags_rebuild_correctly

The only patch lacking review is the new one:
07-target-arm-Use-cpu_abort-in-assert_hflags_rebuild.patch


r~


Richard Henderson (31):
  target/arm: Fix decode of align in VLDST_single
  target/arm: Rename TBFLAG_A32, SCTLR_B
  target/arm: Rename TBFLAG_ANY, PSTATE_SS
  target/arm: Add wrapper macros for accessing tbflags
  target/arm: Introduce CPUARMTBFlags
  target/arm: Move mode specific TB flags to tb->cs_base
  target/arm: Use cpu_abort in assert_hflags_rebuild_correctly
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
 target/arm/helper.c             | 163 ++++++++++----------
 target/arm/translate-a64.c      | 214 +++++++++++++-------------
 target/arm/translate-sve.c      |   2 +-
 target/arm/translate.c          | 258 +++++++++++++++++---------------
 target/arm/translate-neon.c.inc | 117 ++++++++++++---
 target/arm/translate-vfp.c.inc  |  20 +--
 10 files changed, 556 insertions(+), 367 deletions(-)

-- 
2.25.1


