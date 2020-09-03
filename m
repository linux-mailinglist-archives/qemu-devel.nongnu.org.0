Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBD25C577
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 17:34:09 +0200 (CEST)
Received: from localhost ([::1]:53868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDrFY-0001LU-5s
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 11:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kDrBe-0005Gp-51
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:30:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:57620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kDrBc-0000hz-0J
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:30:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B9C9AD7A;
 Thu,  3 Sep 2020 15:29:51 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: remove linkage of sdl to baum
Date: Thu,  3 Sep 2020 09:29:33 -0600
Message-Id: <20200903152933.97838-1-brogers@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:06:01
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
Cc: pbonzini@redhat.com, Bruce Rogers <brogers@suse.com>, f4bug@amsat.org,
 samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ever since commit 537fe2d63f744e7c96ff45b60d09486a81958e06 there
has been a 'linkage' to sdl for compiling baum.c. Originally it
had to do with including sdl cflags for any file including sdl
headers. There is no longer any such need for baum.c, but the
association has persisted in the make system, and with the switch
to meson it has now become a hard requirement, which now causes
chardev-baum.so to not be produced if sdl is not configured.
Remove this bogus linkage.

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 chardev/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/meson.build b/chardev/meson.build
index 27a9a28f4c..54e88d0310 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -36,9 +36,9 @@ softmmu_ss.add(when: ['CONFIG_SPICE', spice], if_true: files('spice.c'))
 
 chardev_modules = {}
 
-if config_host.has_key('CONFIG_BRLAPI') and sdl.found()
+if config_host.has_key('CONFIG_BRLAPI')
   module_ss = ss.source_set()
-  module_ss.add(when: [sdl, brlapi], if_true: [files('baum.c'), pixman])
+  module_ss.add(when: [brlapi], if_true: [files('baum.c'), pixman])
   chardev_modules += { 'baum': module_ss }
 endif
 
-- 
2.28.0


