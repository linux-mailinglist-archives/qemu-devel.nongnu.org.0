Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53422AC8E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 12:28:57 +0200 (CEST)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyYTA-0008Bq-Ql
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 06:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1jyYRb-00074L-5D
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 06:27:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:54784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1jyYRZ-00042Q-Ku
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 06:27:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5A27ACDF;
 Thu, 23 Jul 2020 10:27:21 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Use getcwd syscall directly
X-Yow: Oh, FISH sticks, CHEEZ WHIZ, GIN fizz, SHOW BIZ!!
Date: Thu, 23 Jul 2020 12:27:13 +0200
Message-ID: <mvmmu3qplvi.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.15; envelope-from=schwab@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 02:36:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The glibc getcwd function returns different errors than the getcwd
syscall, which triggers an assertion failure in the glibc getcwd function
when running under the emulation.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 linux-user/syscall.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b9144b18fc..e4e46867e8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -388,14 +388,7 @@ static bitmask_transtbl fcntl_flags_tbl[] = {
   { 0, 0, 0, 0 }
 };
 
-static int sys_getcwd1(char *buf, size_t size)
-{
-  if (getcwd(buf, size) == NULL) {
-      /* getcwd() sets errno */
-      return (-1);
-  }
-  return strlen(buf)+1;
-}
+_syscall2(int, sys_getcwd1, char *, buf, size_t, size)
 
 #ifdef TARGET_NR_utimensat
 #if defined(__NR_utimensat)
-- 
2.26.2


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

