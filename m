Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A024882E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:49:34 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82vd-0004F9-2S
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82L6-0004jO-61
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50245
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Kw-0007U5-Jl
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dau1CiHZz2bXWc2CBvXPTV0eUpnr17179iwn/cN2qo=;
 b=IRsX7BTcGNYKJixz1mELY/73p21TOZPP5MFyuKe2uOs72eW623xXDuRCt8I8EyQKaEpPbw
 iG0HRw7I00TarcP9NHKznrl3s+RKvfTDsBElxNqTY3MmXMZxwZ/KXmiOzpNkePCO3SXG7/
 5yuap9eqhhZCd2h/eiu/aBtAYw9qhEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-gqJWuY6YPNm6IYycwVpkUg-1; Tue, 18 Aug 2020 10:11:34 -0400
X-MC-Unique: gqJWuY6YPNm6IYycwVpkUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C023100A954
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD5145D757
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 077/150] meson: convert qemu-storage-daemon
Date: Tue, 18 Aug 2020 10:09:12 -0400
Message-Id: <20200818141025.21608-78-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 06:40:33
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                                            |  5 -----
 Makefile.objs                                       | 10 ----------
 meson.build                                         |  2 +-
 storage-daemon/Makefile.objs                        |  3 ---
 storage-daemon/meson.build                          | 13 +++++++++++++
 storage-daemon/qapi/meson.build                     |  5 +----
 .../qemu-storage-daemon.c                           |  0
 7 files changed, 15 insertions(+), 23 deletions(-)
 delete mode 100644 storage-daemon/Makefile.objs
 rename qemu-storage-daemon.c => storage-daemon/qemu-storage-daemon.c (100%)

diff --git a/Makefile b/Makefile
index 4ce2f4b2de..98d18c0bfb 100644
--- a/Makefile
+++ b/Makefile
@@ -170,8 +170,6 @@ include $(SRC_PATH)/Makefile.objs
 endif
 
 dummy := $(call unnest-vars,, \
-                storage-daemon-obj-y \
-                storage-daemon-obj-m \
                 common-obj-y \
                 common-obj-m)
 
@@ -187,7 +185,6 @@ TARGET_DIRS_RULES := $(foreach t, all fuzz clean install, $(addsuffix /$(t), $(T
 SOFTMMU_ALL_RULES=$(filter %-softmmu/all, $(TARGET_DIRS_RULES))
 $(SOFTMMU_ALL_RULES): $(authz-obj-y)
 $(SOFTMMU_ALL_RULES): $(block-obj-y)
-$(SOFTMMU_ALL_RULES): $(storage-daemon-obj-y)
 $(SOFTMMU_ALL_RULES): $(chardev-obj-y)
 $(SOFTMMU_ALL_RULES): $(crypto-obj-y)
 $(SOFTMMU_ALL_RULES): $(io-obj-y)
@@ -278,8 +275,6 @@ Makefile: $(version-obj-y)
 
 COMMON_LDADDS = libqemuutil.a
 
-qemu-storage-daemon$(EXESUF): qemu-storage-daemon.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(chardev-obj-y) $(io-obj-y) $(qom-obj-y) $(storage-daemon-obj-y) $(COMMON_LDADDS)
-
 clean: recurse-clean ninja-clean clean-ctlist
 	-test -f ninjatool && ./ninjatool $(if $(V),-v,) -t clean
 # avoid old build problems by removing potentially incorrect old files
diff --git a/Makefile.objs b/Makefile.objs
index d7826c1e5c..e304d92954 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -33,16 +33,6 @@ io-obj-y = io/libio.fa
 
 endif # CONFIG_SOFTMMU or CONFIG_TOOLS
 
-#######################################################################
-# storage-daemon-obj-y is code used by qemu-storage-daemon (these objects are
-# used for system emulation, too, but specified separately there)
-
-storage-daemon-obj-y = block/ qapi/ qom/ storage-daemon/
-storage-daemon-obj-y += blockdev.o blockdev-nbd.o iothread.o job-qmp.o
-storage-daemon-obj-$(CONFIG_WIN32) += os-win32.o
-storage-daemon-obj-$(CONFIG_POSIX) += os-posix.o
-storage-daemon-obj-y += libqmp.fa
-
 ######################################################################
 # Target independent part of system emulation. The long term path is to
 # suppress *all* target specific code in case of system emulation, i.e. a
diff --git a/meson.build b/meson.build
index c5fe79f2ff..cc714786a5 100644
--- a/meson.build
+++ b/meson.build
@@ -587,7 +587,6 @@ subdir('util')
 subdir('qom')
 subdir('authz')
 subdir('crypto')
-subdir('storage-daemon')
 subdir('ui')
 
 
@@ -797,6 +796,7 @@ if have_tools
                dependencies: [block, qemuutil], install: true)
   endif
 
+  subdir('storage-daemon')
   subdir('contrib/rdmacm-mux')
   subdir('contrib/elf2dmp')
 
diff --git a/storage-daemon/Makefile.objs b/storage-daemon/Makefile.objs
deleted file mode 100644
index 41c0d02178..0000000000
--- a/storage-daemon/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-storage-daemon-obj-y = qapi/libqsd-qapi.fa
-
-qemu-storage-daemon.o: storage-daemon/qapi/qapi-commands.h storage-daemon/qapi/qapi-init-commands.h
diff --git a/storage-daemon/meson.build b/storage-daemon/meson.build
index 35f8949924..0409acc3f5 100644
--- a/storage-daemon/meson.build
+++ b/storage-daemon/meson.build
@@ -1 +1,14 @@
+qsd_ss = ss.source_set()
+qsd_ss.add(files('qemu-storage-daemon.c'))
+qsd_ss.add(block, chardev, qmp, qom, qemuutil)
+qsd_ss.add_all(blockdev_ss)
+
 subdir('qapi')
+
+if have_tools
+  qsd_ss = qsd_ss.apply(config_host, strict: false)
+  executable('qemu-storage-daemon',
+             qsd_ss.sources(),
+             dependencies: qsd_ss.dependencies(),
+             install: true)
+endif
diff --git a/storage-daemon/qapi/meson.build b/storage-daemon/qapi/meson.build
index 7a2b041247..cea618bec0 100644
--- a/storage-daemon/qapi/meson.build
+++ b/storage-daemon/qapi/meson.build
@@ -4,7 +4,4 @@ qsd_qapi_files = custom_target('QAPI files for qemu-storage-daemon',
                                command: [ qapi_gen, '-o', 'storage-daemon/qapi', '@INPUT@' ],
                                depend_files: [ qapi_inputs, qapi_gen_depends ])
 
-static_library('qsd-qapi',
-               qsd_qapi_files.to_list(),
-               name_suffix: 'fa',
-               build_by_default: false)
+qsd_ss.add(qsd_qapi_files.to_list())
diff --git a/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
similarity index 100%
rename from qemu-storage-daemon.c
rename to storage-daemon/qemu-storage-daemon.c
-- 
2.26.2



