Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D86B7BA1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbjpf-0003VQ-0I; Mon, 13 Mar 2023 11:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pbjpd-0003Ur-89; Mon, 13 Mar 2023 11:11:25 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pbjpb-0000O8-D6; Mon, 13 Mar 2023 11:11:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C221222ADA;
 Mon, 13 Mar 2023 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678720281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6Q0GraW1WT1dpCp5ROo0whUmfGSr130gbFRRKJ3YsU=;
 b=VriTWFpGorj6DiMpvU50XYbXynfnf6wNFuV/WehIR7yBPQLNOfPsMNT9PLuyTw8GSBZiqI
 VkB6GbMAMYhFaQ0rqD0+c/MtalXxJ6wDUuvpNyh2j1yJ2yBCYnJI/Zv/gjuvi3BhjsyD8o
 M0wkEM9emPQ13mQBl54OEuw1DnroM/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678720281;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6Q0GraW1WT1dpCp5ROo0whUmfGSr130gbFRRKJ3YsU=;
 b=IINf7NUj3oFmt7LJa9Xum1xlTklHitTxGU8C3h0ObY6AMeXgjrkSY1+FOQ69/RT02ZM9QA
 +20rH5MIf+y6EkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E260C13582;
 Mon, 13 Mar 2023 15:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2K9DKhY9D2R1YwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:18 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v9 05/10] target/arm: gdbstub: Guard pauth code with CONFIG_TCG
Date: Mon, 13 Mar 2023 12:10:53 -0300
Message-Id: <20230313151058.19645-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We currently don't have the reading of pauth regs implemented for KVM
so wrap the pauth registration with CONFIG_TCG.

This avoids the build error when using --disable-tcg:

libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub64.c.o: in function
`aarch64_gdb_get_pauth_reg': ../target/arm/gdbstub64.c:233: undefined
reference to `pauth_ptr_mask'

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/gdbstub.c   | 4 +++-
 target/arm/gdbstub64.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 36a1d7dbc5..3ea50bcaaf 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -23,6 +23,7 @@
 #include "gdbstub/helpers.h"
 #include "internals.h"
 #include "cpregs.h"
+#include "sysemu/tcg.h"
 
 typedef struct RegisterSysregXmlParam {
     CPUState *cs;
@@ -522,7 +523,8 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      aarch64_gdb_set_fpu_reg,
                                      34, "aarch64-fpu.xml", 0);
         }
-        if (isar_feature_aa64_pauth(&cpu->isar)) {
+
+        if (tcg_enabled() && isar_feature_aa64_pauth(&cpu->isar)) {
             gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
                                      aarch64_gdb_set_pauth_reg,
                                      4, "aarch64-pauth.xml", 0);
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index ec1e07f139..104a43e471 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,6 +210,7 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
+#ifdef CONFIG_TCG
 int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     switch (reg) {
@@ -243,6 +244,7 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
     /* All pseudo registers are read-only. */
     return 0;
 }
+#endif
 
 static void output_vector_union_type(GString *s, int reg_width,
                                      const char *name)
-- 
2.35.3


