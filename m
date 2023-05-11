Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE16FEA63
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:57:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOU-0007hQ-GT; Wed, 10 May 2023 23:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOR-0007g2-Jc
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOP-0005P1-Sg
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5tIgjiHYZF4WhZPS4fgXdVZSeMDXJsIQoNYOLECl7QU=;
 b=XnURQ/XxO5Yb39Dm+BC95/2lniMoTminKo4QdBHLnIeEz5in1wELqaDjkR4JoYXsKJLUlQ
 H4N8iT0zh9CL0um7AMPNSM93xPFk4zgPONP/IjCB9HblF8tTkaQHT20RJyfXTn4saCLHmV
 UvL/2G1+QMDu7SPYPSzGY4f///mVJNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-QbGYt_PpPXqmpyFlWLtlog-1; Wed, 10 May 2023 23:54:56 -0400
X-MC-Unique: QbGYt_PpPXqmpyFlWLtlog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0C9D85A588;
 Thu, 11 May 2023 03:54:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10DFB40C2077;
 Thu, 11 May 2023 03:54:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 22/27] configure: add --enable-pypi and --disable-pypi
Date: Wed, 10 May 2023 23:54:30 -0400
Message-Id: <20230511035435.734312-23-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In the event that there's no vendored source present and no sufficient
version of $package can be found, we will attempt to connect to PyPI to
install the package if '--disable-pypi' was not passed.

This means that PyPI access is "enabled by default", but there are some
subtleties that make this action occur much less frequently than you
might imagine:

(1) While --enable-pypi is the default, vendored source will always be
    preferred when found, making PyPI a fallback. This should ensure
    that configure-time venv building "just works" for almost everyone
    in almost every circumstance.

(2) Because meson source is, at time of writing, vendored directly into
    qemu.git, PyPI will never be used for sourcing meson.

(3) Because Sphinx is an optional dependency, if docs are set to "auto",
    PyPI will not be used to obtain Sphinx source as a fallback and
    instead docs will be disabled. If PyPI sourcing of sphinx is
    desired, --enable-docs should be passed to force the lookup. I chose
    this as the default behavior to avoid adding new internet lookups to
    a "default" invocation of configure.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 77d632e10d..590a1a3323 100755
--- a/configure
+++ b/configure
@@ -624,6 +624,7 @@ check_py_version() {
 }
 
 python=
+pypi="enabled"
 first_python=
 if test -z "${PYTHON}"; then
     # A bare 'python' is traditionally python 2.x, but some distros
@@ -889,6 +890,10 @@ for opt do
   --with-git-submodules=*)
       git_submodules_action="$optarg"
   ;;
+  --disable-pypi) pypi="disabled"
+  ;;
+  --enable-pypi) pypi="enabled"
+  ;;
   --enable-plugins) if test "$mingw32" = "yes"; then
                         error_exit "TCG plugins not currently supported on Windows platforms"
                     else
@@ -1102,7 +1107,9 @@ python="$(command -v "$python")"
 # Defaults assumed for now:
 # - venv is cleared if it exists already;
 # - venv is allowed to use system packages;
-# - all setup is performed **offline**;
+# - all setup can be performed offline;
+# - missing packages may be fetched from PyPI,
+#   unless --disable-pypi is passed.
 # - pip is not installed into the venv when possible,
 #   but ensurepip is called as a fallback when necessary.
 
@@ -1118,7 +1125,13 @@ fi
 python="$python -B"
 mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
 
+mkvenv_flags=""
+if test "$pypi" = "enabled" ; then
+    mkvenv_flags="--online"
+fi
+
 if ! $mkvenv ensure \
+     $mkvenv_flags \
      --dir "${source_path}/python/wheels" \
      --diagnose "meson" \
      "meson>=0.61.5" ;
@@ -1149,8 +1162,14 @@ fi
 
 # Conditionally ensure Sphinx is installed.
 
+mkvenv_flags=""
+if test "$pypi" = "enabled" -a "$docs" = "enabled" ; then
+    mkvenv_flags="--online"
+fi
+
 if test "$docs" != "disabled" ; then
     if ! $mkvenv ensure \
+         $mkvenv_flags \
          --diagnose "sphinx-build" \
          "sphinx>=1.6.0" sphinx_rtd_theme;
     then
-- 
2.40.0


