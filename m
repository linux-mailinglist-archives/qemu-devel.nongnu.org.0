Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA211CDB4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 14:01:39 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifO66-0003S0-5y
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 08:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNxz-0002sw-37
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNxx-0005y9-So
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:14 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39306)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNxx-0005wf-Lq
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:13 -0500
Received: by mail-wr1-x442.google.com with SMTP id y11so2611913wrt.6
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=Ms4rgwqzwz2bjSXIt0fRvL5jyMoo90zVMU5D17dr7RM=;
 b=ePExnukRvuDRQTWBu+5WeKGpZOytzaeDBT9PDtwcp2sCWdO3dprGtt6Zucza1d6A5K
 9CVQCKxX1fP0Zjd6GidnfQMGQNt4wKEpdGNtjoes9Z3jepMCYgjapc8Yi0dpmyq5pGon
 8+6K/bz0hkcW/Byx9Wqyhlco3eAF/VIpDDWW+b3Amxes3xtNNy/vpDBCN7J70h7ag0tE
 RGkO1F9cnPgDBO34lb7GTwEHJQ0LF+aemn0/PiXmcj8HsS98aUTJlW5ew/TwJYn98Bvz
 5SW1q5zze1EbJmgW4bsVmdLT+Vb2fdHmTKJxITNUj3OTT3Vv6C/zRfE2b5CbzDxtSZbt
 g67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=Ms4rgwqzwz2bjSXIt0fRvL5jyMoo90zVMU5D17dr7RM=;
 b=eDS1gueL/1/bzJN2VQn1Q0L9dQS4wpF6VcrQPTqThE8tUZ9PZoq8AXcs0eS7i9SQcw
 gwui/Snz1ydJK7Dg8EeMOPvfo8CZkcOLxYQXLuZ4e2PuePhusU7tWMstupxtqWRuI2fB
 MWl8ULvRjRb1BozYU0gIFteo4YONG662YEGmAJPb3tTLz3TPjzZfprQHZNE7M4rJDiPY
 at9C5k4PSbtYnSxGJSVUCoLk2NPGiKfQGfjButYh/h3y0vuRmQ4x4wM6BBci8QmKdUN3
 uAutABvwSien2ov0TPGeimqgpi8vkXFG8Grmj+YcfDgipaUauxwnsT+18Uc+C85ZYv+W
 urCQ==
X-Gm-Message-State: APjAAAUO1/s4plz1T1JwRYmuFtoiaNrOAnHP1MFfyX/bi7KWNcVIvFTS
 lh81Lhmtl47Gk/TD/VYKOcn+feed
X-Google-Smtp-Source: APXvYqxI0BcajM5RvVZkT9WlT6FmeaGUcfXD/pcbuHiqrgm+UUSO8BKe7JpCy9yAHr4XbzLjh1Gyvw==
X-Received: by 2002:adf:fc03:: with SMTP id i3mr6323606wrr.306.1576155192423; 
 Thu, 12 Dec 2019 04:53:12 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.53.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:53:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 014/132] contrib/vhost-user-scsi: convert to Meson
Date: Thu, 12 Dec 2019 13:50:58 +0100
Message-Id: <1576155176-2464-15-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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

The libiscsi pkg-config information is extracted from config-host.mak and
used to link vhost-user-blk.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                              | 3 ---
 Makefile.objs                         | 3 ---
 contrib/vhost-user-scsi/Makefile.objs | 1 -
 contrib/vhost-user-scsi/meson.build   | 5 +++++
 meson.build                           | 6 ++++++
 5 files changed, 11 insertions(+), 7 deletions(-)
 delete mode 100644 contrib/vhost-user-scsi/Makefile.objs
 create mode 100644 contrib/vhost-user-scsi/meson.build

diff --git a/Makefile b/Makefile
index f15c097..3971171 100644
--- a/Makefile
+++ b/Makefile
@@ -267,7 +267,6 @@ dummy := $(call unnest-vars,, \
                 ivshmem-client-obj-y \
                 ivshmem-server-obj-y \
                 rdmacm-mux-obj-y \
-                vhost-user-scsi-obj-y \
                 vhost-user-input-obj-y \
                 vhost-user-gpu-obj-y \
                 qga-vss-dll-obj-y \
@@ -464,8 +463,6 @@ ivshmem-client$(EXESUF): $(ivshmem-client-obj-y) $(COMMON_LDADDS)
 ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 	$(call LINK, $^)
 endif
-vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
-	$(call LINK, $^)
 
 rdmacm-mux$(EXESUF): LIBS += "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
diff --git a/Makefile.objs b/Makefile.objs
index ba422dd..30804f0 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -109,9 +109,6 @@ qga-vss-dll-obj-y = qga/
 elf2dmp-obj-y = contrib/elf2dmp/
 ivshmem-client-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-client/
 ivshmem-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-server/
-vhost-user-scsi.o-cflags := $(LIBISCSI_CFLAGS)
-vhost-user-scsi.o-libs := $(LIBISCSI_LIBS)
-vhost-user-scsi-obj-y = contrib/vhost-user-scsi/
 rdmacm-mux-obj-y = contrib/rdmacm-mux/
 vhost-user-input-obj-y = contrib/vhost-user-input/
 vhost-user-gpu-obj-y = contrib/vhost-user-gpu/
diff --git a/contrib/vhost-user-scsi/Makefile.objs b/contrib/vhost-user-scsi/Makefile.objs
deleted file mode 100644
index e83a38a..0000000
--- a/contrib/vhost-user-scsi/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-vhost-user-scsi-obj-y = vhost-user-scsi.o
diff --git a/contrib/vhost-user-scsi/meson.build b/contrib/vhost-user-scsi/meson.build
new file mode 100644
index 0000000..0bdd5a5
--- /dev/null
+++ b/contrib/vhost-user-scsi/meson.build
@@ -0,0 +1,5 @@
+if 'CONFIG_LIBISCSI' in config_host
+  executable('vhost-user-scsi', files('vhost-user-scsi.c'),
+             link_with: libvhost_user,
+             dependencies: [qemuutil, libiscsi])
+endif
diff --git a/meson.build b/meson.build
index 4f2fc33..7ad5458 100644
--- a/meson.build
+++ b/meson.build
@@ -52,6 +52,11 @@ if 'CONFIG_GNUTLS' in config_host
   gnutls = declare_dependency(compile_args: config_host['GNUTLS_CFLAGS'].split(),
                               link_args: config_host['GNUTLS_LIBS'].split())
 endif
+libiscsi = declare_dependency()
+if 'CONFIG_LIBISCSI' in config_host
+  libiscsi = declare_dependency(compile_args: config_host['LIBISCSI_CFLAGS'].split(),
+                                link_args: config_host['LIBISCSI_LIBS'].split())
+endif
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_user = false
@@ -192,5 +197,6 @@ if have_tools
   if 'CONFIG_VHOST_USER' in config_host
     subdir('contrib/libvhost-user')
     subdir('contrib/vhost-user-blk')
+    subdir('contrib/vhost-user-scsi')
   endif
 endif
-- 
1.8.3.1



