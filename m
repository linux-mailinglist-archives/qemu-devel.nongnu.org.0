Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84742DF1B0
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 21:58:37 +0100 (CET)
Received: from localhost ([::1]:44620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqjJE-00014u-Iw
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 15:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@dune.bsdimp.com>)
 id 1kqj5e-0007TN-0P
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 15:44:34 -0500
Received: from 50-253-99-174-static.hfc.comcastbusiness.net
 ([50.253.99.174]:16413 helo=dune.bsdimp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@dune.bsdimp.com>)
 id 1kqj5c-000454-If
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 15:44:33 -0500
Received: from dune.bsdimp.com (localhost [127.0.0.1])
 by dune.bsdimp.com (8.15.2/8.15.2) with ESMTPS id 0BIKqsrj086432
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Dec 2020 13:52:54 -0700 (MST)
 (envelope-from imp@dune.bsdimp.com)
Received: (from imp@localhost)
 by dune.bsdimp.com (8.15.2/8.15.2/Submit) id 0BIKqs44086431;
 Fri, 18 Dec 2020 13:52:54 -0700 (MST) (envelope-from imp)
From: imp@freebsd.org
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] tcg: Additional Trap type for FreeBSD
Date: Fri, 18 Dec 2020 13:52:48 -0700
Message-Id: <20201218205250.86382-3-imp@freebsd.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20201218205250.86382-1-imp@freebsd.org>
References: <20201218205250.86382-1-imp@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=50.253.99.174; envelope-from=imp@dune.bsdimp.com;
 helo=dune.bsdimp.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.267,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Juergen Lock <nox@FreeBSD.org>, Sean Bruno <sbruno@freebsd.org>,
 Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Bruno <sbruno@freebsd.org>

FreeBSD can generate a trap 0xc as well as 0xe when writing to a
read-only page.

Signed-off-by: Juergen Lock <nox@FreeBSD.org>
[imp rewored commit message for clarity]
Signed-off-by: Warner Losh <imp@FreeBSD.org>
---
 accel/tcg/user-exec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 4ebe25461a..1f5befa9f9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -343,7 +343,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = PC_sig(uc);
     return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+#if defined(__FreeBSD__) || defined(__DragonFly__)
+                             (TRAP_sig(uc) == 0xe ||
+                              TRAP_sig(uc) == 0xc) ?
+#else
+                             TRAP_sig(uc) == 0xe ?
+#endif
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
-- 
2.22.1


