Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806205F5FB6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:43:36 +0200 (CEST)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHnL-00017d-Bf
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHiq-000307-ET
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:56 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHij-0002tw-55
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:38:50 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b2so569509plc.7
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=DGf8LRX7S3EksZchO2LnoxpqxoM5tSgIISmIB+gyccs=;
 b=TogT6ucr/uB9bxVFKuy6eg5Q57YZ2m+iviAVspi3k2mOxHtLMJVelCBO1nygB1wbAm
 CKFhbMWqjeeFiecT2LiwwvvnEZsL2bid6DVPtUO/6lQPvSTzTWe/V8CN82aftkYCSVKB
 Q7f4aiXpwta6f8N3tileTVyQa1Z5k61mPDrM3KLfMKa8tueU1phJLFmYeMAr3/n5Zo2s
 G7v9vqUbDYRx7pYQ37g5w2SP5rmMrZClKSv9IUWgX+D5dUZIqP6Xyo4ARf8FX/K7VBq/
 AFY7ea5jYHZjvRrSyw1w+zj06b+jHkP3dLDLTaum+LFFIGgEsezWepsDR+5FPCfAt7ZB
 r7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=DGf8LRX7S3EksZchO2LnoxpqxoM5tSgIISmIB+gyccs=;
 b=6Pv0zg9Zqu6mO+25HMx8WJnnj07OUugmGeiuGahki8fx2p3F6KsfZszZ86u7WfYKDA
 pmwpJrD0U2RekkHLoXmEUTblff2hG9qqeXv+1Wk7IsLDe84o/7FiV0YmBc/qKBcIf8hB
 m7PATIsdr1CS0vc/cn0qsxea7+W/QRi4/DyClnjmlWObVoa9gAehdH07ygRKvybbMC1L
 V+H8UKfrFyJduearEd8mSFB44IdIbFEJBvmunrj+xCqo82/GZ/LB4j4INaagfixhO33y
 R/uLc7KZuMbTpCsVosA74W8Zm4v2M3VpK0xux1GK6G12CqmMCEs8L6DEAaEgMMH4y/XJ
 Vtmg==
X-Gm-Message-State: ACrzQf17TDTZ93Ff6aOXN5TyJHrVjzIlGR11ZXKaXCCHyP5bIhgTkk2r
 4pIKvI36Fe14be7nOFA0v3fDSWf+yLtK1Q==
X-Google-Smtp-Source: AMsMyM64n79kM9FmyvL74oAGXysne1gp/49mZrKB/K7b0AUVPNWPARO+H0TVT/9gE++pgftdNHU0jw==
X-Received: by 2002:a17:90a:d181:b0:205:e100:3000 with SMTP id
 fu1-20020a17090ad18100b00205e1003000mr2984067pjb.184.1665027527496; 
 Wed, 05 Oct 2022 20:38:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a63534b000000b0043014f9a4c9sm539831pgl.93.2022.10.05.20.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:38:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 0/9] target/arm: pc-relative translation blocks
Date: Wed,  5 Oct 2022 20:38:37 -0700
Message-Id: <20221006033846.1178422-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

This is the Arm specific changes required to reduce the
amount of translation for address space randomization.

Changes for v6:
  * Minor updates for patch review, r-b.


r~


Richard Henderson (9):
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Remove gen_exception_internal_insn pc argument
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h        |   1 +
 target/arm/translate-a32.h    |   2 +-
 target/arm/translate.h        |  35 ++++-
 target/arm/cpu.c              |  23 ++--
 target/arm/translate-a64.c    | 174 +++++++++++++++----------
 target/arm/translate-m-nocp.c |   6 +-
 target/arm/translate-mve.c    |   2 +-
 target/arm/translate-vfp.c    |  10 +-
 target/arm/translate.c        | 235 +++++++++++++++++++++-------------
 9 files changed, 303 insertions(+), 185 deletions(-)

-- 
2.34.1


