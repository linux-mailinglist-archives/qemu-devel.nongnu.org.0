Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F432F1E7B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:05:02 +0100 (CET)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2Uv-0008GW-Uy
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RN-0005f3-0Z
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:21 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RK-0006MN-66
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id j1so346529pld.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/F/kqeHksImGvstf5taTsaI7j9+MkxMQkwgzkDOwKP0=;
 b=DKsuor1vXPGPlQYxFbaQbgeI509RcGrRpvHlU9zKMUE+dyet4PeT7FIpHCD9F5GAJF
 Uf+r5mGGOfcp1p3oxmBfbd30TNnoaE0QWlkUteBVpfsbiDOQGDftTTGmpdz9GGhm5E4o
 a1VN/++xo/Z6axdYmGA/rxRj5AuOoeXhxYmRTf2wNOhNvlMUQRWXDmuuQo6pC0P9+OT4
 v1j7QViPDcRgODsjUZ10O+27Exb1rinIIA/HI9URDbP+IQ7j0p2S9XobouAHROQoVuvS
 1dyPK+jpoqdOGRINqrKCXgnf6BattDrLmx15POgb653X+eF3263vjf7ZWQ1vI2ba/9gC
 lMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/F/kqeHksImGvstf5taTsaI7j9+MkxMQkwgzkDOwKP0=;
 b=Fcfx1khq0rfVhuz3IsjhVLGjupJPeOs1Hs1NYs5FLni6/P4nRHke6Skwh7LgL3pIun
 4h2qqGoZoyN0HjNaDqVAQu7hTLQOp+TuDTbt1CMmdQ90QYe38ixLqnHb37XOm3I4eI9s
 e60kuKwQxNyBiLr1E1MptEv9ChVLYfss3TSA6AC86+o7KRy2VvrhDXuVUaq5hni55oRY
 +KUyLcLAL1fMJcSMDoK6UWvXUR+uBatiozDnSg+AubboZuq6YvPMzDCEAh9SLLGViG1U
 Yh0hEysuYJ0mqWtQflkF32IAdOSXriFpUbWE+GfapWirEmbJEl4h/XBQOBxE6gFXKGap
 09wA==
X-Gm-Message-State: AOAM5303spQaH1LqEuSs47A2QONRCnkvqUHN7+bUPaexC20L82eu2sq6
 wQ5ECHjWfPsk1Ir9gzQ0QTEuorM31R9NYg==
X-Google-Smtp-Source: ABdhPJwR6jy8mvrpFHjLBze7Tbegg86o/eoL/c8qNzHb5ZSol1iNmOWLj+FDbZ5jVHYfz+kOp+32Cw==
X-Received: by 2002:a17:90b:14d3:: with SMTP id
 jz19mr298131pjb.196.1610391676277; 
 Mon, 11 Jan 2021 11:01:16 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/30] target/arm: enforce alignment
Date: Mon, 11 Jan 2021 09:00:43 -1000
Message-Id: <20210111190113.303726-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As reported in https://bugs.launchpad.net/bugs/1905356

Changes for v3:

* Move TBFLAG_{A64,A32,M32,AM32} to tb->cs_base, leaving only
  TBFLAG_ANY in tb->flags.  This solves our current problem of
  running out of bits in tb->flags.

* Dropped "Enforce alignment for sve unpredicated LDR/STR";
  there are more changes required for SVE, and I think I'll
  integrate those into my SVE2 patch set.

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


