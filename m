Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA0324D35E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:58:41 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94kq-00044w-MH
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dz-0002VJ-8g
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dt-0001g3-5W
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbjgUHxDhESnyZVM93MyRZhf9Wi5VLrZrYcvgXsIMXQ=;
 b=NFtWW5fUqk0Mx1Axw9XHyZ2NwH19fWl1iGcKOOb8CpduRIu3PM9lboLtvMw3onipbdR8PV
 lIFb7rFoAf5j1GXVYN/XbhhQCE+OEI8cRzFg59i1o4InIZPJTRTYoYZJ8hu0Q3aRYpoTv6
 2WjeQvbPnyY+BMu2By2sHtodpM8yXsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-v3xBmNDuPhWIqKfHh-IOXw-1; Fri, 21 Aug 2020 06:24:34 -0400
X-MC-Unique: v3xBmNDuPhWIqKfHh-IOXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C21CD191E2A0
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 736BC5C1D7;
 Fri, 21 Aug 2020 10:24:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 076/152] meson: convert dump/
Date: Fri, 21 Aug 2020 06:22:13 -0400
Message-Id: <20200821102329.29777-77-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs      | 3 +--
 Makefile.target    | 1 -
 configure          | 4 ++++
 dump/Makefile.objs | 3 ---
 dump/meson.build   | 4 ++++
 meson.build        | 9 +++++++++
 6 files changed, 18 insertions(+), 6 deletions(-)
 delete mode 100644 dump/Makefile.objs
 create mode 100644 dump/meson.build

diff --git a/Makefile.objs b/Makefile.objs
index ec15ebc4b4..6657a6cce3 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -48,8 +48,7 @@ storage-daemon-obj-$(CONFIG_POSIX) += os-posix.o
 # single QEMU executable should support all CPUs and machines.
 
 ifeq ($(CONFIG_SOFTMMU),y)
-common-obj-y = dump/
-common-obj-y += monitor/
+common-obj-y = monitor/
 common-obj-y += net/
 common-obj-$(CONFIG_LINUX) += fsdev/
 
diff --git a/Makefile.target b/Makefile.target
index 5f926e5bfa..c8f7a6c04b 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -156,7 +156,6 @@ endif #CONFIG_BSD_USER
 ifdef CONFIG_SOFTMMU
 obj-y += softmmu/
 obj-y += gdbstub.o
-obj-y += dump/
 obj-y += hw/
 obj-y += monitor/
 obj-y += qapi/
diff --git a/configure b/configure
index a90dfc964b..ed8c212279 100755
--- a/configure
+++ b/configure
@@ -2616,6 +2616,7 @@ int main(void) { lzo_version(); return 0; }
 EOF
     if compile_prog "" "-llzo2" ; then
         libs_softmmu="$libs_softmmu -llzo2"
+        lzo_libs="-llzo2"
         lzo="yes"
     else
         if test "$lzo" = "yes"; then
@@ -2635,6 +2636,7 @@ int main(void) { snappy_max_compressed_length(4096); return 0; }
 EOF
     if compile_prog "" "-lsnappy" ; then
         libs_softmmu="$libs_softmmu -lsnappy"
+        snappy_libs='-lsnappy'
         snappy="yes"
     else
         if test "$snappy" = "yes"; then
@@ -7464,10 +7466,12 @@ fi
 
 if test "$lzo" = "yes" ; then
   echo "CONFIG_LZO=y" >> $config_host_mak
+  echo "LZO_LIBS=$lzo_libs" >> $config_host_mak
 fi
 
 if test "$snappy" = "yes" ; then
   echo "CONFIG_SNAPPY=y" >> $config_host_mak
+  echo "SNAPPY_LIBS=$snappy_libs" >> $config_host_mak
 fi
 
 if test "$bzip2" = "yes" ; then
diff --git a/dump/Makefile.objs b/dump/Makefile.objs
deleted file mode 100644
index d2a5db3b81..0000000000
--- a/dump/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-y += dump.o
-common-obj-y += dump-hmp-cmds.o
-obj-$(TARGET_X86_64) += win_dump.o
diff --git a/dump/meson.build b/dump/meson.build
new file mode 100644
index 0000000000..2eff29c3ea
--- /dev/null
+++ b/dump/meson.build
@@ -0,0 +1,4 @@
+softmmu_ss.add(files('dump-hmp-cmds.c'))
+
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
+specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'], if_true: files('win_dump.c'))
diff --git a/meson.build b/meson.build
index 442855daef..6d5eb31dcf 100644
--- a/meson.build
+++ b/meson.build
@@ -300,6 +300,14 @@ if 'CONFIG_FDT' in config_host
   fdt = declare_dependency(compile_args: config_host['FDT_CFLAGS'].split(),
                            link_args: config_host['FDT_LIBS'].split())
 endif
+snappy = not_found
+if 'CONFIG_SNAPPY' in config_host
+  snappy = declare_dependency(link_args: config_host['SNAPPY_LIBS'].split())
+endif
+lzo = not_found
+if 'CONFIG_LZO' in config_host
+  lzo = declare_dependency(link_args: config_host['LZO_LIBS'].split())
+endif
 
 create_config = find_program('scripts/create_config')
 minikconf = find_program('scripts/minikconf.py')
@@ -607,6 +615,7 @@ subdir('io')
 subdir('chardev')
 subdir('fsdev')
 subdir('target')
+subdir('dump')
 
 block_ss.add(files(
   'block.c',
-- 
2.26.2



