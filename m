Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB0484436
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:07:00 +0100 (CET)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lOt-0007At-AE
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:06:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGQ-00075G-SM
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:14 -0500
Received: from [2a00:1450:4864:20::52b] (port=47101
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGO-0004SP-F1
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:14 -0500
Received: by mail-ed1-x52b.google.com with SMTP id n30so37413491eda.13
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0X0s6/KkDwRVCgMNI8mr44TrPIa88nuV/cB6Oq70qfA=;
 b=jxVxfrC13W4WFfXtahzAdhs0HFNoD3eN5rA1ZgZ2U3O23b4nmFTPQ93QVpXqCFtodF
 FL/5kliesQP5NZj07TXE8Ro+RwjWmdZF0jG9mXyPYiya9ezFglA3FtFZ3W2gEToI6fwO
 ll9qwUHfc0JdKCaQenP/1vSC+mwqmc+fZGReVIB7yR4VSEWwo2oGIZeJgEjgSAEFQczz
 hgWbaCkESLMNisDckWR2rTB9r/kNPz5pyLTL+6dpEdSTI/NSpB4cN14bTBFC1d8tAf7U
 BE3dRJFbpWKnibLpX59/E1Xk80bLr+zmp8mc3DSkWwgAYSAQwyLIbgG/t9mRpXpYeZC/
 0OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0X0s6/KkDwRVCgMNI8mr44TrPIa88nuV/cB6Oq70qfA=;
 b=Vt0zJlfKOX2SBkzZNjt5hZlIqCYEBzVfNAP7d62xBbArGKWtYPDDnuRHa/qcDGcBNV
 s8ubKCywP4HCsJtuzOvtQAg/dI6OV2tztDa1n8RYldKqhgi6ub9HiVlJKRoos3Qi7UzG
 41BRpChajPpS9oMeZ/5kVlATgd7CftoGc3lXeY84J4DKOiLjxHpOv3F379uoI0DJiQzA
 /7Ezfli9Ms5iGBEj3JVqoSXybhXAAB5Ms8+SJCoNAD/TJk8U64QCzdcMVdPAJzyxOasl
 aLmvbzCRExFyPaXGl93IjPqPl5xVXj2mbGgV6xGDwSAhL00prH7ais/jvDNxRZT0rkt9
 voBg==
X-Gm-Message-State: AOAM533RacaEOON+G/l9vc3tRgbrjeiN15vA1mEXFze0RxRmWDrEVUkE
 T5/GYcv+7D8Gfc9Pbb9DjZcPfWBLcLg=
X-Google-Smtp-Source: ABdhPJwjFryKKdnsEsNGff5D9oFu0RscMnfZvNfRehnn0Z1xrNa0DeSkNQX4Jkmw/zJ8bq4urKsZAw==
X-Received: by 2002:a17:906:e2c5:: with SMTP id
 gr5mr41679498ejb.282.1641308290095; 
 Tue, 04 Jan 2022 06:58:10 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] configure: simplify creation of plugin symbol list
Date: Tue,  4 Jan 2022 15:57:39 +0100
Message-Id: <20220104145749.417387-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
 configure           | 80 ---------------------------------------------
 plugins/meson.build | 11 +++++--
 2 files changed, 8 insertions(+), 83 deletions(-)

diff --git a/configure b/configure
index 3a523a3d14..5e61439761 100755
--- a/configure
+++ b/configure
@@ -78,7 +78,6 @@ TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPE="${TMPDIR1}/${TMPB}.exe"
-TMPTXT="${TMPDIR1}/${TMPB}.txt"
 
 rm -f config.log
 
@@ -2317,69 +2316,6 @@ EOF
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
 
@@ -3614,22 +3550,6 @@ fi
 
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
index b3de57853b..d0a2ee94cf 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,10 +1,15 @@
 plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
-  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-    plugin_ldflags = ['-Wl,--dynamic-list=qemu-plugins-ld.symbols']
-  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
+  if targetos == 'darwin'
+    qemu_plugins_symbols_list = configure_file(
+      input: files('qemu-plugins.symbols'),
+      output: 'qemu-plugins-ld64.symbols',
+      capture: true,
+      command: ['sed', '-ne', 's/^[[:space:]]*\\(qemu_.*\\);/_\\1/p', '@INPUT@'])
     plugin_ldflags = ['-Wl,-exported_symbols_list,qemu-plugins-ld64.symbols']
+  else
+    plugin_ldflags = ['-Xlinker', '--dynamic-list=' + (meson.project_source_root() / 'plugins/qemu-plugins.symbols')]
   endif
 endif
 
-- 
2.33.1



