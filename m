Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BE4B043C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:09:33 +0100 (CET)
Received: from localhost ([::1]:48296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0lw-0006oi-BK
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:09:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hA-0003tw-R9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:36 -0500
Received: from [2607:f8b0:4864:20::432] (port=46696
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0h9-00045i-7L
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:36 -0500
Received: by mail-pf1-x432.google.com with SMTP id i21so6500550pfd.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBv8QVPyT6gYycDLYC5k+pqAGDzqvUkpcUy2Ood6pn8=;
 b=pzwKf2zck0ziE0CNJKVWDiLQRCdqeDoJRIA+mEhoOq7We2iirlHJABaRtxBkXIYP5Q
 dr7XBMlx6MBgHxqLzN8XXX6vcS6yGOPDcEyx1e+gFaYD4/3o5DsusM3wEb0RiDmoFw5x
 nkeUgoo/nvCD/hUKLEsASPdahqOsVGGW5rNtDs5/35fX04Ya3QQOuW7LALbaE9n4A6FP
 ajLCrug4BS2M0a5+RZZZnBZ06GjhgA5CHSCDFyapWkkAFZTsfiikAkXv207dGPKGBxO/
 ykz8iMzQvHhOjwP/kzCvwWva6Tv6bjsNKBg0+Vh5/kQErOjPgOgHPzM4EApE7V63CFKf
 j1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBv8QVPyT6gYycDLYC5k+pqAGDzqvUkpcUy2Ood6pn8=;
 b=U3ZI+pESubhWoFdhQr5gzwiQLcL0KCezB9BzYXQd6Z7exjSbY2PNOCTBVw/P00mN+J
 nyJWMBdvMfcBISwMCo0Mx7vd7nGEIBOByrTn/dYI5s0+D5DYiRFJqcW5IDDMbDWb/6mo
 QIT09zIA0Idpuj1j0BQxPw7m0aH/L7ZAZXkGnTMooZ08KWjnNFXdxS2OKST0yIWSardC
 mTjvJJct7N2pJvieQut6jvDRK9IvauBcP86DEowj6mYFgfJSlVkXESIevD2r3SA3pL8H
 s3mINnEkqkvYxsQfSHQFM7Vegj79q9sEriTCQ/SSt4joQ9v6wVGz2qH3n2QyWW/rv/7Q
 34xQ==
X-Gm-Message-State: AOAM5334aRuHwHMqUo0A9RqIzPF1FTA0DKiEkGZBpa2Z4ftj/hT2zOnO
 sezZ5GcmILEZ3BU827MQZ7B/V4EQkgirPMU4
X-Google-Smtp-Source: ABdhPJy3IK6l5Ey5uGUCNTyNXqXYOSq3is/yqxM6s/cKqHXsu0WGei8AWanRjyL8Ofiwg5MJrbGdZw==
X-Received: by 2002:a63:8942:: with SMTP id v63mr4631816pgd.222.1644465872899; 
 Wed, 09 Feb 2022 20:04:32 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Date: Thu, 10 Feb 2022 15:04:08 +1100
Message-Id: <20220210040423.95120-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v2:
  * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
  * Set TCR_EL1 more completely for user-only.
  * Continue to bound tsz within aa64_va_parameters;
    provide an out-of-bound indicator for raising AddressSize fault.
  * Split IPS patch.
  * Fix debug registers for LVA.
  * Fix long-format fsc for LPA2.
  * Fix TLBI page shift.
  * Validate TLBI granule vs TCR granule.

Not done:
  * Validate translation levels which accept blocks.

There is still no upstream kernel support for FEAT_LPA2,
so that is essentially untested.


r~


Richard Henderson (15):
  hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
  target/arm: Set TCR_EL1.TSZ for user-only
  target/arm: Fault on invalid TCR_ELx.TxSZ
  target/arm: Move arm_pamax out of line
  target/arm: Pass outputsize down to check_s2_mmu_setup
  target/arm: Use MAKE_64BIT_MASK to compute indexmask
  target/arm: Honor TCR_ELx.{I}PS
  target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
  target/arm: Implement FEAT_LVA
  target/arm: Implement FEAT_LPA
  target/arm: Extend arm_fi_to_lfsc to level -1
  target/arm: Introduce tlbi_aa64_get_range
  target/arm: Fix TLBIRange.base for 16k and 64k pages
  target/arm: Validate tlbi TG matches translation granule in use
  target/arm: Implement FEAT_LPA2

 include/hw/registerfields.h |  48 +++++-
 target/arm/cpu-param.h      |   4 +-
 target/arm/cpu.h            |  27 +++
 target/arm/internals.h      |  58 ++++---
 target/arm/cpu.c            |   3 +-
 target/arm/cpu64.c          |   7 +-
 target/arm/helper.c         | 332 ++++++++++++++++++++++++++++--------
 7 files changed, 378 insertions(+), 101 deletions(-)

-- 
2.25.1


