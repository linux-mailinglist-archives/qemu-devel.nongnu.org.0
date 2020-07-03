Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2F213E5D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 19:14:21 +0200 (CEST)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrPGW-00034S-Vh
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 13:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrOxZ-0005fn-4Y
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:54:45 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrOxX-0005oX-Ga
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:54:44 -0400
Received: by mail-wm1-x342.google.com with SMTP id 17so34699455wmo.1
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 09:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6xyMO6sPhGUDnxlfSoi6DiHjZATj8PW0iRsXQiCCoSA=;
 b=MQcTXF+LbtqVm2mbdYE+UIEqgtEldL599kPMzeRlZdPPU+uRjIzhhVJj7SJuJPF/Tk
 rBJC7qO96ZAFioGz38YuKP4fQt90wcUxxhap4z05s/8ym+q+zQKeukgSdOTYil6cgOOq
 v0Ly46GxRotdtPRbhehAX7/OLRgaJjSh/iw69HsP5j4tw+fb+PHC4BNE1ZRXSN2WFroL
 vkVDjWLceD7lH1s9pRsic/lHvNB1kJruZF7+uxQ1/ZSdQWEkFTcy149wWNQl4XZNQZXM
 CINkv4OVfGx1Y3an6xqnLqbkQQHHewBL7S3oeLYHPSm48s5aInRp3WtLMZlWbVWmrQLl
 aShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xyMO6sPhGUDnxlfSoi6DiHjZATj8PW0iRsXQiCCoSA=;
 b=j55VbzjypJSxkGPCzS1UvQjX+pQtCrkjMLlILfnTV07Bek0MScV9FiYxfI6KIgzjMJ
 DKFBA2uZQpeSbwb29SgxL0gqdUQotDwYTpFsWGlsOfuhQA75XAI+3D4XpSKdt+jUUDlx
 zugeobpse2qZBJh+OvbBoUDVdvXiJCsmhZLrSY6qe/IOTWObMJIAhuUSeV4lOkG2n++9
 K/CyonyEhswqkzzcuNJ4AOjuhnHdZOelNO9wpWImABlrDwQLiECcmlBE6CKWK9ypKq8D
 7MWWyFiRTpgqHIyyra6LCozEXhTaJAZkMh1MzcD8MBratHMZhz5ZHRA91/B6kp/AP9At
 tSVA==
X-Gm-Message-State: AOAM531KfpAvLUwl2hTX3TyeyVW4SslBwiA7p8Fa7fH+iEXvFo9A+zQk
 r8Kvwha/14ywfsd9Q52PG0srKQvjZgBPuQ==
X-Google-Smtp-Source: ABdhPJzlDdRB8DvqwcjBs6EG8tB09+oA6m1tbjl0xf8qeCewXRp7kLV9UmqIlbTOwOK2JCmvRHoRDQ==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr36601868wmm.156.1593795281903; 
 Fri, 03 Jul 2020 09:54:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm5574224wrx.69.2020.07.03.09.54.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 09:54:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/34] hw/arm/spitz: Use LOG_GUEST_ERROR for bad guest register
 accesses
Date: Fri,  3 Jul 2020 17:54:01 +0100
Message-Id: <20200703165405.17672-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200703165405.17672-1-peter.maydell@linaro.org>
References: <20200703165405.17672-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Instead of logging guest accesses to invalid register offsets in the
Spitz flash device with zaurus_printf() (which just prints to stderr),
use the usual qemu_log_mask(LOG_GUEST_ERROR,...).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200628142429.17111-15-peter.maydell@linaro.org
---
 hw/arm/spitz.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 6eb46869157..49eae3fce4e 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -23,6 +23,7 @@
 #include "hw/ssi/ssi.h"
 #include "hw/block/flash.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "hw/arm/sharpsl.h"
 #include "ui/console.h"
 #include "hw/audio/wm8750.h"
@@ -65,9 +66,6 @@ typedef struct {
 #define zaurus_printf(format, ...)                              \
     fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
 
-#undef REG_FMT
-#define REG_FMT                         "0x%02lx"
-
 /* Spitz Flash */
 #define FLASH_BASE              0x0c000000
 #define FLASH_ECCLPLB           0x00    /* Line parity 7 - 0 bit */
@@ -137,7 +135,9 @@ static uint64_t sl_read(void *opaque, hwaddr addr, unsigned size)
         return ecc_digest(&s->ecc, nand_getio(s->nand));
 
     default:
-        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sl_read: bad register offset 0x%02" HWADDR_PRIx "\n",
+                      addr);
     }
     return 0;
 }
@@ -168,7 +168,9 @@ static void sl_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        zaurus_printf("Bad register offset " REG_FMT "\n", (unsigned long)addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sl_write: bad register offset 0x%02" HWADDR_PRIx "\n",
+                      addr);
     }
 }
 
-- 
2.20.1


