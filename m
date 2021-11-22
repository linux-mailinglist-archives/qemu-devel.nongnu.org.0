Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5D6458A89
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:27:06 +0100 (CET)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4fJ-00043I-3h
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bf-0001X0-7o
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:22 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:47439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bd-00035B-9b
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:19 -0500
Received: from quad ([82.142.2.234]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MsI8Y-1mUnfO2ePi-00tgid; Mon, 22
 Nov 2021 09:23:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] linux-user: Always use flexible arrays for dirent d_name
Date: Mon, 22 Nov 2021 09:23:07 +0100
Message-Id: <20211122082310.377809-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122082310.377809-1-laurent@vivier.eu>
References: <20211122082310.377809-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5LpdvuPJWcOtcrY42LZkbzOsBSbBZDVTzI/2rMSSjBy4r8Lv3gW
 4rZ3A8RzjGrDX1JB4WtNDu/IFUPjIwhbRucW8aprT0U6rkfxzIsSX3iIspv2qNc/lupGmb9
 ZSwtM94pCYcQ/eZxr6mcvpdmE2L8NXUnrvFKpaa0jFsZIZZ9FS0ENzCzvakdBMqimW4Y1+P
 w6vKyZBeKDvRueeLa/kUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CP6ehPMzv1Q=:KcBQW7QM3/9e3+7nK50l8e
 pPan1fnD9/+3WqS4AoNixmwZ946C/BZcLNyoVHaHu9IHIeuATOpN0fxg4c9nMway7sufq6Jp8
 rmr0vIlFltY0EG/U7X2fa/XhUCJf1OskvekArFLrY1J9MNQnsH8h9kmELy8OU7iEsrOTPI589
 6dUoc555pjMVSG/T7TwxnEU/8vQEvrY9D3XEYg3ivRiV51bqNR0CzXUlf9aRX2XsuyJ4DrXtO
 rgHq3DEkHq64DVXEygFtB4RhK1U2wANG2kIylB9VuxnTh8ymKsbfot9YDY2U9i+k+LuiDxZ+5
 JmTYjo+IRiGTTwbRUzim5kh4ZUbiKD9eptLhZl1lPnBENzKK84+Uso0Xejq9coaPV1Tq1bsM0
 l40c/r+55ESY/vUJrPVcxcWDUdfruIrlAKq8UvHkusqsrYPKHmQ0W/A6TDjZcW4RoTJG5+o0j
 ZmLfNYkt1g0KY5u/GF2jTDLs0WE+qd5h+QLAd8SsGVftjyIXPsW9t5nDSi8NObRQCbRgXYgMm
 3p2goHYWrmFQ2AjdAJ/nvdW+Rpj2hZKVX0bndWkZ740Scgf1F/4nWIf4CiEkUjN2/E+lQsA7l
 a7TKDXLkFKW60V5eEIoiaYSy0WT22YWFFFqMK6wmiBPICrsFjUvhfAL+huOhsZOPAUiIddmsN
 6Xww1PlqlPfg5XxWq6cjJObeL4iYQP19TY2WjzZwLCyJ6Im4Huag676qojpq2CxICjpA=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We currently use a flexible array member for target_dirent,
but use incorrectly fixed length arrays for target_dirent64,
linux_dirent and linux_dirent64.

This requires that we adjust the definition of the VFAT READDIR
ioctls which hard-code the 256 namelen size into the ioctl constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211114103539.298686-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c      | 6 ++++--
 linux-user/syscall_defs.h | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a2f605dec4ca..499415ad81b8 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -197,8 +197,10 @@
 //#define DEBUG_ERESTARTSYS
 
 //#include <linux/msdos_fs.h>
-#define	VFAT_IOCTL_READDIR_BOTH		_IOR('r', 1, struct linux_dirent [2])
-#define	VFAT_IOCTL_READDIR_SHORT	_IOR('r', 2, struct linux_dirent [2])
+#define VFAT_IOCTL_READDIR_BOTH \
+    _IOC(_IOC_READ, 'r', 1, (sizeof(struct linux_dirent) + 256) * 2)
+#define VFAT_IOCTL_READDIR_SHORT \
+    _IOC(_IOC_READ, 'r', 2, (sizeof(struct linux_dirent) + 256) * 2)
 
 #undef _syscall0
 #undef _syscall1
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487dcc38..98b09ee6d656 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -441,7 +441,7 @@ struct target_dirent64 {
 	int64_t		d_off;
 	unsigned short	d_reclen;
 	unsigned char	d_type;
-	char		d_name[256];
+	char		d_name[];
 };
 
 
@@ -2714,7 +2714,7 @@ struct linux_dirent {
     long            d_ino;
     unsigned long   d_off;
     unsigned short  d_reclen;
-    char            d_name[256]; /* We must not include limits.h! */
+    char            d_name[];
 };
 
 struct linux_dirent64 {
@@ -2722,7 +2722,7 @@ struct linux_dirent64 {
     int64_t         d_off;
     unsigned short  d_reclen;
     unsigned char   d_type;
-    char            d_name[256];
+    char            d_name[];
 };
 
 struct target_mq_attr {
-- 
2.31.1


