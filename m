Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05155B845
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:39:11 +0200 (CEST)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jKu-0008JG-PY
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCn-0005Ow-Tp
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:48 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jCm-000629-DS
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:30:45 -0400
Received: by mail-pf1-x431.google.com with SMTP id x138so5511451pfc.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NdMMt5pJjReoNXvd1kwyatt4oEzdoKgFGcBXEqCNEn0=;
 b=K3J9+2sUWCNPqOq5vsMhq7HtVENUUdcyFm4t1OYwvG+UAConGgDGmOTuaAV4gw8508
 SXj7BFsE1ZtzJDtttc0HX0yrZBEHw1qrOTUexNUXUzmx/903VQ7IZHRf5UbsFR/dL2Ah
 31/mLuJqXsaxiY5LIXcM8NUp6Hpd0Je9nW2iMc0DSLDy978/+JX424BXG/toloPd1pDD
 zAU1DZ4QRf2hcVmd4rnBbc5kiIUdBAwHBfl06HCOMd7Cidks2LWFVnTOZrbLRQwWFk7M
 75uMmC0UNNzmerT/nLiyk/8Y8uVIJQ5kbHT7dEAfzsf9EdSBgybB0nXgs8gC3MvSf5ET
 Y0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NdMMt5pJjReoNXvd1kwyatt4oEzdoKgFGcBXEqCNEn0=;
 b=bERiZvVwqsa15SQJObIPosqCP3DNldlRqLFOFRrIRabDny7jOWfpqNnp+o++DeeCtX
 z3OwW2agXJeHss+B10UuHDmKlVKBOiE3tR7Y4L+9FkaoBPci8EfcSm7plWOnETaocrzu
 94etdxOJs2eoB3VS5ifKEUy5QPz0oJ+CLfjN5VkaIMN8YAYjzQPR9OjPIROBo5OuabtE
 eP3J1reKq42nfMKMzSUqtqDuT6XByStqXm4LQQtdmECga1cNx59+P66kMfztlutbPV7e
 aCcCfrG2B2Ddzz/d2wyJr8U2ya5eHiipsMeScpr1RF0MUxSYXvn2nAevMe7NJZJV9ZYy
 A/QA==
X-Gm-Message-State: AJIora/DFN4AvUQhIbjbR9hbgp/bhjPRkrg5+hd21+6BEx57Jv7Qtcy/
 BICcaABEBMkexBJYPJ3DSbQYSKxTQdXq2Amwk0o=
X-Google-Smtp-Source: AGRyM1vPybhhkFSCIFtiLlLsciZXKHuGnooWnfA8hRwKq8qXqNq/XOUe/zWkO3e8fwLoEUt2GhfJrw==
X-Received: by 2002:a62:6dc2:0:b0:525:43c8:79f7 with SMTP id
 i185-20020a626dc2000000b0052543c879f7mr13197205pfc.49.1656315042870; 
 Mon, 27 Jun 2022 00:30:42 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:30:42 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 08/12] acpi/tests/bits: add biosbits config file for running
 bios tests
Date: Mon, 27 Jun 2022 12:58:52 +0530
Message-Id: <20220627072856.1529357-9-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This change adds initial biosbits config file that instructs biosbits to run
bios test suits in batch mode. Additionally acpi and smbios structures are also
dumped.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/acpi-bits/bits-config/bits-cfg.txt | 18 ++++++++++++++++++
 tests/qtest/acpi-bits/bits-config/meson.build  | 11 +++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 tests/qtest/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/qtest/acpi-bits/bits-config/meson.build

diff --git a/tests/qtest/acpi-bits/bits-config/bits-cfg.txt b/tests/qtest/acpi-bits/bits-config/bits-cfg.txt
new file mode 100644
index 0000000000..8010804453
--- /dev/null
+++ b/tests/qtest/acpi-bits/bits-config/bits-cfg.txt
@@ -0,0 +1,18 @@
+# BITS configuration file
+[bits]
+
+# To run BITS in batch mode, set batch to a list of one or more of the
+# following keywords; BITS will then run all of the requested operations, then
+# save the log file to disk.
+#
+# test: Run the full BITS testsuite.
+# acpi: Dump all ACPI structures.
+# smbios: Dump all SMBIOS structures.
+#
+# Leave batch set to an empty string to disable batch mode.
+# batch =
+
+# Uncomment the following to run all available batch operations
+# please take a look at boot/python/init.py in bits zip file
+# to see how these options are parsed and used.
+batch = test acpi smbios
diff --git a/tests/qtest/acpi-bits/bits-config/meson.build b/tests/qtest/acpi-bits/bits-config/meson.build
new file mode 100644
index 0000000000..bbd7a940dc
--- /dev/null
+++ b/tests/qtest/acpi-bits/bits-config/meson.build
@@ -0,0 +1,11 @@
+config_files = ['bits-cfg.txt']
+
+copycfgfiles = custom_target('copy cfg files',
+  input : config_files,
+  output :  config_files,
+  command : ['cp', '@INPUT@', '@OUTPUT@'],
+  install : true,
+  install_dir : 'bits-config',
+  build_by_default : true)
+
+other_deps += copycfgfiles
-- 
2.25.1


