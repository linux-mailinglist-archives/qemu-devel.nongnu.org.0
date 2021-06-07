Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5039DE49
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:02:38 +0200 (CEST)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFpt-0003dm-D7
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqFmV-0001UK-HR
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqFmO-0004VI-Gh
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623074339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52tT4MEIVSxdQDRah/We1zDDbjRrS+6yjiMdvor+z9s=;
 b=Fzl+h1r8pT4kLSFCzXkSMuDY0eZ0SbOmmHFs5axWag6ohb32xJnDBeo31gO97/rtf0kBsD
 udHIqR6kvbICcW2qSkpRClApl4fwjfY0AJtL+3tyAdLY8evofoVHZO1M+EfqUT7X6fN759
 H0V9FncfeRhaYv9a4DuQqDYMZ+yKMfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-7tTMhx0DN3OzKVgVsEitjw-1; Mon, 07 Jun 2021 09:58:58 -0400
X-MC-Unique: 7tTMhx0DN3OzKVgVsEitjw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 525AE803621;
 Mon,  7 Jun 2021 13:58:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-203.ams2.redhat.com
 [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5779819C66;
 Mon,  7 Jun 2021 13:58:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] scripts: helper to generate x86_64 CPU ABI compat info
Date: Mon,  7 Jun 2021 14:58:42 +0100
Message-Id: <20210607135843.196595-4-berrange@redhat.com>
In-Reply-To: <20210607135843.196595-1-berrange@redhat.com>
References: <20210607135843.196595-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script is what is used to generate the docs data table in:

  docs/system/cpu-models-x86-abi.csv

It can be useful to run if adding new CPU models / versions and
the csv needs updating.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/cpu-x86-uarch-abi.py | 194 +++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 scripts/cpu-x86-uarch-abi.py

diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
new file mode 100644
index 0000000000..08acc52a81
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


