Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144B27EC77
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 17:26:10 +0200 (CEST)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNdzd-0006eQ-Gn
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 11:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkysel@tachyum.com>)
 id 1kNdqW-00075d-Pu
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 11:16:44 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:9475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkysel@tachyum.com>)
 id 1kNdqV-0006IN-26
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 11:16:44 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id 5098910056A8; Wed, 30 Sep 2020 08:16:40 -0700 (PDT)
Received: from tsk-dev-swd001.tachyum.sk (unknown [93.184.71.90])
 by mx1.tachyum.com (Postfix) with ESMTP id E5E9810056A5;
 Wed, 30 Sep 2020 08:16:37 -0700 (PDT)
From: Matus Kysel <mkysel@tachyum.com>
To: mkysel@tachyum.com
Subject: [PATCH] linux-user: correct errno returned from accept4() syscall
Date: Wed, 30 Sep 2020 17:16:16 +0200
Message-Id: <20200930151616.3588165-1-mkysel@tachyum.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mkysel@tachyum.com;
 helo=mx1.tachyum.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 11:16:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

accept4() returned wrong errno, that did not match current linux

Signed-off-by: Matus Kysel <mkysel@tachyum.com>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 897d20c076..5b8c20cf21 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3491,16 +3491,16 @@ static abi_long do_accept4(int fd, abi_ulong target_addr,
         return get_errno(safe_accept4(fd, NULL, NULL, host_flags));
     }
 
-    /* linux returns EINVAL if addrlen pointer is invalid */
+    /* linux returns EFAULT if addrlen pointer is invalid */
     if (get_user_u32(addrlen, target_addrlen_addr))
-        return -TARGET_EINVAL;
+        return -TARGET_EFAULT;
 
     if ((int)addrlen < 0) {
         return -TARGET_EINVAL;
     }
 
     if (!access_ok(VERIFY_WRITE, target_addr, addrlen))
-        return -TARGET_EINVAL;
+        return -TARGET_EFAULT;
 
     addr = alloca(addrlen);
 
-- 
2.25.1


