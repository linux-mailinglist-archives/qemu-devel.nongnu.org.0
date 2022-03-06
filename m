Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9004CEE87
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:33:27 +0100 (CET)
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0NS-0007ZK-Gv
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:33:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09r-00018K-VV; Sun, 06 Mar 2022 18:19:24 -0500
Received: from [2a00:1450:4864:20::432] (port=44905
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09q-0007U6-Al; Sun, 06 Mar 2022 18:19:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id u1so20633841wrg.11;
 Sun, 06 Mar 2022 15:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=da8OQjebbO6QE5YN8nEdTrGi8lsVvBcImkkqljSMF0k=;
 b=qEahTBZQDrEMo0i6DyY8s7ZHt/8L5EIoOKVaceY+hrPqzHOu1/RMcb7E5VtgwKeoM7
 Q/Q1qq+ZOI43Sz5RSD0TwRHguIsfyJg6NzkIOfOM6+LCPmmjMw3r9dzekS93rXS2PenY
 tB6VOle9n4b75u3zPng4rXwfOQbqrWrvkQWb0pF0Q2wlWc1nLFChlT/CbVfAAY64Jc2q
 2Rg9sY2XJG5eIuPJ4yCxNOECpt6wk6vGsMkDI16Snb8mZVgl5WkKo0PgPB2lKthrgk8y
 aTdbHmx803i8+8K4CissQuRBVIbaFjghnhBM3/MBcDvJ06n4J/WYN1hhwKYAzCtIFh1b
 E0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=da8OQjebbO6QE5YN8nEdTrGi8lsVvBcImkkqljSMF0k=;
 b=tAYxiVGG6nSnwvqzUPWuhUXdEJTp13tqFnkj7v6uTDi6V44zx2ahPKfTC255z0LQzS
 1uMLEJ70J1Bkj39LVqapw2rChnYFbpdITXPKHnHOVwkbNJv9TJ0i/rR99mYY5Ck52AYt
 xeHl7fuskGKOMZmSxkv8j84nLnZUWqX6L5RB19ZRZM1MNC1ExuJ8yhpSV+pDXA63dURL
 cnoaw3dfnWISaNOmgElANcGHC8v2gHk74ZImRzUvufuGe6JMR8bh9cz8KpejGpYEz41x
 nQX+GlBuyeU7KtuQIRX65meIO/LPwNXpPkPZH79yYXVfwXbkHKYgU6ru7gS5fSmmF3fl
 Qvng==
X-Gm-Message-State: AOAM532sbYJ1f408KD585UNYo5QSBFkwnsdvtqsuOMp5fxmgsmFKAmW4
 WMmtAnD1KC4yY0vTyGzp22g7oiAv+7M=
X-Google-Smtp-Source: ABdhPJz4S0Y6kmi4zEKgUHnnSbEI3Ff11a1KlpWHUhp5FHR9uRsQxcrrrVc+18mTNEbzV6ASfaeVwQ==
X-Received: by 2002:a5d:64ef:0:b0:1f0:45d3:5c3a with SMTP id
 g15-20020a5d64ef000000b001f045d35c3amr6373890wri.683.1646608760533; 
 Sun, 06 Mar 2022 15:19:20 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a5d6745000000b001f1e4e40e42sm4001996wrw.77.2022.03.06.15.19.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/22] configure: Pass filtered QEMU_OBJCFLAGS to meson
Date: Mon,  7 Mar 2022 00:17:47 +0100
Message-Id: <20220306231753.50277-17-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Filter unsupported Objective-C options, to avoid
'unknown-warning-option' warnings when using Clang:

  [34/373] Compiling Objective-C object libcommon.fa.p/audio_coreaudio.m.o
  warning: unknown warning option '-Wold-style-declaration'; did you mean '-Wout-of-line-declaration'? [-Wunknown-warning-option]
  warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean '-Wimplicit-fallthrough'? [-Wunknown-warning-option]
  2 warnings generated.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure   | 23 +++++++++++++++++++++++
 meson.build |  6 +++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e60156f90f..7d1f35603b 100755
--- a/configure
+++ b/configure
@@ -77,6 +77,7 @@ TMPB="qemu-conf"
 TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
+TMPM="${TMPDIR1}/${TMPB}.m"
 TMPE="${TMPDIR1}/${TMPB}.exe"
 
 rm -f config.log
@@ -148,6 +149,10 @@ do_cxx() {
     do_compiler "$cxx" $CPU_CFLAGS "$@"
 }
 
+do_objc() {
+    do_compiler "$objcc" $CPU_CFLAGS "$@"
+}
+
 # Append $2 to the variable named $1, with space separation
 add_to() {
     eval $1=\${$1:+\"\$$1 \"}\$2
@@ -1445,10 +1450,27 @@ cc_has_warning_flag() {
     compile_prog "-Werror $optflag" ""
 }
 
+objcc_has_warning_flag() {
+    cat > $TMPM <<EOF
+int main(void) { return 0; }
+EOF
+
+    # Use the positive sense of the flag when testing for -Wno-wombat
+    # support (gcc will happily accept the -Wno- form of unknown
+    # warning options).
+    optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
+    do_objc -Werror $optflag \
+      $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
+      -o $TMPE $TMPM $QEMU_LDFLAGS
+}
+
 for flag in $gcc_flags; do
     if cc_has_warning_flag $flag ; then
         QEMU_CFLAGS="$QEMU_CFLAGS $flag"
     fi
+    if objcc_has_warning_flag $flag ; then
+        QEMU_OBJCFLAGS="$QEMU_OBJCFLAGS $flag"
+    fi
 done
 
 if test "$stack_protector" != "no"; then
@@ -2990,6 +3012,7 @@ echo "LD=$ld" >> $config_host_mak
 echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
+echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 0d38b2e72a..a770e80a32 100644
--- a/meson.build
+++ b/meson.build
@@ -173,11 +173,13 @@ endif
 
 qemu_cflags = config_host['QEMU_CFLAGS'].split()
 qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
+qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
 if get_option('gprof')
   qemu_cflags += ['-p']
   qemu_cxxflags += ['-p']
+  qemu_objcflags += ['-p']
   qemu_ldflags += ['-p']
 endif
 
@@ -216,8 +218,9 @@ if get_option('fuzzing')
   endif
 endif
 
-add_global_arguments(qemu_cflags, native: false, language: ['c', 'objc'])
+add_global_arguments(qemu_cflags, native: false, language: ['c'])
 add_global_arguments(qemu_cxxflags, native: false, language: ['cpp'])
+add_global_arguments(qemu_objcflags, native: false, language: ['objc'])
 add_global_link_arguments(qemu_ldflags, native: false, language: ['c', 'cpp', 'objc'])
 
 if targetos == 'linux'
@@ -3471,6 +3474,7 @@ if link_args.length() > 0
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
+summary_info += {'QEMU_OBJCFLAGS':    config_host['QEMU_OBJCFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-- 
2.34.1


