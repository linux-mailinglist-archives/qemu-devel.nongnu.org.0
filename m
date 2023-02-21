Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392969D7FD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 02:27:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUHP2-00038P-3r; Mon, 20 Feb 2023 20:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHOz-00035y-PD
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:25:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUHOw-0005yx-Md
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 20:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676942701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fk2Gn893/WwFt0DvSYHSimxhp15ctLipFqOUK1WDtTY=;
 b=WnW/ATRQHRN0WbtXhlJw67147N2EcAPqQn+Tu1H7GeZY83B3bzJbCg6fwdIhcpXmYrXc/T
 DplYO5LxUW4QD6Ns3vgCNX27/7kAgo0ABFkeIQnQUFpgUf7xaYYglbtbq7nfQxPaaK1Q1o
 a/2azlwlFj8hUKuxav49s/mYaz3ObiY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-N8JQ5JfHMcmgsAylqCTWfg-1; Mon, 20 Feb 2023 20:24:58 -0500
X-MC-Unique: N8JQ5JfHMcmgsAylqCTWfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A92D9800B23;
 Tue, 21 Feb 2023 01:24:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2138C2166B26;
 Tue, 21 Feb 2023 01:24:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Subject: [PATCH v3 1/6] configure: Look for auxiliary Python installations
Date: Mon, 20 Feb 2023 20:24:51 -0500
Message-Id: <20230221012456.2607692-2-jsnow@redhat.com>
In-Reply-To: <20230221012456.2607692-1-jsnow@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At the moment, we look for just "python3" and "python", which is good
enough almost all of the time. But ... if you are on a platform that
uses an older Python by default and only offers a newer Python as an
option, you'll have to specify --python=/usr/bin/foo every time.

As a courtesy, we can make a cursory attempt to locate a suitable Python
binary ourselves, looking for the remaining well-known binaries. This
also has the added benefit of making configure "just work" more often
on various BSD distributions that do not have the concept of a
"platform default python".

This configure loop will prefer, in order:

1. Whatever is specified in $PYTHON
2. python3
3. python (Which is usually 2.x, but might be 3.x on some platforms.)
4. python3.11 down through python3.6

Notes:

- Python virtual environments provide binaries for "python3", "python",
  and whichever version you used to create the venv,
  e.g. "python3.8". If configure is invoked from inside of a venv, this
  configure loop will not "break out" of that venv unless that venv is
  created using an explicitly non-suitable version of Python that we
  cannot use.

- In the event that no suitable python is found, the first python found
  is the version used to generate the human-readable error message.

- The error message isn't printed right away to allow later
  configuration code to pick up an explicitly configured python.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index cf6db3d5518..6abf5a72078 100755
--- a/configure
+++ b/configure
@@ -592,20 +592,40 @@ esac
 
 : ${make=${MAKE-make}}
 
-# We prefer python 3.x. A bare 'python' is traditionally
-# python 2.x, but some distros have it as python 3.x, so
-# we check that too
+
+check_py_version() {
+    # We require python >= 3.6.
+    # NB: a True python conditional creates a non-zero return code (Failure)
+    "$1" -c 'import sys; sys.exit(sys.version_info < (3,6))'
+}
+
 python=
+first_python=
 explicit_python=no
-for binary in "${PYTHON-python3}" python
+# Check for $PYTHON, python3, python, then explicitly-versioned interpreters.
+for binary in "${PYTHON-python3}" ${PYTHON:+python3} python \
+                                  python3.11 python3.10 python3.9 \
+                                  python3.8 python3.7 python3.6
 do
     if has "$binary"
     then
         python=$(command -v "$binary")
-        break
+        if test -z "$first_python"; then
+           first_python=$python
+        fi
+        if check_py_version "$python"; then
+            # This one is good.
+            first_python=
+            break
+        fi
     fi
 done
 
+# If first_python is set, we didn't find a suitable binary.
+# Use this one for possible future error messages.
+if test -n "$first_python"; then
+    python="$first_python"
+fi
 
 # Check for ancillary tools used in testing
 genisoimage=
@@ -1037,9 +1057,7 @@ then
     error_exit "GNU make ($make) not found"
 fi
 
-# Note that if the Python conditional here evaluates True we will exit
-# with status 1 which is a shell 'false' value.
-if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
+if ! check_py_version "$python"; then
   error_exit "Cannot use '$python', Python >= 3.6 is required." \
       "Use --python=/path/to/python to specify a supported Python."
 fi
-- 
2.39.0


