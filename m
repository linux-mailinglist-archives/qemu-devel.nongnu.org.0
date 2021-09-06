Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04912401A9E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 13:33:34 +0200 (CEST)
Received: from localhost ([::1]:34896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNCsX-0007Kl-36
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 07:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNCp8-0004XR-VA
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNCp5-00048x-VA
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 07:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630927798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKgp4baRhOhctVz0mMqiacNWlQIUfqjG13IU8jrSXVg=;
 b=H2IHu87AflNE6Vzwg8U5ebRqw7bRTLNdDdxKRR7iG5rIctzCvTEUf4hNqlfx8cGQpBrTuL
 GItNzXWO7haXrgXTPbHYbesInDb0Iqr6/aSA6DRQpS97RlxMuHV8AtzTu4+ptu4yh1lWFx
 Yh1vQ7BuKyYDU/+CUH3LrobeyJEVpNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-PTloUZ_WPPCNm8O9iLYm7A-1; Mon, 06 Sep 2021 07:29:54 -0400
X-MC-Unique: PTloUZ_WPPCNm8O9iLYm7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5ADC10054F6;
 Mon,  6 Sep 2021 11:29:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3F126788D;
 Mon,  6 Sep 2021 11:29:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 06/10] configure / meson: Move the GBM handling to
 meson.build
Date: Mon,  6 Sep 2021 13:29:45 +0200
Message-Id: <20210906112945.88042-2-thuth@redhat.com>
In-Reply-To: <20210906112945.88042-1-thuth@redhat.com>
References: <20210906112945.88042-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GBM library detection does not need to be in the configure script,
since it does not have any user-facing options (there are no
--enable-gbm or --disable-gbm switches). Let's move it to meson.build
instead, so we don't have to clutter config-host.mak with the related
switches.

Additionally, only check for GBM if it is really required, i.e. if we
either compile with OpenGL or with virglrenderer support.

Message-Id: <20210714085045.797168-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                          | 14 --------------
 contrib/vhost-user-gpu/meson.build |  5 ++---
 meson.build                        | 14 ++++++++------
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/configure b/configure
index bd823307a6..8adf2127c3 100755
--- a/configure
+++ b/configure
@@ -3451,13 +3451,6 @@ esac
 ##########################################
 # opengl probe (for sdl2, gtk)
 
-gbm="no"
-if $pkg_config gbm; then
-    gbm_cflags="$($pkg_config --cflags gbm)"
-    gbm_libs="$($pkg_config --libs gbm)"
-    gbm="yes"
-fi
-
 if test "$opengl" != "no" ; then
   epoxy=no
   if $pkg_config epoxy; then
@@ -4688,13 +4681,6 @@ if test "$opengl" = "yes" ; then
   echo "OPENGL_LIBS=$opengl_libs" >> $config_host_mak
 fi
 
-if test "$gbm" = "yes" ; then
-    echo "CONFIG_GBM=y" >> $config_host_mak
-    echo "GBM_LIBS=$gbm_libs" >> $config_host_mak
-    echo "GBM_CFLAGS=$gbm_cflags" >> $config_host_mak
-fi
-
-
 if test "$avx2_opt" = "yes" ; then
   echo "CONFIG_AVX2_OPT=y" >> $config_host_mak
 fi
diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index 4cb52a91d7..92c8f3a86a 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -1,6 +1,5 @@
-if 'CONFIG_TOOLS' in config_host and virgl.found() \
-    and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host \
-    and pixman.found()
+if 'CONFIG_TOOLS' in config_host and virgl.found() and gbm.found() \
+    and 'CONFIG_LINUX' in config_host and pixman.found()
   executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
              dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl],
              install: true,
diff --git a/meson.build b/meson.build
index ecfdce921c..7e58e6279b 100644
--- a/meson.build
+++ b/meson.build
@@ -472,11 +472,6 @@ if not get_option('zstd').auto() or have_block
                     required: get_option('zstd'),
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
-gbm = not_found
-if 'CONFIG_GBM' in config_host
-  gbm = declare_dependency(compile_args: config_host['GBM_CFLAGS'].split(),
-                           link_args: config_host['GBM_LIBS'].split())
-endif
 virgl = not_found
 if not get_option('virglrenderer').auto() or have_system
   virgl = dependency('virglrenderer',
@@ -816,11 +811,17 @@ coreaudio = not_found
 if 'CONFIG_AUDIO_COREAUDIO' in config_host
   coreaudio = declare_dependency(link_args: config_host['COREAUDIO_LIBS'].split())
 endif
+
 opengl = not_found
 if 'CONFIG_OPENGL' in config_host
   opengl = declare_dependency(compile_args: config_host['OPENGL_CFLAGS'].split(),
                               link_args: config_host['OPENGL_LIBS'].split())
 endif
+gbm = not_found
+if (have_system or have_tools) and (virgl.found() or opengl.found())
+  gbm = dependency('gbm', method: 'pkg-config', required: false,
+                   kwargs: static_kwargs)
+endif
 
 gnutls = not_found
 gnutls_crypto = not_found
@@ -1244,6 +1245,7 @@ config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
+config_host_data.set('CONFIG_GBM', gbm.found())
 config_host_data.set('CONFIG_GLUSTERFS', glusterfs.found())
 if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_XLATOR_OPT', glusterfs.version().version_compare('>=4'))
@@ -3086,7 +3088,7 @@ summary_info += {'U2F support':       u2f.found()}
 summary_info += {'libusb':            libusb.found()}
 summary_info += {'usb net redir':     usbredir.found()}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
-summary_info += {'GBM':               config_host.has_key('CONFIG_GBM')}
+summary_info += {'GBM':               gbm.found()}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
 if targetos == 'windows'
-- 
2.27.0


