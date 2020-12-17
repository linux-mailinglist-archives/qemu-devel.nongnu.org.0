Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FB2DCF08
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:04:22 +0100 (CET)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpq8y-0002IS-3z
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmY-0004wi-N1
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:10 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmJ-0007jh-Gt
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:09 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ga15so36892389ejb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHUlVj/D5xv+plQtQIg0kY8a748yvyAJDUx9FuuVB8Q=;
 b=qseMN4N3EuH2jV+5+KOHwhHkiL6Xnjrj5B7Q5ehWa/jRQeJ6lBSFxz79zwQE7j15sq
 4fxN49Je6fXNaRcrVCYbpUIGhGBMO7sr9KeknAg0RwX8lRwD9Y/I5SEqFRVuk8EH+LCP
 hbZxuJYl7nTYg0n+uWqcYeLk5yyOS8FGnwd4eqkDeAyBuAqQbla808zya6k6SYzMtCWP
 8PgoR0Zx+h3DuCNZ0fIOSMzlfBq5ixwp5KAhqY6O0GaYEb8JcKHbaWospvwFzAPHHN3E
 ogiMZLzqxGNYMkpZsU90WiNpn2dg3Q6MPDhPNu2Ee9sgzmw0+zNem4O9YYBKn/odYYT/
 2hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qHUlVj/D5xv+plQtQIg0kY8a748yvyAJDUx9FuuVB8Q=;
 b=RyAKssaZv2tHxA3g7Fx0W7T39F5q2GeE6s2wFqjft75DbpJidsueadYzjrm+QJz8lz
 PBaECSzxkVsVdvwr9WHk9LKQ0QhhVF8mKV5Q/iZM+wUVxa9hBWI1K25DXQWqxmsLyuzp
 PajaHRL8ieclvkwFz7Txu2HjRTPuOi9hJnMX5GwsYd6xIP+536ztRo7rZZ9qmXmFCyfk
 MJuTxCVP8lRAlHVhha3ul2gTBOpCiYxPUTSOAduXn3FA4i9jKfOkVB5SQd+l5DEoCJQ6
 WIUMlxw7V34BqqhOy1D9Rbs5Bcoh9zoGrIXfb6wo8P+qL2M1ot6Es0+xmNJ1KORKgEEc
 71bw==
X-Gm-Message-State: AOAM531Tyi17u3jjyv4NPfvtTp3ZSq7/UgRi8T4XpRzpXxz/PVEPZFpG
 HRPr3myPEi8f96ZSYO7ZJTTYTJtecTw=
X-Google-Smtp-Source: ABdhPJxnUAXNK9QOT1AS/bWpwYDbd6U+b/gveIPQGjkgdgkueWwjIjK0pIawroXiU2wrlv077lOF3g==
X-Received: by 2002:a17:906:3999:: with SMTP id
 h25mr20659867eje.146.1608198054164; 
 Thu, 17 Dec 2020 01:40:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:53 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/18] libssh: convert to meson
Date: Thu, 17 Dec 2020 10:40:34 +0100
Message-Id: <20201217094044.46462-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
 configure         | 45 ++++-----------------------------------------
 meson.build       | 18 ++++++++++++++----
 meson_options.txt |  2 ++
 3 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/configure b/configure
index c404252b17..f3271381f1 100755
--- a/configure
+++ b/configure
@@ -430,7 +430,7 @@ auth_pam="$default_feature"
 vte="$default_feature"
 virglrenderer="$default_feature"
 tpm="$default_feature"
-libssh="$default_feature"
+libssh="auto"
 live_block_migration=${default_feature:-yes}
 numa="$default_feature"
 tcmalloc="no"
@@ -1424,9 +1424,9 @@ for opt do
   ;;
   --enable-tpm) tpm="yes"
   ;;
-  --disable-libssh) libssh="no"
+  --disable-libssh) libssh="disabled"
   ;;
-  --enable-libssh) libssh="yes"
+  --enable-libssh) libssh="enabled"
   ;;
   --disable-live-block-migration) live_block_migration="no"
   ;;
@@ -3630,38 +3630,6 @@ EOF
   fi
 fi
 
