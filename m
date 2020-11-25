Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C262C4824
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 20:23:15 +0100 (CET)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki0Nm-0007MZ-W2
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 14:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1ki0MW-0006uK-MC
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:21:56 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:57624
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1ki0MS-00020v-VB
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:21:55 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 7B203DB2527;
 Wed, 25 Nov 2020 20:21:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 9UQwxnoFKehq; Wed, 25 Nov 2020 20:18:36 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id DF027DA32DA;
 Wed, 25 Nov 2020 20:18:35 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 7494546000F; Wed, 25 Nov 2020 20:18:35 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH for-5.2] nsis: Fix build for 64 bit installer
Date: Wed, 25 Nov 2020 20:18:33 +0100
Message-Id: <20201125191833.964753-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
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

Pass cpu instead of cpu_family to the NSIS installer script.

That script checks for "x86_64" which is the cpu value,
while cpu_family is "x86".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 5062407c70..8a99c948d3 100644
--- a/meson.build
+++ b/meson.build
@@ -1956,7 +1956,7 @@ if host_machine.system() == 'windows'
     '@OUTPUT@',
     get_option('prefix'),
     meson.current_source_dir(),
-    host_machine.cpu_family(),
+    host_machine.cpu(),
     '--',
     '-DDISPLAYVERSION=' + meson.project_version(),
   ]
-- 
2.29.2


