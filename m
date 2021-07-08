Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A595E3C19BF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:24:29 +0200 (CEST)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZdM-0004JK-Kv
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPY-0003cV-6D
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPR-0004rF-Sf
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so4709617wms.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0gyrc3JGYbG1/lrB5uuyjPa8WOVT1SfE1gj4xzt3DmQ=;
 b=U992Prap+GA2uk6agAVizTq/GFAT4S0m1Hq4i7204QlygS2BFU73bwG+zMdbpNqL8K
 w//XzkO0lckcMaSyFElb6kOIWZ3vrL+si/SZu4jbS+a8LNB/zbQCvCRJKN2SfKfC169C
 9X1FcteP1OIGXRzAHMkhtKGySyGR7C2livmwYh8qYiHjnjvDuOksjx06EgWl/IiRJFP1
 FjXAtKgLrRUM75js6/3v88GSlwb+14ONATynFepGunLEi73rlXKth8qkq1SaOwbHraA+
 XHX/82dPCVdQtb//UEkwlqVnwlWaBdIwhu/p9R2azZc5uWIc425wsUI+Cv/kyz3KTG0o
 ZgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0gyrc3JGYbG1/lrB5uuyjPa8WOVT1SfE1gj4xzt3DmQ=;
 b=hL6gE6SPoLamcZclDNRNFCFk7kMs+LmqRD77crgFeOvuYwdEA4l8GxELh5V0JLVhFN
 C/MQxcXr7tsKjgFreNBetfmRDllqtc2iolRKdmGmxpik3UKd096blThhJlo1Upobx8Tt
 NH+REU2Lgrz5U3gb+O4ZSNxGHk3LhXhFVw6v4WXvicxV71/YiLWkRM1A2+c6S/HehORh
 6nEz0cA248ugdhc0hcayi9xP5VXfhaLrZy4/4gBe5aeGou8H+48EPXwWoCSM0DqCKcPa
 wRaMPF7Tp3AR0nWjKnSnOArFPK9B8xMIlpQZoMBlMoPpPVYyvOKtIH6Bi0qo1V1r4LNh
 8LlQ==
X-Gm-Message-State: AOAM532r81CHSrD5worVPkBfwMCrFr0VGP4ncu1mwLKzYVxFkNlmhKef
 oyFaKlkykZXLOTHA+w+tXbFTqQ==
X-Google-Smtp-Source: ABdhPJxctbxRQRzQlmcvJKPOqUhalChNfzqBV3AE/uJLNe+48RuGN63DiNBJfjpFLBntvlFEaJ7xnA==
X-Received: by 2002:a05:600c:3b0b:: with SMTP id
 m11mr35225266wms.162.1625771403422; 
 Thu, 08 Jul 2021 12:10:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i12sm3263564wrp.57.2021.07.08.12.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:10:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 526901FFB7;
 Thu,  8 Jul 2021 20:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 31/39] tcg/plugins: enable by default for TCG builds
Date: Thu,  8 Jul 2021 20:09:33 +0100
Message-Id: <20210708190941.16980-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aside from a minor bloat to file size the ability to have TCG plugins
has no real impact on performance unless a plugin is actively loaded.
Even then the libempty.so plugin shows only a minor degradation in
performance caused by the extra book keeping the TCG has to do to keep
track of instructions. As it's a useful feature lets just enable it by
default and reduce our testing matrix a little.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - properly handle plugins being ""
  - make the test for linker support handle default case
  - move linker tests to before the glib-modules test
v3
  - remove stray debug ($plugins)
---
 docs/devel/tcg-plugins.rst |   3 +-
 configure                  | 125 ++++++++++++++++++++-----------------
 .gitlab-ci.d/buildtest.yml |  23 -------
 3 files changed, 71 insertions(+), 80 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 18c6581d85..0cd77c77d2 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -71,7 +71,8 @@ API
 Usage
 =====
 
-The QEMU binary needs to be compiled for plugin support::
+Any QEMU binary with TCG support has plugins enabled by default.
+Earlier releases needed to be explicitly enabled with::
 
   configure --enable-plugins
 
