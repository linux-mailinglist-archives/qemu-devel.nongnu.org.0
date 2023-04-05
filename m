Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19A6D89B7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoD-0005JL-L4; Wed, 05 Apr 2023 17:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnz-0005IT-CS
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:35 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnx-0005ao-Ak
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:34 -0400
Received: by mail-il1-x129.google.com with SMTP id h14so18153742ilj.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+1pyA/IVH1HKwHyEkUgzX0roAnFA4GI59mdl6vS7Qs=;
 b=5HkGm7HFce6bnqwIvZSyNrcVVEycKyXqg53FvIFQsOk43ZOWIuizOGAS23aSdq6Zb6
 sTryFsS4c2h1YO5S7acU3WibB2IsqCF98HM+9qUncNUxCi05xk2vopoiY3qF41PCRt0x
 rL6thIKub290LOVAtVaLPbnGk2MUoOo7vyv1+1HLkTkAVO1y3zNz5tV5NwaUYrrtJ4PH
 Np0JL+ShUXKPyU4vxgbHbvAFzLQadxYAUjWqwGw/iuK3cYJ3/3XzvBcA4EvYeA3rICiK
 az5KUIZtlu2UhblPvFFmHYyXsbGBwuWHmvgWIQxOWW6dSNOvIGelkKKJ5Ql0XIgyMMu/
 8m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+1pyA/IVH1HKwHyEkUgzX0roAnFA4GI59mdl6vS7Qs=;
 b=mRJldW2bms4cwJDWCWmqzY1IhXFOKb47Danj9nidPYI4zUhw41mJLSSVm2PTbyaKGa
 gT0FSRCQJ0N9bKL7oF0ucPzCAoVaAPIe2H5BxZaifnS7O0UHGg5ciU1ef4+2jhlI2d1A
 gVUxd2q+vdqQwC+MxAN5aZC2WApFwIhYum9N9Rskwv/lEyypTncUVhPGmK6GQYJLTu6n
 44BXqgvozM7hvXzy0E66t+nlC8s5WsfQ+3X7RNqp1S0R3Kjiu9L58EEWvnWL1RN1fQIq
 8xg9i0KCbvyFeitV+wzmldmYd7f6TPkKzNB6BSHCxiN8Kbvt759Jq21PBzAld+Iwq8+t
 l7pQ==
X-Gm-Message-State: AAQBX9cAPgZIhDY8uvHufmFAhTV5Oe7w9gDBagFOkatK7bvjJepJBuD2
 uBw0zRg7m3lgviX/36FSR/eOS/UuAj8jeRmSM8g=
X-Google-Smtp-Source: AKy350YJszeHRxALi/gCzKK1FXd4QlY/GuTO+4uQQrmU+tKj9tu8hB/MFqVKX/4hhhrppQ5E2fag5g==
X-Received: by 2002:a92:c84e:0:b0:311:137e:83c6 with SMTP id
 b14-20020a92c84e000000b00311137e83c6mr5243904ilq.22.1680730591692; 
 Wed, 05 Apr 2023 14:36:31 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:31 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 06/16] bsd-user: Remove OpenBSD specific syscall printing
Date: Wed,  5 Apr 2023 15:36:02 -0600
Message-Id: <20230405213612.15942-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Nothing calls these routines now. In the bsd-user fork, though, they've
moved to openbsd/os-syscall.c, but those aren't ready for upstreaming.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  5 -----
 bsd-user/strace.c | 25 -------------------------
 2 files changed, 30 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index cee02d2a0ea..49468734d44 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -196,11 +196,6 @@ struct syscallname {
     void (*result)(const struct syscallname *, abi_long);
 };
 
-void
-print_openbsd_syscall(int num,
-                      abi_long arg1, abi_long arg2, abi_long arg3,
-                      abi_long arg4, abi_long arg5, abi_long arg6);
-void print_openbsd_syscall_ret(int num, abi_long ret);
 void print_execve(const struct syscallname *name, abi_long arg1,
                   abi_long arg2, abi_long arg3, abi_long arg4,
                   abi_long arg5, abi_long arg6);
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 8e76caa3c3f..b827acb2477 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -142,14 +142,6 @@ void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
     }
 }
 
-/*
- * An array of all of the syscalls we know about
- */
-
-static const struct syscallname openbsd_scnames[] = {
-#include "openbsd/strace.list"
-};
-
 void print_syscall(int num, const struct syscallname *scnames,
                    unsigned int nscnames, abi_long arg1, abi_long arg2,
                    abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
@@ -203,23 +195,6 @@ void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
     }
 }
 
-/*
- * The public interface to this module.
- */
-void print_openbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    print_syscall(num, openbsd_scnames, ARRAY_SIZE(openbsd_scnames), arg1, arg2,
-            arg3, arg4, arg5, arg6);
-}
-
-void print_openbsd_syscall_ret(int num, abi_long ret)
-{
-
-    print_syscall_ret(num, ret, openbsd_scnames, ARRAY_SIZE(openbsd_scnames));
-}
-
 static void
 print_signal(abi_ulong arg, int last)
 {
-- 
2.40.0


