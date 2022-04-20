Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D663508CA7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:59:27 +0200 (CEST)
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCjm-0007Jn-3P
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLq-0001ZH-1E
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLo-0000ye-6R
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so3954298wma.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ANspI++CsYKlNkA/AD97xyt60im8FmLRuEJ+jLCBuu0=;
 b=cy2DbyDr7jt7TIV13cSjFGULv+m/ZNO41yoShkynZhauC/4oVNow9/XU3fQxBXzpHj
 cxl5uO2v6WsLKE0SwbTaNVJUmGjEUNZjJgYER2Vkrd+EP1OPbHsQqvEghetqTswc0BIL
 SAv/Xt8gSEyahZ20nN0fGptT5zKQkkAgtdzhVv+7pT53AIJdTOmZ/aJeBn/fjfwXHrdJ
 huadxiI8bMq9glCRgSbD2F2jDv4twbj5h14gCQl4W73w1EU5+iqNqmFQHZXhlyuPjnyT
 WizGMsftAUs55YxCvnaVIiglAW0Ydzlgix5W1+xlrxvEGrn1EUVUNWE0xUurTHtyK+1a
 nFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ANspI++CsYKlNkA/AD97xyt60im8FmLRuEJ+jLCBuu0=;
 b=6H7zNJ4UgqAAmrZ2C7Zoe5+uIqfeF6UFTnGlGQ6npn5ybXIOs699pk5lv6ksxy95H7
 j/tZI4izcwFt2MfSrCaP/rcODvN01DzlwG/rN1ztA5WGY+rP5i4uCusWZ/228rHKo1Q2
 V6VJKSBw+yZEBrCciNI0Cx9KFGho2xeYQUffe11W+zWRenAjgV3vub6TneKVmqg7KmCp
 nzkJwpx1IVGn4HWGNLjrgBowWhUo/81YkZcoz+iY2sy8D5464pNWJBYjJo0ZZwiuSxcg
 A5M1sH6Du4KH4MwZzEPf5pifoa4jWtvUwYHbVMFICnWpXdlqSEtZ2mtuSz4hfLP/0K7d
 zqTQ==
X-Gm-Message-State: AOAM533H6sWyEBztl6VAdAjKcUOvoSOd22K6klVjUl04O8gh4TJJ8fzZ
 NgrKL2U8YHO4fgx6ROFt51wrErpe6wZpCA==
X-Google-Smtp-Source: ABdhPJzc37D5K0QwS1Ccuz0z7GOoNoYCTQY3uhWDq1bJFTw3gBiXIJzgPXjkGW165y9YDo24cvtcUw==
X-Received: by 2002:a05:600c:4fc9:b0:392:8906:7e5d with SMTP id
 o9-20020a05600c4fc900b0039289067e5dmr4158454wmq.179.1650468878856; 
 Wed, 20 Apr 2022 08:34:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/34] meson, configure: move bdrv whitelists to meson
Date: Wed, 20 Apr 2022 17:33:53 +0200
Message-Id: <20220420153407.73926-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Use the new support for string option parsing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 14 --------------
 meson.build                   | 27 ++++++++++++++++-----------
 meson_options.txt             |  4 ++++
 scripts/meson-buildoptions.sh |  8 ++++++++
 4 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index 3327a4887a..bc15854578 100755
--- a/configure
+++ b/configure
@@ -235,8 +235,6 @@ interp_prefix="/usr/gnemul/qemu-%M"
 static="no"
 cross_compile="no"
 cross_prefix=""
-block_drv_rw_whitelist=""
-block_drv_ro_whitelist=""
 host_cc="cc"
 lto="false"
 stack_protector=""
@@ -815,10 +813,6 @@ for opt do
     # configure to be used by RPM and similar macros that set
     # lots of directory switches by default.
   ;;
-  --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
-  ;;
-  --block-drv-ro-whitelist=*) block_drv_ro_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
-  ;;
   --enable-debug-tcg) debug_tcg="yes"
   ;;
   --disable-debug-tcg) debug_tcg="no"
@@ -1154,12 +1148,6 @@ Advanced options (experts only):
   --disable-stack-protector disable compiler-provided stack protection
   --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
   --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
