Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A95F5FF1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:12:36 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIFP-0001fW-2d
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoA-0003si-Jp
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHo8-0003rE-VD
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n7so612553plp.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=VRlvsW8qFxKeXOpPF4XvY39t2BDwROwryX82R8eoeyU=;
 b=poeMvPOMwxvOX+heJxS4WacBAPZaZUHm/vUr87wFPEJqgzB6K3L+VrUzWncK4JU5Fo
 7Mx1iktexYbzs3xknsp2m7skmFqYNw4rW3jVprFB2BWRzR6eputC4aZHPvJGsWMcgUJc
 1o+pz38PDKjzukxAQJrpriOqWRtPpcFnTRKPrRuW9sid+awyAG5rpc2kSayOt9Ok34/0
 Ud28a0O7tXq+DMfVXDueWt2Iw5GBTLCwtge3MZq8J+jXkRQawMgQESOBzXiXMO8/Hjb8
 5n1rzzty6Twx5UeL938ETGZQPbd/Pp8Q8dTzm4nW4JeJwE1ZVT6I9u7RN7mjCoEwp8YQ
 27+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=VRlvsW8qFxKeXOpPF4XvY39t2BDwROwryX82R8eoeyU=;
 b=SD2PzPSrneMaL0RpozR3YOElPxRR0SZvZGpaRDvCMEmvl4xm9AtimLBZgus/kdKvA4
 /T2MRREjFeacSbbTy3iThfXNnE7KjurXcVIUQivLaxWm0f2zVhFpR/61/JK+GdvZR9Ux
 tbE1rn4/CEYk3dKK9/y7570QfMYaTvTwrFa42GZH1EVHQxjTmUr92tg8wwC1hFvp8V2S
 EE6iALiYOhQkO10fdRIb/VNvi6HO9L84GGyVt3we+rjQlgcEvRLJ99AW8LGlxRd1xN0K
 gvq/FX4YYhErMam97s+EQvphagbZ/t9eIWPQALd35S1yovJ9TKVObRT8MnmXx3J+3yTI
 V0ag==
X-Gm-Message-State: ACrzQf0SLUnjm1C/bY/8teYwf4evSyFwwLi8Gn2a1X7rvDQ0xhGqM+jV
 4zpCQJ2c6loC1YWxTyWkqhDD1prIKoVeAQ==
X-Google-Smtp-Source: AMsMyM5/YeYEBjueRncQlE+ShR0222WalfpR2VU7Nm937Xnbt50Lun6z411ruAsscU7rBbaflZzFIQ==
X-Received: by 2002:a17:902:ec84:b0:176:c1e3:3ad7 with SMTP id
 x4-20020a170902ec8400b00176c1e33ad7mr2532817plg.24.1665027863307; 
 Wed, 05 Oct 2022 20:44:23 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 00/26] target/s390x: pc-relative translation blocks
Date: Wed,  5 Oct 2022 20:43:55 -0700
Message-Id: <20221006034421.1179141-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the S390 specific changes required to reduce the
amount of translation for address space randomization.

Begin with some generic cleanups, then prepare by using
displacements instead of addresses when possible, then
add some tcg infrastructure to avoid a code gen ugly,
then finalize the conversion.


r~


Richard Henderson (26):
  target/s390x: Use tcg_constant_* in local contexts
  target/s390x: Use tcg_constant_* for DisasCompare
  target/s390x: Use tcg_constant_i32 for fpinst_extract_m34
  target/s390x: Use tcg_constant_* in translate_vx.c.inc
  target/s390x: Change help_goto_direct to work on displacements
  target/s390x: Introduce gen_psw_addr_disp
  target/s390x: Remove pc argument to pc_to_link_into
  target/s390x: Use gen_psw_addr_disp in pc_to_link_info
  target/s390x: Use gen_psw_addr_disp in save_link_info
  target/s390x: Use gen_psw_addr_disp in op_sam
  target/s390x: Use ilen instead in branches
  target/s390x: Move masking of psw.addr to cpu_get_tb_cpu_state
  target/s390x: Add disp argument to update_psw_addr
  target/s390x: Don't set gbea for user-only
  target/s390x: Introduce per_enabled
  target/s390x: Disable conditional branch-to-next for PER
  target/s390x: Introduce help_goto_indirect
  target/s390x: Split per_branch
  target/s390x: Simplify help_branch
  target/s390x: Split per_breaking_event from per_branch_*
  target/s390x: Remove PER check from use_goto_tb
  target/s390x: Pass original r2 register to BCR
  tcg: Pass TCGTempKind to tcg_temp_new_internal
  tcg: Introduce tcg_temp_ebb_new_*
  tcg: Introduce tcg_temp_is_normal_*
  target/s390x: Enable TARGET_TB_PCREL

 include/tcg/tcg-op.h                |   4 +
 include/tcg/tcg.h                   |  49 +-
 target/s390x/cpu-param.h            |   1 +
 target/s390x/cpu.h                  |  13 +-
 target/s390x/cpu.c                  |  12 +
 target/s390x/tcg/translate.c        | 858 ++++++++++++----------------
 tcg/tcg.c                           |  14 +-
 target/s390x/tcg/translate_vx.c.inc |  45 +-
 target/s390x/tcg/insn-data.def      |   2 +-
 9 files changed, 461 insertions(+), 537 deletions(-)

-- 
2.34.1


