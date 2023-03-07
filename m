Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D76AF0BA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9W-0003Wv-8l; Tue, 07 Mar 2023 13:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9U-0003WF-7b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:08 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9S-0007hU-Dm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:07 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l1so14146153pjt.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=YDssCakE6h6kyhUJOy803eWkYdjFVwrrmw2GjMgBp6w=;
 b=yX56X0lR7YyuUVGDMFEbrGBbemckLo27OkzLmhA/8HGrCssO8xB5JZ1ru4gzmhhVaL
 qo1trxf4/wR/8+K4fARfhqX9lzpbndoBZ4JVOoLbPVcYrFqHPsPLLGVN8PGmwOoQ6jaS
 H0eer3P1KOaQZB8IhfA7Mp5q+01c/5LAMxrmVHOR2J0MnFIph0w9nvODs9Oh1mnrSDmO
 U2S4oOizCVmuQNlMeDIVDs3INSzmsEPE7rmSoTqSjYWTYCbuKrqGW0kisB/lp1bteGUX
 wshN9vgEoK8Be8/YlBxaGh8LUGwqYo3YRMjgGaiW+Gra1vbA1LeDUwWPp7hfKjb4mahn
 gMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YDssCakE6h6kyhUJOy803eWkYdjFVwrrmw2GjMgBp6w=;
 b=C25bAjmu76dN5BJKC4r0yFxnsslBQwmg1BMSddwnA4qTxJWyERc96gSGlVZKyY2QQP
 TflhgzAEGry45qYs8ic1cQoVwQtxSzfYIiMOPnI0ec9AX6+k3wqSilC9nBBckLxwNeBA
 gh8PQJExspiBhUDaKYweftH1kiOZU6PDKWUECQkf1THbApav80EeJJx5mKKVFaz+Bl+4
 PJGoLyiQd25Ucr1uxHfWsHMiPLkex/o4Mng5S7E1mu8707wmYTGoGN/s1CkPw+Q3ptV+
 ZDx8sWCYp8cOfR+m5zrk7PEUS48N6zFTPwehsfN0wne0exVFETztpyisBJdHKuMlI8cG
 uHFQ==
X-Gm-Message-State: AO0yUKXHyBRvN8XEJspxeGmLh34f3DR1BlwR/Iwt9f5r+Nx7ZTREvYm1
 ZUS+TxJj2PTv1cz7KAcZWzpzzIY/Xu3m5IhbDwg=
X-Google-Smtp-Source: AK7set8rfwXyiZ/yXtun+ZSIEROEmfaJyQfc8sAEfzcEMM6lrc/zHT1tC/ZaxLviaayLlO8eNK5k7A==
X-Received: by 2002:a17:90b:4b06:b0:237:e78d:4054 with SMTP id
 lx6-20020a17090b4b0600b00237e78d4054mr16001806pjb.44.1678214104289; 
 Tue, 07 Mar 2023 10:35:04 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/25] tcg: Remove tcg_const_*
Date: Tue,  7 Mar 2023 10:34:38 -0800
Message-Id: <20230307183503.2512684-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Based-on: 20230307175848.2508955-1-richard.henderson@linaro.org
("[PULL 00/67] tcg patch queue")

This completes the transition from tcg_const_* to tcg_constant_* that
started in 2020.

The bulk of the v1 patch set has been reviewed and is queued above.
A few of these patches are reviewed, but have dependencies on
unreviewed patches and so couldn't be queued.


r~


Needs Review:
  02-target-arm-Handle-FPROUNDING_ODD-in-arm_rmode_to_.patch
  05-target-arm-Create-gen_set_rmode-gen_restore_rmode.patch
  06-target-arm-Improve-trans_BFCI.patch
  08-target-arm-Avoid-tcg_const_-in-translate-mve.c.patch
  09-target-arm-Avoid-tcg_const_ptr-in-disas_simd_zip_.patch
  12-target-m68k-Reject-immediate-as-destination-in-ge.patch
  14-target-ppc-Avoid-tcg_const_i64-in-do_vcntmb.patch
  15-target-ppc-Avoid-tcg_const_-in-vmx-impl.c.inc.patch
  16-target-ppc-Avoid-tcg_const_-in-xxeval.patch
  17-target-ppc-Avoid-tcg_const_-in-vsx-impl.c.inc.patch
  18-target-ppc-Avoid-tcg_const_-in-fp-impl.c.inc.patch
  19-target-ppc-Avoid-tcg_const_-in-power8-pmu-regs.c..patch
  20-target-ppc-Rewrite-trans_ADDG6S.patch
  21-target-ppc-Fix-gen_tlbsx_booke206.patch
  22-target-ppc-Avoid-tcg_const_-in-translate.c.patch
  23-target-tricore-Use-min-max-for-saturate.patch


Richard Henderson (25):
  target/arm: Use rmode >= 0 for need_rmode
  target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
  target/arm: Improve arm_rmode_to_sf
  target/arm: Consistently use ARMFPRounding during translation
  target/arm: Create gen_set_rmode, gen_restore_rmode
  target/arm: Improve trans_BFCI
  target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
  target/arm: Avoid tcg_const_* in translate-mve.c
  target/arm: Avoid tcg_const_ptr in disas_simd_zip_trn
  target/arm: Avoid tcg_const_ptr in handle_vec_simd_sqshrn
  target/arm: Avoid tcg_const_ptr in handle_rev
  target/m68k: Reject immediate as destination in gen_ea_mode
  target/m68k: Use tcg_constant_i32 in gen_ea_mode
  target/ppc: Avoid tcg_const_i64 in do_vcntmb
  target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
  target/ppc: Avoid tcg_const_* in xxeval
  target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
  target/ppc: Avoid tcg_const_* in fp-impl.c.inc
  target/ppc: Avoid tcg_const_* in power8-pmu-regs.c.inc
  target/ppc: Rewrite trans_ADDG6S
  target/ppc: Fix gen_tlbsx_booke206
  target/ppc: Avoid tcg_const_* in translate.c
  target/tricore: Use min/max for saturate
  tcg: Drop tcg_const_*_vec
  tcg: Drop tcg_const_*

 include/tcg/tcg-op.h                       |   4 -
 include/tcg/tcg.h                          |  10 --
 target/arm/internals.h                     |  12 +-
 target/arm/tcg/translate.h                 |  17 +++
 target/arm/tcg/translate-a64.c             | 168 +++++++++------------
 target/arm/tcg/translate-mve.c             |  56 +++----
 target/arm/tcg/translate-sve.c             |  28 ++--
 target/arm/tcg/translate-vfp.c             |  26 ++--
 target/arm/tcg/translate.c                 |  13 +-
 target/arm/vfp_helper.c                    |  35 +----
 target/m68k/translate.c                    |   6 +-
 target/ppc/translate.c                     | 148 +++++++++---------
 target/tricore/translate.c                 |  14 +-
 tcg/tcg-op-vec.c                           |  34 +----
 tcg/tcg.c                                  |  16 --
 target/ppc/power8-pmu-regs.c.inc           |   4 +-
 target/ppc/translate/fixedpoint-impl.c.inc |  44 +++---
 target/ppc/translate/fp-impl.c.inc         |  26 ++--
 target/ppc/translate/vmx-impl.c.inc        |  31 ++--
 target/ppc/translate/vsx-impl.c.inc        |  36 ++---
 tcg/i386/tcg-target.c.inc                  |   9 +-
 21 files changed, 326 insertions(+), 411 deletions(-)

-- 
2.34.1


