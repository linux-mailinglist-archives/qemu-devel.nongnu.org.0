Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DC5455B1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:33:32 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOqQ-0006Zj-Id
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmA-0003OO-6d
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:06 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOm8-0008Ps-H7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:05 -0400
Received: by mail-pf1-x42f.google.com with SMTP id u2so22052257pfc.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdNppBEdbei6b2OSfenKY9YTOl+LPHyij0Nj78kSrVk=;
 b=MHE3v9iRYf+IdpS992xroHLdQDwd7J56/Petr+KNDwKj9ARy5sc5Lq7aETvjvC8INB
 oOobSQb46eW7IPAZs8DjxR4Neg7Xv/Z8qauxXqOxbIf1IfVP5+5lXKLp/7E21pRxbfXZ
 v6J0LKgz4rXy/65MlXtPE65y1i//nQiB7LNAv9spLzHQRVsoGI6SH+1QjvWV/M0plRCC
 kc6Zxu0TJHuVQnAWr+WhcUhW69jFzwZHe4AGxRVLGx46u8V4Ob38DAksMfASX3WShMOR
 bdn43gOnc1TI5buJnbXr2Qy6V/O9ez1OJJnC5H3tWm3v9WPasUFwsiJe9QUWPTrdB4Ze
 F26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WdNppBEdbei6b2OSfenKY9YTOl+LPHyij0Nj78kSrVk=;
 b=j+aytDDPaE2tEJOkmqFkTiQkfH2F2mC3wb5jqv2/D6KI9k8hY8Go9uvMtWYLm7CyLJ
 hOM7sVfo7BfQMrjV71ieP/D9eQstCyl/9wwfqERgxAjX7aFUCvnxMwzEhY/+ZMLYBeX/
 j6tibqdxG3kDAWG/hbHhmhW5Bp8dHmnNwfDWFFQstq22DdnIB9PJBfw6bVuImjwGlxHr
 Nkp8mgKygZPDgyaIGGT7eKVxnnIVVy54izY6zDLtkYVsuvLo0K1PakyOl68MliJISnqr
 DDS99OVKlUI1EN9TwoYgbySbaOnWSvNWObnf2+LQTBnwpoRrORM1eABNXA6yieMwdET7
 YTyw==
X-Gm-Message-State: AOAM530B5EM6ZmpO9DsS+ANvdw/z2C3g9iB1P9fMuf5ThPNkzjA+e2UT
 bF6r+03cL2+bR0oX7nquWEZ5n0VS0+AByg==
X-Google-Smtp-Source: ABdhPJw12JVdLDIYoBaM+efr3/KF8GMI6OVAh3FXwWzCxl5o1Y5y43CqFLeKxixQFAl5MSrLhPDI3Q==
X-Received: by 2002:a05:6a00:2148:b0:4fa:92f2:bae3 with SMTP id
 o8-20020a056a00214800b004fa92f2bae3mr42053364pfk.69.1654806542696; 
 Thu, 09 Jun 2022 13:29:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/23] target/arm: tidy exception routing
Date: Thu,  9 Jun 2022 13:28:38 -0700
Message-Id: <20220609202901.1177572-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

This is mostly code movement at this point, out of headers
and into op_helper.c and debug_helper.c.

Changes for v3:
  * Drop helper_exception_advsimdfp_access.
  * Drop Rearrange Secure PL1 test in arm_debug_target_el.
  * Improve patch comment for helper_exception_swstep.

All patches are reviewed.


r~


Richard Henderson (23):
  target/arm: Mark exception helpers as noreturn
  target/arm: Add coproc parameter to syn_fp_access_trap
  target/arm: Move exception_target_el out of line
  target/arm: Move arm_singlestep_active out of line
  target/arm: Move arm_generate_debug_exceptions out of line
  target/arm: Use is_a64 in arm_generate_debug_exceptions
  target/arm: Move exception_bkpt_insn to debug_helper.c
  target/arm: Move arm_debug_exception_fsr to debug_helper.c
  target/arm: Rename helper_exception_with_syndrome
  target/arm: Introduce gen_exception_insn_el_v
  target/arm: Rename gen_exception_insn to gen_exception_insn_el
  target/arm: Introduce gen_exception_insn
  target/arm: Create helper_exception_swstep
  target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
  target/arm: Move gen_exception to translate.c
  target/arm: Rename gen_exception to gen_exception_el
  target/arm: Introduce gen_exception
  target/arm: Introduce gen_exception_el_v
  target/arm: Introduce helper_exception_with_syndrome
  target/arm: Remove default_exception_el
  target/arm: Create raise_exception_debug
  target/arm: Move arm_debug_target_el to debug_helper.c
  target/arm: Fix Secure PL1 tests in fp_exception_el

 target/arm/cpu.h              | 128 +-------------------
 target/arm/helper.h           |   8 +-
 target/arm/internals.h        |  43 +------
 target/arm/syndrome.h         |   7 +-
 target/arm/translate.h        |  43 +------
 target/arm/debug_helper.c     | 220 ++++++++++++++++++++++++++++++++--
 target/arm/helper.c           |  35 ++----
 target/arm/op_helper.c        |  52 ++++----
 target/arm/translate-a64.c    |  34 ++----
 target/arm/translate-m-nocp.c |  15 ++-
 target/arm/translate-mve.c    |   3 +-
 target/arm/translate-vfp.c    |  18 ++-
 target/arm/translate.c        | 106 ++++++++--------
 13 files changed, 360 insertions(+), 352 deletions(-)

-- 
2.34.1


