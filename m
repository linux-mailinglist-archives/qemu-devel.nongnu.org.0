Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA59490A83
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:32:46 +0100 (CET)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9T3t-0000bN-9U
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:32:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5O-0001MR-DV
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:24 -0500
Received: from [2607:f8b0:4864:20::631] (port=37389
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S58-0000ej-S1
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:09 -0500
Received: by mail-pl1-x631.google.com with SMTP id n11so19278929plf.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sq5hcxwZ8ePp8DTrOnpUye1knsdChYLvWAxxRBcI1VQ=;
 b=zmAb0NyDzBmIL2QJvEOpjJ07vd4uL0+HziqVz0M2wRkYmQ7x6xO2YNfu0Ds7y/GQk5
 /RdLwPpt4KK469NU+FDao0DiBrh5wfkOQf4+vBXWfLQY2RDJaWUVBh00pIEOPIa9LjMb
 f6+m0K0EPv9qCbcXp1wL4Aoh3f1U+68aWzTSMW6qLmyn52MPQTvno7JWebeWgaR9i7v4
 jMrBBlZd/FyjL/UJ2WMtEAvo/7PCo9RJ+qh5YqXjjt5XwgxlXyRsOO1uzBeYIjpgToZP
 srctIrSe9ej7e7doZSFVPOQRaJl3d84j0ODHextXuwSNrDBgNzvZcd72OGCuXvivbhe6
 +Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sq5hcxwZ8ePp8DTrOnpUye1knsdChYLvWAxxRBcI1VQ=;
 b=d6eXTzxVyTbGWlYGwtJGlzC7IiU+P+loZlBeaB3soQ22VbZmrkEop18g3NtC8HL+2A
 7hLeK1LFRc63qjRsW3BPg8g7PIWibws68cL6WWcYtlwxIP/5ClGBkr5UN9IxhHH3v24h
 jxrChOMiF4O5scutakOHgWRusKo817vcHF+NGuShP5K6E4GylFk41BYVkOrROw0tGsY2
 2Myt4vkF7t6YUOfDZXUyK0V0+iLq14OPwzljcTKhZ2Up3iQA0gO4OdeSSo5ESiRAZUaH
 RdkKDWD6d8JXax7ctwhMHG4BLLE1sWlbByajq73funh3N/AwvXmQz3TDOV4XGLWasmWx
 01dA==
X-Gm-Message-State: AOAM530LnO7K96Ski9Jo3vn4UP+7ezfrJ0RERBqquyIpDD9KTBvKJBxQ
 9vsBYk9bkS/bhE3btdcRBcGvKg==
X-Google-Smtp-Source: ABdhPJyaLaJhNikX7iKZguFGONAjbzry3XRdEwjFo2Wtq0Ff+ARtpLU17CqXb8bLPHv4aBOCFmDeAw==
X-Received: by 2002:a17:90a:d154:: with SMTP id
 t20mr34665384pjw.43.1642426171119; 
 Mon, 17 Jan 2022 05:29:31 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:30 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 04/23] target/riscv: Improve delivery of guest external
 interrupts
Date: Mon, 17 Jan 2022 18:58:07 +0530
Message-Id: <20220117132826.426418-5-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x631.google.com
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
index aabf0a02f9..01a8baea06 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -325,6 +325,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
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


