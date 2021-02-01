Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA9130ABA3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:41:37 +0100 (CET)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bKa-0002hX-Uw
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFx-0006B8-9B
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFu-0001yY-LE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612193805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2EJSODB5LAHljHyR+fSWCk101JbX5colyD/l0sZhgo=;
 b=VEROJpvGgBH9Oir0Hu3CnVXCcLavSlsDMieQnPyIPEamHnIjolIKZkNCtVn0lN0DAKHceR
 pTW9IF5qSTGYr/ZUDTYEqCfOplgwvXKCt6huPu8Cud5FIT1shxl/kAy9Oe9ah41I23W+rT
 QjhP2Litt3nnQDsuz+9lBXJKxH9k8Ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-V03-vsoYNY-dwKls3e1uXA-1; Mon, 01 Feb 2021 10:36:44 -0500
X-MC-Unique: V03-vsoYNY-dwKls3e1uXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07AB01800D50;
 Mon,  1 Feb 2021 15:36:43 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC6925D6BA;
 Mon,  1 Feb 2021 15:36:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 4/4] NOT FOR MERGE: script for CPU model stuff related to
 x86-64 ABI levels
Date: Mon,  1 Feb 2021 15:36:06 +0000
Message-Id: <20210201153606.4158076-5-berrange@redhat.com>
In-Reply-To: <20210201153606.4158076-1-berrange@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script is something that I wrote in order to help with creation of
the first two patches. Since those patches are essentially static data
once created, I don't intend for this script to be called repeatedly
in future. I've just included here as a reference to show how I came
up with content.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/cpu-x86-uarch-abi.py | 194 +++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 scripts/cpu-x86-uarch-abi.py

diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
new file mode 100644
index 0000000000..8ef6d3ea08
--- /dev/null
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -0,0 +1,194 @@
+#!/usr/bin/python3
+
+from qemu import qmp
+import sys
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
+names = [model["name"] for model in models["return"]]
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
+    }
+
+
+# Calculate whether the CPU models satisfy each ABI level
+for name in models.keys():
+    for level in range(len(levels)):
+        match = True
+        for feat in levels[level]:
+            if feat not in models[name]["features"]:
+                match = False
+        models[name]["levels"][level] = match
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
+def find_closest_abi_models():
+    for level in range(len(abi_models)):
+        # Determine which CPU model(s) are the "best" match for the lowest
+        # common denominator. One of these will be used as the basis for
+        # defining the generic CPU model for this ABI level
+        distance = -1
+        for name in models.keys():
+            if not models[name]["levels"][level]:
+                continue
+
+            this = models[name]["distance"][level]
+            if distance == -1 or this < distance:
+                distance = this
+                best = name
+
+        for name in models:
+            if models[name]["distance"][level] == distance:
+                print("  >> Level %d match %s (distance %d)" % (
+                    level, name, models[name]["distance"][level]))
+                print("     Remove features: %s" %
+                      " ".join(models[name]["delta"][level]))
+
+if cmd == "abi-table":
+    print_uarch_abi_csv()
+elif cmd == "abi-model":
+    find_closest_abi_models()
-- 
2.29.2


