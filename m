Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241038F74B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:06:58 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLX7-0004BY-Ie
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUL-0000tu-54
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:05 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUH-0001bJ-MS
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:04 -0400
Received: by mail-pj1-x102d.google.com with SMTP id q6so15859981pjj.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iNhAsqSZaSR43qTuiwLvb8l5zuIIxp4+tLCtDKFOZdU=;
 b=Oi0HgbbD32SM6b1yEQYCmBQJhpwzmeILKxcAVDmT8p7Os6UEDs0SGBL3N8fymqkcP9
 9Kk6GW6dagBtEAVbOlScK6hSoeWntBrRx/hi60ydpStvxjrkhgLxoa9Q5k+fRedWkIET
 cIgdxaJ+6TbsiPE8LIpO0xyCw4EsvxS2gWAKhb1RPhQGeDbXDQrEJ/ZkZu9Des6vd8cO
 xMdhVDRk5tFMb1lEbhioG2XGHbabKLfr5ShBmCxRXP7wiSaLXPS8fFepDDaRPazw/mwN
 SGqwNkEV93A1OouoH7wAYQ2hfxd1NPGqCzd59UXb7ExPt5DKfi6doS+TJDNgBKHyVT+m
 Oiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iNhAsqSZaSR43qTuiwLvb8l5zuIIxp4+tLCtDKFOZdU=;
 b=V4Hk3aqvBFDSvYIWLoK045+2DmgbkWi3tz1BVDGqMJJbozZ1+IpPxGay/ICNAEElDI
 xBde6hK58e9BK91lt7qVQlGeL5SbeTznnj4AxZK2B4FbtGynsskEFKKD2L5AaXSpj2Zl
 jWMLIBJkk1pFW713DLhyrrXvtIzLmLZqob027PqgpC/cCURjYx3zXuoGAK9hVNHuG9SD
 fc2E9JVmDEbSo4T6sEnbe+QPA3inQaM+bBDc93wmbjQ3x94tfgoT0lh/CDvgCdkL3qdR
 A/pgCAaBfHcPSZ4H66hoK5XTnbTUyFCUKNefxx45URObHFrrJ+dOIMbi+gFjcfQh9j1G
 rzlg==
X-Gm-Message-State: AOAM530CVgAOAIEVYcETkdT0NQqT+aycxUvVj52GYmqeeXvBZ7qFFXb+
 u5Cl+kMquxjsSoKUZWqz7BFuQa+Z2LF50w==
X-Google-Smtp-Source: ABdhPJyXC1/ZqRgdSz8RVosZPwnb6crO87poiLKwb/XM3o8k9kwNuPbzGJO2ZmYf8nArKPffM8vWyw==
X-Received: by 2002:a17:90a:8581:: with SMTP id
 m1mr2819230pjn.47.1621904639796; 
 Mon, 24 May 2021 18:03:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:03:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/92] target/arm: Implement SVE2
Date: Mon, 24 May 2021 18:02:26 -0700
Message-Id: <20210525010358.152808-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Changes for v7:
  * Incorporate patch review, some of which broke out new patches.
  * Recover 4 patches which somehow got dropped during the v6 rebase.
    This should have been caught by risu testing, but I must have
    thought the rebase trivial enough to skip that step.  Oops.

The patches lacking r-b are:

 06-target-arm-Implement-SVE2-saturating-rounding-bit.patch
 48-target-arm-Use-correct-output-type-for-gvec_sdot_.patch
 60-target-arm-Implement-SVE2-multiply-add-long-index.patch
 61-target-arm-Implement-SVE2-integer-multiply-long-i.patch
 62-target-arm-Implement-SVE2-complex-integer-multipl.patch
 63-target-arm-Implement-SVE2-complex-integer-dot-pro.patch
 64-target-arm-Macroize-helper_gvec_-s-u-dot_-b-h.patch
 65-target-arm-Macroize-helper_gvec_-s-u-dot_idx_-b-h.patch
 75-target-arm-Implement-SVE2-FLOGB.patch
 76-target-arm-Share-table-of-sve-load-functions.patch
 77-target-arm-Tidy-do_ldrq.patch
 81-target-arm-Move-endian-adjustment-macros-to-vec_i.patch
 86-target-arm-Fix-decode-for-VDOT-indexed.patch
 87-target-arm-Split-out-do_neon_ddda.patch
 92-target-arm-Enable-SVE2-and-related-extensions.patch


r~


