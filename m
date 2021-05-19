Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19C389571
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:33:36 +0200 (CEST)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR0g-0006TX-O1
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyE-0003OP-7n
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:02 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:33287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQy6-0005Ru-Ip
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:00 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so12660592oto.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=se9t98h4DyEYvSpGaYwCGL20PjoT8CCQ3jD6oBco6Zk=;
 b=QBht8JD6+TsXrgIyT0evGx32prkQXTWMpQLLSjg8BcyZzTva31PgiucsO9x38bYZ5e
 1tWqjvEL35s/w1qPYP69fnrk1ckvvZ0WhjMmDM42Wb88RROHNpGawEtvbt48RMPd6vO9
 bDvq/Yzgn2uBNQX0Yrcs6XQeFpXzGpWRVl+9rt/oHoJYkhbC2+6mOKEo4A0aQ1TjUb3c
 IB4U1iQlG+4IMTTNl0ZW3bDkmgk8IH3bVu6oF8pzU3x0M9mNb+jQ5rYHxALywSKqILAD
 +ost+DlKulqfuV+eEGThqrM3Uyk04K+eMTfQyw297ezx8FWUuLR1qaEeE65jMh608D6c
 xyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=se9t98h4DyEYvSpGaYwCGL20PjoT8CCQ3jD6oBco6Zk=;
 b=OdduQ+VAOq5mvxnwmMTwE953YJSiakZmCtV351dyQKHDZk/cTtEWGGl1nQjTZKfrl3
 ub6DwdiTCd71+jP/cxjZmSK+fjTgVi+Y28kk25M4Vq+AoobLf4xhifSNoqLOBMtH/1xp
 pr47V0JDxh2zMTVDFbE8IXB0mfJhYQpQHk6qqKObz/hZfIRsKeYpuZLznwAQLm8ZF7/7
 SmwY8TQ03FtenQaRD+EYtoiDiSN+5KzXcUNlMH0mN9Nk3cB0W9BV/J/jEbfqnyi7cxrG
 WINUAmkRw42EdLBIUE38KzcOO1yJ0ThAbOXsB9YNhPkyukB7ZPMGvjhvKX6iMYaWg9+Y
 yIEw==
X-Gm-Message-State: AOAM533HtXAJSGwIUXj2FV3HXFXaXK5kyXUhlFYqMErMx2NEibxpv16n
 iy1d7hYoc0yqSiKeUb1LUPJfHCjeT2IRnw1V
X-Google-Smtp-Source: ABdhPJxrRoBUL90Jn98VD6hC0rm4ROdydWH8AvgBghHWf4O9VvchwNp5+wBiP2erPwVwe7x7ZoL7ng==
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr635619oth.229.1621449053023; 
 Wed, 19 May 2021 11:30:53 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/50] target/i386 translate cleanups
Date: Wed, 19 May 2021 13:30:00 -0500
Message-Id: <20210519183050.875453-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c313e52e6459de2e9064767083a0c949c476e32b:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-05-18 16:17:22 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-x86-20210519

for you to fetch changes up to 7fb7c42394c032eeaa419c869ff3b50491f6379d:

  target/i386: Remove user-only i/o stubs (2021-05-19 12:17:23 -0500)

----------------------------------------------------------------
Eliminate user-only helper stubs for privledged insns.

----------------------------------------------------------------
Richard Henderson (50):
      target/i386: Split out gen_exception_gpf
      target/i386: Split out check_cpl0
      target/i386: Unify code paths for IRET
      target/i386: Split out check_vm86_iopl
      target/i386: Split out check_iopl
      target/i386: Assert PE is set for user-only
      target/i386: Assert CPL is 3 for user-only
      target/i386: Assert IOPL is 0 for user-only
      target/i386: Assert !VM86 for x86_64 user-only
      target/i386: Assert CODE32 for x86_64 user-only
      target/i386: Assert SS32 for x86_64 user-only
      target/i386: Assert CODE64 for x86_64 user-only
      target/i386: Assert LMA for x86_64 user-only
      target/i386: Assert !ADDSEG for x86_64 user-only
      target/i386: Introduce REX_PREFIX
      target/i386: Tidy REX_B, REX_X definition
      target/i386: Move rex_r into DisasContext
      target/i386: Move rex_w into DisasContext
      target/i386: Remove DisasContext.f_st as unused
      target/i386: Reduce DisasContext.flags to uint32_t
      target/i386: Reduce DisasContext.override to int8_t
      target/i386: Reduce DisasContext.prefix to uint8_t
      target/i386: Reduce DisasContext.vex_[lv] to uint8_t
      target/i386: Reduce DisasContext popl_esp_hack and rip_offset to uint8_t
      target/i386: Leave TF in DisasContext.flags
      target/i386: Reduce DisasContext jmp_opt, repz_opt to bool
      target/i386: Fix the comment for repz_opt
      target/i386: Reorder DisasContext members
      target/i386: Add stub generator for helper_set_dr
      target/i386: Assert !SVME for user-only
      target/i386: Assert !GUEST for user-only
      target/i386: Implement skinit in translate.c
      target/i386: Eliminate SVM helpers for user-only
      target/i386: Mark some helpers as noreturn
      target/i386: Simplify gen_debug usage
      target/i386: Tidy svm_check_intercept from tcg
      target/i386: Remove pc_start argument to gen_svm_check_intercept
      target/i386: Remove user stub for cpu_vmexit
      target/i386: Cleanup read_crN, write_crN, lmsw
      target/i386: Pass env to do_pause and do_hlt
      target/i386: Move invlpg, hlt, monitor, mwait to sysemu
      target/i386: Unify invlpg, invlpga
      target/i386: Inline user cpu_svm_check_intercept_param
      target/i386: Eliminate user stubs for read/write_crN, rd/wrmsr
      target/i386: Exit tb after wrmsr
      target/i386: Tidy gen_check_io
      target/i386: Pass in port to gen_check_io
      target/i386: Create helper_check_io
      target/i386: Move helper_check_io to sysemu
      target/i386: Remove user-only i/o stubs

 target/i386/cpu.h                    |   8 +
 target/i386/helper.h                 |  43 +-
 target/i386/tcg/helper-tcg.h         |   5 +-
 target/i386/tcg/bpt_helper.c         |   2 +-
 target/i386/tcg/excp_helper.c        |  18 +-
 target/i386/tcg/misc_helper.c        |  79 +---
 target/i386/tcg/seg_helper.c         |  43 --
 target/i386/tcg/sysemu/misc_helper.c |  52 ++-
 target/i386/tcg/sysemu/seg_helper.c  |  29 ++
 target/i386/tcg/sysemu/svm_helper.c  |  30 +-
 target/i386/tcg/translate.c          | 883 ++++++++++++++++++-----------------
 target/i386/tcg/user/misc_stubs.c    |  75 ---
 target/i386/tcg/user/svm_stubs.c     |  76 ---
 target/i386/tcg/user/meson.build     |   2 -
 14 files changed, 592 insertions(+), 753 deletions(-)
 delete mode 100644 target/i386/tcg/user/misc_stubs.c
 delete mode 100644 target/i386/tcg/user/svm_stubs.c

