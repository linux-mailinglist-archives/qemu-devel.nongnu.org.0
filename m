Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61753AD04
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:48:37 +0200 (CEST)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTOW-0000UV-LO
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwT0n-0005iQ-4B
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:24:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwT0l-0007wD-6R
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:24:04 -0400
Received: by mail-ed1-x529.google.com with SMTP id v19so3334341edd.4
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6wSZzTZH+UuAV+xIj6vY8Z6NNL8CvUpk5/yn56lmqI=;
 b=mApJFjRtRc6t+LdcNDmbDQTxRUi37aDor5R2UTUkqOx4JBeFFXs6A3sjVqsztjprwK
 74LOzlRGCaIqdmZXfvojWAf+bdJtyGlckJhOvs9Txjt0FTpms2kjo527BLdJL8lWXFhJ
 TxSC1f5YHxZR0fWakzE8PtdoOKTvqbe2Sg4IDl7ldNXUXRXnH163K2ISpqHVSGPdJvgA
 hmLjoN8X2mKy8Th1zbUyAm6lQx4tbgACCc8cNXVjmPd93lSANV9BjWK9isUQ8W3C5vHQ
 cXvkGPGLgxKExTrN/buCEHmU8YZFw+OwTUzZr6GEoyjlbDoKL+p9nEN57KjCq9m/FUJ1
 M1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6wSZzTZH+UuAV+xIj6vY8Z6NNL8CvUpk5/yn56lmqI=;
 b=y5UQ7G1QIxC1S2J5JrJR0RIfIaEFSI4EhW2QRBAS14G/3OOErSx+zUq9V0ap95kHDY
 m106eQ+OsfWYF81KHz//ZXUo0aRF/GLu9+EtKsIOpbfwgjWpoq+dOehdoXr53pOVrRVK
 5n7S3RuauEuP6gOhiyDhU1OS/hy27188Jx6WQJfcOxfvMwDtvEZ5ymVkipDabEH38ZlY
 vpLfWyFhqTAfTuQDWVlBaA8EAmOB79oIIbVOHmOtv211Q/+pjUcQDaaQdcKQt0QXYBFT
 sOk7/CYNY7jg/RUzO3gMAxbd+9BrpEn1CLXvUZbQ/29XDClhdwTDXIANfKkkxahlGUM+
 fMkw==
X-Gm-Message-State: AOAM531BF86Egnx8L5ZZTVZ8aBRBL2sdFo7V5m2B7PmShk5wAD6BmyXF
 EX9tqRB+dVXhe58tWWW1Jy+LaA==
X-Google-Smtp-Source: ABdhPJw5fCaHFpbaMPM3TM+dtievc3wr7DRPxRO/cIU4jagsUiGz2oJ/qvq47XfcoMQ7m5S2OeewTA==
X-Received: by 2002:a05:6402:2696:b0:42d:e816:8378 with SMTP id
 w22-20020a056402269600b0042de8168378mr1106178edd.143.1654107841668; 
 Wed, 01 Jun 2022 11:24:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p3-20020aa7c4c3000000b0042db87b5ff4sm1340647edr.88.2022.06.01.11.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:23:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 880091FFCB;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 20/33] configure: handle host compiler in probe_target_compiler
Date: Wed,  1 Jun 2022 19:05:24 +0100
Message-Id: <20220601180537.2329566-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Message-Id: <20220527153603.887929-21-alex.bennee@linaro.org>

diff --git a/configure b/configure
index fbf6d39f96..217c8b3cac 100755
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
 
@@ -2008,13 +2004,6 @@ probe_target_compiler() {
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
@@ -2027,6 +2016,20 @@ probe_target_compiler() {
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


