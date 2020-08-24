Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B375250185
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 17:53:13 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAEmW-0002xj-MT
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 11:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kAElj-0002Wb-CO
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 11:52:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:58838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kAElh-00084M-5d
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 11:52:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10F67AF0F;
 Mon, 24 Aug 2020 15:52:50 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Fix meson build with --enable-libdaxctl
Date: Mon, 24 Aug 2020 09:52:12 -0600
Message-Id: <20200824155212.789568-1-brogers@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 01:06:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The daxctl library needs to be linked against when daxctl is asked for
in configure.

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 configure   | 1 +
 meson.build | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 67832e3bab..15de7d10de 100755
--- a/configure
+++ b/configure
@@ -7488,6 +7488,7 @@ fi
 
 if test "$libdaxctl" = "yes" ; then
   echo "CONFIG_LIBDAXCTL=y" >> $config_host_mak
+  echo "LIBDAXCTL_LIBS=$libdaxctl_libs" >> $config_host_mak
 fi
 
 if test "$bochs" = "yes" ; then
diff --git a/meson.build b/meson.build
index df5bf728b5..0a24e5c31a 100644
--- a/meson.build
+++ b/meson.build
@@ -380,6 +380,10 @@ if 'CONFIG_LIBPMEM' in config_host
   libpmem = declare_dependency(compile_args: config_host['LIBPMEM_CFLAGS'].split(),
                                link_args: config_host['LIBPMEM_LIBS'].split())
 endif
+libdaxctl = not_found
+if 'CONFIG_LIBDAXCTL' in config_host
+  libdaxctl = declare_dependency(link_args: config_host['LIBDAXCTL_LIBS'].split())
+endif
 
 # Create config-host.h
 
@@ -786,7 +790,7 @@ common_ss.add(files('cpus-common.c'))
 
 subdir('softmmu')
 
-specific_ss.add(files('disas.c', 'exec.c', 'gdbstub.c'), capstone, libpmem)
+specific_ss.add(files('disas.c', 'exec.c', 'gdbstub.c'), capstone, libpmem, libdaxctl)
 specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
-- 
2.28.0


