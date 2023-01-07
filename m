Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63E660CDA
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zK-0003eK-4K; Sat, 07 Jan 2023 02:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zD-0003cl-B4
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:27 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3z7-0004A6-Th
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:23 -0500
Received: by mail-pl1-x632.google.com with SMTP id c4so4080480plc.5
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=C7/GqCKIjHQX3gUSGau+tujtwt1S0/xoLIWF0wzscAU=;
 b=zBj4CbabUPBmsXF5XAfgg3ghZmXfmDcs3EnHJjQsVVoPrgrtHow83dE5RY3mbHuf6k
 W3dZuAkA4m65Pq9K3xVfiK3z9vOJOtvia+QJ4mrLLKoNKoPgJGKIqfMiABcZzcI+ifZy
 P44Z1fqITiscLyWpm1RUJPdAdCV0Qo/gTvL9GySkpSNHZAgihZ5hDKaRuWVWY60b10yO
 jZwq9rJaB3r4/nEhUeQZ3/ySBHRs197RQh65VxxQnZrwqPdF8S6mFnWJLC+Xf4xGmVFp
 FnpP+kFSfm7L4p9Xj6W5iS3XpSae/9TWF1BSSRcz+Dkbti2MBKb1eOpncKkzfmPMgP3T
 vMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C7/GqCKIjHQX3gUSGau+tujtwt1S0/xoLIWF0wzscAU=;
 b=uVfwMFv/Hw3JTNg0U8jb6nCqa2FcoiR0puMqRb2S9p6o7QRZW2rWMbSPmF0ER6DvxA
 2H/pkvOHqVdOlPZy8cj+DB4HmK6Uc4aOdYr/Rnp5g061yWjeBe4G0TJ5UdheLqIiPRBm
 X4j2c0/WX5EkxNAB+QaI8guqzRAGT6Ii16vQ5FkkRpQtplSkDraCaXRKw8wJyOtUbRna
 PHd+ln2ZfT+Okp2p8LFEPlSsClrftUhz6u22OQx1gzsaii7nKpEJWTUU7/Ej04/RxxT2
 Ki1vs6020WFYTg4nO271pi9DIe3KodY40oLimxcsonSuceZDOXP/Wh+eZn5/KZi5y23b
 6x+Q==
X-Gm-Message-State: AFqh2koTDpxuT5Cl1dGLFomd4hMxJZKCBDwN4iqCgtVaQkY7Ule6HcYz
 cJFZo+OE2lPu/3z61Spec5lemkRJeP8GdG9P
X-Google-Smtp-Source: AMrXdXuNgK56PeJzyhcI5TsVuczqlzRcHfC9ZEBekO7DBJO0QpVkCQvvxcN0g7fAIVbH23TFXRahPA==
X-Received: by 2002:a17:90b:35c8:b0:226:b78b:a9c2 with SMTP id
 nb8-20020a17090b35c800b00226b78ba9c2mr11258171pjb.35.1673077879568; 
 Fri, 06 Jan 2023 23:51:19 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/27] tcg/s390x patch queue
Date: Fri,  6 Jan 2023 23:50:51 -0800
Message-Id: <20230107075118.1814503-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit aaa90fede5d10e2a3c3fc7f2df608128d2cba761:

  Merge tag 'pull-tcg-20230105' of https://gitlab.com/rth7680/qemu into staging (2023-01-06 15:40:37 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230106

for you to fetch changes up to 90497e03ca7432153c5db4a06019265486541d44:

  tcg/s390x: Avoid the constant pool in tcg_out_movi (2023-01-06 23:07:10 +0000)

----------------------------------------------------------------
tcg/s390x improvements:
 - drop support for pre-z196 cpus (eol before 2019)
 - add support for misc-instruction-extensions-3
 - misc cleanups

----------------------------------------------------------------
Richard Henderson (27):
      tcg/s390x: Use register pair allocation for div and mulu2
      tcg/s390x: Remove TCG_REG_TB
      tcg/s390x: Always set TCG_TARGET_HAS_direct_jump
      tcg/s390x: Remove USE_LONG_BRANCHES
      tcg/s390x: Check for long-displacement facility at startup
      tcg/s390x: Check for extended-immediate facility at startup
      tcg/s390x: Check for general-instruction-extension facility at startup
      tcg/s390x: Check for load-on-condition facility at startup
      tcg/s390x: Remove FAST_BCR_SER facility check
      tcg/s390x: Remove DISTINCT_OPERANDS facility check
      tcg/s390x: Use LARL+AGHI for odd addresses
      tcg/s390x: Distinguish RRF-a and RRF-c formats
      tcg/s390x: Distinguish RIE formats
      tcg/s390x: Support MIE2 multiply single instructions
      tcg/s390x: Support MIE2 MGRK instruction
      tcg/s390x: Issue XILF directly for xor_i32
      tcg/s390x: Tighten constraints for or_i64 and xor_i64
      tcg/s390x: Tighten constraints for and_i64
      tcg/s390x: Support MIE3 logical operations
      tcg/s390x: Create tgen_cmp2 to simplify movcond
      tcg/s390x: Generalize movcond implementation
      tcg/s390x: Support SELGR instruction in movcond
      tcg/s390x: Use tgen_movcond_int in tgen_clz
      tcg/s390x: Implement ctpop operation
      tcg/s390x: Tighten constraints for 64-bit compare
      tcg/s390x: Cleanup tcg_out_movi
      tcg/s390x: Avoid the constant pool in tcg_out_movi

 tcg/s390x/tcg-target-con-set.h |   18 +-
 tcg/s390x/tcg-target-con-str.h |   11 +-
 tcg/s390x/tcg-target.h         |   54 +-
 tcg/s390x/tcg-target.c.inc     | 1251 ++++++++++++++++++++--------------------
 4 files changed, 668 insertions(+), 666 deletions(-)

