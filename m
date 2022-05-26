Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F9C53475D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:13:04 +0200 (CEST)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu17e-0006dC-H6
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14O-0003oB-5i
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14M-0002jS-Ko
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxFlhcWr88+2F/P4eqvu+xkMWXjv19qulamy6vzPyZM=;
 b=BDpqih19n1bMWz4TKYfyExKPS8zD3eIEoL7ML8+1kdGWClVFrNrLtRv45HmyqtxhnH8wEu
 acJX6RTclm71FxwTvNek6GUIWXXv07BEGaODcKBBt0qR5Y3I+5TD9VVf+T/KqTAQ1/RoU3
 7nbxP1w4TcZZMLNoZPcojSIjfp1DnEI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-1fdtMam4N6e7HyygcL0ghg-1; Wed, 25 May 2022 20:09:34 -0400
X-MC-Unique: 1fdtMam4N6e7HyygcL0ghg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DBD81C06ECC;
 Thu, 26 May 2022 00:09:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70AE92166B26;
 Thu, 26 May 2022 00:09:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 2/9] tests: add "TESTS_PYTHON" variable to Makefile
Date: Wed, 25 May 2022 20:09:14 -0400
Message-Id: <20220526000921.1581503-3-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

This is a convenience feature: $(PYTHON) points to the Python executable
we were instructed to use by the configure script. We use that Python to
create a virtual environment with the "check-venv" target in
tests/Makefile.include.

$(TESTS_PYTHON) points to the Python executable belonging to the virtual
environment tied to the build. This Python executable is a symlink to
the binary used to create the venv, which will be the version provided
at configure time.

Using $(TESTS_PYTHON) therefore uses the $(PYTHON) executable, but with
paths modified to use packages installed to the venv.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ec84b2ebc04..146aaa96a00 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -89,6 +89,7 @@ TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
+TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python
 ifndef AVOCADO_TESTS
 	AVOCADO_TESTS=tests/avocado
 endif
@@ -108,7 +109,7 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
             $(PYTHON) -m venv $@, \
             VENV, $@)
 	$(call quiet-command, \
-            $(TESTS_VENV_DIR)/bin/python -m pip -q install -r $(TESTS_VENV_REQ), \
+            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
             PIP, $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
@@ -126,7 +127,7 @@ FEDORA_31_DOWNLOAD=$(filter $(FEDORA_31_ARCHES),$(FEDORA_31_ARCHES_CANDIDATES))
 # download one specific Fedora 31 image
 get-vm-image-fedora-31-%: check-venv
 	$(call quiet-command, \
-             $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
+             $(TESTS_PYTHON) -m avocado vmimage get \
              --distro=fedora --distro-version=31 --arch=$*, \
 	"AVOCADO", "Downloading avocado tests VM image for $*")
 
@@ -135,7 +136,7 @@ get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOW
 
 check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
-            $(TESTS_VENV_DIR)/bin/python -m avocado \
+            $(TESTS_PYTHON) -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
-- 
2.34.1


