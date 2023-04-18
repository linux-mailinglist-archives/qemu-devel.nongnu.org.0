Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC306E692D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:17:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poo00-0003k4-Vj; Tue, 18 Apr 2023 12:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ponzr-0003jj-Hn
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:15:59 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ponzp-0008Oz-OU
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:15:59 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l31-20020a05600c1d1f00b003f1718d89b2so158429wms.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681834556; x=1684426556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D2i/77SyWywQtTadSgpIdECFj7PI/OrhsehXPVGUOts=;
 b=e1aBjFrEWWN8lJhoVEDnUDazdZHNh29Zsy+2IhjJBEmfnqlr5yWJgMMKEhgfV++gMS
 3ziVYc2ZCd3QRtVg8gF1vXnrEDbDTLOrao4gKbfaApWy1CHUvQZrIpVcgjC6BuB7kafj
 B8Z/WsPRWVmj/1aXhxRtjdyON8/TW5bVEjD2wRBh2W1Z7IfHcdPXjbIHLRujLn1uWngn
 g4kMxcwNX5e6kbmI/HXcKsBL1hidBy61c1Jb5qNukwGgGuaOqHajU65Ab6/y6jOTIQ0U
 90/skWxB+rJKzeKTt6KjChlX/2f3dTyh4sqTN79u8vfz3Rt6Iai6Ja7+lupH3hgBrQR5
 Zl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681834556; x=1684426556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2i/77SyWywQtTadSgpIdECFj7PI/OrhsehXPVGUOts=;
 b=VJWRPPEOL5UK+Znedmiykr/D5LVrL2ffbBv3MB3VS30S/C8E4B0QHhVVsiD+PF/M2q
 Kg75iZiQitbsgDM6eGHeE2bkC+qMabo15VHJ7ZvHGkqx4IUzxIigtBATqdR8WMAzhJEp
 G3RG8oczmZWjxT3eBqR0hc5ijdo3ZG7HcMYgAInBPQxqOtSjOOSzEyxPx4+mSL2z5cIB
 vCWJay1KQWY8IRSI+tLUQ7bAf0jw5isGvCuJdtznk4WOxRoQlyNSwrPEIkXF2LxS6SXG
 luxgU2r5cBSDXPNVAck6aTqV7QsXhrN5GpufS7S5MRlBvAnZONhGCY51eIDX8+eeqH/M
 q95w==
X-Gm-Message-State: AAQBX9fxlAd4N8t/D9/tzR4CJPFf3FwuoF4fyN6Tjqrg/tUxlatU9Hrf
 q9psS7ZqSXzvnU/0Mu018zsVlFPQpFSl5fjkNk0=
X-Google-Smtp-Source: AKy350YPzdEobkZmyf5k2LmWUvFmbvdde6tKkCC5ADrKKsBIKTaBDAVw1DiUW1Q0ZKELg4Xj9438JA==
X-Received: by 2002:a7b:cc88:0:b0:3ee:5c8:c3d8 with SMTP id
 p8-20020a7bcc88000000b003ee05c8c3d8mr14459785wma.34.1681834555929; 
 Tue, 18 Apr 2023 09:15:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003f04646838esm15512797wmh.39.2023.04.18.09.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 09:15:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] configure: Honour cross-prefix when finding ObjC compiler
Date: Tue, 18 Apr 2023 17:15:54 +0100
Message-Id: <20230418161554.744834-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
---
 configure | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 800b5850f40..646048db706 100755
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
2.34.1


