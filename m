Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9F4A9E63
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:55:23 +0100 (CET)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2nq-0003sG-0S
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:55:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gI-0003Nm-V9
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:34 -0500
Received: from [2a00:1450:4864:20::331] (port=51129
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gH-0003lU-Ax
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id m26so5093872wms.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5kPCib9NzmU5Vmt2S+1kcmJBQSJjp785lI1WhviFlg=;
 b=fbDjRbbSMQaPRfrLarangOZ9EBPyXUi7cE+1Fu2aTjdRtTpxQQ3xI42ppCTXbCiHtW
 7NRE4OBnySBrNz3TCwL3414qwipBsbQKKoS34O2icJ6Drd2g/qqH2P5pmqnKcwuls7Gx
 p8TKh+qm0Xuvx9LRJ90dxJsc3LfUjuI+8/eABn/+aTy2WQnDYvitwEJMolqPDfibAccL
 yCoCe7wPP6nfXEIGXHNZqmvzMlA5F6p28cwm7cbYcvR6JDYiGl5Ec2bhWiAP+NrqqiGt
 cqucnFdyMEcaxd5//1zu5SLf6+iR3wX8iDISDc92ol7SVZYlNcFEwu5TLb/UzxDyl9wq
 ol/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5kPCib9NzmU5Vmt2S+1kcmJBQSJjp785lI1WhviFlg=;
 b=rsJjaFnRajL0NkEMvPGiOX23wtyRdc4v9p6dW7XsYpSt3tDPxE0aSn29w9g1a0gLTy
 0cxKo24EOgg7oMhQRxVPmMCmZqRhCbZvPEkNcNV0Bnn5jocQYH+wQGP3qan6Cv2gI0VJ
 e0ODvCeS2dAMqTRG98BCMrbH/Jm40CuEyXM5f+oVFVNJ08a2fdXZNx0A1TrM2IK5UmTr
 i3oINKHHKE+BR1oIKG+GU9pY7d+UuDU711mp+dJQBsbx9f83Lx7MTLhV9swaHcVF7Tst
 CHeDc9pHPBAt39bY8kX8UNynAMC9mpRP1tJWOdCh8QAhUOSFUL82l1a/t7TKCs7VZsc7
 Uj8A==
X-Gm-Message-State: AOAM530aUGwoPORTwvXmPd6M5xFApQwMTvZlUPJLQwDabDdA41gyVBJ0
 1gPrHghYTdtVjxpQrxdBPUTIHQ==
X-Google-Smtp-Source: ABdhPJwkiKuHtf6Z2E1xAHhRr3wSfhLcIYUI47gXq97w7Rgrl7swxWsupCuMgq4ZZUP18O+xryjNRw==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr3081721wmk.139.1643996851980; 
 Fri, 04 Feb 2022 09:47:31 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:31 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 04/23] target/riscv: Improve delivery of guest external
 interrupts
Date: Fri,  4 Feb 2022 23:16:40 +0530
Message-Id: <20220204174700.534953-5-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::331;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 698389ba1b..f7b8645a13 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -326,6 +326,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+       /*
+        * The guest external interrupts from an interrupt controller are
+        * delivered only when the Guest/VM is running (i.e. V=1). This means
+        * any guest external interrupt which is triggered while the Guest/VM
+        * is not running (i.e. V=0) will be missed on QEMU resulting in guest
+        * with sluggish response to serial console input and other I/O events.
+        *
+        * To solve this, we check and inject interrupt after setting V=1.
+        */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
-- 
2.25.1


