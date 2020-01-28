Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498DE14C060
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 19:53:01 +0100 (CET)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwVyu-0004dC-CZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 13:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV5r-0000l3-2W
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV5o-0003NT-Vd
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:56:05 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51669)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iwV5o-0003Kr-Op
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:56:04 -0500
Received: by mail-wm1-x330.google.com with SMTP id t23so3526417wmi.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/q8n4GsvZAD7aXlEH8RDeAUqSvHFr+MSl4+0UVtrRTs=;
 b=ePF0CA9lZZIKp8RhAujKCAIwiej3yPzx+BCC6ldSF/Qq8eAUaOM/VREBXkr/fN6cEU
 n+SsyqROcFuHS4YE/6QJgochKHXX59s2aigdYUzxc6OwC0cfYy7w0EQBomm/HHiBiRBm
 ahWuYrqJOP+des3B3cbE9MKp8wnzPMCpRlwznxaC1E3h0U4MAD/RP71Gv7Cau41pyvK6
 njxzlXmGlp7InsVPN250fBNmJTpgkxr2YS1uopQvZHkl0zY2nO5tvQyNrCIssgTv91NZ
 l3yZuX+wdRhScQDUSScvebNk0ouKtiyZdpKIu8/RH7gV93H1A8LSWWaXpI2I7s9RPSg1
 CF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/q8n4GsvZAD7aXlEH8RDeAUqSvHFr+MSl4+0UVtrRTs=;
 b=ojG7p06Tmjuet44Ao3fbvUUCtc68A3D82VYaCnCO2+cexq5uvXqiwqueHrEhJ4Fm4q
 z6/8QpfP03XSdzvqZCsJ+EIGPZLUA1tHA6Xc3xLmptow4ktSYbQRGReMD2rPSGfM0f1R
 X6s3yNkbXujWZ4m5hI1E5TmAgvUGdbHo6dU0imlAQLaepWJafurUqCRgbR9WOpT4p3aV
 dGZwlWrBwvwIFyJ+cTLnGdFbwnOHsJvhWzdws/QQMLI/Q3q/mwSMvXdGUnZH8r+h+yfJ
 M7AQ3xNmZiTMKeyzAeMOs0cu5YepYP82WBhv4fGJDI1/d/uKe1/rKXgm9vkwQth5AB6/
 Og4w==
X-Gm-Message-State: APjAAAXb4WVKNOcYOIZf8x9rTGqTwRPFyARdR4C/LuvQuhCf/kUcyM2i
 0k7fYJ7rJ0/IhcCx+YwJg/+cUOMe
X-Google-Smtp-Source: APXvYqy86KfS7yovDEucD02l3wBpExj6IElJqXdF/qT1X259geUTeX8u1KX4HJZrLFPRy8eOppC0rw==
X-Received: by 2002:a05:600c:2290:: with SMTP id
 16mr5933234wmf.184.1580234163610; 
 Tue, 28 Jan 2020 09:56:03 -0800 (PST)
Received: from localhost.localdomain (93-36-56-206.ip58.fastwebnet.it.
 [93.36.56.206])
 by smtp.gmail.com with ESMTPSA id o4sm27046968wrx.25.2020.01.28.09.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:56:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 057/142] meson: convert qom/
Date: Tue, 28 Jan 2020 18:52:17 +0100
Message-Id: <20200128175342.9066-58-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200128175342.9066-1-pbonzini@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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
---
 Makefile.objs     | 1 -
 qom/Makefile.objs | 1 -
 qom/meson.build   | 5 +++++
 3 files changed, 5 insertions(+), 2 deletions(-)
 delete mode 100644 qom/Makefile.objs

diff --git a/Makefile.objs b/Makefile.objs
index ada5d795f2..8a158b93bb 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -73,7 +73,6 @@ endif
 # Target-independent parts used in system and user emulation
 
 common-obj-y += hw/
-common-obj-y += qom/
 common-obj-y += disas/
 
 ######################################################################
diff --git a/qom/Makefile.objs b/qom/Makefile.objs
deleted file mode 100644
index fc1248e3f3..0000000000
--- a/qom/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-common-obj-$(CONFIG_SOFTMMU) += qom-hmp-cmds.o qom-qmp-cmds.o
diff --git a/qom/meson.build b/qom/meson.build
index 4af044d858..3875663f66 100644
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
2.21.0



