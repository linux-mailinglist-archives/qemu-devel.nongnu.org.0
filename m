Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C37059CC62
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:44:59 +0200 (CEST)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQH6I-0004wW-JG
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv5-0005f0-P4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:26 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv3-0007Dx-W9
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:23 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d10so11306590plr.6
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=HUHiu5SeZIXC9UpWtZeNlqf5LG5xWVD/pVI4eJRXIeQ=;
 b=x51Xk+Mv+cZ50PnpAFFWwyW8H25c9GP0wmKylN3gvZMKJiqQv4dGl44cWYHw/GisVl
 s02NZ28shEzTFqHz46BHUjJFUVO4xYivOSVUaIBu+k++bGpPLXJk8zMq69hrMLFCMah5
 Wsb1diEnfWm6K3oV9PBrQ5rp/k4NWYfwaqVsVAYSX/zTHXc8pV3tearqidvAsI2F8MAB
 RvZKzp9ukwLbkvaPA34/dKt8+w9p4rdGSZ41Vx/a6UNqRNs3ZvH+Gr39/6ECExYzm72L
 1VaqJCSqNl3/qkQ+cTBjIVZ7kA0+5btqsTnPrVcYhfJ+0M+vcqtP/VoKVQ/iOEXjDOKL
 3ZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=HUHiu5SeZIXC9UpWtZeNlqf5LG5xWVD/pVI4eJRXIeQ=;
 b=bhGphZ1R11qZg84hJhGPFYDghu+fnmo1CnbcI5CIzKcILw4f7sVhBJ4t+ct037S4Od
 5arTDONDfEoVZChf94PV8SL8aJ3ze/c782iDMd5ZNTwV9V0rO6zyMew2qMLps3idwpP/
 JMm/H4RELzITJaLFrvqSBNKBklLc09Zc1+rYZgvQJMunpm8KIz+udnfNIgbbHepoDA9i
 scgf9O6GtDu2dPZFdEZPIhPkq+G3xM1HK2CA5jtXSuVVnEuCsPGqEURsYQtXvoLQvXHj
 fObV6lugmYzYsRfflAyyInSkyW9o/G2/niU82SnK5pR3Y2AJ1Z78TzvBBAXm9Ay/XHTM
 8i4g==
X-Gm-Message-State: ACgBeo0ZzpDdnuznLnRNHBy7et1zCiPGCxr/NUa7a8QdLozOAiE1WqXw
 W9fuMglvMC5fcR5I/rb5KW4F2jSVqlnKDA==
X-Google-Smtp-Source: AA6agR4R3yL0S8d2l6qdR7p0YpjtRiGFecuQFa9bHKOYvtoVcsTGPzMfuZX82kf4QMzHup3nRl/pZw==
X-Received: by 2002:a17:902:ce86:b0:172:fad2:fb6d with SMTP id
 f6-20020a170902ce8600b00172fad2fb6dmr2618867plg.51.1661211200444; 
 Mon, 22 Aug 2022 16:33:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] target/i386: pc-relative translation
Date: Mon, 22 Aug 2022 16:32:56 -0700
Message-Id: <20220822233318.1728621-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Based-on: <20220822232338.1727934-1-richard.henderson@linaro.org>
("[PATCH v3 00/17] accel/tcg + target/arm: pc-relative translation")

Improve translation with address space randomization.

Before:

gen code size       232687283/1073577984
TB count            434021
TB flush count      1
TB invalidate count 478996

After:

gen code size       281614723/1073577984
TB count            527520
TB flush count      0
TB invalidate count 125631

                                      before    after
BootLinuxX8664.test_pc_i440fx_tcg:     63.79    56.01
BootLinuxX8664.test_pc_q35_tcg:        69.11    50.00
JOB TIME                              595.51   533.57


r~


Richard Henderson (22):
  target/i386: Return bool from disas_insn
  target/i386: Remove cur_eip argument to gen_exception
  target/i386: Remove cur_eip, next_eip arguments to gen_interrupt
  target/i386: Create gen_update_eip_cur
  target/i386: Create gen_update_eip_next
  target/i386: Introduce DISAS_EOB*
  target/i386: Use DISAS_EOB* in gen_movl_seg_T0
  target/i386: Use DISAS_EOB_NEXT
  target/i386: USe DISAS_EOB_ONLY
  target/i386: Create cur_insn_len, cur_insn_len_i32
  target/i386: Remove cur_eip, next_eip arguments to gen_repz*
  target/i386: Introduce DISAS_JUMP
  target/i386: Truncate values for lcall_real to i32
  target/i386: Create eip_next_*
  target/i386: Use DISAS_TOO_MANY to exit after gen_io_start
  target/i386: Create gen_jmp_rel
  target/i386: Use gen_jmp_rel for loop and jecxz insns
  target/i386: Use gen_jmp_rel for gen_jcc
  target/i386: Use gen_jmp_rel for gen_repz*
  target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
  target/i386: Create gen_eip_cur
  target/i386: Enable TARGET_TB_PCREL

 target/i386/cpu-param.h      |   1 +
 target/i386/helper.h         |   2 +-
 target/i386/tcg/seg_helper.c |   6 +-
 target/i386/tcg/tcg-cpu.c    |   8 +-
 target/i386/tcg/translate.c  | 710 ++++++++++++++++++-----------------
 5 files changed, 365 insertions(+), 362 deletions(-)

-- 
2.34.1


