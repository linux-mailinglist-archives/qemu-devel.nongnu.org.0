Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB650664C1F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIkH-00087b-Ob; Tue, 10 Jan 2023 12:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFIkF-00086q-FO
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFIkD-0003w8-OX
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673372944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0R9c36dUPkxVfUdC6xt18GAxmAgzKuQk+BRV0TpVB1c=;
 b=EjJZiYUA3NnB8gpvcAxOOboDdQpBL0VIaxzhg37afk1Pi+eZiNmPBjEHlHgsxU4DL0JS+p
 cciQmm2zMu0wDfddsIaNMMSnimhm5FS4F45RRhDAm2ZNVVoqeltZUZDIETpPrM2rd59/tZ
 vQ3EFxzCGR1I7GgOisf1pVsfzyLBrAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-gEk_rHA4MoSXcxY0wq72xg-1; Tue, 10 Jan 2023 12:49:02 -0500
X-MC-Unique: gEk_rHA4MoSXcxY0wq72xg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 586CB101A52E;
 Tue, 10 Jan 2023 17:49:02 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21723492C18;
 Tue, 10 Jan 2023 17:49:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] Revert "linux-user: fix compat with glibc >= 2.36
 sys/mount.h"
Date: Tue, 10 Jan 2023 12:49:01 -0500
Message-Id: <20230110174901.2580297-3-berrange@redhat.com>
In-Reply-To: <20230110174901.2580297-1-berrange@redhat.com>
References: <20230110174901.2580297-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.

glibc has fixed (in 2.36.9000-40-g774058d729) the problem
that caused a clash when both sys/mount.h annd linux/mount.h
are included, and backported this to the 2.36 stable release
too:

  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E

It is saner for QEMU to remove the workaround it applied for
glibc 2.36 and expect distros to ship the 2.36 maint release
with the fix. This avoids needing to add a further workaround
to QEMU to deal with the fact that linux/brtfs.h now also pulls
in linux/mount.h via linux/fs.h since Linux 6.1

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 linux-user/syscall.c | 18 ------------------
 meson.build          |  2 --
 2 files changed, 20 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9c1e9555e1..f2b7634f5e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -95,25 +95,7 @@
 #include <linux/soundcard.h>
 #include <linux/kd.h>
 #include <linux/mtio.h>
-
-#ifdef HAVE_SYS_MOUNT_FSCONFIG
-/*
- * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
- * which in turn prevents use of linux/fs.h. So we have to
- * define the constants ourselves for now.
- */
-#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
-#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
-#define FS_IOC_GETVERSION              _IOR('v', 1, long)
-#define FS_IOC_SETVERSION              _IOW('v', 2, long)
-#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
-#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
-#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
-#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
-#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
-#else
 #include <linux/fs.h>
-#endif
 #include <linux/fd.h>
 #if defined(CONFIG_FIEMAP)
 #include <linux/fiemap.h>
diff --git a/meson.build b/meson.build
index 175517eafd..32fed7ea6e 100644
--- a/meson.build
+++ b/meson.build
@@ -2039,8 +2039,6 @@ config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_IPPROTO_MPTCP',
                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
-config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
-                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
-- 
2.38.1


