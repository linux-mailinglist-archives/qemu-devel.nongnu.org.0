Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9D2B6E0D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:08:36 +0100 (CET)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6LD-0006He-8n
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kf6KG-0005Sj-Sd
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:07:36 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:50206
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1kf6KD-0005Ux-P2
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:07:36 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 04EB7DB2587;
 Tue, 17 Nov 2020 20:07:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id M1CFy4Wk9CY7; Tue, 17 Nov 2020 20:06:43 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 738C2DB2579;
 Tue, 17 Nov 2020 20:06:43 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 1F9C8460019; Tue, 17 Nov 2020 20:06:43 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH for-5.2] meson: Fix argument for makensis (build regression)
Date: Tue, 17 Nov 2020 20:06:40 +0100
Message-Id: <20201117190640.390359-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 14:07:30
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

`make installer` with a DLL directory was broken.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/nsis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index e1c409344e..5135a05831 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -65,7 +65,7 @@ def main():
             dlldir = "w64"
             makensis += ["-DW64"]
         if os.path.exists(os.path.join(args.srcdir, "dll")):
-            makensis += "-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)
+            makensis += ["-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)]
 
         makensis += ["-DOUTFILE=" + args.outfile] + args.nsisargs
         subprocess.run(makensis)
-- 
2.29.2


