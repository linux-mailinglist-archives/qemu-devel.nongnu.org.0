Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFFD2E2237
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:43:27 +0100 (CET)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksBuo-0003Jc-7C
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1ksBgG-00036h-Em
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:24 -0500
Received: from home.keithp.com ([63.227.221.253]:50312 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1ksBgD-0004bb-I1
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 16:28:24 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 1960E3F2E465;
 Wed, 23 Dec 2020 13:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1608758896; bh=3I5CQu0+8qCnbx7HvhLX7o+qoX16KwRm+Viq0hjsdOo=;
 h=From:To:Cc:Subject:Date:From;
 b=LHxqpehq1NpzBJAk522hdx3tnWhIkxBTpMXBY8ysQl+2LLVrYozp5N4HrFohQhnOq
 zofi1+iwdZCdS9pNwtPdM6Xf7AH0LeCTruJ8724F839zwKcNHxtqBpRBQ3bwun36bN
 meRaz+3fBy7qP53qK+VxV+2Tuct5kV9VRcBUUl9Hp3EtxWgTKvAHYZJKtLRA3vJfXL
 jeJt3qQP5+OlJOLBgkFJmCW4upU7r7240gpiSd/9oS6q68zgND3OxPfbEZ+p/r/nWb
 Y/Ql2DpODz04cMFwbpWxI4Cq4rBqm8i7r5CeD4OOMggR0WhpChuuQ/IlwYODahEake
 a+voN3gdb9q/A==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id lnBC8o8VI7SS; Wed, 23 Dec 2020 13:28:14 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id C9E183F2E350;
 Wed, 23 Dec 2020 13:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1608758894; bh=3I5CQu0+8qCnbx7HvhLX7o+qoX16KwRm+Viq0hjsdOo=;
 h=From:To:Cc:Subject:Date:From;
 b=iOhGEWsuncQIAVMqCTxP+irG+nI87UrQpT78MPepaWd8CC2IT+EE/8MkZXz5E1biQ
 ZyXayJb4ihRmIwwm2Y2UX6fHOeWb3/fxrRvzSVqWHL2GB4/phKcFMzsob0tYUjyGX2
 wT3SG8XCEC1zFn+m6adlHCZCfH8R/lXMkDwGrkGe0+ATuBVhHG1Ue5wpAaXkq4Yie4
 eeNkD2mqCDcnYh96tDvwDuuHsv4qKI1prS/b9j9de4mTy5bmOxYNm6Wx0GdVP/VBq5
 IFNP9tb4/e38i5a59DYg2Ssp3Z7ZZuet+8cVuszbmjx9VkOVurYyjzuRdgjlleMJ81
 hNbq4H5+TSavg==
Received: by keithp.com (Postfix, from userid 1000)
 id 9D83615821A4; Wed, 23 Dec 2020 13:28:14 -0800 (PST)
To: qemu-devel@nongnu.org
Subject: [PATCH] gdbstub.c uses incorrect check for active gdb in
 use_gdb_syscalls
Date: Wed, 23 Dec 2020 13:27:52 -0800
Message-Id: <20201223212752.1145294-1-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Keith Packard <keithp@keithp.com>
From: Keith Packard via <qemu-devel@nongnu.org>

When checking whether there is a live gdb connection, code shouldn't
use 'gdbserver_state.init' as that value is set when the
gdbserver_state structure is initialized in init_gdbserver_state, not
when the gdb socket has a valid connection.

The 'handle_detach' function appears to use 'gdbserver_state.c_cpu' as
an indication of whether there is a connection, so I've used the same
in use_gdb_syscalls.

This avoids a segfault when qemu is run with the '-s' flag (create a
gdb protocol socket), but without the '-S' flag (delay until 'c'
command is received).

I would like this patch to inform a discussion on whether the numerous
other places using gdbserver_state.init are also incorrect (most of
them appear to be using it in the same way use_gdb_syscalls does), and
also whether use_gdb_syscalls should cache the result of this check or
whether it should check each time it is called to see if a gdb
connection is currently acive. For the second question, I don't have a
clear idea; mixing gdb and native calls seems problematic for stateful
operations like file open/close.

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index d99bc0bf2e..4e709d16fd 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -460,7 +460,7 @@ int use_gdb_syscalls(void)
     /* -semihosting-config target=auto */
     /* On the first call check if gdb is connected and remember. */
     if (gdb_syscall_mode == GDB_SYS_UNKNOWN) {
-        gdb_syscall_mode = gdbserver_state.init ?
+        gdb_syscall_mode = gdbserver_state.c_cpu != NULL ?
             GDB_SYS_ENABLED : GDB_SYS_DISABLED;
     }
     return gdb_syscall_mode == GDB_SYS_ENABLED;
-- 
2.29.2


