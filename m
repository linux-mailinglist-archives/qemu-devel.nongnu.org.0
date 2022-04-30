Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01DB515FAF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:55:50 +0200 (CEST)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrJt-00079M-HK
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHv-0004Sx-C7
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:47 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHt-00080l-Hn
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1090025pjv.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QvqCzpSbp/v60qq8pQb1YIj+QHxKN4+LamQEcdg6DwQ=;
 b=lOVO9nYB5m4+ZzUBf4RAoCdALxXFArsuTx6V5T6bE8Q9KbouOIvMe79RJnlEHjfdMe
 s1vxwvDX2AGhHql+anmCUM6g2sOfkiBuV5umjtnDo/THjrGEeYjwyxVantbZ6vw9v4k4
 RFkUj6lNhQWQzCG3SxtLCG5df9VsIEC9El5ddToGjETgxZNvHB2263TahRqZ4aNFh1YN
 G6oh+Mq8l/FVLADjI4iW0qLdMwj2zWoLHHSPBDW2gdfcXDaLwA/ZSD5sDvvrTFHplMIn
 OzhaKgn89yZJAZC5dVsk32sk24Zr4CHnC1+JbEhudQpeMvev2pAeSnoVpXOJ1c9vjzc1
 KxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QvqCzpSbp/v60qq8pQb1YIj+QHxKN4+LamQEcdg6DwQ=;
 b=MNnO5wtnaUQJhInCqsdVFIXWlZhlY1jm97l8otmwCiKHmoWmfyJ3m1ticSUsa+WcL1
 5/AZk+nVjSa57TwEZebCfV1KDzEadZo+FqPBaUJQQWkZaRfuR9avXQWsYwPV6Gr4r5Nr
 hUKaMUh6fHowq1qg2P/Vg5Fxqknnq4RlkirckWq5K1HUCoKni+/42c6KPeKKZ8koVxOL
 /hqJ7a25AMXgskoFC2QttEdC/HLSqM5MRVm3CLppMGmXl/lG3kc49MOelIrHKqZrkTqp
 k5PrZesgs6xf9gBoU3YksuDPovciRPPutp22nzVtszmQtCrRllAlXYTKE5yaBzkklqQQ
 FN/w==
X-Gm-Message-State: AOAM531Lh2TTgZWgs1DsbigO+Y8adB3wMshPJH2+cd1AAqQSA4OZQsN6
 luGuQrUy4yUmQ9su1WJ+ZAIJY0Or8MMm0w==
X-Google-Smtp-Source: ABdhPJzlAHynknWczF3ZL0grjGJ7/9kffmmcboPHhPV3HTZCbbmEe5VU3ML3sjA+rLYqN/rvORiDlA==
X-Received: by 2002:a17:90a:e517:b0:1d7:5bbd:f9f0 with SMTP id
 t23-20020a17090ae51700b001d75bbdf9f0mr5012432pjy.77.1651341223516; 
 Sat, 30 Apr 2022 10:53:43 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/17] target/m68k: Conditional traps + trap cleanup
Date: Sat, 30 Apr 2022 10:53:25 -0700
Message-Id: <20220430175342.370628-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  - Rebase, which requires QEMU_NORETURN -> G_NORETURN.
  - Cast -4096 to abi_ulong for print_syscall_err.


r~


v1: https://lore.kernel.org/qemu-devel/20211130103752.72099-1-richard.henderson@linaro.org/
v2: https://lore.kernel.org/qemu-devel/20211202204900.50973-1-richard.henderson@linaro.org/
v3: https://lore.kernel.org/qemu-devel/20220316055840.727571-1-richard.henderson@linaro.org/


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
  linux-user/strace: Fix print_syscall_err
  linux-user/strace: Adjust get_thread_area for m68k
  target/m68k: Mark helper_raise_exception as noreturn

 target/m68k/cpu.h              |   8 ++
 target/m68k/helper.h           |  14 +--
 linux-user/m68k/cpu_loop.c     |  11 +-
 linux-user/strace.c            |   4 +-
 target/m68k/cpu.c              |   1 +
 target/m68k/op_helper.c        | 173 ++++++++++++++++--------------
 target/m68k/translate.c        | 190 ++++++++++++++++++++++++---------
 tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
 linux-user/strace.list         |   5 +
 tests/tcg/m68k/Makefile.target |   3 +
 10 files changed, 394 insertions(+), 144 deletions(-)
 create mode 100644 tests/tcg/m68k/trap.c

-- 
2.34.1


