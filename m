Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00EC58F0D2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 18:57:03 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLp0w-000411-Uc
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 12:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLouo-0008PX-6D
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:50:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:42863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oLouk-0006fp-3o
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 12:50:41 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MmD2M-1ndePJ1Rse-00i9Nu; Wed, 10
 Aug 2022 18:50:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 1/1] linux-user: fix compat with glibc >= 2.36 sys/mount.h
Date: Wed, 10 Aug 2022 18:50:29 +0200
Message-Id: <20220810165029.2497766-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810165029.2497766-1-laurent@vivier.eu>
References: <20220810165029.2497766-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X9JNINtvPVAbUy7EeW5tv2A2BteHXIcK6MAz73ZJ2Lp4rkMaBRu
 E5D8eikhYV3yNEdVvUxRNeiaIl7TDpzaZgShi+q6W1aiGPbQBzAr+VKGUry0snr+U6ofqOT
 ERODG89GgaGVAxrUUbbaBn2U5dAL0/yNkPu1PbMcvYQXIGY+7DDleOdFSxTvsdJeropU6i/
 P7YTD+qW/17tuRbaH5Jiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PJsnB2PK07M=:foRFUrGYY81H79ang9gNyg
 i49vwNBVu7b1ONU2S7RwlZ56VdP9rxVJZ7AUv9dZTMj51vXNcCZwVtK08hS/pSuetIgXNRsI7
 94ZvYTk1s8wzUtCnTChdHeK3l6tATB4dD1O7vG1tgWBcl4P/RTTVfQ0m6H/GsrVha/pi4nC8c
 EZng46mI2PQ5jM6G7jk20URIankDL+jEy2zXm5ZlCQGVlVdqO7fqdcbkt8/Gvt4BTVjvV0kCO
 FtnZGF+bQO1GWPLObJobhL6U/xWBF5hqZE7X3uN4918aoNnJzDJoUEO8wqiwZeb7xM4gbG63T
 kfhcPS4Jzpp6FJr9+6n0gQidmnUVbhQCUvnQmzmgQF55+2O9+p6R1hQRJWaQvprM7FWIex80K
 PkKZFKGoUevQv0Cv3ul+ffEZfja6InQL7ax8TzrKB8CGky/rZ0Ci2B53GN0KGIc618Zd4/zpR
 thCiN8BR8wyt0eUC0/HfZ4hvOdE2KnXdEZC9zZ7tmnMRVCasgSRZ5eVi61zMqbr8K6E3beIxM
 rZGPeFzJiVP/z5kIVDYBRKfN5V6I8nNgOcMIW4j0xSTEWooZNYlB5uPuG1dMJ8yUN9zYYJu/Y
 V2FCcHdcaAfmf3xkcnvA4SbVAl5EJX+6hW3FnIeYU1prjXDlOWU+SFrZwdBzn7w82lk4OaB/Y
 y/3/INFggdDclIXVy5IdK6zCnvwHr4RAhwCwFGqfsLg3Rgzdk1LbGk6RhsHHZamWuHOSLHRFy
 lexycXdOyD2+UDJmvrtyDz+tvEepnJHwNexfdA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The latest glibc 2.36 has extended sys/mount.h so that it
defines the FSCONFIG_* enum constants. These are historically
defined in linux/mount.h, and thus if you include both headers
the compiler complains:

In file included from /usr/include/linux/fs.h:19,
                 from ../linux-user/syscall.c:98:
/usr/include/linux/mount.h:95:6: error: redeclaration of 'enum fsconfig_command'
   95 | enum fsconfig_command {
      |      ^~~~~~~~~~~~~~~~
In file included from ../linux-user/syscall.c:31:
/usr/include/sys/mount.h:189:6: note: originally defined here
  189 | enum fsconfig_command
      |      ^~~~~~~~~~~~~~~~
/usr/include/linux/mount.h:96:9: error: redeclaration of enumerator 'FSCONFIG_SET_FLAG'
   96 |         FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
      |         ^~~~~~~~~~~~~~~~~
/usr/include/sys/mount.h:191:3: note: previous definition of 'FSCONFIG_SET_FLAG' with type 'enum fsconfig_command'
  191 |   FSCONFIG_SET_FLAG       = 0,    /* Set parameter, supplying no value */
      |   ^~~~~~~~~~~~~~~~~
...snip...

QEMU doesn't include linux/mount.h, but it does use
linux/fs.h and thus gets linux/mount.h indirectly.

glibc acknowledges this problem but does not appear to
be intending to fix it in the forseeable future, simply
documenting it as a known incompatibility with no
workaround:

  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
  https://sourceware.org/glibc/wiki/Synchronizing_Headers

To address this requires either removing use of sys/mount.h
or linux/fs.h, despite QEMU needing declarations from
both.

This patch removes linux/fs.h, meaning we have to define
various FS_IOC constants that are now unavailable.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Message-Id: <20220802164134.1851910-1-berrange@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 18 ++++++++++++++++++
 meson.build          |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ef53feb5ab45..f4091212027c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -95,7 +95,25 @@
 #include <linux/soundcard.h>
 #include <linux/kd.h>
 #include <linux/mtio.h>
+
+#ifdef HAVE_SYS_MOUNT_FSCONFIG
+/*
+ * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
+ * which in turn prevents use of linux/fs.h. So we have to
+ * define the constants ourselves for now.
+ */
+#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
+#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
+#define FS_IOC_GETVERSION              _IOR('v', 1, long)
+#define FS_IOC_SETVERSION              _IOW('v', 2, long)
+#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
+#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
+#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
+#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
+#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
+#else
 #include <linux/fs.h>
+#endif
 #include <linux/fd.h>
 #if defined(CONFIG_FIEMAP)
 #include <linux/fiemap.h>
diff --git a/meson.build b/meson.build
index 294e9a8f329e..30a380752c0d 100644
--- a/meson.build
+++ b/meson.build
@@ -1963,6 +1963,8 @@ config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_IPPROTO_MPTCP',
                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
+config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
+                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.37.1


