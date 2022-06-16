Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483C54DDB8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:58:52 +0200 (CEST)
Received: from localhost ([::1]:59638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lL1-0002jX-BI
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvt-0001tA-7l
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvr-0002uY-GS
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8HG/qQXLswedE4EcBkedeTP89cywFYsO8c70f7Dd9U=;
 b=gR7jydo2yHyng+Bhe+JqKy+3HaZdMdDdsVViLXGKb3C3RBaX1bbWeDXhkla/6ULTNbsrba
 6seToUZyAFPaoS+7FsDj5MfoxdHr4QkJRvQL9ffC+X++6zyxY/vHnsEUvhW1vMdzLaWgiC
 Evg0o2hkPdTjhTMtm7JYYyYefrwo9P0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-jNFGgcRwMG2m6cMemKKrsw-1; Thu, 16 Jun 2022 04:32:49 -0400
X-MC-Unique: jNFGgcRwMG2m6cMemKKrsw-1
Received: by mail-ed1-f70.google.com with SMTP id
 k21-20020aa7d2d5000000b0042dcac48313so773775edr.8
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8HG/qQXLswedE4EcBkedeTP89cywFYsO8c70f7Dd9U=;
 b=rOo5wxVEWjGzs3PQdPbsQHrwDSpt/tFWPoNDu4wHZoBxia1W4xnvl5ZfVJS8auavZn
 AbKOaVwbHesNtzm3rxWyoBQD4zxevuHlwpVxfV1mQVv20xYNtVv954PsBVkEXHc224Xl
 3FFHNN6627GGwBKmMbJGjxtVJZ8DoZvBJVOWHu25ROe8JOTUrUJ5QQBTWp7LxxROB6lI
 lRXR4TEjomxieSSZjvcnlP1kcBAThueJUD+6zk13RSybIxsOSS/YhluhRG/CbBHDoMj6
 CYL2q2F287mI0w0TfvVHQASkOINaV74ppLQ39tX7KvCIZI0zu03RezOQuP9nYgRbkbM9
 Xe9A==
X-Gm-Message-State: AJIora93bqBm5Scu8LaDdGKcozuNr4W1dnXIL3PS2NFkp0fHbD6qTnZ6
 ClMUdsZXztTddZbh47iroo18O6rK8OTDpcGSKBf4AUNVi0M4A+92IGP+4SNwv4Fa4eWEirPrn4b
 Hp/OP7u8f7Aj75Xrj5XCZELKh0SGdj38+0lZ5dEPcBpXlGmVtePeOHZ2JYx5YL4PWp6U=
X-Received: by 2002:a05:6402:1851:b0:42d:c904:d73b with SMTP id
 v17-20020a056402185100b0042dc904d73bmr4863883edy.417.1655368367516; 
 Thu, 16 Jun 2022 01:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJ0ENbW5Xa7JBeBD82kxZ5JaHMyHZx1icpJrFRNh2vbtbca83ptI9XLxSuGEf51JPZCJh0KA==
X-Received: by 2002:a05:6402:1851:b0:42d:c904:d73b with SMTP id
 v17-20020a056402185100b0042dc904d73bmr4863852edy.417.1655368367178; 
 Thu, 16 Jun 2022 01:32:47 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 lb25-20020a170907785900b006febc1e9fc8sm493622ejc.47.2022.06.16.01.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 17/21] tests/vm: allow running tests in an unconfigured source
 tree
Date: Thu, 16 Jun 2022 10:32:05 +0200
Message-Id: <20220616083209.117397-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



