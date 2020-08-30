Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3886256D14
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 11:23:53 +0200 (CEST)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCJZ2-0002hO-NX
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 05:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikedld@mikedld.com>)
 id 1kCJYC-0002Fe-FQ; Sun, 30 Aug 2020 05:23:00 -0400
Received: from static.44.144.216.95.clients.your-server.de
 ([95.216.144.44]:47808 helo=mikedld.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikedld@mikedld.com>)
 id 1kCJYA-00006M-SR; Sun, 30 Aug 2020 05:23:00 -0400
Received: from localhost (unknown [178.124.162.207])
 by mikedld.com (Postfix) with ESMTPS id 1172839C3BC;
 Sun, 30 Aug 2020 09:22:54 +0000 (UTC)
From: Mike Gelfand <mikedld@mikedld.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Add strace support for printing OFD fcntl
 operations
Date: Sun, 30 Aug 2020 12:22:42 +0300
Message-Id: <20200830092242.31506-1-mikedld@mikedld.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=95.216.144.44; envelope-from=mikedld@mikedld.com;
 helo=mikedld.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 05:22:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Mike Gelfand <mikedld@mikedld.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mike Gelfand <mikedld@mikedld.com>
---
 linux-user/strace.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 4f77b0cf76..11fea14fba 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -2056,6 +2056,18 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
         print_pointer(arg2, 1);
         break;
 #endif
+    case TARGET_F_OFD_GETLK:
+        qemu_log("F_OFD_GETLK,");
+        print_pointer(arg2, 1);
+        break;
+    case TARGET_F_OFD_SETLK:
+        qemu_log("F_OFD_SETLK,");
+        print_pointer(arg2, 1);
+        break;
+    case TARGET_F_OFD_SETLKW:
+        qemu_log("F_OFD_SETLKW,");
+        print_pointer(arg2, 1);
+        break;
     case TARGET_F_SETLEASE:
         qemu_log("F_SETLEASE,");
         print_raw_param(TARGET_ABI_FMT_ld, arg2, 0);
-- 
2.28.0


