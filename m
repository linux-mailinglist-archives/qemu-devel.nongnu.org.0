Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E41449982
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:22:51 +0100 (CET)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7Q2-0008Ef-RU
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:22:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LH-0001Td-Gu
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LD-0000nP-Sv
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMrdeSiQ+KnelF2GFHW2ZMeVD2G2lXREHtMKu/SnDtA=;
 b=YxTrerTT8Yn+tcTglAk8AXcE1lVuMOBuVjy0t87xoTwMaWkzW6GD1HQFF6Hn72o5FyybzH
 aB+4yHLsMU4WC8H/W4MbV8OBPQpf45Xfdfbd6eLciPH6aWDAu0wgDGDLWCvDGe8+wZ8/OG
 pypUafvg0J5QaYTYGyKr1S/VncRnnCs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-pt7YrF-XNraMkYQxdtE81g-1; Mon, 08 Nov 2021 11:17:49 -0500
X-MC-Unique: pt7YrF-XNraMkYQxdtE81g-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so4188793wro.21
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMrdeSiQ+KnelF2GFHW2ZMeVD2G2lXREHtMKu/SnDtA=;
 b=CK/6kg0Syst7llvfvFcB86ahBgsYS4JoqcgVJoSVThf2JMctExvOR+Z2pafJe8Pm7f
 p36lUxEPfSKf3QNEbQF8hw/RSWGm3EZb0A8k+doJS3lJ2dk6yxSG/M0gq4iTv3raaJuf
 wnBcBNp4TjHTf9CAL8a+BtsenRziGKZNQy7WM6srI79H76Lf+jPcYxJxU18rQrlKkAal
 4sUZyJG6HlluhCooqbgVsGEJAkZ/gOIsWBzqX0q3IjNgJgtxdTK15Bm+Vg0NeBlulxzE
 cJNHm1DCTt0zeprQZPvZ8P1B/4/mbBQJ1BdbrhEW+7ZKHb7Nz4FO0esg9Jt/t7jXmw9z
 pDoQ==
X-Gm-Message-State: AOAM532B0j7iaW/iV9m72f1JGoeqfF4q1M043aVYLs2I2zdp0I6GLSg3
 AXOqyCfHFnSSzV6zGjieJczJFTlpmorWSkwQJEZ3Yd6CDzpZ57xfLhjbff5L5eEFXlAfdI9OHYc
 MUV6DlxvVNXO8NhqbARVXnUu/z2hDo10OXBHbbsc4c02f9UF8lNMRLofXHN4D3BBo
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr369591wrw.57.1636388267928;
 Mon, 08 Nov 2021 08:17:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvVljzw7CoKR/6g57sl6SdgMoMMrt2eZxDXfOxEgf5BENMlf9CYZKsABjke6mNuASq9QySLA==
X-Received: by 2002:a5d:6ac7:: with SMTP id u7mr369539wrw.57.1636388267641;
 Mon, 08 Nov 2021 08:17:47 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id k27sm18495352wms.41.2021.11.08.08.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:17:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] tests/acceptance: introduce new check-avocado target
Date: Mon,  8 Nov 2021 17:17:31 +0100
Message-Id: <20211108161739.1371503-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108161739.1371503-1-philmd@redhat.com>
References: <20211108161739.1371503-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

This introduces a new `make` target, `check-avocado`, and adds a
deprecation message about the `check-acceptance` target. This is
a preparation for renaming the `tests/acceptance` folder to
`tests/avocado`.

The plan is to remove the call to the `check-avocado` target one
or two months after the release and leave the warning to force
people to move to the new `check-avocado` target.

Later, the `check-acceptance` target can be removed. The intent
is to avoid a direct impact during the current soft freeze.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211105155354.154864-2-willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/Makefile.include | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8434a33fe68..8e8ee584933 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 endif
-	@echo " $(MAKE) check-acceptance     Run acceptance (functional) tests for currently configured targets"
+	@echo " $(MAKE) check-avocado        Run avocado (integration) tests for currently configured targets"
 	@echo
 	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
 	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
@@ -24,7 +24,7 @@ endif
 	@echo
 	@echo "The following are useful for CI builds"
 	@echo " $(MAKE) check-build          Build most test binaris"
-	@echo " $(MAKE) get-vm-images        Downloads all images used by acceptance tests, according to configured targets (~350 MB each, 1.5 GB max)"
+	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
 	@echo "The variable SPEED can be set to control the gtester speed setting."
@@ -83,7 +83,7 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 # Python venv for running tests
 
-.PHONY: check-venv check-acceptance
+.PHONY: check-venv check-avocado check-acceptance check-acceptance-deprecated-warning
 
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
@@ -127,12 +127,12 @@ get-vm-image-fedora-31-%: check-venv
 	$(call quiet-command, \
              $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
              --distro=fedora --distro-version=31 --arch=$*, \
-	"AVOCADO", "Downloading acceptance tests VM image for $*")
+	"AVOCADO", "Downloading avocado tests VM image for $*")
 
 # download all vm images, according to defined targets
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
-check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
+check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
@@ -142,6 +142,13 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/acceptance")
 
+check-acceptance-deprecated-warning:
+	@echo
+	@echo "Note '$(MAKE) check-acceptance' is deprecated, use '$(MAKE) check-avocado' instead."
+	@echo
+
+check-acceptance: check-acceptance-deprecated-warning | check-avocado
+
 # Consolidated targets
 
 .PHONY: check-block check check-clean get-vm-images
-- 
2.31.1


