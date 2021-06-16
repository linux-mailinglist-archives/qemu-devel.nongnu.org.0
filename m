Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA13A8E92
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:49:14 +0200 (CEST)
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKg5-00010l-Ti
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTu-00006b-GO
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:38 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltKTs-0005dr-Sn
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:36:38 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e1so281813plh.8
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9vjtLHy6m1PbkLSF2g+4J6tC1qxnHFOGNf/C4UBGU0=;
 b=HiGvT2TjEp2vf9dV17IYfQK/UC/Z6PvhO7O9F0xtpbdR7amfP2rune7Quzc9yOEOzA
 wi+1RPmh0FHuRHCW1aXkz2XxmhkAu4pizVH/1Sy8o+kgCEbDMFjVuNl2CrEXDNvNl9Wq
 Eg+JWR+0VBmaUhmctJLsHvTOC7l0lKj4HScOVS1CroHZ+zHe2wMrFE+aOGLOFYtXeTs4
 Reu1nRiGvC3xkugJRLhGre9aOZzyKQJPd4al9RJ5m2mNHuzlBth2RwJ8j0PbMbwNCTyU
 +RJ5w8bKGgWt9QG4heMdn6bFsSi2F8/JsCn4Gsa3MULxzB9lsUYv20cGgMbzFVcpnHfM
 dAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9vjtLHy6m1PbkLSF2g+4J6tC1qxnHFOGNf/C4UBGU0=;
 b=VR/x3euM0cIbXOXe53cC8x6z81iJJGz5605UMTjIWny417I4dJdzcyMJZ3A9uqQcSZ
 P0dNtdToZlBCuWdmubMIoN/XQHcGEZvuF6jygLDyZXUR5INIDCoYwmu3eswDH6DwOEZt
 317r2uihJ7MZEWtQkV4PRg2C+ZGuyUZQce62GwsxYdMi1vmoygb4UX7buMDKBAHW5Q5l
 6Lc+AVsID+Mwtug6gm7JPkFrrekoPiE0wMWRbkiNO1KOitQ/JQ/yuLkDKERK5YM2pbgR
 N1Ra6HP4rnl68C94gMn7AAazc0/N6KylhwczKmkcCFkrehu55l3w5ODn9itt0zY7fjzF
 20Hg==
X-Gm-Message-State: AOAM5334UHbeyUrgzEs4OlWqS0Mhkruerzgxj3J7Fci2TA+F2JjRpmBv
 opFx/WiK3Ik8xr1uf5BF8BozMczZRHMT0w==
X-Google-Smtp-Source: ABdhPJxeDsIvMdJY1tummVvPFiaO9nk24a5N1xHACodDhATgzO+5oJsYWSdE0/WMXp889deBP8mDXQ==
X-Received: by 2002:a17:902:8645:b029:fd:25ef:3df7 with SMTP id
 y5-20020a1709028645b02900fd25ef3df7mr7038343plt.48.1623807395604; 
 Tue, 15 Jun 2021 18:36:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id o1sm321595pjf.56.2021.06.15.18.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:36:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] configure: Remove probe for _Static_assert
Date: Tue, 15 Jun 2021 18:36:29 -0700
Message-Id: <20210616013629.1458790-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616013629.1458790-1-richard.henderson@linaro.org>
References: <20210616013629.1458790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

_Static_assert is part of C11, which is now required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210614233143.1221879-9-richard.henderson@linaro.org>
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


