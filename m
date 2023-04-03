Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD3E6D4A88
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:48:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjLSQ-0003r3-5I; Mon, 03 Apr 2023 10:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSK-0003ps-VR
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjLSE-00019r-3l
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:46:47 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m2so29626254wrh.6
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680533199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nhGWbn0r3xPEuSngTcUDlCovXDB9NWq/I8QhKC5qD44=;
 b=Q0aisaU7KnZQOxlW7RLtz23YgeXMicDMZ63zX10UxaTEKopob7shgw4+dfXgWsFocO
 +TCXj6g/KC/LcSzcBZ+HbFVm3rE6r3XQc4KCpKmQ6oEbgRbVojTzQN8DTHbUzobW2W5H
 PMmwuiCiqomg9N6kyqvciGt4HOGmEaIbPjpU3SXzUu4OLx4Cpa6SKyQuen8alrSD65BP
 6xNSM7Hom3uuwaoSzJr/MceP7MM8w4stGJ9fMEJjSxLdxNDUGc0f5yg/R37oqXguHXft
 eYymSYZcCUEgWFjDmg0aRn3CGsrx2DptMkQhOC4p8ogoyCQ4nUsT42HHQYF+d7xIWGJF
 zLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhGWbn0r3xPEuSngTcUDlCovXDB9NWq/I8QhKC5qD44=;
 b=YQPW1ztlLfbvy66ap87oxctf9UrQ7lhEaU5IWgt7JYp+lCTSMXFtH0Aam9GYjfH9Cu
 XJrIX5tuKtX2jpMLLxrSdp5zGBpGgqzJ+cf7Xl23xB1jS3EZBvJSKJvYZXSUdJF9XnR6
 A9+yxfdtsZDzyV3dnrPREnwgnjtKP+ClMwS6Y80L+fNKivQc0GILDoHeoEwRHip8RZbm
 92drYmPahHPiiIpBT4GDVdSKLFmLQA/ATNlLWQQBxriTe6zbl2LjV9d8fSOPeUhUyXiM
 fic5n9NOf6vMkEqlhjw/UNmSv5u8mATfudUUVwoOU8WdpIPCZJSMVDSZTkYnETabP67y
 /ORg==
X-Gm-Message-State: AAQBX9e5xnWF8JNEBZ9yKRiR91BHNnOvUr8+TSPEv5RqOXVZiHGAYpRG
 lyortdV6lTM5gfQwtoxeSjNwLTWXZ1ojUr+6m+o=
X-Google-Smtp-Source: AKy350bx2ubwfyDQF80mFBD+WGU9Hyhe/oaWj1jEyNiuwIKaYesVRpvTKEn9D12jrUHSeLsCVszI2Q==
X-Received: by 2002:a5d:428a:0:b0:2d1:6104:76ab with SMTP id
 k10-20020a5d428a000000b002d1610476abmr26091824wrq.2.1680533199402; 
 Mon, 03 Apr 2023 07:46:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056000018400b002c56013c07fsm9786747wrx.109.2023.04.03.07.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 07:46:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 00/10] Deprecate/rename singlestep command line option,
 monitor interfaces
Date: Mon,  3 Apr 2023 15:46:27 +0100
Message-Id: <20230403144637.2949366-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
 * documents that the old -singlestep option is deprecated
 * adds a new HMP command 'one-insn-per-tb', and deprecates
   the old 'singlestep' command. (Strictly we don't need to
   deprecate HMP commands, but I'd already written the code
   for v1 of this series and it's a minor user convenience.)
 * makes the HMP 'info status' output report "one insn per TB"
   instead of "single step mode"
 * adds a new 'one-insn-per-tb' member to the QMP StatusInfo
   type, and deprecates the old 'singlestep' field

Notes:
 * I hope I have got the QMP changes and deprecation right,
   but that's probably the bit in most need of review from
   an expert
 * There's an argument for just dropping the reporting of
   one-insn-per-tb in QMP StatusInfo at all, except that
   (a) it's hard to know if anybody's really using it
   (b) then the info isn't reported to HMP 'info status',
       which wouldn't line up with HMP having a mechanism
       to get/set the value
 * I have written patch 3 on the assumption that curr_cflags()
   is not such a hot codepath that we can't afford to have
   a QOM cast macro in it; the alternative would be to
   keep it using a global variable but make the global be
   restricted to accel/tcg/internals.h. RTH: opinions welcome...
 * Still haven't tested on bsd-user, but the patch is identical
   to the linux-user change

thanks
-- PMM

Peter Maydell (10):
  make one-insn-per-tb an accel option
  softmmu: Don't use 'singlestep' global in QMP and HMP commands
  tcg: Use one-insn-per-tb accelerator property in curr_cflags()
  linux-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
  bsd-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
  Document that -singlestep command line option is deprecated
  hmp: Add 'one-insn-per-tb' command equivalent to 'singlestep'
  hmp: Report 'one-insn-per-tb', not 'single step mode', in 'info
    status' output
  qapi/run-state.json: Fix missing newline at end of file
  hmp: Deprecate 'singlestep' member of StatusInfo

 docs/about/deprecated.rst   | 35 +++++++++++++++++++++++++++++++++++
 docs/interop/qmp-intro.txt  |  1 +
 docs/user/main.rst          | 14 ++++++++++++--
 qapi/run-state.json         | 19 +++++++++++++++----
 accel/tcg/internal.h        | 16 ++++++++++++++++
 include/exec/cpu-common.h   |  3 ---
 include/monitor/hmp.h       |  2 +-
 accel/tcg/cpu-exec.c        |  5 +++--
 accel/tcg/tcg-all.c         | 32 ++++++++++++++++++--------------
 bsd-user/main.c             | 14 +++++++++-----
 linux-user/main.c           | 18 ++++++++++++------
 softmmu/globals.c           |  1 -
 softmmu/runstate-hmp-cmds.c | 22 ++++++++++++++++++----
 softmmu/runstate.c          | 12 +++++++++++-
 softmmu/vl.c                | 17 +++++++++++++++--
 tests/qtest/test-hmp.c      |  1 +
 hmp-commands.hx             | 25 +++++++++++++++++++++----
 qemu-options.hx             | 12 ++++++++++--
 tcg/tci/README              |  2 +-
 19 files changed, 199 insertions(+), 52 deletions(-)

-- 
2.34.1


