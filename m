Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2384C536629
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:52:33 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudCS-0004gE-8M
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8G-0001Fm-N5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:13 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8E-0005Nd-Rg
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:12 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 202so4823399pfu.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S6jg6YhGIUpsSzuFOGwhiIPDyTiDhCUWoS+MZ0ZCwaM=;
 b=f6OlzFsUAaKUuDqW7O6z8T8vfEWhK2fLqevjuJ33Od5X2h/YqsGk069NyuZjWkpeBd
 d+U80tjruvB8+j+NwmdW41D+drvCRs8KpuWsvougRryGBcoNQByPMXdlai4gSJ0FoZu8
 YMK3MUz5yXejz8mCB0BlsB4kIJXgYXBdMsHn4quO2OacHtsiRmGB79NLCnMMswl/4LKS
 VjhZ32CHx34c7GDtc3VERJ14xFVx2Azd0wI430IOKdBhuZnSgNprVz3Y9me1iw6SMwX9
 dAosfLqmJLrRjrYoGVw3EhV0HU7ZOJiLffybcE49v+i+fxGIonvPZjsdv64xFRFHiS3I
 jPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S6jg6YhGIUpsSzuFOGwhiIPDyTiDhCUWoS+MZ0ZCwaM=;
 b=13i+WmaMtoYu0iXtiKotnnzFhToz4oL7QVjQqGl+jpj9ZY3Z9KD+ePp2irfB1/q963
 lhSeIx84ydVCkYXRBeSoXHAAfbQ82TFu5fzyLlStLMaHjFpA7o0TDsQzIG3OrpYxBC+k
 AKxBf//9k9QhYHzQStvysy+6uE/n7v/rwxREgqj2SSbOpWChQbNYd1/QLpRTvwASHKTE
 /Zfx61YNZ3hSOBonTCtyu6cm7rNisZgtOvAPDT5HeFCsfr9Cj1OCnN6Wk6P0YaVHWgK2
 frrfaeEAQxA/VM8WRFQM70nM8G5JLeu1A5e4Ps7YsuHdziWEWyYS7pG1tu171LJnidgc
 rS5Q==
X-Gm-Message-State: AOAM53387kZZNCEu77RCmS0NyIkctHPkCR3F9wnT6O9SG46NNttNgwig
 Fzm4QghK+S+O4hHG5RdtDkVRn1cG38SaGA==
X-Google-Smtp-Source: ABdhPJwfutywYwyA9BiSRYsIYdwafZetEwSThooWIzOI2MiPs60UdyELXNnuNrKIIsIlROsZU+N/jQ==
X-Received: by 2002:a63:486:0:b0:3f5:d7f4:9827 with SMTP id
 128-20020a630486000000b003f5d7f49827mr39376933pge.583.1653670088795; 
 Fri, 27 May 2022 09:48:08 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 00/17] target/m68k: Conditional traps + trap cleanup
Date: Fri, 27 May 2022 09:47:50 -0700
Message-Id: <20220527164807.135038-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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


Changes for v4:
  - Use ILLTRP for TRAP1-TRAP14.
  - Use is_error for print_syscall_err.


r~


v1: https://lore.kernel.org/qemu-devel/20211130103752.72099-1-richard.henderson@linaro.org/
v2: https://lore.kernel.org/qemu-devel/20211202204900.50973-1-richard.henderson@linaro.org/
v3: https://lore.kernel.org/qemu-devel/20220316055840.727571-1-richard.henderson@linaro.org/
v4: https://lore.kernel.org/qemu-devel/20220430175342.370628-1-richard.henderson@linaro.org/


Richard Henderson (17):
  target/m68k: Raise the TRAPn exception with the correct pc
  target/m68k: Switch over exception type in m68k_interrupt_all
  target/m68k: Fix coding style in m68k_interrupt_all
  linux-user/m68k: Handle EXCP_TRAP1 through EXCP_TRAP15
  target/m68k: Remove retaddr in m68k_interrupt_all
  target/m68k: Fix address argument for EXCP_CHK
  target/m68k: Fix pc, c flag, and address argument for EXCP_DIV0
  target/m68k: Fix address argument for EXCP_TRACE
  target/m68k: Fix stack frame for EXCP_ILLEGAL
  target/m68k: Implement TRAPcc
  target/m68k: Implement TPF in terms of TRAPcc
  target/m68k: Implement TRAPV
  target/m68k: Implement FTRAPcc
  tests/tcg/m68k: Add trap.c
  linux-user/strace: Use is_error in print_syscall_err
  linux-user/strace: Adjust get_thread_area for m68k
  target/m68k: Mark helper_raise_exception as noreturn

 target/m68k/cpu.h              |   8 ++
 target/m68k/helper.h           |  14 +--
 linux-user/m68k/cpu_loop.c     |  13 ++-
 linux-user/strace.c            |   2 +-
 target/m68k/cpu.c              |   1 +
 target/m68k/op_helper.c        | 173 ++++++++++++++++--------------
 target/m68k/translate.c        | 190 ++++++++++++++++++++++++---------
 tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
 linux-user/strace.list         |   5 +
 tests/tcg/m68k/Makefile.target |   3 +
 10 files changed, 395 insertions(+), 143 deletions(-)
 create mode 100644 tests/tcg/m68k/trap.c

-- 
2.34.1


