Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CC247E2D1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:02:17 +0100 (CET)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MnY-0005Cd-Tr
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:02:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdN-0004I0-EJ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:45 -0500
Received: from [2a00:1450:4864:20::435] (port=39841
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdJ-0008P3-2Z
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:42 -0500
Received: by mail-wr1-x435.google.com with SMTP id s1so10940101wra.6
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=55OiswjpjjV/NblsZfejYWi2CNoYsxBbbkANqJNLbCI=;
 b=eKHbb+7Qvvn9QA+POk+FrfYvl/5bqVe4OFEm1fk3hhawWkqv7jFo/WIqmElpyvWmV+
 kFr1qXqyoQGV0TwZXLkW7peu2ah6DssDp2XjNDanQBdyw0civ0JVI2/lBNq674bo3sse
 qsXhv3X26LnBXKMtPlPj0e435hO8sHW71Xe7BogHetbX3+ZxC1/N46b8HblMa1Cizb1f
 B4LWy0+zKJfkZww9pUrCL8rYSxpL7ms7EpGTWyA7+a6U2BNIVXWlhHAXkCQF9/vNQbpb
 qt8s18neaF2mzD7qYv4uKGR5pSLGMGOKpjTUPmo3SX7wK3L9Qcjn5gM3ynNwHH55htTm
 f9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=55OiswjpjjV/NblsZfejYWi2CNoYsxBbbkANqJNLbCI=;
 b=RuIXBokhUEKe86O9kgfLhlDq7gK++mbsBlLBMQT1i7/QwSKlDdWC1H36TG5ujLlmKI
 Cp1X7E7IgsKWqgg+gwr9MhNVTgmJBlkdiFjbfhdCCzw6OFCol5rzz+y5/CCsytzzwgae
 ZCDkWfX2HFQK7F28CpDNMQlNuxHrquBHk3Mg8qIaZvbck0erieyRjzgTNCLh+FXlMhHF
 cuZ/bUqXrPW+4GJyjYfyIjfs2qr7AFoE2VFrWB6Zb1rGPrxzfO4I7xnRguCw6yHxXNFq
 /+JGzRH9Qxf9Defxrpcoueo/l23/pyGnzGVgtygsNpUiFlthKxR5M5Hncn0yhSotOABY
 +QqA==
X-Gm-Message-State: AOAM532uCRIA4KSyXcrIllC4UFt92O8OpixhBtoi2uf23t3BMWwY+XGU
 QArlX3agyDBDgKK2ptMoNxDrQzAJpTY=
X-Google-Smtp-Source: ABdhPJx+2vkMXOZP7Nhw/Ary6NfAD5Ac1hotY66gtPzOjrGtMmfPEogGJARlSLSFoiCegKtLYoq68Q==
X-Received: by 2002:a05:6000:2ce:: with SMTP id
 o14mr1536783wry.70.1640260299586; 
 Thu, 23 Dec 2021 03:51:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] configure: simplify creation of plugin symbol list
Date: Thu, 23 Dec 2021 12:51:25 +0100
Message-Id: <20211223115134.579235-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
index b66ab31834..0306f0c8bc 100755
--- a/configure
+++ b/configure
@@ -78,7 +78,6 @@ TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPE="${TMPDIR1}/${TMPB}.exe"
-TMPTXT="${TMPDIR1}/${TMPB}.txt"
 
 rm -f config.log
 
@@ -2315,69 +2314,6 @@ EOF
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
 
@@ -3612,22 +3548,6 @@ fi
 
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



