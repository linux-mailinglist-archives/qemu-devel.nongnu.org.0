Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88E5AE7CF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:21:30 +0200 (CEST)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXa4-0004ps-Mu
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVVyY-0007Tz-Le
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:38:38 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:51202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVVyN-0000gB-Ac
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:38:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 03B1161295;
 Tue,  6 Sep 2022 10:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6E0C433B5;
 Tue,  6 Sep 2022 10:38:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HqRBglJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662460690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xKNRnVi5BdlG96+IIYret9OaQjpcnXURwPugpZDE/YM=;
 b=HqRBglJ2lGYuylsn9fsuYNxWUAhKJ63ExXfofy54kg7Pl8LXfpWpko+vhIZNYTEFp4nCeZ
 PslT3lwV7Kyb9lmnYHdGLggZn+DbiZl/EklWDtJKgJdri4DZGCWfIlJemmQWOa38SuzzSU
 KPknDyXGZy/MxbfLxkarwW4WBaRpsU0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6135510c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 6 Sep 2022 10:38:09 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 2/2] x86: re-enable rng seeding via setup_data
Date: Tue,  6 Sep 2022 12:38:00 +0200
Message-Id: <20220906103800.285176-2-Jason@zx2c4.com>
In-Reply-To: <20220906103800.285176-1-Jason@zx2c4.com>
References: <CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com>
 <20220906103800.285176-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), but
for 7.2 rather than 7.1, now that modifying setup_data is safe to do.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/microvm.c | 2 +-
 hw/i386/pc_piix.c | 3 ++-
 hw/i386/pc_q35.c  | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 52cafa003d..7fe8cce03e 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true, true);
+        x86_load_linux(x86ms, fw_cfg, 0, true, false);
     }
 
     if (mms->option_roms) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8043a250ad..0b1a79c0fa 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -439,7 +439,6 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
     m->alias = "pc";
     m->is_default = true;
     pcmc->default_cpu_version = 1;
-    pcmc->legacy_no_rng_seed = true;
 }
 
 DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
@@ -447,9 +446,11 @@ DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
 
 static void pc_i440fx_7_1_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_2_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 53eda50e81..a496bd6e74 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -376,7 +376,6 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
     pc_q35_machine_options(m);
     m->alias = "q35";
     pcmc->default_cpu_version = 1;
-    pcmc->legacy_no_rng_seed = true;
 }
 
 DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
@@ -384,8 +383,10 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
 
 static void pc_q35_7_1_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_2_machine_options(m);
     m->alias = NULL;
+    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
-- 
2.37.3


