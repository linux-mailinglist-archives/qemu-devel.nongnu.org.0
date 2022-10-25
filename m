Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B2C60D1C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:45:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzh-0007Xe-T1; Tue, 25 Oct 2022 12:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz2-0006eg-CE
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:56 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0001lJ-Nm
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j15so11555003wrq.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P4/S2TnBMuR4066WO10l47QBPXMq0WIsweFwKXDKptw=;
 b=ydtjjEuLKaMYSh3N3yZongEp5mNdNTZ6k/z3JROmTbt5Wuce49tgc/oKnYgfgE77bs
 jYZd1ccbJH9SvhCKHBpAlII8/EtDi//4YmdAIBA7GQikblfY7Y2Loa+obAvFKX0ZMzms
 PfeaFu/5RKdSz9J5LSU9v6K6phPR3/Nzvp5l91P0yQWCXsvml/8NIhoNMMQUVwQHjI/M
 YlU0RrX8dwTHvl1bm/MgS14xDbGlUSLTa7MXHpBmqVzfHnkhb6iJC5a/bXXe2DTU2uKk
 8LXyBPKsoeVKtEYWOQ27Z+M1e74vC5wcJONjUUS8qu2RnoduWqSYi6f4F0BPz98CdG6X
 p39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P4/S2TnBMuR4066WO10l47QBPXMq0WIsweFwKXDKptw=;
 b=zXYu2QfD3PUGzvuLPvfzy21ywg7xdKInJmxxXn+i5nJX9XqHn6PuvesEhHx58RHROV
 l2KRs5ZH2l38bbcCb9cPzJpN4tfB4WKnGAdO+CGQfCem2fkUT8YWXVKI4pQEowAG3wfb
 gq4pxuGCDDKxOALEeAYF+XmKfhf0qHJjKZYzFl8nG2zBm0WKClx/I/7raQSatyWT0feF
 8w1yccsrB8LjepAD/dlyZtaNDkmBdyJ9x2F6un9blwH/iOiASiXIXY0kChPZtt1QmC5e
 N+bZUZmacS9vImic76dlwTGzheikCzf1epdpZV2xgcb4EH4YffErhnN8ISt/W3myzFiG
 xHxw==
X-Gm-Message-State: ACrzQf1kQBrONrvtA4wl0YCPoD1hydvBjVCCx2++G8sGSQc+XRd7uSz0
 eLLwjyeBQo0EzyTGl+MPnHRk5iQq3Jj68w==
X-Google-Smtp-Source: AMsMyM7ggFBMe6c/l3EHKr2/cqZujnV0PhcUKu79nZ6x1lohf3mhK4+2lc13Y6P11pmlZIgM8vgClg==
X-Received: by 2002:adf:e609:0:b0:235:f4e6:c7c1 with SMTP id
 p9-20020adfe609000000b00235f4e6c7c1mr19595917wrm.217.1666716025788; 
 Tue, 25 Oct 2022 09:40:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] m68k/q800: do not re-randomize RNG seed on snapshot load
Date: Tue, 25 Oct 2022 17:39:49 +0100
Message-Id: <20221025163952.4131046-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Snapshot loading is supposed to be deterministic, so we shouldn't
re-randomize the various seeds used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-8-Jason@zx2c4.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/q800.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index e09e244ddc1..9d52ca66131 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -321,27 +321,23 @@ static const TypeInfo glue_info = {
     },
 };
 
-typedef struct {
-    M68kCPU *cpu;
-    struct bi_record *rng_seed;
-} ResetInfo;
-
 static void main_cpu_reset(void *opaque)
 {
-    ResetInfo *reset_info = opaque;
-    M68kCPU *cpu = reset_info->cpu;
+    M68kCPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
 
-    if (reset_info->rng_seed) {
-        qemu_guest_getrandom_nofail((void *)reset_info->rng_seed->data + 2,
-            be16_to_cpu(*(uint16_t *)reset_info->rng_seed->data));
-    }
-
     cpu_reset(cs);
     cpu->env.aregs[7] = ldl_phys(cs->as, 0);
     cpu->env.pc = ldl_phys(cs->as, 4);
 }
 
+static void rerandomize_rng_seed(void *opaque)
+{
+    struct bi_record *rng_seed = opaque;
+    qemu_guest_getrandom_nofail((void *)rng_seed->data + 2,
+                                be16_to_cpu(*(uint16_t *)rng_seed->data));
+}
+
 static uint8_t fake_mac_rom[] = {
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 
@@ -397,7 +393,6 @@ static void q800_init(MachineState *machine)
     NubusBus *nubus;
     DeviceState *glue;
     DriveInfo *dinfo;
-    ResetInfo *reset_info;
     uint8_t rng_seed[32];
 
     linux_boot = (kernel_filename != NULL);
@@ -408,12 +403,9 @@ static void q800_init(MachineState *machine)
         exit(1);
     }
 
-    reset_info = g_new0(ResetInfo, 1);
-
     /* init CPUs */
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
-    reset_info->cpu = cpu;
-    qemu_register_reset(main_cpu_reset, reset_info);
+    qemu_register_reset(main_cpu_reset, cpu);
 
     /* RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
@@ -687,9 +679,10 @@ static void q800_init(MachineState *machine)
         BOOTINFO0(param_ptr, BI_LAST);
         rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
                               parameters_base, cs->as);
-        reset_info->rng_seed = rom_ptr_for_as(cs->as, parameters_base,
-                                              param_ptr - param_blob) +
-                               (param_rng_seed - param_blob);
+        qemu_register_reset_nosnapshotload(rerandomize_rng_seed,
+                            rom_ptr_for_as(cs->as, parameters_base,
+                                           param_ptr - param_blob) +
+                            (param_rng_seed - param_blob));
         g_free(param_blob);
     } else {
         uint8_t *ptr;
-- 
2.25.1


