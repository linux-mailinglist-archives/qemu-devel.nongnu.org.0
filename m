Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E681A399D71
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:09:36 +0200 (CEST)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojM8-0006Z7-0X
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGJ-0004Bh-Ba
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:35 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGH-0000Fq-Uk
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id f5so1221626eds.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aPYdoGgpX0ZUspn+3dr8FCwIyeB5KG9UkLhwzhTVuOg=;
 b=Eq+Fk8yQD30VFL6oOz6NItDgBROJ1Qec+eLXguO1ZdLG8IYAVemLbbY7KePaXUz3D6
 DYffV6lnBh+nvNcvwUrDSY3J1vU2v78nxN3l3zGYARTfMRp1pBYpjBmlFnUJsqzOCd+a
 wxRtYKnVu4xYFx56rp0Fv2EsCLOReU4uvjrmVTAkrEkt114sqoXTovIxqHU42ykcHJaf
 5uMxI5TF3oek6Wj2GuGD/rrAtjuu/2Qp1ZAYQDqhiHzplOoVECq30UpcpHU0cFN0QeRJ
 E15CzZE0BGCDrSy4jvf6Qi/1W4MEVl/UONaMvtl/42KfwbGZwgtCdOc2X0RCnNEPs7h8
 2BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aPYdoGgpX0ZUspn+3dr8FCwIyeB5KG9UkLhwzhTVuOg=;
 b=hbtkRS/glzvYVOKsmcod3zekakOPMnpMRKOlwzgDUI/x3vZb57LplI/MQryW20uPkW
 uESux5auMxqLdezJB9fSkQM6y/6wuBZt+qcu3fajaTCZj+6BureFEdlzwInR0JzIYevb
 DFFAx64IbLVxsE3NYEWA0qtzM3Bqn+3e1RR1Tv4jkx9eJbpkZXEnq2zDQ6kmvfHDMKfv
 3rpF/szDqHzmN3YM6wpwXNF0NrhgsnWoHIfgqd0f/IXCNCtmBAwKRytNLMfpB+qJHFHM
 bVf81jvwdoP6vmM0HcaLAfiP4DU2BY9iKFc6PRnA9UkEk523mLTdyvGl7kP0lIgzjJau
 DAwg==
X-Gm-Message-State: AOAM5326x9YXQNKht+XSaTPAsDqwCpjvQd5F572Zc/S5GXkWkI4Ms0/9
 is1Ir4SgbGv7O/rMWtLmy7X/wl7tMKBEXg==
X-Google-Smtp-Source: ABdhPJyQ2hSmNBO3nLzxUeH0kAaoNbgrHsqjdXf7LNBgWW93RAUmxRyOG2Z+7aPismMUQRhGmaS/zw==
X-Received: by 2002:a05:6402:44:: with SMTP id
 f4mr43212973edu.364.1622711012437; 
 Thu, 03 Jun 2021 02:03:32 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id f26sm1420082edu.31.2021.06.03.02.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:03:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/microblaze: Fix Exception Status Register 'Cause'
 definitions
Date: Thu,  3 Jun 2021 11:03:08 +0200
Message-Id: <20210603090310.2749892-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210603090310.2749892-1-f4bug@amsat.org>
References: <20210603090310.2749892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See 'MicroBlaze Processor Reference Guide' UG081 (v9.0),
Table 1-11: "Exception Status Register (ESR)".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/cpu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a7551..42b9ad8d313 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -95,10 +95,10 @@ typedef struct CPUMBState CPUMBState;
 #define          ESR_EC_FPU             6
 #define          ESR_EC_PRIVINSN        7
 #define          ESR_EC_STACKPROT       7  /* Same as PRIVINSN.  */
-#define          ESR_EC_DATA_STORAGE    8
-#define          ESR_EC_INSN_STORAGE    9
-#define          ESR_EC_DATA_TLB        10
-#define          ESR_EC_INSN_TLB        11
+#define          ESR_EC_DATA_STORAGE    16
+#define          ESR_EC_INSN_STORAGE    17
+#define          ESR_EC_DATA_TLB        18
+#define          ESR_EC_INSN_TLB        19
 #define          ESR_EC_MASK            31
 
 /* Floating Point Status Register (FSR) Bits */
-- 
2.26.3


