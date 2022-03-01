Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9004C9828
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:07:17 +0100 (CET)
Received: from localhost ([::1]:42742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAeK-0001tN-LL
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:07:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXW-0001Fm-LO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:15 -0500
Received: from [2607:f8b0:4864:20::1030] (port=53957
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXT-0004pY-Gn
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:13 -0500
Received: by mail-pj1-x1030.google.com with SMTP id bx5so53164pjb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBgqnBpDKAOsE8lohN83YaUKejXbXKlcoZLgP0jJ54s=;
 b=GiTXlaSyXrdGwTePY0LvPEgDRFl/Iz/rjUEskyejyH/fQY4KYe0yi3Z77/PYxFlgBL
 fstpsG7iYQlDaCyMtmIHrtWgS8jYz6zwvGukVmSQWQ0KDkPotRxZAAHQkis0Tz/5p+C2
 Xc/kfNvIt2W03Sk+0qrgPj1m1s4U9y6A3f1EqT5T3/Bm5GhQ5vS6AmqIQCoo6M9uRuGP
 jgFzIkS3NGEvxOrGUcKCRYwMzIh2qGBDQ7yEvsBFdg1J0H7aTNAEHlHEt6atkTav3blC
 N+zjG0G/8lbitCFfStxlk3oLk2EgbrED3A2nmYM9rRPzb3W+UG/372GB5oMaVZz1ZISD
 lB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nBgqnBpDKAOsE8lohN83YaUKejXbXKlcoZLgP0jJ54s=;
 b=5lU5PVRcnJPyZTMre5JgUHoW/xM5z/tdIhXjpu5KTJIduS4Sgm2WmBwfh0F/xFyVNb
 lSQVYSV66/oPMGiy3N2KtLO3zJwL40xaAGZJGqt3Z/JXwMyugkTGPn8wkTwZ5Ssj/DiF
 1ODDoyImEgsdG2+MPamR2Zud76XodsEFjoqoQeiU+k/PX79j3vNNQb/GjbiEI0qzStdz
 ouQz+TuLLQc2yxMTxFn0fiO2Gqm4WffT8/0M+H5UKSLYBXunC3UQrabI9YTh9ZW633iX
 3uRpjJzomzwY1C9nvGXntaVGc3VV8mkMYUtnioVk8m3xPr0rhA+lIl/akb6rt+N8NuZP
 l4bg==
X-Gm-Message-State: AOAM532Xt/BOqKUfvCYx7OGOfNN9yYlkG0CRYMVnO9vW0knmUrw/PIcP
 o3V08kJiibwX0GTya7pyzrgM47v8tNCq2g==
X-Google-Smtp-Source: ABdhPJxP3SBTZFGg9t03VOD9XFJp/oYFudYp+zQHJ1QguYIJa2cRHLTvl3ycagKkqLME/us7MjjTfg==
X-Received: by 2002:a17:90a:19d2:b0:1be:d815:477f with SMTP id
 18-20020a17090a19d200b001bed815477fmr5911405pjj.23.1646172002761; 
 Tue, 01 Mar 2022 14:00:02 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/18] target/arm: Implement LVA, LPA, LPA2 features
Date: Tue,  1 Mar 2022 11:59:40 -1000
Message-Id: <20220301215958.157011-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Changes for v4:
  * Add cpu property for lpa2.
  * Disable that property for -machine virt-6.2 and previous.

Changes for v3:
  * Update emulation.rst.
  * Split out separate update to ID_AA64MMFR0.
  * Hack for avocado.


r~


Richard Henderson (18):
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
  target/arm: Advertise all page sizes for -cpu max
  target/arm: Implement FEAT_LPA2
  target/arm: Provide cpu property for controling FEAT_LPA2
  hw/arm/virt: Disable LPA2 for -machine virt-6.2

 docs/system/arm/emulation.rst |   3 +
 include/hw/arm/virt.h         |   1 +
 include/hw/registerfields.h   |  48 ++++-
 target/arm/cpu-param.h        |   4 +-
 target/arm/cpu.h              |  32 +++-
 target/arm/internals.h        |  58 +++---
 hw/arm/virt.c                 |   7 +
 target/arm/cpu.c              |   9 +-
 target/arm/cpu64.c            |  31 +++-
 target/arm/helper.c           | 332 ++++++++++++++++++++++++++--------
 tests/avocado/boot_linux.py   |   2 +
 11 files changed, 425 insertions(+), 102 deletions(-)

-- 
2.25.1


