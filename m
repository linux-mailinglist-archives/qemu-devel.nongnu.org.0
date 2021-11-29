Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2155246178B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:07:50 +0100 (CET)
Received: from localhost ([::1]:60130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhJs-0004WG-MS
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mrhHK-0001ds-D4
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:05:10 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mrhHC-0005TG-E6
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:05:09 -0500
Received: from quad ([82.142.5.50]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPosX-1nEQxd1ypH-00MuyU; Mon, 29
 Nov 2021 15:04:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] linux-user: implement more loop ioctls
Date: Mon, 29 Nov 2021 15:04:56 +0100
Message-Id: <20211129140456.604255-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211129140456.604255-1-laurent@vivier.eu>
References: <20211129140456.604255-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:afm6a/KH+0nFX1fnMjTMWv9X5bwRZSAk5KgLwdZL2lo7DV3HISk
 n/+vmKi8AgLGZET7XSZJrQnNW7gQPhTOkkIH44lGhiinbkbztMELvf8pQFvMPRlEyCx6yhd
 Y/jCDfDkQzCV4s5qO0BAhxNPVEcw9TaYibNGbNX62NpALc1XkY6TAUuLV9qVcLqQGnJlWBh
 ubwAeKpN3/jzDGO4wJBlg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9RBGuViiog0=:Ugr5UwihO0G7hob/4lOvH/
 aYirLU60l+3apNhSVV18f3JZYF0fUQ9XmoUVSTuTt1L0JkUBrCfbFysOea26cBxSkuKxVnAn5
 JLoIH5P3mzLKCLYxJL2PIyDzNLKAD32JHpMMpQha+0Pc5H7C9EsYAxb8jxvTNm3ttopPl9M7h
 xPLykyfhggBk8eCIrvtcmgpDWK4OkChphS67CyIxntJqRV5wqIY4917IqgGilkvMMEl0qZpP1
 xddspe9y4D0PRXEvADc6sNi3iGpxNL+czj5FzZPX/lM0dtKNT8tXqiYDQRGdau+mgWw3vKlXS
 wJISd4s6YBZWtGgyWbE6OSC6IzQsyCrhKc9J6B8w08Opk+XbQXF76HEGs6l7jQSmc3wxTs2zR
 OwZLO7QUu6JiAOtaztOd8lF8a1Y0Q/JVkXTnkHX93bAiCk0+JNikoJRKq1JzL1I28Ha1XfFoX
 9Gbl6gi1BKJ/Z3AVtcIp8tXX8F/2A0N9M+pMYayCG3QJ3rNGRVlTWtD+DPwP+YWd7v1mnEcO9
 LBvvX1ye/iSBsGY5mTrbprqxIUnY42oP/gJQc5GelBOKNtQmtrgj+CFhLh2Uven/uCCLS5bmf
 hCZDSb3KBZ7mR2wgcS/ACrNFB4Xk4ySSrALTSplKw6enXVTxvZ9F38Lb5r9gGtsvx2BEpksJC
 J8ZcZn0QK7TndjHguR7h3+0VaZTuLo1gaIsgPeociOWtFsNrPWbRYT1ezBG53IRkDsOE=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Andreas Schwab <schwab@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Schwab <schwab@suse.de>

LOOP_CONFIGURE is now used by losetup, and it cannot cope with ENOSYS.

Signed-off-by: Andreas Schwab <schwab@suse.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <mvmtug4mbfx.fsf_-_@suse.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h        | 4 ++++
 linux-user/linux_loop.h    | 2 ++
 linux-user/syscall_defs.h  | 4 ++++
 linux-user/syscall_types.h | 6 ++++++
 4 files changed, 16 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 7193c3b2269a..f182d40190ed 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -637,6 +637,10 @@
   IOCTL(LOOP_SET_STATUS64, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
   IOCTL(LOOP_GET_STATUS64, IOC_R, MK_PTR(MK_STRUCT(STRUCT_loop_info64)))
   IOCTL(LOOP_CHANGE_FD, 0, TYPE_INT)
+  IOCTL(LOOP_SET_CAPACITY, 0, TYPE_INT)
+  IOCTL(LOOP_SET_DIRECT_IO, 0, TYPE_INT)
+  IOCTL(LOOP_SET_BLOCK_SIZE, 0, TYPE_INT)
+  IOCTL(LOOP_CONFIGURE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_loop_config)))
 
   IOCTL(LOOP_CTL_ADD, 0, TYPE_INT)
   IOCTL(LOOP_CTL_REMOVE, 0, TYPE_INT)
diff --git a/linux-user/linux_loop.h b/linux-user/linux_loop.h
index c69fea11e4e1..f80b96f1ff92 100644
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
index 41aaafbac12c..0b139759377b 100644
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
index ba2c1518eb5c..c3b43f80223a 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -201,6 +201,12 @@ STRUCT(loop_info64,
        MK_ARRAY(TYPE_CHAR, 32),  /* lo_encrypt_key */
        MK_ARRAY(TYPE_ULONGLONG, 2))  /* lo_init */
 
+STRUCT(loop_config,
+       TYPE_INT,                 /* fd */
+       TYPE_INT,                 /* block_size */
+       MK_STRUCT(STRUCT_loop_info64), /* info */
+       MK_ARRAY(TYPE_ULONGLONG, 8)) /* __reserved */
+
 /* mag tape ioctls */
 STRUCT(mtop, TYPE_SHORT, TYPE_INT)
 STRUCT(mtget, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG, TYPE_LONG,
-- 
2.31.1


