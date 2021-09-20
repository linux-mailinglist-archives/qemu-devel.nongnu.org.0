Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A024128F7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:37:34 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRun-0003N5-DD
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7x-0006Mj-Th
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7u-0003LG-OO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:47:04 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t18so33651373wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zo8kftudnPOZgXxxzKZCu6JZDCUogG66dPAYCxpYeH4=;
 b=HZcPnQNoLd1/5Cd5QMamTZjuLhCfDQ5fM0ZSH0Su0vWHMEr9mK/7mACayWz/YxwyKO
 1gHzYhX2a4+8TYZSy+VKj0GMlf2X69kLczl7eOHn/LUyVx+E6OoBWVqWRtk6BbddyY4y
 h3vnVOd2xf2zXQUz5QfzvI62yob4Dae0/qXpe3781tBxI+4g4jz25lqHjTDuP0AUTxe7
 1cM/TJ+QneqIMfFa9pWG6pdWMf2+Y7Cs92HXIFL69isAvG4/Ft0NHZxU2FnBZj+r3rcT
 KmFLMaHxIy9dFFFxKK+/8W2E+OIBf3i+XfaJSGGBRFph/CipcOrtVNUq4I9Pvy++5Mo3
 ZB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zo8kftudnPOZgXxxzKZCu6JZDCUogG66dPAYCxpYeH4=;
 b=7XbbUDwDw/cg8rHV3XoeaKJOA4qen8BW6BrzRN/XpG5PtVBbvqDGKHknZ8Yxn6b0zA
 H7db393JgPpl36qYW9xx6sPt1RktIVTid6sXlgYlGuFG5St5SqlilJEMYSDsV1EI+p8q
 AAH+OsTHxjCUKPT10BUNEflTxLW1gh6iwH4Xaz0CCuFvpAgxEOLbt77nTxJw31g6MSl3
 Etd2CnXDtzKIx0TCLFy3GUOECublRyOX5L142MMfqUIPCZwqXDpgqLgY2lLaZbtV58VX
 uv/ABZ1nS9IB8ESHHcEH/g6dBfSGa+E0uYw16bSgagXnSqVVpTCPbnrz8w7mTrK3Tsfe
 8pDg==
X-Gm-Message-State: AOAM533CIr7b0LZMselFT6PVptcirlD7xeBPI1ZP6boqXMlftiwpXQAh
 3vq5YQLn+YslswJKf3cgtDvJ5jp+QW0=
X-Google-Smtp-Source: ABdhPJxGk72mR05cqEE/KhitBJgbpHrCKGeuzOMe5hEemP1wUt/UROqmXWBFKD1k/gJUEBwaCzl8rQ==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr31459538wrn.111.1632174421315; 
 Mon, 20 Sep 2021 14:47:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n26sm691138wmi.43.2021.09.20.14.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:47:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/31] target/tricore: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:45 +0200
Message-Id: <20210920214447.2998623-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/tricore/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f04..419fa624bd5 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -62,10 +62,12 @@ static void tricore_cpu_reset(DeviceState *dev)
     cpu_state_reset(env);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool tricore_cpu_has_work(CPUState *cs)
 {
     return true;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
 {
@@ -154,6 +156,9 @@ static const struct TCGCPUOps tricore_tcg_ops = {
     .initialize = tricore_tcg_init,
     .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
     .tlb_fill = tricore_cpu_tlb_fill,
+#if !defined(CONFIG_USER_ONLY)
+    .has_work = tricore_cpu_has_work,
+#endif
 };
 
 static void tricore_cpu_class_init(ObjectClass *c, void *data)
@@ -167,7 +172,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
 
     device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_reset);
     cc->class_by_name = tricore_cpu_class_by_name;
-    cc->has_work = tricore_cpu_has_work;
 
     cc->gdb_read_register = tricore_cpu_gdb_read_register;
     cc->gdb_write_register = tricore_cpu_gdb_write_register;
-- 
2.31.1


