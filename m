Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E728FA12
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 22:23:41 +0200 (CEST)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT9mm-0000Cz-DW
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 16:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kT9i8-00063u-9g
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 16:18:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:50074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brogers@suse.com>) id 1kT9i6-0002N3-EL
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 16:18:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1602793128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4HtzFJRkfe8OGiWU/xw7N43AKW2nDUxr+HBh77KufNs=;
 b=oTaOZAUBZHeyyWsHJ0N+X2Q+rZ3omU/EVStbAJ9YaXhkfRiU0vdOK3lM0kAGt6VDV7nmfO
 Yefo+WUzgnT1vScK7gSp7IYKwqnvtkeBMegXtRcnyEPK2JWOuZshm84MoUOYoTQgiYZwOw
 Y/uRN1JDr/cnVPD4ubD1e+3hvwuIYR4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5D8AAD87;
 Thu, 15 Oct 2020 20:18:48 +0000 (UTC)
From: Bruce Rogers <brogers@suse.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Only install icons and qemu.desktop if have_system
Date: Thu, 15 Oct 2020 14:18:40 -0600
Message-Id: <20201015201840.282956-1-brogers@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=brogers@suse.com;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, kraxel@redhat.com,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These files are not needed for a linux-user only install.

Signed-off-by: Bruce Rogers <brogers@suse.com>
---
 ui/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ui/meson.build b/ui/meson.build
index 78ad792ffb..fb36d305ca 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -113,8 +113,11 @@ if have_system or xkbcommon.found()
 endif
 
 subdir('shader')
-subdir('icons')
 
-install_data('qemu.desktop', install_dir: config_host['qemu_desktopdir'])
+if have_system
+  subdir('icons')
+
+  install_data('qemu.desktop', install_dir: config_host['qemu_desktopdir'])
+endif
 
 modules += {'ui': ui_modules}
-- 
2.28.0


