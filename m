Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68052C7A59
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 18:43:13 +0100 (CET)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjQjA-0006lf-N8
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 12:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQga-0004yW-41
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:32 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjQgY-0000ZM-DV
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 12:40:31 -0500
Received: by mail-wr1-x441.google.com with SMTP id g14so11992229wrm.13
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 09:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3cR/9hnxyL0olc4DR8P2jZGcuc13fxHDf3Td00Nph8M=;
 b=n8qgxgDYS8npa+jgyDqtQdGav4jgon7h5+kQWL6d0OdHkLM/T8r42Yh7CGi+7ce2hK
 Gwc8M2J6C+EK9o9JqW3Q4mJOOO0cQ3uSK8DN+XT4grb1/z7v+aa2H+n0LkYiVPoc0tGM
 tQhD/8reb8TyUkI7cbLqulRS1ycZ2xlEhr+DQI49nvTvbXC0YWSbUiuuqIJdC2+xcwsP
 e/Be2SN3kTJO2Vv/DP8oQdvHKnGYyODl07NrP2+6IE+zyzec9XTic2pWBCxogL2fOa+y
 Ys2ozsZxgr3jVMu7MgyXAr7ju1Iw8x0DvbHgKMBZtdERMJ7YNIGqoaV0OBDZw3JAI0lk
 Oawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3cR/9hnxyL0olc4DR8P2jZGcuc13fxHDf3Td00Nph8M=;
 b=o8sAFjmr8H9fQWq6ucFvssJ6DB5LxBS7RPGW67xk9p23eXQtvWwrMWN1UXvQCUXOf1
 GmEheI3T9T9jb9zoMP5wGksDZ1IpWldYiZWvO99UzB1BQer/StHz5i06Y7Uqn7uD1syT
 UI1ORd4B2Od1ibhO5suglJeJRAG1xHyQjlL/OP7htkOLPqRfkoO7QYo85qL0RIz8EuQV
 vZS9mcCJEb2ZQX8lZDUf0Eqq2j4svqMogk6xKUu2iqFiHzBppLwgIorKAtAjMIrb+kVN
 kzCUPG2p0/w/gvOKdqe/nWnHsLCwLvtXoVgV+p/adb5Mtvbvalof1OVO6KbbtZgLZ9bP
 boJA==
X-Gm-Message-State: AOAM533yzfwS55EUCqzWvzkXSem75aVJbj58Qyt0J+CeC5evBGoSuht6
 JuDymaU5pSS79MW4u3tYA0pAcUhnvJPgRA==
X-Google-Smtp-Source: ABdhPJxpi0l0wu+Hmo0szV7aPaJLAtZwylK9cAaVoDHqx4Ls8p1OQe3t7iHik7oKF+PX+t/VS2ykTQ==
X-Received: by 2002:adf:f3cf:: with SMTP id g15mr23493326wrp.71.1606671628836; 
 Sun, 29 Nov 2020 09:40:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b4sm23379940wmc.1.2020.11.29.09.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 09:40:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] target/nios2: Use deposit32() to update ipending
 register
Date: Sun, 29 Nov 2020 17:40:22 +0000
Message-Id: <20201129174022.26530-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201129174022.26530-1-peter.maydell@linaro.org>
References: <20201129174022.26530-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>, Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In nios2_cpu_set_irq(), use deposit32() rather than raw shift-and-mask
operations to set the appropriate bit in the ipending register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In patch 1 I left the code for this identical to the old
code from nios2_iic.c for clarity of that refactoring,
but deposit32() is a clearer way to write it.
---
 target/nios2/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 52ebda89ca7..58688e1623a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -71,8 +71,7 @@ static void nios2_cpu_set_irq(void *opaque, int irq, int level)
     CPUNios2State *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    env->regs[CR_IPENDING] &= ~(1 << irq);
-    env->regs[CR_IPENDING] |= !!level << irq;
+    env->regs[CR_IPENDING] = deposit32(env->regs[CR_IPENDING], irq, 1, !!level);
 
     env->irq_pending = env->regs[CR_IPENDING] & env->regs[CR_IENABLE];
 
-- 
2.20.1


