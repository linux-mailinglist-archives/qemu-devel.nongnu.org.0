Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E422446F7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 11:27:45 +0200 (CEST)
Received: from localhost ([::1]:56838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6W00-00032Q-Qd
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 05:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6Vma-00058G-50
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:13:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47703
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VmS-0002qO-KV
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WybSXSLboaFhp2fxctgF8iQ3vFSA3UyY60XdLWDkp0w=;
 b=NjOdAu0QlwGbqv6/2a6c0/Wv3YZq3jdSPYe8TZ8IJZsbvTSN2dbICSVZcboDxrJ/wrz6af
 oXAePa/RpkJcqFQJWGyQLzHHQ+aLgeTYQuLxUurSE9ZPEdHZUaO61VPxBTALNHICs2H9HB
 p28b+hn7SFdQ75il7XmGgRWkMyaY8WA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-DSomYLw_OziSqNPUxRQyoQ-1; Fri, 14 Aug 2020 05:13:41 -0400
X-MC-Unique: DSomYLw_OziSqNPUxRQyoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D01A1015DC1
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:13:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EBBE709D2;
 Fri, 14 Aug 2020 09:13:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 017/150] configure: generate Meson cross file
Date: Fri, 14 Aug 2020 05:11:13 -0400
Message-Id: <20200814091326.16173-18-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 03:37:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 68 +++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index f99baba99e..c9f36153dd 100755
--- a/configure
+++ b/configure
@@ -8580,21 +8580,71 @@ echo "# Automatically generated by configure - do not modify" > "$iotests_common
 echo >> "$iotests_common_env"
 echo "export PYTHON='$python'" >> "$iotests_common_env"
 
+cross="config-meson.cross"
+cross_arg=
+
+if test -n "$cross_prefix"; then
+    echo "# Automatically generated by configure - do not modify" > $cross
+    echo "[binaries]" >> $cross
+    echo "c = '$cc'" >> $cross
+    echo "cpp = '$cxx'" >> $cross
+    echo "ar = '$ar'" >> $cross
+    echo "nm = '$nm'" >> $cross
+    echo "pkgconfig = '$pkg_config_exe'" >> $cross
+    echo "ranlib = '$ranlib'" >> $cross
+    echo "strip = '$strip'" >> $cross
+    echo "windres = '$windres'" >> $cross
+
+    echo "[host_machine]" >> $cross
+
+    # Hack: Meson expects an absolute path for the *build* machine
+    # for the prefix, so add a slash in front of a Windows path that
+    # includes a drive letter.
+    #
+    # See https://github.com/mesonbuild/meson/issues/7577.
+    if test "$mingw32" = "yes" ; then
+        echo "system = 'windows'" >> $cross
+        case prefix in
+            ?:*) pre_prefix=/ ;;
+        esac
+    fi
+    case "$ARCH" in
+        i386|x86_64)
+            echo "cpu_family = 'x86'" >> $cross
+            ;;
+        ppc64le)
+            echo "cpu_family = 'ppc64'" >> $cross
+            ;;
+        *)
+            echo "cpu_family = '$ARCH'" >> $cross
+            ;;
+    esac
+    echo "cpu = '$cpu'" >> $cross
+    if test "$bigendian" = "yes" ; then
+        echo "endian = 'big'" >> $cross
+    else
+        echo "endian = 'little'" >> $cross
+    fi
+
+    cross_arg="--cross-file=$cross"
+fi
+
 rm -rf meson-private/ meson-logs/ meson-info/
 NINJA=$PWD/ninjatool $meson setup \
-        --prefix "$prefix" \
-        --libdir "$libdir" \
-        --libexecdir "$libexecdir" \
-        --bindir "$bindir" \
-        --includedir "$includedir" \
-        --datadir "$datadir" \
-        --mandir "$mandir" \
-        --sysconfdir "$sysconfdir" \
-        --localstatedir "$local_statedir" \
+        --prefix "${pre_prefix}$prefix" \
+        --libdir "${pre_prefix}$libdir" \
+        --libexecdir "${pre_prefix}$libexecdir" \
+        --bindir "${pre_prefix}$bindir" \
+        --includedir "${pre_prefix}$includedir" \
+        --datadir "${pre_prefix}$datadir" \
+        --mandir "${pre_prefix}$mandir" \
+        --sysconfdir "${pre_prefix}$sysconfdir" \
+        --localstatedir "${pre_prefix}$local_statedir" \
         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
         -Ddebug=$(if test "$debug_info" = yes; then echo true; else echo false; fi) \
         -Dwerror=$(if test "$werror" = yes; then echo true; else echo false; fi) \
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
+        $cross_arg \
         "$PWD" "$source_path"
 
 if test "$?" -ne 0 ; then
-- 
2.26.2



