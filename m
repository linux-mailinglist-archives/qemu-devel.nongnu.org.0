Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525AA4B740D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:23:11 +0100 (CET)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1Xi-0007CS-EV
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Df-0005BH-Se
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:02:27 -0500
Received: from [2607:f8b0:4864:20::42a] (port=46699
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1DI-0007dF-90
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:02:06 -0500
Received: by mail-pf1-x42a.google.com with SMTP id i21so34406029pfd.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d9EkieBgrdhrogN9sKmZK/XJut6BqlFTxcRvby4ZjyU=;
 b=TGFfi68L5SZtHzrVv1gO5oBUagh2KV99/vOKqhOICJrg/5rXMY1G59t30CxnoVYOhR
 r6UOsL4VSofNgPaAALegSo3A4xeCg0ArKU4vg+hgOx28NKgnXTF1WkMxJV5XPPVOwSWj
 n+ls7Q1K8jkqC8F99fQYkuVyBc5gb6caiEnz2b/JSgHH0NdzstTS4MwzrsEwEL/RrGZU
 uCGJD31K7igEYvvwHjWZ0+vmqjOBqMyuVfbPMCc5fx6r2gAy6qk8xOQg/kWzhrvFC+Lp
 MnAD/RJc3T7yynNB2Fk0KY4tMaO/so5J6rely+3s8jhMf7Ik6L70ee7Q4kqeOOcGyUDM
 LshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d9EkieBgrdhrogN9sKmZK/XJut6BqlFTxcRvby4ZjyU=;
 b=IWTaIR1Z2cpSGHTscS+yaZD4Fp2gINWXOmvBL3860wRQ9Ia/tMKcH71Y9bahjfKN7W
 Zdb5EnyxAtP4SPLG0O2b8/ww7zfv+LeQlEdCXAMRQoN1rYUMfSXZma4sUMEJGhNAAxcE
 Ymp/M0n/XJaYXTRyXU6Oz3CIma0Om0Yt1ZCvJM/RtGjCQTZZQxoSYCxamojjoz5sl0CO
 eK8IWkV+SgBPHLHGa5xdIOR9/sVqS8oM2C6nzyTuxDIcy1lP1dRyaCzjilxptVH9edKd
 hIlsaPyglFH91AQS9XVT4tctGdFVb8CKg9PGI+a4ZVF+f7nGoSM8qIHUh5p3JigVOrW2
 DMmA==
X-Gm-Message-State: AOAM531SiJnxcF0LjV1vOeqPrdLwo2eFFwxAf3VHD+BPcFgnDFmktkw8
 WhkMqXG7TWWc5p3Nd3ze9Wirp3A0+FM=
X-Google-Smtp-Source: ABdhPJxRhlB9zkoOqUosufYahttHeGq+GIRf0w2qn5YuX//J6HyfgdYtoB5bvXa2c/yzDJLmApPDLQ==
X-Received: by 2002:a62:6141:: with SMTP id v62mr5299932pfb.61.1644944522807; 
 Tue, 15 Feb 2022 09:02:02 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id o8sm42022231pfu.52.2022.02.15.09.02.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:02:02 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 6/8] configure: Pass filtered QEMU_OBJCFLAGS to meson
Date: Tue, 15 Feb 2022 18:01:04 +0100
Message-Id: <20220215170106.95848-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Filter unsupported Objective-C options, to avoid
'unknown-warning-option' warnings when using Clang:

  [34/373] Compiling Objective-C object libcommon.fa.p/audio_coreaudio.m.o
  warning: unknown warning option '-Wold-style-declaration'; did you mean '-Wout-of-line-declaration'? [-Wunknown-warning-option]
  warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean '-Wimplicit-fallthrough'? [-Wunknown-warning-option]
  2 warnings generated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure   | 23 +++++++++++++++++++++++
 meson.build |  5 ++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 3217aa22cb..df6eaec067 100755
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
@@ -1616,10 +1621,27 @@ cc_has_warning_flag() {
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
@@ -3579,6 +3601,7 @@ echo "LD=$ld" >> $config_host_mak
 echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
+echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 215c253683..7b78235a39 100644
--- a/meson.build
+++ b/meson.build
@@ -199,9 +199,11 @@ if get_option('fuzzing')
 endif
 
 add_global_arguments(config_host['QEMU_CFLAGS'].split(),
-                     native: false, language: ['c', 'objc'])
+                     native: false, language: ['c'])
 add_global_arguments(config_host['QEMU_CXXFLAGS'].split(),
                      native: false, language: 'cpp')
+add_global_arguments(config_host['QEMU_OBJCFLAGS'].split(),
+                     native: false, language: ['objc'])
 add_global_link_arguments(config_host['QEMU_LDFLAGS'].split(),
                           native: false, language: ['c', 'cpp', 'objc'])
 
@@ -3306,6 +3308,7 @@ if link_args.length() > 0
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
+summary_info += {'QEMU_OBJCFLAGS':    config_host['QEMU_OBJCFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-- 
2.34.1


