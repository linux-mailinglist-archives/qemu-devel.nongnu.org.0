Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C34B400D95
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:58:03 +0200 (CEST)
Received: from localhost ([::1]:50196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfXt-0007Oy-H9
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfVk-0005DK-Pv
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:55:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfVj-0007Gr-5t
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:55:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v10so4064523wrd.4
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jgXDvMF17EbaWd7RbQv0QEEW01gtxN+LJrbLStBCIv0=;
 b=ZIBxn6u7kptxNPDrVlfrhVUiLSM9RXuLIesjyezPz6B95bk5X4aiiddZkBIdTgNqrt
 ykOn7+gtPL39VVO8zs+TN2b+u7cS/6SBzRT4Kpvw4MuZQh+k1io+AwZhZOVEf05NrRME
 pzbzfUqrGRdIsPwnltgrmslojlSyxuJTbahfs/7CLPaY+gPwaFmER3hFaHKa9qxlIcca
 yLncOsDOgVCm21ctf2OB+AcC8JMod22bEaBFtwNPO34e+UMYjxGS2yzTFCVm6Bb2SjIY
 Rm2W/MyoYIeVdqbxJqTTgwb5RwBLiMpbFP8d5Kk5mm+urERI3iFi3NGrtbumrDkXZuJI
 PYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jgXDvMF17EbaWd7RbQv0QEEW01gtxN+LJrbLStBCIv0=;
 b=e+tqI6Ll/W/zXi6IArksaSEW1XxTfpSbaEd8Oe4eJGUXSMSRuMhYOfbXJGe9fLvcpW
 fneIBoWAzZauds8F89PRy8TVn9h0qdn3HE2Xv7Oi16z6adx4Zt3dlN/i23K9iiPJ2vqK
 ARz3YLypLQRPpRrmH5hGhMyu8ktv2xrAROtgf7SZ4JYdn4cjspUYgiqqAMXkhLnot9Qs
 LPiHQtPwsiYyIEJ8WX1trMrmPLapgA7AHMBgsx/e2Ia6FqD1HiRZ3aloAaxC2EegQYAX
 x1At/n/5lHSOCkRt/4c1vqtA5o5q+6x8hfmeAuzaxNfQ3lDnCw+HmHJkhHN6dLJZ0qK3
 8J+A==
X-Gm-Message-State: AOAM533dV7F+BZ+O9vTh1ZDtxP/aj9OhE/FwZIunRrh5UE5c1DeoP4Kt
 6NeHFdEesFszw6jjXC2q0BxluTNEMO8=
X-Google-Smtp-Source: ABdhPJwAGo2nIKPiwim89h8RqSB/KNqjEjo1+iZnfcXj+2zBD53Jclt+qRDQKYMkgkqJToL6otpqKA==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr5930569wrs.149.1630799745112; 
 Sat, 04 Sep 2021 16:55:45 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l10sm3587420wrg.50.2021.09.04.16.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:55:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt()
 to sysemu
Date: Sun,  5 Sep 2021 01:55:18 +0200
Message-Id: <20210904235542.1092641-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review:=0D
- 01 target/avr: Remove pointless use of CONFIG_USER_ONLY definition=0D
- 11 target/i386: Move x86_cpu_exec_interrupt() under sysemu/ folder=0D
=0D
Hi,=0D
=0D
The TCGCPUOps::cpu_exec_interrupt() handler is specific to system=0D
emulation. This series remove it from user-mode.=0D
To do so we have to deal with a x86-hack first, then we restrict=0D
each target handler (one target at a time) and finally we restrict=0D
the prototype, simplifying cpu_handle_interrupt().=0D
=0D
As a bonus we can remove the cpu_get_pic_interrupt() stubs from=0D
bsd/linux-user.=0D
=0D
Since v1:=0D
- Addressed Richard comments (drop AVR patch, remove assert)=0D
- Added R-b=0D
=0D
Philippe Mathieu-Daud=C3=A9 (24):=0D
  target/avr: Remove pointless use of CONFIG_USER_ONLY definition=0D
  target/i386: Restrict sysemu-only fpu_helper helpers=0D
  target/i386: Simplify TARGET_X86_64 #ifdef'ry=0D
  target/xtensa: Restrict do_transaction_failed() to sysemu=0D
  accel/tcg: Rename user-mode do_interrupt hack as fake_user_interrupt=0D
  target/alpha: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/arm: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/cris: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/hppa: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/i386: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/i386: Move x86_cpu_exec_interrupt() under sysemu/ folder=0D
  target/m68k: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/microblaze: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/mips: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/nios2: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/openrisc: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/ppc: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/riscv: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/sh4: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/sparc: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/rx: Restrict cpu_exec_interrupt() handler to sysemu=0D
  target/xtensa: Restrict cpu_exec_interrupt() handler to sysemu=0D
  accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to sysemu=0D
  user: Remove cpu_get_pic_interrupt() stubs=0D
=0D
 include/hw/core/tcg-cpu-ops.h       | 26 ++++++----=0D
 target/alpha/cpu.h                  |  2 +-=0D
 target/arm/cpu.h                    |  3 +-=0D
 target/cris/cpu.h                   |  2 +-=0D
 target/hppa/cpu.h                   |  4 +-=0D
 target/i386/cpu.h                   |  3 ++=0D
 target/i386/tcg/helper-tcg.h        |  2 +=0D
 target/m68k/cpu.h                   |  2 +=0D
 target/microblaze/cpu.h             |  2 +=0D
 target/mips/tcg/tcg-internal.h      |  5 +-=0D
 target/openrisc/cpu.h               |  5 +-=0D
 target/ppc/cpu.h                    |  4 +-=0D
 target/riscv/cpu.h                  |  2 +-=0D
 target/rx/cpu.h                     |  2 +=0D
 target/sh4/cpu.h                    |  4 +-=0D
 target/xtensa/cpu.h                 |  2 +=0D
 accel/tcg/cpu-exec.c                | 14 ++++--=0D
 bsd-user/main.c                     |  7 ---=0D
 linux-user/main.c                   |  7 ---=0D
 target/alpha/cpu.c                  |  2 +-=0D
 target/alpha/helper.c               |  5 +-=0D
 target/arm/cpu.c                    |  7 ++-=0D
 target/arm/cpu_tcg.c                |  6 +--=0D
 target/avr/cpu.c                    |  3 --=0D
 target/cris/cpu.c                   |  4 +-=0D
 target/cris/helper.c                | 17 +------=0D
 target/hppa/cpu.c                   |  2 +-=0D
 target/hppa/int_helper.c            |  7 +--=0D
 target/i386/tcg/seg_helper.c        | 74 +----------------------------=0D
 target/i386/tcg/sysemu/seg_helper.c | 65 +++++++++++++++++++++++++=0D
 target/i386/tcg/tcg-cpu.c           |  8 ++--=0D
 target/m68k/cpu.c                   |  2 +-=0D
 target/m68k/op_helper.c             | 16 ++-----=0D
 target/microblaze/cpu.c             |  2 +-=0D
 target/microblaze/helper.c          | 13 +----=0D
 target/mips/cpu.c                   |  2 +-=0D
 target/mips/tcg/exception.c         | 18 -------=0D
 target/mips/tcg/sysemu/tlb_helper.c | 18 +++++++=0D
 target/mips/tcg/user/tlb_helper.c   |  5 --=0D
 target/nios2/cpu.c                  |  5 +-=0D
 target/openrisc/cpu.c               |  2 +-=0D
 target/openrisc/interrupt.c         |  2 -=0D
 target/ppc/cpu_init.c               |  2 +-=0D
 target/ppc/excp_helper.c            | 21 ++------=0D
 target/riscv/cpu.c                  |  2 +-=0D
 target/riscv/cpu_helper.c           |  5 --=0D
 target/rx/cpu.c                     |  2 +-=0D
 target/rx/helper.c                  |  4 ++=0D
 target/sh4/cpu.c                    |  2 +-=0D
 target/sh4/helper.c                 |  9 +---=0D
 target/sparc/cpu.c                  |  4 +-=0D
 target/xtensa/cpu.c                 |  2 +-=0D
 target/xtensa/exc_helper.c          |  7 +--=0D
 target/openrisc/meson.build         |  6 ++-=0D
 54 files changed, 196 insertions(+), 253 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

