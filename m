Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BE2427DE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 11:48:06 +0200 (CEST)
Received: from localhost ([::1]:50840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5nMb-0003BR-E9
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 05:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=nna4=bw=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1k5nHV-00027T-K4
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 05:42:49 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:40898
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=nna4=bw=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1k5nHT-0006ke-JE
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 05:42:49 -0400
Received: from MattGorko-Laptop.localdomain (unknown [78.194.154.81])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id 6805C415D0;
 Wed, 12 Aug 2020 11:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1597225366; bh=OwWkOjwGw8qMrqElR6CbRqgks5m18RhNVLutqbUrZ10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lhWDm20zG6hkvgf2ZsA86j8yYTktzX5X2MRqzJacoRgYDj3UACg5LpzasAb+j51YK
 NXCOTWBevVR8SIySVd2yHykmONOULqfJW5KKadOgqF099uOHOMqxNKzI6UHFa7CR3B
 P0uExhTbWloC4PEC22wmR937kA0oa7A+2zHHv8SU=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] hw/usb: Add U2F key build recipe
Date: Wed, 12 Aug 2020 11:41:29 +0200
Message-Id: <20200812094135.20550-8-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812094135.20550-1-cesar.belley@lse.epita.fr>
References: <20200812094135.20550-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=nna4=bw=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 05:42:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
---
 hw/usb/Kconfig       | 5 +++++
 hw/usb/Makefile.objs | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 5e63dc75f8..3fc8fbe3c7 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -96,6 +96,11 @@ config USB_STORAGE_MTP
     default y
     depends on USB
 
+config USB_U2F
+    bool
+    default y
+    depends on USB
+
 config IMX_USBPHY
     bool
     default y
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index e342ff59fa..7842a3175f 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -37,6 +37,13 @@ smartcard.mo-libs := $(SMARTCARD_LIBS)
 endif
 endif
 
+ifeq ($(CONFIG_USB_U2F),y)
+common-obj-y                          += u2f.o u2f-passthru.o
+common-obj-$(CONFIG_U2F)              += u2f-emulated.o
+u2f-emulated.o-cflags = $(U2F_CFLAGS)
+u2f-emulated.o-libs = $(U2F_LIBS)
+endif
+
 ifeq ($(CONFIG_POSIX),y)
 common-obj-$(CONFIG_USB_STORAGE_MTP)  += dev-mtp.o
 endif
-- 
2.28.0


