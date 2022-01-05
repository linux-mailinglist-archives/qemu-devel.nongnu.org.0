Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FE6485CB3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 00:57:47 +0100 (CET)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5GA6-0004Kl-2o
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 18:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5G8e-0003dz-Dj; Wed, 05 Jan 2022 18:56:16 -0500
Received: from [2a00:1450:4864:20::436] (port=34619
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5G8Z-0007PW-D0; Wed, 05 Jan 2022 18:56:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id h23so1440855wrc.1;
 Wed, 05 Jan 2022 15:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDAd1vBFe4hWcDSW7xvS8jiBEbdnQnlbGBH8BB1Tmfs=;
 b=V+c8OinRWYAjTW6KB+8RdbV512v5LNgHRx0zl+XbEAlJmBwFGO3qPOOSW1ngAeCero
 HcMomX0Ey/p2nXOPzwcdBRAuxpJI7oQaw00BiFZjKNAmDY/QA427vd+FwPziUjVRxZ9L
 EBYUSfvewi8YeLiKxwfomFS6is+3EB8E8qYc8EKweq3arW06R9/+XOniTft5jFWA5rYo
 SJn/IjRV2OSPJjXPSu8T2ZFTGZWOuyspKl1GExX0es+Ll6ZAHPg9PTmL89wgsomDAONz
 TsSjZWntTgNGMjOC0IGiN67UiaXbXUXlpn5t+UGmRRr4gctlmyYYyVrsXo0fGtt8FAcK
 eJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kDAd1vBFe4hWcDSW7xvS8jiBEbdnQnlbGBH8BB1Tmfs=;
 b=KKPRYLcC3ut+/2sBd6Zd62LDEg3Jiwn/8rxay3E4pKdhXK+XPi5xf8JeDReHv5+YFQ
 RZe5UcTdah8Ny7m97evaz47Kj+TEPNmzwD+jndZapIRnSBmm8GyU8Ng5ECjp7ysJ/vSy
 tOMcl716QmfpqBW22isVXvqb0D2JNFGEWtjPC/LcgIPcsZMJ1zvDPJlNu5zwdh3E02xs
 AZZvBhc5gyF8l5ezf92qonvanJhq4Uyz9B/AHj4wUe0i/aWSPd6/hn5Ztm6ypAZeJNcv
 ybkXRcYzbAWraP+EQyK23Tg+ImxPRfd21fRk47Ji5yXjHq36hLF0dwBjlgbSTtfvvDTy
 qNTg==
X-Gm-Message-State: AOAM5307V1BHQoPkMj0Mqmq2PBzvJVplRzcuwof1r3cRPjdyoETxjv46
 ff1rVXlgyygK5zJsJLPzzt4WcSPm6VEFwQ==
X-Google-Smtp-Source: ABdhPJwP5wLUgXGNEEesWLDz5U3tShhLNWYdTYEJV60jgLVFBr1+RzIL/UqUuU4tA8WLVB+sIi8niw==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr50398456wri.541.1641426969292; 
 Wed, 05 Jan 2022 15:56:09 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id ba18sm395903wrb.40.2022.01.05.15.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:56:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] block/file-posix: Remove a deprecation warning on macOS 12
Date: Thu,  6 Jan 2022 00:56:07 +0100
Message-Id: <20220105235607.212848-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Arbuckle <programmingkidx@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building on macOS 12 we get:

  ../block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
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
index b283093e5b..0dcfce1856 100644
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


