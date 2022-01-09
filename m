Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55076488AE8
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:19:22 +0100 (CET)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bqj-0000hf-6P
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6beO-000627-3k; Sun, 09 Jan 2022 12:06:36 -0500
Received: from [2a00:1450:4864:20::432] (port=41753
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6beK-0005Sa-Nd; Sun, 09 Jan 2022 12:06:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id v6so22264556wra.8;
 Sun, 09 Jan 2022 09:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvizcPyJXRDbEKDoEF6OUp8KHuw0PdyJuPEvaqkkl0w=;
 b=NF2J5CS8tMT/4FV2D7ftDYZ1zq7tC7rhNMiEDItdYizUf6tLrE5i8dHR/IEW2h1Fpd
 orClXpxntdS5Bg/MwmMJeS8XPmD0DsNJTeWIngO7umjBOpfvLb+HWcafiD3KJUQld/uc
 4rd2zBxb81Svg5KKeCSwXk4AjU5U7s0fb49hcmyUBVfss8MQRF/sSBCHdnhOYaQ7mHa7
 WAAlRsisrUFMy0G6IvDXoRRAg7xGwggPBnErpGNM7rw9o9CtObkKZ1mBAWRHdCPKmg98
 yhg6k31Ry8tfT6Hm4xDNX4mbtrk6haSNp7quagaPwQLS8pyrbAfAbiQGzVyiO07Bnnqj
 B30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BvizcPyJXRDbEKDoEF6OUp8KHuw0PdyJuPEvaqkkl0w=;
 b=ry/SbA3SNMRJzKJL2c/S+vOAE2vK6uCpXCudQS1DE+WMSzhk++q8e8tsXVbexAkbtH
 WCABlsTG93JBEaXE5ppw4QO3eiRc/8L9aQFtYaMaETm/ofnzYn0bcR8QPlfYrvUrycQp
 Earl4+F1h8ZzJ5/tT2sgXlW+m96ZmGsXsnPUT3pVAYHsdEIIdudJpCyZ95mZ1+BER4HU
 qP8kC53/Jm1nw1gzZDo3fwn1Pm+BWPpCqdbCIqvSJJyersm65+ep5Abtu72IP0G4rRpS
 gzrXgPVIjIwr/ihonJ9B5lWotDRbKL13BjvhfaYGLGuHvRX6etBHFyei7AmJJEltmFQ9
 tZTw==
X-Gm-Message-State: AOAM530+YVazbpFjx4luaGCeSiTK7pdMFMSLJzD4/0WbK1jyZI7psAeg
 jfAxnSAA5Jh/oNpWT/TEMNWzi6KHUhHmTw==
X-Google-Smtp-Source: ABdhPJyLZ2Td9pOahE6az/xtHZzw6Xny9POl4vIAP3RHWjBG6tIJheA4AC92E2LQId3F0xwMrmZxbQ==
X-Received: by 2002:adf:fbcd:: with SMTP id d13mr50694610wrs.170.1641747989256; 
 Sun, 09 Jan 2022 09:06:29 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id u11sm4677994wmq.2.2022.01.09.09.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:06:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/6] block/file-posix: Remove a deprecation warning on
 macOS 12
Date: Sun,  9 Jan 2022 18:06:09 +0100
Message-Id: <20220109170612.574104-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109170612.574104-1-f4bug@amsat.org>
References: <20220109170612.574104-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building on macOS 12 we get:

  block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
      kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
                   ^~~~~~~~~~~~
                   IOMainPort

Use IOMainPort (define it to IOMasterPort on macOS < 12),
and replace 'master' by 'main' in a variable name.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/file-posix.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b283093e5b7..0dcfce18560 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3324,17 +3324,22 @@ BlockDriver bdrv_file = {
 #if defined(__APPLE__) && defined(__MACH__)
 static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
                                 CFIndex maxPathSize, int flags);
+
+#if !defined(MAC_OS_VERSION_12_0)
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
@@ -3347,7 +3352,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
         }
         CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
                              kCFBooleanTrue);
-        kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
+        kernResult = IOServiceGetMatchingServices(mainPort, classesToMatch,
                                                   mediaIterator);
         if (kernResult != KERN_SUCCESS) {
             error_report("Note: IOServiceGetMatchingServices returned %d",
-- 
2.33.1


