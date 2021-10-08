Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A596E427424
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:23:27 +0200 (CEST)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzD4-00065x-E2
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5S-0000Fk-NB
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:34 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:45948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5F-0006L3-H7
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:34 -0400
Received: by mail-io1-xd2e.google.com with SMTP id 134so12372598iou.12
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7pzqAGruy5BHDYoq/v5kMDW0IMuHZ78lHgKxq0rIuGY=;
 b=aKfR18JmaSw3xfm/R44A8Lj7RJN/PPXaEG6ifKD9PzORoGiNvl7xzUV13QR6KPCO5J
 eWp6NFZ5JoKp3Ozs8E8mM5M6uDFC9GyNnimHfuoYJwIeG8igpiRyDTS1HnJkZKi1BlXd
 0KxRRTvcaJGJZVMhKyqfiWw71/p64iUP6HBxFR513E+4mgrRpDe6Ng2zdFA23a8DvIse
 BQLSJ1tTSn3dTb6rf2s1VID2WMgjBQuESht0nb+gcxYPUehhHEgJmHfRnbjZGmFHQg0I
 RCe3x1Vh+bc1vIHpF+0+/XAUPRzt/QysfqSmh71LskccP+38qZNYIT0GrS30JhcQ4DE0
 B8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7pzqAGruy5BHDYoq/v5kMDW0IMuHZ78lHgKxq0rIuGY=;
 b=Mhn0/aZHFoQNWWg6AKXmdBztqVjtUNKAUtWUmoj4orTnRHGdPxK+MreEsVLzp8C6Qy
 DRSGtUuckBYwNUGNrWn5h/29D8zimWUEXhf0YNCBFrtkPM+StTvuP6TeGx9HwYwfv7Z/
 lg/4ueXql+va4EPczw+57saAq1fUmk0o8D4ykQiiOUAaz/3YWOZg3WcIcNaAeSuvwtRG
 4hLHhtNv7RoG8Mgpb72oy67otPGRUJh9n6ZAPQ9v//4/sm6DwaxMSn8gSxOyXAIgFfsP
 riN8D6xYqQ1kv0Is43+jNABOksUDQLBZpqOgNTuiJfaisDLEO4JlqSnFDK6Ir4qZUzzh
 UsGA==
X-Gm-Message-State: AOAM5309XfL9QD9tPwrUAGfc6hxp/R3qMzk4+LCD0RVWQnpuk72eMIVl
 WiiVN8il+qVqiojviTXbYiLrwdaZsbUgpg==
X-Google-Smtp-Source: ABdhPJynbCyhbXwDhjv7mTrAp1iZ7c3MZ0UoXuaTxmJI5x7lktA/vtw4vG497owCIVw52+JOX4h/tw==
X-Received: by 2002:a05:6602:3419:: with SMTP id
 n25mr9414744ioz.181.1633734919901; 
 Fri, 08 Oct 2021 16:15:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] bsd-user: misc cleanup for aarch64 import
Date: Fri,  8 Oct 2021 17:14:51 -0600
Message-Id: <20211008231506.17471-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for aarch64 support (the next architecture to be upstreamed). As the
aarch64 emulation is more complete, it relies on a number of different items.
In some cases, I've pulled in the full support from bsd-user fork. In other
cases I've created a simple stub (as is the case for signals, which have
independent changes pending, so I wanted to be as minimal as possible.  Since
all pre-12.2 support was purged from the bsd-user fork, go ahead and remove it
here. FreeBSD 11.x goes ouft of support at the end of the month. Remove what
little multi-version support that's in upstream.

The aarch64, armv7 and riscv64 patch sets will be published soon after some of
the dust settles.

v2: Added Phillippe's take, as endorced by Paolo, on how to filter *-user.
    Added qemu_log_mask() to stubbed out signal queueing routines

(hopefully I've done the pull into my tree correctly)

Stacey Son (1):
  bsd-user/errno_defs.h: Add internal error numbers

Warner Losh (14):
  meson: *-user: only descend into *-user when configured
  bsd-user/target_os-user.h: Remove support for FreeBSD older than 12.0
  bsd-user/strace.list: Remove support for FreeBSD versions older than
    12.0
  bsd-user: TARGET_RESET define is unused, remove it
  bsd-user: export get_errno and is_error from syscall.c
  bsd-user: move TARGET_MC_GET_CLEAR_RET to target_os_signal.h
  bsd-user/target_os_elf.h: Remove fallback ELF_HWCAP and reorder
  bsd-user/target_os_elf: If ELF_HWCAP2 is defined, publish it
  bsd-user: Remove used from TaskState
  bsd-user: Add stop_all_tasks
  bsd-user/sysarch: Move to using do_freebsd_arch_sysarch interface
  bsd-user/sysarch: Provide a per-arch framework for sysarch syscall
  bsd-user: Rename sigqueue to qemu_sigqueue
  bsd-user/signal: Create a dummy signal queueing function

 bsd-user/errno_defs.h                |  14 +++-
 bsd-user/freebsd/meson.build         |   3 +
 bsd-user/freebsd/os-sys.c            |  27 ++++++++
 bsd-user/freebsd/strace.list         |  11 ---
 bsd-user/freebsd/target_os_elf.h     |  12 ++--
 bsd-user/freebsd/target_os_signal.h  |   3 +
 bsd-user/freebsd/target_os_user.h    | 100 +--------------------------
 bsd-user/i386/target_arch_cpu.h      |   2 -
 bsd-user/i386/target_arch_signal.h   |   2 -
 bsd-user/main.c                      |  10 ++-
 bsd-user/meson.build                 |   7 ++
 bsd-user/qemu.h                      |  25 ++++---
 bsd-user/signal.c                    |  11 ++-
 bsd-user/syscall.c                   |  60 ++--------------
 bsd-user/x86_64/target_arch_cpu.h    |   2 -
 bsd-user/x86_64/target_arch_signal.h |   2 -
 linux-user/meson.build               |   4 ++
 meson.build                          |   3 +-
 18 files changed, 103 insertions(+), 195 deletions(-)
 create mode 100644 bsd-user/freebsd/meson.build
 create mode 100644 bsd-user/freebsd/os-sys.c

-- 
2.32.0


