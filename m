Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D702EBFE3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 15:56:53 +0100 (CET)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAF1-0006MJ-Uu
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 09:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADK-0005Q5-CC
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADI-0003i9-Kx
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:06 -0500
Received: by mail-wr1-x436.google.com with SMTP id d26so2647681wrb.12
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 06:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ncqADiEEpy9dOU1KwAEcbGrSDBYME/U5BfFHW3uauLA=;
 b=gi2yvdxgFGDRQQgoVPbW91oumszTdQRnqZEGSaHOpLRWETVzYkpXGarnOT8HcZa0ks
 lPGcNvf5977BAPOnDcZdSNbrjaKNkkYHMksLT3pkGDAX6jmY2hbkMVT1fBMUf3226psP
 o7Z3wNylKC3sFInjng4bofd1Wy5uNlY6q8RzhHMhXXJVy8PPPZMliW4j0mA10j6lDyQ6
 qoZPQTj9SlETHdVWGK6eJdY+ebt3vDCaWFd4+Sqk9VGGGxokn3XKf4ewNVFu91m24Hzk
 fpNOfqX4f1qoSidgJA72LXR9sMkU/nFcxsXTvp1y809DQxswLp1IE7+o9/wyDqqahj00
 b8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ncqADiEEpy9dOU1KwAEcbGrSDBYME/U5BfFHW3uauLA=;
 b=U4hts5HipZaWTbD/iamcskmmnepDehcaEEPCp6bnu+0ZxziydI7zcUFtI4sL2fnZ6s
 9b3FVVjVY6fpD5uZejisBwigmU8uo63DI7n/oWFWRJ0OkwmR6TfPOI23Hk4tFrh4kQLS
 f/R5L/0tqZQiCbkKFSwGP38K+v0xv2Nub8LDmFNTjP4PpcRyazNjnhhdPkLbTGE0ONgR
 voSx8KjmWEaQlDcpjTAH4PMiR41whSRGo7WMA8uHpNhiIkNW3Zr35AYsZFBuriHWhtLD
 3ztzCMG6y54KO33eatEvUhxbPw1E3UyMlxk1bCb1AtPjo1pJniBpLWRuzv3Zx/KTV6h0
 OYkA==
X-Gm-Message-State: AOAM533ErlDRJ1fFVLbKS3GNJbY6H8bPYEdNxkzViZ60QJ6NuG77lOMu
 Q27qUcDe8+ALMhFDkMyWeFNMXw27ppfWNA==
X-Google-Smtp-Source: ABdhPJx9aF5FnhyMJR/kbHFcFLh1P6CkBcW4twPHxd6q2ZpBz8MF3O27Br3Ro7ktovoXZ5VN28Wwug==
X-Received: by 2002:adf:ce82:: with SMTP id r2mr4657444wrn.181.1609944903411; 
 Wed, 06 Jan 2021 06:55:03 -0800 (PST)
Received: from avogadro.lan ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id s205sm3267770wmf.46.2021.01.06.06.55.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 06:55:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/52] lzo: convert to meson
Date: Wed,  6 Jan 2021 15:54:57 +0100
Message-Id: <20210106145459.413716-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106145459.413716-1-pbonzini@redhat.com>
References: <20210106145459.413716-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 32 ++++----------------------------
 meson.build       | 21 ++++++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index 1904734259..934cb098aa 100755
--- a/configure
+++ b/configure
@@ -393,7 +393,7 @@ opengl_dmabuf="no"
 cpuid_h="no"
 avx2_opt="$default_feature"
 capstone="auto"
-lzo="$default_feature"
+lzo="auto"
 snappy="$default_feature"
 bzip2="auto"
 lzfse="$default_feature"
@@ -1311,9 +1311,9 @@ for opt do
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
@@ -2457,25 +2457,6 @@ EOF
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
 
@@ -6157,11 +6138,6 @@ if test "$avx512f_opt" = "yes" ; then
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
@@ -6741,7 +6717,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd \
+        -Drbd=$rbd -Dlzo=$lzo \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index f844fc51ab..34683d5030 100644
--- a/meson.build
+++ b/meson.build
@@ -749,10 +749,24 @@ snappy = not_found
 if 'CONFIG_SNAPPY' in config_host
   snappy = declare_dependency(link_args: config_host['SNAPPY_LIBS'].split())
 endif
+
 lzo = not_found
-if 'CONFIG_LZO' in config_host
-  lzo = declare_dependency(link_args: config_host['LZO_LIBS'].split())
+if not get_option('lzo').auto() or have_system
+  lzo = cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
+                        required: get_option('lzo'),
+                        static: enable_static)
+endif
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
@@ -937,6 +951,7 @@ config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_opti
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
+config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
 config_host_data.set('CONFIG_MPATH_NEW_API', mpathpersist_new_api)
 config_host_data.set('CONFIG_CURL', curl.found())
@@ -2336,7 +2351,7 @@ summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
-summary_info += {'lzo support':       config_host.has_key('CONFIG_LZO')}
+summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    config_host.has_key('CONFIG_SNAPPY')}
 summary_info += {'bzip2 support':     libbzip2.found()}
 summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
diff --git a/meson_options.txt b/meson_options.txt
index 7c8d70a7e2..08f0bffeaf 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -62,6 +62,8 @@ option('curses', type : 'feature', value : 'auto',
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



