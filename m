Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC96564A07
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 23:31:51 +0200 (CEST)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o87C2-00064Z-Aa
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 17:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879B-0003TK-JR
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:28:53 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1o879A-0006MF-4D
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 17:28:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id n10so7022552plp.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 14:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XWUHW2uWZ9zbOeqP0838xJKDYozgaZ7qX3ZxMT89y1s=;
 b=FPTmeYFa7SGP3RqRs277v+U2WgT87Df53L5MdEHZOlTxs9cACfF745h3yJY+gBf9Ja
 AS4rqj7YWDKvTePTe9YKayM6o9a1Gdit2xmMZwKnX0Brb4xMSjSkZAffUuHhPEv3pez2
 V77KRT1Mzvm/ORsJvHGnR+qIULzT4H1uCC/wk+OU0/5KQzsri0hONtRfP3XTbGIejw5S
 JKIkC6fHnnuBfLOejBs5ff9A6Ri6SGq8AFvfrA5ecgGUs76I05aOrYxWK6YuUDj0oob5
 VCFTCG4yTbh87jeHqIEfs0y4xiPHWfsgU6zfEZuhXdSlsd1Lp/f8H60C72YG7ucK02YS
 wGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWUHW2uWZ9zbOeqP0838xJKDYozgaZ7qX3ZxMT89y1s=;
 b=FMgZap2zVw/aLQk7uuQXEre6mrLic22yxDXLtFQjUbdAUYQt71yYsXlsl1lqJFasXW
 JxUgWemSbp5keG0VkfgROAKdPVtmCdbZFAV5IyNq2F8vpeZjBHzACg1BWoDDR+cl9c7/
 XMCN4VFqq2k0h/BviWYqKLDtMRxdZf5whCucvQwQrDpn8r9YFnDHvivwQ54vqOVGSgTm
 ORuumlPumia6B2cVzZchRO1sAVc54QpU2yHMgeOzrlGX8JkfRcQGvLRomea/jr43I9J7
 RAxeCMXc+mscqNbx5VLwQZlUXO/4xXsR5YjaPgA3VVIxQr7O7ygcWj9jJpMk4xzvP52k
 kgxA==
X-Gm-Message-State: AJIora+m1WFG20u9w9csm8itcDy5ZIDiRmXUhJxCR0joCje2Xa83/gK1
 cNRrgNKJgnZC4Y3w0Cd3j95gLHmcJrc=
X-Google-Smtp-Source: AGRyM1v9bS+Z0b/KwgjPpu3fNgsJnT/RVsWrOKV4P1uDkTfuGTLQEK72xjbansHlW5X8FuJHkeJjsw==
X-Received: by 2002:a17:90a:6043:b0:1ec:c929:d16d with SMTP id
 h3-20020a17090a604300b001ecc929d16dmr33309723pjm.7.1656883730524; 
 Sun, 03 Jul 2022 14:28:50 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b0051b8e7765edsm19623465pfk.67.2022.07.03.14.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 14:28:50 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 02/11] target/openrisc: Fix memory reading in debugger
Date: Mon,  4 Jul 2022 06:28:14 +0900
Message-Id: <20220703212823.10067-3-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703212823.10067-1-shorne@gmail.com>
References: <20220703212823.10067-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

In commit f0655423ca ("target/openrisc: Reorg tlb lookup") data and
instruction TLB reads were combined.  This, broke debugger reads where
we first tried to map using the data tlb then fall back to the
instruction tlb.

This patch replicates this logic by first requesting a PAGE_READ
protection mapping then falling back to PAGE_EXEC.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/mmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index d7e1320998..0b8afdbacf 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -148,7 +148,13 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     case SR_DME | SR_IME:
         /* The mmu is definitely enabled.  */
         excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
-                            PAGE_EXEC | PAGE_READ | PAGE_WRITE,
+                            PAGE_READ,
+                            (sr & SR_SM) != 0);
+        if (!excp) {
+            return phys_addr;
+        }
+        excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
+                            PAGE_EXEC,
                             (sr & SR_SM) != 0);
         return excp ? -1 : phys_addr;
 
-- 
2.36.1


