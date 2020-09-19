Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A0270F7F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 18:26:35 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJfh4-0003A3-O2
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 12:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHW-0005bt-Vk
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29853
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHG-0007Rg-R8
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600531192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sF6GCmhcBOBZDVtvRFTVPK1iyHCKqjRrrDEFa+TQhQ=;
 b=aT5A+2MLgDJdCT42KvrWlLzEhyO89drq62Mj8dzAtg9UF0RGcgQD4lbpCtpoY+qh9v3frN
 ksnYLtlzLZpgrHKXFW9bApKWx1mY4GMf0Y6SifWtgFkGR33IwODqe7odj3vruO5Ksdp3ws
 nGDzzV+b1IuF8D0zhF4niUsHUwdcGIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-eXyGRFxdOx6SJfu8-nnx9g-1; Sat, 19 Sep 2020 11:59:50 -0400
X-MC-Unique: eXyGRFxdOx6SJfu8-nnx9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D787C801AAB
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6A4F55770
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/57] oslib-posix: default exec_dir to bindir
Date: Sat, 19 Sep 2020 11:59:02 -0400
Message-Id: <20200919155916.1046398-44-pbonzini@redhat.com>
In-Reply-To: <20200919155916.1046398-1-pbonzini@redhat.com>
References: <20200919155916.1046398-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 11:59:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the exec_dir cannot be retrieved, just assume it's the installation
directory that was specified at configure time.  This makes it simpler
to reason about what the callers will do if they get back an empty
path.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build        |  2 +-
 util/oslib-posix.c | 23 ++++++++---------------
 util/oslib-win32.c |  4 +++-
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/meson.build b/meson.build
index d5ab4bde2b..1f8487eacf 100644
--- a/meson.build
+++ b/meson.build
@@ -566,7 +566,7 @@ config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1]
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-strings = ['HOST_DSOSUF', 'CONFIG_IASL', 'qemu_confdir', 'qemu_datadir',
+strings = ['HOST_DSOSUF', 'CONFIG_IASL', 'bindir', 'qemu_confdir', 'qemu_datadir',
            'qemu_moddir', 'qemu_localstatedir', 'qemu_helperdir', 'qemu_localedir',
            'qemu_icondir', 'qemu_desktopdir', 'qemu_firmwarepath']
 foreach k, v: config_host
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 0dd8d24076..ce44380f09 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -358,15 +358,14 @@ void qemu_set_tty_echo(int fd, bool echo)
     tcsetattr(fd, TCSANOW, &tty);
 }
 
-static char exec_dir[PATH_MAX];
+static const char *exec_dir;
 
 void qemu_init_exec_dir(const char *argv0)
 {
-    char *dir;
     char *p = NULL;
     char buf[PATH_MAX];
 
-    if (exec_dir[0]) {
+    if (exec_dir) {
         return;
     }
 
@@ -425,20 +424,14 @@ void qemu_init_exec_dir(const char *argv0)
 #endif
     /* If we don't have any way of figuring out the actual executable
        location then try argv[0].  */
-    if (!p) {
-        if (!argv0) {
-            return;
-        }
+    if (!p && argv0) {
         p = realpath(argv0, buf);
-        if (!p) {
-            return;
-        }
     }
-    dir = g_path_get_dirname(p);
-
-    pstrcpy(exec_dir, sizeof(exec_dir), dir);
-
-    g_free(dir);
+    if (p) {
+        exec_dir = g_path_get_dirname(p);
+    } else {
+        exec_dir = CONFIG_BINDIR;
+    }
 }
 
 const char *qemu_get_exec_dir(void)
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 1a33912944..051afb217b 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -315,7 +315,7 @@ void qemu_set_tty_echo(int fd, bool echo)
     }
 }
 
-static char *exec_dir;
+static const char *exec_dir;
 
 void qemu_init_exec_dir(const char *argv0)
 {
@@ -341,6 +341,8 @@ void qemu_init_exec_dir(const char *argv0)
     *p = 0;
     if (access(buf, R_OK) == 0) {
         exec_dir = g_strdup(buf);
+    } else {
+        exec_dir = CONFIG_BINDIR;
     }
 }
 
-- 
2.26.2



