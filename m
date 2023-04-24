Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23716ED5E3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:07:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2P4-0007zB-Bn; Mon, 24 Apr 2023 16:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2P2-0007xW-5U
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2P0-00012G-Op
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3kmnqHRNkPrVSSzR0s0yiKhFrynEX8NWBk93M6ZT6s=;
 b=JrzWaamXQMKo+zlzRoqmkf5tx8y/1bzaS8srYl4S/1yOSAlxw5PjiP7dfKNAcYhPxiUEaX
 8rSlc2us99zu89C5+lAHsJ9T33Ugar1yxGDLKvD1PIU/iEtH5F7AGRdoeD4Bi43/qFl18a
 B8b4mqdYXFSFyhWYCNukcJvcWKtGlAY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-WBEKJe3RNB-aCuhnv2xRXQ-1; Mon, 24 Apr 2023 16:03:05 -0400
X-MC-Unique: WBEKJe3RNB-aCuhnv2xRXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A26FA0F382;
 Mon, 24 Apr 2023 20:03:04 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E43E41121318;
 Mon, 24 Apr 2023 20:03:03 +0000 (UTC)
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
Subject: [RFC PATCH v3 20/20] configure: bootstrap sphinx with mkvenv
Date: Mon, 24 Apr 2023 16:02:48 -0400
Message-Id: <20230424200248.1183394-21-jsnow@redhat.com>
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

When docs are explicitly requested, require Sphinx>=1.6.0. When docs are
explicitly disabled, don't bother to check for Sphinx at all. If docs
are set to "auto", attempt to locate Sphinx, but continue onward if it
wasn't located.

For the case that --enable-pypi is set to 'enabled' (the default) but
docs are set to 'auto' (also the default), do not actually consult PyPI
to install Sphinx. Only perform this action when docs are requested
explicitly.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0881fffc14..a247b9491c 100755
--- a/configure
+++ b/configure
@@ -1122,14 +1122,14 @@ fi
 
 # Suppress writing compiled files
 python="$python -B"
-
+mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
 
 mkvenv_flags=""
 if test "$pypi" = "enabled" ; then
     mkvenv_flags="--online"
 fi
 
-if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
+if ! $mkvenv ensure \
      $mkvenv_flags \
      --dir "${source_path}/python/wheels" \
      --diagnose "meson" \
@@ -1144,6 +1144,29 @@ fi
 # *exclusively*.
 meson="$(cd pyvenv/bin; pwd)/meson"
 
+# Conditionally ensure Sphinx is installed.
+
+mkvenv_flags=""
+if test "$pypi" = "enabled" -a "$docs" = "enabled" ; then
+    mkvenv_flags="--online"
+fi
+
+if test "$docs" != "disabled" ; then
+    if ! $mkvenv ensure \
+         $mkvenv_flags \
+         --diagnose "sphinx-build" \
+         "sphinx>=1.6.0" ;
+    then
+        if test "$docs" = "enabled" ; then
+            exit 1
+        fi
+        echo "Sphinx not found/usable, disabling docs."
+        docs=disabled
+    else
+        docs=enabled
+    fi
+fi
+
 echo "MKVENV ok!"
 
 # Probe for ninja
-- 
2.39.2


