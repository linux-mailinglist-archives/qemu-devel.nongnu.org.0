Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C211A6EEEED
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 09:09:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prZFO-0007Jv-Nc; Wed, 26 Apr 2023 03:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1prZFK-0007Ix-Nk
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:07:22 -0400
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1prZF5-00070o-FM
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 03:07:22 -0400
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1682492821; bh=UZxcXItwy0Yvs9deS2R3M84nAYIPOOsY34BW4MbvsGA=;
 h=From:To:Cc:Subject:Date:From;
 b=A22GVXdh1QSnRjve3e+uAAdZAATPOBgZNJujCSLM8NzVgGEbZsCHgpK7f4GHWWcos
 4cOEEPnqWIewQnzIhAikxsXYQoducU2NzwgqN+icxYulpbmdiTe8fBr6JOjrjwpYCR
 DxrtuHA+L0RgCOcSVZmU2tDgEY09tWS3jgiD5vcg=
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Laurent Vivier" <laurent@vivier.eu>
Subject: [PATCH] linux-user: report ENOTTY for unknown ioctls
Date: Wed, 26 Apr 2023 09:06:59 +0200
Message-Id: <20230426070659.80649-1-thomas@t-8ch.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:c010:41de::1;
 envelope-from=thomas@t-8ch.de; helo=todd.t-8ch.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The correct error number for unknown ioctls is ENOTTY.

ENOSYS would mean that the ioctl() syscall itself is not implemented,
which is very improbable and unexpected for userspace.

ENOTTY means "Inappropriate ioctl for device". This is what the kernel
returns on unknown ioctls, what qemu is trying to express and what
userspace is prepared to handle.

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98c8..c5955313a063 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5747,7 +5747,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
         if (ie->target_cmd == 0) {
             qemu_log_mask(
                 LOG_UNIMP, "Unsupported ioctl: cmd=0x%04lx\n", (long)cmd);
-            return -TARGET_ENOSYS;
+            return -TARGET_ENOTTY;
         }
         if (ie->target_cmd == cmd)
             break;
@@ -5759,7 +5759,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
     } else if (!ie->host_cmd) {
         /* Some architectures define BSD ioctls in their headers
            that are not implemented in Linux.  */
-        return -TARGET_ENOSYS;
+        return -TARGET_ENOTTY;
     }
 
     switch(arg_type[0]) {
@@ -5817,7 +5817,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
         qemu_log_mask(LOG_UNIMP,
                       "Unsupported ioctl type: cmd=0x%04lx type=%d\n",
                       (long)cmd, arg_type[0]);
-        ret = -TARGET_ENOSYS;
+        ret = -TARGET_ENOTTY;
         break;
     }
     return ret;

base-commit: a14b8206c5edcbbad1c71256ea9b44c3b382a9f5
-- 
2.40.1


