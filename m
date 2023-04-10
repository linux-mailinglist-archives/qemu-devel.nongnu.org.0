Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AE6DCAA6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:22:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8n-0002fW-7K; Mon, 10 Apr 2023 14:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8f-0002eG-1W
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:13 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8d-0000fH-Fc
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:12 -0400
Received: by mail-il1-x12e.google.com with SMTP id s4so2663041ilv.11
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWf8Mdc3sABcKlVmtCGZhLXeGei83PoA0g+BtXKSJpY=;
 b=5XTRISPcSoSGfO/oEmaBiOUI61Y2I1QHq1uF2KJgqoqTYuKFPl96JhnZnAsZrdXz1l
 zkzJPxi0ANWhr+BbMWgXoLb1pQSY5rMsNYzwRnYPzFWuTeGnnOD9iJleILsypWo64PDN
 v97gsZ8xPB2lRWgEbD7kAOPQO456EXMR5EjmfWYyCO3Fzzbe/gUjx+/FNO2wDnZh2+No
 ZCOuwFsA0s8g3jw2+9BXpV7yygKEKJxsVHBfNU+jOXAwp6TKIhfpJo9JHirK5ScQfLZq
 +WwKeADG+1XEd739N1leBs/rOyH64ebZ4YnaIOeXXFZfLg/8hQdmya3Igp3wc+795dm2
 23fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tWf8Mdc3sABcKlVmtCGZhLXeGei83PoA0g+BtXKSJpY=;
 b=RSpq69T0aZivneSE7QA8DzGx/0MdgMVvq5LsMXGy5jE9GS7Q2pOCxZA8qfY0BLfiRg
 19vau5m4q1fDRSHhsPWo10GlqJ4KqEPt+vVhnyzaiZyMVevKziNdqXZ9ye1yc35udNWB
 QliaUWIicV+S59hSMtPtzbWs50nzCtwZvevv4xAAJUm3jCKNTGIKk32pBtQxtUPv3cDJ
 haMzBLfEdykx4LELYsbhOii3R6hQYvsbFVa2v7wkpL1LgIgfYHOJKJNSHeVeAynnWkdv
 hYRKj9gDwUn9fpkRxP9RwqZ31mgcxjvjKpPe4XuLIPxMwmM4XOneQxRtY2ZEmyENt4Ik
 2kNA==
X-Gm-Message-State: AAQBX9dyA/Fv9XtHT9pd6Ud/WR7Yn8tqhvEUOJ/3JuTGoVvKjkGppsvb
 fMayx9w2lZoh5cAF8ZyMsvS36X/W7wvNoomPY2s=
X-Google-Smtp-Source: AKy350bbByKRijsvXsWuwobCd5yDYQiWvZsMqnUjMl4SVxCEZ5zbYtPDWnzVzYOYz8mcJrUZS4rCiw==
X-Received: by 2002:a92:290a:0:b0:326:4dd6:e3f9 with SMTP id
 l10-20020a92290a000000b003264dd6e3f9mr201073ilg.22.1681150869504; 
 Mon, 10 Apr 2023 11:21:09 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:09 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/19] bsd-user: Remove NetBSD specific syscall printing
Date: Mon, 10 Apr 2023 12:20:42 -0600
Message-Id: <20230410182056.320-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
moved to netbsd/os-syscall.c, but those aren't ready for upstreaming.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   |  5 -----
 bsd-user/strace.c | 17 -----------------
 2 files changed, 22 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index c5240938da7..cee02d2a0ea 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -196,11 +196,6 @@ struct syscallname {
     void (*result)(const struct syscallname *, abi_long);
 };
 
-void
-print_netbsd_syscall(int num,
-                     abi_long arg1, abi_long arg2, abi_long arg3,
-                     abi_long arg4, abi_long arg5, abi_long arg6);
-void print_netbsd_syscall_ret(int num, abi_long ret);
 void
 print_openbsd_syscall(int num,
                       abi_long arg1, abi_long arg2, abi_long arg3,
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 7d0117fd3cf..8e76caa3c3f 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -146,9 +146,6 @@ void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
  * An array of all of the syscalls we know about
  */
 
-static const struct syscallname netbsd_scnames[] = {
-#include "netbsd/strace.list"
-};
 static const struct syscallname openbsd_scnames[] = {
 #include "openbsd/strace.list"
 };
@@ -209,20 +206,6 @@ void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
 /*
  * The public interface to this module.
  */
-void print_netbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    print_syscall(num, netbsd_scnames, ARRAY_SIZE(netbsd_scnames),
-                  arg1, arg2, arg3, arg4, arg5, arg6);
-}
-
-void print_netbsd_syscall_ret(int num, abi_long ret)
-{
-
-    print_syscall_ret(num, ret, netbsd_scnames, ARRAY_SIZE(netbsd_scnames));
-}
-
 void print_openbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
         abi_long arg4, abi_long arg5, abi_long arg6)
 {
-- 
2.40.0


