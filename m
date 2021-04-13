Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A4335E3FB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:31:09 +0200 (CEST)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLwS-00063W-F6
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLay-00071x-Kj
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:56 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWLaw-0007HD-T4
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:56 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l4so26793014ejc.10
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+0DU0nssNE9Dqd2GnOeTqteOT/NqCeugXBt1xrlSO8=;
 b=uN1uvx461op83sZWSReRLWw47BI0mcFC9uIPRsx1koHAz7L3gtdx1YFfzMX1CCuMBT
 vZ93Z1sZ+3sAvlEARB8U5tWx0wnYAYvLZlr1bWycNv9ANjILfJarwxXdq+O1ohfdWvRb
 jrtQmEK3SyDWlEd/NXHJygn5sZeKtj9eX5fEI8Wx9cEVPGBFAK4X2yLqK0SATy5For+Z
 /20kAEDlHGdEOEz9g4m+PqMw83fLBwoOyl79jdm8tmZtnOlyBjrk0sXRfqmpx2qfkUCk
 JfcQNInGXEB747YoHmaqiO/sYKrNpEodbyLA58dFDn0qWwB4Uzt3zb2NApKCegXx8Rw6
 UCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e+0DU0nssNE9Dqd2GnOeTqteOT/NqCeugXBt1xrlSO8=;
 b=VC6ICaSj+pLJ2AssU6V98fFRvwe9oRdiIA2CdX9BiOupxDLq4Szpm5EEuuVHxIj7uT
 /v7Vie4Ac2mT0dzvwFcT3lk0g2322yqEmx85AJ0h0F6ivyCI+RC66G3oxpp0QuXphlkO
 P1+kfto63+I6ha2v1cacvpsXEKufTr/wljwe41ryWDnmzOZ5t/m5+kpKXvrQ74bHJpyn
 bNXvfJArmcwtVApSu7OKLcG7keFGJGQCCkqJytTDwQOZdUoEewA2NrTLWUmir486NAi2
 Tjs6377TI0pmhVGb5baRAUnzaf7su191lQ4CJmpxhDOds2qh7tZi5EZUtfxBHV5wNu/Z
 2N6w==
X-Gm-Message-State: AOAM533ZDKnsQ5aaFBWg1oSsGjttsSdIP1EvFTmK2pVXf5QRrq+CoN3B
 7pryeh63YZIjrF4PFObBLgGlC+4CyIk=
X-Google-Smtp-Source: ABdhPJxj9B38PNKSx1kJh06HI4upEnYSWRJEi52kgvBtKxsOoMeLE3FOOejhK1jZ6f4f39yKxgZKEA==
X-Received: by 2002:a17:906:dfcc:: with SMTP id
 jt12mr33167316ejc.31.1618330133489; 
 Tue, 13 Apr 2021 09:08:53 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u19sm9897670edy.23.2021.04.13.09.08.52 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/3] osdep: protect qemu/osdep.h with extern "C"
Date: Tue, 13 Apr 2021 18:08:49 +0200
Message-Id: <20210413160850.240064-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413160850.240064-1-pbonzini@redhat.com>
References: <20210413160850.240064-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

System headers may include templates if compiled with a C++ compiler,
which cause the compiler to complain if qemu/osdep.h is included
within a C++ source file's 'extern "C"' block.  Add
an 'extern "C"' block directly to qemu/osdep.h, so that
system headers can be kept out of it.

There is a stray declaration early in qemu/osdep.h, which needs
to be special cased.  Add a definition in qemu/compiler.h to
make it look nice.

config-host.h, CONFIG_TARGET, exec/poison.h and qemu/compiler.h
are included outside the 'extern "C"' block; that is not
an issue because they consist entirely of preprocessor directives.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 disas/nanomips.cpp      |  2 +-
 include/qemu/compiler.h |  6 ++++++
 include/qemu/osdep.h    | 10 +++++++++-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 2b09655271..8ddef897f0 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -27,8 +27,8 @@
  *      Reference Manual", Revision 01.01, April 27, 2018
  */
 
-extern "C" {
 #include "qemu/osdep.h"
+extern "C" {
 #include "disas/dis-asm.h"
 }
 
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index cf28bb2bcd..091c45248b 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -11,6 +11,12 @@
 #define QEMU_STATIC_ANALYSIS 1
 #endif
 
+#ifdef __cplusplus
+#define QEMU_EXTERN_C extern "C"
+#else
+#define QEMU_EXTERN_C extern
+#endif
+
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b67b0a1e8c..3f8785a471 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -57,7 +57,7 @@
 #define daemon qemu_fake_daemon_function
 #include <stdlib.h>
 #undef daemon
-extern int daemon(int, int);
+QEMU_EXTERN_C int daemon(int, int);
 #endif
 
 #ifdef _WIN32
@@ -113,6 +113,10 @@ extern int daemon(int, int);
 
 #include "glib-compat.h"
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -723,4 +727,8 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif
-- 
2.30.1