-##########################################
-# libssh probe
-if test "$libssh" != "no" ; then
-  if $pkg_config --exists libssh; then
-    libssh_cflags=$($pkg_config libssh --cflags)
-    libssh_libs=$($pkg_config libssh --libs)
-    libssh=yes
-  else
-    if test "$libssh" = "yes" ; then
-      error_exit "libssh required for --enable-libssh"
-    fi
-    libssh=no
-  fi
-fi
-
-##########################################
-# Check for libssh 0.8
-# This is done like this instead of using the LIBSSH_VERSION_* and
-# SSH_VERSION_* macros because some distributions in the past shipped
-# snapshots of the future 0.8 from Git, and those snapshots did not
-# have updated version numbers (still referring to 0.7.0).
-
-if test "$libssh" = "yes"; then
-  cat > $TMPC <<EOF
-#include <libssh/libssh.h>
-int main(void) { return ssh_get_server_publickey(NULL, NULL); }
-EOF
-  if compile_prog "$libssh_cflags" "$libssh_libs"; then
-    libssh_cflags="-DHAVE_LIBSSH_0_8 $libssh_cflags"
-  fi
-fi
-
 ##########################################
 # linux-aio probe
 
@@ -6288,12 +6256,6 @@ if test "$getauxval" = "yes" ; then
   echo "CONFIG_GETAUXVAL=y" >> $config_host_mak
 fi
 
-if test "$libssh" = "yes" ; then
-  echo "CONFIG_LIBSSH=y" >> $config_host_mak
-  echo "LIBSSH_CFLAGS=$libssh_cflags" >> $config_host_mak
-  echo "LIBSSH_LIBS=$libssh_libs" >> $config_host_mak
-fi
-
 if test "$live_block_migration" = "yes" ; then
   echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
 fi
@@ -6764,6 +6726,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
+        -Dlibssh=$libssh \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 0b8c9c5917..2d6660aa46 100644
--- a/meson.build
+++ b/meson.build
@@ -652,9 +652,17 @@ if not get_option('glusterfs').auto() or have_block
   endif
 endif
 libssh = not_found
-if 'CONFIG_LIBSSH' in config_host
-  libssh = declare_dependency(compile_args: config_host['LIBSSH_CFLAGS'].split(),
-                              link_args: config_host['LIBSSH_LIBS'].split())
+have_libssh_0_8 = false
+if not get_option('libssh').auto() or have_block
+  libssh = dependency('libssh',
+                      required: get_option('libssh'),
+                      method: 'pkg-config', static: enable_static)
+  if libssh.found()
+    have_libssh_0_8 = cc.links('''
+      #include <libssh/libssh.h>
+      int main(void) { return ssh_get_server_publickey(NULL, NULL); }
+    ''', dependencies: libssh)
+  endif
 endif
 libbzip2 = not_found
 if not get_option('bzip2').auto() or have_block
@@ -931,6 +939,8 @@ config_host_data.set('CONFIG_GLUSTERFS_FTRUNCATE_HAS_STAT', glusterfs_ftruncate_
 config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 config_host_data.set('CONFIG_LIBISCSI', libiscsi.found())
 config_host_data.set('CONFIG_LIBNFS', libnfs.found())
+config_host_data.set('CONFIG_LIBSSH', libssh.found())
+config_host_data.set('HAVE_LIBSSH_0_8', have_libssh_0_8)
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
@@ -2310,7 +2320,7 @@ summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
-summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
+summary_info += {'libssh support':    libssh.found()}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
 summary_info += {'lzo support':       config_host.has_key('CONFIG_LZO')}
diff --git a/meson_options.txt b/meson_options.txt
index 4535bc4dc2..6466dc67f6 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -54,6 +54,8 @@ option('libiscsi', type : 'feature', value : 'auto',
        description: 'libiscsi userspace initiator')
 option('libnfs', type : 'feature', value : 'auto',
        description: 'libnfs block device driver')
+option('libssh', type : 'feature', value : 'auto',
+       description: 'libssh block device driver')
 option('mpath', type : 'feature', value : 'auto',
        description: 'Multipath persistent reservation passthrough')
 option('iconv', type : 'feature', value : 'auto',
-- 
2.29.2



