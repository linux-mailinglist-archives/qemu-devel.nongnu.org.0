Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F423F3C55
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:02:31 +0200 (CEST)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXCH-0004Sp-L4
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9w-00026j-6C
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:04 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9u-0004RS-7p
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 oc2-20020a17090b1c0200b00179e56772d6so6174078pjb.4
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lIQ/OA4yaudhj2NJw5BECafH1Pa0q9uSWP5z0glX674=;
 b=D9c4zemE/yVCBktpg4kfxd04yG2+bItSnO7oJlyzleREfL44wEfLSLR+7yRV/vWwbP
 +5vkMgH+y0dol2Sz5/O4xJxQH1HfFEJOG0Rs1zf9zdSwwdy33IqkhwxakmatdUFzb+qJ
 ogQS7sB0VEkWYl7x39W20ipUjlEQmuPlOekjuAUj3LS6KMPU9Vzu1QYxRF4S4Lj/O6T4
 d585NUUoMJt33J+Xg/G9+1wxzs9BQbeJ+bUb6QCNBkkS81I55DPeRY3a8Nv8E4GtqpRU
 qHxPLqLiSfVW0O3cnFrarJQCdfDPcyhkXq6pekic777pYIJ/M7bByRcTzBJTZgSiDZMF
 3CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lIQ/OA4yaudhj2NJw5BECafH1Pa0q9uSWP5z0glX674=;
 b=BOgBrce1ftL8NdYAcSTO6YybmWfjHAOFtK9MPDFu1lryexfjQR74doI+h05TIeAATP
 1l1Di0ZVo+5eI2yppVJUxD7h2dd86qJhZzgKyIc0Hwoo3EmlMwxPSLqEfKnuWseabjw8
 +RL9wwlnMgOlI+EwtxTvZOhlAyertAGl47JlLtEUA9bdqBFnbZ5UPRUVBLOgu36YGAca
 l+U1jh/UAm3UAQ6oiuzsjX0SXVOL/07+ZEoappojemZ46Ex/bVjKS06jeh8MQTI7lQir
 lNgwLJFOSo7oPM8rEOpyLDUy2m1FG1sHPTpFLR/KGVCHqO1Qs6gH+0CDh636gIJDjoAd
 9V7g==
X-Gm-Message-State: AOAM531YFfXO1hHBZnB8q2s3f1Tcw4ID0meKwT9OzcvNMWMZ1BF7mtYp
 PDDGyeE34iDhG/Xhe7Obo/eJL3ySgYjGsg==
X-Google-Smtp-Source: ABdhPJy05R13rG1Y6ffOzLz2jhn4MetMzg/Qv6dbJuhdco2pzlRo9eiNH8qkZ55Eo17NYCH+v1Gwpg==
X-Received: by 2002:a17:90a:a406:: with SMTP id
 y6mr10996064pjp.221.1629575999990; 
 Sat, 21 Aug 2021 12:59:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.12.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 12:59:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] target/arm: Fix insn exception priorities
Date: Sat, 21 Aug 2021 12:59:50 -0700
Message-Id: <20210821195958.41312-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Raise pc alignment faults.
Fix single-step and pc-align priority over breakpoints.
Not yet fixing insn abort priority over breakpoints.

Based-on: 20210813131809.28655-1-peter.maydell@linaro.org
("linux-user: Clean up siginfo_t handling for arm, aarch64")

Changes for v2:
  * Handle the exceptions in cpu_loop.
  * Fix how the instruction is raised for aa32 el1.
  * Add pc alignment test cases.


r~


Peter Maydell (1):
  target/arm: Take an exception if PSTATE.IL is set

Richard Henderson (7):
  target/arm: Merge disas_a64_insn into aarch64_tr_translate_insn
  linux-user/aarch64: Handle EC_PCALIGNMENT
  linux-user/arm: Report SIGBUS and SIGSEGV correctly
  target/arm: Take an exception if PC is misaligned
  target/arm: Assert thumb pc is aligned
  target/arm: Suppress bp for exceptions with more priority
  tests/tcg: Add arm and aarch64 pc alignment tests

 target/arm/cpu.h                  |   1 +
 target/arm/helper.h               |   1 +
 target/arm/syndrome.h             |  10 ++
 target/arm/translate.h            |   2 +
 linux-user/aarch64/cpu_loop.c     |  44 +++--
 linux-user/arm/cpu_loop.c         |  39 ++++-
 target/arm/debug_helper.c         |  23 +++
 target/arm/gdbstub.c              |   9 +-
 target/arm/helper-a64.c           |   1 +
 target/arm/helper.c               |   8 +
 target/arm/machine.c              |   9 +
 target/arm/tlb_helper.c           |  24 +++
 target/arm/translate-a64.c        | 276 ++++++++++++++++--------------
 target/arm/translate.c            |  63 ++++++-
 tests/tcg/aarch64/pcalign-a64.c   |  37 ++++
 tests/tcg/arm/pcalign-a32.c       |  46 +++++
 tests/tcg/aarch64/Makefile.target |   4 +-
 tests/tcg/arm/Makefile.target     |   4 +
 18 files changed, 441 insertions(+), 160 deletions(-)
 create mode 100644 tests/tcg/aarch64/pcalign-a64.c
 create mode 100644 tests/tcg/arm/pcalign-a32.c

-- 
2.25.1


