Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB64B73F9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:08:23 +0100 (CET)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1JO-00044M-KJ
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:08:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Ci-0004pE-Ti
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:30 -0500
Received: from [2607:f8b0:4864:20::433] (port=40916
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nK1Cd-0007Sk-Aa
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:01:28 -0500
Received: by mail-pf1-x433.google.com with SMTP id c4so14553133pfl.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FnEB3B4/ZVIf8wBNfHZ8TLXBDLBjRhVvogxhs+VZaoM=;
 b=fTI97ojbmWsjvN+0lV5K13sOlM9Rej0hVB5UVmctxGRS9wZpPnf/pXZN6c1nE3ntqR
 WbpOjNLW+QQVFZHjA0Fj+7o6FXZKMimrRSxDp9pgmsMrFI2DYbRcJahC3dROZ9ub+tPA
 Pw7YbQGn6DrNxJ8QtoRrVISTsrJFqXHIqK8KbCKY7Ay2sf3Ch9fW9PWvKX2tRGIXrEoC
 MduIMEetwPovvUgN6aiw+nrfh6CSLm9zPmA53DClBSf92BQlCpa/LnyC//tehshZ+tJm
 aogFgZCJ2p8spqouYF9UurQc9V/F0IIFGrOW4LMLWce5kD41oBFrOmn2AysTjX3aRIAC
 w9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FnEB3B4/ZVIf8wBNfHZ8TLXBDLBjRhVvogxhs+VZaoM=;
 b=d7PC2kleK3tkOpOpuZbZJU29QoS8BztWRRNutWiDS0gdeSM80K0CKqWDB+b585VDhT
 cTVC6nB1hvgzOuTCk4BoqxwZV93EAEG58u/n7GYNMbPqqh6KLTkkcfQ3zvHEAr6WeNGu
 DN/jpho/gx9TqN6xy6lsX+piEoPnWZT/Fl7LanaKIefJJiVMTDRWZZGh3XjoWCTLOXAt
 0+6LU18rXutbjxE6dO5nh07DtMuu5NNlVlcpS73BSumv9W44QsEZM3xdxsfJE8KS27vD
 FS7icRf3KiGVwPJw2JXqfmBSgJdSOZXLLKcPFs0+mlmsk2S2eFb0EZHD24IQp4twn6G/
 Qdog==
X-Gm-Message-State: AOAM533VpbrP6aPPHvwbkFuiZqsBGPD1Ff/PY4S0ti/sd8Q2OA1k7RTr
 pMO9rJCZHYK7bDR13B7z1/X8Z4Webf0=
X-Google-Smtp-Source: ABdhPJxMQzasJwfjnRIgji7pg97CblPCJxIfe35jREJXPaldo+xUvUpin86/JAhA0zZadP8FpT9yBQ==
X-Received: by 2002:a62:e115:: with SMTP id q21mr4841417pfh.40.1644944481345; 
 Tue, 15 Feb 2022 09:01:21 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id d15sm41409837pfu.72.2022.02.15.09.01.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 09:01:21 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/8] osdep: Avoid using Clang-specific __builtin_available()
Date: Tue, 15 Feb 2022 18:00:59 +0100
Message-Id: <20220215170106.95848-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215170106.95848-1-f4bug@amsat.org>
References: <20220215170106.95848-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Remove the Clang specific __builtin_available() to allow building
with GCC, otherwise we get:

  include/qemu/osdep.h: In function 'qemu_thread_jit_write':
  include/qemu/osdep.h:787:9: warning: implicit declaration of function '__builtin_available'; did you mean '__builtin_scalbl'? [-Wimplicit-function-declaration]
    787 |     if (__builtin_available(macOS 11.0, *)) {
        |         ^~~~~~~~~~~~~~~~~~~
        |         __builtin_scalbl
  include/qemu/osdep.h:787:9: warning: nested extern declaration of '__builtin_available' [-Wnested-externs]
  include/qemu/osdep.h:787:29: error: 'macOS' undeclared (first use in this function)
    787 |     if (__builtin_available(macOS 11.0, *)) {
        |                             ^~~~~
  include/qemu/osdep.h:787:29: note: each undeclared identifier is reported only once for each function it appears in
  include/qemu/osdep.h:787:34: error: expected ')' before numeric constant
    787 |     if (__builtin_available(macOS 11.0, *)) {
        |                            ~     ^~~~~
        |                                  )

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/osdep.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index d1660d67fa..aecd2f66ec 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -777,16 +777,12 @@ size_t qemu_get_host_physmem(void);
     MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
 static inline void qemu_thread_jit_execute(void)
 {
-    if (__builtin_available(macOS 11.0, *)) {
-        pthread_jit_write_protect_np(true);
-    }
+    pthread_jit_write_protect_np(true);
 }
 
 static inline void qemu_thread_jit_write(void)
 {
-    if (__builtin_available(macOS 11.0, *)) {
-        pthread_jit_write_protect_np(false);
-    }
+    pthread_jit_write_protect_np(false);
 }
 #else
 static inline void qemu_thread_jit_write(void) {}
-- 
2.34.1


