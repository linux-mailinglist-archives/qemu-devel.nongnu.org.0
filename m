Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C03AD334
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:57:07 +0200 (CEST)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKby-0006YZ-BW
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKY0-0008Oc-SZ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1luKXx-0006vs-C8
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624045976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoG4RBjGo5AhYSgso7Vz2QiPVshCnf415lDf5gw+MaU=;
 b=Y6wnztqJog2fQpsvYrHHxOaqj5/1t0SFikKomPMHDfVEsb3axABqf2s/dBa2aw6KBcPGTg
 fw2j2Ere36Gcn8vdoZFan2MG8m4oTC0LcHaA1KCshGf0MmO8WSTg6zckMYV/GxoIiOH2sw
 yA6uj1FvVo2POM1lmWBs9zJ70Cxe54c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-sKhx7mI-P5ekcKZ-hK_usw-1; Fri, 18 Jun 2021 15:52:48 -0400
X-MC-Unique: sKhx7mI-P5ekcKZ-hK_usw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0AB318D6A31;
 Fri, 18 Jun 2021 19:52:47 +0000 (UTC)
Received: from localhost (unknown [10.22.9.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 626CF5DD68;
 Fri, 18 Jun 2021 19:52:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 7/7] scripts: helper to generate x86_64 CPU ABI compat info
Date: Fri, 18 Jun 2021 15:52:37 -0400
Message-Id: <20210618195237.442548-8-ehabkost@redhat.com>
In-Reply-To: <20210618195237.442548-1-ehabkost@redhat.com>
References: <20210618195237.442548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This script is what is used to generate the docs data table in:

  docs/system/cpu-models-x86-abi.csv

It can be useful to run if adding new CPU models / versions and
the csv needs updating.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210607135843.196595-4-berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/cpu-x86-uarch-abi.py | 194 +++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 scripts/cpu-x86-uarch-abi.py

diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
new file mode 100644
index 00000000000..08acc52a816
--- /dev/null
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -0,0 +1,194 @@
+#!/usr/bin/python3
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# A script to generate a CSV file showing the x86_64 ABI
+# compatibility levels for each CPU model.
+#
+
+from qemu import qmp
+import sys
+
+if len(sys.argv) != 1:
+    print("syntax: %s QMP-SOCK\n\n" % __file__ +
+          "Where QMP-SOCK points to a QEMU process such as\n\n" +
+          " # qemu-system-x86_64 -qmp unix:/tmp/qmp,server,nowait " +
+          "-display none -accel kvm", file=sys.stderr)
+    sys.exit(1)
+
+# Mandatory CPUID features for each microarch ABI level
+levels = [
+    [ # x86-64 baseline
+        "cmov",
+        "cx8",
+        "fpu",
+        "fxsr",
+        "mmx",
+        "syscall",
+        "sse",
+        "sse2",
+    ],
+    [ # x86-64-v2
+        "cx16",
+        "lahf-lm",
+        "popcnt",
+        "pni",
+        "sse4.1",
+        "sse4.2",
+        "ssse3",
+    ],
+    [ # x86-64-v3
+        "avx",
+        "avx2",
+        "bmi1",
+        "bmi2",
+        "f16c",
+        "fma",
+        "abm",
+        "movbe",
+    ],
+    [ # x86-64-v4
+        "avx512f",
+        "avx512bw",
+        "avx512cd",
+        "avx512dq",
+        "avx512vl",
+    ],
+]
+
+# Assumes externally launched process such as
+#
+#   qemu-system-x86_64 -qmp unix:/tmp/qmp,server,nowait -display none -accel kvm
+#
+# Note different results will be obtained with TCG, as
+# TCG masks out certain features otherwise present in
+# the CPU model definitions, as does KVM.
+
+
+sock = sys.argv[1]
+cmd = sys.argv[2]
+shell = qmp.QEMUMonitorProtocol(sock)
+shell.connect()
+
+models = shell.cmd("query-cpu-definitions")
+
+# These QMP props don't correspond to CPUID fatures
+# so ignore them
+skip = [
+    "family",
+    "min-level",
+    "min-xlevel",
+    "vendor",
+    "model",
+    "model-id",
+    "stepping",
+]
+
+names = []
+
+for model in models["return"]:
+    if "alias-of" in model:
+        continue
+    names.append(model["name"])
+
+models = {}
+
+for name in sorted(names):
+    cpu = shell.cmd("query-cpu-model-expansion",
+                     { "type": "static",
+                       "model": { "name": name }})
+
+    got = {}
+    for (feature, present) in cpu["return"]["model"]["props"].items():
+        if present and feature not in skip:
+            got[feature] = True
+
+    if name in ["host", "max", "base"]:
+        continue
+
+    models[name] = {
+        # Dict of all present features in this CPU model
+        "features": got,
+
+        # Whether each x86-64 ABI level is satisfied
+        "levels": [False, False, False, False],
+
+        # Number of extra CPUID features compared to the x86-64 ABI level
+        "distance":[-1, -1, -1, -1],
+
+        # CPUID features present in model, but not in ABI level
+        "delta":[[], [], [], []],
+
+        # CPUID features in ABI level but not present in model
+        "missing": [[], [], [], []],
+    }
+
+
+# Calculate whether the CPU models satisfy each ABI level
+for name in models.keys():
+    for level in range(len(levels)):
+        got = set(models[name]["features"])
+        want = set(levels[level])
+        missing = want - got
+        match = True
+        if len(missing) > 0:
+            match = False
+        models[name]["levels"][level] = match
+        models[name]["missing"][level] = missing
+
+# Cache list of CPU models satisfying each ABI level
+abi_models = [
+    [],
+    [],
+    [],
+    [],
+]
+
+for name in models.keys():
+    for level in range(len(levels)):
+        if models[name]["levels"][level]:
+            abi_models[level].append(name)
+
+
+for level in range(len(abi_models)):
+    # Find the union of features in all CPU models satisfying this ABI
+    allfeatures = {}
+    for name in abi_models[level]:
+        for feat in models[name]["features"]:
+            allfeatures[feat] = True
+
+    # Find the intersection of features in all CPU models satisfying this ABI
+    commonfeatures = []
+    for feat in allfeatures:
+        present = True
+        for name in models.keys():
+            if not models[name]["levels"][level]:
+                continue
+            if feat not in models[name]["features"]:
+                present = False
+        if present:
+            commonfeatures.append(feat)
+
+    # Determine how many extra features are present compared to the lowest
+    # common denominator
+    for name in models.keys():
+        if not models[name]["levels"][level]:
+            continue
+
+        delta = set(models[name]["features"].keys()) - set(commonfeatures)
+        models[name]["distance"][level] = len(delta)
+        models[name]["delta"][level] = delta
+
+def print_uarch_abi_csv():
+    print("# Automatically generated from '%s'" % __file__)
+    print("Model,baseline,v2,v3,v4")
+    for name in models.keys():
+        print(name, end="")
+        for level in range(len(levels)):
+            if models[name]["levels"][level]:
+                print(",✅", end="")
+            else:
+                print(",", end="")
+        print()
+
+print_uarch_abi_csv()
-- 
2.31.1