Richard Henderson (75):
  target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
  target/arm: Implement SVE2 Integer Multiply - Unpredicated
  target/arm: Implement SVE2 integer pairwise add and accumulate long
  target/arm: Implement SVE2 integer unary operations (predicated)
  target/arm: Split out saturating/rounding shifts from neon
  target/arm: Implement SVE2 saturating/rounding bitwise shift left
    (predicated)
  target/arm: Implement SVE2 integer halving add/subtract (predicated)
  target/arm: Implement SVE2 integer pairwise arithmetic
  target/arm: Implement SVE2 saturating add/subtract (predicated)
  target/arm: Implement SVE2 integer add/subtract long
  target/arm: Implement SVE2 integer add/subtract interleaved long
  target/arm: Implement SVE2 integer add/subtract wide
  target/arm: Implement SVE2 integer multiply long
  target/arm: Implement SVE2 PMULLB, PMULLT
  target/arm: Implement SVE2 bitwise shift left long
  target/arm: Implement SVE2 bitwise exclusive-or interleaved
  target/arm: Implement SVE2 bitwise permute
  target/arm: Implement SVE2 complex integer add
  target/arm: Implement SVE2 integer absolute difference and accumulate
    long
  target/arm: Implement SVE2 integer add/subtract long with carry
  target/arm: Implement SVE2 bitwise shift right and accumulate
  target/arm: Implement SVE2 bitwise shift and insert
  target/arm: Implement SVE2 integer absolute difference and accumulate
  target/arm: Implement SVE2 saturating extract narrow
  target/arm: Implement SVE2 SHRN, RSHRN
  target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
  target/arm: Implement SVE2 UQSHRN, UQRSHRN
  target/arm: Implement SVE2 SQSHRN, SQRSHRN
  target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI, WHILEHS
  target/arm: Implement SVE2 WHILERW, WHILEWR
  target/arm: Implement SVE2 bitwise ternary operations
  target/arm: Implement SVE2 saturating multiply-add long
  target/arm: Implement SVE2 saturating multiply-add high
  target/arm: Implement SVE2 integer multiply-add long
  target/arm: Implement SVE2 complex integer multiply-add
  target/arm: Implement SVE2 XAR
  target/arm: Use correct output type for gvec_sdot_*_b
  target/arm: Pass separate addend to {U,S}DOT helpers
  target/arm: Pass separate addend to FCMLA helpers
  target/arm: Split out formats for 2 vectors + 1 index
  target/arm: Split out formats for 3 vectors + 1 index
  target/arm: Implement SVE2 integer multiply (indexed)
  target/arm: Implement SVE2 integer multiply-add (indexed)
  target/arm: Implement SVE2 saturating multiply-add high (indexed)
  target/arm: Implement SVE2 saturating multiply-add (indexed)
  target/arm: Implement SVE2 saturating multiply (indexed)
  target/arm: Implement SVE2 signed saturating doubling multiply high
  target/arm: Implement SVE2 saturating multiply high (indexed)
  target/arm: Implement SVE2 multiply-add long (indexed)
  target/arm: Implement SVE2 integer multiply long (indexed)
  target/arm: Implement SVE2 complex integer multiply-add (indexed)
  target/arm: Implement SVE2 complex integer dot product
  target/arm: Macroize helper_gvec_{s,u}dot_{b,h}
  target/arm: Macroize helper_gvec_{s,u}dot_idx_{b,h}
  target/arm: Implement SVE mixed sign dot product (indexed)
  target/arm: Implement SVE mixed sign dot product
  target/arm: Implement SVE2 crypto unary operations
  target/arm: Implement SVE2 crypto destructive binary operations
  target/arm: Implement SVE2 crypto constructive binary operations
  target/arm: Implement SVE2 FCVTNT
  target/arm: Share table of sve load functions
  target/arm: Tidy do_ldrq
  target/arm: Implement SVE2 LD1RO
  target/arm: Implement 128-bit ZIP, UZP, TRN
  target/arm: Move endian adjustment macros to vec_internal.h
  target/arm: Implement aarch64 SUDOT, USDOT
  target/arm: Split out do_neon_ddda_fpst
  target/arm: Remove unused fpst from VDOT_scalar
  target/arm: Fix decode for VDOT (indexed)
  target/arm: Split out do_neon_ddda
  target/arm: Split decode of VSDOT and VUDOT
  target/arm: Implement aarch32 VSUDOT, VUSDOT
  target/arm: Implement integer matrix multiply accumulate
  linux-user/aarch64: Enable hwcap bits for sve2 and related extensions
  target/arm: Enable SVE2 and related extensions

Stephen Long (17):
  target/arm: Implement SVE2 floating-point pairwise
  target/arm: Implement SVE2 MATCH, NMATCH
  target/arm: Implement SVE2 ADDHNB, ADDHNT
  target/arm: Implement SVE2 RADDHNB, RADDHNT
  target/arm: Implement SVE2 SUBHNB, SUBHNT
  target/arm: Implement SVE2 RSUBHNB, RSUBHNT
  target/arm: Implement SVE2 HISTCNT, HISTSEG
  target/arm: Implement SVE2 scatter store insns
  target/arm: Implement SVE2 gather load insns
  target/arm: Implement SVE2 FMMLA
  target/arm: Implement SVE2 SPLICE, EXT
  target/arm: Implement SVE2 TBL, TBX
  target/arm: Implement SVE2 FCVTLT
  target/arm: Implement SVE2 FCVTXNT, FCVTX
  target/arm: Implement SVE2 FLOGB
  target/arm: Implement SVE2 bitwise shift immediate
  target/arm: Implement SVE2 fp multiply-add long

 target/arm/cpu.h              |   66 +
 target/arm/helper-sve.h       |  722 +++++++-
 target/arm/helper.h           |  110 +-
 target/arm/translate-a64.h    |    3 +
 target/arm/vec_internal.h     |  167 ++
 target/arm/neon-shared.decode |   24 +-
 target/arm/sve.decode         |  574 +++++-
 linux-user/elfload.c          |   10 +
 target/arm/cpu.c              |    2 +
 target/arm/cpu64.c            |   13 +
 target/arm/cpu_tcg.c          |    1 +
 target/arm/helper.c           |    3 +-
 target/arm/kvm64.c            |   21 +-
 target/arm/neon_helper.c      |  507 +-----
 target/arm/sve_helper.c       | 2110 ++++++++++++++++++++--
 target/arm/translate-a64.c    |  111 +-
 target/arm/translate-neon.c   |  231 ++-
 target/arm/translate-sve.c    | 3200 +++++++++++++++++++++++++++++++--
 target/arm/vec_helper.c       |  887 ++++++---
 19 files changed, 7656 insertions(+), 1106 deletions(-)

-- 
2.25.1


