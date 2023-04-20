Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48636E8EE8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:05:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAB-0000Zb-V6; Thu, 20 Apr 2023 06:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA1-0000X8-TM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:06 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppR9y-0003eI-PN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:05 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f0a0c4e505so3518715e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985100; x=1684577100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oMEpsYca7tx1v9ldNloh95tUqbg4QvdTa03d2PGTKsg=;
 b=ZfhykoFeTVkJsSsQtP2tjDjBxir0g+n6ESeEPorIG8rXgFbG8Rd05Jup+wm+MMSFP5
 jXWEekeB1/c08Tryq6Il0Y0oHhkC8omjpd345FUO6H/9UZBy+/MaDLDZ1EwVk4twfMFF
 lXmoSctVdFOokjtM3IS63ICpfzVKGG2e95cx3/UrJKa97sDbE0JWE1NBKnYgb8OHn/Wi
 NWzrvg/PuuG0FqfAU7eDfFGlk094Tu2Ccl07DzvV1nD+H42MgZRJYo3tnER5Bx9YuhfH
 k2IEF8QraW6XK3jllcNKCOxh2kol6Pg5FitF3ha5xCRMhz6rLhoxxphxgxD48N2u54JG
 cIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985100; x=1684577100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMEpsYca7tx1v9ldNloh95tUqbg4QvdTa03d2PGTKsg=;
 b=HgR6qmhNkI1J5jGunhghsfSu2m8PRCqVNU4f8n7nniK/GKNfO2lzdD+2t5NGdmTqPH
 2SyIIWvezfHevtt9dyLlIm7XXPNfUnby3yJPSLfTmAvI85J9dFUPZwRYEc/+/NxaAvEW
 ff93z7UxVVrmsh4h8KFRUzqP83jqjcch1wFZK8cIs0EFYSlZzso/fYv0blSq2XxbFIqC
 08QfXRam8GD5rgbHksjJs53lYPVCW+jl42zHz23oTB/t+vkTL7Nen38d56JI+VnhWyPE
 g0ki/u47x4Ksrtj4l+PvskkDLudASXLHoy3i+V05Jb/5YYxKgsWCrZ/UYKIXxlqcwE0V
 NzUA==
X-Gm-Message-State: AAQBX9c2RAJ+UW21oD/LPQAesAn8B+GgxS6X3YHbZkOoizpviGUnq/I5
 5pYJ1uOJ0XUEYZXfIWNmFaUNADFWeA1vusydlcY=
X-Google-Smtp-Source: AKy350aYeDZt0/rHYpIhTo+V77d9oWAaTfhGi0XPcsHQtdI4fpsE3Viu4woTWDWsk0uyIlsagZOh8w==
X-Received: by 2002:a5d:5511:0:b0:2f9:fc06:9fcc with SMTP id
 b17-20020a5d5511000000b002f9fc069fccmr854448wrv.44.1681985100443; 
 Thu, 20 Apr 2023 03:05:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] exynos: Fix out-of-bounds access in
 exynos4210_gcomp_find debug printf
Date: Thu, 20 Apr 2023 11:04:37 +0100
Message-Id: <20230420100456.944969-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Feng Jiang <jiangfeng@kylinos.cn>

One of the debug printfs in exynos4210_gcomp_find() will
access outside the 's->g_timer.reg.comp[]' array if there
was no active comparator and 'res' is -1. Add a conditional
to avoid this.

This doesn't happen in normal use because the debug printfs
are by default not compiled in.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
Message-id: 20230404074506.112615-1-jiangfeng@kylinos.cn
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: Adjusted commit message to clarify that the overrun
only happens if you've enabled debug printfs]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index c17b247da34..446bbd2b96c 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -480,11 +480,14 @@ static int32_t exynos4210_gcomp_find(Exynos4210MCTState *s)
         res = min_comp_i;
     }
 
-    DPRINTF("found comparator %d: comp 0x%llx distance 0x%llx, gfrc 0x%llx\n",
-            res,
-            s->g_timer.reg.comp[res],
-            distance_min,
-            gfrc);
+    if (res >= 0) {
+        DPRINTF("found comparator %d: "
+                "comp 0x%llx distance 0x%llx, gfrc 0x%llx\n",
+                res,
+                s->g_timer.reg.comp[res],
+                distance_min,
+                gfrc);
+    }
 
     return res;
 }
-- 
2.34.1


