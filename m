Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF06DCAA7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:22:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8p-0002gj-0i; Mon, 10 Apr 2023 14:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8f-0002eI-CC
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:13 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8d-0000gk-Pd
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:13 -0400
Received: by mail-il1-x129.google.com with SMTP id o12so21100314ilh.13
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrJ6hQ7Rt3y9iXgYz6Hn19qcli8MJnG4NqFH7qfo5u0=;
 b=mg1oRBktPEshq+TeLIrLJXGRV8A6jiHsKX0+jDWORuSas9N+aphOMug/FboYRHdwZr
 RPF5BL+MEExveFHlxnfRaNRc3AOYqe1cQ64C9COvlZwS0Bl0cL6kqms/sNdhjiAfbFE9
 fOi1dTaEdMZCHRrMAYs+54qA2nZ589cI1RjBOBe0JiEyE4MWJaG5OFmgPSZrRlHZA3ML
 t/uC+rqjzoVWp663keeFrNsE65qhOrzOVNzDQnUm1Epq3kH5Aoc6X9WQvggz6OkJAEmB
 9AImXnnD9zaPTdM/oFp7IricF8t39EjHvAUzyxvZ2g0n04iiNtrzUtx0L7p1e990zcmP
 /gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrJ6hQ7Rt3y9iXgYz6Hn19qcli8MJnG4NqFH7qfo5u0=;
 b=DcOcBTJP1ag8btbCmFtd1wkTTmD1ZyyjwIfg4VsroUBftW8GUJIm2ltd1/c3oRiEDz
 PC9BH4dU6VIy7eFMmVWfF6IOyL3KVQyX5PVHPrNFmV6AZPma7dPPk8Yx3NP4aINN2+fz
 iVyQwMQZ2a6XCz1iinD4bTkK7NSJFomcrtOGxiDIDYG9uiADJ1N239RfaeVTMdD7nXPl
 tNgIh0MM/eICZRvIHdhFjT9BAWe/cZ5czBXmpy9NwylxCgCneyUbEND4Q9F3Dg16J//6
 EiZOqO6qQoJs0dtRX3nnJZqnFSK8xENuJ3fRu8CBZCjt7MKluD1/rD7jIU6YTmJEzc+D
 TvCA==
X-Gm-Message-State: AAQBX9dVmmISm5vqQSnDnF36SWD3c3stqWrLZvrZPSwaxgigTybWNwJQ
 8BEYGylq/vSoCAdoEPeWozLDY5NfkJfGDLzwZ3o=
X-Google-Smtp-Source: AKy350YnAcLe3f6J5PFE8SXmZfs4VfYfskYQFkZOkGfHCV10afaLxm/pZSls8GoKO/djwmGK+2faHQ==
X-Received: by 2002:a92:d386:0:b0:326:2d3a:c76d with SMTP id
 o6-20020a92d386000000b003262d3ac76dmr4805396ilo.15.1681150870439; 
 Mon, 10 Apr 2023 11:21:10 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:10 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/19] bsd-user: Remove OpenBSD specific syscall printing
Date: Mon, 10 Apr 2023 12:20:43 -0600
Message-Id: <20230410182056.320-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


