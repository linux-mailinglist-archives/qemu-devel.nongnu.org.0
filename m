Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824D94D5145
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:32:10 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNa5-00032f-EG
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:32:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYd-0008PN-BF; Thu, 10 Mar 2022 13:30:39 -0500
Received: from [2607:f8b0:4864:20::22c] (port=33657
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYa-0006Si-Oc; Thu, 10 Mar 2022 13:30:39 -0500
Received: by mail-oi1-x22c.google.com with SMTP id x193so6902706oix.0;
 Thu, 10 Mar 2022 10:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KksAmfwngOvXexifphiRnS9fUUwbOAfod6oKkAWL/dE=;
 b=O8NbKwlvCa2SUK7rAx80kuXGPEnwhFQQvM7NHT+uPbQMBvuz39qngpDtuofAeD+W7V
 KCOMVH5fRBun9jaR+P9Fjl5DrJlKuWGOkgEwnD+TM+MjH51uPIuBVAr6em1xjbd1Myk1
 z79FfCY7XB3C8OpLoGs5Zg0KCMJSVBfZXLVlMZf9Bi+8gDkIJEySLMb4QmgByhwCqyOg
 Sq52s7MTYUXiI/hFFuVwMQJtdZF8pU++Dfp4jaSK3RKHWZSVBUe+wd0LB5Rmr31JZYfg
 mHtWdyxIhmSgtgeJCf3kzwWrL8u9mrYwVBjv9fQc1z3Zf3rpPqZNVdKAxjrD2WvgoKkV
 RObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KksAmfwngOvXexifphiRnS9fUUwbOAfod6oKkAWL/dE=;
 b=sqTVlNEbXeWbd/TwEFW2SRu/lnYfvEz9dSZdE/v+DrmmMk5dBF8FXh1Fso6Fhtb3rm
 MEyoY0AkO1tF6sYUTvVZNpZY4Zo88pikOoJFO/LGld/g2PJdp8yfK41c6Nn1EG6kLjEa
 fdUaxhneXpbZS+FvoAvh+N0dUnETjn8EuxCQZFV4dbyXtOmbHNBI9LerZN/7cMIqUfws
 DKNuUmKNAwbTvyJT4kXZsaMSHCDtaPOgb4AqixXSXdgP9nhUUMQeNTz8jkGiQ8dExA06
 gOvaoOsslIxuiQnGvj4uNLZyZqNAhV2lwzt6vcsCBq9ghc4ZCrIXnSq3WXVxJT03Rjkq
 E09A==
X-Gm-Message-State: AOAM530zEvq8HoUKcLF8KdKRBzw1tcisFCRyVyaUPFW3HZYLjoueN/sy
 4BOFfkvUkoU3hJmZvkZI9/tkpJLCtZk=
X-Google-Smtp-Source: ABdhPJyms771tYPfcsdo4u7S9G/Vh0GeL7JCLu0dpwtvkbZTJFc9URtppjPvGeBFVp2oSsaS9PyURg==
X-Received: by 2002:a05:6808:15a9:b0:2da:5978:4a43 with SMTP id
 t41-20020a05680815a900b002da59784a43mr3545342oiw.30.1646937035310; 
 Thu, 10 Mar 2022 10:30:35 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:35 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] avocado/ppc_74xx.py: check TCG accel for all tests
Date: Thu, 10 Mar 2022 15:30:07 -0300
Message-Id: <20220310183011.110391-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310183011.110391-1-danielhb413@gmail.com>
References: <20220310183011.110391-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All tests of this file, when running in an IBM POWER host and with
--disable-tcg, fail in a similar manner:

        Command: ./qemu-system-ppc -display none -vga none (...)
-cpu 7400 (...)
        Output: ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
PPC KVM module is not loaded. Try modprobe kvm_pr.
qemu-system-ppc: failed to initialize kvm: Invalid argument

We don't have a way of telling which KVM module is loaded in a Power
host (kvm_hv or kvm_pr). For now let's make all the tests of this
file depend on TCG support.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/ppc_74xx.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
index 556a9a7da9..f54757c243 100644
--- a/tests/avocado/ppc_74xx.py
+++ b/tests/avocado/ppc_74xx.py
@@ -11,6 +11,7 @@
 class ppc74xxCpu(QemuSystemTest):
     """
     :avocado: tags=arch:ppc
+    :avocado: tags=accel:tcg
     """
     timeout = 5
 
@@ -18,6 +19,7 @@ def test_ppc_7400(self):
         """
         :avocado: tags=cpu:7400
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -27,6 +29,7 @@ def test_ppc_7410(self):
         """
         :avocado: tags=cpu:7410
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -36,6 +39,7 @@ def test_ppc_7441(self):
         """
         :avocado: tags=cpu:7441
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -45,6 +49,7 @@ def test_ppc_7445(self):
         """
         :avocado: tags=cpu:7445
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -54,6 +59,7 @@ def test_ppc_7447(self):
         """
         :avocado: tags=cpu:7447
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -63,6 +69,7 @@ def test_ppc_7447a(self):
         """
         :avocado: tags=cpu:7447a
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -72,6 +79,7 @@ def test_ppc_7448(self):
         """
         :avocado: tags=cpu:7448
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -81,6 +89,7 @@ def test_ppc_7450(self):
         """
         :avocado: tags=cpu:7450
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -90,6 +99,7 @@ def test_ppc_7451(self):
         """
         :avocado: tags=cpu:7451
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -99,6 +109,7 @@ def test_ppc_7455(self):
         """
         :avocado: tags=cpu:7455
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -108,6 +119,7 @@ def test_ppc_7457(self):
         """
         :avocado: tags=cpu:7457
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -117,6 +129,7 @@ def test_ppc_7457a(self):
         """
         :avocado: tags=cpu:7457a
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
-- 
2.35.1