-  --block-drv-rw-whitelist=L
-                           set block driver read-write whitelist
-                           (by default affects only QEMU, not tools like qemu-img)
-  --block-drv-ro-whitelist=L
-                           set block driver read-only whitelist
-                           (by default affects only QEMU, not tools like qemu-img)
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --cpu=CPU                Build for host CPU [$cpu]
@@ -2184,8 +2172,6 @@ fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
-echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
 qemu_version=$(head $source_path/VERSION)
 echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 8a7e4ab5c7..ee96cbc64e 100644
--- a/meson.build
+++ b/meson.build
@@ -1592,6 +1592,19 @@ have_virtfs = get_option('virtfs') \
 
 have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
 
+if get_option('block_drv_ro_whitelist') == ''
+  config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
+else
+  config_host_data.set('CONFIG_BDRV_RO_WHITELIST',
+        '"' + get_option('block_drv_ro_whitelist').replace(',', '", "') + '"')
+endif
+if get_option('block_drv_rw_whitelist') == ''
+  config_host_data.set('CONFIG_BDRV_RW_WHITELIST', '')
+else
+  config_host_data.set('CONFIG_BDRV_RO_WHITELIST',
+        '"' + get_option('block_drv_rw_whitelist').replace(',', '", "') + '"')
+endif
+
 foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
@@ -2207,16 +2220,8 @@ config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
-arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
 foreach k, v: config_host
-  if ignored.contains(k)
-    # do nothing
-  elif arrays.contains(k)
-    if v != ''
-      v = '"' + '", "'.join(v.split()) + '", '
-    endif
-    config_host_data.set(k, v)
-  elif k.startswith('CONFIG_')
+  if k.startswith('CONFIG_') and not ignored.contains(k)
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
 endforeach
@@ -3786,8 +3791,8 @@ summary_info = {}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    have_coroutine_pool}
 if have_block
-  summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
-  summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+  summary_info += {'Block whitelist (rw)': get_option('block_drv_rw_whitelist')}
+  summary_info += {'Block whitelist (ro)': get_option('block_drv_ro_whitelist')}
   summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
   summary_info += {'VirtFS support':    have_virtfs}
   summary_info += {'build virtiofs daemon': have_virtiofsd}
diff --git a/meson_options.txt b/meson_options.txt
index 891c0ec130..ec974003b3 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -21,6 +21,10 @@ option('default_devices', type : 'boolean', value : true,
 option('audio_drv_list', type: 'array', value: ['default'],
        choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl'],
        description: 'Set audio driver list')
+option('block_drv_rw_whitelist', type : 'string', value : '',
+       description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
+option('block_drv_ro_whitelist', type : 'string', value : '',
+       description: 'set block driver read-only whitelist (by default affects only QEMU, not tools like qemu-img)')
 option('fuzzing_engine', type : 'string', value : '',
        description: 'fuzzing engine library for OSS-Fuzz')
 option('trace_file', type: 'string', value: 'trace',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0e0548aa87..4c49d4af08 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -2,6 +2,12 @@
 meson_options_help() {
   printf "%s\n" '  --audio-drv-list=CHOICES Set audio driver list [default] (choices:'
   printf "%s\n" '                           alsa/coreaudio/default/dsound/jack/oss/pa/sdl)'
+  printf "%s\n" '  --block-drv-ro-whitelist=VALUE'
+  printf "%s\n" '                           set block driver read-only whitelist (by default'
+  printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
+  printf "%s\n" '  --block-drv-rw-whitelist=VALUE'
+  printf "%s\n" '                           set block driver read-write whitelist (by default'
+  printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
@@ -161,6 +167,8 @@ _meson_option_parse() {
     --disable-avx2) printf "%s" -Davx2=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
+    --block-drv-ro-whitelist=*) quote_sh "-Dblock_drv_ro_whitelist=$2" ;;
+    --block-drv-rw-whitelist=*) quote_sh "-Dblock_drv_rw_whitelist=$2" ;;
     --enable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=true ;;
     --disable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=false ;;
     --enable-bochs) printf "%s" -Dbochs=enabled ;;
-- 
2.35.1



