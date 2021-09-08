Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E4403CE1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:52:56 +0200 (CEST)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzsd-0003Ak-4p
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkB-00061j-1B
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:11 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzk9-0002Iu-3W
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:10 -0400
Received: by mail-wr1-x434.google.com with SMTP id m9so4005988wrb.1
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rt05FbdsgFLg9KcydywhVnDl7vghMnwDqWcJV+lQZKY=;
 b=A4QgHNit6Y3r/6AUByQ0bhrnQ0JR2c2iKB08CgiYuO9VbutP7Bu2vHFIQ5HdazVAzD
 XoowbaEOLf7b1lojLq1gBKSIIUAol6im8I+21d5X/L0DgbMxqKSPY2yKj3NJrQDvFH48
 bUqN9WZN/9JsUZuOlLDKsERp0J4+ItKri2DOBGScGRuPbZcCg21knrXgQJ2Z/KsaAMD5
 WLI26ElWmzmdATcnsKxEBbQSdCOQiAZhhSFTfxDGlHJyaU+c30jZUfEaGdza2sIT/3cO
 j5BPqXl5yvNFbNSTnkef+vC8dFBHPnRpWsaoA5oPcnYEQ0FkvtNfZvs+VUkcXbxW9hfF
 leXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rt05FbdsgFLg9KcydywhVnDl7vghMnwDqWcJV+lQZKY=;
 b=sVF9PK5Fpx0JZHCZoRXo6PkxSAnvLgJpUcMzmuoC0gK5/Sxa1vohV4Ow2pvO2wlzOc
 V2mKAcocb8/p7FM6fyqaHEjGxISB9qZTee6zq1k6DYipBygF83Dn7pPmQIZWKP0yOp/V
 grHN/yDfLCQMihLSZ0x729Bf//NDcHlaVkc504DwcFQs1dbNlRyvZbNsiCnxRTVFyDcN
 eOB/3/7g5QkKJLj9zRFmbdyJP6LNbDRqaYtcpft0kepBmlvwCefvWqcvUrFmRG9qTv/i
 RqibqHhWvxhDD2XswtlyecubskpcPM+eZUeAXfrALZ8VWNPzVk85VxBf3wVnmMrDIwdB
 HOEQ==
X-Gm-Message-State: AOAM533GGj+LeVnL33kwQm9RqzCxailk7VMPXh4rBNvyj9rtVJLcD8fG
 NFjE8HdqaFO57ZSSS0RLTVKh2sLKUJt/yQ==
X-Google-Smtp-Source: ABdhPJzvvO54SZnjFs467bNvyITuVJFn1w9qrbn3ADulyDZwJKVqvJPTKg2r3sm4mhGkBFiqJUOKjw==
X-Received: by 2002:a5d:4285:: with SMTP id k5mr4956985wrq.131.1631115847459; 
 Wed, 08 Sep 2021 08:44:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] linux-user: split internals out of qemu.h
Date: Wed,  8 Sep 2021 16:43:56 +0100
Message-Id: <20210908154405.15417-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

linux-user/qemu.h is an awkward header, for two reasons:
 (1) its name suggests it's a rather common generic header,
     but it's actually specific to the usermode emulators
 (2) it is a mix of:
   * lots of things internal to the implementation of linux-user
   * functions that a few files outside linux-user want
     (mostly the user-access functions like lock_user,
     get/put_user_*, etc, and also the TaskStruct definition)

This patchset tries to clean it up a bit by at least splitting
most of the "just internal to linux-user" parts out of qemu.h
and putting them in a handful of different .h files that are
then included by the linux-user files that need them.

I think the ideal would probably be to eventually junk
qemu.h entirely and have a few separate headers specifically
for the bits that non-linux-user code needs (eg a 'user-access.h'
for the get/put_user stuff), perhaps located somewhere that
means we don't need to put linux-user/ on the include path.
But that's awkward as it needs interaction with bsd-user too.
So this much cleanup seemed like a reasonable start...

Changes v1->v2:
 * rebased
 * fixed a few minor niggles spotted in v1 during review
 * use existing signal-common.h rather than creating a new
   header for signal-related functions

Patches still needing review: 3, 4, 5, 7

thanks
-- PMM

