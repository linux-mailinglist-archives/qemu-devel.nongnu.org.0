Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B2585607
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 22:21:29 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHWU3-0007ko-1l
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 16:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHWSa-0006KJ-7J
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 16:19:48 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHWSY-0000uh-FD
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 16:19:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so6278091pjk.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 13:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4zsFjeVNvSssFq2PWLVJ0hCyL/+ucnozqARvXFPbMrM=;
 b=KPYc4QfnU/8fpkMY27evSFOaP76JSWpjjHUidKVeYG2byR6ldj6osKQoTdH2Gq8+mG
 ljXBDMBQi/rUJ8gFtVbb9F3jkDR2RV8rREBBOXUOcDI0q0D5pm21yFWqtsri9u0zLTIl
 QfazBUoZBJCWA9f3H5emskDpOK+yUMS4S41VL++zb3/PUvqeoAEI8gxaFrhJEEm53fEF
 jZNrg4RR+UADtl+Wh94Ti/KiZf6xv4WyQOi8gWl8+Me9zMKStv3Wd9vPY8r/Vysy14Ec
 irbhXYEoRy2EL3WV/+jG/dKcXUA1+zxMUD4wMOxn8Lr/n55DPxYQegu+iL6Cu1CpFQ21
 I57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4zsFjeVNvSssFq2PWLVJ0hCyL/+ucnozqARvXFPbMrM=;
 b=KuyREd7J0Q1TKrB1qgWVJ+7ktblMO2ok+XzANdiuXxtGRLS9Ff6QWnXcwZC9zSy7zk
 AJyf3z4u5UXU/CnKYC57eqyMJKlzJTGWDJi2A3481IhzUwJ4CRCaDsJSBbqNYqbUwKeo
 AyZ5dncvRsA/RvjrEGR7NwFiqSZsVV52F2BtPX6g2jKBPcTom7vMO6g7jbu2Lx5cm0II
 OlX02ES1gd/2HUGG1uQt+gWpd8xIlZ5lVklMEnVPPWgY5+IrLppU2ekZklg1b/hShPWe
 ifDKifXD+9zycaWFj7ZkfARqwIWP0ok1f35i3QuN2NGMLK5MCpMFQ9B9Aln3rLWJbUQJ
 VZiQ==
X-Gm-Message-State: ACgBeo13qDXsV7Tf5tFZEodyXvHCGBEC5JeyXZCKNU3FzbkgkSGybw8S
 OB3iesDFIcg05SdeDbVwx3nxPBPZLJcu9w==
X-Google-Smtp-Source: AA6agR7AyznyMuQlPGTS1wg8YUq2Yea7feyUqpuhNNh9KWitJs7ywv2EqoSoCQAz6+cINxGctDXkqg==
X-Received: by 2002:a17:90b:a46:b0:1f2:f7fb:3ed7 with SMTP id
 gw6-20020a17090b0a4600b001f2f7fb3ed7mr6743360pjb.244.1659125984660; 
 Fri, 29 Jul 2022 13:19:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 r12-20020aa79ecc000000b0052ba82df682sm3321121pfq.102.2022.07.29.13.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 13:19:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH for-7.1?] linux-user/riscv: Align signal frame to 16 bytes
Date: Fri, 29 Jul 2022 13:19:42 -0700
Message-Id: <20220729201942.30738-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the kernel's alignment, as we already noted.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1093
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/signal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 296e39fbf0..eaa168199a 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -64,9 +64,7 @@ static abi_ulong get_sigframe(struct target_sigaction *ka,
 
     /* This is the X/Open sanctioned signal stack switching.  */
     sp = target_sigsp(sp, ka) - framesize;
-
-    /* XXX: kernel aligns with 0xf ? */
-    sp &= ~3UL; /* align sp on 4-byte boundary */
+    sp &= ~0xf;
 
     return sp;
 }
-- 
2.34.1


