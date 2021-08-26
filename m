Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CC3F8D27
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:36:41 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJIu-0003Lf-Oi
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImx-00062l-Bn
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImt-0008VM-Hm
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:39 -0400
Received: by mail-wm1-x333.google.com with SMTP id g138so2240677wmg.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EuexV4o32sG9HqBah+72XnHnmYlbBGMXodWVIYM5Po4=;
 b=zvvdKr1iGjm25ZC+Yy1VcxVU0K/5BZWhtvdbMUnWF1u4y4j2r+tPtuZOSG9ghrvaOj
 cHlNWBTHwN2sP2HI+I4HIdW02JSn2ST11pB8F4Na3XBcSs8lEVp4Vgdgcl9X4JDHT9qG
 wuAWHrF1tmxQMa0SapxprWqooLhTHCM3sv1eMp5J87MGYVRT36y63VXme1Yo+B6mglbo
 +NavK8EpJkAYtCVIMP1Q4Um+pnL9cWxp7IN8ekYb4838dRLLBlb2ivkGCbMc3NRyNVGX
 UAdVoYrPYt0Pw7AuvY01cWUijm74cHuT3cfGUQcqy0a2k7+trDrpqtADyZTs0TjXHNdY
 SC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuexV4o32sG9HqBah+72XnHnmYlbBGMXodWVIYM5Po4=;
 b=Nal65O5EzDj9++vhIu2/PrF47lFdNQPNg3RT6XvyEXnKYfCcFKOXpjDxwrP+mvapnP
 y/J1BsG670TVA2BW4BM2T0EGOQVZBlFdU92dhxUtHZ21XbAvh1wOUeXttOmOy27/rCah
 Fg18BoeClAAu0UDSB+k3Vx+jUhcYiIinPRgY/npSnlDD7108WrV9EC5fmEci398eQy5r
 6mLI5qNwF1PmjSN1xGaIGSjfJN2+5DFvamnBYHYenjlLZ1ozOfHSrzHKyctq9FX2VmQZ
 Mqjb1KsTX628zfTQ5vZbFjAt5leAh8WPEVfAh/+bt28uirCuO0Qa/6LGZuxD755/g0zR
 75Mw==
X-Gm-Message-State: AOAM5337kd6puGOTaaiHp7CZnDiCkEUhYEj/C3/8a39Dz9HuUtGMidi9
 f1AojPU9Twc78bRMZSDI8TByMUsoNBSFxA==
X-Google-Smtp-Source: ABdhPJzb4TN3FzYh8/IBT3jMdlK5V+nF28qJI5Kx2BkfHeHehI9o60TM0WydFEd/XOq0eCV2f+SBBg==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr15589532wma.42.1629997414186; 
 Thu, 26 Aug 2021 10:03:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/37] hw/core/loader: In gunzip(),
 check index is in range before use, not after
Date: Thu, 26 Aug 2021 18:02:53 +0100
Message-Id: <20210826170307.27733-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210812141803.20913-1-peter.maydell@linaro.org
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


