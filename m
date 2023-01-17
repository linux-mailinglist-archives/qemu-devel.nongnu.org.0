Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C5670D84
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:31:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHvPx-0006vT-9r; Tue, 17 Jan 2023 18:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pHvPp-0006vA-QF
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:30:53 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pHvPo-0004Rp-8m
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:30:53 -0500
Received: by smtp.gentoo.org (Postfix, from userid 559)
 id CDC1A33FEFB; Tue, 17 Jan 2023 23:30:48 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: fix strace build w/out munlockall
Date: Tue, 17 Jan 2023 18:30:42 -0500
Message-Id: <20230117233042.16897-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=vapier@gentoo.org;
 helo=smtp.gentoo.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 linux-user/strace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9ae5a812cd71..f7912ad67f2b 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1380,6 +1380,7 @@ UNUSED static struct flags termios_lflags[] = {
     FLAG_END,
 };
 
+#ifdef TARGET_NR_mlockall
 UNUSED static struct flags mlockall_flags[] = {
     FLAG_TARGET(MCL_CURRENT),
     FLAG_TARGET(MCL_FUTURE),
@@ -1388,6 +1389,7 @@ UNUSED static struct flags mlockall_flags[] = {
 #endif
     FLAG_END,
 };
+#endif
 
 /* IDs of the various system clocks */
 #define TARGET_CLOCK_REALTIME              0
-- 
2.39.0


