Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192A9489B83
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:44:41 +0100 (CET)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vua-00052p-7A
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqt-0001vz-Lr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:51 -0500
Received: from [2a00:1450:4864:20::532] (port=46760
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqp-0000Sl-07
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:49 -0500
Received: by mail-ed1-x532.google.com with SMTP id k15so54277604edk.13
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ov1ozqnlCtxpUjkwYLA+spiskpMg2mlrkuJmq80GAzM=;
 b=AuesgVZJU1dfVEZjLwCYao6ykkn9nUCUkQDaDc0tsuz0ebwDx3wNzYMm3tlK7HHWUI
 axLHa2nrQeOU2QTZd67iTO7SRnqlbwkkprQji87njoTSCoP/NUcfzvC3ORa4xiGxL2wi
 MGeMOWY43nu3iPx3kgfdKkPqDiLWlityDIkZTyN58CXwRvO6gZ3+Db73LDNVs/+FJycy
 vI8Oq6mE5kWt1JND9xTCUyqaQXEKpnbcmvvouu7kv+o1Nb9SVhxt/l0bOVCr8XcDN5sj
 dlDNJG3r1hFBIqPXMoUzxh/bdAezh9WIOv5IeuSE909SIEXbo2HKGu1CdDWlWbzG+6FZ
 ONyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ov1ozqnlCtxpUjkwYLA+spiskpMg2mlrkuJmq80GAzM=;
 b=JFZ4x8kFMvLKcTnifMgM6Zp93jUztYSAi5AfnMCYBWSjfhG5dV3nRxdrfyAZCljhJO
 jLC2kAoG57AhZ0pFqPYtsLujoSeCMR8VUNP9kHWo8LJ7yUmT2krqa9m+SnD8ZHNblNAK
 s9HwmIrFs+OWYZY0ejnxe9rRcOLv9b3xIY3iuhhoCDLUtqH8Ak76C6BKgFkcUAf87QHc
 VnUSDfSUhXgtwK1HxsDtgXTfeCi6QRdUu12IRpZatKG6jX+rxOV7MwpDPBK1PEb8kSI8
 i2grGgqnHheI6VCVgrl6CrDmZ62ltsolgv73rFgmd3rJ3XaPJIBZ1M3KA6T05lpZ/61v
 5nmA==
X-Gm-Message-State: AOAM531zsnJlCgzb3vvoug8odRwo6P+o0pQjT3dX4F24vlqt9vJAGpK/
 TnZu2PeFZ5G2hCSCv2qFZwyJ9Sp+ZyI=
X-Google-Smtp-Source: ABdhPJylyt7MopAfRyQVP0FRNKdoB+p1WjSNZ7nbHl44uTev7LZ2GwWiVTgpzn+xrhf26o9sphwurA==
X-Received: by 2002:a50:fc8d:: with SMTP id f13mr1710893edq.279.1641825645685; 
 Mon, 10 Jan 2022 06:40:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/18] configure: simplify creation of plugin symbol list
Date: Mon, 10 Jan 2022 15:40:21 +0100
Message-Id: <20220110144034.67410-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110144034.67410-1-pbonzini@redhat.com>
References: <20220110144034.67410-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dynamic-list is present on all supported ELF (not Windows or Darwin)
platforms, since it dates back to 2006; -exported_symbols_list is
likewise present on all supported versions of macOS.  Do not bother
doing a functional test in configure.

Remove the file creation from configure as well: for Darwin, move the
the creation of the Darwin-formatted symbols to meson; for ELF, use the
file in the source path directly and switch from -Wl, to -Xlinker to
not break weird paths that include a comma.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           | 81 +--------------------------------------------
 plugins/meson.build | 13 +++++---
 2 files changed, 10 insertions(+), 84 deletions(-)

diff --git a/configure b/configure
index 3a523a3d14..1b5fa5ae93 100755
--- a/configure
+++ b/configure
@@ -78,7 +78,6 @@ TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPE="${TMPDIR1}/${TMPB}.exe"
-TMPTXT="${TMPDIR1}/${TMPB}.txt"
 
 rm -f config.log
 
