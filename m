Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA006A4F5F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:01:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmUu-0007Ha-1Z; Mon, 27 Feb 2023 18:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUr-0007F3-UA
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:29 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUp-0000wj-5o
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:29 -0500
Received: by mail-pl1-x641.google.com with SMTP id z2so8465022plf.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aqetNtVZFCWlSh/UPOi20H0FwzpRNkCG/4zjfDuydak=;
 b=UgWyhpmFmWuUAB1T9gzNd0GFerhnoCaykOUQckvUlIXscJMCMcWUDRh4knf1sU5j7H
 w9JQk2mQuX6pWYab1uOjvDBqyV/8PmJ67Vav8gSsKN40bxYzL83ZLzxxeyZETAov0/db
 QbT7Op3IfMMB8MVDlp0Ylb2DqsD2l/QFskpZpm32DDUQ9YUHyPC50/gDO0v63JZbWXwb
 g9HkRVM1qK7zzAP1/9XqrtPG0Qmz33M7vR7nXurlUnl5HBmO0GLOohJUlFWA63CAWWKp
 CsSP4XVBs1t7DiAUwruVvVtZppWXKJmzmmn2LwLONJk3MLm1f0PSe0HWW/clL2KfC1bG
 I3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aqetNtVZFCWlSh/UPOi20H0FwzpRNkCG/4zjfDuydak=;
 b=4sk9o57FmR3DW+7UAP8Q6qdYCSLF2dIoviWC2ShSRHGhh7+SCM+5fos34xW5VTS0Yv
 eS+jnt5Am512TLz2KqfKG7DY4FpdU/J/k7la+LkfNs4s3FENrA3BbnVFulbvQu1QFa/G
 51NaVN2pdHVLDbXRQbWa0BJnZuwB8sriQchUpt67cpciN0P2/pxctPO9B70SaGnspVzD
 VWdeqUnX6UUGCos5hvokiZQQ7sdpMs4r11Pw+jGHU6mgrK33AVi1uPbNQRCSuEl/bt9Y
 iiEZf0epZVNr3DvGBYw6jEwifScDwFq8c9mhecxU6jxJdKc8X4IJIeWEvsrPcIQK9rJd
 i2jw==
X-Gm-Message-State: AO0yUKVeffKC0RNpYJvliK9twiJpFHltJRuKNoeRFutOdeO6sPKV0p+g
 AmU8+D1+LNaL+kq+CZZedH/Qlb/lMeTB0zsHWPB5Sw==
X-Google-Smtp-Source: AK7set9jRv2rYFUNJ8kZJTr2ehfywrJ1ixwr/EuEXx1ecLAGWmqzWQM2EXrgvkDqTkfgovwSdKdprg==
X-Received: by 2002:a05:6a20:429a:b0:cc:a5e7:c40b with SMTP id
 o26-20020a056a20429a00b000cca5e7c40bmr10692018pzj.26.1677538885345; 
 Mon, 27 Feb 2023 15:01:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0 v4 00/21] target/arm: Implement FEAT_RME
Date: Mon, 27 Feb 2023 13:01:01 -1000
Message-Id: <20230227230122.816702-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Based-on: 20230227225832.816605-1-richard.henderson@linaro.org
("[PATCH for-8.0 v4 0/4] target/arm: pre-FEAT_RME fixes")

This is based on mainline, without any extra ARMv9-A dependencies
which are still under development.  This is good enough to pass
all of the tests within

    https://github.com/Huawei/Huawei_CCA_QEMU

Changes for v4:
  * Rebase, all except the NOTFORMERGE patches are reviewed.

r~

Richard Henderson (21):
  target/arm: Add isar_feature_aa64_rme
  target/arm: Update SCR and HCR for RME
  target/arm: SCR_EL3.NS may be RES1
  target/arm: Add RME cpregs
  target/arm: Introduce ARMSecuritySpace
  include/exec/memattrs: Add two bits of space to MemTxAttrs
  target/arm: Adjust the order of Phys and Stage2 ARMMMUIdx
  target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
  target/arm: Remove __attribute__((nonnull)) from ptw.c
  target/arm: Pipe ARMSecuritySpace through ptw.c
  target/arm: NSTable is RES0 for the RME EL3 regime
  target/arm: Handle Block and Page bits for security space
  target/arm: Handle no-execute for Realm and Root regimes
  target/arm: Use get_phys_addr_with_struct in S1_ptw_translate
  target/arm: Move s1_is_el0 into S1Translate
  target/arm: Use get_phys_addr_with_struct for stage2
  target/arm: Add GPC syndrome
  target/arm: Implement GPC exceptions
  target/arm: Implement the granule protection check
  NOTFORMERGE target/arm: Enable RME for -cpu max
  NOTFORMERGE hw/arm/virt: Add some memory for Realm Management Monitor

 include/exec/memattrs.h     |   9 +-
 include/hw/arm/virt.h       |   2 +
 target/arm/cpu-param.h      |   2 +-
 target/arm/cpu.h            | 151 ++++++++--
 target/arm/internals.h      |  27 ++
 target/arm/syndrome.h       |  10 +
 hw/arm/virt.c               |  43 +++
 target/arm/cpu.c            |   4 +
 target/arm/cpu64.c          |  37 +++
 target/arm/helper.c         | 161 +++++++++-
 target/arm/ptw.c            | 580 +++++++++++++++++++++++++++++-------
 target/arm/tcg/tlb_helper.c |  96 +++++-
 12 files changed, 971 insertions(+), 151 deletions(-)

-- 
2.34.1


