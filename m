Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99013447C52
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:54:16 +0100 (CET)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0Pv-0002FC-Ne
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0Mj-0004zh-UV
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:50:57 -0500
Received: from [2a00:1450:4864:20::52f] (port=36863
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk0Mg-00049n-Td
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:50:57 -0500
Received: by mail-ed1-x52f.google.com with SMTP id o8so59319987edc.3
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d32zZr3Lg4xmu+J9Aeiyv7F9dvPxwAsvpGCMhgRyfRk=;
 b=GfuwPR+dfL2BFvkUqDjADReFVl4xp1XiEax1R8nPWEMf4EPWZw90t5yGPSFidmoi4s
 YqwRFi34KtbnDISIEI73s+j3mBvHQej3xGymuprG9uqpYonEZQgv2ikA4xGvwbwdGvMO
 hOMy59vXaB1pmr1ZgJyPT4q1zoWSSxXqDfnth5MgAqpmDQtxaNUAtBvfTOxSmUTfK0v/
 ++ilrx5dZSCiH7mnKwGIcmiYjI+kHs+Oih6XDd9AWWv7nR/UF1NTQlRl/e15iJRMqBim
 ZDd23C36VjyG9WA94D3m+5kHLEThzZ1zDt9BStfjGyoP/9o1TKkPw3x60OH6gALw8F4+
 7Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d32zZr3Lg4xmu+J9Aeiyv7F9dvPxwAsvpGCMhgRyfRk=;
 b=z3NM+OwcLKWFv/QAHqApBPseMGRU6tr8g9bG/+59Q/NXU/vVTZLC0+zW6AYvv8i8er
 XRP1MiZJ9hS+/rBYGLYTQ08Owknp3hiYAjBtQRGUkT5WPLR3h+hMm386oAg1AIN6GSMA
 mZG79gXEjflaPqKBfespJwtIN27yGaZ0hKDBcuHkf2RZMW9Fn8Cg/TS1eoA7sAtUiEnm
 4C3ActCbwTDglmyY3R4UnfceMqP5ny4zmq9K1KOGuDLR2prpYgAHRHQPeGNDYe9c/4jc
 GjLa0eVVkfrEAHrxorgHfkgDFGHsSO6vNVOInPiA0qoEWhglUgj+5gleHalaOqqNC1XV
 Zi4w==
X-Gm-Message-State: AOAM532x6vdFRUmkxBY1uuYqQJ/kcnqxb1col5v4YApQ1L80l7b+A3Px
 hPZTCkQumF9RJ1DxcXmEWECqWfGSyIE=
X-Google-Smtp-Source: ABdhPJwhhI9H/kjJve2PeRHx6mRGi7Cl+oVx3DMROpP5Azzw6PKo7wLqCuu2Z8UwJlaPRA//sMusTw==
X-Received: by 2002:aa7:d3cf:: with SMTP id o15mr26286143edr.265.1636361006310; 
 Mon, 08 Nov 2021 00:43:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id nb17sm7743211ejc.7.2021.11.08.00.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 00:43:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] configure: propagate --extra-cflags and --extra-ldflags
 to meson compile tests
Date: Mon,  8 Nov 2021 09:43:21 +0100
Message-Id: <20211108084323.541961-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108084323.541961-1-pbonzini@redhat.com>
References: <20211108084323.541961-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson (intentionally) does not add QEMU_CFLAGS to cc.compiles/cc.links
tests, as they are supposed to be independent of the specific sets of
compilation flags used to build the programs.  However, the user can
still use CFLAGS or the toolchain file's LANG_args/LANG_link_args option
to specify -I or -L options that apply to cc.compiles/cc.links as well.

This is also the intended use of configure's --extra-cflags,
--extra-cxxflags and --extra-ldflags options.  For example, if
one has netmap's header in a nonstandard directory, up to commit
837b84b1c078bf3e909 it used to work fine to do:

.../configure --enable-netmap \
     --extra-cflags=-I/path/to/netmap/sys

but since the test was converted to meson, this does not work anymore.

Pass these options to meson via the toolchain file instead of via
config-host.mak, since the toolchain file's variables have the
same purpose as configure's --extra-*flags arguments.

Reported-by: Owen LaGarde
Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: 47b30835e4 ("configure: consistently pass CFLAGS/CXXFLAGS/LDFLAGS to meson", 2020-10-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index d268f59246..1ea26c67e5 100755
--- a/configure
+++ b/configure
@@ -174,14 +174,14 @@ update_cxxflags() {
 
 compile_object() {
   local_cflags="$1"
-  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
+  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
 }
 
 compile_prog() {
   local_cflags="$1"
   local_ldflags="$2"
-  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
-      $LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
+  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
+      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
 }
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
@@ -286,6 +286,10 @@ for opt do
   esac
 done
 
+EXTRA_CFLAGS=""
+EXTRA_CXXFLAGS=""
+EXTRA_LDFLAGS=""
+
 xen_ctrl_version="$default_feature"
 xfs="$default_feature"
 membarrier="$default_feature"
@@ -394,13 +398,13 @@ for opt do
   ;;
   --cpu=*) cpu="$optarg"
   ;;
-  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
-                    QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
+  --extra-cflags=*)
+    EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
+    EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
+    ;;
+  --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
   ;;
-  --extra-cxxflags=*) QEMU_CXXFLAGS="$QEMU_CXXFLAGS $optarg"
-  ;;
-  --extra-ldflags=*) QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
-                     EXTRA_LDFLAGS="$optarg"
+  --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
   ;;
   --enable-debug-info) debug_info="yes"
   ;;
@@ -1346,8 +1350,8 @@ Advanced options (experts only):
                            build time
   --cxx=CXX                use C++ compiler CXX [$cxx]
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
-  --extra-cflags=CFLAGS    append extra C compiler flags QEMU_CFLAGS
-  --extra-cxxflags=CXXFLAGS append extra C++ compiler flags QEMU_CXXFLAGS
+  --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
+  --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
   --extra-ldflags=LDFLAGS  append extra linker flags LDFLAGS
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-flags-ARCH=   use compiler flags when building ARCH guest tests
@@ -3402,7 +3406,7 @@ EOF
 
     update_cxxflags
 
-    if do_cxx $CXXFLAGS $CONFIGURE_CXXFLAGS $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
+    if do_cxx $CXXFLAGS $EXTRA_CXXFLAGS $CONFIGURE_CXXFLAGS $QEMU_CXXFLAGS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
         # C++ compiler $cxx works ok with C compiler $cc
         :
     else
@@ -3909,10 +3913,10 @@ if test "$skip_meson" = no; then
 
   test -z "$cxx" && echo "link_language = 'c'" >> $cross
   echo "[built-in options]" >> $cross
-  echo "c_args = [$(meson_quote $CFLAGS)]" >> $cross
-  echo "cpp_args = [$(meson_quote $CXXFLAGS)]" >> $cross
-  echo "c_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
-  echo "cpp_link_args = [$(meson_quote $LDFLAGS)]" >> $cross
+  echo "c_args = [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
+  echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
+  echo "c_link_args = [$(meson_quote $LDFLAGS $EXTRA_LDFLAGS)]" >> $cross
+  echo "cpp_link_args = [$(meson_quote $LDFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.33.1



