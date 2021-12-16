Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D133B476C40
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:54:32 +0100 (CET)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmX1-0004TV-S7
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUN-0000Za-3T
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUK-00048f-PI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DXohqXswgTBqzM99CvS1dZO31xqFN4j0wc4obLrF/I=;
 b=H3Zk541bMaSa+ZnkglDMPmd60zIU+KCBbQtK8WKntEBN4588heteAPGOUtnkEdybjCwtvJ
 ExcCjIWbT48Cvdga8+4B95agYrq4yL8nf1URAzXDltF4cNw5/WYljntgvXlTSUiSJ+KqWf
 TEu6O9O4l1RSfOC4kz9gRIGPyOBNnCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-50zSkA6HP0KX1ykUbmpjKg-1; Thu, 16 Dec 2021 03:51:42 -0500
X-MC-Unique: 50zSkA6HP0KX1ykUbmpjKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCE62100D841
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:41 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F65C2C1AB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] configure: simplify creation of plugin symbol list
Date: Thu, 16 Dec 2021 09:51:30 +0100
Message-Id: <20211216085139.99682-2-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dynamic-list is present on all supported ELF (not Windows or Darwin)
platforms, since it dates back to 2006; -exported_symbols_list is
likewise present on all supported versions of macOS.  Do not bother
doing a functional test in configure.

Since stuff is being moved to meson, move the creation of the
Darwin-formatted symbols list there, reducing the transform to a single
sed command.  This also requires using -Xlinker instead of -Wl, in order
to support weird paths that include a comma.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           | 16 ----------------
 plugins/meson.build | 13 +++++++++----
 2 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index d3aac031a5..ba7ab435a6 100755
--- a/configure
+++ b/configure
@@ -3689,22 +3689,6 @@ fi
 
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
-    # Copy the export object list to the build dir
-    if test "$ld_dynamic_list" = "yes" ; then
-	echo "CONFIG_HAS_LD_DYNAMIC_LIST=yes" >> $config_host_mak
-	ld_symbols=qemu-plugins-ld.symbols
-	cp "$source_path/plugins/qemu-plugins.symbols" $ld_symbols
-    elif test "$ld_exported_symbols_list" = "yes" ; then
-	echo "CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST=yes" >> $config_host_mak
-	ld64_symbols=qemu-plugins-ld64.symbols
-	echo "# Automatically generated by configure - do not modify" > $ld64_symbols
-	grep 'qemu_' "$source_path/plugins/qemu-plugins.symbols" | sed 's/;//g' | \
-	    sed -E 's/^[[:space:]]*(.*)/_\1/' >> $ld64_symbols
-    else
-	error_exit \
-	    "If \$plugins=yes, either \$ld_dynamic_list or " \
-	    "\$ld_exported_symbols_list should have been set to 'yes'."
-    fi
 fi
 
 if test -n "$gdb_bin"; then
diff --git a/plugins/meson.build b/plugins/meson.build
index b3de57853b..eec10283c5 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,10 +1,15 @@
 plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
-  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-    plugin_ldflags = ['-Wl,--dynamic-list=qemu-plugins-ld.symbols']
-  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-    plugin_ldflags = ['-Wl,-exported_symbols_list,qemu-plugins-ld64.symbols']
+  if targetos == 'darwin'
+    qemu_plugins_symbols_list = configure_file(
+      input: files('qemu-plugins.symbols'),
+      output: 'qemu-plugins-ld64.symbols',
+      capture: true,
+      command: ['sed', '-ne', 's/^[[:space:]]*\\(qemu_.*\\);/_\\1/p', '@INPUT@'])
+    plugin_ldflags = ['-Xlinker', '-exported_symbols_list', '-Xlinker', qemu_plugins_symbols_list]
+  else
+    plugin_ldflags = ['-Xlinker', '--dynamic-list=' + (meson.project_source_root() / 'plugins/qemu-plugins.symbols')]
   endif
 endif
 
-- 
2.33.1



