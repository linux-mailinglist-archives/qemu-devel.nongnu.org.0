Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DE44820A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:45:08 +0100 (CET)
Received: from localhost ([::1]:49888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5tT-0006dF-9y
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:45:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5lB-0008Ck-LP
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:35 -0500
Received: from [2a00:1450:4864:20::535] (port=35471
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-000760-Tm
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:33 -0500
Received: by mail-ed1-x535.google.com with SMTP id g14so62716485edz.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8MjHHXQH5cShYn+34q2ZsnnB3JWsNf/9pzRJ8KPoVUM=;
 b=pnHyAqKG9fT7UTiMZdqOiYSo6EFJ0rDqMGcYRe4uFXex3XLJLMIrFqtIYKT3FvQOmD
 45+e18Cj3kiStKDfmjGvSyZGTTDC9iODrIWl+MBvfVaex+veA2MH30HKLVvnd7q4yWbf
 u7fdKXB64D1Kgywl/6/QN46hpb1F90JEO4596m8wr36y3neKiWpa2ITd88StJxqsqyeu
 +H+7Crn8itc+TwwTTP3YE7lfiTN67iHJITSBvJYFOylnP2QCAmrW0Qp3s9YKczf0fmCy
 Obw/lIHeykPk74k8nP+Cx/mqhTsQ/To9IiCB2euPU5B6bq+tWsf7E5YkN719HZQY5Z6f
 H+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8MjHHXQH5cShYn+34q2ZsnnB3JWsNf/9pzRJ8KPoVUM=;
 b=bKGxuUxw8HmFO391Vwd8UBwRGN1AHAf9PcQQ7bbUFqPB9x+mvLwPTrKI3IlArEVS48
 a9/3ih3cn/EXLkz99d9PGalVtvg4Ofit5tesT6i8odqAfvJAZagMBkqGbvRm1y7IMVwZ
 dlyk6K/WHSbBt/uIreIYVZA0s3BkQtnBzoMHmn7oKaefZlF8bfpVPpgdElZMe/IE7/Ha
 KqyDwkBy9rVzm89XRwTXhWvTWufrh7mdaOcFGf3wrmdrfUFlKwU90I1eCqhm1aHKn8C2
 gPjLU6KlIwxyq++ovnHjVKF9Z/UGdRm746ZVQhGjKzNvZ0XHCfrMocuIkd+4o1WT1QjV
 e60g==
X-Gm-Message-State: AOAM533zaPDW1VXaFI7JX2PGfprNoxRL0E6ghWShofQcqSdtNXJkzq9E
 yDjYBGyTA4VK56aaQhgBviPfnzEJCmU=
X-Google-Smtp-Source: ABdhPJz3NNjlwHCW6MaUSYHgihzIUDCbXJtaUsDGRJrO0f+YZY5xZtjauou/QIRACPsrUk96eSA7Cg==
X-Received: by 2002:a17:906:388f:: with SMTP id
 q15mr344521ejd.145.1636382184240; 
 Mon, 08 Nov 2021 06:36:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] configure: propagate --extra-cflags and --extra-ldflags
 to meson compile tests
Date: Mon,  8 Nov 2021 15:36:14 +0100
Message-Id: <20211108143616.660340-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Thomas Huth <thuth@redhat.com>
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
config-host.mak, since both have the same purpose.

Reported-by: Owen LaGarde
Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: 47b30835e4 ("configure: consistently pass CFLAGS/CXXFLAGS/LDFLAGS to meson", 2020-10-06)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index d268f59246..9f1641e79c 100755
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
+  echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
+  echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.33.1



