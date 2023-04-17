Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95D6E4E77
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:41:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poRuK-0002IH-IM; Mon, 17 Apr 2023 12:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuI-0002Ho-MM
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poRuH-0001LW-0M
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:40:46 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso2044899wmb.5
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681749643; x=1684341643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qt4yDIRMdcNk8ETy1SHd7WE53TtZeswN17iOp3UOs9A=;
 b=ZlJq2G8bpFmN2l2N28XaF6J9q0qDfbD2aAM3QG7VbTT0H8G2oTMlKnIcKMFfro2Uad
 L7UI+Jz59gUx6XNLGrYozogFIVLeFWGrErDy4F2s6hpstY2lQ2Lk5lRK/Rzy9a0pTK2Q
 VhS/n4jqmleX4Jm0VgB0utZaW7xPiGkeWnl0PPmaNv9UYg6yZjyyZqoYa1YW1Bij/hvQ
 qrwTugumvsYeWVe8nHeZzEPm25WNTd9kU+qar9xPKrocHg1rtuGHV/x6JyHEWg9rJm3A
 hKIMnvUyf5BwrGbZZ7h/u8LGf8RiJKExKgbte0sXr8bkqAaLjrkrasfVdVptZpJslY3A
 6QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681749643; x=1684341643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qt4yDIRMdcNk8ETy1SHd7WE53TtZeswN17iOp3UOs9A=;
 b=MUImDqseLL3vlCkvWTLQINHzaReDzVvPXO9Zv7d1TJlzRh0NxLZjQ1TQCNs1C/9f4V
 gn/Cpmu+ZFHnuqva84ZY0dl8ZYL7nItw2DnvsuUn0DH47Cuz/gWdGpLISTUtO/BEzBsg
 988lmftbj3Yr2hrpraZNiZl+6/puUtbG+CrhioeWmn9A9KPX+3vKTipja8pAEB/4eFtz
 07JHj62eSp8AkwaBSsHOK6G2qp4VuEcEcqQdWaslmIzx9+kw63rUhrLrAd3DVCOZJ26X
 sXblvrGFGgK27ai68/WMQX6IEan42CwpwJvS8z4HnMGGZYKEGhaYKmMcq6MCPYg+EcQY
 JpKA==
X-Gm-Message-State: AAQBX9eUNlehkfpiw3WnydK2mnFd/5WoaY5vmRycZU2/T+yzTNF+5M1U
 sV88q8B03DLpG1QRoOAI5MRT9UTmRCbq7MqGjQY=
X-Google-Smtp-Source: AKy350Z2EkodTBIsR2aP7oWDUAzC3lkXsgCPR1Qi2UDv3flprg2NgklqTik1LyR1H4+ibh4bKxGy7A==
X-Received: by 2002:a7b:ce14:0:b0:3f1:65de:764 with SMTP id
 m20-20020a7bce14000000b003f165de0764mr6560109wmc.32.1681749642915; 
 Mon, 17 Apr 2023 09:40:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a5d61d1000000b002faaa9a1721sm2595103wrv.58.2023.04.17.09.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 09:40:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v3 00/10] Deprecate/rename singlestep command line option,
 monitor interfaces
Date: Mon, 17 Apr 2023 17:40:31 +0100
Message-Id: <20230417164041.684562-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The command line option '-singlestep' and its HMP equivalent
the 'singlestep' command are very confusingly named, because
they have nothing to do with single-stepping the guest (either
via the gdb stub or by emulation of guest CPU architectural
debug facilities). What they actually do is put TCG into a
mode where it puts only one guest instruction into each
translation block. This is useful for some circumstances
such as when you want the -d debug logging to be easier to
interpret, or if you have a finicky guest binary that wants
to see interrupts delivered at something other than the end
of a basic block.

The confusing name is made worse by the fact that our
documentation for these is so minimal as to be useless
for telling users what they really do.

This series:
 * changes the command line interface: for user-mode
   emulators, the new option is '-one-insn-per-tb',
   and for system mode emulators it is a TCG accel
   property '-accel tcg,one-insn-per-tb=on'
 * updates all the places which currently directly touch
   the 'singlestep' global variable to instead get the
   current accelerator and query/set the QOM property
   (except the one internal to TCG itself in curr_cflags())
 * documents that the old -singlestep option is deprecated
 * adds a new HMP command 'one-insn-per-tb', and deprecates
   the old 'singlestep' command. (Strictly we don't need to
   deprecate HMP commands, but I'd already written the code
   for v1 of this series and it's a minor user convenience.)
 * moves the 'is one-insn-per-tb on?' info from 'info status'
   to 'info jit'
 * deprecates the 'singlestep' member of the QMP StatusInfo
   type, with no replacement. (We have a sketch of a design
   of how we might provide this in QMP if we need to, but
   I'm pretty sure nobody using QMP is actually using the
   info in the 'singlestep' field, especially since it's
   always been wrongly documented and there's no write
   interface, only a read one.)

Changes v2->v3:
 * curr_cflags() is a hot path, so use a global variable
   so it doesn't have to fetch the current accelerator object.
   (NB: I haven't done the tcg_global_cflags thing suggested
   in review of v2; justification in the below-the-fold part
   of the patch 3 commit message notes.)
 * put the new line in test-hmp.c in its proper alphabetical
   order place in patch 8
 * in patch 10 don't provide a replacement field in the
   QMP StatusInfo type, just deprecate the old one
 * I finally tested that bsd-user compiles, and fixed the
   missing-close-bracket error in that patch :-)

Patches still needing review: 3, 7, 10

thanks
-- PMM

Peter Maydell (10):
  make one-insn-per-tb an accel option
  softmmu: Don't use 'singlestep' global in QMP and HMP commands
  accel/tcg: Use one_insn_per_tb global instead of old singlestep global
  linux-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
  bsd-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
  Document that -singlestep command line option is deprecated
  accel/tcg: Report one-insn-per-tb in 'info jit', not 'info status'
  hmp: Add 'one-insn-per-tb' command equivalent to 'singlestep'
  qapi/run-state.json: Fix missing newline at end of file
  hmp: Deprecate 'singlestep' member of StatusInfo

 docs/about/deprecated.rst   | 39 +++++++++++++++++++++++++++++++++++++
 docs/user/main.rst          | 14 +++++++++++--
 qapi/run-state.json         | 16 +++++++++++----
 accel/tcg/internal.h        |  2 ++
 include/exec/cpu-common.h   |  2 --
 include/monitor/hmp.h       |  2 +-
 accel/tcg/cpu-exec.c        |  2 +-
 accel/tcg/monitor.c         | 14 +++++++++++++
 accel/tcg/tcg-all.c         | 23 ++++++++++++++++++++++
 bsd-user/main.c             | 14 ++++++++-----
 linux-user/main.c           | 18 +++++++++++------
 softmmu/globals.c           |  1 -
 softmmu/runstate-hmp-cmds.c | 25 ++++++++++++++++++------
 softmmu/runstate.c          | 10 +++++++++-
 softmmu/vl.c                | 17 ++++++++++++++--
 tests/qtest/test-hmp.c      |  1 +
 hmp-commands.hx             | 25 ++++++++++++++++++++----
 qemu-options.hx             | 12 ++++++++++--
 tcg/tci/README              |  2 +-
 19 files changed, 201 insertions(+), 38 deletions(-)

-- 
2.34.1


