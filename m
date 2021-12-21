Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568ED47BE8D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:07:35 +0100 (CET)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzczV-0007yr-CL
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxa-0005Ji-K2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:34 -0500
Received: from [2a00:1450:4864:20::42a] (port=43849
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxY-0004yW-2M
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:34 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v11so26094173wrw.10
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=scKI0XUojemkNwM+Uk5vdVFq+/YXr2F98gMRbX8fEAY=;
 b=bgaJaMzJjszJKEE2TiXpcPxZjCoAtjKzfKUbHIcWq/NwqTH59TzQSubLj5GQz6pWBk
 q0Yzp7BxWQvJd8Ivg2tHROeg4VGUaNmEUaXjCGX2jFXIjDlaoc8ztXeK1ziUhvYaqOxd
 Rj5N4oCwHfKnAYp9GmhKaCp2l7b42HH+2S/ECSh67ysfQPnZivV3dcYw9xBExLIjLj+U
 q/xB4q8vcKVgAZWXQoQMlDdLba/HS2q3Y0cCgSQod2yyc6b+1jCpasoyeyvoRbDFLmpC
 GS4V6wd7ypzQxZqFCttcR3+4KB2dbZMol7ijuzThN6AKNp/nEZzf3mWmVnCeT+ocCUjJ
 XgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=scKI0XUojemkNwM+Uk5vdVFq+/YXr2F98gMRbX8fEAY=;
 b=r90d8bFJCbOe6kp4+RyeuX5nXzv52B5F/Ktddctuy1yIMpHJ33pgVNlQZWqfC6DJoq
 sPbKxv4EuJVHxu37FbPM8NjkQ2xjWp11NL8xW53Cb1Cijjil3WMmuQYY4wAPz9J0Qxvi
 SVPARYNuwqcpEBSlb7g8IofwN00uB76i+pSRvCP9dCGdszBopx0/hUyxpeL7sqSL/NBX
 R7hhD0y0HyPeP1/l0QDUUjS8aUbPzF5zS4lghZwCFeoPd3zMWWXCdzEQ+ns/ogremtiz
 a7jaHnunUErA1T3zMFVqK9DRHtP4XIWT+XGbSEFlD1H/5dYOM6BozSxjfkuBU+VQf8yw
 aBbw==
X-Gm-Message-State: AOAM530KAu2p6VqChPvQwkfpNYbNEQxHa1jkDFMhdoUkrQ2JcMcgRqEg
 Ba529yFNOhmmY59nBVnSg1A5HaojqYg=
X-Google-Smtp-Source: ABdhPJw2vsg2e4zH6tJMzu3rFpvWnyFntEI5e43vRn4W7w6f1j84v3jq2weOpYeeWFH7XxoCQu9r7g==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr1417838wri.301.1640084730756; 
 Tue, 21 Dec 2021 03:05:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] configure: simplify creation of plugin symbol list
Date: Tue, 21 Dec 2021 12:05:19 +0100
Message-Id: <20211221110526.351709-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211221110526.351709-1-pbonzini@redhat.com>
References: <20211221110526.351709-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           | 80 ---------------------------------------------
 plugins/meson.build | 11 +++++--
 2 files changed, 8 insertions(+), 83 deletions(-)

diff --git a/configure b/configure
index 8ccfe51673..1bce9635d9 100755
--- a/configure
+++ b/configure
@@ -78,7 +78,6 @@ TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPE="${TMPDIR1}/${TMPB}.exe"
-TMPTXT="${TMPDIR1}/${TMPB}.txt"
 
 rm -f config.log
 
@@ -2343,69 +2342,6 @@ EOF
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
 
@@ -3643,22 +3579,6 @@ fi
 
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



