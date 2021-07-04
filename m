Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE123BADF0
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:09:30 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05cX-0003hK-Jq
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05at-0001BI-0x
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:47 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m05ar-0006xK-GO
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:07:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l1so9765038wme.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98/Ie1aTZTJyFzAqF6gNinSZNMSWK+bxlmDbDSuQA44=;
 b=MrF11BysXhTlODwIjEXgs3sbbN8s16GsWWlkFeZHd6VjGFhkSkoNUHSymu1o7UANs4
 P1PIf480D732OorNeb5HrFgwl2qv8ozYqHTrR/YzXJ2GFEAF7D1nwpKKkQT+RqM0ZekB
 cEPC/5Tix00WUVh3v26OileipfMRTksjhgBz4bAIpk2eexFR5Z1TgxcwoGfw5Lo84R9b
 8nTfCkI3qKTESirCOc9dUiO15ZyMMBUZAoGyZTq2RNgNMjPulbsEix7VQruoWH0nyU2y
 6PM2KTvByRtrjyh1c79AY6RNtMhKT6MQlyVtdT0R3ocGMtPuJkKgZi63yFSG+fEZqGlx
 RTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=98/Ie1aTZTJyFzAqF6gNinSZNMSWK+bxlmDbDSuQA44=;
 b=Udxrty/Nbl1Tx1jTsPh47PUw40IA8B+QuPlRUe7YrpQCys/z3zsozLxOf6Mcjg6ZeD
 BKn7v2/GGwtG7opVEQ7yjHSbtRgXJI3rqUhX0amtNck9qNDBX+HnNiGU5U9DJtla9eXA
 TIdlqGJyES8aroflpqBL+EHkyF2Ia3IlOcAQEb353K3vTtxhV/lSMKl+5Mu+oW6uFRxl
 EDHtVcVVxGRoFzD/tJGwXs2wxtsMgu6tgoU6rrqCZP+G3jE5i5Y89WN832clATNYnfZf
 u+Zo0/JbevfUU9blkecqP1ya7nuXfNJXGzoS63eLBjTaYSwaWRtaoWGNb5jI4OdlO+6/
 l9Ug==
X-Gm-Message-State: AOAM531UpQN5rv7J/uA92zrJpe2ULCWaOve9WbbAnQI+tXd87kigLN3p
 yar0izFXz59Wpi0IxpPBa6uxo1niPIA=
X-Google-Smtp-Source: ABdhPJwTsWBtlrdiBihiqA/+jHE9P9Mgmr00WlJC+4Hn8v+LL9bnpG3+21Ins6phXvpEs+ctKARPyw==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr10299203wml.135.1625418464061; 
 Sun, 04 Jul 2021 10:07:44 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b187sm20979920wmh.32.2021.07.04.10.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 10:07:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/mips: Fix UHI error values
Date: Sun,  4 Jul 2021 19:07:33 +0200
Message-Id: <20210704170736.617895-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704170736.617895-1-f4bug@amsat.org>
References: <20210704170736.617895-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The UHI support was posted *before* [1] the specification was
released, and merged (commit 2c44b19c199) around the same time
[2], using Linux kernel errno values.
Update to use the spec values.

[1] https://lists.gnu.org/archive/html/qemu-devel/2015-02/msg05387.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2015-06/msg05231.html

Fixes: 2c44b19c199 ("target-mips: convert host to MIPS errno values when required")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 77108b0b1a9..3b1939365c4 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -1,6 +1,8 @@
 /*
  * Unified Hosting Interface syscalls.
  *
+ * Specifications: MD01069 Reference Manual (rev 1.1.6, 06 Jul 2015)
+ *
  * Copyright (c) 2015 Imagination Technologies
  *
  * This library is free software; you can redistribute it and/or
@@ -74,14 +76,17 @@ enum UHIOpenFlags {
     UHIOpen_EXCL   = 0x800
 };
 
-/* Errno values taken from asm-mips/errno.h */
+/*
+ * Unified Hosting Interface (rev 1.1.6)
+ * Appendix A. "Error values"
+ */
 static const uint16_t host_to_mips_errno[] = {
-    [ENAMETOOLONG] = 78,
+    [ENAMETOOLONG] = 91,
 #ifdef EOVERFLOW
-    [EOVERFLOW]    = 79,
+    [EOVERFLOW]    = 139,
 #endif
 #ifdef ELOOP
-    [ELOOP]        = 90,
+    [ELOOP]        = 92,
 #endif
 };
 
-- 
2.31.1


