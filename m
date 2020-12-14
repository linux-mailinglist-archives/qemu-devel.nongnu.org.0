Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4342D9F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:42:24 +0100 (CET)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosnf-0001Mv-2P
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjG-00083m-0E
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:37:50 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjE-0007Md-MD
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:37:49 -0500
Received: by mail-wm1-x341.google.com with SMTP id c133so2670700wme.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PkbswluQKWjRx3dBtHaGXoEp5nk30ZYfIfOdkw/Z4mE=;
 b=so87HLcUDeHLMSRrrBIoaQWUwBf8G3+RiGUHx0pXI0M8i8oVclm5u38oWxGVU+nRE9
 H1/I+bkvfeohZvPRDLGNrptdMb+bS/XgK3I3hemaCE4VuYbp+oP8+OEm6BaxdYpVWC5q
 7kdq8C+VkX1BkPWurVnCHTbxnFpB1RkgtRNapuqHjZDaFp5gokompzmmnRBHp7irMovG
 HplSBu+h5qd5YPQpXjbyjrz2Qx+8dbFmeEToshnQT5AEFmjWT8/8pf5RXYihAN8NPqqV
 XW+aOXYWZUP/uJ/OYB3uskd5w4ddXWksjA52rV84hF4Rzc6VUX3VxpFwzSY8JvoiQx3F
 TryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PkbswluQKWjRx3dBtHaGXoEp5nk30ZYfIfOdkw/Z4mE=;
 b=dWSlCmXgqjMznNCqT7CBHdVeLl2U/eutsyLee8LpgngLtx8qlSEEzBkDRyPRZc20YM
 jGcaPoLi1rPxnhUjIPhfzQl55GUJ8dS3R+FkTl3m5C+bKaodFPnAFMdIW97G5wxWU/fo
 wRlp3hc10//vVZxAYQ07uqfyAuTsWMRLCAnm9AapDxX4Ei/qmIgjQkh1NzMM1JGYHmzC
 WDZCKfBP+gV6Hw5t83s8vDNlgaRiCqqbgt6IovZkOuoRxFVtoJQsJ6q/HJo1uu8GG1DS
 zB90d8LHk0wpZLBNT1GvlJksVYjMhAZXGaFvdbfOnJ8cz5t+0iomp6jzC58FAbS0pWWy
 BM2w==
X-Gm-Message-State: AOAM532E2JzPE3ULlu2rGnAPxX4vzx0PQxEbD5K0HljwwWRGqDale3bY
 Hm6puCnRvXDLI64duSH9TFaWP1Qv5Uc=
X-Google-Smtp-Source: ABdhPJwGXLAxo6yN+sLIdbUznMxVePFYOVX87wckAVWiT7wsnNmHFrE3HhgsbKkK5tMFh6Kt4WouSg==
X-Received: by 2002:a1c:2c83:: with SMTP id
 s125mr29306057wms.161.1607971067021; 
 Mon, 14 Dec 2020 10:37:47 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id y7sm33139083wmb.37.2020.12.14.10.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:37:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/16] target/mips: Inline cpu_state_reset() in
 mips_cpu_reset()
Date: Mon, 14 Dec 2020 19:37:24 +0100
Message-Id: <20201214183739.500368-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index aadc6f8e74d..7a0dcb11ecd 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -104,10 +104,16 @@ static bool mips_cpu_has_work(CPUState *cs)
 
 #include "translate_init.c.inc"
 
-/* TODO QOM'ify CPU reset and remove */
-static void cpu_state_reset(CPUMIPSState *env)
+static void mips_cpu_reset(DeviceState *dev)
 {
-    CPUState *cs = env_cpu(env);
+    CPUState *cs = CPU(dev);
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
+    CPUMIPSState *env = &cpu->env;
+
+    mcc->parent_reset(dev);
+
+    memset(env, 0, offsetof(CPUMIPSState, end_reset_fields));
 
     /* Reset registers to their default values */
     env->CP0_PRid = env->cpu_model->CP0_PRid;
@@ -330,20 +336,6 @@ static void cpu_state_reset(CPUMIPSState *env)
         /* UHI interface can be used to obtain argc and argv */
         env->active_tc.gpr[4] = -1;
     }
-}
-
-static void mips_cpu_reset(DeviceState *dev)
-{
-    CPUState *s = CPU(dev);
-    MIPSCPU *cpu = MIPS_CPU(s);
-    MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
-    CPUMIPSState *env = &cpu->env;
-
-    mcc->parent_reset(dev);
-
-    memset(env, 0, offsetof(CPUMIPSState, end_reset_fields));
-
-    cpu_state_reset(env);
 
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
-- 
2.26.2


