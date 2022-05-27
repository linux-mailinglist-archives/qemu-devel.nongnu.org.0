Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564DB5366D2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:08:40 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueO6-0005uY-SM
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM2-00030W-6C
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:30 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueLy-0001cN-7o
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:28 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t28so4533565pga.6
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLtTUIfOEVBdKbxi4BRnlBcf8mL9fpt6kfR6WD0+IXQ=;
 b=Giw75pVnwmgoRWs+ZdqHFGNusMfyY/QM0WwRdf7WjEX7XczB2cEP/Z94V7PCDVqFvU
 r33pZ9umGPGV88IfxSBCz47Xd9Uo6+bEiqZLHe95fBJAvcI5txQplLQjtGO3AtYrvzF3
 WneKBMagRxVkN7ukxxxlBJZYJDbuHsvWv1htg5HF2Wxcv8rL5+5HoSB6ED3jU+hoN8xG
 HtNKqFxvB1NOUN8TgNF9cPMOZWrfMcVLNksjakGAnsa0QysHLaIFx2nbii2stjmFqx8e
 Wx6a7JsOt0aWIkyyxNMG2eaPZUQdbzvNnfQCdWCS9AYPKxT7bh/yR8P1rf+xjhz8iKxa
 kzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLtTUIfOEVBdKbxi4BRnlBcf8mL9fpt6kfR6WD0+IXQ=;
 b=d8wsAKN8CocLdGWY6BGskgLG5caHch2jXbvkh+RkZB+/qzlXLgGWVoPp/OeklAnN8M
 CXiDeZheLyk/36zYv2dLRnhWCgF56gU0WoRZyXOMx7GvCibuSHR2Xzi13v70dA6Lz1jj
 HzLoAE3bVb6PVQnvtJ9rsALRakP4F3f8aHaN2YFZDR4CRWjSGr3YL130n8wC47jz7Q43
 0fEFV2zR8BM+mpAvDnjs45mKnSUOgnb8gdUGZHyRp5Qpc9yMslL77pmncqAUPd9A1XEO
 VSOxNqkpNkGIo7gKgRU5juMC8tvDEZBwNCAiUbPcGnc0YkC3Ycot+L7Hc9sOpLvYJO29
 CVmA==
X-Gm-Message-State: AOAM5308mu99STsNHhYMdAMa8192z7BU2XwKRCK0TyaQegYBb6GM0sTW
 H9CC4Kzp+YyHEYqeiZJ5Y05sw3M/eDpHtQ==
X-Google-Smtp-Source: ABdhPJwma0qvs2Ub/exJQZSqKkqGM3rTXhbbO9Wc5W7wCijClA1epLnd0rxKdR34M8FHmqvWJwiqvg==
X-Received: by 2002:a63:5304:0:b0:3fb:92eb:8e90 with SMTP id
 h4-20020a635304000000b003fb92eb8e90mr5954130pgb.36.1653674784465; 
 Fri, 27 May 2022 11:06:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/15] target/arm: SME prep patches
Date: Fri, 27 May 2022 11:06:08 -0700
Message-Id: <20220527180623.185261-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20220523204742.740932-1-richard.henderson@linaro.org
("target/arm: tidy exception routing")

Changes for v3:
  * Two patch upstream,
  * Have linux-user use the digested SVE_LEN from hflags (pmm)
  * Use el_is_in_host in sve_vqm1_for_el, mirror how I intend
    do use it for streaming sve.
  * Export a bunch of functions which will be used by sme_helper.c.


r~
  

Richard Henderson (15):
  target/arm: Rename TBFLAG_A64 ZCR_LEN to SVE_LEN
  linux-user/aarch64: Use SVE_LEN from hflags
  target/arm: Do not use aarch64_sve_zcr_get_valid_len in reset
  target/arm: Merge aarch64_sve_zcr_get_valid_len into caller
  target/arm: Use uint32_t instead of bitmap for sve vq's
  target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
  target/arm: Remove fp checks from sve_exception_el
  target/arm: Add el_is_in_host
  target/arm: Use el_is_in_host for sve_vqm1_for_el
  target/arm: Split out load/store primitives to sve_ldst_internal.h
  target/arm: Export sve contiguous ldst support functions
  target/arm: Move expand_pred_b to vec_internal.h
  target/arm: Use expand_pred_b in mve_helper.c
  target/arm: Move expand_pred_h to vec_internal.h
  target/arm: Export bfdotadd from vec_helper.c

 linux-user/aarch64/target_prctl.h |  19 ++-
 target/arm/cpu.h                  |  11 +-
 target/arm/internals.h            |  18 +--
 target/arm/kvm_arm.h              |   7 +-
 target/arm/sve_ldst_internal.h    | 221 ++++++++++++++++++++++++++++
 target/arm/vec_internal.h         |  17 ++-
 linux-user/aarch64/signal.c       |   4 +-
 target/arm/arch_dump.c            |   2 +-
 target/arm/cpu.c                  |   5 +-
 target/arm/cpu64.c                | 117 ++++++++-------
 target/arm/gdbstub64.c            |   2 +-
 target/arm/helper.c               | 126 ++++++++--------
 target/arm/kvm64.c                |  36 +----
 target/arm/mve_helper.c           |   6 +-
 target/arm/sve_helper.c           | 232 +++---------------------------
 target/arm/translate-a64.c        |   2 +-
 target/arm/vec_helper.c           |  28 +++-
 17 files changed, 444 insertions(+), 409 deletions(-)
 create mode 100644 target/arm/sve_ldst_internal.h

-- 
2.34.1


