Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D83C6F4E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 13:16:36 +0200 (CEST)
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3GOx-0000AH-LY
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 07:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3GNu-0007g9-Qj
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3GNs-0007Mv-Aa
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 07:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626174927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yTLHe/jWBUeL2aAS6LcMlwsefPk5JsUY4+/VuG9Jzng=;
 b=N0CcPoheys0aIAnQlWaPLqEv9yCPTYOhNiXjCGFsSlOV2jC/GqXPz3+AvzxpC0e0EqsDD9
 jSbJe9spJIoOuaLG8bHR0PKq//s+1zCOjfD8c7Ocq0MCm5YrNzpH82KbsshUAp9cX6R1mF
 MuE18gb7hTEhJ5B2T9zy4MpilzyEGqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-BWcboGzxPiW9VCegki0LyQ-1; Tue, 13 Jul 2021 07:15:24 -0400
X-MC-Unique: BWcboGzxPiW9VCegki0LyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D209F8030D7
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 11:15:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E1BC369A;
 Tue, 13 Jul 2021 11:15:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] configure / meson: Move the GBM handling to meson.build
Date: Tue, 13 Jul 2021 13:15:16 +0200
Message-Id: <20210713111516.734834-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GBM library detection does not need to be in the configure script,
since it does not have any user-facing options (there are no
--enable-gbm or --disable-gbm switches). Let's move it to meson.build
instead, so we don't have to clutter config-host.mak with the related
switches.

Additionally, only check for GBM if it is really required, i.e. if we
either compile with OpenGL or with virglrenderer support.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure                          | 14 --------------
 contrib/vhost-user-gpu/meson.build |  5 ++---
 meson.build                        | 13 +++++++------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/configure b/configure
index 85db248ac1..7d86b481e2 100755
--- a/configure
+++ b/configure
@@ -3372,13 +3372,6 @@ esac
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
@@ -4673,13 +4666,6 @@ if test "$opengl" = "yes" ; then
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
index 6cd2dc582a..be7a7b0f69 100644
--- a/meson.build
+++ b/meson.build
@@ -469,11 +469,6 @@ if not get_option('zstd').auto() or have_block
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
@@ -813,11 +808,16 @@ coreaudio = not_found
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
+if virgl.found() or 'CONFIG_OPENGL' in config_host
+  gbm = dependency('gbm', method: 'pkg-config', kwargs: static_kwargs)
+endif
 
 gnutls = not_found
 if not get_option('gnutls').auto() or have_system
@@ -1214,6 +1214,7 @@ config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
 config_host_data.set('CONFIG_CURSES', curses.found())
+config_host_data.set('CONFIG_GBM', gbm.found())
 config_host_data.set('CONFIG_GLUSTERFS', glusterfs.found())
 if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_XLATOR_OPT', glusterfs.version().version_compare('>=4'))
@@ -3036,7 +3037,7 @@ summary_info += {'U2F support':       u2f.found()}
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


