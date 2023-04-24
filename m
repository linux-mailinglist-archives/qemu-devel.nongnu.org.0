Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05916ED5D9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:06:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Ox-0007qa-Tf; Mon, 24 Apr 2023 16:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ov-0007nk-Jn
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ou-0000y9-24
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haSGhn7+xY1tMHPJbNzMnLnBuxDDJ9oSFBnOrY3sQsg=;
 b=O+vNrDu8iUKmnAMPInDJANB33XVz+u94xtHr+uu1j0fjmVoSFEpqCi+xlxObEMc95zeVTB
 vujmOdrsI0rAKZWkZVxwFqDjixosisHmZoXeIHClfBPQ8DtHkAQXnjl5Fr0MU2Y8WIlgFe
 2Eg9/Stc6pIoYylBOnVQ34782HCTTvQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-7XstacTSNwi-nxAHOEDt1Q-1; Mon, 24 Apr 2023 16:02:59 -0400
X-MC-Unique: 7XstacTSNwi-nxAHOEDt1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C5C2280BF61;
 Mon, 24 Apr 2023 20:02:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 975331121318;
 Mon, 24 Apr 2023 20:02:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v3 13/20] configure: create a python venv unconditionally
Date: Mon, 24 Apr 2023 16:02:41 -0400
Message-Id: <20230424200248.1183394-14-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch changes the configure script so that it always creates and
uses a python virtual environment unconditionally.

Meson bootstrapping is temporarily altered to force the use of meson
from git or vendored source. The next commit restores the use of
distribution-vendored Meson.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 77c03315f8..462fe604d6 100755
--- a/configure
+++ b/configure
@@ -625,7 +625,6 @@ check_py_version() {
 python=
 first_python=
 if test -z "${PYTHON}"; then
-    explicit_python=no
     # A bare 'python' is traditionally python 2.x, but some distros
     # have it as python 3.x, so check in both places.
     for binary in python3 python python3.11 python3.10 python3.9 python3.8 python3.7 python3.6; do
@@ -644,7 +643,6 @@ else
     # Same as above, but only check the environment variable.
     has "${PYTHON}" || error_exit "The PYTHON environment variable does not point to an executable"
     python=$(command -v "$PYTHON")
-    explicit_python=yes
     if check_py_version "$python"; then
         # This one is good.
         first_python=
@@ -729,7 +727,7 @@ for opt do
   ;;
   --install=*)
   ;;
-  --python=*) python="$optarg" ; explicit_python=yes
+  --python=*) python="$optarg"
   ;;
   --skip-meson) skip_meson=yes
   ;;
@@ -1089,8 +1087,34 @@ if ! check_py_version "$python"; then
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
-# Resolve PATH + suppress writing compiled files
-python="$(command -v "$python") -B"
+# Resolve PATH
+python="$(command -v "$python")"
+explicit_python=yes
+
+# Create a Python virtual environment using our configured python.
+# The stdout of this script will be the location of a symlink that
+# points to the configured Python.
+# Entry point scripts for pip, meson, and sphinx are generated if those
+# packages are present.
+
+# Defaults assumed for now:
+# - venv is cleared if it exists already;
+# - venv is allowed to use system packages;
+# - all setup is performed **offline**;
+# - No packages are installed by default;
+# - pip is not installed into the venv when possible,
+#   but ensurepip is called as a fallback when necessary.
+
+echo "python determined to be '$python'"
+echo "python version: $($python --version)"
+
+python="$($python -B "${source_path}/python/scripts/mkvenv.py" create --gen pip,meson,sphinx pyvenv)"
+if test "$?" -ne 0 ; then
+    error_exit "python venv creation failed"
+fi
+
+# Suppress writing compiled files
+python="$python -B"
 
 has_meson() {
   local python_dir=$(dirname "$python")
@@ -1145,6 +1169,8 @@ case "$meson" in
     *) meson=$(command -v "$meson") ;;
 esac
 
+echo "MKVENV ok!"
+
 # Probe for ninja
 
 if test -z "$ninja"; then
-- 
2.39.2


