Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671224D381
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:05:36 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94rX-0008D4-0u
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94E7-0002rA-C0
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56214
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dz-0001hV-C3
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grfXaRwVirWcrdrhRxW0qH8JhI7GcFToN7M5lFZbGx4=;
 b=VLLOiFOIwtejVDTh6L0ZyJXc6ZM4MJnWXsoMegkujiLgKS8eY1LSSN+WCapCy/By5NrLjn
 tB5zUeynsB1ncV6N3W48IVbyb2hjCh7wrRI34pI07AiEYSWK0tW2DivNMexqHrs6vzaj7Z
 ncW6/KYhw+/c9jOpKCftbTimWRWP5x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447--iVBoqLpPyWNNmafQmD7PA-1; Fri, 21 Aug 2020 06:24:41 -0400
X-MC-Unique: -iVBoqLpPyWNNmafQmD7PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16F9656B2C
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC6B77E31F;
 Fri, 21 Aug 2020 10:24:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 083/152] meson: convert fsdev/
Date: Fri, 21 Aug 2020 06:22:20 -0400
Message-Id: <20200821102329.29777-84-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs       |  4 +---
 configure           |  1 -
 fsdev/Makefile.objs | 12 ------------
 fsdev/meson.build   | 10 ++++++++++
 4 files changed, 11 insertions(+), 16 deletions(-)
 delete mode 100644 fsdev/Makefile.objs

diff --git a/Makefile.objs b/Makefile.objs
index c00851a0cd..7158031c0c 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -39,9 +39,7 @@ endif # CONFIG_SOFTMMU or CONFIG_TOOLS
 # single QEMU executable should support all CPUs and machines.
 
 ifeq ($(CONFIG_SOFTMMU),y)
-common-obj-$(CONFIG_LINUX) = fsdev/
-
-common-obj-y += accel/
+common-obj-y = accel/
 
 common-obj-$(CONFIG_AUDIO_ALSA) += audio-alsa$(DSOSUF)
 common-obj-$(CONFIG_AUDIO_OSS) += audio-oss$(DSOSUF)
diff --git a/configure b/configure
index 66677d61a0..3018da6336 100755
--- a/configure
+++ b/configure
@@ -3747,7 +3747,6 @@ int main(void)
 EOF
   if compile_prog "" "$cap_libs" ; then
     cap_ng=yes
-    libs_tools="$cap_libs $libs_tools"
   else
     if test "$cap_ng" = "yes" ; then
       feature_not_found "cap_ng" "Install libcap-ng devel"
diff --git a/fsdev/Makefile.objs b/fsdev/Makefile.objs
deleted file mode 100644
index 42cd70c367..0000000000
--- a/fsdev/Makefile.objs
+++ /dev/null
@@ -1,12 +0,0 @@
-# Lots of the fsdev/9pcode is pulled in by vl.c via qemu_fsdev_add.
-# only pull in the actual 9p backend if we also enabled virtio or xen.
-ifeq ($(CONFIG_FSDEV_9P),y)
-common-obj-y = qemu-fsdev.o 9p-marshal.o 9p-iov-marshal.o
-else
-common-obj-y = qemu-fsdev-dummy.o
-endif
-common-obj-y += qemu-fsdev-opts.o qemu-fsdev-throttle.o
-
-# Toplevel always builds this; targets without virtio will put it in
-# common-obj-y
-common-obj-$(CONFIG_ALL) += qemu-fsdev-dummy.o
diff --git a/fsdev/meson.build b/fsdev/meson.build
index 30e2319960..7dd1cc9bfb 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -1,3 +1,13 @@
+fsdev_ss = ss.source_set()
+fsdev_ss.add(files('qemu-fsdev-opts.c', 'qemu-fsdev-throttle.c'))
+fsdev_ss.add(when: 'CONFIG_ALL', if_true: files('qemu-fsdev-dummy.c'))
+fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
+  '9p-iov-marshal.c',
+  '9p-marshal.c',
+  'qemu-fsdev.c',
+), if_false: files('qemu-fsdev-dummy.c'))
+softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
+
 have_virtfs_proxy_helper = have_tools and libattr.found() and libcap_ng.found() and 'CONFIG_VIRTFS' in config_host
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
-- 
2.26.2



