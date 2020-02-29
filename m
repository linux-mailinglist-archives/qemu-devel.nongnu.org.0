Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F817442B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Feb 2020 02:29:40 +0100 (CET)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7qwk-0006Tb-ND
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 20:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvR-0004iy-Oo
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 20:28:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvQ-0005xL-Gj
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 20:28:17 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvQ-0005x7-C3
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 20:28:16 -0500
Received: by mail-pl1-x642.google.com with SMTP id y8so1896452pll.13
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 17:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIwyaFC2Y+T01ApiS+7Vr1E7LRIA76ZwzglT2YIUDQQ=;
 b=HHcmzm0vWqT25PAnzMhzksW1lARVaWQu7Es1jrgKl5hgbc70jK1VlhrQo7BoYVwC5/
 hC/ojSi2QRBsmyQlAldsqE2Rw9xCoBh1UCfHxJah3uayd/kEOkXid2i5qOPMdNljfQvr
 ZSy0k+gydTI+ShXy9/4sIgpOB7X/B8whyUSDZPTvEO14uMgh5Fe53/vK92MS0W0xZFlr
 BchZuCEVBuLQMMMQCR5woViVhFI03hh43f1hZywVmLWASqA4ojy5CrxqbDugLzrZJlfZ
 B7Zhb1Y3XwCdAs8xSbkUBZ3lbvfSVHn3JIrBshSkRs4gC98Lt2P3ABSKxBJ3ICSC2LtS
 hJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIwyaFC2Y+T01ApiS+7Vr1E7LRIA76ZwzglT2YIUDQQ=;
 b=HvSRFSjam1gnWikaZziFh5WBMlctc2pXuCmhchbPSHAHxOnDnonj8qlcim17H8fABu
 fu24cI909kkyssmpa2U2r91qc9BxHM5pHGFuFIhNb1rBySKJAvIEgMjzbTttQKmaezDy
 q5OAkcwVkq15zxxuZmW+jX4A0DgY1B8ZJfLA/3MhPRoexofZpoYM1FPOeXcsi5pJP2+K
 vXPCto9fPTYNwmzebRojxq8DpoE0jiPU/sE/py/CP4E1bTB8diiT6z/TW9ec2iSB29jJ
 UBi1Ju7oFcUXAp//pGXdexDQBzSQEUAXxUeKzmFV1JgvvLSgUSTobrdfTgeaCTbKqojG
 8WwA==
X-Gm-Message-State: APjAAAVamw9YymyecaE9pRimiBur1ptNOYF5Z+97QPleMavq2puyOg1O
 msAzUMp+yQ2N3X074JwQ7/Ii3GxdVXM=
X-Google-Smtp-Source: APXvYqxvdFJIbNKfEBMsVuo/qU5cSS1o6OWo69Gfq6XLYinHKc/IcX12amBzR6ngQpqfD1b1RYWgFg==
X-Received: by 2002:a17:90a:d350:: with SMTP id
 i16mr7694558pjx.38.1582939694747; 
 Fri, 28 Feb 2020 17:28:14 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/12] target/arm: Honor more HCR_EL2 traps
Date: Fri, 28 Feb 2020 17:27:59 -0800
Message-Id: <20200229012811.24129-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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

Changes for v5:
  * Patch 1 was broken for aa32.  Not just the masking vs the "other"
    32-bit register that Peter noticed, but more explicitly in that
    "ri" was dereferenced as NULL -- hcr_write{high,low} did not pass
    along the structure.  Oops.

    Break out a new helper that is passed a starting mask, which is
    used to preserve bits from the "other" 32-bit register.

    Check the aa64 isar registers only if aarch64 is enabled.

  * Add HCR bits from armv8.6.
  * Remove EL2 & EL3 from user-only.

  * Mask hcr_el2 bits that are res0 in aa32.
    This didn't work at first because we weren't configuring SCR_RW
    for user-only, so aarch64-linux-user thought EL2 was aa32, which
    disabled pauth.  Rather than find other corner cases like this,
    I think it makes more sense for user-only to only contend with EL1.

Patches 1-5, 12 require review.


r~


Richard Henderson (12):
  target/arm: Improve masking of HCR/HCR2 RES0 bits
  target/arm: Add HCR_EL2 bit definitions from ARMv8.6
  target/arm: Disable has_el2 and has_el3 for user-only
  target/arm: Remove EL2 and EL3 setup from user-only
  target/arm: Improve masking in arm_hcr_el2_eff
  target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
  target/arm: Honor the HCR_EL2.TSW bit
  target/arm: Honor the HCR_EL2.TACR bit
  target/arm: Honor the HCR_EL2.TPCP bit
  target/arm: Honor the HCR_EL2.TPU bit
  target/arm: Honor the HCR_EL2.TTLB bit
  tests/tcg/aarch64: Add newline in pauth-1 printf

 target/arm/cpu.h            |   7 +
 target/arm/cpu.c            |  12 +-
 target/arm/helper.c         | 358 +++++++++++++++++++++++++-----------
 tests/tcg/aarch64/pauth-1.c |   2 +-
 4 files changed, 262 insertions(+), 117 deletions(-)

-- 
2.20.1


