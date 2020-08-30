Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE202257092
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 22:47:51 +0200 (CEST)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCUEw-0005Ox-UJ
	for lists+qemu-devel@lfdr.de; Sun, 30 Aug 2020 16:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kCUDz-0004ff-Mx
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:46:52 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43540
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kCUDx-0004mU-CO
 for qemu-devel@nongnu.org; Sun, 30 Aug 2020 16:46:51 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 4AFD9DB1EC7;
 Sun, 30 Aug 2020 22:46:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id lyANFU9HYvyy; Sun, 30 Aug 2020 22:46:44 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id A7F7DDAC2DE;
 Sun, 30 Aug 2020 22:46:44 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 75FC0460018; Sun, 30 Aug 2020 22:46:44 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] meson: add pixman dependency to chardev/baum module
Date: Sun, 30 Aug 2020 22:46:40 +0200
Message-Id: <20200830204640.482214-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 16:46:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---


Together with Paolo's patch (https://patchwork.kernel.org/patch/11745207/)
this fixed the build with --enable-modules for me.

Stefan


 chardev/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/chardev/meson.build b/chardev/meson.build
index 7726837e34..27a9a28f4c 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -38,7 +38,7 @@ chardev_modules = {}
 
 if config_host.has_key('CONFIG_BRLAPI') and sdl.found()
   module_ss = ss.source_set()
-  module_ss.add(when: [sdl, brlapi], if_true: files('baum.c'))
+  module_ss.add(when: [sdl, brlapi], if_true: [files('baum.c'), pixman])
   chardev_modules += { 'baum': module_ss }
 endif
 
-- 
2.28.0


