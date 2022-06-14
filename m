Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712F54B6DD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:56:10 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19pp-0007kE-5g
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o19lU-0005H1-4C
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o19lQ-00036Y-Ep
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655225494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e8HG/qQXLswedE4EcBkedeTP89cywFYsO8c70f7Dd9U=;
 b=L+uFZPeThROTIjqaac2kglwu7DbWFiS4y2zQnlO5DiAvIw8P/th9L/kj7We8R7Eg+Ywb7B
 vxYuBTbzS6BMdcHyhX5V83lmiKoiZC51n6woNtWJqEto49hUvfWwOBZ70klFv6SklI+nYy
 B6zSOt35njQs6o1uYxtXJdDfHfAaWGI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-QVdZ0aB5N5q0VyUfMoUusA-1; Tue, 14 Jun 2022 12:51:31 -0400
X-MC-Unique: QVdZ0aB5N5q0VyUfMoUusA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j31-20020a05600c1c1f00b0039c481c4664so4028463wms.7
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 09:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e8HG/qQXLswedE4EcBkedeTP89cywFYsO8c70f7Dd9U=;
 b=nvVkw0gcY+U0zMe8+YC9Xo6rSSOnDj0PDqniDjPdfdLpikMlOt1vILokHiPNXK93ui
 RW/CeVKJFH424lQ6ZmCxoX2v3jBWETiqfq0WDBPMjK/q44jKJtY438cOX+td17CMwOkq
 RkYu1gW3/AL+EuORU1J1/ue56/03lMgFx/WtzboFrGaz3eCQz0ZX8gCOcI72C8VRKjJm
 ybMIfwy5CmkH6U3zLD26IiQzTX4cWcJzOOrBaSRe7rKUGe1hbtKi0OJY30tC9AXbGVrC
 4IyWtr3Q2Y5VV/iVSr/b7fwBgGxHvfJLAbVt5pSmz8ZWS3cMXZANRy1IKfG8ZS+6Bngz
 Ra/w==
X-Gm-Message-State: AJIora9fm/YSgX5PH74ao/r8THXDlGcHj7QGCKz1L7MOldatCIQbPL6G
 blR7jIr8qHN/O7ZbSZhVcJ9/BmFO1jYaYh2FFh03Xk8ansC+0BAKLvxVMAtTXvGQLaH6ZaNQK8C
 TeduXFWR+IjSXNxTHwZbFZZOBgX1BWgw2+adN1jKpTap6KJc6uyI/Tkp0X8yxhrYSM8Y=
X-Received: by 2002:a5d:560b:0:b0:218:5ba8:88e5 with SMTP id
 l11-20020a5d560b000000b002185ba888e5mr5909911wrv.100.1655225489886; 
 Tue, 14 Jun 2022 09:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thqrKxf89zn1kXi0eN6RQkctr5dfzjDAQ/ldpwTmw/9WBS79QcfYbI3awTtfqvPBhFjPm/FQ==
X-Received: by 2002:a5d:560b:0:b0:218:5ba8:88e5 with SMTP id
 l11-20020a5d560b000000b002185ba888e5mr5909891wrv.100.1655225489590; 
 Tue, 14 Jun 2022 09:51:29 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 m12-20020a5d6a0c000000b0020cdcb0efa2sm12222958wru.34.2022.06.14.09.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 09:51:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PATCH] tests/vm: allow running tests in an unconfigured source tree
Date: Tue, 14 Jun 2022 18:51:26 +0200
Message-Id: <20220614165126.1776413-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

tests/vm/Makefile.include used to assume that it could run in an unconfigured
source tree, and Cirrus CI relies on that.  It was however broken by commit
f4c66f1705 ("tests: use tests/venv to run basevm.py-based scripts", 2022-06-06),
which co-opted the virtual environment being used by avocado tests
to also run the basevm.py tests.

For now, reintroduce the usage of qemu.qmp from the source directory, but
without the sys.path() hacks.  The CI configuration can be changed to
install the package via pip when qemu.qmp is removed from the source tree.

Cc: John Snow <jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/Makefile.include | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 588bc999cc..5f5b1fbfe6 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -1,8 +1,17 @@
 # Makefile for VM tests
 
-.PHONY: vm-build-all vm-clean-all
+# Hack to allow running in an unconfigured build tree
+ifeq ($(wildcard $(SRC_PATH)/config-host.mak),)
+VM_PYTHON = PYTHONPATH=$(SRC_PATH)/python /usr/bin/env python3
+VM_VENV =
+HOST_ARCH := $(shell uname -m)
+else
+VM_PYTHON = $(TESTS_PYTHON)
+VM_VENV = check-venv
+HOST_ARCH = $(ARCH)
+endif
 
-HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
+.PHONY: vm-build-all vm-clean-all
 
 EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
@@ -85,10 +94,10 @@ vm-clean-all:
 $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 			$(SRC_PATH)/tests/vm/basevm.py \
 			$(SRC_PATH)/tests/vm/Makefile.include \
-			check-venv
+			$(VM_VENV)
 	@mkdir -p $(IMAGES_DIR)
 	$(call quiet-command, \
-		$(TESTS_PYTHON) $< \
+		$(VM_PYTHON) $< \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
@@ -100,11 +109,10 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 		--build-image $@, \
 		"  VM-IMAGE $*")
 
-
 # Build in VM $(IMAGE)
-vm-build-%: $(IMAGES_DIR)/%.img check-venv
+vm-build-%: $(IMAGES_DIR)/%.img $(VM_VENV)
 	$(call quiet-command, \
-		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
+		$(VM_PYTHON) $(SRC_PATH)/tests/vm/$* \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(DEBUG), --interactive) \
 		$(if $(J),--jobs $(J)) \
@@ -128,9 +136,9 @@ vm-boot-serial-%: $(IMAGES_DIR)/%.img
 		-device virtio-net-pci,netdev=vnet \
 	|| true
 
-vm-boot-ssh-%: $(IMAGES_DIR)/%.img check-venv
+vm-boot-ssh-%: $(IMAGES_DIR)/%.img $(VM_VENV)
 	$(call quiet-command, \
-		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
+		$(VM_PYTHON) $(SRC_PATH)/tests/vm/$* \
 		$(if $(J),--jobs $(J)) \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
-- 
2.36.1


