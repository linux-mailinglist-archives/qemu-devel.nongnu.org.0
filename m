Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AD9698C47
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:46:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX5U-00013t-Iv; Thu, 16 Feb 2023 00:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX5M-0000wb-7Z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:45:36 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX5J-00010Y-Il
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:45:35 -0500
Received: by mail-pl1-x631.google.com with SMTP id i18so993965pli.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LvbZKnBr/NF2E/Lc5Mys2LbwF54ml+50pTQoCc89+9o=;
 b=bmxSWabnP6rjI1UZK4tJ/AaEtFx3oeE688AsfxoD7buKDALsPyijw9SJfyPIsd9+J/
 cFsOtuyFhgyzgFqRH68DtL3Oe56S1G/zScfFGnans1qbIsjhp/dpcU1eYS7bkvicOIa2
 f3rjOsQEPSQsBvQyVF5I8UvkgZy1V1ZcL4z4XBRk/16EpkUzH7EWkekuiXsLs4spRT0n
 e6htzYfB4+xsr4NY1qIbQ9c+2hUJfrW4bncTOMdhIbZhZY8CRO90Axpwa15yVL/OWEAN
 GxcAQqyf+nTx0RhHvg0ltdTcMVOxpMzTZu57ePEhpcKIhbxu0wxXcb4fX5cAyyM2SmDI
 OoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LvbZKnBr/NF2E/Lc5Mys2LbwF54ml+50pTQoCc89+9o=;
 b=r3mTxmQFM6YTzczVSO9ADEnoYKJzB+T22bqb4+G71dIV7zYYioLBB9bbjio37r+18V
 /nYXwhu1tJ9AK0ms6plR/6KCwTNaAVBykNBmaTvUVw4/+I20JMPG5vaP4qd+QYp/fPH+
 6Osd+jrnSPICRWQ2cchmWTQHaMr5WOJUU34e10ym7zSbxOQfDa5KZc5HWNV279R81jMA
 zMswf0kQHbNR37lKe6xs3PRm4KgliurbperuiDZKwWUdhqAwweaDyf9J8Rw3jFszvG7O
 uDZSV/fula8EaGov+msPifGHWAfHEhcTpdwUsxX9rnIiiYrF4IGYEo2wAxfUDHgLh5sy
 9RvQ==
X-Gm-Message-State: AO0yUKUv51PjGp7IiN+FJYCwEEnDgcLhc64PS3x2gfHU+0cIMFeYWryl
 W8Pv4vvqaUG1MI/UhzRw0FGAYZ2vj9arll8REp4=
X-Google-Smtp-Source: AK7set90yN6dBlxHNaJ7USJigrUSv+4H/Ic4C/EapsisXWLeG7XGC0Hcg0uYpx+RCNGCwpTwZQxDeA==
X-Received: by 2002:a05:6a21:33a5:b0:c7:1bcf:1de2 with SMTP id
 yy37-20020a056a2133a500b000c71bcf1de2mr1375248pzb.29.1676526331637; 
 Wed, 15 Feb 2023 21:45:31 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:45:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 00/15] linux-user/sparc: Handle missing traps
Date: Wed, 15 Feb 2023 19:45:01 -1000
Message-Id: <20230216054516.1267305-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Lots of missing trap codes for cpu_loop().

Changes for v2:
  - Fix v8plus syscall trap.
  - New patch to unify syscall error return via C flag.


r~


Richard Henderson (15):
  linux-user/sparc: Raise SIGILL for all unhandled software traps
  linux-user/sparc: Tidy syscall trap
  linux-user/sparc: Tidy syscall error return
  linux-user/sparc: Use TT_TRAP for flush windows
  linux-user/sparc: Tidy window spill/fill traps
  linux-user/sparc: Fix sparc64_{get,set}_context traps
  linux-user/sparc: Handle software breakpoint trap
  linux-user/sparc: Handle division by zero traps
  linux-user/sparc: Handle getcc, setcc, getpsr traps
  linux-user/sparc: Handle priviledged opcode trap
  linux-user/sparc: Handle privilidged action trap
  linux-user/sparc: Handle coprocessor disabled trap
  linux-user/sparc: Handle unimplemented flush trap
  linux-user/sparc: Handle floating-point exceptions
  linux-user/sparc: Handle tag overflow traps

 linux-user/sparc/target_signal.h |   2 +-
 linux-user/syscall_defs.h        |   5 +
 target/sparc/cpu.h               |   3 +-
 linux-user/sparc/cpu_loop.c      | 190 ++++++++++++++++++++++++-------
 linux-user/sparc/signal.c        |  36 +++---
 5 files changed, 175 insertions(+), 61 deletions(-)

-- 
2.34.1


