Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772824B2AF1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:51:31 +0100 (CET)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZ8r-00034U-Dg
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:51:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYu3-0000SH-NM
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:16 -0500
Received: from [2607:f8b0:4864:20::433] (port=44637
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYu0-0002LS-UU
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:10 -0500
Received: by mail-pf1-x433.google.com with SMTP id y8so14476176pfa.11
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=duNk7CpqdTpjRccxG7H9K/BhFj5mLBpZ76Oa9xRaHs4=;
 b=afGPvYZnTuDM+ORIA+0QVqAbls79lECdpEiVDJg1LU1jheGqDfoKMt3ErDeOKfUVl8
 sR7OwqHZmU8ljng2pwSGZKxUwuwmlPkD1qJOnq/+LOjBMWgiqVs631aKAzKLSizIVzxo
 nLCGTgIs2GCmAAeZAC9WONJORdkTeOqsVYMHLRWizjIi9qmIbeCrT49Fmt90hxT7wMSR
 oTTgtO2Hf7mmyEkHtymdPl3mFXYTe5E8dnYO8n6XsdiUHMjCV5rNli/+ootM7y+ysTJE
 l4cULZVdXywf2gse6/WYsY54FlQWaFNeJpf9zPLua2VXiwqAzGnMu3LGpNnKRoPJYZYE
 JUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=duNk7CpqdTpjRccxG7H9K/BhFj5mLBpZ76Oa9xRaHs4=;
 b=aKa+qXmZcBscUgJj1l475J8R1C0bbFm78LxOxd2Op/NZibOEx66oKV5QwRZULu05Sm
 D9ZNhvSG6uQnqj1gzYe4oyobSOqH4vligkPRLuNnYRk/XzhAUDHVxT+HXJOyZ4r6Wtix
 knZ688NltuWS8FSivjt+0fZvyTqd5ovodyQiRvRPmhyyQ1tvBQuSFmnM1BrqUF6AUB8S
 BuddeTM3uS/QR9QgBOA8QcfmvdKDMhmyn8OvTIoCtsBBBXLG5wAQqrCbVP+K3NnZtzIK
 wFoVZcprwuI5uWj2NszkWRhfthWqaAfVxrpbPce3L/7M8k2uhs44wSzFv87xO3Y85txg
 fANA==
X-Gm-Message-State: AOAM533hUc15u9NKqTFJIxKBzMlX0Tb/Dd5S52U6WBsHPI6WcctWL7IR
 rdnYrFHBnNbWK8KFwFWbN3sena7M9TA=
X-Google-Smtp-Source: ABdhPJxnMPX5KxoIzJUVOhYGsimNKITMIbqSG+hpLYpmlnTOU8m794csnOZrnQ/78QLZdFqYbbigVA==
X-Received: by 2002:a63:5545:: with SMTP id f5mr1988721pgm.157.1644597367247; 
 Fri, 11 Feb 2022 08:36:07 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l12sm29056360pfc.182.2022.02.11.08.36.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:36:06 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 09/13] block/file-posix: Remove a deprecation warning on
 macOS 12
Date: Fri, 11 Feb 2022 17:34:30 +0100
Message-Id: <20220211163434.58423-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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


