Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBFA6D224B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:24:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFfJ-0004Ie-2v; Fri, 31 Mar 2023 10:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@umbrella>) id 1piFfH-0004I5-9B
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:39 -0400
Received: from c-71-237-47-177.hsd1.co.comcast.net ([71.237.47.177]
 helo=umbrella) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imp@umbrella>) id 1piFfF-0003uf-Ut
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:39 -0400
Received: from imp (uid 730) (envelope-from imp@umbrella) id 180ad
 by umbrella (DragonFly Mail Agent v0.13+ on umbrella);
 Fri, 31 Mar 2023 08:18:33 -0600
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Ryo ONODERA <ryoon@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH 4/7] bsd-user: Remove openbsd system call inclusion and defines
Date: Fri, 31 Mar 2023 08:18:30 -0600
Message-Id: <20230331141833.3647-5-imp@bsdimp.com>
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

Remove OpenBSD system call inclusion and defines. We've not supported
building all the BSDs into one module for some time, and the OpenBSD
support hasn't even built since the meson conversion.
---
 bsd-user/syscall_defs.h | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index 8352ab783c..a3a0fdbb52 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -26,7 +26,6 @@
 #include "errno_defs.h"
 
 #include "freebsd/syscall_nr.h"
-#include "openbsd/syscall_nr.h"
 
 /*
  * machine/_types.h
@@ -65,17 +64,7 @@ struct target_iovec {
 
 #define TARGET_FREEBSD_MAP_FLAGMASK     0x1ff7
 
-#define TARGET_OPENBSD_MAP_INHERIT      0x0080  /* region is retained after */
-                                                /* exec */
-#define TARGET_OPENBSD_MAP_NOEXTEND     0x0100  /* for MAP_FILE, don't change */
-                                                /* file size */
-#define TARGET_OPENBSD_MAP_TRYFIXED     0x0400  /* attempt hint address, */
-                                                /* even within heap */
-
-#define TARGET_OPENBSD_MAP_FLAGMASK     0x17f7
-
-/* XXX */
-#define TARGET_BSD_MAP_FLAGMASK         0x3ff7
+#define TARGET_BSD_MAP_FLAGMASK         0x1ff7
 
 /*
  * sys/time.h
-- 
2.39.2


