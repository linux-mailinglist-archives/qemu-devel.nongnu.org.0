Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A5B4CEE72
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:25:20 +0100 (CET)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Fb-0004jO-OI
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:25:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR097-0006tX-My; Sun, 06 Mar 2022 18:18:37 -0500
Received: from [2a00:1450:4864:20::42f] (port=38685
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR095-0007My-1N; Sun, 06 Mar 2022 18:18:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t11so20677359wrm.5;
 Sun, 06 Mar 2022 15:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yCfDKLgC3DDY0V5rToqGFhbzD2NJTXWfNnXPl2aTeQI=;
 b=hcX0+jnT9e9NfCm5ZnEUMw32XA8NQAn0hexNIh7Sox3qdy7eN9MlftyNVCrJ2LaaZ7
 aRXaCE9I9uURp8H6XaFH4zSLpzufBtuumojozY7YdLnX5Gd0MdYjm0e7dzOP1QL4ZnMH
 5yh1VKXtWSpoOLWeYLZb1x/xFMxTC1ICf1agO9iy7T9ANYWnmw+ZV3AzxAdFuWmNiSbQ
 /kCcXC/e18m6qoPx4tmDbxN0bZQp8+wmj6IriN3HYY4lJrVS9OZRRCZDGdDlS32hEiw4
 qMqfKYaVwHD/c2fRjItcNlHfnszRVMuekP/9UO7yY5Vv4oV37s9IsRd6Vx3FcvCUoHAE
 PRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yCfDKLgC3DDY0V5rToqGFhbzD2NJTXWfNnXPl2aTeQI=;
 b=WgWQsO4eNwZA4MS0R8KaaFnamAXhwk39N7P6UudAV+54h3O9ArpPxXE90jRCTZu0k1
 KyC/fmoXFwZ4Ej7lVAdvu4Tyt2utI05vCFg5aC4hTwt5O7DDvvQS8P/++Qwz2HD6p5D6
 vuQDOWubNaqcKMXGi6IsYo0Hyng5t3PV7Sn/ULZpZXP4+rhGFxWsAUpB1RgaVfT75IzC
 Knbq2fsoXLc5BJhxogHDjF4JpdzVOkuzc+mdtsk/ucuZUxH+wDhcZiC6rmLTxAUnbPD/
 jew+qg4e2CDgKuNhRQO0jH08MSj27PTTRwRydS8J9DNaHT9veajuqBl0y5kqSx1BaYi5
 aAWA==
X-Gm-Message-State: AOAM533RedE66y/+RZc7kc/WpLeW1ivjKkCQrjQorxnuu+FscIOiBaah
 CYh3rnm+KighC3vNUHNgIK0Q6khtOmY=
X-Google-Smtp-Source: ABdhPJwcY8oU2TK5zTMKokheyQ6WmSgA2lzyHs4g/iaztjCYgFLaSpi8GyKhYXr1om6Wu616/1IBUA==
X-Received: by 2002:a5d:628d:0:b0:1f1:d81d:c954 with SMTP id
 k13-20020a5d628d000000b001f1d81dc954mr6231165wru.273.1646608712929; 
 Sun, 06 Mar 2022 15:18:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056000170400b001f1fefa429bsm165198wrc.8.2022.03.06.15.18.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/22] block/file-posix: Remove a deprecation warning on
 macOS 12
Date: Mon,  7 Mar 2022 00:17:38 +0100
Message-Id: <20220306231753.50277-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building on macOS 12 we get:

  block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
      kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
                   ^~~~~~~~~~~~
                   IOMainPort

Replace by IOMainPort, redefining it to IOMasterPort if not available.

Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed by: Cameron Esfahani <dirty@apple.com>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
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


