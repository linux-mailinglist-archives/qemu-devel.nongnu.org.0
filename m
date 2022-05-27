Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2934536550
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:58:51 +0200 (CEST)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucMV-0001yH-0w
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8G-0002qH-0V
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8E-0003rz-FU
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:07 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l30so6359511wrb.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0qk9B+orXS80H7xnfO/AqbYjsEY7R7F9OwvPTCCFHo=;
 b=jVJj3dggJleqQYWINNChGQj7V9gNqEh7HQFUi7Y27u9mwB8RFHOR/M85sQxQ8VxcbJ
 l8Qja3GiEuMUswzhHMqJ7YS1RO7slj8rKUd+dmvHycNjG9kDDWI45iywHtwfaw3wUUQo
 aZKeY4OAmHL4rmTMiCfbQJWskMYP8I9vRP2mlhzaR0sOc1MSOHRHebe7CsSnxF0u8LWO
 OH79Z4niAgGj+Iodk7n+mFq2aS1A0NEj5BOKztNhtAGELDoGPuhhQjwhFJvkAKhhSbEm
 AVCwic149rLSInDIp3lVKOOEGF+SQmCiKggiXYIMaUNrNoRPsL6/G4mqAIZdkCePk4bg
 4ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0qk9B+orXS80H7xnfO/AqbYjsEY7R7F9OwvPTCCFHo=;
 b=gEmhR/hoIVLks4Ndg/Bge6cl8dRFc/X19egzJKCD862V0rj8bLyGv1O8Wah+kQOJr1
 5FdN9vhlCO2EKKfQKDLIFdEes4XxoFYiDe24wQXjWsQh+yDTGpy2m0HvyWyxJJ8NwmOD
 eKmdV8Mb9xY+cCiyUVAC2JdPCAUzbEjVXoSoRzVqsqXdeGTEULuqRu0nv2PtETMVjXQt
 EkUIAiDSGc2BlzUTZEUqPaHp81aTzwz2lJztV/b5SsnGNpsmYEIprhb62CFBkHEb5W2N
 SoTCa59+Du6sXd9keB5lkOSvcTFi2sYR9AytwQ8lpkg+8Vmr9349Afg/jyfLwRHANxyD
 /vlQ==
X-Gm-Message-State: AOAM530lP8alFdPpfVZ/1L8RTfrD8sdtPEpVvJhCzsfITXMc5pLGMqRT
 XYPdBjqGeWGy5wNyLn+R9ivUOA==
X-Google-Smtp-Source: ABdhPJwEFwt2ij+cOE9TjNMtCS9SKwT0H3KOwOcLzCr729xhzxguwfgluLERM+5n+xCPw4u1vBbSSg==
X-Received: by 2002:a05:6000:345:b0:210:2227:3ecf with SMTP id
 e5-20020a056000034500b0021022273ecfmr246637wre.194.1653666245164; 
 Fri, 27 May 2022 08:44:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a05600c21c500b0039787538c9csm2687120wmj.20.2022.05.27.08.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:43:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 979C51FFCC;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 20/33] configure: handle host compiler in
 probe_target_compiler
Date: Fri, 27 May 2022 16:35:50 +0100
Message-Id: <20220527153603.887929-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

In preparation for handling more binaries than just cc, handle
the case of "probe_target_compiler $cpu" directly in the function,
setting the target_* variables based on the ones that are used to
build QEMU.  The clang check also needs to be moved after this
fallback.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-10-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 31c1ab2579..addbb0fe44 100755
--- a/configure
+++ b/configure
@@ -954,10 +954,6 @@ case $git_submodules_action in
     ;;
 esac
 
-if eval test -z "\${cross_cc_$cpu}"; then
-    eval "cross_cc_${cpu}=\$cc"
-fi
-
 default_target_list=""
 mak_wilds=""
 
@@ -2003,13 +1999,6 @@ probe_target_compiler() {
   if eval test -n "\"\${cross_cc_$1}\""; then
     if eval has "\"\${cross_cc_$1}\""; then
       eval "target_cc=\"\${cross_cc_$1}\""
-      case $1 in
-        i386|x86_64)
-          if $target_cc --version | grep -qi "clang"; then
-            unset target_cc
-          fi
-          ;;
-      esac
     fi
   fi
   if eval test -n "\"\${cross_as_$1}\""; then
@@ -2022,6 +2011,20 @@ probe_target_compiler() {
       eval "target_ld=\"\${cross_ld_$1}\""
     fi
   fi
+  if test "$1" = $cpu; then
+    : ${target_cc:=$cc}
+    : ${target_as:=$as}
+    : ${target_ld:=$ld}
+  fi
+  if test -n "$target_cc"; then
+    case $1 in
+      i386|x86_64)
+        if $target_cc --version | grep -qi "clang"; then
+          unset target_cc
+        fi
+        ;;
+    esac
+  fi
 }
 
 write_target_makefile() {
-- 
2.30.2


