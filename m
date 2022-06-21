Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CD5532F7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:09:55 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ddi-0000GR-E1
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTo-0007Uy-Np
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:40 -0400
Received: from smtpout140.security-mail.net ([85.31.212.143]:33048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3dTm-0005Ff-Oz
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:59:40 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id F3B0D96714B
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 14:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655816377;
 bh=d387QqXKxVg+9dM4Jm+tIDTgp1kAnco5g3Wcjo5sn3E=;
 h=From:To:Cc:Subject:Date;
 b=g8N1J4GwH2nb9al60rOKwp8me2XGHttNmKUKvI3xaPbKfsaJVZTl0Nym7gFpDkKWM
 QA/gMBnUvbhW2yyIwxqw1HCbxuaKsBHkta1R3kqhmVQrP1Z5a4QYG/BLHYkKsAruyU
 kCw8CQXVMUnlus4dV6tE8v1+Acgw59vlQmnVHDYg=
Received: from fx403 (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id EDACC9670A2;
 Tue, 21 Jun 2022 14:59:33 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <95ee.62b1c0b4.314d7.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx403.security-mail.net (Postfix) with ESMTPS id 3516A967023;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 0A17727E04EC;
 Tue, 21 Jun 2022 14:59:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id DF63A27E04D9;
 Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DF63A27E04D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655816371;
 bh=RnCTw34ALfL2/3BvANUZGzdHiVIwocSPhNUncAgC3c8=;
 h=From:To:Date:Message-Id;
 b=lVwqf2fz04nVohyj0ImapOw00EDCSzBJQxQtDrkadHOoO5trLUWIblu5frRhwQcWW
 wGjNCiQ4EoD3a9SxQj8m1qG0iVSBkLurCz/rKPLH4PYjIEI9VQzweLCOykRh4pWpKY
 ogOMj5qjKzpXL75dMyV0gonV3/CiqC5nDYOGRpHM=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MPMdnYsduhqh; Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id C141827E04D6;
 Tue, 21 Jun 2022 14:59:31 +0200 (CEST)
From: Luc Michel <lmichel@kalray.eu>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
Date: Tue, 21 Jun 2022 14:59:09 +0200
Message-Id: <20220621125916.25257-1-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.143; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
  - fix linux-user compilation. Declare semihosting_exit_request "static
    inline G_NORETURN" on CONFIG_USER_ONLY side. Use
    g_assert_not_reached() to enforce the G_NORETURN since this function
    is unused in linux-user mode.
  - do not call gdb_exit() in semihosting_exit_request() as it is called in
    qemu_cleanup().
  - pass qemu_get_exit_status() to gdb_exit() in qemu_cleanup() instead
    of 0.

Hi,

This series implements a clean way for semihosted exit syscalls to
terminate QEMU with a given return code.

Until now, exit syscalls implementations consisted in calling exit()
with the wanted return code. The problem with this approach is that
other CPUs are not properly stopped, leading to possible crashes in
MTTCG mode, especially when at_exit callbacks have been registered. This
can be the case e.g., when plugins are in use. Plugins can register
at_exit callbacks. Those will be called on the CPU thread the exit
syscall is comming from, while other CPUs can continue to run and thus
call other plugin callbacks.

The semihosting_exit_request function provides a mean to cleanly
terminate QEMU. It introduces an new exit reason
(SHUTDOWN_CAUSE_GUEST_SEMI_EXIT) used in this case. The CPU is stopped
and returns to the main CPU loop so that no more instruction get
executed (the semihosting_exit_request is declared G_NORETURN).

All targets are converted to use this new function.

Thanks,
Luc

Luc Michel (7):
  softmmu: add qemu_[set|get]_exit_status functions
  semihosting: add the semihosting_exit_request function
  semihosting/arm-compat-semi: use semihosting_exit_request
  target/m68k: use semihosting_exit_request on semihosted exit syscall
  target/mips: use semihosting_exit_request on semihosted exit syscall
  target/nios2: use semihosting_exit_request on semihosted exit syscall
  target/xtensa: use semihosting_exit_request on semihosted exit syscall

 qapi/run-state.json                |  4 +++-
 include/semihosting/semihost.h     |  5 +++++
 include/sysemu/sysemu.h            |  2 ++
 semihosting/arm-compat-semi.c      |  3 +--
 semihosting/config.c               | 16 ++++++++++++++++
 softmmu/main.c                     |  2 +-
 softmmu/runstate.c                 | 13 ++++++++++++-
 target/m68k/m68k-semi.c            |  4 ++--
 target/mips/tcg/sysemu/mips-semi.c |  2 +-
 target/nios2/nios2-semi.c          |  4 ++--
 target/xtensa/xtensa-semi.c        |  2 +-
 11 files changed, 46 insertions(+), 11 deletions(-)

-- 
2.17.1


