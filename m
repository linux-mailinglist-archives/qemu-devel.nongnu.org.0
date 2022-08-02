Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5558806F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 18:43:36 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIuzX-0006EI-RH
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 12:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIuxj-0004mG-QB
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 12:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIuxe-0001GA-9Z
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 12:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659458497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NFn4axHXGhzmAR2NasIlV3E/dmsNe21z35BAjyTBz/I=;
 b=T0KBtLcy2PVgOp0xypvze+98HT151SFpvw+Lne+CaLPUp+0Es/FuHWijG9xFKpDQfRwfiG
 e0gCR6RQOtPS8U5IGyDOGnHXP58MKjg1bwR3gb62RVufBfaX6ehvB6/y0GqIWp4MNKEJJQ
 r3OBO8VS9H2TzBKL8+jYKWxsT/hSwnw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-miGq_iyAMVqmHHbeqLbNNw-1; Tue, 02 Aug 2022 12:41:35 -0400
X-MC-Unique: miGq_iyAMVqmHHbeqLbNNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B61891032965;
 Tue,  2 Aug 2022 16:41:34 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EE801121315;
 Tue,  2 Aug 2022 16:41:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH for 7.1] linux-user: fix compat with glibc >= 2.36 sys/mount.h
Date: Tue,  2 Aug 2022 12:41:34 -0400
Message-Id: <20220802164134.1851910-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
---
 linux-user/syscall.c | 18 ++++++++++++++++++
 meson.build          |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b27a6552aa..52d178afe7 100644
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
index 294e9a8f32..30a380752c 100644
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


