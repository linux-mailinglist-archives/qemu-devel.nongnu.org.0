Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0234D9C03
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:17:47 +0100 (CET)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU73a-0002Fw-9F
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:17:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6ik-0005kx-JC
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:14 -0400
Received: from [2607:f8b0:4864:20::102a] (port=37843
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6ii-0008Fm-Sc
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:14 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 lj8-20020a17090b344800b001bfaa46bca3so2232949pjb.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tMw9uEt6EjoDEMpxmCEU8mo4kl9R3ksIy7H1DqcYAjY=;
 b=O3dXa2n6/5qitSZ5DWrHJfe2MLHfagC4ttSvejrWI7qMuoXdNSAxU+P78/nla87/L8
 nQgU2M+qxDV2w1Ti3rmmFl7SQoPF9A7cKYHNgU7JIO2XDJD21gfH/LfaHPXnky4FMpc4
 pGNQd+OwXTy40WhG0NjJUc6/cGbK5nIgAjsRUK8I8GNRAkVsPzeHEjrvKITHpUU1AxvX
 tkjmK2IoGqAxbIIx7uaYxOPss5H2S+FK869l4gMs0iwZHdRtync925B+3b1S33+1wxok
 NZ1jA9loRKZiZuWZiz3eSef9dm8Nar4RSKggRy4dfixHameeBq8v/8bx3EBRaf9TGj5I
 +5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tMw9uEt6EjoDEMpxmCEU8mo4kl9R3ksIy7H1DqcYAjY=;
 b=KkcOTo/ahwpzho6S3xoUVfAb5RpyHV71UR2RAKIvevDmWEFbazE95GHnynG5JtZImD
 JMx8AkWznysZMtHFZw7wP0BqsUvZ8+C6Gw1EBWWX1kxSHsU2GSOFZa3In2wKBoKQ/HH+
 0eBfS+mctMkFE7CF5YVQ8dKSJTW/uD8qYhD/earVBW/kVam+Cdjv3Kotd9tpOef1wHfo
 cSscUJ21eEd9ATsN1iJYPD6UwBDnYbRqTpOKZcckjlyw+EBYZf1v26Bf1sCPts5yduq4
 a/XP4EcZjNF3U+KPHfb/5FZGFN9ASMcNoVmXjnyfyqWl7IBFXiEW64uTflgNoDAUq0Bq
 oPyg==
X-Gm-Message-State: AOAM531rFjCmjB3OcOmBBg3ET5OqgU64sTo0VU/UNh2VBhWgmpUylLWg
 6DG0pjf785VPla8wO/j24QQqQL8zlFQ=
X-Google-Smtp-Source: ABdhPJxqKRbyEq1snPVGQGrNPMhyk5jM3tGv9nD+Cmhe36dBH3b7cTWgB3wSYyQGEXWdruqZ0GJe9Q==
X-Received: by 2002:a17:902:e949:b0:14d:8ab1:919 with SMTP id
 b9-20020a170902e94900b0014d8ab10919mr28296478pll.122.1647348965963; 
 Tue, 15 Mar 2022 05:56:05 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lp4-20020a17090b4a8400b001bedba2df04sm3396289pjb.30.2022.03.15.05.56.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:56:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] configure: Pass filtered QEMU_OBJCFLAGS to meson
Date: Tue, 15 Mar 2022 13:53:44 +0100
Message-Id: <20220315125350.82452-16-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure   | 23 +++++++++++++++++++++++
 meson.build |  6 +++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 2bf40d9eeb..cd4946b43e 100755
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
index 5fed23847b..cb24d30697 100644
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
@@ -3481,6 +3484,7 @@ if link_args.length() > 0
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
+summary_info += {'QEMU_OBJCFLAGS':    config_host['QEMU_OBJCFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
 summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-- 
2.34.1


