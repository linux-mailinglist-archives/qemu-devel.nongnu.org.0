Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6952EBFEA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 15:58:40 +0100 (CET)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAGl-0000UD-5r
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 09:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADM-0005RD-5X
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxADK-0003iP-KY
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 09:55:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id q18so2716624wrn.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3RJzGSpjz7/v4p9H4UuSoUkDmhbWuXiUZFVvcs4xmbc=;
 b=Oga2Wregt6MuOOwz6ZvaVojh+VErc6OqaXddjS2XZTlGuVoc7vJImS9ALjLIzVotyy
 LQFkGi/QdtOWsEDzNl1yPktGiyuw89h0swyCn6EyD2eY3zkk4UO7oINNpzL2YOBOgxnM
 DEwiLsklNjmiTf6VAp52jppXSWcJwR94spG0sqt0ZRAfxhDjugMZ2XcXEagSH5QGVy3B
 LeJ1lUK1UThXywu3QIqWYlBHxGL/sGXCyq7p81Wqi/PV4PExAHwxvqrBw9UyDH7v39G9
 huKROUQ7YMAqhbDho2LWC8ky9I6xXCH+tDKW4LcXsCZ3MaFWuuyn/A51X2eDyb/6AkBi
 InZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3RJzGSpjz7/v4p9H4UuSoUkDmhbWuXiUZFVvcs4xmbc=;
 b=AbAn19wHtQeeVjKL9spRpJiXpnCTG5kT666Py9cyqI18kUE2icKDVhPSGChZelr/09
 e3ndNOTEmCE8ygOyNPgAtZplIZoV4B3DNhfvZCbieo2Zp1sOjXo+HY9zflmCAkLjBcyz
 aXIp+bJ1Jw8/ck0MnNAAcjkqBvHuwcsjzfszqxWNFIgs3NVcYRLw+6hUyxJ5UWE7vDZ8
 kyXXvdlwlwj4uP/tnhAJOUObGbCvDSucR3CcJFY/9TWWg/djDZ+t/uA/VjEeDqZDKB6R
 wFXvu57rmwEPhWwNYodOSkpQt3/QfF2/Dc3fafdf/2mYx3+y6e/5MojTOpQo/Ljez5D1
 mM0g==
X-Gm-Message-State: AOAM531b5UuNnYz1Z1MbIUFQVwbCa2eHheN9HWZwxQMDHAhin0kJJJwg
 d6xGDMjYymykZOMJpJv2djqWAg8Whia3tA==
X-Google-Smtp-Source: ABdhPJxM2Atf5GsL/C2k4Te3LDVcFshCQqeHUFWR4nmT9evkLcSFU1NL6Z1okKOtN4JIfBN8UiQ5cw==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr4673806wru.152.1609944905349; 
 Wed, 06 Jan 2021 06:55:05 -0800 (PST)
Received: from avogadro.lan ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id s205sm3267770wmf.46.2021.01.06.06.55.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 06:55:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/52] lzfse: convert to meson
Date: Wed,  6 Jan 2021 15:54:59 +0100
Message-Id: <20210106145459.413716-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106145459.413716-1-pbonzini@redhat.com>
References: <20210106145459.413716-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
 configure         | 31 ++++---------------------------
 meson.build       | 20 +++++++++++++++++---
 meson_options.txt |  2 ++
 3 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/configure b/configure
index 63aba41f17..a1e1fa8b34 100755
--- a/configure
+++ b/configure
@@ -396,7 +396,7 @@ capstone="auto"
 lzo="auto"
 snappy="auto"
 bzip2="auto"
-lzfse="$default_feature"
+lzfse="auto"
 zstd="$default_feature"
 guest_agent="$default_feature"
 guest_agent_with_vss="no"
@@ -1323,9 +1323,9 @@ for opt do
   ;;
   --enable-bzip2) bzip2="enabled"
   ;;
-  --enable-lzfse) lzfse="yes"
+  --enable-lzfse) lzfse="enabled"
   ;;
-  --disable-lzfse) lzfse="no"
+  --disable-lzfse) lzfse="disabled"
   ;;
   --disable-zstd) zstd="no"
   ;;
@@ -2457,24 +2457,6 @@ EOF
   fi
 fi
 
-##########################################
-# lzfse check
-
-if test "$lzfse" != "no" ; then
-    cat > $TMPC << EOF
-#include <lzfse.h>
-int main(void) { lzfse_decode_scratch_size(); return 0; }
-EOF
-    if compile_prog "" "-llzfse" ; then
-        lzfse="yes"
-    else
-        if test "$lzfse" = "yes"; then
-            feature_not_found "lzfse" "Install lzfse devel"
-        fi
-        lzfse="no"
-    fi
-fi
-
 ##########################################
 # zstd check
 
@@ -6119,11 +6101,6 @@ if test "$avx512f_opt" = "yes" ; then
   echo "CONFIG_AVX512F_OPT=y" >> $config_host_mak
 fi
 
-if test "$lzfse" = "yes" ; then
-  echo "CONFIG_LZFSE=y" >> $config_host_mak
-  echo "LZFSE_LIBS=-llzfse" >> $config_host_mak
-fi
-
 if test "$zstd" = "yes" ; then
   echo "CONFIG_ZSTD=y" >> $config_host_mak
   echo "ZSTD_CFLAGS=$zstd_cflags" >> $config_host_mak
@@ -6693,7 +6670,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
-        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy \
+        -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 8861434721..2a3a840103 100644
--- a/meson.build
+++ b/meson.build
@@ -691,10 +691,24 @@ if not get_option('bzip2').auto() or have_block
     endif
   endif
 endif
+
 liblzfse = not_found
-if 'CONFIG_LZFSE' in config_host
-  liblzfse = declare_dependency(link_args: config_host['LZFSE_LIBS'].split())
+if not get_option('lzfse').auto() or have_block
+  liblzfse = cc.find_library('lzfse', has_headers: ['lzfse.h'],
+                             required: get_option('lzfse'),
+                             static: enable_static)
+endif
+if liblzfse.found() and not cc.links('''
+   #include <lzfse.h>
+   int main(void) { lzfse_decode_scratch_size(); return 0; }''', dependencies: liblzfse)
+  liblzfse = not_found
+  if get_option('lzfse').enabled()
+    error('could not link liblzfse')
+  else
+    warning('could not link liblzfse, disabling')
+  endif
 endif
+
 oss = not_found
 if 'CONFIG_AUDIO_OSS' in config_host
   oss = declare_dependency(link_args: config_host['OSS_LIBS'].split())
@@ -2368,7 +2382,7 @@ summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_
 summary_info += {'lzo support':       lzo.found()}
 summary_info += {'snappy support':    snappy.found()}
 summary_info += {'bzip2 support':     libbzip2.found()}
-summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
+summary_info += {'lzfse support':     liblzfse.found()}
 summary_info += {'zstd support':      config_host.has_key('CONFIG_ZSTD')}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
diff --git a/meson_options.txt b/meson_options.txt
index 62f2e94f14..7623dffc74 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -62,6 +62,8 @@ option('curses', type : 'feature', value : 'auto',
        description: 'curses UI')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
+option('lzfse', type : 'feature', value : 'auto',
+       description: 'lzfse support for DMG images')
 option('lzo', type : 'feature', value : 'auto',
        description: 'lzo compression support')
 option('rbd', type : 'feature', value : 'auto',
-- 
2.29.2

