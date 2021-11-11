Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ED344D59E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:13:01 +0100 (CET)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml80q-0006Q2-Am
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tW-0002b1-51
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:26 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:34435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tS-0001Nw-Df
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:25 -0500
Received: from quad ([82.142.28.210]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7Qkv-1mdRKl3U6f-017pun; Thu, 11
 Nov 2021 12:05:11 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] linux-user: Always use flexible arrays for dirent d_name
Date: Thu, 11 Nov 2021 12:05:02 +0100
Message-Id: <20211111110504.1574242-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111110504.1574242-1-laurent@vivier.eu>
References: <20211111110504.1574242-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y7N1/nm7yO02QgfWbhhUhL4aYf/7Q8jdUY37z1DheT+OjE5Y0al
 hKn9m1LmI+J2HmS5fayEO8bKblA/FfOvM4akdbTxKw9uwpVJB8X1u4QJT8sqf/2KjF4UXiw
 fE+h0s5QeaipsMZ+sd32DUfPGmn3gRLByV/HDxqKt+HLXI37DkOYMRgapgVLO+8NJ01pRQo
 9C0B4oib7BTlHmZQF1SDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gVWWFhXmH2s=:oIEwGSh7Bu9h44Iag04vSA
 3ZV4SFjkxBo8WhyCBY+jEM46UWIB8uLRJcrOI9xViYqRqfyQTENDETFnFDHjT73vFhQWN/tCM
 +fhUjIQsRgnwGK2uQU8c0cZbT3qxhCkNe9ddeaeRROxg7vOHBFGa+csnIWfrjlvjYqpzhr51O
 XvljRKLRvcIRg9LCVBuxhpejUqlcGMeeScySMwlei5uAU9ElcOuY7eLYldJTWXrwSsUkoqoLo
 3pvcGTAqxU7AoUmILwN4p8n2516xoYNgTZT20IkKXvnZiWqFt0FrlB9boNqG57l5Dv8HPSPyN
 9ZSBI1xVxN+WPxV2GL6rHe2H65RwjLx0CHWrmJ6mVQl6GB4htCUx83zeoZbIM1OvNuxwpAkEt
 NkEyVWKvgsIBz2mRaL8hzIuHm4G6/ZUtFIYxld+QhuubWZoiyQv2a1y09nDX/dDou9Jm+12sU
 M0D2+IlcSdj+ZDPPcpVkvihzj4OV4CA1HRRnte6TPHNtpJc8ScOLwaBUgnkhyj5MPxbFTXdyk
 kMEbq5fbPosWwYIoXL8hURRay3mmiVDxOBCapEff4ztlmaSoczy8m0lZkx8xN/x8xJMA0l4iT
 XCuFsRQAs8IYmTLBILTgDg/WVQAkEnq0cWaQSpLOyHwsI6IaJm2RRb/GaXXL1kciyobymAnG1
 JNdgprHLqWil1opcPWNLCQtAhqhF/KU4A4Tlr6nNpXBjdzk5+0KIzaSrO2CXwNIH2Hw4=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reviewed by: Warner Losh <imp@bsdimp.com>
Message-Id: <20211107124845.1174791-3-richard.henderson@linaro.org>
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