diff --git a/configure b/configure
index 43f4d3220a..2097fa69a0 100755
--- a/configure
+++ b/configure
@@ -429,7 +429,7 @@ libxml2="auto"
 debug_mutex="no"
 libpmem="auto"
 default_devices="true"
-plugins="no"
+plugins="$default_feature"
 fuzzing="no"
 rng_none="no"
 secret_keyring="$default_feature"
@@ -3086,6 +3086,73 @@ for drv in $audio_drv_list; do
     esac
 done
 
+##########################################
+# plugin linker support probe
+
+if test "$plugins" != "no"; then
+
+    #########################################
+    # See if --dynamic-list is supported by the linker
+
+    ld_dynamic_list="no"
+    if test "$static" = "no" ; then
+        cat > $TMPTXT <<EOF
+{
+  foo;
+};
+EOF
+
+        cat > $TMPC <<EOF
+#include <stdio.h>
+void foo(void);
+
+void foo(void)
+{
+  printf("foo\n");
+}
+
+int main(void)
+{
+  foo();
+  return 0;
+}
+EOF
+
+        if compile_prog "" "-Wl,--dynamic-list=$TMPTXT" ; then
+            ld_dynamic_list="yes"
+        fi
+    fi
+
+    #########################################
+    # See if -exported_symbols_list is supported by the linker
+
+    ld_exported_symbols_list="no"
+    if test "$static" = "no" ; then
+        cat > $TMPTXT <<EOF
+  _foo
+EOF
+
+        if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
+            ld_exported_symbols_list="yes"
+        fi
+    fi
+
+    if test "$ld_dynamic_list" = "no" &&
+       test "$ld_exported_symbols_list" = "no" ; then
+        if test "$plugins" = "yes"; then
+            error_exit \
+                "Plugin support requires dynamic linking and specifying a set of symbols " \
+                "that are exported to plugins. Unfortunately your linker doesn't " \
+                "support the flag (--dynamic-list or -exported_symbols_list) used " \
+                "for this purpose. You can't build with --static."
+        else
+            plugins="no"
+        fi
+    else
+        plugins="yes"
+    fi
+fi
+
 ##########################################
 # glib support probe
 
@@ -3094,7 +3161,7 @@ glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
 fi
-if test "$plugins" = yes; then
+if test "$plugins" = "yes"; then
     glib_modules="$glib_modules gmodule-2.0"
 fi
 
@@ -3932,60 +3999,6 @@ if compile_prog "" "" ; then
   atomic64=yes
 fi
 
-#########################################
-# See if --dynamic-list is supported by the linker
-ld_dynamic_list="no"
-if test "$static" = "no" ; then
-    cat > $TMPTXT <<EOF
-{
-  foo;
-};
-EOF
-
-    cat > $TMPC <<EOF
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
-fi
-
-#########################################
-# See if -exported_symbols_list is supported by the linker
-
-ld_exported_symbols_list="no"
-if test "$static" = "no" ; then
-    cat > $TMPTXT <<EOF
-  _foo
-EOF
-
-    if compile_prog "" "-Wl,-exported_symbols_list,$TMPTXT" ; then
-        ld_exported_symbols_list="yes"
-    fi
-fi
-
-if  test "$plugins" = "yes" &&
-    test "$ld_dynamic_list" = "no" &&
-    test "$ld_exported_symbols_list" = "no" ; then
-  error_exit \
-      "Plugin support requires dynamic linking and specifying a set of symbols " \
-      "that are exported to plugins. Unfortunately your linker doesn't " \
-      "support the flag (--dynamic-list or -exported_symbols_list) used " \
-      "for this purpose. You can't build with --static."
-fi
 
 ########################################
 # check if getauxval is available.
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d9b834c848..89df51517c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -354,29 +354,6 @@ build-some-softmmu:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
-# Run check-tcg against linux-user (with plugins)
-# we skip sparc64-linux-user until it has been fixed somewhat
-# we skip cris-linux-user as it doesn't use the common run loop
-build-user-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
-    MAKE_CHECK_ARGS: check-tcg
-  timeout: 1h 30m
-
-build-some-softmmu-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
-    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
-    MAKE_CHECK_ARGS: check-tcg
-
 clang-system:
   extends: .native_build_job_template
   needs:
-- 
2.20.1


