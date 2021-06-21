Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5F3AE151
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:36:33 +0200 (CEST)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8rY-0006FI-At
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8po-0003dm-RH
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:44 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pm-00057v-Ib
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:44 -0400
Received: by mail-pf1-x432.google.com with SMTP id w71so2385768pfd.4
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w3j4u0b0lYKHHY/ppskNbDUxZ6l/6WdCw4eeMSPOdSo=;
 b=Xy2TPFBFLsebEWdIT7Hj3QqORefEAEsRNNhnxmrlZ3TDb0ZK6l78F8iwCe7nRWpeBX
 NEyl81s5VQl2fn333OhpIDHEf0nPMd40TWQQjMZ6DAjA/RFNYBFpaSHbUq5T/sB180TQ
 dlE4GbO8lsU7sxljYEimk+cGlC9JCTHuIaMBNjkvEC1YRL1Hl8XxA2dEZTzIh8N7ftzq
 2LW9x9h1To3jU6/dFN+rglAT1Fr0xg2pmI4TbN31kzRlVpH+ksFYXBx4rvUmM1WjNqvI
 TrUuphgS7CxqBJXLnjMFQ1YTkgdwjX1ArhoqGLQwq3u3v2i7VJx+HNyQiTLlfTmMg3Ip
 ia5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w3j4u0b0lYKHHY/ppskNbDUxZ6l/6WdCw4eeMSPOdSo=;
 b=BGkTRSvhvxbTUFDNii/JGyZon5KNagaz8Km+C7CaMWUdYNs1EnL44l51/QkojfuGzg
 MNFK4cm95NFGlpr+bNX1blbHACz1HXNrnsAiBel23E+ju9fJTs5xV488AINhew8uQdsH
 L2f3ByAezVn6iqdh0t7Vn70nORDUi4P1waEF54FEYYJTpSWoge1STeo2RFxy8E6oMVHZ
 9thQbofFZD+Toqw/LdusEoVlg1eIL5DVg/Eed/FGPtkFOK8VToAK+0uJz3RLTlsF4YnK
 xktMWBsaNYVTJAnPK14OCxKR4exKwJ2eXBeqRxfe61RRvYFmQgbn9lbbEA57x6IBR1xf
 7C4g==
X-Gm-Message-State: AOAM53254FPJETTQyAdd4F0S+hqxkICEYRC8gB7e0RkBBNufXHwHWndP
 uP+UbKtJWgkkh0DH674PLeu1LZlooItFqQ==
X-Google-Smtp-Source: ABdhPJzhMCqqD5EKYiDDtJPYDSVrlQ+2YGPpFOHOmKBcLbVI68RpLf0DGtF8xWmS1/CvJywZuMPAkg==
X-Received: by 2002:a63:d347:: with SMTP id u7mr21747221pgi.434.1624239280990; 
 Sun, 20 Jun 2021 18:34:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/26] accel/tcg: Introduce translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:13 -0700
Message-Id: <20210621013439.1791385-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Based on my recent avr, cris and nios2 patch sets.  The full tree is

    https://gitlab.com/rth7680/qemu/-/tree/tcg-goto-tb


r~


Richard Henderson (26):
  accel/tcg: Introduce translator_use_goto_tb
  target/alpha: Remove use_exit_tb
  target/alpha: Remove in_superpage
  target/alpha: Use translator_use_goto_tb
  target/arm: Use translator_use_goto_tb
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
 target/arm/translate.h        | 13 ++++++++++
 target/avr/helper.h           |  8 +++---
 accel/tcg/translator.c        | 11 +++++++++
 target/alpha/translate.c      | 46 ++++-------------------------------
 target/arm/translate-a64.c    | 22 +----------------
 target/arm/translate.c        | 10 --------
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
 24 files changed, 89 insertions(+), 252 deletions(-)

-- 
2.25.1


