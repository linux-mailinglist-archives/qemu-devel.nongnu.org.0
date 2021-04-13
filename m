Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D935DDF2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:43:09 +0200 (CEST)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHRk-0000e1-7a
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWHMZ-0005nC-8G
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWHMX-0005HE-Lh
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:46 -0400
Received: by mail-ed1-x52d.google.com with SMTP id bx20so17830595edb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 04:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+0DU0nssNE9Dqd2GnOeTqteOT/NqCeugXBt1xrlSO8=;
 b=D1h/Qv2DJIlsLdhJjqtOPwpVinJWSusclLuOOpV5Wbwmh1VWsaQByxNFnn2xgBXt00
 YriByx7A36CTVHPXgD/DFzGpYj1cdYPkuww30SKFqgv5QCjzFvD/gMvfusXei4j/Mqd7
 RyDxIKtb/OJhLKnXczCwoZ/UTcV6x0V5NoHNf2Th3R/GU8oG6Ez1FVvkgmH26KeiW0CV
 Pl4CWC73HiVRQdDhfPDZiFKc8LBYZGybCSMvPOA+4zeB7lBdFLPozQ2kSjhYm5fjH+E5
 FGssc5XoRgLMkCwLDgaUlyz1yaYSH9pzRGmqzsdO9WobeWS4KCt4c4fatWPyj9PiuOuE
 gSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e+0DU0nssNE9Dqd2GnOeTqteOT/NqCeugXBt1xrlSO8=;
 b=mVRyJjh5+l6PVBsii/FLviZgJfvFaKYeUEaBrPQe9bXc7+QiA5j19pzvHZRsSRP4jB
 cBX91/ACAOCNpfDqSzZ69ihDxw4qtzlvtus5nItXNJxIk9Yiv4YVeJprERlTsEwHUh8j
 8Vb9n8t8uiXH4+aCNQufjaEepkEd1P1CPjUw38xr7PRtvPYDo5fOpkLpj2OCqK7uKx/B
 jtdm6qaqv+QBNWTbjIxXA4o6iyhL4r1kqy0F+eVG64eqKJHYx2tlMTJi99DwuUgGYmeB
 IjQKsfxdiwK6kzrvEBlw0dGmEZTS8lYzvg+oTGrQg833R7izLS4MVTavomUjM/6VZfmc
 J8lA==
X-Gm-Message-State: AOAM533gzmcGhrlpAOUo+lln+UCzIs6Sq8HsEovwWhxoq1C5G2G5ri4P
 8HwPz2d7aF8zjwPpHPc35Sd4+Tk6o0U=
X-Google-Smtp-Source: ABdhPJzHXAD396Z1JP05NLrEmuH7y+oSOKaPQi3DzgqpLh+0NgX4huYr80UTBX+x9Fin7QUuUVLyJg==
X-Received: by 2002:a05:6402:3593:: with SMTP id
 y19mr34376040edc.317.1618313864254; 
 Tue, 13 Apr 2021 04:37:44 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s17sm7640965ejx.10.2021.04.13.04.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:37:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] osdep: protect qemu/osdep.h with extern "C"
Date: Tue, 13 Apr 2021 13:37:41 +0200
Message-Id: <20210413113741.214867-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413113741.214867-1-pbonzini@redhat.com>
References: <20210413113741.214867-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
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


