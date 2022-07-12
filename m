Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C512D571AE4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:13:36 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFhn-0007Af-UZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLL-00037w-Qu
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLI-0001TL-Rb
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qmpefHMeFqt7J+eOJs+uvYBST3HY9OKBgcZualR70g=;
 b=FPhpnJqvasNtp8LLf60564EVNIRyER4w4c1yGas2Aib1RcZSWUsn60oz/giA9BgUqNv+tH
 TNkg3897T41czfvTQA4DdsZ33zRdMcPD3lV6yMi87jrkL4aOcLPN+R5Xs7oOcDo6ZqwZoq
 IRs/lrdLaALkzARWFNMmRjrSzSfGABw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-Q8eEJzbHNmmJOFV0HYn54w-1; Tue, 12 Jul 2022 08:50:16 -0400
X-MC-Unique: Q8eEJzbHNmmJOFV0HYn54w-1
Received: by mail-ed1-f69.google.com with SMTP id
 b15-20020a056402278f00b0043acaf76f8dso4733770ede.21
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qmpefHMeFqt7J+eOJs+uvYBST3HY9OKBgcZualR70g=;
 b=UAO8hjGsfMhHYX0vgfuDvU8JNiiK7IOZN44MQFeljeoPYybyYbh56bKJgAYTRtej04
 Y5FE1IbnPMLW2AzQuYXnZodVhBubrm9JzTNW8dVUXm3KAByqanYDQ2FCaG3qErAqZ269
 Hc1osC1zV+1j03NEuMO9fLzaqNxudjmvaA7lhDnYNLmVzHLA4kteMlg+TTzdIK8JjUbl
 NBpi5ImNIURr5JIGlpDFk6neaKByV63Ptya+hXjSPoSyM8fsuYPTkb14UVGpeGIJZH8W
 QtF1IcoNmnpK2tfCyCBIvD7EgtxZRhfqG61KtbLweLwZXtfd1Xa+Z/7AYBnC/GD0mARr
 y2uw==
X-Gm-Message-State: AJIora8/ZNoCM08uyPw8LDID4w7llqvtevJfwHssMB22JwDnlRFk7PRt
 0LxeUargbmNE4/Mgwy1xuzoCXuDehRPyAKw+/VDoy1DD91pNm5YIWNm9j9wCNZMVUT8/xOX9f+9
 QsOF42kO2erhIFDgORv29AmWp/4n4jsOG9ZUcHlnykUkyFhSwR9lWk7NXZ6nhb6EBcXs=
X-Received: by 2002:a05:6402:c48:b0:437:d938:9691 with SMTP id
 cs8-20020a0564020c4800b00437d9389691mr31279340edb.254.1657630215257; 
 Tue, 12 Jul 2022 05:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uGfcQtSFvKNFQloyESJXKNvldgaKsuebolDUYvclxDIMYTkWPOrzNbihmwZxtamH2Ku3m7iA==
X-Received: by 2002:a05:6402:c48:b0:437:d938:9691 with SMTP id
 cs8-20020a0564020c4800b00437d9389691mr31279298edb.254.1657630214900; 
 Tue, 12 Jul 2022 05:50:14 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170906345200b007052b183d51sm3762346ejb.132.2022.07.12.05.50.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/18] configure: pass whole target name to
 probe_target_compiler
Date: Tue, 12 Jul 2022 14:49:48 +0200
Message-Id: <20220712124956.150451-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Let probe_target_compiler know if it is looking for a compiler for a
softmmu (freestanding) or a linux-user (hosted) environment.  The
detection for the compiler has to be done differently in the two
cases.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 52 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index 0fd2838e82..5256bc88e5 100755
--- a/configure
+++ b/configure
@@ -1875,6 +1875,17 @@ compute_target_variable() {
   fi
 }
 
