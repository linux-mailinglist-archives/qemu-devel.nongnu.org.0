Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E37060C01B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 02:50:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on83G-0004xK-U0; Mon, 24 Oct 2022 20:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on83F-0004wr-3Z
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:44:17 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on831-0005Ft-AS
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:44:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1C44ECE1ABA;
 Tue, 25 Oct 2022 00:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E550FC433C1;
 Tue, 25 Oct 2022 00:43:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hU/NnNm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666658637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kQwAsuAdm69PPzRbaPZt2minknZ85uFcatWBF75J38=;
 b=hU/NnNm4fhR4qmjdMqy+/UfIkENOw+RYpCoazkb/fKVf6Aum8P0ugckWWTBPoAY79PTU0f
 ustOOVotrIaErmWxVyUztjydJ0xmDNbmV6Ckbh4rI+K51qCksdXcS8ZYLK3kdydytx4v2p
 Y1+WmReaaYVy7xXnT6/Q7BtI3QlXr2I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1b49b93
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 00:43:56 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v4 06/11] m68k/virt: do not re-randomize RNG seed on snapshot
 load
Date: Tue, 25 Oct 2022 02:43:22 +0200
Message-Id: <20221025004327.568476-7-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-1-Jason@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Snapshot loading is supposed to be deterministic, so we shouldn't
re-randomize the various seeds used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/m68k/virt.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 89c4108eb5..da5eafd275 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -89,7 +89,6 @@ typedef struct {
     M68kCPU *cpu;
     hwaddr initial_pc;
     hwaddr initial_stack;
-    struct bi_record *rng_seed;
 } ResetInfo;
 
 static void main_cpu_reset(void *opaque)
@@ -98,16 +97,18 @@ static void main_cpu_reset(void *opaque)
     M68kCPU *cpu = reset_info->cpu;
     CPUState *cs = CPU(cpu);
 
-    if (reset_info->rng_seed) {
-        qemu_guest_getrandom_nofail((void *)reset_info->rng_seed->data + 2,
-            be16_to_cpu(*(uint16_t *)reset_info->rng_seed->data));
-    }
-
     cpu_reset(cs);
     cpu->env.aregs[7] = reset_info->initial_stack;
     cpu->env.pc = reset_info->initial_pc;
 }
 
+static void rerandomize_rng_seed(void *opaque)
+{
+    struct bi_record *rng_seed = opaque;
+    qemu_guest_getrandom_nofail((void *)rng_seed->data + 2,
+                                be16_to_cpu(*(uint16_t *)rng_seed->data));
+}
+
 static void virt_init(MachineState *machine)
 {
     M68kCPU *cpu = NULL;
@@ -289,9 +290,10 @@ static void virt_init(MachineState *machine)
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
     }
 }
-- 
2.38.1


