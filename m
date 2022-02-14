Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE904B5A94
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:37:04 +0100 (CET)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJh9g-00036U-J2
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXm-0002QH-Ot; Mon, 14 Feb 2022 13:57:51 -0500
Received: from [2607:f8b0:4864:20::102e] (port=45747
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXk-0006Sa-O4; Mon, 14 Feb 2022 13:57:49 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso43302pjl.4; 
 Mon, 14 Feb 2022 10:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlmSMkeCwUd8E6YT5e8ACCLaTL1+jSNfQP2Uet5vd1k=;
 b=nEetAl/VgRr0Mak0q73c3UUAn/OEwr/Owp1XwhMXIZAMhaF2EjhfGlFTUSvgTeqMoQ
 czeVu6wmbIvh0h+XETv51/LK6p9TcgP+vwrV3D1GffXkZe/MVp78C708ahF8dunUXtXp
 GVmaRbkM9r2pObDi/BKu5LSBvLkp9fCKnLRs9WDxgrf+euC2Hk2gAiAz9cqJZZaJ4wRa
 aML2MfY/WtyG+e3uKItg3zy7EJnPuwpOm3UKO1VTsbmhJzimzrCSbkKDOujVKYTJ90Rd
 biT/G9/suShMGAYsc8yYZu1aut9YMqqRhgQXcc/j2ftWZj7mP7Zbb4gxYm63PLaiuD6b
 TCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jlmSMkeCwUd8E6YT5e8ACCLaTL1+jSNfQP2Uet5vd1k=;
 b=ndSKPDxGHl91zE5Ky9E4s/awEFliB26Li1MLxXBilyJ2sVb4w7sRjtE6fyaXmy2e1I
 2G+m4JEsRfyOh+Gr3PGvlcy6sFb5LKrdXcEMg3OCJCxktz+qOWyvzWi/iDUCZFil0HgL
 /oKFFnkiX0NVcDjUi6JasE1JPqelZp2fUKsQXO3AYOVtv2ZGiLsWjuzsOYpJZuyiKzyy
 eHiRvao8pM27vFt7gaPrLrB0Dd1o6EO2ZPG6IR3A+wUxfT9BWRYVtLlrnaR/KMO82ixV
 yZL7vzeVrZlBlGwTk4E7/Ng2saj3NLN1nRSro9wAnwBxz9sVbBUHf+4uxMrPeLHsm5kQ
 YQRA==
X-Gm-Message-State: AOAM531w9PxXfyxH4+DBEOGVfcOLUUXZzf0Kh7odv31PAjlSGmyrCoJe
 73G764BpOlCoBieNtAiOtXGr1uu9CGs=
X-Google-Smtp-Source: ABdhPJyjpz84Twmr4qAWMetLWXd+TYlsJqN2GV5jOLzW4wYoPa6mOqgeDzuEvPxTcOCA+eg0CBUqAw==
X-Received: by 2002:a17:90b:38d2:: with SMTP id
 nn18mr3951003pjb.167.1644865061924; 
 Mon, 14 Feb 2022 10:57:41 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id s6sm5363923pfk.86.2022.02.14.10.57.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:57:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 09/16] block/file-posix: Remove a deprecation warning on
 macOS 12
Date: Mon, 14 Feb 2022 19:55:58 +0100
Message-Id: <20220214185605.28087-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

When building on macOS 12 we get:

  block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
      kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
                   ^~~~~~~~~~~~
                   IOMainPort

Replace by IOMainPort, redefining it to IOMasterPort if not available.

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/file-posix.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1f1756e192..13393ad296 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3319,17 +3319,23 @@ BlockDriver bdrv_file = {
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
+
+#if !defined(MAC_OS_VERSION_12_0) \
+    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
+#define IOMainPort IOMasterPort
+#endif
+
 static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
 {
     kern_return_t kernResult = KERN_FAILURE;
-    mach_port_t     masterPort;
+    mach_port_t mainPort;
     CFMutableDictionaryRef  classesToMatch;
     const char *matching_array[] = {kIODVDMediaClass, kIOCDMediaClass};
     char *mediaType = NULL;
 
-    kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
+    kernResult = IOMainPort(MACH_PORT_NULL, &mainPort);
     if ( KERN_SUCCESS != kernResult ) {
-        printf( "IOMasterPort returned %d\n", kernResult );
+        printf("IOMainPort returned %d\n", kernResult);
     }
 
     int index;
@@ -3342,7 +3348,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
         }
         CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
                              kCFBooleanTrue);
-        kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
+        kernResult = IOServiceGetMatchingServices(mainPort, classesToMatch,
                                                   mediaIterator);
         if (kernResult != KERN_SUCCESS) {
             error_report("Note: IOServiceGetMatchingServices returned %d",
-- 
2.34.1


