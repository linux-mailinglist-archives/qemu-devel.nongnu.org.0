Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9928B23E21F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 21:26:24 +0200 (CEST)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3lWx-0006A0-M3
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 15:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lOB-0004NE-LJ
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22871
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lO7-0006QY-FA
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=C0N6p0iKO9yG+jCVLdp7klKaOrneI5eZKcxqtDbmwTk=;
 b=AAqNAsriTw6NfkH8ZnTGEKc3KxEYalyrogpi+DQB97GyIJjrTc9p2HXKFr6REQrqTsz1Ah
 5h7YvGSFNUpiBJFwa2HJcYK6TjvFc17k5INEVpGEND/8kmPLSNURR63nk77CDYNW3gUf2P
 TULFFFiMIQb4oZMySSk/VozcuOdHG0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-bxQ5zMp4PG6Aacm2KIn9NA-1; Thu, 06 Aug 2020 15:17:12 -0400
X-MC-Unique: bxQ5zMp4PG6Aacm2KIn9NA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BFD9107BA6C
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:17:10 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B50095F9DC
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:17:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 026/143] contrib/vhost-user-blk: convert to Meson
Date: Thu,  6 Aug 2020 21:14:22 +0200
Message-Id: <1596741379-12902-27-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GLib pkg-config information is extracted from config-host.mak and
used to link vhost-user-blk.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                             | 3 ---
 Makefile.objs                        | 1 -
 contrib/vhost-user-blk/Makefile.objs | 1 -
 contrib/vhost-user-blk/meson.build   | 3 +++
 meson.build                          | 1 +
 5 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 contrib/vhost-user-blk/Makefile.objs
 create mode 100644 contrib/vhost-user-blk/meson.build

diff --git a/Makefile b/Makefile
index 0918639..7e4341d 100644
--- a/Makefile
+++ b/Makefile
@@ -297,7 +297,6 @@ dummy := $(call unnest-vars,, \
                 ivshmem-server-obj-y \
                 rdmacm-mux-obj-y \
                 vhost-user-scsi-obj-y \
-                vhost-user-blk-obj-y \
                 vhost-user-input-obj-y \
                 vhost-user-gpu-obj-y \
                 qga-vss-dll-obj-y \
@@ -520,8 +519,6 @@ ivshmem-server$(EXESUF): $(ivshmem-server-obj-y) $(COMMON_LDADDS)
 endif
 vhost-user-scsi$(EXESUF): $(vhost-user-scsi-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
-vhost-user-blk$(EXESUF): $(vhost-user-blk-obj-y) contrib/libvhost-user/libvhost-user.a $(COMMON_LDADDS)
-	$(call LINK, $^)
 
 rdmacm-mux$(EXESUF): LIBS += "-libumad"
 rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADDS)
diff --git a/Makefile.objs b/Makefile.objs
index fee0f71..f69736c 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -109,7 +109,6 @@ ivshmem-server-obj-$(CONFIG_IVSHMEM) = contrib/ivshmem-server/
 vhost-user-scsi.o-cflags := $(LIBISCSI_CFLAGS)
 vhost-user-scsi.o-libs := $(LIBISCSI_LIBS)
 vhost-user-scsi-obj-y = contrib/vhost-user-scsi/
-vhost-user-blk-obj-y = contrib/vhost-user-blk/
 rdmacm-mux-obj-y = contrib/rdmacm-mux/
 vhost-user-input-obj-y = contrib/vhost-user-input/
 vhost-user-gpu-obj-y = contrib/vhost-user-gpu/
diff --git a/contrib/vhost-user-blk/Makefile.objs b/contrib/vhost-user-blk/Makefile.objs
deleted file mode 100644
index 72e2cdc..0000000
--- a/contrib/vhost-user-blk/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-vhost-user-blk-obj-y = vhost-user-blk.o
diff --git a/contrib/vhost-user-blk/meson.build b/contrib/vhost-user-blk/meson.build
new file mode 100644
index 0000000..3856a9a
--- /dev/null
+++ b/contrib/vhost-user-blk/meson.build
@@ -0,0 +1,3 @@
+executable('vhost-user-blk', files('vhost-user-blk.c'),
+           link_with: libvhost_user,
+           dependencies: qemuutil)
diff --git a/meson.build b/meson.build
index 2f159b8..dc3d4a4 100644
--- a/meson.build
+++ b/meson.build
@@ -237,6 +237,7 @@ qemuutil = declare_dependency(link_with: libqemuutil,
 if have_tools
   if 'CONFIG_VHOST_USER' in config_host
     subdir('contrib/libvhost-user')
+    subdir('contrib/vhost-user-blk')
   endif
 endif
 
-- 
1.8.3.1



