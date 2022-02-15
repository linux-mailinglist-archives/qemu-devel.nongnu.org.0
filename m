Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC824B6BBB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:10:09 +0100 (CET)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwem-0002Uw-D9
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:10:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbT-00014Z-7X
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:06:43 -0500
Received: from [2607:f8b0:4864:20::1035] (port=44688
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbQ-0001TS-HN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:06:42 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so1939794pjh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 04:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=42qBX2F42ju9AYB7enVveSzKv42NjYzI623y0XxCx+U=;
 b=bj6yu4HidzCGKRLnecteaJpR9woexFyHVp+72m2pwzpwW21jJ6XCaP7KbEASIqXKTx
 XnYYNUhey4FCTVp6i/wsmCkzfb8XyqBjSy7eL8yxEb+9yaKdkv1gWmgYw47vdgsOEXaO
 gn1wz78VEhimBJXiz0yEDGqCZx0693sbW4gvfagdF8hsHAfP6tiO2MporCmvs+vq3W1A
 wNPaQMLGp1qI7einsHRS4r/z/YL1pbq/CanZOpsCLw3UrR6GjtkzPujZ1ksxnLuhum92
 ru9QXnTfzsSSG++wAl5vrHQxVPW+EqKQJt3gLLi9QZD7EP9UQ2I41bz1lUoO44tSCJot
 atJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=42qBX2F42ju9AYB7enVveSzKv42NjYzI623y0XxCx+U=;
 b=sVNUUZMLfO8iz7Mr73zEJEEsN4dPiW86WAENKo9zUVsWOHImLT883fQb0gPxpb+zEG
 dJyJ+bN7A+ZWAjld3Ny4oDwdlrlZIE+ojIzOvYcl/Vob7S3KBfYpt6AjGFKQm9WAokTO
 46WL8dplAEcFtK/7AH/0fNfLkol0zXjhhDTORxBpp+3/ssbThf2omBIwC8ROAcJNuvrA
 BbV3lBfhrzVJZ7i661HGwql3ytFvSl3Q/nHGEPfBWLzl8FjQUH3OeFQ7Nn9EQ4Th/Di3
 DGpF0Tly0X66D2vVX9+GOmpbZbLxD4Dz+LdYYyn05OaapUwBxGXwVn2Vheq4zWzjOIMa
 eAeA==
X-Gm-Message-State: AOAM531LtHjNUX3guE8/nUcfK/cQlI3Hmj2v3rT14IU7m1B5yrqFsBs5
 SBCAyXYEJtb4a+wXwCxLUd9onfVMd1Y=
X-Google-Smtp-Source: ABdhPJx306ybpviD37r13H86T6VF7EFoI9HwboITHN1Y/SZff70rA8JUFghyFFfEfs2kYvZFJZcMcQ==
X-Received: by 2002:a17:90b:4f43:: with SMTP id
 pj3mr4018067pjb.9.1644926798992; 
 Tue, 15 Feb 2022 04:06:38 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id nn1sm13365032pjb.47.2022.02.15.04.06.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 04:06:38 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 1/4] osdep: Avoid using Clang-specific
 __builtin_available()
Date: Tue, 15 Feb 2022 13:06:22 +0100
Message-Id: <20220215120625.64711-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215120625.64711-1-f4bug@amsat.org>
References: <20220215120625.64711-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Replace MAC_OS_X_VERSION_MAX_ALLOWED upper check by the lower
one (MAC_OS_X_VERSION_MIN_REQUIRED) and remove the Clang specific
__builtin_available() to allow building with GCC.

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

Replace the MAC_OS_X_VERSION_MAX_ALLOWED upper check by a lower
one (with MAC_OS_X_VERSION_MIN_REQUIRED) to avoid on Catalina:

  include/qemu/osdep.h:780:5: warning: 'pthread_jit_write_protect_np' is only available on macOS 11.0 or newer [-Wunguarded-availability-new]
      pthread_jit_write_protect_np(true);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/pthread.h:561:6: note: 'pthread_jit_write_protect_np' has been marked as being introduced in macOS 11.0 here, but the deployment target is macOS 10.15.0
  void pthread_jit_write_protect_np(int enabled);
       ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/osdep.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index d1660d67fa..1e7a002339 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -774,19 +774,15 @@ size_t qemu_get_host_physmem(void);
  * for the current thread.
  */
 #if defined(MAC_OS_VERSION_11_0) && \
-    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
+    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
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


