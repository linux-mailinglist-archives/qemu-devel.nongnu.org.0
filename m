Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E15362C28
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:01:16 +0200 (CEST)
Received: from localhost ([::1]:57450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYOg-0006uf-LG
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN4-00059K-A9
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:34 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN2-0005Zq-I5
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:34 -0400
Received: by mail-pf1-x429.google.com with SMTP id o123so19363669pfb.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQu0+IbkMasD3OrPquNWb27tHEFNhu3L5F1sQpfSRH4=;
 b=hQYqp5mXbjfXCYEJURpqp/lqvqchvdsKW3ZntO1tt7Nege8VmLDpZ7jB5+Vw9GPuzF
 bWaay7JEYN7Ok7WV7q4U39BK0hMq3Ba2P0IjHwx3sVH5xjuEeDe7SWVR4sykzPofKd1L
 CTYj42FoLkDAh/oie36gxdHVbgb+i381F/jrq3yD4bgPINQOZDt+RghUw9cFOsujfEaJ
 4EulhyEOsk3pLcVmXtIVE3+pDVRxQpsC5YBUDnackigB7mlS68uT8DiEGre8hrRya+pv
 N12RlC7Jj1k9ntvENpbqVVwDKdAkyj2q8eFt4PjspEnKGu5n7SQdsPGP8DrIVGwlc485
 o0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQu0+IbkMasD3OrPquNWb27tHEFNhu3L5F1sQpfSRH4=;
 b=qFu1pYtrv4sqjk5jYaLHSYMW9QdY2/r7+LSeKALxOgE7agmkZyzlGkrdUctmZGHNVp
 RLnMV3HtQ0io27ftRqy1YyaywrADeVKT4Tqv7RaGemNVeEDnGrt9rAgJUfnzigzeWsEk
 NkpVQj7qmI1eQAaYYBr8KKqelwdCUt2Fk0zZwbZzKoWrpvGTsfwrK4U3X4NAoC7Ic5+R
 eOQt1LOMI9OF9ZnyjeL5fbtyFGUgj3NyaeDOo1eMMfChBqqtQNf7HSpLYH1J/VVAYq+G
 zfbLuqtX5YzTHbRWw55xZGeCiSUuH9ACPeCPYlyWTbDHCfvnr2tQPDtptitZpv1BNqK1
 p+8w==
X-Gm-Message-State: AOAM533SULmdLuypqKPDhq0SGTa1T1sNYUXLfiAxIK3MNrMMpYNlDn2F
 p3vh0zUU0lkXgvEpWg301LFV7XcyRR0zvw==
X-Google-Smtp-Source: ABdhPJzVNr+F6pT4M+nuIlV3/h8Z5Xlp+glOtWt3zXl+tyqy2J1ZRctEzFIKg1moDp+netqO6toZHw==
X-Received: by 2002:a63:1b5e:: with SMTP id b30mr1296397pgm.254.1618617570583; 
 Fri, 16 Apr 2021 16:59:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 for-6.1 00/11] target/arm: Implement BFloat16
Date: Fri, 16 Apr 2021 16:59:17 -0700
Message-Id: <20210416235928.1631788-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Based-on: 20210416210240.1591291-1-richard.henderson@linaro.org
("[PATCH v5 for-6.1 00/81] target/arm: Implement SVE2")

https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-bf16
https://gitlab.com/rth7680/qemu/-/commit/2ecc372b672d11fdc4e2573d789bfb3f5e6cba48

Bfloat16 is a set of 2 tightly-coupled features adding to AArch32 NEON,
AArch64 AdvSIMD, and AArch64 SVE1.  That said, there are helper functions
and decode patterns in the SVE2 patch set that help here, so I've based
this patchset on that.

Tested against FVP 11.13.36 via RISU.


r~


Richard Henderson (11):
  target/arm: Add isar_feature_{aa32,aa64,aa64_sve}_bf16
  target/arm: Unify unallocated path in disas_fp_1src
  target/arm: Implement scalar float32 to bfloat16 conversion
  target/arm: Implement vector float32 to bfloat16 conversion
  fpu: Add float_round_to_odd_inf
  target/arm: Implement bfloat16 dot product (vector)
  target/arm: Implement bfloat16 dot product (indexed)
  target/arm: Implement bfloat16 matrix multiply accumulate
  target/arm: Implement bfloat widening fma (vector)
  target/arm: Implement bfloat widening fma (indexed)
  target/arm: Enable BFloat16 extensions

 include/fpu/softfloat-types.h   |   4 +-
 target/arm/cpu.h                |  15 ++++
 target/arm/helper-sve.h         |   4 +
 target/arm/helper.h             |  15 ++++
 target/arm/neon-dp.decode       |   1 +
 target/arm/neon-shared.decode   |  11 +++
 target/arm/sve.decode           |  19 ++++-
 target/arm/vfp.decode           |   2 +
 fpu/softfloat.c                 |   8 +-
 target/arm/cpu64.c              |   3 +
 target/arm/cpu_tcg.c            |   1 +
 target/arm/sve_helper.c         |   2 +
 target/arm/translate-a64.c      | 142 +++++++++++++++++++++++++++-----
 target/arm/translate-sve.c      | 112 +++++++++++++++++++++++++
 target/arm/vec_helper.c         | 138 +++++++++++++++++++++++++++++++
 target/arm/vfp_helper.c         |  12 +++
 target/arm/translate-neon.c.inc |  91 ++++++++++++++++++++
 target/arm/translate-vfp.c.inc  |  24 ++++++
 18 files changed, 580 insertions(+), 24 deletions(-)

-- 
2.25.1


