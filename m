Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C911CE5C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 14:33:23 +0100 (CET)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifOao-00025E-E5
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 08:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyZ-0003px-Ez
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyY-0007B5-9z
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:51 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNyY-00079M-1X
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id y11so2613952wrt.6
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4kIdx5/B7vhPeGSC/yHPjfKMOrsksBPLKlOIGo7xQE=;
 b=Kx7Duzrw63cyTVzGjM9zxolW3DSi15Yg8QS5yAzeOK3kdbFZrgwfjIuAQVrL1/uhbU
 fP6OmUUIOUB9RGa8KwjMn4ErQZlyrTK1h7sjeTJ1rOYExDhtik7/8jloeHm6lh9inSjr
 0CeGoF0mHqwBDJnSRGhqdEe3+XacgWAK+g7J5exKRmzRsJju0kFFxbB8uTbFIwZbh4BD
 NkCD9HBWGxI7wAacKt6tp7dIPSDdv5jGXtpeVB70T82QRjHyJPGg2ET5aFcU+sxroMdV
 A0kYKBE2T7ech3VHwZOLroI6+SpWnaRr1tDZD1wb5+ehzHneg/eGEyoatw4nPnjgN550
 UjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I4kIdx5/B7vhPeGSC/yHPjfKMOrsksBPLKlOIGo7xQE=;
 b=kr4YqYHaJDW9w455+ZOZDvekcUUadCqXJEpHjmGEdh+0FsfEofpqfGftfnMO9YY/sR
 DGZGZEpL7wRkYTrkUMMTDU/xyYVIsFSnRIPxrBQvK8hcZEelH8H78Vl/OdijJIFFCXsG
 n1RFJRu6+vU1GntE/HePmJtP6ZrK3VF4o49l5I0gD37PY91RfQK7GVZecim13+k9O5OZ
 gzqBmgJCLkS3OkQjplPBeiLEDnUK5x50TVVqNMQUGyykdBcZTxgL+EgjLZLxFmqkITbl
 gI4621TPl8SquYdOc1LZy6FcL8LW3PHbTsIc9Qx/tkGkUh43Nqix7hBqh4cjH6C0oSAi
 RksQ==
X-Gm-Message-State: APjAAAVK7trojTZbeqtD/YLsuiyd0MNkdE221imj6MmhtvGJed5cCzhA
 6SOlQSrh5+pQpqDld/21eA1DXta5
X-Google-Smtp-Source: APXvYqzujCYIz6pWqghF8eZxljM2HM9TFDW4pY74V+ZQ4IMg59TP7AokTf4Xc4mRKQkz1VMcxSbfDg==
X-Received: by 2002:adf:f802:: with SMTP id s2mr6204146wrp.201.1576155228887; 
 Thu, 12 Dec 2019 04:53:48 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.53.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:53:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 051/132] meson: convert qom/
Date: Thu, 12 Dec 2019 13:51:35 +0100
Message-Id: <1576155176-2464-52-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Makefile.objs     | 1 -
 qom/Makefile.objs | 1 -
 qom/meson.build   | 5 +++++
 3 files changed, 5 insertions(+), 2 deletions(-)
 delete mode 100644 qom/Makefile.objs

diff --git a/Makefile.objs b/Makefile.objs
index e9ae889..0bc9167 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -71,7 +71,6 @@ endif
 # Target-independent parts used in system and user emulation
 
 common-obj-y += hw/
-common-obj-y += qom/
 common-obj-y += disas/
 
 ######################################################################
diff --git a/qom/Makefile.objs b/qom/Makefile.objs
deleted file mode 100644
index fc1248e..0000000
--- a/qom/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-common-obj-$(CONFIG_SOFTMMU) += qom-hmp-cmds.o qom-qmp-cmds.o
diff --git a/qom/meson.build b/qom/meson.build
index 4af044d..3875663 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -13,3 +13,8 @@ libqom = static_library('qom', qom_ss.sources(),
                         name_suffix: 'fa')
 
 qom = declare_dependency(link_whole: libqom)
+
+softmmu_ss.add(files(
+  'qom-hmp-cmds.c',
+  'qom-qmp-cmds.c',
+))
-- 
1.8.3.1



