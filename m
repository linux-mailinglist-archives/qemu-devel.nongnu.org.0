Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B413B8880
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:35:09 +0200 (CEST)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf3D-0007kA-Va
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0i-00055G-86
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:32 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0g-0001xI-AK
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:31 -0400
Received: by mail-pl1-x633.google.com with SMTP id h6so850098plf.11
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zIrx+SHHRdZO2VwRHQ7/s7820v+IgglYTKNw9IDKdmc=;
 b=X6oL1B4KvrSFueZaYthOTDFWy0L77xof9TAmUnlAni1uigzO7UdUW0a+Rsa7d/3Am7
 SoCrTO9ElVqbyqDvTN8YIuZ5ryudo4lSfqaUOZRPjDQKeC8bE/BHtou3J0VP4wOqQYrs
 VlP8dpKBrdlmhLsbYUi2PTATzuDhY56UxBfhMynCvWr72cPdd6vo2sitzH4K9vS0S94L
 Sjj2W3Vxv0AgrMugatefuwIbP9fCTcRzT4z61FjZXvn287W7hJ2gkD3V7N/mi2X6614g
 G1cmpMnUVvng0QZRIe38dbPI0tqHSIHXyCzwFe1FuTrTYhcWwnYzhs4A045y6X24GfXH
 WsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zIrx+SHHRdZO2VwRHQ7/s7820v+IgglYTKNw9IDKdmc=;
 b=e97KsZ8Dbz4Fo3Xc7RROBbZqvgDxErXdZpCTh4Iot6vwinu3k0JiPZRuemR+ZgLxiF
 jrdY3qG5Mp5jR/w/3W3Y6BPO0S6A599kdmfVqOO0D0ss/xMA0a7Fppv6xnEV8C6l6Xiu
 UClTRSUwoMMHuaI2x9xpDPuE/eEggOUcpK5PGpYUoUkQfmC1lI/Rf0ErPPjSGrj00dA0
 iVmz35E9TpZ8hCy+obemCphf2jzRB1M7RI5FpB0SoaiQ+vx53fuOSGS/j5NVWYTc/SzC
 bpstiXXJEmEeAu3N/PQvxyP2LS1qz1j6cxoBTqa6lxgZo7XbrOey+gteOj/q0YfV0wxo
 835Q==
X-Gm-Message-State: AOAM5338JAtsQp0lsgZ5GbXR80ONOo30xIkJ/FFuMAaJtkclCiXoXK5C
 Lzq6+5VmXnfSaBfRwwRr3uCot680z+iUqg==
X-Google-Smtp-Source: ABdhPJw+gUfBUs/FRekwfsJFM0UQA2zuMq3xtpUK9HnN7XDcklYkP4K4EUQBghA1lo3wUWorupJMSA==
X-Received: by 2002:a17:90a:3844:: with SMTP id
 l4mr5679324pjf.137.1625077947999; 
 Wed, 30 Jun 2021 11:32:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/28] accel/tcg: Introduce translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:31:58 -0700
Message-Id: <20210630183226.3290849-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Based-on: <20210629185455.3131172-1-richard.henderson@linaro.org>
("[PULL 00/63] tcg patch queue")

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

Changes for v2:
  * Fix aarch32 ISB, SB insns vs single-stepping.
  * Drop use_goto_tb for aarch32
  * Retain use_goto_tb for aarch64.

Patches lacking review:
  02-target-alpha-Remove-use_exit_tb.patch
  03-target-alpha-Remove-in_superpage.patch
  04-target-alpha-Use-translator_use_goto_tb.patch
  05-target-arm-Use-gen_jmp-for-ISB-and-SB.patch
  06-target-arm-Use-translator_use_goto_tb-for-aarch64.patch
  07-target-arm-Use-translator_use_goto_tb-for-aarch32.patch
  08-target-avr-Use-translator_use_goto_tb.patch
  10-target-cris-Use-translator_use_goto_tb.patch
  11-target-hppa-Use-translator_use_goto_tb.patch
  12-target-i386-Use-translator_use_goto_tb.patch
  14-target-microblaze-Use-translator_use_goto_tb.patch
  15-target-mips-Use-translator_use_goto_tb.patch
  17-target-nios2-Use-translator_use_goto_tb.patch
  18-target-openrisc-Use-translator_use_goto_tb.patch
  21-target-rx-Use-translator_use_goto_tb.patch
  22-target-s390x-Use-translator_use_goto_tb.patch
  23-target-s390x-Remove-use_exit_tb.patch
  24-target-sh4-Use-translator_use_goto_tb.patch


r~


Richard Henderson (28):
  accel/tcg: Introduce translator_use_goto_tb
  target/alpha: Remove use_exit_tb
  target/alpha: Remove in_superpage
  target/alpha: Use translator_use_goto_tb
  target/arm: Use gen_jmp for ISB and SB
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


