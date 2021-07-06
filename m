Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019523BE00C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:07:01 +0200 (CEST)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v5f-0005bH-TN
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upE-0001ia-5c
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:00 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up5-0006fs-A3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:59 -0400
Received: by mail-pg1-x533.google.com with SMTP id a2so403205pgi.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pS8B9+yNUG9KtrWf2HcmVsU4MbTu2x5l7ztmhUnsA5Q=;
 b=O9IpJhBV0pM2AireE/hhxFlMqc2x2lHT4FFGgy17yDI1SjD5nVzFKR/uj04LCRq9/e
 TkDbZDm3HryeHYseCZ7L5WyW76n18p6Chy4V669QjE7nWJupoUwP0hX7S9CcW81aHSP5
 sqgnI/gefuDU2TKAO4E8HKBeMiC1dFKZtEBIcUNNX9zaHtUnvrkQQRmQzva0ce1nm89H
 bcriXsA9qg36DV62V1eocs9DX45r8x30xsdriYdmPx6T9TWY5sTlhGde7i871J+GWFGT
 waVLxoWwEJblgCa3167t90Uw/tcejIOBDs56htP5xPH7gYm0/JywRB4ft/J5o8E7JdVk
 sVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pS8B9+yNUG9KtrWf2HcmVsU4MbTu2x5l7ztmhUnsA5Q=;
 b=ELCTzw3pnUznC6QS20tPU4PltjD9Qv/hWpSgxgIM4K0gKnFMavp51/ejeRYMc+cgWc
 AkxwO5ADg2hacnuZ8QWuOcefEShjaSibbQFR8eME/oFNPB7qc1hIsjMHZErXp7WcYtG4
 tXZKMWNseMCcpzLwHxnVTAFIXS5PPKZ7m8cgr5erCo/SEGhz42z3PyQcg4ctBbl7c+Ut
 r6Yy7XTANFv7N0Eoz2vyzTHoX5Y8puNmMGDEp7Yo9DMxxoinScFW1WVTAP6RJifdKgVE
 lDTdU32FU7DivLzozvIxyGI+6MfYlnpmCWyETjyIP4lT7beUaWM/agBgaf+8fOo8GDZB
 KE1g==
X-Gm-Message-State: AOAM531HMD/+Z8v0gdTjseAxy84OJvyWy37c9v1o/f6MxMfkJuSyVFVd
 cnKfJgROch+alAvs/raRAGDWwEGwYywXQA==
X-Google-Smtp-Source: ABdhPJxwQ76rclaPwzKUEphr06Pdaog2Ej/H7rsOjYqtIm6Ag3fbT+9IVnd4GVak5dh03Eo6Bm/08w==
X-Received: by 2002:aa7:8244:0:b029:2ec:968d:c1b4 with SMTP id
 e4-20020aa782440000b02902ec968dc1b4mr22362485pfn.32.1625615390052; 
 Tue, 06 Jul 2021 16:49:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/36] linux-user/mips: Tidy install_sigtramp
Date: Tue,  6 Jul 2021 16:49:22 -0700
Message-Id: <20210706234932.356913-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value is constant 0, and unused as well -- change to void.
Drop inline marker.  Change tramp type to uint32_t* for clarity.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/signal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index e6be807a81..7cad7526ea 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -86,10 +86,8 @@ struct target_rt_sigframe {
 };
 
 /* Install trampoline to jump back from signal handler */
-static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
+static void install_sigtramp(uint32_t *tramp, unsigned int syscall)
 {
-    int err = 0;
-
     /*
      * Set up the return code ...
      *
@@ -99,7 +97,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
 
     __put_user(0x24020000 + syscall, tramp + 0);
     __put_user(0x0000000c          , tramp + 1);
-    return err;
 }
 
 static inline void setup_sigcontext(CPUMIPSState *regs,
-- 
2.25.1


