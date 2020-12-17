Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A152DCED8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:53:17 +0100 (CET)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppyG-0000Bz-4r
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmL-0004hr-7t
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:57 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmJ-0007jX-30
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:40:56 -0500
Received: by mail-ed1-x52f.google.com with SMTP id q16so27921776edv.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=askZ63rhvBcn5/LKEeuQq1hjhGHYv5aruqKs/lccbAg=;
 b=U2W571SAvHdbXt0OY/hD9mJ+dvD9P7lxctOXAjrxudkwlOq9v3SQsqa0qAQzJmp603
 viDSkU7qiV7hgNhe7vAl5KAdwK2HDravAHFrTBMt7orclKEgdTUiqAm7TtqLeOEjTFfS
 0NIHYyRZ9s60nAtH3Wy9YNOcHRQSGl7DNFKg7J8pIm20YaIbMkEx+vn6Hqq2RNgGP6gF
 2GnYy6cbAIg6pe6uKYPGYuRmLcapwefsmUo9o7E12LESXmN7Sf4FucZRHozkGYJaqPFe
 zAk+dhHF0G9k0gewe6XIiAb6Aqc89rfy9j/bw/1ki+ChsxA26NUXsAUhO9CMSPOGBEWK
 8Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=askZ63rhvBcn5/LKEeuQq1hjhGHYv5aruqKs/lccbAg=;
 b=Er4GP8Qn8m6Z0wFlOxecJ97hf7yPsNJGzVpV3YQDZn9d3xBW8PRFJcmPgYLW2MozmP
 bSuy4jgVBH7Czv5u6+jHoOhKPOIY+uNa+i1vEE9RWrsWcjP9Pyuag0D2YkOM7FYz7pPQ
 IXsHQCmXyCgi0LCGxCNbOLPC0AU1P2WxFNGpC4GJdmZ8s+1ucQWhw7rNJJtqrlEKj+Jc
 5OF/9EtQSNWk5RlgMOkxv2Rp+v0W2R7869251zlMDjCNqawt7lN/DF2qDrCb8yAUh8cd
 p5jjnfRTZw8P4jP4A1jHIC52t0vDViPuuJsnshZl6/Js7eFqMB+VjK0svnE1wMXZL6KM
 gN0g==
X-Gm-Message-State: AOAM533kEhoq/PRnHQUi6EEBcn7W2b8gd1yjoIVNgo6SNZy7pBOmV9UU
 xUwgUCgqwrK3tJz7TQBJOzdcGncnFAQ=
X-Google-Smtp-Source: ABdhPJxRw2WsRNFM/9UzuGq8KNFlLnvk47xzlQ74hOF9NMuHNwbD3J5W6ODRjI6Y+Lzu+37IqVaDww==
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr37213768eds.134.1608198053304; 
 Thu, 17 Dec 2020 01:40:53 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/18] libnfs: convert to meson
Date: Thu, 17 Dec 2020 10:40:33 +0100
Message-Id: <20201217094044.46462-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=83=C2=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 27 ++++-----------------------
 meson.build       |  9 ++++++---
 meson_options.txt |  2 ++
 3 files changed, 12 insertions(+), 26 deletions(-)

diff --git a/configure b/configure
index e22c56e8f6..c404252b17 100755
--- a/configure
+++ b/configure
@@ -407,7 +407,7 @@ vss_win32_sdk="$default_feature"
 win_sdk="no"
 want_tools="$default_feature"
 libiscsi="auto"
-libnfs="$default_feature"
+libnfs="auto"
 coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
@@ -1143,9 +1143,9 @@ for opt do
   ;;
   --enable-libiscsi) libiscsi="enabled"
   ;;
-  --disable-libnfs) libnfs="no"
+  --disable-libnfs) libnfs="disabled"
   ;;
-  --enable-libnfs) libnfs="yes"
+  --enable-libnfs) libnfs="enabled"
   ;;
   --enable-profiler) profiler="yes"
   ;;
@@ -5561,20 +5561,6 @@ if test "$have_ubsan" = "yes"; then
   QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
 fi
 
-##########################################
-# Do we have libnfs
-if test "$libnfs" != "no" ; then
-  if $pkg_config --atleast-version=1.9.3 libnfs; then
-    libnfs="yes"
-    libnfs_libs=$($pkg_config --libs libnfs)
-  else
-    if test "$libnfs" = "yes" ; then
-      feature_not_found "libnfs" "Install libnfs devel >= 1.9.3"
-    fi
-    libnfs="no"
-  fi
-fi
-
 ##########################################
 
 # Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
@@ -6216,11 +6202,6 @@ if test "$zstd" = "yes" ; then
   echo "ZSTD_LIBS=$zstd_libs" >> $config_host_mak
 fi
 
-if test "$libnfs" = "yes" ; then
-  echo "CONFIG_LIBNFS=y" >> $config_host_mak
-  echo "LIBNFS_LIBS=$libnfs_libs" >> $config_host_mak
-fi
-
 if test "$seccomp" = "yes"; then
   echo "CONFIG_SECCOMP=y" >> $config_host_mak
   echo "SECCOMP_CFLAGS=$seccomp_cflags" >> $config_host_mak
@@ -6782,7 +6763,7 @@ NINJA=$ninja $meson setup \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
-        -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
+        -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 3f53a7f1b2..0b8c9c5917 100644
--- a/meson.build
+++ b/meson.build
@@ -319,8 +319,10 @@ if 'CONFIG_LIBXML2' in config_host
                                link_args: config_host['LIBXML2_LIBS'].split())
 endif
 libnfs = not_found
-if 'CONFIG_LIBNFS' in config_host
-  libnfs = declare_dependency(link_args: config_host['LIBNFS_LIBS'].split())
+if not get_option('libnfs').auto() or have_block
+  libnfs = dependency('libnfs', version: '>=1.9.3',
+                      required: get_option('libnfs'),
+                      method: 'pkg-config', static: enable_static)
 endif
 libattr = not_found
 if 'CONFIG_ATTR' in config_host
@@ -928,6 +930,7 @@ config_host_data.set('CONFIG_GLUSTERFS_ZEROFILL', glusterfs.version().version_co
 config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_has_stat)
 config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
+config_host_data.set('CONFIG_LIBNFS', libnfs.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -2286,7 +2289,7 @@ summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
 summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
 summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
 summary_info += {'libiscsi support':  libiscsi.found()}
-summary_info += {'libnfs support':    config_host.has_key('CONFIG_LIBNFS')}
+summary_info += {'libnfs support':    libnfs.found()}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 if targetos == 'windows'
   if 'WIN_SDK' in config_host
diff --git a/meson_options.txt b/meson_options.txt
index b562d4f1a6..4535bc4dc2 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -52,6 +52,8 @@ option('glusterfs', type : 'feature', value : 'auto',
        description: 'Glusterfs block device driver')
 option('libiscsi', type : 'feature', value : 'auto',
        description: 'libiscsi userspace initiator')
+option('libnfs', type : 'feature', value : 'auto',
+       description: 'libnfs block device driver')
 option('mpath', type : 'feature', value : 'auto',
        description: 'Multipath persistent reservation passthrough')
 option('iconv', type : 'feature', value : 'auto',
-- 
2.29.2