Peter Maydell (9):
  linux-user: Fix coding style nits in qemu.h
  linux-user: Split strace prototypes into strace.h
  linux-user: Split signal-related prototypes into signal-common.h
  linux-user: Split loader-related prototypes into loader.h
  linux-user: Split mmap prototypes into user-mmap.h
  linux-user: Split safe-syscall macro into its own header
  linux-user: Split linux-user internals out of qemu.h
  linux-user: Don't include gdbstub.h in qemu.h
  linux-user: Drop unneeded includes from qemu.h

 linux-user/loader.h              |  59 +++++
 linux-user/qemu.h                | 429 ++-----------------------------
 linux-user/safe-syscall.h        | 154 +++++++++++
 linux-user/signal-common.h       |  36 +++
 linux-user/strace.h              |  38 +++
 linux-user/user-internals.h      | 186 ++++++++++++++
 linux-user/user-mmap.h           |  34 +++
 gdbstub.c                        |   2 +-
 linux-user/aarch64/cpu_loop.c    |   2 +
 linux-user/aarch64/signal.c      |   1 +
 linux-user/alpha/cpu_loop.c      |   2 +
 linux-user/alpha/signal.c        |   1 +
 linux-user/arm/cpu_loop.c        |   2 +
 linux-user/arm/signal.c          |   1 +
 linux-user/cris/cpu_loop.c       |   2 +
 linux-user/cris/signal.c         |   1 +
 linux-user/elfload.c             |   3 +
 linux-user/exit.c                |   2 +
 linux-user/fd-trans.c            |   2 +
 linux-user/flatload.c            |   3 +
 linux-user/hexagon/cpu_loop.c    |   2 +
 linux-user/hexagon/signal.c      |   1 +
 linux-user/hppa/cpu_loop.c       |   2 +
 linux-user/hppa/signal.c         |   1 +
 linux-user/i386/cpu_loop.c       |   3 +
 linux-user/i386/signal.c         |   1 +
 linux-user/linuxload.c           |   2 +
 linux-user/m68k/cpu_loop.c       |   2 +
 linux-user/m68k/signal.c         |   1 +
 linux-user/main.c                |   5 +
 linux-user/microblaze/cpu_loop.c |   2 +
 linux-user/microblaze/signal.c   |   1 +
 linux-user/mips/cpu_loop.c       |   2 +
 linux-user/mips/signal.c         |   1 +
 linux-user/mmap.c                |   2 +
 linux-user/nios2/cpu_loop.c      |   2 +
 linux-user/nios2/signal.c        |   1 +
 linux-user/openrisc/cpu_loop.c   |   2 +
 linux-user/openrisc/signal.c     |   1 +
 linux-user/ppc/cpu_loop.c        |   2 +
 linux-user/ppc/signal.c          |   1 +
 linux-user/riscv/cpu_loop.c      |   2 +
 linux-user/riscv/signal.c        |   1 +
 linux-user/s390x/cpu_loop.c      |   2 +
 linux-user/s390x/signal.c        |   1 +
 linux-user/semihost.c            |   1 +
 linux-user/sh4/cpu_loop.c        |   2 +
 linux-user/sh4/signal.c          |   1 +
 linux-user/signal.c              |   5 +
 linux-user/sparc/cpu_loop.c      |   2 +
 linux-user/sparc/signal.c        |   1 +
 linux-user/strace.c              |   3 +
 linux-user/syscall.c             |   6 +
 linux-user/uaccess.c             |   1 +
 linux-user/uname.c               |   1 +
 linux-user/vm86.c                |   1 +
 linux-user/xtensa/cpu_loop.c     |   2 +
 linux-user/xtensa/signal.c       |   1 +
 semihosting/arm-compat-semi.c    |   2 +-
 target/m68k/m68k-semi.c          |   2 +-
 target/nios2/nios2-semi.c        |   2 +-
 thunk.c                          |   1 +
 62 files changed, 620 insertions(+), 417 deletions(-)
 create mode 100644 linux-user/loader.h
 create mode 100644 linux-user/safe-syscall.h
 create mode 100644 linux-user/strace.h
 create mode 100644 linux-user/user-internals.h
 create mode 100644 linux-user/user-mmap.h

-- 
2.20.1


