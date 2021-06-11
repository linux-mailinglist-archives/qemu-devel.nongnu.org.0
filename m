Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532943A4B4E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:41:39 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqmQ-0008PE-Cq
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqf3-0004MC-Ke
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:34:01 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqew-0006S5-SW
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:34:01 -0400
Received: by mail-pg1-x52b.google.com with SMTP id l1so3673246pgm.1
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRR9KHmD8NhDhTioChPzrmiqVDXgs8pN4GRxP0NDr8Y=;
 b=uRtH4HicOZmL1KR8gv9QHGbNpJ7clgkqCXaizlmNmkddJ1TeiCJh9LwfOfToVgDp9s
 Fk6t/8OWyLHT5hT+vXSQpm0bsYtbjV/aBz1Z7pBjuH/VrtLsO0AnGRBomPMC2AhmTQva
 MJavNS3/VZAB20oJZhsFvjGu6TeqMldneq5x8/5/1Sw1ysoCHCBTHbMfLe4OM13g5dga
 nYkcmghmcFQitriSJCoUFL5rEoNdDeX9ZMu7GyZoPwYiwzd9kI8YooRXVYWjrCuZALnj
 ceLZ8RBjK0kNeb2en7vTN7r7slInCqhu57hHCsXA9/DfjtTsPpAi1jdDxJ2gqm6p3dgh
 86CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRR9KHmD8NhDhTioChPzrmiqVDXgs8pN4GRxP0NDr8Y=;
 b=DMePmTPQdWfr0ZIY4PjUQ8e+0dyPu4/tliWISvS0B1vQIIy0gIlgPquMk42uBZRDPS
 UGwnklJ3E+KlLWF2+oA+y0YdiVmcZ00dZfplr5P562K3CM6gJ20LZIjknMNLeeHtmDQj
 b52UKC/iQ7PgtqXVSRNus1u1zvM+qiCg1MOmNKENp0Ksqcm+b6yrA9OMK1Y6OAFJDoPX
 U6hc25lK4l6gukWB/0TqVaAy1zc5t1kLPzIYgVAnxOnyZG9xnc1O0roYqCEsLfA+TsSd
 1iPXsrwyeJGYKYEoLYivAC/levCiAfNfzIhg4/+6usXOch6Us76lDK+XRiyC3NwZVVwA
 CDiA==
X-Gm-Message-State: AOAM5319aXm6p0C+FqEM69A7WHMItNphECzu/+N0k6ct+4xT02DPE7RL
 mOaTUWcN2ctPRxwRfs+HdYn6J+5lWyQjkQ==
X-Google-Smtp-Source: ABdhPJzoxegVnVFHFQZG9zgSwS94PxN3yGxQtD6zl2WHHgVB1wFmRqOACjSK8sw501FZz6290g4fwA==
X-Received: by 2002:aa7:8b07:0:b029:2f7:d38e:ff1 with SMTP id
 f7-20020aa78b070000b02902f7d38e0ff1mr495787pfd.72.1623454432821; 
 Fri, 11 Jun 2021 16:33:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] configure: Remove probe for _Static_assert
Date: Fri, 11 Jun 2021 16:33:47 -0700
Message-Id: <20210611233347.653129-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@liaro.org>

_Static_assert is part of C11, which is now required.

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
---
 configure               | 18 ------------------
 include/qemu/compiler.h | 11 -----------
 2 files changed, 29 deletions(-)

diff --git a/configure b/configure
index 0489864667..debd50c085 100755
--- a/configure
+++ b/configure
@@ -5090,20 +5090,6 @@ if compile_prog "" "" ; then
     have_sysmacros=yes
 fi
 
-##########################################
-# check for _Static_assert()
-
-have_static_assert=no
-cat > $TMPC << EOF
-_Static_assert(1, "success");
-int main(void) {
-    return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    have_static_assert=yes
-fi
-
 ##########################################
 # check for utmpx.h, it is missing e.g. on OpenBSD
 
@@ -6035,10 +6021,6 @@ if test "$have_sysmacros" = "yes" ; then
   echo "CONFIG_SYSMACROS=y" >> $config_host_mak
 fi
 
-if test "$have_static_assert" = "yes" ; then
-  echo "CONFIG_STATIC_ASSERT=y" >> $config_host_mak
-fi
-
 if test "$have_utmpx" = "yes" ; then
   echo "HAVE_UTMPX=y" >> $config_host_mak
 fi
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 5766d61589..3baa5e3790 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -72,18 +72,7 @@
         int:(x) ? -1 : 1; \
     }
 
-/* QEMU_BUILD_BUG_MSG() emits the message given if _Static_assert is
- * supported; otherwise, it will be omitted from the compiler error
- * message (but as it remains present in the source code, it can still
- * be useful when debugging). */
-#if defined(CONFIG_STATIC_ASSERT)
 #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
-#elif defined(__COUNTER__)
-#define QEMU_BUILD_BUG_MSG(x, msg) typedef QEMU_BUILD_BUG_ON_STRUCT(x) \
-    glue(qemu_build_bug_on__, __COUNTER__) __attribute__((unused))
-#else
-#define QEMU_BUILD_BUG_MSG(x, msg)
-#endif
 
 #define QEMU_BUILD_BUG_ON(x) QEMU_BUILD_BUG_MSG(x, "not expecting: " #x)
 
-- 
2.25.1


