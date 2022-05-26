Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32765534762
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:16:53 +0200 (CEST)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu1BM-0003uW-0A
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14f-0004Gr-BC
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14c-0002n8-P2
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Q+vpNPXyD/ja1n84ll0U/iteW3gWbU5rSV97kLzbnc=;
 b=TRp7q4xMhmXykNtBxErzfiX2oJe5e5dPP7hdqQKWnD22SwnB/v+KXT30njzgz6mHpZ7gws
 ojB1Jp+VcE0rIM2hjuYnTUUZ82+v3a0QRFDwEXoxR3M4kbZxxWZehvczZIUaJbU+eZXIuv
 6on99MTs+QT5RIdH8ToyCQ9HoagfHVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-ms8EyKNjNAazZcd1cvluLA-1; Wed, 25 May 2022 20:09:53 -0400
X-MC-Unique: ms8EyKNjNAazZcd1cvluLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB225101A54E;
 Thu, 26 May 2022 00:09:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C7FD2166B26;
 Thu, 26 May 2022 00:09:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 7/9] tests: use tests/venv to run basevm.py-based scripts
Date: Wed, 25 May 2022 20:09:19 -0400
Message-Id: <20220526000921.1581503-8-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

This patch co-opts the virtual environment being used by avocado tests
to also run the basevm.py tests. This is being done in preparation for
for the qemu.qmp package being removed from qemu.git.

As part of the change, remove any sys.path() hacks and treat "qemu" as a
normal third-party import.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/Makefile.include | 13 +++++++------
 tests/vm/basevm.py        |  6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index ae91f5043e5..588bc999cc9 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -84,10 +84,11 @@ vm-clean-all:
 
 $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 			$(SRC_PATH)/tests/vm/basevm.py \
-			$(SRC_PATH)/tests/vm/Makefile.include
+			$(SRC_PATH)/tests/vm/Makefile.include \
+			check-venv
 	@mkdir -p $(IMAGES_DIR)
 	$(call quiet-command, \
-		$(PYTHON) $< \
+		$(TESTS_PYTHON) $< \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
@@ -101,9 +102,9 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 
 
 # Build in VM $(IMAGE)
-vm-build-%: $(IMAGES_DIR)/%.img
+vm-build-%: $(IMAGES_DIR)/%.img check-venv
 	$(call quiet-command, \
-		$(PYTHON) $(SRC_PATH)/tests/vm/$* \
+		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(DEBUG), --interactive) \
 		$(if $(J),--jobs $(J)) \
@@ -127,9 +128,9 @@ vm-boot-serial-%: $(IMAGES_DIR)/%.img
 		-device virtio-net-pci,netdev=vnet \
 	|| true
 
-vm-boot-ssh-%: $(IMAGES_DIR)/%.img
+vm-boot-ssh-%: $(IMAGES_DIR)/%.img check-venv
 	$(call quiet-command, \
-		$(PYTHON) $(SRC_PATH)/tests/vm/$* \
+		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
 		$(if $(J),--jobs $(J)) \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 254e11c932b..d7d0413df35 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -18,9 +18,6 @@
 import logging
 import time
 import datetime
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.machine import QEMUMachine
-from qemu.utils import get_info_usernet_hostfwd_port, kvm_available
 import subprocess
 import hashlib
 import argparse
@@ -31,6 +28,9 @@
 import traceback
 import shlex
 
+from qemu.machine import QEMUMachine
+from qemu.utils import get_info_usernet_hostfwd_port, kvm_available
+
 SSH_KEY_FILE = os.path.join(os.path.dirname(__file__),
                "..", "keys", "id_rsa")
 SSH_PUB_KEY_FILE = os.path.join(os.path.dirname(__file__),
-- 
2.34.1


