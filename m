Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6AA39F8A5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:13:17 +0200 (CEST)
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcTk-00070G-5E
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQX-0002xo-At
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQU-0001yy-MU
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623161394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAIQtbHhBm5hiDXzC73PJ8AlCHtrIQkxvk6NGwK2V8w=;
 b=CKOkk4rzCALqrQrmUqLZJ5zjitpC92pxzLgqYO2FTzmHu5t+4s+UPKcR0cKM8W9zGufIw+
 hkQdeIyNg6+Xdsl3jJAlckL+HGEAWpXWcULsW8f1bgONcmueK9OfSMD9xzhtLGOruCmhQT
 alCzSREaziIQwWxayYlOC2zNZWQiRXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-kqBIXk8WM7eThd4_sBZEbg-1; Tue, 08 Jun 2021 10:09:53 -0400
X-MC-Unique: kqBIXk8WM7eThd4_sBZEbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA897800D62;
 Tue,  8 Jun 2021 14:09:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-153.phx2.redhat.com
 [10.3.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B6F5D9DE;
 Tue,  8 Jun 2021 14:09:49 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] Python QEMU utils: introduce a generic feature list
Date: Tue,  8 Jun 2021 10:09:36 -0400
Message-Id: <20210608140938.863580-3-crosa@redhat.com>
In-Reply-To: <20210608140938.863580-1-crosa@redhat.com>
References: <20210608140938.863580-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which can be used to check for any "feature" that is available as a
QEMU command line option, and that will return its list of available
options.

This is a generalization of the list_accel() utility function, which
is itself re-implemented in terms of the more generic feature.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/utils/__init__.py |  2 ++
 python/qemu/utils/accel.py    | 15 ++----------
 python/qemu/utils/feature.py  | 44 +++++++++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 13 deletions(-)
 create mode 100644 python/qemu/utils/feature.py

diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
index 7f1a5138c4..1d0789eaa2 100644
--- a/python/qemu/utils/__init__.py
+++ b/python/qemu/utils/__init__.py
@@ -20,12 +20,14 @@
 
 # pylint: disable=import-error
 from .accel import kvm_available, list_accel, tcg_available
+from .feature import list_feature
 
 
 __all__ = (
     'get_info_usernet_hostfwd_port',
     'kvm_available',
     'list_accel',
+    'list_feature',
     'tcg_available',
 )
 
diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
index 297933df2a..b5bb80c6d3 100644
--- a/python/qemu/utils/accel.py
+++ b/python/qemu/utils/accel.py
@@ -14,13 +14,11 @@
 # the COPYING file in the top-level directory.
 #
 
-import logging
 import os
-import subprocess
 from typing import List, Optional
 
+from qemu.utils.feature import list_feature
 
-LOG = logging.getLogger(__name__)
 
 # Mapping host architecture to any additional architectures it can
 # support which often includes its 32 bit cousin.
@@ -39,16 +37,7 @@ def list_accel(qemu_bin: str) -> List[str]:
     @raise Exception: if failed to run `qemu -accel help`
     @return a list of accelerator names.
     """
-    if not qemu_bin:
-        return []
-    try:
-        out = subprocess.check_output([qemu_bin, '-accel', 'help'],
-                                      universal_newlines=True)
-    except:
-        LOG.debug("Failed to get the list of accelerators in %s", qemu_bin)
-        raise
-    # Skip the first line which is the header.
-    return [acc.strip() for acc in out.splitlines()[1:]]
+    return list_feature(qemu_bin, 'accel')
 
 
 def kvm_available(target_arch: Optional[str] = None,
diff --git a/python/qemu/utils/feature.py b/python/qemu/utils/feature.py
new file mode 100644
index 0000000000..b4a5f929ab
--- /dev/null
+++ b/python/qemu/utils/feature.py
@@ -0,0 +1,44 @@
+"""
+QEMU feature module:
+
+This module provides a utility for discovering the availability of
+generic features.
+"""
+# Copyright (C) 2022 Red Hat Inc.
+#
+# Authors:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+import logging
+import subprocess
+from typing import List
+
+
+LOG = logging.getLogger(__name__)
+
+
+def list_feature(qemu_bin: str, feature: str) -> List[str]:
+    """
+    List available options the QEMU binary for a given feature type.
+
+    By calling a "qemu $feature -help" and parsing its output.
+
+    @param qemu_bin (str): path to the QEMU binary.
+    @param feature (str): feature name, matching the command line option.
+    @raise Exception: if failed to run `qemu -feature help`
+    @return a list of available options for the given feature.
+    """
+    if not qemu_bin:
+        return []
+    try:
+        out = subprocess.check_output([qemu_bin, '-%s' % feature, 'help'],
+                                      universal_newlines=True)
+    except:
+        LOG.debug("Failed to get the list of %s(s) in %s", feature, qemu_bin)
+        raise
+    # Skip the first line which is the header.
+    return [item.split(' ', 1)[0] for item in out.splitlines()[1:]]
-- 
2.25.4


