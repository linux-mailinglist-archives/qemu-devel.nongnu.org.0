Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E13564A13
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 23:37:08 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87H9-0000Yj-Ja
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 17:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879U-0004N6-7j
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:12 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879S-0006Ny-N0
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:29:11 -0400
Received: by mail-pg1-x533.google.com with SMTP id bh13so1337773pgb.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 14:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJGaTiX/BLUER+4e6y/h+nDbaqosvJUwqSAtFT+vVk0=;
 b=aG83zP5QRndcmXGzy6NtCswGy5+CVYuR7xtKGKwdXGnRjKK69fjxe2RBr0wa6GwxJz
 Bq+ABRZDi3bXs138PmDcbuqNvYYg3vX+NHtTKj3cb9hvyI+xJaVjCxdk2Sv7wShOaY+q
 pyTHlZH1RexXwK527m/1LiTDS5JSvBAmB3J2e0pw9jOqJa5btipLjOEDoziJy2sHfcxB
 LvqUxpBDKVXLsLN0HcyJpbpXfl18gAUWk6G0IfmULfX+tNNk2dMKSbiEzGPC9gkQxpo4
 6ARt51sUf7r2QdrDWKn08SFacU5zuwmyUIcZ+swHRi1uyRbOuftbm+kdqIgcsdqR7zj8
 1YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJGaTiX/BLUER+4e6y/h+nDbaqosvJUwqSAtFT+vVk0=;
 b=cBu4zNCGF0ghhphuJBvIeGpAAoP4Bp/Ei41T1fgkCRedTmaP091GLTEyXX5pMpvCgm
 xF7m6Jt4IfMBwLvjsHVaBOYCTHspkVTrrcur56q2JoZk9SQX3uaKjMHtv/xGGO4qPGf1
 K2r74tCT54uBZwmrvuhgXMU87OXy8zotnxXkw+7cpbbtSOlBGE+lkAMFet2be5J7vCaI
 AnDlJ+bxSOvN5TFRBf3HzMBs+6MPPi6BrvxXm1maUR7XHIIVQjjAT8e4SBDRCab4r+5N
 +YrnVvo9sDxWnfLwsMCOGokoLTETldPk0aFVp4lja0pWWxk/gnQiRrNINIQ3FptJ7usC
 NcSg==
X-Gm-Message-State: AJIora+n7kCjXXK0BaaMTy1dnNtzzK3LMfj9R0v2ORvHVXnUjqDPf+Q7
 ciaAyvN04JL+QnxRgEIqwVRuzLREBjI=
X-Google-Smtp-Source: AGRyM1tPl4bc4BIMVpPPbZZXnvM3liTPJmo88w4IS10HD5n/x/GTAc4+G5xZp2MGJDCj516I4G5LOQ==
X-Received: by 2002:aa7:861a:0:b0:528:3f68:553 with SMTP id
 p26-20020aa7861a000000b005283f680553mr12554900pfn.9.1656883749146; 
 Sun, 03 Jul 2022 14:29:09 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a17090a948600b001ef8264bc1fsm1604447pjo.14.2022.07.03.14.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:29:08 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 10/11] hw/openrisc: virt: pass random seed to fdt
Date: Mon,  4 Jul 2022 06:28:22 +0900
Message-Id: <20220703212823.10067-11-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703212823.10067-1-shorne@gmail.com>
References: <20220703212823.10067-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc2.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index f1d1293eeb..a301d0d769 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
@@ -130,6 +131,7 @@ static void openrisc_create_fdt(OR1KVirtState *state,
     void *fdt;
     int cpu;
     char *nodename;
+    uint8_t rng_seed[32];
 
     fdt = state->fdt = create_device_tree(&state->fdt_size);
     if (!fdt) {
@@ -186,6 +188,10 @@ static void openrisc_create_fdt(OR1KVirtState *state,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 
+    /* Pass seed to RNG. */
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     /* Create aliases node for use by devices. */
     qemu_fdt_add_subnode(fdt, "/aliases");
 }
-- 
2.36.1


