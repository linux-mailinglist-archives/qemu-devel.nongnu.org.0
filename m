Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF22E41701D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:11:56 +0200 (CEST)
Received: from localhost ([::1]:52794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTiBP-00040f-Pd
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiK-0007eM-Ex
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiE-0008JI-Ol
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:52 -0400
Received: by mail-wr1-x435.google.com with SMTP id w29so25433603wra.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zo8kftudnPOZgXxxzKZCu6JZDCUogG66dPAYCxpYeH4=;
 b=chUbqeJV+99AjzZ2+mWb6PHXxL7KV1IoRNF/wC+uVUh4JMDQ6+DrfIgieceLBCNV0y
 gRqWvQIdoPnmkPC0MjNEbNq3HhLsffeDQXOvgFY7IW9qPPAJ5P8/FXSzead+XE7v2V4Z
 VnLh3NUaBnMf+uJjcgBZKDE+SCLVZERmOu0K+yLqD3UqhUq5a0F72qut3HXWHqsQiBaV
 nK9AurxeUFi8cPgqTWj8I2UPUYFzwNCoBg9UvMLfHpuLCAvvclenYdIwTLaT5ajZuA63
 GxxWbz3l+JKgmLmSA/evbleZwvOyrs9GMRCVt7jKiLA9GW32275/qgsVi5BhBfZx40bh
 NybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zo8kftudnPOZgXxxzKZCu6JZDCUogG66dPAYCxpYeH4=;
 b=CToQtcrsNjt4ApJKha5fTU/tNM3ziMF+b5oy3SWM7owotSmW9fT9t/kX6cW7fiJ+0u
 wS8qm5YviOJLCTq5FgRxehs6cqJo2Tr/TsZyxvTZdezQ7V3MmwpnB2CmcUlr3jzJmTgY
 y7HA9lXLX2R3j+oQpQ1enJM4p2dqD+1xXmvqz/BI04XrD8E/3WLHe9HaSsbRTfRyNsM/
 6WMwQIGg9l5vVKcnkEFTrca+1A9qEcRcJRBXXw2cLSEuJjGRbDECmV5Ls++8pSc4C2SJ
 UTtozkdDMfq4DoDhhtzfOqL0wp+cNIIskus8c6/7TYxPPFdqaCSf1elj98FZKDvJeOrQ
 uwsg==
X-Gm-Message-State: AOAM531eqj+2JW5x//hpfyBk9vhU1PldroC+qqeQda8xcggDnyDqB080
 av34KlIn1S8YUiMh2Z26KYuYgI0HhNg=
X-Google-Smtp-Source: ABdhPJy1UoZIAFxZw7dsk5UXIWVHWrGa0sr0xKDp49LL/Sd1laHKtSJCf1n0E7mSfIOzxvMsWdDKgQ==
X-Received: by 2002:a7b:cc18:: with SMTP id f24mr1091089wmh.8.1632476505294;
 Fri, 24 Sep 2021 02:41:45 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 20sm12868821wme.46.2021.09.24.02.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 37/40] target/tricore: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:44 +0200
Message-Id: <20210924093847.1014331-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
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


