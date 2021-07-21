Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42FB3D091E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:44:33 +0200 (CEST)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65y4-0007Mx-Qx
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65ve-0004wj-1n
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vc-0005If-68
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id a6so981198pgw.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IvQF72X+A8672e9blk1dkZTQPggmMWWy4yXitd1FzHw=;
 b=I656+DlSpTYqyGZ9lBk9RA9Rd+43trEmxdZspBkeJdw54P9iiblyBVoxxexcfxNb9w
 djcgZCqMTqtEYU5RQEFWSjf3JSC524NDd7ttnneBf9CF0Lp9io2hZyZSteFKmDagtJhm
 E+CKIEnL4vuarp5zsPvZy+uNzLXJQd6EZJumtrzJOGobhZ0WtBn2sTUHJ0ZgXdbq+avt
 g6idOSlvI0JkllfaijobAWgabVl1TTOVHtPqH/FFks4Gt0jtp418J0o5YPlX1GhIwK+i
 8qs4SiNGugj/hgOOT1E+lRkObL7J6ge9tDdi14gmVLBdo9qzPi4TaFvS4ZzPnR6H1uhn
 yrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IvQF72X+A8672e9blk1dkZTQPggmMWWy4yXitd1FzHw=;
 b=msB3Ohb7M8dP3frLUZEmVzu/fXi6MD8I+CMFdozhkiblWq5/JyEhD9Stc8koqhEGh4
 ymdYzyGxwKHExvV0Nf0boipDmR3WR27gfbt9paLR0tX+xdO408/C/zYPuUKnxSrA87gV
 R74oAg//xUs8xGmDHpx9cVzYNwYybadw4G/IFPGsxyo+nxOX1bi/QJ22VnzDKKVNEf2N
 bcBznJbOaTqjBTTMkyDqPpKd47UPHdzrG+aaG7yGi5npWs6mud2s2h4bogV/08SkG6Ke
 qci4HXQS7Mcv939DidS1B9rHJI1CftxgCH2lxD5MRgW+chCrUlBQQHvhfxe9Xbd1Q3hn
 LMVQ==
X-Gm-Message-State: AOAM530OHeLGXoHq5wMY309RrbsqrTIGc7oJo9D9mLuwHOlSNCvb3nQw
 o97jbnZD2fntXI4YMSd1b5u6AIJCCNhFWQ==
X-Google-Smtp-Source: ABdhPJwsF+hCPnBCXZyMNDECLhjlRUTTYLJpC7SUgZqtBzvEXsp5eyPs515VRK8nzwr01w9hDzGkzw==
X-Received: by 2002:a62:798e:0:b029:327:6d4a:c4db with SMTP id
 u136-20020a62798e0000b02903276d4ac4dbmr35559629pfc.50.1626849718485; 
 Tue, 20 Jul 2021 23:41:58 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.41.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:41:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/23] tcg: gdb singlestep reorg
Date: Tue, 20 Jul 2021 20:41:32 -1000
Message-Id: <20210721064155.645508-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210720195439.626594-1-richard.henderson@linaro.org>
("tcg: breakpoint reorg")

Consolidate all handling for gdb singlestep to 4 lines in cpu_tb_exec.
Drop all of the code from target/*.  Note that nios2 and sparc, lacked
support for gdb singlestep entirely, which was a bit of a surprise.


r~


Richard Henderson (23):
  accel/tcg: Handle gdb singlestep in cpu_tb_exec
  target/alpha: Drop checks for singlestep_enabled
  target/avr: Drop checks for singlestep_enabled
  target/cris: Drop checks for singlestep_enabled
  target/hexagon: Drop checks for singlestep_enabled
  target/arm: Drop checks for singlestep_enabled
  target/hppa: Drop checks for singlestep_enabled
  target/i386: Check CF_NO_GOTO_TB for dc->jmp_opt
  target/i386: Drop check for singlestep_enabled
  target/m68k: Drop checks for singlestep_enabled
  target/microblaze: Check CF_NO_GOTO_TB for DISAS_JUMP
  target/microblaze: Drop checks for singlestep_enabled
  target/mips: Fix single stepping
  target/mips: Drop exit checks for singlestep_enabled
  target/openrisc: Drop checks for singlestep_enabled
  target/ppc: Drop exit checks for singlestep_enabled
  target/riscv: Remove dead code after exception
  target/riscv: Remove exit_tb and lookup_and_goto_ptr
  target/rx: Drop checks for singlestep_enabled
  target/s390x: Drop check for singlestep_enabled
  target/sh4: Drop check for singlestep_enabled
  target/tricore: Drop check for singlestep_enabled
  target/xtensa: Drop check for singlestep_enabled

 target/i386/helper.h                          |  1 -
 target/rx/helper.h                            |  1 -
 target/sh4/helper.h                           |  1 -
 target/tricore/helper.h                       |  1 -
 accel/tcg/cpu-exec.c                          | 11 +++
 target/alpha/translate.c                      | 13 +---
 target/arm/translate-a64.c                    | 10 +--
 target/arm/translate.c                        | 36 ++-------
 target/avr/translate.c                        | 19 +----
 target/cris/translate.c                       | 16 ----
 target/hexagon/translate.c                    | 12 +--
 target/hppa/translate.c                       | 17 +----
 target/i386/tcg/misc_helper.c                 |  8 --
 target/i386/tcg/translate.c                   |  9 +--
 target/m68k/translate.c                       | 44 +++--------
 target/microblaze/translate.c                 | 18 +----
 target/mips/tcg/translate.c                   | 75 +++++++++----------
 target/openrisc/translate.c                   | 18 +----
 target/ppc/translate.c                        | 38 ++--------
 target/riscv/translate.c                      | 29 +------
 target/rx/op_helper.c                         |  8 --
 target/rx/translate.c                         | 12 +--
 target/s390x/tcg/translate.c                  |  8 +-
 target/sh4/op_helper.c                        |  5 --
 target/sh4/translate.c                        | 14 +---
 target/tricore/op_helper.c                    |  7 --
 target/tricore/translate.c                    | 14 +---
 target/xtensa/translate.c                     | 25 ++-----
 .../riscv/insn_trans/trans_privileged.c.inc   | 10 +--
 target/riscv/insn_trans/trans_rvi.c.inc       |  6 +-
 target/riscv/insn_trans/trans_rvv.c.inc       |  2 +-
 31 files changed, 118 insertions(+), 370 deletions(-)

-- 
2.25.1


