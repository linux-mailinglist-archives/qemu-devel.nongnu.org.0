Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621CB459016
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:20:03 +0100 (CET)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAAs-0002r8-8R
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1mpA9s-000294-Fu
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:19:00 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:43266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1mpA9q-000159-Ei
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:19:00 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 89EC4218E1;
 Mon, 22 Nov 2021 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637590735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=2Uuw5cqvZjl38rwK4JcJH2l/oOs/NiqCxhHun0+xmkM=;
 b=qUisFzKG9authrwuqrYG/M9dou0PgGlpqNUJCqKXrzwR73r3QXW8ZzLbnC9bke4Srt1mbm
 N8BtlPdqqg16iDYZ7CYYspB4BcFm6wN/HRRYsBBslUEejcputQUs/aXd49Xxn1C+fFqkE1
 L266evFcU5M3rjUJYFiRHsZl2m9RyJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637590735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=2Uuw5cqvZjl38rwK4JcJH2l/oOs/NiqCxhHun0+xmkM=;
 b=Me40jfsBo02RCmr2QCuF/BKHKb+qFz1V0zMYSRE+X3s33quhmqhm/XggE3mi52SGcb3mvx
 IBNRoCKVWvWE1kAg==
Received: from hawking.suse.de (hawking.suse.de [10.160.4.0])
 by relay2.suse.de (Postfix) with ESMTP id 839C6A3B8D;
 Mon, 22 Nov 2021 14:18:55 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
 id 6D4E9446B2C; Mon, 22 Nov 2021 15:18:55 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: implement more loop ioctls
X-Yow: What I want to find out is -- do parrots know much about Astro-Turf?
Date: Mon, 22 Nov 2021 15:18:55 +0100
Message-ID: <mvmzgpwmfxs.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=schwab@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LOOP_CONFIGURE is now used by losetup, and it cannot cope with ENOSYS.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 linux-user/ioctls.h        | 4 ++++
 linux-user/linux_loop.h    | 2 ++
 linux-user/syscall_defs.h  | 4 ++++
 linux-user/syscall_types.h | 6 ++++++
 4 files changed, 16 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 7193c3b226..5ac5efc8aa 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -637,6 +637,10 @@
   IOCTL(LOOP_SET_STATUS64, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
   IOCTL(LOOP_GET_STATUS64, IOC_R, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
   IOCTL(LOOP_CHANGE_FD, 0, TYPE_INT)
+  IOCTL(LOOP_SET_CAPACITY, 0, TYPE_INT)
+  IOCTL(LOOP_SET_DIRECT_IO, 0, TYPE_INT)
+  IOCTL(LOOP_SET_BLOCK_SIZE, 0, TYPE_INT)
+  IOCTL(LOOP_CONFIGURE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_configure)))
 
   IOCTL(LOOP_CTL_ADD, 0, TYPE_INT)
   IOCTL(LOOP_CTL_REMOVE, 0, TYPE_INT)
diff --git a/linux-user/linux_loop.h b/linux-user/linux_loop.h
index c69fea11e4..f80b96f1ff 100644
--- a/linux-user/linux_loop.h
+++ b/linux-user/linux_loop.h
@@ -96,6 +96,8 @@ struct loop_info64 {
 #define LOOP_CHANGE_FD		0x4C06
 #define LOOP_SET_CAPACITY       0x4C07
 #define LOOP_SET_DIRECT_IO      0x4C08
+#define LOOP_SET_BLOCK_SIZE     0x4C09
+#define LOOP_CONFIGURE          0x4C0A
 
 /* /dev/loop-control interface */
 #define LOOP_CTL_ADD            0x4C80
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487dcc..560a29afd8 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1219,6 +1219,10 @@ struct target_rtc_pll_info {
 #define TARGET_LOOP_SET_STATUS64      0x4C04
 #define TARGET_LOOP_GET_STATUS64      0x4C05
 #define TARGET_LOOP_CHANGE_FD         0x4C06
+#define TARGET_LOOP_SET_CAPACITY      0x4C07
+#define TARGET_LOOP_SET_DIRECT_IO     0x4C08
+#define TARGET_LOOP_SET_BLOCK_SIZE    0x4C09
+#define TARGET_LOOP_CONFIGURE         0x4C0A
 
 #define TARGET_LOOP_CTL_ADD           0x4C80
 #define TARGET_LOOP_CTL_REMOVE        0x4C81
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index ba2c1518eb..7c46e4fb25 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -201,6 +201,12 @@ STRUCT(loop_info64,
        MK_ARRAY(TYPE_CHAR, 32),  /* lo_encrypt_key */
        MK_ARRAY(TYPE_ULONGLONG, 2))  /* lo_init */
 
+STRUCT(loop_configure,
+       TYPE_INT,                 /* fd */
+       TYPE_INT,                 /* block_size */
+       MK_STRUCT(STRUCT_loop_info64), /* info */
+       MK_ARRAY(TYPE_ULONGLONG, 8)) /* __reserved */
+
 /* mag tape ioctls */
 STRUCT(mtop, TYPE_SHORT, TYPE_INT)
 STRUCT(mtget, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG,
-- 
2.34.0


