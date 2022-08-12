Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A8591554
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:12:10 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZ8j-0000Vk-KM
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4u-0003QB-0d
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4s-0006V9-85
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:11 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x10so1406889plb.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=sD0+CcYgI8AwfoWidcaSN5f+r1TeEYd0LyuTLnF/rb0=;
 b=Cyu3GAnZZRqZOQgMZrQICeh01cZGAQEKnKitOy3BIcW3QyNYeCmtcsMXRnOXgZB1Os
 1ftRVJ/oyQ3nIM+Bv8kfg4Bbpbx7n9a3jj+xrpOaoFVxW5DH390ko5/Jjbzl1n4oLIu9
 XiTeVwScJO46o57Z6hbovQhntZq9QbUjdhw9+SgzOwADmZmrBWKkRqa9qfbcmsa9asH1
 uZZN44F9LnUby8FZbUTxsE47f4GORh6sh6XCKNUctxcCI7GPixloKYWnxpo4/x8jYyXf
 dA6DDfq4hkJ1S7DgX+ZZNhK28AkvZQ3cF5atVAZTShipqUswCbbSyUTMdtr+w2R+fsFp
 goAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=sD0+CcYgI8AwfoWidcaSN5f+r1TeEYd0LyuTLnF/rb0=;
 b=N1LQRdBfeQp6l8nsUtnoEBdbG2BppMUhekyACEQw/8RE76aHNs24G8KXmgkg43KhnF
 t24W4jYH0rdL0sFN906Tdht9X0AhnVe8JUwgymiaZ/WpDokJ7CVtHm8SveAZ/RYZE2Ig
 6KEsR1SYPvbI9wLURMIZ4RkmPiaudTAPHOvQYYOGP81RYmAkiaubx/mikXnhq+tFbWRH
 gEZo0TM8/eSPjlIgyTBDZNWJ0K+dbeu01ymZSXhkZuXoBqSDU5ZRIpqnGbk2AJ0MHOgV
 sQMkbXMEag0HzvvLUBttbvFAP1Rymr3cT2uMeJ4NfXWDL7k0r5w9p0eNcaexlofsVFta
 DdQw==
X-Gm-Message-State: ACgBeo0Xp+IqlL4PBu9g9CxxBF6pk9wlGpBrtZ7K1w2eTVOxLb24Z7fv
 PvVSGPlgWl3wdyBXby63sV4HUo1DVis7yg==
X-Google-Smtp-Source: AA6agR5HGNFQ99Ls6ajg+lmVpqXv2KbELpjccfvqgweVaiLjZK9WB2PcZtiOMnCjP83JyB0x10/RwQ==
X-Received: by 2002:a17:90b:4b05:b0:1f5:b530:af6b with SMTP id
 lx5-20020a17090b4b0500b001f5b530af6bmr15307017pjb.150.1660327688458; 
 Fri, 12 Aug 2022 11:08:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 00/21] accel/tcg: minimize tlb lookups during
 translate + user-only PROT_EXEC fixes
Date: Fri, 12 Aug 2022 11:07:45 -0700
Message-Id: <20220812180806.2128593-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

This is part of a larger body of work, but in the process of
reorganizing I was reminded that PROT_EXEC wasn't being enforced
properly for user-only.  As this has come up in the context of
some of Ilya's patches, I thought I'd go ahead and post this part.


r~


Ilya Leoshkevich (1):
  accel/tcg: Introduce is_same_page()

Richard Henderson (20):
  linux-user/arm: Mark the commpage executable
  linux-user/hppa: Allocate page zero as a commpage
  linux-user/x86_64: Allocate vsyscall page as a commpage
  linux-user: Honor PT_GNU_STACK
  tests/tcg/i386: Move smc_code2 to an executable section
  accel/tcg: Remove PageDesc code_bitmap
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Merge tb_htable_lookup into caller
  accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
  accel/tcg: Properly implement get_page_addr_code for user-only
  accel/tcg: Use probe_access_internal for softmmu
    get_page_addr_code_hostp
  accel/tcg: Add nofault parameter to get_page_addr_code_hostp
  accel/tcg: Unlock mmap_lock after longjmp
  accel/tcg: Hoist get_page_addr_code out of tb_lookup
  accel/tcg: Hoist get_page_addr_code out of tb_gen_code
  accel/tcg: Raise PROT_EXEC exception early
  accel/tcg: Remove translator_ldsw
  accel/tcg: Add pc and host_pc params to gen_intermediate_code
  accel/tcg: Add fast path for translator_ld*
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start

 accel/tcg/internal.h          |   7 +-
 include/elf.h                 |   1 +
 include/exec/cpu-common.h     |   1 +
 include/exec/exec-all.h       |  87 +++++-----------
 include/exec/plugin-gen.h     |   7 +-
 include/exec/translator.h     |  85 ++++++++++++----
 linux-user/arm/target_cpu.h   |   4 +-
 linux-user/qemu.h             |   1 +
 accel/tcg/cpu-exec.c          | 184 ++++++++++++++++++----------------
 accel/tcg/cputlb.c            |  93 +++++------------
 accel/tcg/plugin-gen.c        |  23 +++--
 accel/tcg/translate-all.c     | 120 ++++------------------
 accel/tcg/translator.c        | 122 +++++++++++++++++-----
 accel/tcg/user-exec.c         |  15 +++
 linux-user/elfload.c          |  80 ++++++++++++++-
 softmmu/physmem.c             |  12 +++
 target/alpha/translate.c      |   5 +-
 target/arm/translate.c        |   5 +-
 target/avr/translate.c        |   5 +-
 target/cris/translate.c       |   5 +-
 target/hexagon/translate.c    |   6 +-
 target/hppa/translate.c       |   5 +-
 target/i386/tcg/translate.c   |   7 +-
 target/loongarch/translate.c  |   6 +-
 target/m68k/translate.c       |   5 +-
 target/microblaze/translate.c |   5 +-
 target/mips/tcg/translate.c   |   5 +-
 target/nios2/translate.c      |   5 +-
 target/openrisc/translate.c   |   6 +-
 target/ppc/translate.c        |   5 +-
 target/riscv/translate.c      |   5 +-
 target/rx/translate.c         |   5 +-
 target/s390x/tcg/translate.c  |   5 +-
 target/sh4/translate.c        |   5 +-
 target/sparc/translate.c      |   5 +-
 target/tricore/translate.c    |   6 +-
 target/xtensa/translate.c     |   6 +-
 tests/tcg/i386/test-i386.c    |   2 +-
 38 files changed, 532 insertions(+), 424 deletions(-)

-- 
2.34.1


