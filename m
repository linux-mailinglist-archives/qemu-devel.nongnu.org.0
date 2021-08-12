Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4823EA66C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 16:20:55 +0200 (CEST)
Received: from localhost ([::1]:59948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEBZl-0006i6-03
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 10:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEBX8-00049N-9B
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:18:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEBX6-0001ch-3W
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 10:18:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id b13so8571298wrs.3
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EQjK41VK3TbAKp+ctrdObwx9eVk6xxyN2+v6LUB96e4=;
 b=LmHGc+aB2zngh2jf6Uvx8IMx5b0FO08QgDUpVvhkmBKnu9U8XhdVfLQW0p4/vwuZ7u
 tDLVkR07O3EWYMIjwQ5SXKYkSxu4npTWvbH+cgWpyAc4Dforc4XRLv/ONdJbbsE4hpJO
 8CB0KIQydcUDcoc5wYmJwniDKhET/CzTsZzX6D8KhbfbS4ukMdu+S+RwOSBUnPF3EeCL
 EK6qPUCLqVhfuQJ0K9jAEGtnFyxGdIJyWism6KI0p+kOB6LW0Aveh+HD7o2eik+MLfy4
 2sSQ7hWcASjXCzc405w0sG7KZx218DT/jo5XknMBpn5aQM6ZNLG51Rd2b5EflOwb9Tjs
 o0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EQjK41VK3TbAKp+ctrdObwx9eVk6xxyN2+v6LUB96e4=;
 b=DczIsnNs4ZlMWJobbUPyQWRcWrOU0jf9FplxgSQcjoTrVTIJ1e6Kf3h+Bdf/eYL4X7
 q/eIaAGtxrzJkhX36U3D31xe9nm3z2qWIsqbTZemHcNMYIztu8U2XPTmUt6+4XJPtFm5
 bqj3HZQ59HSOEFz5+SiOjbmAZtMYJ7ISNeHkLUUrQIEA/aSuqjCcYyY045RDS8iXc6uB
 WRopczJ7oQx52yo1NtF2RJIw4FDqtMDsVwAG3gOef2qTvr0oFu7pqxgwjbvqI7SqG+d9
 Xqwt+kvJCbYuh+HB3EXig1wWdfqpszqTgNk+JAqRa5kdzwPMCfzGZ/r7hiCqkY1hs3eS
 bpVA==
X-Gm-Message-State: AOAM531wuXR/gLhmvb0PK+yOCBDHYxBt04rDBCEpHpSuBjiFKgIQb05T
 kaq6t4LM06+1gq6r7nvi3j+2vPDLN1hYdg==
X-Google-Smtp-Source: ABdhPJx9JGChqude8irUADnx8u3AI1JyyAu300IJoJUjNoxWmwnlicZzMCtnDjYJMBEb9BYVM9iBkQ==
X-Received: by 2002:adf:ea41:: with SMTP id j1mr4294441wrn.147.1628777885438; 
 Thu, 12 Aug 2021 07:18:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o2sm2690606wmq.30.2021.08.12.07.18.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:18:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/core/loader: In gunzip(),
 check index is in range before use, not after
Date: Thu, 12 Aug 2021 15:18:03 +0100
Message-Id: <20210812141803.20913-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The gunzip() function reads various fields from a passed in source
buffer in order to skip a header before passing the actual compressed
data to the zlib inflate() function.  It does check whether the
passed in buffer is too small, but unfortunately it checks that only
after reading bytes from the src buffer, so it could read off the end
of the buffer.

You can see this with valgrind:

 $ printf "%b" '\x1f\x8b' > /tmp/image
 $ valgrind qemu-system-aarch64 -display none -M virt -cpu max -kernel /tmp/image
 [...]
 ==19224== Invalid read of size 1
 ==19224==    at 0x67302E: gunzip (loader.c:558)
 ==19224==    by 0x673907: load_image_gzipped_buffer (loader.c:788)
 ==19224==    by 0xA18032: load_aarch64_image (boot.c:932)
 ==19224==    by 0xA18489: arm_setup_direct_kernel_boot (boot.c:1063)
 ==19224==    by 0xA18D90: arm_load_kernel (boot.c:1317)
 ==19224==    by 0x9F3651: machvirt_init (virt.c:2114)
 ==19224==    by 0x794B7A: machine_run_board_init (machine.c:1272)
 ==19224==    by 0xD5CAD3: qemu_init_board (vl.c:2618)
 ==19224==    by 0xD5CCA6: qmp_x_exit_preconfig (vl.c:2692)
 ==19224==    by 0xD5F32E: qemu_init (vl.c:3713)
 ==19224==    by 0x5ADDB1: main (main.c:49)
 ==19224==  Address 0x3802a873 is 0 bytes after a block of size 3 alloc'd
 ==19224==    at 0x4C31B0F: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
 ==19224==    by 0x61E7657: g_file_get_contents (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.5600.4)
 ==19224==    by 0x673895: load_image_gzipped_buffer (loader.c:771)
 ==19224==    by 0xA18032: load_aarch64_image (boot.c:932)
 ==19224==    by 0xA18489: arm_setup_direct_kernel_boot (boot.c:1063)
 ==19224==    by 0xA18D90: arm_load_kernel (boot.c:1317)
 ==19224==    by 0x9F3651: machvirt_init (virt.c:2114)
 ==19224==    by 0x794B7A: machine_run_board_init (machine.c:1272)
 ==19224==    by 0xD5CAD3: qemu_init_board (vl.c:2618)
 ==19224==    by 0xD5CCA6: qmp_x_exit_preconfig (vl.c:2692)
 ==19224==    by 0xD5F32E: qemu_init (vl.c:3713)
 ==19224==    by 0x5ADDB1: main (main.c:49)

Check that we have enough bytes of data to read the header bytes that
we read before we read them.

Fixes: Coverity 1458997
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/loader.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5b34869a541..c623318b737 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -555,24 +555,35 @@ ssize_t gunzip(void *dst, size_t dstlen, uint8_t *src, size_t srclen)
 
     /* skip header */
     i = 10;
+    if (srclen < 4) {
+        goto toosmall;
+    }
     flags = src[3];
     if (src[2] != DEFLATED || (flags & RESERVED) != 0) {
         puts ("Error: Bad gzipped data\n");
         return -1;
     }
-    if ((flags & EXTRA_FIELD) != 0)
+    if ((flags & EXTRA_FIELD) != 0) {
+        if (srclen < 12) {
+            goto toosmall;
+        }
         i = 12 + src[10] + (src[11] << 8);
-    if ((flags & ORIG_NAME) != 0)
-        while (src[i++] != 0)
-            ;
-    if ((flags & COMMENT) != 0)
-        while (src[i++] != 0)
-            ;
-    if ((flags & HEAD_CRC) != 0)
+    }
+    if ((flags & ORIG_NAME) != 0) {
+        while (i < srclen && src[i++] != 0) {
+            /* do nothing */
+        }
+    }
+    if ((flags & COMMENT) != 0) {
+        while (i < srclen && src[i++] != 0) {
+            /* do nothing */
+        }
+    }
+    if ((flags & HEAD_CRC) != 0) {
         i += 2;
+    }
     if (i >= srclen) {
-        puts ("Error: gunzip out of data in header\n");
-        return -1;
+        goto toosmall;
     }
 
     s.zalloc = zalloc;
@@ -596,6 +607,10 @@ ssize_t gunzip(void *dst, size_t dstlen, uint8_t *src, size_t srclen)
     inflateEnd(&s);
 
     return dstbytes;
+
+toosmall:
+    puts("Error: gunzip out of data in header\n");
+    return -1;
 }
 
 /* Load a U-Boot image.  */
-- 
2.20.1


