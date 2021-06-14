Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7923A728E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:38:04 +0200 (CEST)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsw9b-0004UL-TC
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3j-0006SG-Ft
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:59 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3b-0007kU-CQ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:31:59 -0400
Received: by mail-pf1-x430.google.com with SMTP id h12so11833325pfe.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0pN4S7m1hCj6S3qy/fvRVDleeUZszaFc8rCoVuMIfI=;
 b=CmUhYgvQ2BkO1D846TLkfu0QfGwYkaLJDqJdsUf4mmiOm2fj/2pohX2NwFbr4TEjJm
 pJpLbkdeh/iv7AP0MTBs8WMeQAhEMon0Ig015M21jS8q/mxluOnarMPwLfonbq3Wd12L
 Z6GE5HhODNzR0dDFo2zl+iuCk3iRJmXsmiXtTCnhe35gguzHXeBUH9hKsWAMaTM33c4q
 mq8C12keveg+eB9t1n9QyYPbWz55Kqdjdyft4ilEztBKxv9KjPEAKK2pJG0CkMVrQNNI
 7XBFLKzTK12dandqIRKtupZT8TCTbiRRlJZk1PwlgD1sTPZ4HoZAaCg8XsSHEVgpOpog
 44OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0pN4S7m1hCj6S3qy/fvRVDleeUZszaFc8rCoVuMIfI=;
 b=Pnxe1/yEhuQM+uQbJ5qVRcrc0c6BVlOJdWOY0SfUdKkcsWorX5WdG6yWGbOkJPCE76
 UnZnGE5Z/gVilza6gwsEw3Mxh8H7KAqG93ICwlKQ4JfLAgkzreQZNq7+XWZMDN3VWGh4
 uZ9bugoJQutx6d0SnZQlVtkK2knQxvVfN375Om145NBdTcB7UoohttD4ZA/qSrl382iU
 dyRSiDYWB2vPXxeB1mK67RCeGw3Ora+/1v1iMHT8T02fTvUbZUi2Qg//9+akGZAYsFUe
 QyDLAAQp/oWsKLCEX+VFWkPCyfQl3U2pNcDMNIUoxrAtLbqyiZXty3R//jAEPXLAXFyX
 0/8w==
X-Gm-Message-State: AOAM533L1sP8CNCmYRBu2kS0Wxd7QWvopfMeCM8v/FpU1JYu6HFC+uYl
 4j4pE7fXsqBw72Qcume72/WcP/oec4doaQ==
X-Google-Smtp-Source: ABdhPJz0UYL9oLfIisSo95FnXASv6zM78G76D/tfsud2oq90iTLdCw8x0XNDoefg1eNFjchC5zmjqQ==
X-Received: by 2002:a62:f947:0:b029:2e9:c502:7939 with SMTP id
 g7-20020a62f9470000b02902e9c5027939mr1514964pfm.34.1623713509826; 
 Mon, 14 Jun 2021 16:31:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] configure: Remove probe for _Static_assert
Date: Mon, 14 Jun 2021 16:31:43 -0700
Message-Id: <20210614233143.1221879-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

_Static_assert is part of C11, which is now required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


