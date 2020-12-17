Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8412DCEB7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:47:07 +0100 (CET)
Received: from localhost ([::1]:34244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppsH-0002xv-VP
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmP-0004pV-4D
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:01 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmL-0007kg-2z
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:00 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u19so27970675edx.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sdm9DJbEOk14KqxbRA3HA1LywARm1ZJ32EVNtckhfz8=;
 b=m+UfQ79IlcrDNErYwpXuBrl77U24ism9S6nqs27rASpuj8IESN2PY6p0rP1M3DHaqh
 bD026oauWli9nUIPe62YQxCPVWAabjBfA7RUd6wRCwxkGBdLymUPp51Wq6Hryk6zrPI3
 jZFa/EfnsnXk/GLq9BbSJrYOJktEGBiVZFVnOm2FmcC7VUsl9ZXABbNm9NPEvQOjAmwS
 Y1lsOOMeD8XWjO1TErtxv+B238pPrBLvzy72++jSihZK9IPi9yz9XQDzHjPZRWbdkJdb
 Iq6YGvwwy2ZqkUpWqXya0686CpznmjNxYhuG1MrnsOX4H4nmxZE2AcaANgDq2FW5ZlSS
 Goqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sdm9DJbEOk14KqxbRA3HA1LywARm1ZJ32EVNtckhfz8=;
 b=j3I1OA4JmN5TLYJIx00j8BQh3AyJNSZSUG9wy5LsBChkA3hiCFZ9HpnWVV0LcX4uBB
 0itTJTz/YH9EnqacFzZ6q4N5r+Zb/ZOWMz8sZJP0pxB3Hzny77rKCSGiFjmt8TjgPLf6
 mbovGRf4X82rQXAM8q91LdIgtPfj+QZibtRX4h4ae6A85R0Jj28/frFprRS6nV8AQNlD
 inq3hoUkJ51hk9eXIsU5CmP8GyWCZo4TGj0bbLgLuyjTTtCgDVYsEM1FkqE45CNUpegZ
 rit179V5xoJs3VA6Jfjf4dmI1PnYYlxgVB+Pm80filbhJ93cRnswceXskEy+HpfJ14j9
 MiuA==
X-Gm-Message-State: AOAM530XOnuaVVGfNcqEZKTq4PM4DdB5rytUlcgUBWzsV8AE2pkVF2VQ
 bENfX0tKBjKOL+ROlYk6aRQwheehE/U=
X-Google-Smtp-Source: ABdhPJwChW+AeWZs5P9aLka62EsppZ4N22Hh9zARiJYPZGeObb91GPH34ItTcTjIQ8InGc7mMyt3HQ==
X-Received: by 2002:a50:ab51:: with SMTP id t17mr38153062edc.89.1608198055827; 
 Thu, 17 Dec 2020 01:40:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/18] lzo: convert to meson
Date: Thu, 17 Dec 2020 10:40:36 +0100
Message-Id: <20201217094044.46462-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
 configure         | 32 ++++----------------------------
 meson.build       | 20 ++++++++++++++++----
 meson_options.txt |  2 ++
 3 files changed, 22 insertions(+), 32 deletions(-)

diff --git a/configure b/configure
index e34885d505..f52f04d0e3 100755
--- a/configure
+++ b/configure
@@ -394,7 +394,7 @@ opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt="$default_feature"
 capstone="auto"
-lzo="$default_feature"
+lzo="auto"
 snappy="$default_feature"
 bzip2="auto"
 lzfse="$default_feature"
@@ -1312,9 +1312,9 @@ for opt do
   ;;
   --disable-zlib-test)
   ;;
-  --disable-lzo) lzo="no"
+  --disable-lzo) lzo="disabled"
   ;;
-  --enable-lzo) lzo="yes"
+  --enable-lzo) lzo="enabled"
   ;;
   --disable-snappy) snappy="no"
   ;;
@@ -2458,25 +2458,6 @@ EOF
   fi
 fi
 
-##########################################
-# lzo check
-
-if test "$lzo" != "no" ; then
-    cat > $TMPC << EOF
-#include <lzo/lzo1x.h>
-int main(void) { lzo_version(); return 0; }
-EOF
-    if compile_prog "" "-llzo2" ; then
-        lzo_libs="-llzo2"
-        lzo="yes"
-    else
-        if test "$lzo" = "yes"; then
-            feature_not_found "liblzo2" "Install liblzo2 devel"
-        fi
-        lzo="no"
-    fi
-fi
-
 ##########################################
 # snappy check
 
@@ -6126,11 +6107,6 @@ if test "$avx512f_opt" = "yes" ; then
   echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
 fi
 
-if test "$lzo" = "yes" ; then
-  echo "CONFIG_LZO=y" >> $config_host_mak
-  echo "LZO_LIBS=$lzo_libs" >> $config_host_mak
-fi
-
 if test "$snappy" = "yes" ; then
   echo "CONFIG_SNAPPY=y" >> $config_host_mak
   echo "SNAPPY_LIBS=$snappy_libs" >> $config_host_mak
@@ -6699,7 +6675,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Dlibssh=$libssh -Drbd=$rbd \
+        -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 6fa80e2d7e..0310d6d89a 100644
--- a/meson.build
+++ b/meson.build
@@ -753,10 +753,21 @@ snappy = not_found
 if 'CONFIG_SNAPPY' in config_host
   snappy = declare_dependency(link_args: config_host['SNAPPY_LIBS'].split())
 endif
-lzo = not_found
-if 'CONFIG_LZO' in config_host
-  lzo = declare_dependency(link_args: config_host['LZO_LIBS'].split())
+
+lzo = cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
+                      required: get_option('lzo'),
+                      static: enable_static)
+if lzo.found() and not cc.links('''
+   #include <lzo/lzo1x.h>
+   int main(void) { lzo_version(); return 0; }''', dependencies: lzo)
+  lzo = not_found
+  if get_option('lzo').enabled()
+    error('could not link liblzo2')
+  else
+    warning('could not link liblzo2, disabling')
+  endif
 endif
+
 rdma = not_found
 if 'CONFIG_RDMA' in config_host
   rdma = declare_dependency(link_args: config_host['RDMA_LIBS'].split())
@@ -941,6 +952,7 @@ config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_opti
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
+config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
@@ -2339,7 +2351,7 @@ summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    libssh.found()}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
-summary_info += {'lzo support':       config_host.has_key('CONFIG_LZO')}
+summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    config_host.has_key('CONFIG_SNAPPY')}
 summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
diff --git a/meson_options.txt b/meson_options.txt
index 630c9dceb7..00a5ec55bd 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -64,6 +64,8 @@ option('curses', type : 'feature', value : 'auto',
        description: 'curses UI')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
+option('lzo', type : 'feature', value : 'auto',
+       description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
 option('sdl', type : 'feature', value : 'auto',
-- 
2.29.2



