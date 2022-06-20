Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E81551EDB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:35:33 +0200 (CEST)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IV2-000270-Hs
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IL8-0005hS-J1
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:18 -0400
Received: from smtpout140.security-mail.net ([85.31.212.146]:51217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3IL5-0001SF-Mv
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:25:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx601.security-mail.net (Postfix) with ESMTP id D712E3ACDE0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655735112;
 bh=nhXnMVrXx0V4sl/soMoVnyEcpvtcT0xijYB89k3X6t0=;
 h=From:To:Cc:Subject:Date;
 b=MNarfGWOc3v1Vsru3r/zr+ugAhwHbvjn+Q2xopRoc+lya/5S4is9HxJc1xoIA+Xh/
 GZvfkBL4E8jbgpZAcdkRSFqsbNY2DPhsrWDC3WpqciaExob8rFTA4fSoKLRAFfvz1W
 53SbobJV9kh9kwX0XFNjwRH4PSUP/xVF3s8p+GtM=
Received: from fx601 (localhost [127.0.0.1])
 by fx601.security-mail.net (Postfix) with ESMTP id 285723ACD0A;
 Mon, 20 Jun 2022 16:25:10 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <13793.62b08345.776e4.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx601.security-mail.net (Postfix) with ESMTPS id 78CC73ACD3E;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 4580927E04DD;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 2817527E04D8;
 Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2817527E04D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655735109;
 bh=RDo27fykTqrD277gjJvXKpSIhgoCyBafIGCGUIYnh94=;
 h=From:To:Date:Message-Id;
 b=FFICkQyqrWzznM7Kw2fL67L0FdNtXwyUl8xQuuJ8d/MGAxTPFTRoauSu2I5E1BcPd
 uSI/imRDWmZgkN7azQHnkWCgSa+Eqo7Zbqo61WCNHNJPruSPWsi6/525asaiY9zppx
 1B434XyNukU8IjUNfjGOZk0Wd5+qGzWwaX7UYukQ=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QPSIZ_zhvre4; Mon, 20 Jun 2022 16:25:09 +0200 (CEST)
Received: from ws2101.lin.mbt.kalray.eu (unknown [192.168.36.68])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 00CD627E04B5;
 Mon, 20 Jun 2022 16:25:08 +0200 (CEST)
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
Subject: [PATCH 0/7] semihosting: proper QEMU exit on semihosted exit syscall
Date: Mon, 20 Jun 2022 16:24:18 +0200
Message-Id: <20220620142426.15040-1-lmichel@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
Received-SPF: pass client-ip=85.31.212.146; envelope-from=lmichel@kalray.eu;
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
 include/semihosting/semihost.h     |  4 ++++
 include/sysemu/sysemu.h            |  2 ++
 semihosting/arm-compat-semi.c      |  3 +--
 semihosting/config.c               | 17 +++++++++++++++++
 softmmu/main.c                     |  2 +-
 softmmu/runstate.c                 | 11 +++++++++++
 target/m68k/m68k-semi.c            |  4 ++--
 target/mips/tcg/sysemu/mips-semi.c |  2 +-
 target/nios2/nios2-semi.c          |  4 ++--
 target/xtensa/xtensa-semi.c        |  2 +-
 11 files changed, 45 insertions(+), 10 deletions(-)

-- 
2.17.1


