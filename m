Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5425D823
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:57:23 +0200 (CEST)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEALK-0004s3-8Y
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6c-0000gO-Pc
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6a-0005GR-2b
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599219727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RsnTcssORBAfLgaqnBJYc2s5Hs447I4ulQrE+UsAJhQ=;
 b=RCPAZjrlwIjw5Oji8ZuiFCkdtsOzYQ/q1ALB9TmlI9sKzEUfniGN8OclHL4VcQBs27FSLf
 vY5pnCyvvvBzKU4K1HyQBWynQG9A3wPWXKgd2exwy89OUsPYxJMCQf+B7bMZN9OVtoeeEY
 eHzz7t2QvIb46GBNxtWEMAqAUYgMx1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-YH4tmcmWNde2nA-sx37iIw-1; Fri, 04 Sep 2020 07:42:04 -0400
X-MC-Unique: YH4tmcmWNde2nA-sx37iIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F6C8DE44B
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BC697B9C8;
 Fri,  4 Sep 2020 11:41:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/46] meson: convert migration/initrd-stress
Date: Fri,  4 Sep 2020 07:41:02 -0400
Message-Id: <20200904114122.31307-27-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 07:42:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200828110734.1638685-17-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include           | 14 --------------
 tests/meson.build                |  1 +
 tests/migration/initrd-stress.sh | 10 ++++++++++
 tests/migration/meson.build      | 14 ++++++++++++++
 4 files changed, 25 insertions(+), 14 deletions(-)
 create mode 100755 tests/migration/initrd-stress.sh
 create mode 100644 tests/migration/meson.build

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fe22ccfcc6..1592a647f4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -38,20 +38,6 @@ export SRC_PATH
 SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
    $(wildcard $(SRC_PATH)/default-configs/*-softmmu.mak)))
 
-QEMU_CFLAGS += -I$(SRC_PATH)/tests -I$(SRC_PATH)/tests/qtest
-
-tests/migration/stress$(EXESUF): tests/migration/stress.o
-	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,"LINK","$(TARGET_DIR)$@")
-
-INITRD_WORK_DIR=tests/migration/initrd
-
-tests/migration/initrd-stress.img: tests/migration/stress$(EXESUF)
-	mkdir -p $(INITRD_WORK_DIR)
-	cp $< $(INITRD_WORK_DIR)/init
-	(cd $(INITRD_WORK_DIR) && (find | cpio --quiet -o -H newc | gzip -9)) > $@
-	rm $(INITRD_WORK_DIR)/init
-	rmdir $(INITRD_WORK_DIR)
-
 SPEED = quick
 
 # gtester tests, possibly with verbose output
diff --git a/tests/meson.build b/tests/meson.build
index 17536de589..a1cea7adb2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -272,3 +272,4 @@ endif
 
 subdir('qapi-schema')
 subdir('qtest')
+subdir('migration')
diff --git a/tests/migration/initrd-stress.sh b/tests/migration/initrd-stress.sh
new file mode 100755
index 0000000000..0f20ac29a6
--- /dev/null
+++ b/tests/migration/initrd-stress.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+INITRD="$1"
+STRESS="$2"
+
+INITRD_DIR=$(mktemp -d -p '' "initrd-stress.XXXXXX")
+trap 'rm -rf $INITRD_DIR' EXIT
+
+cp "$STRESS" "$INITRD_DIR/init"
+(cd "$INITRD_DIR" && (find | cpio --quiet -o -H newc | gzip -9)) > "$INITRD"
diff --git a/tests/migration/meson.build b/tests/migration/meson.build
new file mode 100644
index 0000000000..f215ee7d3a
--- /dev/null
+++ b/tests/migration/meson.build
@@ -0,0 +1,14 @@
+stress = executable(
+  'stress',
+  files('stress.c'),
+  dependencies: [glib],
+  link_args: ['-static'],
+  build_by_default: false,
+)
+
+custom_target(
+  'initrd-stress.img',
+  output: 'initrd-stress.img',
+  input: stress,
+  command: [find_program('initrd-stress.sh'), '@OUTPUT@', '@INPUT@']
+)
-- 
2.26.2