+# probe_target_compiler TARGET
+#
+# Look for a compiler for the given target, either native or cross.
+# Set variables target_* if a compiler is found, and container_cross_*
+# if a Docker-based cross-compiler image is known for the target.
+# Set got_cross_cc to yes/no depending on whether a non-container-based
+# compiler was found.
+#
+# If TARGET is a user-mode emulation target, also set build_static to
+# "y" if static linking is possible.
+#
 probe_target_compiler() {
   # reset all output variables
   container_image=
@@ -1896,7 +1907,8 @@ probe_target_compiler() {
   target_ranlib=
   target_strip=
 
-  case $1 in
+  target_arch=${1%%-*}
+  case $target_arch in
     aarch64) container_hosts="x86_64 aarch64" ;;
     alpha) container_hosts=x86_64 ;;
     arm) container_hosts="x86_64 aarch64" ;;
@@ -1925,7 +1937,7 @@ probe_target_compiler() {
   for host in $container_hosts; do
     test "$container" != no || continue
     test "$host" = "$cpu" || continue
-    case $1 in
+    case $target_arch in
       aarch64)
         # We don't have any bigendian build tools so we only use this for AArch64
         container_image=debian-arm64-cross
@@ -2041,23 +2053,23 @@ probe_target_compiler() {
     : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
-  eval "target_cflags=\${cross_cc_cflags_$1}"
-  if eval test -n "\"\${cross_cc_$1}\""; then
-    if eval has "\"\${cross_cc_$1}\""; then
-      eval "target_cc=\"\${cross_cc_$1}\""
+  eval "target_cflags=\${cross_cc_cflags_$target_arch}"
+  if eval test -n "\"\${cross_cc_$target_arch}\""; then
+    if eval has "\"\${cross_cc_$target_arch}\""; then
+      eval "target_cc=\"\${cross_cc_$target_arch}\""
     fi
   else
-    compute_target_variable $1 target_cc gcc
+    compute_target_variable $target_arch target_cc gcc
   fi
   target_ccas=$target_cc
-  compute_target_variable $1 target_ar ar
-  compute_target_variable $1 target_as as
-  compute_target_variable $1 target_ld ld
-  compute_target_variable $1 target_nm nm
-  compute_target_variable $1 target_objcopy objcopy
-  compute_target_variable $1 target_ranlib ranlib
-  compute_target_variable $1 target_strip strip
-  case "$1:$cpu" in
+  compute_target_variable $target_arch target_ar ar
+  compute_target_variable $target_arch target_as as
+  compute_target_variable $target_arch target_ld ld
+  compute_target_variable $target_arch target_nm nm
+  compute_target_variable $target_arch target_objcopy objcopy
+  compute_target_variable $target_arch target_ranlib ranlib
+  compute_target_variable $target_arch target_strip strip
+  case "$target_arch:$cpu" in
     aarch64_be:aarch64 | \
     armeb:arm | \
     i386:x86_64 | \
@@ -2079,7 +2091,7 @@ probe_target_compiler() {
       ;;
   esac
   if test -n "$target_cc"; then
-    case $1 in
+    case $target_arch in
       i386|x86_64)
         if $target_cc --version | grep -qi "clang"; then
           unset target_cc
@@ -2241,7 +2253,7 @@ done
 
 # Mac OS X ships with a broken assembler
 roms=
-probe_target_compiler i386
+probe_target_compiler i386-softmmu
 if test -n "$target_cc" &&
         test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
         test "$targetos" != "haiku" && test "$softmmu" = yes ; then
@@ -2264,7 +2276,7 @@ if test -n "$target_cc" &&
     fi
 fi
 
-probe_target_compiler ppc
+probe_target_compiler ppc-softmmu
 if test -n "$target_cc" && test "$softmmu" = yes; then
     roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
@@ -2275,7 +2287,7 @@ fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
-probe_target_compiler s390x
+probe_target_compiler s390x-softmmu
 if test -n "$target_cc" && test "$softmmu" = yes; then
   write_c_skeleton
   do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
@@ -2488,7 +2500,6 @@ tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
 
-  probe_target_compiler ${arch}
   config_target_mak=tests/tcg/config-$target.mak
 
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
@@ -2507,6 +2518,7 @@ for target in $target_list; do
       ;;
   esac
 
+  probe_target_compiler $target
   got_cross_cc=no
   unset build_static
 
-- 
2.36.1



