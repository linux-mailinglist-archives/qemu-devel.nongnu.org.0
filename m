Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22855526CE2
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 00:17:45 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npdbT-0000FA-Pf
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 18:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npdZ9-0007kp-E0
 for qemu-devel@nongnu.org; Fri, 13 May 2022 18:15:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1npdZ7-0003eE-KK
 for qemu-devel@nongnu.org; Fri, 13 May 2022 18:15:19 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so11967234pjb.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XsraKeFlfnb9TgM6xNyBzf8fAKUPtnh6QbNo2XUloGQ=;
 b=4Wq1ZExoKw5jDks8AiLQPaadmAweVd758eVdOBJpJkKUilYq7goKgotkjdzipqMl0c
 RmjFWmBbfWdYi/JCriV+QkTfvnOd0avIg7nPyazCD4dot55NqY8Cu20CVmbz7AmsVWfe
 ska4mZUQPc4++FZ+c+FSKxV5n4xhyjeUfGyHT6eCSO3c4XG3eBDei9MqO9OOD9/YQzqu
 UJxCsnxtn7fvNwbc7GOckLfyzFNeX/1/DdVR2Kcc7I71r9Zp5k9aLtjYlyOR6680++1U
 JFUAcuC3AeA+46ePI4p5afI+hfOG41QbuNlQrnDdXNwPIKbKknUNVnAwcfd+aQ14VX/e
 Cs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XsraKeFlfnb9TgM6xNyBzf8fAKUPtnh6QbNo2XUloGQ=;
 b=jGv+Wm+brpDDwCmqEk5zCgxhdJoAI/++0BlK55S9lPAKs8Qgk+i+JuP2chVm7SQ2CU
 x9fYWKyPfiekFv0/TFr2wc3PmoZ8OLDohWFx3QdSQZb/lGCPeLTOv8coElfu6ZZ6Gxmb
 BPHlZx2DbV8rnBtdM/GpZ+UCD0Jr8b/RtwslcKuA2Cqx0/ueF8m5hCmrf28OvRCbUpA3
 d4D6b6QriTI8SE1qQYvDaaVH/zkRkc8nawnlDbVkqKnfZ0zgO8TKMMyWDXCH+vOsNBXK
 FI5oU6/aaTMgHbpz/tWIOGlj9ba2u7Y560OJt4YQ9S4MCPg85xoHW514hnTb/dE9ZueE
 239A==
X-Gm-Message-State: AOAM532qSLRd8BW60F0kCA8crHV3+wrw/hETCYqzS6JoEBF4tM8Clo7o
 LQ7WgAtBKX6SHZ8tkKfDBjZRWZAvyn5lJg==
X-Google-Smtp-Source: ABdhPJyKtyzZfzmFJL9hMi74+cYluM0cU2xnc+JyESXAmjV3gyIn0oVKKTlZWPLuqA7Xm16t4mOoJA==
X-Received: by 2002:a17:90b:4ad1:b0:1dc:96fa:69aa with SMTP id
 mh17-20020a17090b4ad100b001dc96fa69aamr18156889pjb.189.1652480115723; 
 Fri, 13 May 2022 15:15:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0015e8d4eb1bcsm2508937plh.6.2022.05.13.15.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 15:15:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, qemu-riscv@nongnu.org, dylan@rivosinc.com,
 Bin Meng <bmeng.cn@gmail.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH] hw/intc: Pass correct hartid while updating mtimecmp
Date: Fri, 13 May 2022 15:14:58 -0700
Message-Id: <20220513221458.1192933-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

timecmp update function should be invoked with hartid for which
timecmp is being updated. The following patch passes the incorrect
hartid to the update function.

Fixes: e2f01f3c2e13 ("hw/intc: Make RISC-V ACLINT mtime MMIO register writable")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/riscv_aclint.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 0412edc98257..e6bceceefdbc 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
                 continue;
             }
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
-                                              i, env->timecmp);
+                                              mtimer->hartid_base + i,
+                                              env->timecmp);
         }
         return;
     }
-- 
2.25.1


