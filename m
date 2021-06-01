Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80C39763D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:12:01 +0200 (CEST)
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo63k-0005LO-V0
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tr-0002Tv-5v
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:47 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tb-0002ce-Dc
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:46 -0400
Received: by mail-io1-xd30.google.com with SMTP id v9so15628293ion.11
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fQ1sUn3tVUA0H73iQzaZ5hPqk1opvmQuGcxkF8I6bWo=;
 b=s7wfyaXbHeO4XSJ0NbUsa5Z29/zoVzMtmikgfEIFC/gsLPHC2aqFOWCYBtYA4en3BH
 9W9WUGBqR0Gxya6t9viJT3tcaUF9ovcSPy38x9WVMPR5A7ubVAW3ENgLN2P1iwfiI+aI
 6Zx/okq2JY8kayerDuk51VlFd8jviaSoj5JQfsK+5o1225zF1E04J5azZhEYzHr5kG8G
 fpzU0ifUobv5lN3f8ULaRxdO4lPzQYMQZxGHDL9/ZO+JQon2APY86EVqgrcUmm5UAkiw
 akfNPmGM2MqZr3FFSf80O2H1s4pJMus7qF3CTxBVGv0PRvlvcSLIVMOlyc5KA49g5udK
 48pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fQ1sUn3tVUA0H73iQzaZ5hPqk1opvmQuGcxkF8I6bWo=;
 b=Tup26DOEYinszaKJAketK4xlF7yRsujb2g4qEK47dCzYXtCG/0V0bB68w1Rj8eL/eA
 qPt3Y0yGi6idj2ON0T5MnaDjCpi2aXsDOyclrGRFxw9fah0P4+M2gB2KkB3pEa8+WmFi
 HW5VrUgs2zPka7iP27JkJj3eNsca5IlZ6aSkaZvHa5I0XcZ2/oowDlbiwKN+R8dQwjBV
 7JLRwg3R0adGQK9MJu39HW7Ya3Go6G/Iz/3OOyad4zM0OVzdBAToo69BGp4IdO8mz5tM
 DGLX77SlhP00PpizTShUGdHcaTglEvf+OLIM63GIoxpSEOI53ZCsxsbCrz6wwqt1s3UZ
 J7FA==
X-Gm-Message-State: AOAM530F1cGDd7m1y6PegYF4EQyKUTST/KFAeIlRzMe1qTyl9GG9IShs
 +iviVKR6RIE+3kO0/JC0VIis2OlJo/cakHTs
X-Google-Smtp-Source: ABdhPJzmz903tLzyaDK6WtPznRwEHnwLvCicz+qnBGx6sKCvgErsXp0gfSJCttz/UZO/Ecn6eZclAQ==
X-Received: by 2002:a05:6602:8d0:: with SMTP id
 h16mr21510816ioz.145.1622559688229; 
 Tue, 01 Jun 2021 08:01:28 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/27] tcg/tci: Remove tci_write_reg
Date: Tue,  1 Jun 2021 08:00:53 -0700
Message-Id: <20210601150106.12761-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inline it into its one caller, tci_write_reg64.
Drop the asserts that are redundant with tcg_read_r.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1e9e89458b..7dcf7f9529 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -36,20 +36,11 @@
 
 __thread uintptr_t tci_tb_ptr;
 
-static void
-tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
-{
-    tci_assert(index < TCG_TARGET_NB_REGS);
-    tci_assert(index != TCG_AREG0);
-    tci_assert(index != TCG_REG_CALL_STACK);
-    regs[index] = value;
-}
-
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    tci_write_reg(regs, low_index, value);
-    tci_write_reg(regs, high_index, value >> 32);
+    regs[low_index] = value;
+    regs[high_index] = value >> 32;
 }
 
 /* Create a 64 bit value from two 32 bit values. */
-- 
2.25.1


