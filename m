Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC7493DFE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:08:28 +0100 (CET)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADVb-0000Iw-7t
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrF-0006En-8M
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:26:45 -0500
Received: from [2607:f8b0:4864:20::630] (port=34517
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrD-0000NJ-RZ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:26:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id a7so2536938plh.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 07:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHS8W2uT+lKuAo1T4KoUHZFcgN/EiO/loZqzYCyCBB0=;
 b=rXuxu8WYSdvWYbdHdm6nnCZe8ElnsIKdxe3b3wCHzkcKh6TPGtK60Hs7vYkidij+2j
 xDONoJdnFqCRtD0NuJIKPyxERlT8tVOvDqe6BLcRxGEmWIJDxt2srMLL9dirNMdCwz+d
 HjEdI3GkAiK+gJC5pguCq4vifQyCswzDFra5qGS5ESTdnTvQoqs+jFyJ5C3Yv5PChF0i
 ThbZajZi1Er5yc4bsi1G/e+BtQPrwOYYUE3JYoKYEj2jIS3e9ASsi+I0Iiyfu5pnJvc0
 M3mYKzgsBWN1Jt4hZDpM1Ft+I9PMick5wvihxldd5RPHNzj8/NlYp+7rUfJUnRR65LbZ
 Iv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHS8W2uT+lKuAo1T4KoUHZFcgN/EiO/loZqzYCyCBB0=;
 b=qamJ5MBJudBUYiyLjUorcVxRcKU77qk/njbSa+TqN2NTGXAd4GUy4c2mQOa+KW1DrZ
 /TLRkpoSuwz//gb6ks5W5d2Zz5i1aOeKVACdv8YCgLRXpy0vUS/g4hJOoOjd4ge3EPlw
 KWOWRt5HyZmO6D4+PCzOieTJ3rjsjAL+uaEpxrtE1ruL/DUgtcyX7hTDhuPFsvJ0gueN
 e1Sc+jegrTOymz5cz2A1PdE9ICMWZhuFD65MjlZ83zdCQa0m7c0EORu33bseKfXeT67G
 A3Zx1/QmrqLCDSwqYKYrIR/FCM0DDL0dOxVgPAZBLtSseea7C+aW33EFmoEgSOa7gkdg
 Q6XQ==
X-Gm-Message-State: AOAM5311/MLWVmV8qxAo2c1x7gLpcjZjPGjqIY/KD55ML3d+G8DySgzX
 jfOeVkPCz1Ez55L47u6cQbfTIw==
X-Google-Smtp-Source: ABdhPJzLIhNivnioau3hwgSUHxEtrvFKdZ79th+yrfY5kRiC2eqsOH+NjTigxhkdEsaPmAj0T9bPqg==
X-Received: by 2002:a17:90a:8b82:: with SMTP id
 z2mr4870175pjn.146.1642606002492; 
 Wed, 19 Jan 2022 07:26:42 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:41 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v8 04/23] target/riscv: Improve delivery of guest external
 interrupts
Date: Wed, 19 Jan 2022 20:55:55 +0530
Message-Id: <20220119152614.27548-5-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
index d3ff1e1c78..7e60e092c8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -328,6 +328,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
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


