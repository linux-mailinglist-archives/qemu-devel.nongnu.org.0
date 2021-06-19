Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7483ADB43
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:22:34 +0200 (CEST)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufc1-0006lN-3w
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUl-0000ky-E9
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:03 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUj-0002HG-O1
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:03 -0400
Received: by mail-pl1-x630.google.com with SMTP id x10so6336592plg.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5QdQmSf+pzajUTai4DfkX1iSEONbc6XyiW6SAwFXLCc=;
 b=y9wnx1SpSiLtUXrd+yFyqLRIIR4pfhoC5cxnunWpKSwlHD1An7RwsM4UuD4fEPtgKv
 UbiZMfHE21zTfuX1er9PoacW/8LEiex+gjny5LYeIXriOhA1AGzcd5EcvOOWGY+xikBd
 CYA25rAPmqCHrQhUZxbBAnYjuCV2nZs+O4lmUIydNu3W+rhiNln+u3PmrcDkJCT1OuX/
 KfdWi6hu5TtyymA9Y0EWNrCHP3LWFQnL2rS/xm6svamNbdBKokItCus4ceaoLFrDM++R
 fPDCNIJZlwM6nB+DY5Fad/eS/7LxxYW9gVLIFS6dke2pidUx7Lgaqov1kzSupj+EmqMj
 OnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5QdQmSf+pzajUTai4DfkX1iSEONbc6XyiW6SAwFXLCc=;
 b=Bm0h11MvSMan+ODz1Ru048U3bTBbGLsMdzSsnV+aCyxdzn9muXk812WhR1xj4WG/LM
 Rqm7kJfc8qac+gJH8ov6c2UfyhUZpJTaHTSZZF0CI5MQY7DNIWnBTx/fcpcaNWuBYjQO
 Y/898aKz+FMUc+6RM5eY9q23FDaVIjburWpEksmfHO9W+owEOEPf3KUOC5W7VCzVElt2
 n1Zvih2WMwamLsrBdEwuu6cjvKZoXTpnLrn32X42cFiBMeGohZjIeygujI6h/XeK8P0Y
 wHrgGzRyOJlHK82EHyblA7JOKNczNFJB+JrTNv8u0so1OJSH8fXtcMK4zYVEqxS9wG+0
 6iPA==
X-Gm-Message-State: AOAM533lTICrFW3RyuwXD3pkhHwf2WmdTtqG7rOb5pgicZk10nvzTk1l
 3tW4dNm898nt43GmlfTayLqHhSO2+qgi+g==
X-Google-Smtp-Source: ABdhPJyedFsTdJbAgSg+chnMABFvhNq3Nka6vmSNGmc2cusCUHIJvAm1Xpdyr2aDSeLaVpUo24dImQ==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr17623456pjq.179.1624126500372; 
 Sat, 19 Jun 2021 11:15:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] tcg/tci: Reserve r13 for a temporary
Date: Sat, 19 Jun 2021 11:14:31 -0700
Message-Id: <20210619181452.877683-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to adjust the offset range on host memory ops,
and the format of branches.  Both will require a temporary.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 1 +
 tcg/tci/tcg-target.c.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index f2e5cba539..80cafb7d18 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -156,6 +156,7 @@ typedef enum {
     TCG_REG_R14,
     TCG_REG_R15,
 
+    TCG_REG_TMP = TCG_REG_R13,
     TCG_AREG0 = TCG_REG_R14,
     TCG_REG_CALL_STACK = TCG_REG_R15,
 } TCGReg;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index fa3de99445..5269a788a3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -820,6 +820,7 @@ static void tcg_target_init(TCGContext *s)
         MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
 
     /* The call arguments come first, followed by the temp storage. */
-- 
2.25.1


