Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647AF401C2C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:19:18 +0200 (CEST)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEWr-0006K2-EH
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPB-0000ge-2q
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP9-0007Sm-2R
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id v10so9797055wrd.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mPOPkKKhr0wV8f1s7B0TgsIWkX6Xh6V7QOelvTLk/To=;
 b=MRKOpBZi7cRdyT8Y1KeIFLZHgHKPrUURQHGY3eObopMn6xD7jVH5ESA5FdCI1dvdEi
 ZNFLzU0a7mY8+6fEtOOfaZtSyA6t23kji5RgfBWSDmV1T2aUyHcbfR2ojUME9HOVeUsV
 Z1WXJk02bJOnXkF9LBWaav1/+Tj70TH3L78YKLflnTokyBk+GQjDWSDrLuBr8mstWXiT
 vjWjhezxvPnGTLgyDoDs/huipWpK5kI5DTq++Sq9JJfhqxPavarQdlcqiDmHG/sX2KRu
 ka41SnZcRuCHwqp6mqKGkPE66fQKVcEotN14gJQydKf5/nIDkrIQLMoEKTfnU7mm5G/a
 EXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mPOPkKKhr0wV8f1s7B0TgsIWkX6Xh6V7QOelvTLk/To=;
 b=AvTv0j0PbHru2lC1dc1aPzrEbaAC2kcoawtQbsBiBw/3U9RY2/HHv/g9ih1S4pt9Ca
 nQgWdznKoj99PCzWlHIOlvwncgU+8JglPh06A/lNhS12SYuBk5HDnfeo4y81oUhwp+jZ
 2vK+hlRMmQUuiBJ8fh5ULFHe7TyfAR7Lhr20SyOISHNt822jH06NZFWZPi8B+oZSRCdB
 8r/j4Kz9ZyUtP/QEbjO2lWrDAUjQiFL1F/w3ClEUZW2P8x/RyhWM4la1ssaqL5NL2Re6
 Og1jddB/cBBRjQ81m7gGOQpJVgJSJ+VP2W1wg3ZQayps56/mOIIZwsj3cwHJjjfUQ1yF
 XrUA==
X-Gm-Message-State: AOAM530lguO/8ikxG/QeSX2NswL5Jbh2PmTrKdF6zDD5PUwxJpmnOkJE
 uuCBhcqcc+LOB0HD9LZct7l2h958j9s=
X-Google-Smtp-Source: ABdhPJwH7Nh/ae2eHRHkbU8E2OcFTsy05HxayEO6iEospGQG7VNfyJDglZd98lGOJ3g5PQ5mXDkD8A==
X-Received: by 2002:adf:e712:: with SMTP id c18mr13263495wrm.438.1630933877793; 
 Mon, 06 Sep 2021 06:11:17 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/36] configure / meson: Move the GBM handling to meson.build
Date: Mon,  6 Sep 2021 15:10:31 +0200
Message-Id: <20210906131059.55234-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The GBM library detection does not need to be in the configure script,
since it does not have any user-facing options (there are no
--enable-gbm or --disable-gbm switches). Let's move it to meson.build
instead, so we don't have to clutter config-host.mak with the related
switches.

Additionally, only check for GBM if it is really required, i.e. if we
either compile with OpenGL or with virglrenderer support.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210713111516.734834-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
index bf63784812..13df8c37c7 100644
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
+if virgl.found() or 'CONFIG_OPENGL' in config_host
+  gbm = dependency('gbm', method: 'pkg-config',
+                   required: false, kwargs: static_kwargs)
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
@@ -3083,7 +3085,7 @@ summary_info += {'U2F support':       u2f.found()}
 summary_info += {'libusb':            libusb.found()}
 summary_info += {'usb net redir':     usbredir.found()}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
-summary_info += {'GBM':               config_host.has_key('CONFIG_GBM')}
+summary_info += {'GBM':               gbm.found()}
 summary_info += {'libiscsi support':  libiscsi.found()}
 summary_info += {'libnfs support':    libnfs.found()}
 if targetos == 'windows'
-- 
2.31.1



