Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24D3C177C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:55:00 +0200 (CEST)
Received: from localhost ([::1]:46492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XIh-00073V-DY
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5A-0001QK-42
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X53-00089X-An
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:40:59 -0400
Received: by mail-pg1-x535.google.com with SMTP id g22so6598287pgl.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBD1a7zkCc50eSD8T84fczo4U4zVqH9Hz3oqPIcR0lc=;
 b=IehU/iKahgKnn75UPx7XhJ6xnpuuil2KeyfGmXtbDwDbK7PmvTRFMUpdwra12tuAjf
 i7FYWMh4ywPwyGl3xJrr+PorJ2wpCqcxSQYEla6d0tbh6QfsXZ6EsZ5gcw2FpsdhvCsP
 9tQTL/2yBRkB1gdlOpF0apayyTnDMCWrJaocqRjVPpvNwLEDhSepBI6xPzyOmhkP0BXh
 Agpq0R3LtsWirSHbtUzK49MigKxfM2hCdY+GHoBH0v2U6PlppjcomWVgLyzebTCEdH6w
 kPQUKxW+tUOzaicrGVLESVq4h8re71KR1SMDOU1gguZFbUUaXO9pML7ZJY9LA+OHswtG
 BJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBD1a7zkCc50eSD8T84fczo4U4zVqH9Hz3oqPIcR0lc=;
 b=fDVzSrF3VN/dlQ45VM7rH4zCQy5QAybkjH83/q0oaBT8yKiKsI/SVUk6falQgkJ03J
 vC5VW/sllR6PQBBJ3oLnOFARZ+Ib9apDEt5R6Pip0mLfIT4sF1HJBXgFHu2zVNNfNm5P
 Nogam16e428fKnglbSh9bycrRZ5wr45/AYZzLmGen0L7eUVUJH40WH0muxWvuHdf+c9f
 lJFT/DZNmgkzCQcbDDJllJGCZHmqPzwfqUoJSHiGkTMYpx/Vt98ZU/wAvSCqIv99kCOb
 1JW3TV7J3Iui63S+yooHsBcX2waD+0x+F0paYq9ubEgRCEHjKBTYv1JFjsPnwr3fDnbL
 w7/g==
X-Gm-Message-State: AOAM5305WuqckbSEeJFyNAf0Vyw/6hFCsyNO4BoCl8dPyv21uQuUvVzf
 3YaaZ+fwn5p/JN7QNE1EDQvftvcka7VoAg==
X-Google-Smtp-Source: ABdhPJyn46zKYKaaC6YChWIFUndaFMa8TBliYEU1YTZhm06mDVE9HknJ3UEyVgDa+Akz3E9bWohe2Q==
X-Received: by 2002:a63:f40e:: with SMTP id g14mr32915542pgi.158.1625762450875; 
 Thu, 08 Jul 2021 09:40:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/28] accel/tcg: Introduce translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:22 -0700
Message-Id: <20210708164050.711967-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There are a number of inconsistencies with goto_tb usage, and I
plan to make changes in order to better support breakpoints.

(1) Testing CF_LAST_IO is a hold-over from since before ba3e7926691
    ("icount: clean up cpu_can_io at the entry to the block").
    Several targets still have this test.

(2) Testing singlestep is superfluous, as it doesn't mean anything
    besides limiting max_insns to 1.

(3) Not testing page crossing for CONFIG_USER_ONLY is wrong, because
    mmap and mprotect can change page permissions.  It's a very
    uncommon case wrt executables, but it's still wrong.

(4) Not testing page crossing for non-mmu targets (where page
    permissions literally cannot change) is not currently wrong,
    but will be after the breakpoint changes.

(5) When the TB does cross two pages, considering non-page crossing
    from the second page is not currently wrong, but will be after
    the breakpoint changes.

Changes for v3:
  * Adjust aarch32 ISB, SB change to simply set is_jmp.

Changes for v2:
  * Fix aarch32 ISB, SB insns vs single-stepping.
  * Drop use_goto_tb for aarch32
  * Retain use_goto_tb for aarch64.

Patches lacking review:
  05-target-arm-Use-DISAS_TOO_MANY-for-ISB-and-SB.patch


r~


Richard Henderson (28):
  accel/tcg: Introduce translator_use_goto_tb
  target/alpha: Remove use_exit_tb
  target/alpha: Remove in_superpage
  target/alpha: Use translator_use_goto_tb
  target/arm: Use DISAS_TOO_MANY for ISB and SB
  target/arm: Use translator_use_goto_tb for aarch64
  target/arm: Use translator_use_goto_tb for aarch32
  target/avr: Use translator_use_goto_tb
  target/avr: Mark some helpers noreturn
  target/cris: Use translator_use_goto_tb
  target/hppa: Use translator_use_goto_tb
  target/i386: Use translator_use_goto_tb
  target/m68k: Use translator_use_goto_tb
  target/microblaze: Use translator_use_goto_tb
  target/mips: Use translator_use_goto_tb
  target/mips: Fix missing else in gen_goto_tb
  target/nios2: Use translator_use_goto_tb
  target/openrisc: Use translator_use_goto_tb
  target/ppc: Use translator_use_goto_tb
  target/riscv: Use translator_use_goto_tb
  target/rx: Use translator_use_goto_tb
  target/s390x: Use translator_use_goto_tb
  target/s390x: Remove use_exit_tb
  target/sh4: Use translator_use_goto_tb
  target/sparc: Use translator_use_goto_tb
  target/tricore: Use translator_use_goto_tb
  target/tricore: Use tcg_gen_lookup_and_goto_ptr
  target/xtensa: Use translator_use_goto_tb

 include/exec/translator.h     | 10 ++++++++
 target/avr/helper.h           |  8 +++---
 accel/tcg/translator.c        | 11 +++++++++
 target/alpha/translate.c      | 46 ++++-------------------------------
 target/arm/translate-a64.c    | 25 ++++---------------
 target/arm/translate.c        | 16 +++---------
 target/avr/translate.c        |  9 ++++---
 target/cris/translate.c       |  5 ++--
 target/hppa/translate.c       |  5 +---
 target/i386/tcg/translate.c   | 14 ++---------
 target/m68k/translate.c       | 12 +--------
 target/microblaze/translate.c | 11 +--------
 target/mips/tcg/translate.c   | 20 +++------------
 target/nios2/translate.c      | 15 +-----------
 target/openrisc/translate.c   | 15 ++++++------
 target/ppc/translate.c        | 10 +-------
 target/riscv/translate.c      | 20 +--------------
 target/rx/translate.c         | 11 +--------
 target/s390x/translate.c      | 18 +++-----------
 target/sh4/translate.c        | 11 +++------
 target/sparc/translate.c      | 19 ++++-----------
 target/tricore/translate.c    | 20 +++------------
 target/xtensa/translate.c     |  6 +----
 23 files changed, 83 insertions(+), 254 deletions(-)

-- 
2.25.1


