Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8D15A1CCB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:53:51 +0200 (CEST)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLjS-0001yC-IQ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKj-0002we-TZ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKi-0004gD-7Z
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDVOKvyIOGUYQ3VEOk5ijeO0+OaAnW4wkqDUjr/Rk7o=;
 b=O1CO8qf4CwDdC1gz2yErfgpCxFIpNUYMff4Vrd5YWy5F5rQ97iG+vfj/A2ZcwqMcDn/irb
 vdjrOc+/ICmilwtAhuXk3m5jczD71YoPp/xebV9KDixGT4NKu64rBY9qmu4k7/1xHOLtpU
 YZTRucN1qnUpzpOVXsofe1qWBqFj6KE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-g8NBMri0NbKAPZ0zCtGykg-1; Thu, 25 Aug 2022 18:28:14 -0400
X-MC-Unique: g8NBMri0NbKAPZ0zCtGykg-1
Received: by mail-wr1-f72.google.com with SMTP id
 m2-20020adfc582000000b0021e28acded7so3709396wrg.13
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DDVOKvyIOGUYQ3VEOk5ijeO0+OaAnW4wkqDUjr/Rk7o=;
 b=STc1B9ayWADGX+7Y3ETR5q4tOQI1AOdHXVzmw0fYlkYAhwo1W+XSYMD4kw+JcaDkCw
 IuKt/5WpqhBjsEeGa7CUptLY3GgYO+MAuypoNEM99Nq2gNvIlpWc6O01a9+tunCdFG8/
 M+m7T//KwLKYq1nywvPROfPgsPwDvoIt9/upkGiYuq+Du+OOaixi7dpRK+VuFS6T0EVI
 N2oms9yh2a91orfrI7SaXCOSFi9gFfsAsqEJ9+QnYpHJfuxa1k33/lRACZgfBoMSXr10
 g55891nB3PjhNWxEsVFO+3F52FAlIgdvmAVZzrJ90pd03gjJUaXBE9xfZCmFuCoHI9iZ
 TQ8Q==
X-Gm-Message-State: ACgBeo0isn7PIX448wzIKcw63bwLQdq4usd2Cl+f//COb1Ru/73MzDro
 75YkJ8VMDSprOQ5ZSihPzmHhkJsRX/Ho4jHJ9jnk0spavoJ91kUl8DAu605ZbcS+rz0g+8uu+8E
 +GRtwkxwgS6/H2cIrnL/2wmhPQiYS0yQYK6zI5t+qMKrA6Ms2G0n6crxphEMWyz3fRTE=
X-Received: by 2002:a05:600c:3555:b0:3a5:d319:35cd with SMTP id
 i21-20020a05600c355500b003a5d31935cdmr3410216wmq.161.1661466492917; 
 Thu, 25 Aug 2022 15:28:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rO2BGl6Qv/k1hUgOBAuviZnQdtwgQHrZ6hV11zRqxaAaPlYnz+CxQLVgovLOUysC5yK+m2g==
X-Received: by 2002:a05:600c:3555:b0:3a5:d319:35cd with SMTP id
 i21-20020a05600c355500b003a5d31935cdmr3410206wmq.161.1661466492629; 
 Thu, 25 Aug 2022 15:28:12 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff244000000b002238ea5750csm378912wrp.72.2022.08.25.15.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 17/20] configure: build ROMs with container-based cross
 compilers
Date: Fri, 26 Aug 2022 00:27:42 +0200
Message-Id: <20220825222745.38779-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

s390-ccw remains a bit more complex, because the -march=z900 test is done
only for the native cross compiler.  Otherwise, all that is needed is
to pass the (now mandatory) target argument to write_target_makefile.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index 97665ef619..c24d0a1023 100755
--- a/configure
+++ b/configure
@@ -2186,7 +2186,7 @@ probe_target_compiler() {
     target_ranlib=
     target_strip=
   fi
-  test -n "$target_cc"
+  test -n "$target_cc" || test -n "$container_image"
 }
 
 write_target_makefile() {
@@ -2341,7 +2341,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
     config_mak=pc-bios/optionrom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "TOPSRC_DIR=$source_path" >> $config_mak
-    write_target_makefile >> $config_mak
+    write_target_makefile pc-bios/optionrom/all >> $config_mak
 fi
 
 if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
@@ -2349,25 +2349,31 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
-    write_target_makefile >> $config_mak
+    write_target_makefile pc-bios/vof/all >> $config_mak
 fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
 if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
-  write_c_skeleton
-  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
-  has_z900=$?
-  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
-    if [ $has_z900 != 0 ]; then
-      echo "WARNING: Your compiler does not support the z900!"
-      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
+  got_cross_cc=no
+  if test -n "$target_cc"; then
+    write_c_skeleton
+    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
+    has_z900=$?
+    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
+      if [ $has_z900 != 0 ]; then
+        echo "WARNING: Your compiler does not support the z900!"
+        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
+      fi
+      got_cross_cc=yes
     fi
+  fi
+  if test "$got_cross_cc" = yes || test -n "$container_image"; then
     roms="$roms pc-bios/s390-ccw"
     config_mak=pc-bios/s390-ccw/config-host.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
-    write_target_makefile >> $config_mak
+    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
     git_submodules="${git_submodules} roms/SLOF"
@@ -2581,7 +2587,7 @@ for target in $target_list; do
       ;;
   esac
 
-  if probe_target_compiler $target || test -n "$container_image"; then
+  if probe_target_compiler $target; then
       test -n "$container_image" && build_static=y
       mkdir -p tests/tcg/$target
       config_target_mak=tests/tcg/$target/config-target.mak
-- 
2.37.1



