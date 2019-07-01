Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FEC5213A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 05:23:27 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfc3K-0001t4-Jk
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 23:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <colin.xu@intel.com>) id 1hfc21-00012O-RA
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 23:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <colin.xu@intel.com>) id 1hfc20-0002V8-PL
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 23:22:05 -0400
Received: from mga18.intel.com ([134.134.136.126]:49794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <colin.xu@intel.com>) id 1hfc20-0002El-HF
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 23:22:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 20:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,413,1557212400"; d="scan'208";a="172208174"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.21])
 by orsmga002.jf.intel.com with ESMTP; 24 Jun 2019 20:21:45 -0700
From: Colin Xu <colin.xu@intel.com>
To: qemu-devel@nongnu.org,
	berrange@redhat.com,
	kraxel@redhat.com
Date: Tue, 25 Jun 2019 11:21:42 +0800
Message-Id: <20190625032142.13854-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH] ui: Correct icon install path
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
Cc: colin.xu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The double slash in path will fail the installation on MINGW/MSYS.

Fixes: a8260d387638 (ui: install logo icons to $prefix/share/icons)

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index cfb18f152544..562205be290c 100644
--- a/Makefile
+++ b/Makefile
@@ -875,19 +875,19 @@ ifneq ($(DESCS),)
 	done
 endif
 	for s in $(ICON_SIZES); do \
-		mkdir -p "$(DESTDIR)/$(qemu_icondir)/hicolor/$${s}/apps"; \
+		mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/$${s}/apps"; \
 		$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu_$${s}.png \
-			"$(DESTDIR)/$(qemu_icondir)/hicolor/$${s}/apps/qemu.png"; \
+			"$(DESTDIR)$(qemu_icondir)/hicolor/$${s}/apps/qemu.png"; \
 	done; \
-	mkdir -p "$(DESTDIR)/$(qemu_icondir)/hicolor/32x32/apps"; \
+	mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/32x32/apps"; \
 	$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu_32x32.bmp \
-		"$(DESTDIR)/$(qemu_icondir)/hicolor/32x32/apps/qemu.bmp"; \
-	mkdir -p "$(DESTDIR)/$(qemu_icondir)/hicolor/scalable/apps"; \
+		"$(DESTDIR)$(qemu_icondir)/hicolor/32x32/apps/qemu.bmp"; \
+	mkdir -p "$(DESTDIR)$(qemu_icondir)/hicolor/scalable/apps"; \
 	$(INSTALL_DATA) $(SRC_PATH)/ui/icons/qemu.svg \
-		"$(DESTDIR)/$(qemu_icondir)/hicolor/scalable/apps/qemu.svg"
-	mkdir -p "$(DESTDIR)/$(qemu_desktopdir)"
+		"$(DESTDIR)$(qemu_icondir)/hicolor/scalable/apps/qemu.svg"
+	mkdir -p "$(DESTDIR)$(qemu_desktopdir)"
 	$(INSTALL_DATA) $(SRC_PATH)/ui/qemu.desktop \
-		"$(DESTDIR)/$(qemu_desktopdir)/qemu.desktop"
+		"$(DESTDIR)$(qemu_desktopdir)/qemu.desktop"
 ifdef CONFIG_GTK
 	$(MAKE) -C po $@
 endif
-- 
2.22.0


