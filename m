Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CF6DCAB1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:23:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8w-0002it-B2; Mon, 10 Apr 2023 14:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8d-0002dz-OC
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:13 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8c-0000f5-4o
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:11 -0400
Received: by mail-il1-x130.google.com with SMTP id k7so13378539ils.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqE0cOIeNp+kyq+c5+Esj5WEVDxO+dIWwYCwGSiBV/o=;
 b=jUM2dqPfr1ReKxXEs8izTyl6Idsz+U0dzA9GmgE/28YWpKS4ZJYk3S6Dixe/8QIXHv
 dHkFarcozqCPK2hU6pbvGc9BumlIF9B2idR0rrGWcE2/y6vGfi14/foSXJW8ft9MDiHB
 n8XZPAJwx++zcTnkmhZdiZH67cHAQQOf9vRaUCvChQcCM/n79kDaBXa8vuNuSsl7aeXd
 3OxXASfIcSGbeB1BSynIkv/xU5xgSEgd3Gd36lZYFOi0P/zrMOnHXE/anqdhnmwc9Drr
 gxYgAh20ilhk1d7m1J89gT7QQaWzPTqJiDwvlyWrYcymBSEmYy4Rm66ZwHkHGS6dedAi
 f52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqE0cOIeNp+kyq+c5+Esj5WEVDxO+dIWwYCwGSiBV/o=;
 b=O0D1gGL2Lo7+zGF4CNGVsw2R4stQa55F4XiZKL+0EQApwoPp7jwOG+eR2Q7of5H/qC
 2GBjS5mLP0Ir/OlY7ChAkYS02npw0VDAe02p0sGMRfHOCueiuO3bBJp3Z99NuNCf3lyT
 QX6gM73dKun4ayzpkG2it4VLfgZarxSz1WqiiH4q6PRljrykDrKs6ons8JI2rlb0Cgof
 xt2CXP9FBq9J/Nwv39Mt4rrgNwwesAC+SYCejHVYQEKXRPzDQnW7e90Wb1pDbrrQrO7A
 KpmWaO94l0oFSWZWa/yx1tw4UFlo+LdZB9CZu06z54K9/UeYWozbVF6E6xZrASbvQMGG
 4EPA==
X-Gm-Message-State: AAQBX9drPxoZuUq+LVvOYng0LvJncu+T/hmvAqeFJhGoLuSRu68DerEG
 TnBel5pK4GKDQ6Mp6LQ8juFAJO4DwuDNf/JCMmI=
X-Google-Smtp-Source: AKy350YUXl+H7KdYL85KAd3iRQm8ItSVPhnxhfoJuSmHVPSpnKoAyE/nv22Vj0izVjWHPbxpJKtgAQ==
X-Received: by 2002:a92:50b:0:b0:328:6172:a739 with SMTP id
 q11-20020a92050b000000b003286172a739mr188367ile.23.1681150868727; 
 Mon, 10 Apr 2023 11:21:08 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:08 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/19] bsd-user: Move system FreeBSD call table to
 freebsd/os-syscall.c
Date: Mon, 10 Apr 2023 12:20:41 -0600
Message-Id: <20230410182056.320-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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

Move the system call table, and FreeBSD helper routines out of strace.c.
We do not support multiple BSD-types in one binary, so simplify things
by moving it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 19 +++++++++++++++++++
 bsd-user/qemu.h               |  5 -----
 bsd-user/strace.c             | 17 -----------------
 3 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c8f998ecec1..354a38943e5 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -517,6 +517,25 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     return ret;
 }
 
+static const struct syscallname freebsd_scnames[] = {
+#include "freebsd/strace.list"
+};
+
+static void print_freebsd_syscall(int num, abi_long arg1, abi_long arg2,
+                                  abi_long arg3, abi_long arg4, abi_long arg5,
+                                  abi_long arg6)
+{
+
+    print_syscall(num, freebsd_scnames, ARRAY_SIZE(freebsd_scnames), arg1, arg2,
+            arg3, arg4, arg5, arg6);
+}
+
+static void print_freebsd_syscall_ret(int num, abi_long ret)
+{
+
+    print_syscall_ret(num, ret, freebsd_scnames, ARRAY_SIZE(freebsd_scnames));
+}
+
 /*
  * do_freebsd_syscall() should always have a single exit point at the end so
  * that actions, such as logging of syscall results, can be performed. This
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 22e16816a9e..c5240938da7 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -196,11 +196,6 @@ struct syscallname {
     void (*result)(const struct syscallname *, abi_long);
 };
 
-void
-print_freebsd_syscall(int num,
-                      abi_long arg1, abi_long arg2, abi_long arg3,
-                      abi_long arg4, abi_long arg5, abi_long arg6);
-void print_freebsd_syscall_ret(int num, abi_long ret);
 void
 print_netbsd_syscall(int num,
                      abi_long arg1, abi_long arg2, abi_long arg3,
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index e45909b8688..7d0117fd3cf 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -146,9 +146,6 @@ void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
  * An array of all of the syscalls we know about
  */
 
-static const struct syscallname freebsd_scnames[] = {
-#include "freebsd/strace.list"
-};
 static const struct syscallname netbsd_scnames[] = {
 #include "netbsd/strace.list"
 };
@@ -212,20 +209,6 @@ void print_syscall_ret(int num, abi_long ret, const struct syscallname *scnames,
 /*
  * The public interface to this module.
  */
-void print_freebsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
-        abi_long arg4, abi_long arg5, abi_long arg6)
-{
-
-    print_syscall(num, freebsd_scnames, ARRAY_SIZE(freebsd_scnames), arg1, arg2,
-            arg3, arg4, arg5, arg6);
-}
-
-void print_freebsd_syscall_ret(int num, abi_long ret)
-{
-
-    print_syscall_ret(num, ret, freebsd_scnames, ARRAY_SIZE(freebsd_scnames));
-}
-
 void print_netbsd_syscall(int num, abi_long arg1, abi_long arg2, abi_long arg3,
         abi_long arg4, abi_long arg5, abi_long arg6)
 {
-- 
2.40.0


