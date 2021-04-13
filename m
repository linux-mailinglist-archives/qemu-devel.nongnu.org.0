Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D390235DF31
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:50:07 +0200 (CEST)
Received: from localhost ([::1]:48776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIUY-0002zV-Tz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWISc-0001WA-3I
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:48:06 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWISa-0001pp-Ef
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:48:05 -0400
Received: by mail-ej1-x62a.google.com with SMTP id g5so19011958ejx.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+0DU0nssNE9Dqd2GnOeTqteOT/NqCeugXBt1xrlSO8=;
 b=Myr/QPM908xZ9uB0eO0WhE1EeGAeJYHtDjcGS/DJLLeO8be32IwJXECLY+7IC8LbW1
 X6Uy1jpJ4RaOlwF+7kV/H4gri1AzkrM6Cb1e7B29yneXeHwJ9lZkjw8qgzKvAT6xch6X
 avs2gBH+RdgRCBcxfKIRLiF428r7O65l4WiyWbeLNW9eCpjeUWMFy4RS9AwDkrsT89Vu
 9y0ea/09VPN5r3+HcHpLzWjkyaoMSeAmC+SedMEU2JKEW1ys0FOOhq12XAm1cOmm+VJZ
 sIuRt+kT52vFlem4iMbH3EGuf+BuRJJBoEPcdhbYNIv7tMzEEtAt0pOTSVgG+BK0feem
 PBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e+0DU0nssNE9Dqd2GnOeTqteOT/NqCeugXBt1xrlSO8=;
 b=BpaYp549Ss6559jNxxCYmJ5HuWC4S2tgkmzDbzx0kWv4Xx+Zest8KGbT2zWyEzbqMI
 Lx4Ll9nmMnh0veME8EfH2okY23hTWJD3Q9jEcjK9JvFd2adG0hNJzrLzVBBRMNP9lzcy
 SQkWOLo++d36X2lztwYChcvvHYXuhPH8myiWRcrgUIhCuCeDUXTV4sR4B4ZOvCEKG69d
 ugFwhjFZ8Rq3VGVJeiSbnP6VH45W0jBywpDXYhlXNAQ9kH24IJhTvaIS3ol6EoAEDZmT
 mYZLRelJ4mdrAyuGxW8rkmpMJ4SPpvakWhyTWhHySdH+JyF/SD3M9EClh2yMvy4VeoDc
 i5EQ==
X-Gm-Message-State: AOAM530aqCIH5kPff3ZRSS4dJnjIkS1Wcd+BNPdOBUe7m4mnBJ9Xsc6+
 BNZqCqwMc8XXCqhMTaRnp8IuDfQ9C3U=
X-Google-Smtp-Source: ABdhPJzR367tlnlugoj9j4F8s6uadtsWQ1pW/GRPIqF6Hxx9rerK6zNgWzlxWK3tw4B4MMRmyxHwNw==
X-Received: by 2002:a17:906:a45a:: with SMTP id
 cb26mr6591680ejb.537.1618318083149; 
 Tue, 13 Apr 2021 05:48:03 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s9sm8635961edd.16.2021.04.13.05.48.02 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:48:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] osdep: protect qemu/osdep.h with extern "C"
Date: Tue, 13 Apr 2021 14:48:00 +0200
Message-Id: <20210413124800.216095-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413124800.216095-1-pbonzini@redhat.com>
References: <20210413124800.216095-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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


