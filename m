Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A123629E7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:05:21 +0200 (CEST)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXVeS-000676-IR
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc0-0003pn-7p
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:48 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVbx-0000wv-25
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:02:48 -0400
Received: by mail-pl1-x632.google.com with SMTP id t22so14309057ply.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ie9r6EOQypZoQYkbRn9pO7nDggqaoqaomu+rCPA0MmU=;
 b=epeFFpziAOMORL8aFyTO4bT0W1OpGNtSNSYlhywiiVph4Rk8+tEPVWltWraNpv96A9
 +AP0AldYN4c+gIWOnJ5h2Q+7kOkwg2B2Xd3MgnNeStSdpVsSjO4J3yp30RORPuI68O/c
 9c4UkxYJJjFu8bLXqQH7xDCp7BTl7SMyxQ+vZdhM5unEx+OU9MgX3u7i3EUO5EHfFYti
 Up3u7YtDFptg/7QGJjzmji43yb3/H7BW3SXBn396kz5qei7G8R2laPQtVs2R/FpB9H6/
 G8hh8U2RPvMCEEHUiO2JB9UKdkKJUTkuiqhW5y4gbL96ep6sLaKyb1pEBVTut7gItG3e
 /Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ie9r6EOQypZoQYkbRn9pO7nDggqaoqaomu+rCPA0MmU=;
 b=UYT08KGlQkqAljUHZQU2p+IU9O30Z0XxfnQDdvpnmVY5Y0jbh2UCNjyuK79bdvObaP
 DrUEM+73+Yd0AstXZFe/VPvXtM3ZMgO0HV7RlNPIdMXODkJbnYwaDpW7pR3GunbYvnWw
 r3Lyi1Y2gYIcfIsRJYZ6ng5/tt1s865jmroA4RCVwyxL6jna6bBBL5rGEizbos2A4UG9
 eXvOBSbDJEGe3jL5dFOznxOn1UJ+olsCJ79mzsw4YmkWXPhNtYqromhmi1bNZprKwGE4
 axI8/eYQQIXVhv9xIJItkoqzlDyK4XNsNnOWi9qndkOv5mNBYT6K40dV7DVB13KlqOMh
 +NVw==
X-Gm-Message-State: AOAM53103Pu0juSngzaETFpPDAzIZnoxAPbxV4QENJ/Za/AKPcyQgD1Y
 u93NhJTsXn8GFQ3EKon6VY0EA5e7BpVvyQ==
X-Google-Smtp-Source: ABdhPJwaVTfMtBGJhaqFwkdbTslUJXGqDehZ+69kIhb2xuqnyj714ve8ZRofvdEeI8aN0kSnXnu4Rw==
X-Received: by 2002:a17:902:e843:b029:eb:8aff:360 with SMTP id
 t3-20020a170902e843b02900eb8aff0360mr8028411plg.1.1618606963205; 
 Fri, 16 Apr 2021 14:02:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 for-6.1 00/81] target/arm: Implement SVE2
Date: Fri, 16 Apr 2021 14:01:19 -0700
Message-Id: <20210416210240.1591291-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210416185959.1520974-1-richard.henderson@linaro.org
("[PATCH v4 for-6.1 00/39] target/arm: enforce alignment")

And of course, since I messed up the alignment subject, our tooling
isn't going to thread this properly.  So:

https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-sve2
https://gitlab.com/rth7680/qemu/-/commit/cccb2c67e975322f006e81adb3cf5e235254f254

Changes since v4:
  * Rebased on mte + alignment changes.
  * Implement integer matrix multiply accumulate.
  * Change to decode to facilitate bfloat16.


r~


Richard Henderson (63):
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
  target/arm: Implement PMULLB and PMULLT
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
  target/arm: Implement SVE mixed sign dot product (indexed)
  target/arm: Implement SVE mixed sign dot product
  target/arm: Implement SVE2 crypto unary operations
  target/arm: Implement SVE2 crypto destructive binary operations
  target/arm: Implement SVE2 crypto constructive binary operations
  target/arm: Share table of sve load functions
  target/arm: Implement SVE2 LD1RO
  target/arm: Implement 128-bit ZIP, UZP, TRN
  target/arm: Implement aarch64 SUDOT, USDOT
  target/arm: Split out do_neon_ddda_fpst
  target/arm: Remove unused fpst from VDOT_scalar
  target/arm: Fix decode for VDOT (indexed)
  target/arm: Split decode of VSDOT and VUDOT
  target/arm: Implement aarch32 VSUDOT, VUSDOT
  target/arm: Implement integer matrix multiply accumulate
  target/arm: Enable SVE2 and some extensions

Stephen Long (18):
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
  target/arm: Implement SVE2 FCVTNT
  target/arm: Implement SVE2 FCVTLT
  target/arm: Implement SVE2 FCVTXNT, FCVTX
  target/arm: Implement SVE2 FLOGB
  target/arm: Implement SVE2 bitwise shift immediate
  target/arm: Implement SVE2 fp multiply-add long

 target/arm/cpu.h                |   66 +
 target/arm/helper-sve.h         |  681 ++++++-
 target/arm/helper.h             |  111 +-
 target/arm/translate-a64.h      |    3 +
 target/arm/vec_internal.h       |  143 ++
 target/arm/neon-shared.decode   |   24 +-
 target/arm/sve.decode           |  525 +++++-
 target/arm/cpu.c                |    1 +
 target/arm/cpu64.c              |   13 +
 target/arm/helper.c             |    3 +-
 target/arm/kvm64.c              |   11 +
 target/arm/neon_helper.c        |  507 +----
 target/arm/sve_helper.c         | 1904 ++++++++++++++++++-
 target/arm/translate-a64.c      |  111 +-
 target/arm/translate-sve.c      | 3117 +++++++++++++++++++++++++++++--
 target/arm/vec_helper.c         |  854 ++++++++-
 target/arm/translate-neon.c.inc |  231 ++-
 17 files changed, 7367 insertions(+), 938 deletions(-)

-- 
2.25.1


