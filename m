Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342539F8B7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:14:35 +0200 (CEST)
Received: from localhost ([::1]:37200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcV0-0000XK-Kp
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQa-00037F-8i
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQX-00020X-8Y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623161396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtFmrjScq88zOKvPHUm1P+vesCV6DL5Zgyq3Gg6bQ38=;
 b=dBEPs/MTKnJQ2be/ejZrwDig8aXxjnVp9SxMLVemv/mIyeM+18nissSpiEMkRDLaG9Yagd
 ywc+Vv3P6BwOQ18C7EG9WK7LoSWPlssHhqA+P9H6Oxmm040NdKBAJslJku4npbYf31A2+o
 U4jtUKgTt4IgseymoTNGsvPzY/a37nQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-CS1jDRo9MmK9epQ0npgE8Q-1; Tue, 08 Jun 2021 10:09:55 -0400
X-MC-Unique: CS1jDRo9MmK9epQ0npgE8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B91A501F0;
 Tue,  8 Jun 2021 14:09:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-153.phx2.redhat.com
 [10.3.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D03EF5D9DE;
 Tue,  8 Jun 2021 14:09:51 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] Acceptance Tests: introduce method to require a feature
 and option
Date: Tue,  8 Jun 2021 10:09:37 -0400
Message-Id: <20210608140938.863580-4-crosa@redhat.com>
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

In this context, and according to the qemu.utils.list_feature() utility
function, a feature is something is available as a QEMU command line
option that can take the "help" value.

This builds on top of that utility function, and allows test writers
to require, for instance, the "x-remote" (option) machine type
(feature).

This example is actually applied here to the reespective test, given
that the option is conditionally built, and the test will ERROR
without it.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 29 ++++++++++++++++++++++-
 tests/acceptance/multiprocess.py          |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 93c4b9851f..432caff4e6 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -11,6 +11,7 @@
 import logging
 import os
 import shutil
+import subprocess
 import sys
 import uuid
 import tempfile
@@ -45,7 +46,8 @@
 from qemu.utils import (
     get_info_usernet_hostfwd_port,
     kvm_available,
-    tcg_available,
+    list_feature,
+    tcg_available
 )
 
 def is_readable_executable_file(path):
@@ -182,6 +184,31 @@ def _get_unique_tag_val(self, tag_name):
             return vals.pop()
         return None
 
+    def require_feature(self, feature, option=None):
+        """
+        Requires a feature to be available for the test to continue
+
+        It takes into account the currently set qemu binary, and only checks
+        for by running a "qemu -$feature help" command.  If the specific option
+        is given, it checks if it's listed for the given feature.
+
+        If the check fails, the test is canceled.
+
+        :param feature: name of a QEMU feature, such as "accel" or "machine"
+        :type feature: str
+        :param option: the specific value for the feature.  For instance,
+                       if feature is "machine", option can be "q35".
+        type option: str
+        """
+        try:
+            options_available = list_feature(self.qemu_bin, feature)
+        except subprocess.CalledProcessError:
+            self.cancel('Feature "%s" does not appear to be present.' % feature)
+        if option is not None:
+            if option not in options_available:
+                self.cancel('Feature "%s" does not have "%s" as an option' %
+                            (feature, option))
+
     def require_accelerator(self, accelerator):
         """
         Requires an accelerator to be available for the test to continue
diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
index 96627f022a..4d8a40a510 100644
--- a/tests/acceptance/multiprocess.py
+++ b/tests/acceptance/multiprocess.py
@@ -22,6 +22,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
                 machine_type):
         """Main test method"""
         self.require_accelerator('kvm')
+        self.require_feature('machine', 'x-remote')
 
         # Create socketpair to connect proxy and remote processes
         proxy_sock, remote_sock = socket.socketpair(socket.AF_UNIX,
-- 
2.25.4


