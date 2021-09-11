Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F223F4079A9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:56:39 +0200 (CEST)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6Iw-0007Kz-5n
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6H2-0005ie-Gx
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6H0-000242-Pr
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id x6so7453652wrv.13
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MYr1w2WaIvEb/ociGHtAaqDsLadoqraYeFEUjWPZ1FE=;
 b=nqon0AIxd19Kd8nZVjSAuAm8Xg+qTaXj7TMEKABBYzdlW4S9G168icr3O6np0ebk9n
 mgIb/vu998r3ybvNJFP9HhH3Nlr/6MtxfKOagyXJwX3m4IyoV8PTI12+6p786acsVR9w
 Bc/6+DgjT1NXavWqzy4E/nHGxzxcGSoAjxdJevqR59bRflHhpjm34Ob7nQq5X0JxHH6J
 qX5lk5GpWCeQR84ddrdBXi+zW47dSftENyxZtJDI64Oz22gQBy1QMZmAzJ8XMoL7mhtk
 kWP4hQ5opaNenbP78YJYIJt7ira3UWbFTKHFpSI393U0+PZgiXYFQgOs+l4SQVyI6u16
 mWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MYr1w2WaIvEb/ociGHtAaqDsLadoqraYeFEUjWPZ1FE=;
 b=G7OQsI/4ZvLMS6hi15Ig1ZGFsNpEHswCvopCZeHgIaEPRKFItazQnm0n51lXmbpCMX
 86u1gvgcuWCLGNb95TTG/8qMe+G2FyxvSM64AR8ODtsR8w0F/silrFPIhGs1zmO0xCds
 78UHUO2WRUKgxVMNRjxP30M3egyIZ846MBuwvzylnWTIYGmE+GwZ1llFxgLkRXNhouP1
 xMsdGd6qfk4PMcWyYKHG/hLKnAihJgVcrBBWA5SdzJjFEH0GiaKoRDcPSo1Slc5cP+hN
 0FzGmoVNWhYS3xQNmeAz4tDX2QK4+MeDcwtm3yMnyrJxYgFlBRFD59irQxGJxp/QVCIP
 5gEQ==
X-Gm-Message-State: AOAM532uvVPwD/NQupZ6NQDl/0gEPkzRsG2rEzHkOzA1jS1lF82HBXKP
 RXhY7sCr70TjjeAOsmes0dk8ObkZyqA=
X-Google-Smtp-Source: ABdhPJyMEX2z79stneutiR447e5w/T5QrW29I16CQKAvsena/YkWH8nFZ2tqOKMK0+i9gwbYfragKQ==
X-Received: by 2002:adf:816f:: with SMTP id 102mr3825437wrm.368.1631379276838; 
 Sat, 11 Sep 2021 09:54:36 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id h16sm2149194wre.52.2021.09.11.09.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:54:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/24] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt()
 to sysemu
Date: Sat, 11 Sep 2021 18:54:10 +0200
Message-Id: <20210911165434.531552-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Series fully reviewed]=0D
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
Since v2:=0D
- Rebased due to bsd-user conflict (merge 99c44988d5b)=0D
- Added R-b=0D
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
 bsd-user/i386/target_arch_cpu.c     |  5 --=0D
 bsd-user/x86_64/target_arch_cpu.c   |  5 --=0D
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
 55 files changed, 196 insertions(+), 256 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

