Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3809A6716F6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4L8-0002D4-P3; Wed, 18 Jan 2023 04:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pI4KQ-00028U-91
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:02:32 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <vapier@gentoo.org>) id 1pI4KO-0005XB-Cl
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:01:53 -0500
Received: by smtp.gentoo.org (Postfix, from userid 559)
 id E1CB6340D30; Wed, 18 Jan 2023 09:01:48 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] linux-user: fix strace build w/out munlockall
Date: Wed, 18 Jan 2023 04:01:44 -0500
Message-Id: <20230118090144.31155-1-vapier@gentoo.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117233042.16897-1-vapier@gentoo.org>
References: <20230117233042.16897-1-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=8bit
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/strace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9ae5a812cd71..11a7c3df9498 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1380,7 +1380,8 @@ UNUSED static struct flags termios_lflags[] = {
     FLAG_END,
 };
 
-UNUSED static struct flags mlockall_flags[] = {
+#ifdef TARGET_NR_mlockall
+static struct flags mlockall_flags[] = {
     FLAG_TARGET(MCL_CURRENT),
     FLAG_TARGET(MCL_FUTURE),
 #ifdef MCL_ONFAULT
@@ -1388,6 +1389,7 @@ UNUSED static struct flags mlockall_flags[] = {
 #endif
     FLAG_END,
 };
+#endif
 
 /* IDs of the various system clocks */
 #define TARGET_CLOCK_REALTIME              0
-- 
2.39.0


