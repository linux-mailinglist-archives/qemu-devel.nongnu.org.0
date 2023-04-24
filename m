Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46086ED5E7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:09:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Oy-0007qs-5F; Mon, 24 Apr 2023 16:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ov-0007nZ-F5
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ot-0000y5-VQ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xhmH6Vc5KqGvVDk+uJmEGXYVREIzNMxeSfbzKX+8gw=;
 b=ckd+piwc6vYw6XFvsfd0VHBmTQRzX3xbvjNUTAiom8CA/FWl+hB8FboDzw9/ehVSBvrGAS
 RtXaIToVL6V+N1rON6h8lM5nAbooUr0uSCqtt8ZatxRFExyTTSThnOMaiMss/mu7TCUtA/
 LkU0/PYFx64RY398A4Hon0L4oJXewCw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-8AqWwVHUMraMwh3EzKGPFQ-1; Mon, 24 Apr 2023 16:03:01 -0400
X-MC-Unique: 8AqWwVHUMraMwh3EzKGPFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5F2E88B7A1;
 Mon, 24 Apr 2023 20:03:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C4611121318;
 Mon, 24 Apr 2023 20:03:00 +0000 (UTC)
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
Subject: [RFC PATCH v3 15/20] configure: add --enable-pypi and --disable-pypi
Date: Mon, 24 Apr 2023 16:02:43 -0400
Message-Id: <20230424200248.1183394-16-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

In the event that there's no vendored source present and no sufficient
version of meson is found, we will attempt to connect to PyPI to install
the package ... only if '--disable-pypi' was not passed. This mechanism
is intended to replace the online functionality of the meson git submodule.

While --enable-pypi is the default, vendored source will always be
preferred when found, making PyPI a fallback. This should ensure that
configure-time venv building "just works" for almost everyone in almost
every circumstance.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e9947369b2..7421bb8364 100755
--- a/configure
+++ b/configure
@@ -623,6 +623,7 @@ check_py_version() {
 }
 
 python=
+pypi="enabled"
 first_python=
 if test -z "${PYTHON}"; then
     # A bare 'python' is traditionally python 2.x, but some distros
@@ -883,6 +884,10 @@ for opt do
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
@@ -1098,7 +1103,9 @@ target_python=$python
 # Defaults assumed for now:
 # - venv is cleared if it exists already;
 # - venv is allowed to use system packages;
-# - all setup is performed **offline**;
+# - all setup can be performed offline;
+# - missing packages may be fetched from PyPI,
+#   unless --disable-pypi is passed.
 # - pip is not installed into the venv when possible,
 #   but ensurepip is called as a fallback when necessary.
 
@@ -1114,7 +1121,13 @@ fi
 python="$python -B"
 
 
+mkvenv_flags=""
+if test "$pypi" = "enabled" ; then
+    mkvenv_flags="--online"
+fi
+
 if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
+     $mkvenv_flags \
      --dir "${source_path}/python/wheels" \
      "meson>=0.61.5" ;
 then
-- 
2.39.2


