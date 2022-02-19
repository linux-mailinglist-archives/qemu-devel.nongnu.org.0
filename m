Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3574BC61D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 07:57:07 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLJg0-0001Q8-O2
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 01:57:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJTB-0006k1-NY
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:49 -0500
Received: from [2607:f8b0:4864:20::52e] (port=44650
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nLJS2-0007bD-SN
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:43:49 -0500
Received: by mail-pg1-x52e.google.com with SMTP id l73so9672476pge.11
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 22:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KoNPCveZijWzgoWR1Jelwb2/NfAqpI20Qrmg9Ja69A=;
 b=KNUxeMj46dkhMjIkb62TF08v8q7Dc0c29hE4aBOYET6A3EiLqwAnFQv8+Rk0N5ZeeS
 DMZfEb1SvCq8+bfsYPrly1GlRxzsBtKC6U8ov0twrMNLMnnoxfWc6J0HJ03jdb5KEQFW
 VUhnHzW8Q+KnuTfH4fmdDbeoE/qiDAWf32TaPyTOGGj3v1JTMP8F49PvKR+kwPajhTlg
 nOSIjxXfsN1t3xV9XldWdhB+fXM1CYHpd+8rM4gAkoXLnZheI0MpLjGlAmClcUmefTaO
 01+m1X+bYWI7d8SLFOgvVTE4m5p9dER1r5v2dNx6wS6nNdW3KHpe1i9zGDH405LNhmPu
 UhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KoNPCveZijWzgoWR1Jelwb2/NfAqpI20Qrmg9Ja69A=;
 b=ihtbr8pzbdEdrBV2UbvjGfc9WRFf8av0vgykEWcPiYb6gC8XAxjBkkG6bXEEgVuRjH
 ZOftV8cHFXDag5w7eantgWUSPz7AjMxyEuGyU0Xgawt5EWzGqv0i3J/aPkhU/zxuON02
 Wzoh7zVfLhmVTvqYIKAgZtZUPTrTIcxER/n3h8l+KPgdAPlCiMoOvZqlNqCJHzVJma4e
 GNLTlqQIe55VORPPoTV4knR4+XfCvcY09xzbhOif+Y++PGGIfMkJylePvV8cRS7LYRC7
 l3Ibx4e3reeQCmd3Os14tnT/Hw7GDSBv7bEU7p/+PTLnrJ27a6qbdbaR7c23FWK0inHO
 3NNw==
X-Gm-Message-State: AOAM532R2VJun6szdj4aK5TyPM6TR5mrSF1+bvD1vCe3b3qnWiVs2ci+
 HHq9jdEIF3SA+rONvmThhPXSGPZy9C10wg==
X-Google-Smtp-Source: ABdhPJy5AdZXCcVfnAYiZs2Dn0tdQIQuP49GRkIuCEtqycnltB8lv5zhBFqFcR/FvNV5GdjvK3YbGQ==
X-Received: by 2002:a63:4d8:0:b0:373:cf6d:40e3 with SMTP id
 207-20020a6304d8000000b00373cf6d40e3mr6090110pge.590.1645252953625; 
 Fri, 18 Feb 2022 22:42:33 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id k14sm5096841pff.25.2022.02.18.22.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 22:42:33 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PATCH v3 4/6] hw/openrisc/openrisc_sim: Increase max_cpus to 4
Date: Sat, 19 Feb 2022 15:42:08 +0900
Message-Id: <20220219064210.3145381-5-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220219064210.3145381-1-shorne@gmail.com>
References: <20220219064210.3145381-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we no longer have a limit of 2 CPUs due to fixing the
IRQ routing issues we can increase the max.  Here we increase
the limit to 4, we could go higher, but currently OMPIC has a
limit of 4, so we align with that.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 5bfbac00f8..8cfb92bec6 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -37,6 +37,8 @@
 
 #define KERNEL_LOAD_ADDR 0x100
 
+#define OR1KSIM_CPUS_MAX 4
+
 #define TYPE_OR1KSIM_MACHINE MACHINE_TYPE_NAME("or1k-sim")
 #define OR1KSIM_MACHINE(obj) \
     OBJECT_CHECK(Or1ksimState, (obj), TYPE_OR1KSIM_MACHINE)
@@ -197,12 +199,12 @@ static void openrisc_sim_init(MachineState *machine)
 {
     ram_addr_t ram_size = machine->ram_size;
     const char *kernel_filename = machine->kernel_filename;
-    OpenRISCCPU *cpus[2] = {};
+    OpenRISCCPU *cpus[OR1KSIM_CPUS_MAX] = {};
     MemoryRegion *ram;
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
-    assert(smp_cpus >= 1 && smp_cpus <= 2);
+    assert(smp_cpus >= 1 && smp_cpus <= OR1KSIM_CPUS_MAX);
     for (n = 0; n < smp_cpus; n++) {
         cpus[n] = OPENRISC_CPU(cpu_create(machine->cpu_type));
         if (cpus[n] == NULL) {
@@ -243,7 +245,7 @@ static void openrisc_sim_machine_init(ObjectClass *oc, void *data)
 
     mc->desc = "or1k simulation";
     mc->init = openrisc_sim_init;
-    mc->max_cpus = 2;
+    mc->max_cpus = OR1KSIM_CPUS_MAX;
     mc->is_default = true;
     mc->default_cpu_type = OPENRISC_CPU_TYPE_NAME("or1200");
 }
-- 
2.31.1


