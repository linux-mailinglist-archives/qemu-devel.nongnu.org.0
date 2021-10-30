Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A23B440A90
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:23:27 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs4j-0004dw-Ps
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrou-0002fV-Vr
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgros-0004mr-Se
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso6168917wme.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mev2rN/XVuF94j5tb2jzkwFTcZr7GILqfegam3Rooig=;
 b=X4bkxevQp1qVNSLDKijoS5etUK2yO9DbNHQxV+IRn7+tvi4GtL9jITLcxKo/nh8YvF
 nLxTzDFgGjlctynVB0FgXccrKJOyy/amR0VtojyZej6H3rJpBrSEZpVlGjeZnyBbCUZM
 /6enAlhyEPDBu4yEXeu3HKVB/82eWjZOHRbBOMLQ3yxcdFl7qMaZf+Pgn3jGX5fzpK8x
 pzjCnlym9msw7LpAbsVA7JD5+FsuOV92VStaSsznc7cJZnK2Xcp1ijlCBMV7OUBJgQyS
 rMOqTCH5QK9LEzy2Veuyd6L7bpzy4yzElZ529gx+GS5WOeOxUy3yVrtd5+0+XWuyns8x
 IbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mev2rN/XVuF94j5tb2jzkwFTcZr7GILqfegam3Rooig=;
 b=rAkOnbe3NJ0g6FwnXxleRLrAmDT2R1glyzk7Hm8q7tJYHqAfFVZBwNvV75YRSzak9Q
 6NmKZpeSQOe6eON0MhfvVk4v1rMyyqG0CXcRMO9V8HMYw2CzGGlPfrpgDF00F8hWrM1C
 3TapVh5nJHrBWExz+HrWDPA7IvX6BjWx32DQ6PS4Dx4Y4cN/ua5CGHptEct80K38qtzu
 pBpEV4fu1SSx1qooRc4s7gdA4maicZhSqmt6xR4PgtUwF7siYOYP7o2EVS6Dp43SBEAB
 miu5+HtQP4hxWdyM3NI97oMw6bsKhE6ckOWKk8gUp0xRjAztO1IiJCLdb41Ls+EunGG/
 JR2g==
X-Gm-Message-State: AOAM533rHmu6xtwWikiKY4jBXTZNtenayXXH1OdGiyPdmRJEtvH66VWG
 7ifcmtPlIVktvD6DNVgrUYv8i4XtPN8=
X-Google-Smtp-Source: ABdhPJxbGY3ehZMq18vijfDTlE0lfDICWPlYKUq1ZrWEwduyIbB9Ih4PHJz4Uyxxceojuldg+2xIxQ==
X-Received: by 2002:a1c:7ed3:: with SMTP id z202mr8720087wmc.110.1635613620964; 
 Sat, 30 Oct 2021 10:07:00 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i7sm3793802wmb.20.2021.10.30.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] hw/char/sh_serial: Do not abort on invalid access
Date: Sat, 30 Oct 2021 19:05:54 +0200
Message-Id: <20211030170615.2636436-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Replace fprintf with qemu_log_mask LOG_GUEST_ERROR as the intention is
to handle valid accesses in these functions so if we get to these
errors then it's an invalid access. Do not abort as that would allow
the guest to crash QEMU and the practice in other devices is to not do
that just log and ignore the invalid access. While at it also simplify
the complex bit ops to check if a return value was set which can be
done much simpler and clearer.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <6b46045141d6d9cc32e17c223896fa1116384796.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/sh_serial.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 053f45e1a62..2d6ea0042ed 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -31,6 +31,7 @@
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "trace.h"
 
 #define SH_SERIAL_FLAG_TEND (1 << 0)
@@ -195,17 +196,16 @@ static void sh_serial_write(void *opaque, hwaddr offs,
             return;
         }
     }
-
-    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
-            HWADDR_PRIx "\n", offs);
-    abort();
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: unsupported write to 0x%02" HWADDR_PRIx "\n",
+                  __func__, offs);
 }
 
 static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
     sh_serial_state *s = opaque;
-    uint32_t ret = ~0;
+    uint32_t ret = UINT32_MAX;
 
 #if 0
     switch (offs) {
@@ -299,10 +299,11 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
     }
     trace_sh_serial_read(size, offs, ret);
 
-    if (ret & ~((1 << 16) - 1)) {
-        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
-                HWADDR_PRIx "\n", offs);
-        abort();
+    if (ret > UINT16_MAX) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: unsupported read from 0x%02" HWADDR_PRIx "\n",
+                      __func__, offs);
+        ret = 0;
     }
 
     return ret;
-- 
2.31.1


