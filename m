Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656A2D31AA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:04:33 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhLk-0000xH-8d
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIl-0007SN-Jx
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:27 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIg-0006Jl-FY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:26 -0500
Received: by mail-oi1-x236.google.com with SMTP id s2so10840883oij.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRCndp7/HIEVv/fe6sGye+LbO5nxxv9GiYms8HDhkaM=;
 b=Y81G7UhCc8OCKeIKZ5owhiM2uCHr/ra72yPzXHvbtEwz/M/9fpXjRB2/6BQX7XKJFF
 /e1knLrFWZIo6rMYFJzdaEj5o1373sCirr5djyvQKgWGGnqqZts2SsH+mqDi/OU0MNjl
 oHa3PhrxRaSDSzzEmL6XXrEDvHjENaIog9R+RMMAA19AIpzhEEfLaJxYhLBAJ6iO3v/j
 pSsazZpO+7zD8tKS20th3+hHWqKUOLH7zx6MlOtZslcMC3x5cfI7bkSqeztdIpxYI3Wz
 w4yPT8WNysgV5xgO09Xmbj0YEJgr32Pg+bTJXycGKBkk3K4VrURnVn1FzF6lwfic8Eo4
 1Bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRCndp7/HIEVv/fe6sGye+LbO5nxxv9GiYms8HDhkaM=;
 b=XWN7dSkComyTsFgq3T9TQ75ma7UzUyeK9q2CkflOWe++y60RH3ZajfzDRWsYgT4og/
 Nu3+BO8DBqxxXuND5MWTBMV9lN/dBpEccwM/reOu5rwOYVzfamobpiEc+IZmgcvZC9GF
 H4yswCMKFPxD5O21MvFk/X6HEpgqNg3Zhwe77fY8Wqv5fsKMQBCb4lvjkvI5Jlr0jsXS
 NEluhDu3JSGMignAkxl/Uat3IcW0P8kG0z6ZNQapg/EJFE5xpFpPhv7U041vmcy8BXwe
 BlX0+5AYA8mnErozc5xetT6E+gW4wbSs1JD0ghwU5a3OscQvv/fb9sj2pHguS/vmPuz2
 tjlA==
X-Gm-Message-State: AOAM531MSyKX2fYX6ZZ+qUDc+zEXoEZgwkl0I/cRTAFBneY9rj9hl6dW
 +VHVqsCamUU1JX1DyxmFxcG7NluChseZNs7K
X-Google-Smtp-Source: ABdhPJy0CroH3kQDsKwaBAHrDrvO6n8DaVqjA+GGU0kFGFNRA/mqGVaABIoyAhnzr9GzkD1Bbcu26A==
X-Received: by 2002:a54:4f08:: with SMTP id e8mr2830675oiy.110.1607450480455; 
 Tue, 08 Dec 2020 10:01:20 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] target/arm: enforce alignment
Date: Tue,  8 Dec 2020 12:00:54 -0600
Message-Id: <20201208180118.157911-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For version 2, I've rearranged things a bit, which has made it easy
to support SCTLR.A/CCR.UNALIGN_TRAP.  At least for non-sve code,
where we issue tcg load/store operations.  Predicated sve load/stores
will require more work within the helpers.

I've not explicitly tested the SCTLR.A support, since I don't have
any code that tries to enable it.  Though it seems obvious enough.
I will look into writing a small semihosting test case using our
existing test infrastructure shortly.


r~


Supercedes: <20201125040642.2339476-1-richard.henderson@linaro.org>


Richard Henderson (24):
  target/arm: Fix decode of align in VLDST_single
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
  target/arm: Enforce alignment for VLD1 (all lanes)
  target/arm: Enforce alignment for VLDn/VSTn (multiple)
  target/arm: Enforce alignment for VLDn/VSTn (single)
  target/arm: Use finalize_memop for aa64 gpr load/store
  target/arm: Use finalize_memop for aa64 fpr load/store
  target/arm: Enforce alignment for aa64 load-acq/store-rel
  target/arm: Use MemOp for size + endian in aa64 vector ld/st
  target/arm: Enforce alignment for aa64 vector LDn/STn (multiple)
  target/arm: Enforce alignment for aa64 vector LDn/STn (single)
  target/arm: Enforce alignment for sve LD1R
  target/arm: Enforce alignment for sve unpredicated LDR/STR

 target/arm/cpu.h                |  20 +--
 target/arm/translate.h          |  27 +++++
 target/arm/neon-ls.decode       |   4 +-
 target/arm/helper.c             |  19 ++-
 target/arm/translate-a64.c      | 175 ++++++++++++++-------------
 target/arm/translate-sve.c      |  60 ++++++---
 target/arm/translate.c          | 207 ++++++++++++++++++--------------
 target/arm/translate-neon.c.inc |  85 ++++++++++---
 target/arm/translate-vfp.c.inc  |  20 +--
 9 files changed, 391 insertions(+), 226 deletions(-)

-- 
2.25.1


