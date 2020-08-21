Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBACE24D33D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:52:58 +0200 (CEST)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94fJ-0000x1-RJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Ds-0002HQ-Ss
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dk-0001du-9m
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oS5t7z8QpOlHbzVqrm9g3FpfBslr6YfrBNHu+ig9j98=;
 b=P+GkEfEXrolo67bTOLUN+T0+0zRvu82j/u02KMkkM3ZLacaBd6nHhEt+mF/fdS2TOhS+Gl
 SxEDSe5NmkmE5CkEJLUO7jaAXqd7MgUZWtaN/sHzY2WeiwyEgApkAOrb4MBP1mSiz6NCAE
 967n/cKoJR3+tH8dWiWWJD2UEeOlWoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-NV_Etpe9Ph-mnBL6uh_FIQ-1; Fri, 21 Aug 2020 06:24:24 -0400
X-MC-Unique: NV_Etpe9Ph-mnBL6uh_FIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B37D2801AAB
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EDE610098AE;
 Fri, 21 Aug 2020 10:24:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 060/152] meson: convert io directory to Meson
Date: Fri, 21 Aug 2020 06:21:57 -0400
Message-Id: <20200821102329.29777-61-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 02:43:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile         |  1 -
 Makefile.objs    |  2 +-
 Makefile.target  |  2 +-
 io/Makefile.objs | 12 ------------
 io/meson.build   | 25 +++++++++++++++++++++++++
 meson.build      |  1 +
 6 files changed, 28 insertions(+), 15 deletions(-)
 delete mode 100644 io/Makefile.objs
 create mode 100644 io/meson.build

diff --git a/Makefile b/Makefile
index c3cc71cfc0..1ee3398c15 100644
--- a/Makefile
+++ b/Makefile
@@ -246,7 +246,6 @@ dummy := $(call unnest-vars,, \
                 block-obj-m \
                 storage-daemon-obj-y \
                 storage-daemon-obj-m \
-                io-obj-y \
                 common-obj-y \
                 common-obj-m)
 
diff --git a/Makefile.objs b/Makefile.objs
index 018338d2db..0920cdb40c 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -21,7 +21,7 @@ block-obj-m = block/
 
 crypto-obj-y = crypto/libcrypto.fa
 
-io-obj-y = io/
+io-obj-y = io/libio.fa
 
 endif # CONFIG_SOFTMMU or CONFIG_TOOLS
 
diff --git a/Makefile.target b/Makefile.target
index b213955a81..f6b7a86390 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -194,12 +194,12 @@ include $(SRC_PATH)/Makefile.objs
 dummy := $(call fix-paths,../,, \
               authz-obj-y \
               crypto-obj-y \
+              io-obj-y \
               qom-obj-y)
 dummy := $(call unnest-vars,.., \
                block-obj-y \
                block-obj-m \
                chardev-obj-y \
-               io-obj-y \
                common-obj-y \
                common-obj-m)
 all-obj-y += $(common-obj-y)
diff --git a/io/Makefile.objs b/io/Makefile.objs
deleted file mode 100644
index 9a20fce4ed..0000000000
--- a/io/Makefile.objs
+++ /dev/null
@@ -1,12 +0,0 @@
-io-obj-y = channel.o
-io-obj-y += channel-buffer.o
-io-obj-y += channel-command.o
-io-obj-y += channel-file.o
-io-obj-y += channel-socket.o
-io-obj-y += channel-tls.o
-io-obj-y += channel-watch.o
-io-obj-y += channel-websock.o
-io-obj-y += channel-util.o
-io-obj-y += dns-resolver.o
-io-obj-y += net-listener.o
-io-obj-y += task.o
diff --git a/io/meson.build b/io/meson.build
new file mode 100644
index 0000000000..768c1b5ec3
--- /dev/null
+++ b/io/meson.build
@@ -0,0 +1,25 @@
+io_ss = ss.source_set()
+io_ss.add(genh)
+io_ss.add(files(
+  'channel-buffer.c',
+  'channel-command.c',
+  'channel-file.c',
+  'channel-socket.c',
+  'channel-tls.c',
+  'channel-util.c',
+  'channel-watch.c',
+  'channel-websock.c',
+  'channel.c',
+  'dns-resolver.c',
+  'net-listener.c',
+  'task.c',
+))
+
+io_ss = io_ss.apply(config_host, strict: false)
+libio = static_library('io', io_ss.sources() + genh,
+                       dependencies: [io_ss.dependencies()],
+                       link_with: libqemuutil,
+                       name_suffix: 'fa',
+                       build_by_default: false)
+
+io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
diff --git a/meson.build b/meson.build
index 9d5cd00c89..ece3be725d 100644
--- a/meson.build
+++ b/meson.build
@@ -346,6 +346,7 @@ libqemuutil = static_library('qemuutil',
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
+subdir('io')
 subdir('fsdev')
 
 # Other build targets
-- 
2.26.2



