Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287C3C5F84
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y4z-0006jp-TS
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2T-0003zG-HF
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:09 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2R-0000sU-NX
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id bt15so5259266pjb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JynHDwh3qrJ6bp1ZaH4rs44Gg3VWLMUrrBPyIry0ulQ=;
 b=myEj3dwRB39JXWIQw1xRJB31pjPG7kSUV1yYaTbo7hjhTspiW4ZEyaEldnMJOzcsYH
 h7rMOuXD1qfzpZTdbhBadHPYTF9g+M8huxSehmrwMcWCaNAuTHrpfefhLo3BAUn8tjWf
 9S6juzRzP6R7pEb52eLneN9IUfrufplA9zCb+1aCc6kMAxjsYVWm22h+cAVRk2YFd+W3
 UJB7QLwDIFKXBI0z9obvpEslu/MZMtURkJcBNv+mJCp/GoeQTj51LiEzERZ7BqCC4JDk
 S3I3TqkcCYxKf2gQgPCnOzwGKOjLncPHEaRt2wKzOAex0a9r4zZKD+7W2nEyUmCFCE7C
 i8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JynHDwh3qrJ6bp1ZaH4rs44Gg3VWLMUrrBPyIry0ulQ=;
 b=Y5eBa57UNybkkMed8u9CBV+Q26SyYNEdjBYdiqVc0fIASGa4/c+1vVPJeYuzCptSlx
 hZPcVi1o9jOGj6nTjBYg6s9YqY8W8L9JAcIUeNfpYsUlSXH7I3gbqfhLMW2NqB6vPZHi
 j1avgg2a9UWa+Ne/CxlQfvuqDJSTgLMOQMLSruWNHUmgiB1iaXijwwjTkJuDBZbMFxSD
 EipnU5MRuk6X3xjWGbzpzKOa2S48jOaaPBmEwK/tIjXn1aD3fe3DlsW+TlrAuPYifhNM
 spO30onlLHW63H0aQsJdZOFtV77a5jTfcSXhhpt5Fe8mZhaHwDGH/Jy83IgJeMx7iHz1
 +Vvw==
X-Gm-Message-State: AOAM531Z+OLajSIAT9UYNHkVJE+NgFrIKfpQVdq8RHSLni5QrFyYRgb1
 mlT714nXNYTzNiZ8WcMFtQX7C/sfqgUaEA==
X-Google-Smtp-Source: ABdhPJxhFVj8/mYx2IkqO/+f4WAImzsllAgvqi9fp2ipfLNUMVx4Ck7ZVKnq7v4Y7AWxXI/6jEceQw==
X-Received: by 2002:a17:90a:d3ca:: with SMTP id
 d10mr7646256pjw.35.1626104405206; 
 Mon, 12 Jul 2021 08:40:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/10] tcg: breakpoint reorg
Date: Mon, 12 Jul 2021 08:39:54 -0700
Message-Id: <20210712154004.1410832-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is fixing #404 ("windows xp boot takes much longer...")
and several other similar reports.

For v2, all prerequisites and 7 of the patches from v1 with
reviews are now upstream.

Mark Cave-Ayland reported success with WinXP with v1, with
this patch set being even faster than b55f54bc~1.  Which was
a bit of a surprise, but I'll take it.  It means that it's
probably not worth making the breakpoint detection scheme
any more complicated.

I'd still like some more feedback.  Given this is fixing a
regression from qemu 5.2 I feel comfortable delaying this
past soft freeze, but not past hard freeze on the 20th.


r~


Richard Henderson (10):
  accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
  accel/tcg: Move curr_cflags into cpu-exec.c
  accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
  accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
  accel/tcg: Handle -singlestep in curr_cflags
  accel/tcg: Use CF_NO_GOTO_{TB,PTR} in cpu_exec_step_atomic
  accel/tcg: Move cflags lookup into tb_find
  accel/tcg: Adjust interface of TranslatorOps.breakpoint_check
  accel/tcg: Hoist tb_cflags to a local in translator_loop
  accel/tcg: Encode breakpoint info into tb->cflags

 include/exec/exec-all.h       |  30 +++++---
 include/exec/translator.h     |  17 +++--
 accel/tcg/cpu-exec.c          | 130 ++++++++++++++++++++++++++++------
 accel/tcg/translate-all.c     |   7 +-
 accel/tcg/translator.c        |  79 ++++++++++++++-------
 cpu.c                         |  24 -------
 target/alpha/translate.c      |  12 +---
 target/arm/translate-a64.c    |  14 ++--
 target/arm/translate.c        |  20 +++---
 target/avr/translate.c        |   6 +-
 target/cris/translate.c       |  14 ++--
 target/hexagon/translate.c    |  13 +---
 target/hppa/translate.c       |   7 +-
 target/i386/tcg/translate.c   |  15 ++--
 target/m68k/translate.c       |  14 +---
 target/microblaze/translate.c |  14 +---
 target/mips/tcg/translate.c   |  14 ++--
 target/nios2/translate.c      |  13 +---
 target/openrisc/translate.c   |  11 +--
 target/ppc/translate.c        |  13 +---
 target/riscv/translate.c      |  11 +--
 target/rx/translate.c         |   8 +--
 target/s390x/translate.c      |  12 ++--
 target/sh4/translate.c        |  12 ++--
 target/sparc/translate.c      |   9 ++-
 target/tricore/translate.c    |  13 +---
 target/xtensa/translate.c     |  12 ++--
 tcg/tcg-op.c                  |  28 ++++----
 28 files changed, 280 insertions(+), 292 deletions(-)

-- 
2.25.1


