Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36483B1693
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:14:57 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyyG-0002uy-S9
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvyva-0004wL-1e
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvyvY-0008CU-8s
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624439527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DN7xXCj6GeyayX+Sce1wD//G94eg+PlnAGbkon3TEk=;
 b=So3m5MOfok8ppSBcU4O6/cQ7HXRlC05fIjeNaWZkRpoUy58vtjBMtNjvBbg1Y+DyZbScvs
 a33ceXaw2nJUe9p5a6W9Qu8Na8HH14C2/8UFLLz6j7x1bxiK5D4Knxxy0PBFhU5KZ4YSTp
 6V9P/VJ1acOe2UoiU/Vl37tOSoTwoK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-4iveC3tfOW-e1MRK8Z5k1A-1; Wed, 23 Jun 2021 05:12:06 -0400
X-MC-Unique: 4iveC3tfOW-e1MRK8Z5k1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36967100CA88;
 Wed, 23 Jun 2021 09:12:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1952960C13;
 Wed, 23 Jun 2021 09:11:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 729571800917; Wed, 23 Jun 2021 11:11:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] [hack] scripts/copy-dlls
Date: Wed, 23 Jun 2021 11:11:36 +0200
Message-Id: <20210623091137.1156959-3-kraxel@redhat.com>
In-Reply-To: <20210623091137.1156959-1-kraxel@redhat.com>
References: <20210623091137.1156959-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml |  3 +-
 scripts/copy-dlls                    | 56 ++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100755 scripts/copy-dlls

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 7d3ad00a1eb9..5411177935fc 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -12,7 +12,8 @@
           mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
-      then make installer;
+      then scripts/copy-dlls;
+      make installer;
       version="$(git describe --match v[0-9]*)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
       fi
diff --git a/scripts/copy-dlls b/scripts/copy-dlls
new file mode 100755
index 000000000000..0a84cd004c87
--- /dev/null
+++ b/scripts/copy-dlls
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+# copy dlls needed by windows binaries to $srcdir/dll/{w32,w64}
+# the nsis installer scripts expects them there
+#
+# TODO: rewrite in python and integrate into scripts/nsis.py
+#
+
+if test ! -f config-host.mak; then
+    echo "must be started in builddir"
+    exit 1
+fi
+
+eval $(egrep '(CONFIG_WIN32|QEMU_GA_MSI_MINGW_DLL_PATH|SRC_PATH)' config-host.mak)
+
+if test "$CONFIG_WIN32" != "y"; then
+    echo "not a windows build"
+    exit 1
+fi
+
+if test "$QEMU_GA_MSI_MINGW_DLL_PATH" = ""; then
+    echo "unknown dll path"
+    exit 1
+fi
+
+case "$QEMU_GA_MSI_MINGW_DLL_PATH" in
+    *-w32-*)
+	DESTDIR="$SRC_PATH/dll/w32"
+	;;
+    *-w64-*)
+	DESTDIR="$SRC_PATH/dll/w64"
+	;;
+    *)
+	echo "can't figure w32 vs. w64"
+	exit 1
+	;;
+esac
+
+function check_windows_binary_deps() {
+    local file="$1"
+    local dlls dll
+
+    dlls=$(objdump -p "$file" | awk '/DLL Name/ { print $3 }')
+    for dll in $dlls; do
+	test -f "$QEMU_GA_MSI_MINGW_DLL_PATH/$dll" || continue
+	test -f "$DESTDIR/$dll" && continue
+	echo "copy $dll"
+	cp "$QEMU_GA_MSI_MINGW_DLL_PATH/$dll" "$DESTDIR/$dll"
+	check_windows_binary_deps "$DESTDIR/$dll"
+    done
+}
+
+mkdir -p "$DESTDIR"
+for file in *.exe; do
+    check_windows_binary_deps $file
+done
-- 
2.31.1


