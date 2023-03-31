Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A516D2249
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:24:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFfM-0004KZ-Ft; Fri, 31 Mar 2023 10:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@umbrella>) id 1piFfJ-0004J4-EC
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:41 -0400
Received: from c-71-237-47-177.hsd1.co.comcast.net ([71.237.47.177]
 helo=umbrella) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imp@umbrella>) id 1piFfF-0003ud-Vo
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:41 -0400
Received: from imp (uid 730) (envelope-from imp@umbrella) id 180a7
 by umbrella (DragonFly Mail Agent v0.13+ on umbrella);
 Fri, 31 Mar 2023 08:18:33 -0600
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Ryo ONODERA <ryoon@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH 3/7] bsd-user: Remove netbsd system call tracing
Date: Fri, 31 Mar 2023 08:18:29 -0600
Message-Id: <20230331141833.3647-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331141833.3647-1-imp@bsdimp.com>
References: <20230331141833.3647-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=71.237.47.177; envelope-from=imp@umbrella;
 helo=umbrella
X-Spam_score_int: 31
X-Spam_score: 3.1
X-Spam_bar: +++
X-Spam_report: (3.1 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HELO_NO_DOMAIN=0.001,
 KHOP_HELO_FCRDNS=0.399, PDS_RDNS_DYNAMIC_FP=0.01, RCVD_IN_PBL=3.335,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

Remove NetBSD system call tracing. We've not supported building all the
BSDs into one module for some time, and the NetBSD support hasn't even
built since the meson conversion.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  5 -----
 bsd-user/strace.c | 17 -----------------
 2 files changed, 22 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4062ee720f..b82f7b6f00 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -196,11 +196,6 @@ print_freebsd_syscall(int num,
                       abi_long arg4, abi_long arg5, abi_long arg6);
 void print_freebsd_syscall_ret(int num, abi_long ret);
 void
-print_netbsd_syscall(int num,
-                     abi_long arg1, abi_long arg2, abi_long arg3,
-                     abi_long arg4, abi_long arg5, abi_long arg6);
-void print_netbsd_syscall_ret(int num, abi_long ret);
-void
 print_openbsd_syscall(int num,
                       abi_long arg1, abi_long arg2, abi_long arg3,
                       abi_long arg4, abi_long arg5, abi_long arg6);
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 96499751eb..bde906e9be 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -152,9 +152,6 @@ static void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
 static const struct syscallname freebsd_scnames[] = {
 #include "freebsd/strace.list"
 };
-static const struct syscallname netbsd_scnames[] = {
-#include "netbsd/strace.list"
-};
 static const struct syscallname openbsd_scnames[] = {
 #include "openbsd/strace.list"
 };
@@ -229,20 +226,6 @@ void print_freebsd_syscall_ret(int num, abi_long ret)
     print_syscall_ret(num, ret, freebsd_scnames, ARRAY_SIZE(freebsd_scnames));
 }
 
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
2.39.2


