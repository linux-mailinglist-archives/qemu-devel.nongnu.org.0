Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576E15754C9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:17:56 +0200 (CEST)
Received: from localhost ([::1]:34182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3PO-0004XM-UG
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oC3EP-0006oB-7c
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:06:33 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oC3EN-0006ef-53
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:06:32 -0400
Received: by mail-pl1-x630.google.com with SMTP id w7so1114692ply.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=XxNMsDtWa8Au6uFoFr7AEb7CuySVZYQN3sYNJdCL/8k=;
 b=EIYd0YthS1M3leGOqn4Rai/MosG9BiSuNIfhW+QYEkbzTHs1II2pJXY87+pNu7v6qS
 bptKpjGBzUhDfWLcfBTAvS24ki4WRah9Lm13mxuYIXNWS48L/TeXb7tP/DAz9BViKgSI
 I0/cFaXtH72saGjxb6oM6lT/BQHg+Eks8Mo3BNaBvcZ1KKPNMaezjkB/1hS2x8xmDJF5
 um8kr8nEN719VfFrkF1KrhKml7FDZ6StCR0rjpwWx/TpBpsPaYdYPH1zfUIqHnBbQW6a
 fLaFW/WDsZXQ0pGDWV/C/27fPdPLMPUQMQ4MV+fNsxUK1QGlFzZS6NtJ2LXRSPZNwI7e
 i3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=XxNMsDtWa8Au6uFoFr7AEb7CuySVZYQN3sYNJdCL/8k=;
 b=rgLsqj7iAONt6ZpGN5sYGdk3qmA71nLIiAgTXZYDFnsoZQ34/xRnlRLGs2n83cKKlq
 3tMy3b8vGqhXHxSr8yeYUDqPh1hwlJqAFaJr9ycoPywk+S2BzIQXcMWpYzBNbYdjx69K
 v27pHVqjaXhYiYjAx6wo497bpotW1QPcQ6LAd6eUsDVg1pWX5MhHVigFSD5pP/s8NiAl
 mvmN9YfqnOtbAXpTFInV+QMKuZNbvJPXGrMohTMXie65AgtfKtO6ryMFHd9TMOBONsdO
 037mGBrimKAaTx6s/NKlPsDcXIKqtFipBoojIxrX88xZFyxbMSBaNPM0RDrYFz4TElyP
 12Qw==
X-Gm-Message-State: AJIora/egpKPstWVStZVwwnCsQfOL2TLM1W9K17Ud3HIRtYDYVRHNoyw
 O5xJNA7d+C74FxLn9JLmT+r3PA==
X-Google-Smtp-Source: AGRyM1smn45O2FxWpfGFiobM99ONVYE9ttAI3qMIQXDFmIbpNi8LAivHhW05qdSHzstKcdSZEFIsOQ==
X-Received: by 2002:a17:903:234d:b0:16c:5a7e:f534 with SMTP id
 c13-20020a170903234d00b0016c5a7ef534mr9334283plh.35.1657821989191; 
 Thu, 14 Jul 2022 11:06:29 -0700 (PDT)
Received: from localhost ([50.221.140.186]) by smtp.gmail.com with ESMTPSA id
 y11-20020a17090322cb00b0016c33dc879esm1790939plg.113.2022.07.14.11.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 11:06:28 -0700 (PDT)
Subject: [PATCH] RISC-V: Allow both Zmmul and M
Date: Thu, 14 Jul 2022 11:00:33 -0700
Message-Id: <20220714180033.22385-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We got to talking about how Zmmul and M interact with each other
https://github.com/riscv/riscv-isa-manual/issues/869 , and it turns out
that QEMU's behavior is slightly wrong: having Zmmul and M is a legal
combination, it just means that the multiplication instructions are
supported even when M is disabled at runtime via misa.

This just stops overriding M from Zmmul, with that the other checks for
the multiplication instructions work as per the ISA.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index db2b8e4d30..cab74faaca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -709,11 +709,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             cpu->cfg.ext_ifencei = true;
         }
 
-        if (cpu->cfg.ext_m && cpu->cfg.ext_zmmul) {
-            warn_report("Zmmul will override M");
-            cpu->cfg.ext_m = false;
-        }
-
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
                        "I and E extensions are incompatible");
-- 
2.34.1


