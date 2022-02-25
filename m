Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BC34C4168
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:26:35 +0100 (CET)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWry-0008Qp-2g
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:26:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1v-0004cp-JW
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:50 -0500
Received: from [2607:f8b0:4864:20::42a] (port=44767
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1t-0002vS-FF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:47 -0500
Received: by mail-pf1-x42a.google.com with SMTP id w2so4084503pfu.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnZANHh1cEDimBVsUymqDGP9GmDwsCaQg06DqMeTQ5Y=;
 b=FWYMy1bMW/OjH9efA9gSn4yGVjxWYCWAzyAO+cH0qFBPyTK8yyKG5pXgnxP6osF+N+
 C7sAcN7j9uBVGiIRXrJyu3x2gg5lgs3StGWGtb9Rph4U1q2J0wvYlTrjMLC2Mf8+JlXb
 TLFrawCexxbuOxNqtQntqzWkkoCWasLotR7PrHUwtNbOo4sY11y8IHRkihJ4ca7dy3LG
 2fUS/6zv+5sftEvOlwWT0lF+q2AjraJHOZ+t8vJHDMjmr9uaMBvdqG7qCpkBuTxtb8it
 Tiyx4IZSyUDa0q4qKRiBYi5e4yKtSpFjLzIwE07Jp2J9Mn6JkULS+F+mWqo6NotIMieA
 nLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnZANHh1cEDimBVsUymqDGP9GmDwsCaQg06DqMeTQ5Y=;
 b=JtUnPRH3O5VPlfxXA6F6q/a5csRcbrbczjMNrpWtuYOBK5Fl1Vc8Qa9dblAaNadJ3g
 XWNFElwspmv2umVU4MNHjZTFFGHj4gQfWHFR2bSDlhshL/h9aTORil0VVDOdi5cQbfCZ
 WTFFSy4i+euiWdjwepxFeE16FPOWLoOf8qjul+qK57dOEB42kQ5gwJr5bAPdu6ez4iYA
 DA8n0uGX+8T25K5wf9y8dzhBoxwirrzfPhb4u3gdKTznQ0G7qUsqcE45AU0XblQFFy4r
 qQOxGJXLo6E1jw9TnGiZmIeW4eiFnjmP8y9eFlw/pPH3vLkVXvi+9Gj/co+SiAyv70FI
 wAsg==
X-Gm-Message-State: AOAM532EUd6VMO+scEeLbXLTKxKq94MazbZn4+z+hRPwSG3DTUD1RAJW
 JlIsamzaIW1otZDQUOjJ8frDLYHnVtVSwuQN
X-Google-Smtp-Source: ABdhPJwklxvTn9phMnsYVmylKcDpjTD46XyqFAxhrCujKqoLToGZwiv9WXcgKaP5mSZ/cap92j30Ew==
X-Received: by 2002:a05:6a00:84b:b0:4e1:be36:7cce with SMTP id
 q11-20020a056a00084b00b004e1be367ccemr6600227pfk.23.1645777963152; 
 Fri, 25 Feb 2022 00:32:43 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090a65c700b001b936b8abe0sm8524291pjs.7.2022.02.25.00.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:32:42 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL 4/6] hw/openrisc/openrisc_sim: Increase max_cpus to 4
Date: Fri, 25 Feb 2022 17:32:20 +0900
Message-Id: <20220225083222.1174517-5-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225083222.1174517-1-shorne@gmail.com>
References: <20220225083222.1174517-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x42a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we no longer have a limit of 2 CPUs due to fixing the
IRQ routing issues we can increase the max.  Here we increase
the limit to 4, we could go higher, but currently OMPIC has a
limit of 4, so we align with that.

Signed-off-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


