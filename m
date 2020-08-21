Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CF24D25A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:30:54 +0200 (CEST)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94Jw-0005zY-WA
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94DD-0000s6-I4
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:23:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29576
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94DB-0001TM-Hg
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+4/G+9RPd3uE7o5pP5BcN0FDqnOuSLBhjK1SlQhots=;
 b=GA2iRhaWyF2QMU/K/cFAavIlqJ9mYa/BqRljsgnUUZVJz53PDvas6EoeO1chKEX8yWl+Nz
 wFol1KOLOjJLRJbm65mXg8dPEC3vTB3YLvcXo7sWykQ+tejTXdnnLuRF8g/e5n9+jnWfai
 pahM5G7OPfJUjvrzxNO/n3+ASu0BXdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-hrdFMXiNMAm2iqf6Z1nthg-1; Fri, 21 Aug 2020 06:23:49 -0400
X-MC-Unique: hrdFMXiNMAm2iqf6Z1nthg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E16B71DE0F
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:23:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CB2E5DA74;
 Fri, 21 Aug 2020 10:23:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 018/152] configure: generate Meson cross file
Date: Fri, 21 Aug 2020 06:21:15 -0400
Message-Id: <20200821102329.29777-19-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 configure   | 72 ++++++++++++++++++++++++++++++++++++++++++++++-------
 meson.build |  7 +++++-
 2 files changed, 69 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index ce32c568f8..a82045352c 100755
--- a/configure
+++ b/configure
@@ -8626,21 +8626,75 @@ echo >> "$iotests_common_env"
 echo "export PYTHON='$python'" >> "$iotests_common_env"
 
 if test "$skip_meson" = no; then
+cross="config-meson.cross.new"
+meson_quote() {
+    echo "['$(echo $* | sed "s/ /','/g")']"
+}
+
+echo "# Automatically generated by configure - do not modify" > $cross
+echo "[properties]" >> $cross
+test -z "$cxx" && echo "link_language = 'c'" >> $cross
+echo "[binaries]" >> $cross
+echo "c = $(meson_quote $cc)" >> $cross
+test -n "$cxx" && echo "cpp = $(meson_quote $cxx)" >> $cross
+echo "ar = $(meson_quote $ar)" >> $cross
+echo "nm = $(meson_quote $nm)" >> $cross
+echo "pkgconfig = $(meson_quote $pkg_config_exe)" >> $cross
+echo "ranlib = $(meson_quote $ranlib)" >> $cross
+echo "strip = $(meson_quote $strip)" >> $cross
+echo "windres = $(meson_quote $windres)" >> $cross
+if test -n "$cross_prefix"; then
+    cross_arg="--cross-file config-meson.cross"
+    # Hack: Meson expects an absolute path for the *build* machine
+    # for the prefix, so add a slash in front of a Windows path that
+    # includes a drive letter.
+    #
+    # See https://github.com/mesonbuild/meson/issues/7577.
+    echo "[host_machine]" >> $cross
+    if test "$mingw32" = "yes" ; then
+        echo "system = 'windows'" >> $cross
+        case $prefix in
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
+else
+    cross_arg="--native-file config-meson.cross"
+fi
+mv $cross config-meson.cross
+
 rm -rf meson-private meson-info meson-logs
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
diff --git a/meson.build b/meson.build
index 613983e464..5ad85a7314 100644
--- a/meson.build
+++ b/meson.build
@@ -15,7 +15,12 @@ add_project_link_arguments(config_host['QEMU_LDFLAGS'].split(),
 add_project_arguments(config_host['QEMU_INCLUDES'].split(),
                       language: ['c', 'cpp', 'objc'])
 
-add_languages('cpp', required: false, native: false)
+python = import('python').find_installation()
+
+link_language = meson.get_external_property('link_language', 'cpp')
+if link_language == 'cpp'
+  add_languages('cpp', required: true, native: false)
+endif
 if host_machine.system() == 'darwin'
   add_languages('objc', required: false, native: false)
 endif
-- 
2.26.2



