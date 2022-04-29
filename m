Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640C514CA1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:20:32 +0200 (CEST)
Received: from localhost ([::1]:54880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRTz-00009r-7m
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRw-0005iY-BK
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:24 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRu-0004Z6-NQ
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:24 -0400
Received: by mail-ed1-x532.google.com with SMTP id p4so9320514edx.0
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMCY4YCH8i/SiEFJws5UTh2zIpQl/Kl6qbHZlEXIHXY=;
 b=oRBfAvvklsRCjEeQ6D1TCPo9hTEd/3NMrVCn3StPp+ZIrFtBkOI2Il3VC6/LTXqUi/
 AN+Xct3C/47Ussx2Lq++sFr/48jrFqWXqW7XTqmJJqGcfA3ui3dFc9Uf0/879s37QgU9
 Q6th4PoF68o6r04+lMCJc0VftpcaWb8DiWUYdHlZ2jL2uszb3Wg73c/kFq1FQknzYc+M
 QlYXoB9T1AE/K+bLHlFezZW9bDJixGs7lzF6h5/TG7VtbpNjj9lq55TjDz7/eM4iXrFV
 oSAToegUO7VRaX8rcZTZNw7gYjvb4HHMw1tOMe8l8EdIzEk0fMEIovP3n+3MNslTv49k
 smOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GMCY4YCH8i/SiEFJws5UTh2zIpQl/Kl6qbHZlEXIHXY=;
 b=FLgNwk1+ynOQe9hQY84PKpYjuWTYeqdRzHu/Y7x63hqliMzOWROQeTL4L3Bfw9jhcw
 Tjd9DOvgUR5rr8eSz3npdnjXh02qPssNgqq0H2GEMOzs0b0LG77U6HSl8rllEXuk/Jpg
 09Fa7q70Thx1WnD5VLA2E6FNPiMiKyS/7hxinAIGObF/XDWxX6pb3k22EHbCx9CevLLh
 040PfQgrbAqIIleC0tAsfyWGmMWzt6rby90IN4W2DzpByoAKlbA0FSUSqYHgA5u3oehQ
 gDDrADzkYWW1YWMfWBBzWKaQQjyXnSGqIG+DvcF6nA526Qe6utJFbtqouF8jTF0Mq5RZ
 0KqQ==
X-Gm-Message-State: AOAM531Qm7KJHUc3zfDzznn5aimzlHQ7i3tYB7Op6cX+A7Dk3M5dAOnz
 St5RmYKyspCg0suYSXrwmqiubU0T2sMLEg==
X-Google-Smtp-Source: ABdhPJwxv/AUg5NubtYuLGzAXFxAxI6JYEPoG1qrBYE9gOiavaItlfAQCW70R65qBGMlJpngCjJ7rw==
X-Received: by 2002:a05:6402:3508:b0:426:1b4:a2e2 with SMTP id
 b8-20020a056402350800b0042601b4a2e2mr17024375edd.387.1651241899619; 
 Fri, 29 Apr 2022 07:18:19 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/12] configure: include more binutils in tests/tcg
 makefile
Date: Fri, 29 Apr 2022 16:18:06 +0200
Message-Id: <20220429141813.328975-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Firmware builds require paths to all the binutils; it is not enough to
use only cc, or even as/ld as in the case of tests/tcg/tricore.
Adjust the cross-compiler configurator to detect also ar, nm, objcopy,
ranlib and strip.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/configure b/configure
index c05eeb6a74..8626989239 100755
--- a/configure
+++ b/configure
@@ -1898,11 +1898,21 @@ probe_target_compiler() {
   container_image=
   container_hosts=
   container_cross_cc=
+  container_cross_ar=
   container_cross_as=
   container_cross_ld=
+  container_cross_nm=
+  container_cross_objcopy=
+  container_cross_ranlib=
+  container_cross_strip=
   target_cc=
+  target_ar=
   target_as=
   target_ld=
+  target_nm=
+  target_objcopy=
+  target_ranlib=
+  target_strip=
 
   case $1 in
     aarch64) container_hosts="x86_64 aarch64" ;;
@@ -2041,8 +2051,13 @@ probe_target_compiler() {
         ;;
     esac
     : ${container_cross_cc:=${container_cross_prefix}gcc}
+    : ${container_cross_ar:=${container_cross_prefix}ar}
     : ${container_cross_as:=${container_cross_prefix}as}
     : ${container_cross_ld:=${container_cross_prefix}ld}
+    : ${container_cross_nm:=${container_cross_prefix}nm}
+    : ${container_cross_objcopy:=${container_cross_prefix}objcopy}
+    : ${container_cross_ranlib:=${container_cross_prefix}ranlib}
+    : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
   eval "target_cflags=\${cross_cc_cflags_$1}"
@@ -2053,12 +2068,26 @@ probe_target_compiler() {
   else
     compute_target_variable $1 target_cc gcc
   fi
+  target_ccas=$target_cc
+  compute_target_variable $1 target_ar ar
   compute_target_variable $1 target_as as
   compute_target_variable $1 target_ld ld
+  compute_target_variable $1 target_nm nm
+  compute_target_variable $1 target_objcopy objcopy
+  compute_target_variable $1 target_ranlib ranlib
+  compute_target_variable $1 target_strip strip
   if test "$1" = $cpu; then
     : ${target_cc:=$cc}
+    : ${target_ccas:=$ccas}
     : ${target_as:=$as}
     : ${target_ld:=$ld}
+    : ${target_ar:=$ar}
+    : ${target_as:=$as}
+    : ${target_ld:=$ld}
+    : ${target_nm:=$nm}
+    : ${target_objcopy:=$objcopy}
+    : ${target_ranlib:=$ranlib}
+    : ${target_strip:=$strip}
   fi
   if test -n "$target_cc"; then
     case $1 in
@@ -2074,6 +2103,10 @@ probe_target_compiler() {
 write_target_makefile() {
   if test -n "$target_cc"; then
     echo "CC=$target_cc"
+    echo "CCAS=$target_ccas"
+  fi
+  if test -n "$target_ar"; then
+    echo "AR=$target_ar"
   fi
   if test -n "$target_as"; then
     echo "AS=$target_as"
@@ -2081,14 +2114,32 @@ write_target_makefile() {
   if test -n "$target_ld"; then
     echo "LD=$target_ld"
   fi
+  if test -n "$target_nm"; then
+    echo "NM=$target_nm"
+  fi
+  if test -n "$target_objcopy"; then
+    echo "OBJCOPY=$target_objcopy"
+  fi
+  if test -n "$target_ranlib"; then
+    echo "RANLIB=$target_ranlib"
+  fi
+  if test -n "$target_strip"; then
+    echo "STRIP=$target_strip"
+  fi
 }
 
 write_container_target_makefile() {
   if test -n "$container_cross_cc"; then
     echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    echo "CCAS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
   fi
+  echo "AR=\$(DOCKER_SCRIPT) cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
   echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
   echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+  echo "NM=\$(DOCKER_SCRIPT) cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
+  echo "OBJCOPY=\$(DOCKER_SCRIPT) cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+  echo "RANLIB=\$(DOCKER_SCRIPT) cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
+  echo "STRIP=\$(DOCKER_SCRIPT) cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
 }
 
 
-- 
2.35.1



