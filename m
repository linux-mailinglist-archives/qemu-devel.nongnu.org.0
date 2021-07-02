Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184333BA194
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:48:20 +0200 (CEST)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJWl-0001MX-4F
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMZ-00054o-JN
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMX-0004Nb-IT
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id w13so6691180wmc.3
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klbhgHqkEpwdq3x6lzv467uqizGi7EOdKnPiTzMYnoA=;
 b=fKW8Btz5Jm2yAjNqi2d5bA9i0htbw1BJU17Q9h9u4cIP9/xxUJ532mxPFA8XwV/mcF
 o7uneAmOs5EMt/S55N+Lt78ICod/wggEmXnY32fMsw/2yW+hNbbBpY8+WDunazRXw258
 7Ux3Z8h2YJkO9YOvQDXvmCdaeoPcsKEPCOEwga96jiWMOYSqn5czjx2c0oNzt+QZtAUt
 9SCUmR+OWUyy1R4iDTBhxZcixaqP5MSrs/Tohh/L8K4OVgGeSuYAbdAfty+MRO9ORo3C
 xy1eIKPdss7Tm6nKY8Y5pVk/ODWqe+nfBL6dKjJFNsIUL6DfZo9Dl5ChPEfs71trEepf
 89qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=klbhgHqkEpwdq3x6lzv467uqizGi7EOdKnPiTzMYnoA=;
 b=U0aqq8Lbqz6HHntsLfbCUhMtk9r8ccL4Z2OgygcvXbitIckKyDkjcww446ERddVzn9
 ZxjRuvCP9/uEKVIdD0VEqdXFxs1E7tNUad6ppnSJVMgxwJisNJD3OaXkO/VdIAMYZ0Sf
 1iHa6aL5jyMus4w544pcupGnHlMnesjA49WIiw8Oa4EvTnFSDgCTVmOzZ5nO3uEbQJ3r
 VruUCfqfIJD6kUwRsXBOn3DrC6Pr2/t3dSz1jrTtQW1gm2AcjxHfxZ8edLQ88zTqqEQ7
 oEaslIJfPR/t/Bojw5JMFA83Px9P6mwqP9kHZwTvFJo9diB7i7tzeBBkYxgokfX9FQIW
 jnxQ==
X-Gm-Message-State: AOAM530SAJLUqurko7/SnEefUHZmxVYZOOl0YdZiObcPTClW+tkYnWRW
 /EATmBd/dHkVIffiOzxKiuuhQK0s00f5AhuS
X-Google-Smtp-Source: ABdhPJwZjJ++YQ1VTLOz+3qdKA9Qa2FADOBmGKy7C2PXwTwLuV5Nf4L92b7p2/mfTj1aogQshl7F/g==
X-Received: by 2002:a7b:c248:: with SMTP id b8mr17310372wmj.115.1625233063983; 
 Fri, 02 Jul 2021 06:37:43 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id l20sm3256961wmq.3.2021.07.02.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:37:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/18] hw/mips/jazz: Map the UART devices unconditionally
Date: Fri,  2 Jul 2021 15:35:57 +0200
Message-Id: <20210702133557.60317-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the Magnum ARC firmware we can see accesses to the
UART1 being rejected, because the device is not mapped:

  $ qemu-system-mips64el -M magnum -d guest_errors,unimp -bios NTPROM.RAW
  Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007001, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007002, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007003, size 1, region '(null)', reason: rejected
  Invalid access at addr 0x80007004, size 1, region '(null)', reason: rejected

Since both UARTs are present (soldered on the board) regardless
of whether there are character devices connected, map them
unconditionally.

(This code pre-dated commit 12051d82f004 which made it safe to pass
NULL in as a chardev to serial devices.)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210629053704.2584504-1-f4bug@amsat.org>
---
 hw/mips/jazz.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index ee1789183eb..d6183e18821 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -361,16 +361,12 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0x80005000, i8042);
 
     /* Serial ports */
-    if (serial_hd(0)) {
-        serial_mm_init(address_space, 0x80006000, 0,
-                       qdev_get_gpio_in(rc4030, 8), 8000000 / 16,
-                       serial_hd(0), DEVICE_NATIVE_ENDIAN);
-    }
-    if (serial_hd(1)) {
-        serial_mm_init(address_space, 0x80007000, 0,
-                       qdev_get_gpio_in(rc4030, 9), 8000000 / 16,
-                       serial_hd(1), DEVICE_NATIVE_ENDIAN);
-    }
+    serial_mm_init(address_space, 0x80006000, 0,
+                   qdev_get_gpio_in(rc4030, 8), 8000000 / 16,
+                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+    serial_mm_init(address_space, 0x80007000, 0,
+                   qdev_get_gpio_in(rc4030, 9), 8000000 / 16,
+                   serial_hd(1), DEVICE_NATIVE_ENDIAN);
 
     /* Parallel port */
     if (parallel_hds[0])
-- 
2.31.1


