Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFCC31B8C3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:10:12 +0100 (CET)
Received: from localhost ([::1]:55410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBchf-0003ef-5z
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:10:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcR0-0000I5-8K
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:58 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQx-0004F6-VJ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l12so8547658wry.2
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FA09qyTC4OitINqYBcwCDg9CArRGCBIo+PjjkY7Qht0=;
 b=qj1tw5HJWVGzAKi494VKcYD85vP4YaoQq7wXCfNJ0MrdmWiM7NGNxTCkboDoEH2QSn
 3c/CRKvHWcbAEtCISyIVU4W2OX1D2xNA81fd7RJo8Xp6fHcWw0X1uRwIXzsKtPFXC63e
 l0DPNBaRkpvePtNpXPaDILF9mR6EBVKsIDLWUJxwkL0urHJf7ZLWUOnsiIFdSX88Nm1M
 G8P+qfSq6LSIA7QcPxQQQft5hqbw5devLUUhPLXSirEcM6pm/8moj+sM5ALpNJIoTnQY
 1USWs1j9d9STxyiuPwV8k+Ngodjy70uUYD++/tGpYPz6ylEtzuerDh5nLw2jvytadB60
 vv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FA09qyTC4OitINqYBcwCDg9CArRGCBIo+PjjkY7Qht0=;
 b=VQEZKVshhyMVW8wNL0bIn8OhPy2t2tI3dEzJNfBYUt8dA9XGBve8832WYPuDLG+f6o
 CuxB0oxPydWubLq+WweKOdsH75vS5Uq0XXp1GYtZu6FGfAggkpqWXdBms+/uNbLXUIu7
 3+7ovBhpJHp8bAvY93odDyG0Ct3dl/5KgmSiVoGjo7FgvhAt4ubLNVmeZ/XX0kgvsPYZ
 s1TuShIStxPQY0vMxaWmNjVFpbB6qLjapQdzdlC4zCtJdfkomLsrJKBvkkymCiYCFbMW
 2C/t1+//5pF99Na74Gv0rasa2gztwJ2aqvS8Ttg5m2mjll4EL3BDz51Us6hf5MhZZBT4
 B5TA==
X-Gm-Message-State: AOAM533KW5gvupl/h8REjLCHOGoOw36INaYK9uqpYZfJh7UL2ybnhInR
 j/f8QlCUd3q/AOmgRnD1sBVJBg==
X-Google-Smtp-Source: ABdhPJxvNKq3Mrnr7M4W+maWg87c8b0rBsL+93F8+AKNf7fpC1pZiax1j35k9UOsvQkHga6IiEQ8wQ==
X-Received: by 2002:a5d:570b:: with SMTP id a11mr18906627wrv.242.1613389974750; 
 Mon, 15 Feb 2021 03:52:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/24] hw/arm/mps2-tz: Get armv7m_load_kernel() size
 argument from RAMInfo
Date: Mon, 15 Feb 2021 11:51:33 +0000
Message-Id: <20210215115138.20465-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The armv7m_load_kernel() function takes a mem_size argument which it
expects to be the size of the memory region at guest address 0.  (It
uses this argument only as a limit on how large a raw image file it
can load at address zero).

Instead of hardcoding this value, find the RAMInfo corresponding to
the 0 address and extract its size.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index cc9d70ece54..da27caa332d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -525,6 +525,20 @@ static void create_non_mpc_ram(MPS2TZMachineState *mms)
     }
 }
 
+static uint32_t boot_ram_size(MPS2TZMachineState *mms)
+{
+    /* Return the size of the RAM block at guest address zero */
+    const RAMInfo *p;
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->base == 0) {
+            return p->size;
+        }
+    }
+    g_assert_not_reached();
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -789,7 +803,8 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_non_mpc_ram(mms);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       boot_ram_size(mms));
 }
 
 static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
-- 
2.20.1