@@ -1696,6 +1695,7 @@ if test "$static" = "yes" ; then
     plugins="no"
   fi
 fi
+test "$plugins" = "" && plugins=yes
 
 cat > $TMPC << EOF
 
@@ -2317,69 +2317,6 @@ EOF
     fi
 fi
 
-##########################################
-# plugin linker support probe
-
-if test "$plugins" != "no"; then
-
-    #########################################
-    # See if --dynamic-list is supported by the linker
-
-    ld_dynamic_list="no"
-    cat > $TMPTXT <<EOF
-{
-  foo;
-};
-EOF
-
-        cat > $TMPC <<EOF
-#include <stdio.h>
-void foo(void);
-
-void foo(void)
-{
-  printf("foo\n");
-}
-
-int main(void)
-{
-  foo();
-  return 0;
-}
-EOF
-
-    if compile_prog "" "-Wl,--dynamic-list=$TMPTXT" ; then
-        ld_dynamic_list="yes"
-    fi
-
-    #########################################
-    # See if -exported_symbols_list is supported by the linker
-
-    ld_exported_symbols_list="no"
-    cat > $TMPTXT <<EOF
-  _foo
-EOF
-
-    if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
-        ld_exported_symbols_list="yes"
-    fi
-
-    if test "$ld_dynamic_list" = "no" &&
-       test "$ld_exported_symbols_list" = "no" ; then
-        if test "$plugins" = "yes"; then
-            error_exit \
-                "Plugin support requires dynamic linking and specifying a set of symbols " \
-                "that are exported to plugins. Unfortunately your linker doesn't " \
-                "support the flag (--dynamic-list or -exported_symbols_list) used " \
-                "for this purpose."
-        else
-            plugins="no"
-        fi
-    else
-        plugins="yes"
-    fi
-fi
-
 ##########################################
 # glib support probe
 
@@ -3614,22 +3551,6 @@ fi
 
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
-    # Copy the export object list to the build dir
-    if test "$ld_dynamic_list" = "yes" ; then
-	echo "CONFIG_HAS_LD_DYNAMIC_LIST=yes" >> $config_host_mak
-	ld_symbols=qemu-plugins-ld.symbols
-	cp "$source_path/plugins/qemu-plugins.symbols" $ld_symbols
-    elif test "$ld_exported_symbols_list" = "yes" ; then
-	echo "CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST=yes" >> $config_host_mak
-	ld64_symbols=qemu-plugins-ld64.symbols
-	echo "# Automatically generated by configure - do not modify" > $ld64_symbols
-	grep 'qemu_' "$source_path/plugins/qemu-plugins.symbols" | sed 's/;//g' | \
-	    sed -E 's/^[[:space:]]*(.*)/_\1/' >> $ld64_symbols
-    else
-	error_exit \
-	    "If \$plugins=yes, either \$ld_dynamic_list or " \
-	    "\$ld_exported_symbols_list should have been set to 'yes'."
-    fi
 fi
 
 if test -n "$gdb_bin"; then
diff --git a/plugins/meson.build b/plugins/meson.build
index b3de57853b..fa12047327 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,10 +1,15 @@
 plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
-  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-    plugin_ldflags = ['-Wl,--dynamic-list=qemu-plugins-ld.symbols']
-  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-    plugin_ldflags = ['-Wl,-exported_symbols_list,qemu-plugins-ld64.symbols']
+  if targetos == 'darwin'
+    qemu_plugins_symbols_list = configure_file(
+      input: files('qemu-plugins.symbols'),
+      output: 'qemu-plugins-ld64.symbols',
+      capture: true,
+      command: ['sed', '-ne', 's/^[[:space:]]*\\(qemu_.*\\);/_\\1/p', '@INPUT@'])
+    plugin_ldflags = ['-Wl,-exported_symbols_list,plugins/qemu-plugins-ld64.symbols']
+  else
+    plugin_ldflags = ['-Xlinker', '--dynamic-list=' + (meson.project_source_root() / 'plugins/qemu-plugins.symbols')]
   endif
 endif
 
-- 
2.33.1



