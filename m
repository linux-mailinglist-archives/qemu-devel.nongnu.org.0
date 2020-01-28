Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A214BF2E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 19:08:17 +0100 (CET)
Received: from localhost ([::1]:34904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwVHc-0007xO-PJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 13:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV5C-00085V-Aq
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:55:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV5A-0001um-Oq
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:55:26 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34404)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iwV5A-0001s8-Gl
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:55:24 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so17096873wrr.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/aEAr34ixJ4O2vbRsA1gthdOZCShKGFTDPmiGLW8Xb4=;
 b=U91c/q0ASHPsdWvSBiFyEgNEzhrJmaASeFyLh5YnULhG6EmFFcBk7f4z1tNyviLuUN
 3nLxBAdKN229sHZjYG27dsUemgeNZoF4SwzF2ytMma1l844SStnGQHrD5QLS/nqtHJVK
 /1X5qYwBSdaVtVRbNXyx+OrWFvkoZJ9hQ3qTegvIn98BJHK9IAyrQc5dyd53Sqi6qLV3
 uyynFaBB4Mgem2dM8Hilnfqqs3RPcdObPFSadVdkon9F0f0AsaRkd8g4pl1TAGTkbIvX
 IBHXRj6599BNQ5Kga+33RopNa9WtE9g6dz1sDVEELt6hKohIqpAy7JNN9HXErQYQ6STd
 k/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/aEAr34ixJ4O2vbRsA1gthdOZCShKGFTDPmiGLW8Xb4=;
 b=gPVWf0e5bTB8FV8W1bzg7avmRYJzgjZ4/sePfdTP9K1m7PSZdTLoVCyVmp8m0BMQfL
 GnyDFZqox7D4nckJLZby0+KNQt3tNDIiWb56zic3fFLzQbkxXqkHYG+Kmh4XGyytYMgP
 NI4J597+9wLZbOCp9kz9EvjwZs7kosQxVt+5zJrLvAOX75wiArFLklGVcirKhhbwZLyb
 4T8SKaSxQ31bvXVilFwEfYS7/8wDZK7y7ivu8j6cgEXHIXZrw5ulfMWAXyYuoFKwbbpw
 2mWXoVqjbjOyMDs26VkFUajTJ7kvt3N+AppxeKTNmIWThT+a05EhpuiOrn4MjrnD+qkf
 xOKg==
X-Gm-Message-State: APjAAAXS7r4cAk4XWsrmwln36sX9v5fqIBKlkBVClXSXknEuFWXxp6rr
 85CTUGGXhLOdfDeqZf7HVxNoBGoV
X-Google-Smtp-Source: APXvYqzsX/Ie0EMVewi0iWM4WhEMPji4m+oB3ZfhpI2gsz0cohnkKVV6BbLPC0VRWZY/BCT/5CE8Xw==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr32296780wrr.158.1580234123333; 
 Tue, 28 Jan 2020 09:55:23 -0800 (PST)
Received: from localhost.localdomain (93-36-56-206.ip58.fastwebnet.it.
 [93.36.56.206])
 by smtp.gmail.com with ESMTPSA id o4sm27046968wrx.25.2020.01.28.09.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:55:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 040/142] meson: convert authz directory to Meson
Date: Tue, 28 Jan 2020 18:52:00 +0100
Message-Id: <20200128175342.9066-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200128175342.9066-1-pbonzini@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile            |  1 -
 Makefile.objs       |  8 +++-----
 Makefile.target     |  2 +-
 authz/Makefile.objs |  7 -------
 authz/meson.build   | 18 ++++++++++++++++++
 meson.build         |  5 +++++
 6 files changed, 27 insertions(+), 14 deletions(-)
 delete mode 100644 authz/Makefile.objs
 create mode 100644 authz/meson.build

diff --git a/Makefile b/Makefile
index 80894601dc..64c7430951 100644
--- a/Makefile
+++ b/Makefile
@@ -220,7 +220,6 @@ include $(SRC_PATH)/Makefile.objs
 endif
 
 dummy := $(call unnest-vars,, \
-                authz-obj-y \
                 chardev-obj-y \
                 block-obj-y \
                 block-obj-m \
diff --git a/Makefile.objs b/Makefile.objs
index 18caccdba8..bbeb87ec82 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -2,11 +2,6 @@
 # chardev-obj-y is code used by both qemu system emulation and some tests
 chardev-obj-y = chardev/
 
-#######################################################################
-# authz-obj-y is code used by both qemu system emulation and qemu-img
-
-authz-obj-y = authz/
-
 #######################################################################
 # block-obj-y is code used by both qemu system emulation and qemu-img
 
@@ -26,6 +21,9 @@ crypto-obj-y = crypto/
 #######################################################################
 # libraries built entirely from meson
 
+authz-obj-y = authz/libauthz.fa
+authz/libauthz.fa-libs = $(if $(CONFIG_AUTH_PAM),-lpam)
+
 qom-obj-y = qom/libqom.fa
 
 #######################################################################
diff --git a/Makefile.target b/Makefile.target
index 40ab105568..a9f5cac98a 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -179,9 +179,9 @@ all-obj-y := $(obj-y)
 
 include $(SRC_PATH)/Makefile.objs
 dummy := $(call fix-paths,../,, \
+              authz-obj-y \
               qom-obj-y)
 dummy := $(call unnest-vars,.., \
-               authz-obj-y \
                block-obj-y \
                block-obj-m \
                chardev-obj-y \
diff --git a/authz/Makefile.objs b/authz/Makefile.objs
deleted file mode 100644
index ed7b273596..0000000000
--- a/authz/Makefile.objs
+++ /dev/null
@@ -1,7 +0,0 @@
-authz-obj-y += base.o
-authz-obj-y += simple.o
-authz-obj-y += list.o
-authz-obj-y += listfile.o
-authz-obj-$(CONFIG_AUTH_PAM) += pamacct.o
-
-pamacct.o-libs = -lpam
diff --git a/authz/meson.build b/authz/meson.build
new file mode 100644
index 0000000000..f485b8076a
--- /dev/null
+++ b/authz/meson.build
@@ -0,0 +1,18 @@
+authz_ss = ss.source_set()
+authz_ss.add(genh)
+authz_ss.add(files(
+  'base.c',
+  'list.c',
+  'listfile.c',
+  'simple.c',
+))
+
+authz_ss.add(when: ['CONFIG_AUTH_PAM', pam], if_true: files('pamacct.c'))
+
+authz_ss = authz_ss.apply(config_host, strict: false)
+libauthz = static_library('authz', authz_ss.sources(),
+                          dependencies: [authz_ss.dependencies()],
+                          name_suffix: 'fa',
+                          build_by_default: false)
+
+authz = declare_dependency(link_whole: libauthz)
diff --git a/meson.build b/meson.build
index 0c4e5e5823..218c495063 100644
--- a/meson.build
+++ b/meson.build
@@ -66,6 +66,10 @@ if 'CONFIG_GNUTLS' in config_host
 endif
 pixman = declare_dependency(compile_args: config_host['PIXMAN_CFLAGS'].split(),
                             link_args: config_host['PIXMAN_LIBS'].split())
+pam = declare_dependency()
+if 'CONFIG_AUTH_PAM' in config_host
+  pam = cc.find_library('pam')
+endif
 libattr = declare_dependency()
 if 'CONFIG_ATTR' in config_host
   libattr = declare_dependency(link_args: config_host['LIBATTR_LIBS'].split())
@@ -288,6 +292,7 @@ qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: version_res)
 
 subdir('qom')
+subdir('authz')
 subdir('fsdev')
 
 # Other build targets
-- 
2.21.0



