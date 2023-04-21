Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5B6EA71D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:36:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9S-0008WP-4f; Fri, 21 Apr 2023 05:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9Q-0008VF-1y
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9N-00035m-JS
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJKGv83T2S7mG0eDuSjytY2fJO/y/FRyf9NVrDOvjxE=;
 b=A/OWeHPx2OpudQ8gf/ApT26AfpmgNpRA0bxU0yIEJKzPMC3XWw5ctXh/kG3AkaVP1lAcKk
 +TtETjadfKmmXbWf3ImCsZ6yx6FlePId/AM57GBK1xQbHrLk4OKxJkUPE9F5rA0ieEO8qT
 FQJq1rHF2R9uABmz0mAV9Vmk7O3iq+s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-F4vNWVX6O1yN12oDbydqEA-1; Fri, 21 Apr 2023 05:33:51 -0400
X-MC-Unique: F4vNWVX6O1yN12oDbydqEA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94f271ebbc2so148724766b.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069630; x=1684661630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJKGv83T2S7mG0eDuSjytY2fJO/y/FRyf9NVrDOvjxE=;
 b=VlEts0HWywG54MVfLCEw6B/43yKygtY2b266Od/UA+ejQ3Tl8HGE7F5u20cmsTDP83
 jBErgPpSs0g59bAeeqEw23TEW92z7GD2eqweqbPgK2hqs8W99Gyf6CYfOSc33ZJBfJyb
 nm/TWRNkqYwtzRddlwpQ8SrSW7A+snDbAS31iGjlGgF7GnQClGP1oddhz/9PI3jwSvox
 ww/BFtI8p2ZiYJtWXx8QmyTUYlmiykcHFm+nDQYVYlwFRV+ezkM1YtoW0mhuYZ24g5SY
 Y6R3MYPR7Gz1nNpffiIffA8dA4phd80BcjP8pK/iVww/VfRZg3urmQqONgpZZjBq4gqS
 VXSA==
X-Gm-Message-State: AAQBX9eauwW2sFctDW4d91WmhDuRdhDyLzRIkltZvAAYvEmXEvbcamU8
 VFEjR6YV8gR5jlBrQkgwXzhrDCA7CQzNytVyhp/IOIfapKleqFGl6l53XVh/JMsB8lUw4gwfTEL
 ILKaenist2JX0BriU8HImNc6ieMyWEYGB/trmkwWbK0Ok73+FxRBdBHw7gi0as6NMy+yujX5+aF
 dUgQ==
X-Received: by 2002:a17:906:40f:b0:94f:a8fd:b69f with SMTP id
 d15-20020a170906040f00b0094fa8fdb69fmr1851182eja.18.1682069629855; 
 Fri, 21 Apr 2023 02:33:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350aakeUI62Oe39n9bw7JOwCeiTsZD3C2abS8HiDAq4fruThrmWMJ4ub4HuQ9S5drUBvxgKYaDQ==
X-Received: by 2002:a17:906:40f:b0:94f:a8fd:b69f with SMTP id
 d15-20020a170906040f00b0094fa8fdb69fmr1851170eja.18.1682069629555; 
 Fri, 21 Apr 2023 02:33:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a1709063d6200b00949691d3183sm1830140ejf.36.2023.04.21.02.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 23/25] configure: Honour cross-prefix when finding ObjC compiler
Date: Fri, 21 Apr 2023 11:33:14 +0200
Message-Id: <20230421093316.17941-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

Currently when configure picks an ObjectiveC compiler it doesn't pay
attention to the cross-prefix.  This isn't a big deal in practice,
because we only use ObjC on macos and you can't cross-compile to
macos.  But it's a bit inconsistent.

Rearrange the handling of objcc in configure so that we do the
same thing that we do with cc and cxx. This means that the logic
for picking the ObjC compiler goes from:
 if --objcc is specified, use that
 otherwise if clang is available, use that
 otherwise use $cc
to:
 if --objcc is specified, use that
 otherwise if --cross-prefix is specified, use ${cross_prefix}clang
 otherwise if clang is available, use that
 otherwise use $cc

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1185
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230418161554.744834-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 22b8553b8d70..77c03315f820 100755
--- a/configure
+++ b/configure
@@ -316,6 +316,8 @@ for opt do
   ;;
   --cxx=*) CXX="$optarg"
   ;;
+  --objcc=*) objcc="$optarg"
+  ;;
   --cpu=*) cpu="$optarg"
   ;;
   --extra-cflags=*)
@@ -361,6 +363,21 @@ else
   cxx="${CXX-${cross_prefix}g++}"
 fi
 
+# Preferred ObjC compiler:
+# $objcc (if set, i.e. via --objcc option)
+# ${cross_prefix}clang (if cross-prefix specified)
+# clang (if available)
+# $cc
+if test -z "${objcc}${cross_prefix}"; then
+  if has clang; then
+    objcc=clang
+  else
+    objcc="$cc"
+  fi
+else
+  objcc="${objcc-${cross_prefix}clang}"
+fi
+
 ar="${AR-${cross_prefix}ar}"
 as="${AS-${cross_prefix}as}"
 ccas="${CCAS-$cc}"
@@ -647,13 +664,6 @@ do
     fi
 done
 
-# Default objcc to clang if available, otherwise use CC
-if has clang; then
-  objcc=clang
-else
-  objcc="$cc"
-fi
-
 if test "$mingw32" = "yes" ; then
   EXESUF=".exe"
   # MinGW needs -mthreads for TLS and macro _MT.
@@ -713,7 +723,7 @@ for opt do
   ;;
   --cxx=*)
   ;;
-  --objcc=*) objcc="$optarg"
+  --objcc=*)
   ;;
   --make=*) make="$optarg"
   ;;
-- 
2.40.0


