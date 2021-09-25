Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C666F418333
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:22:58 +0200 (CEST)
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Vx-0004I3-QS
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94F-0004J8-BO
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94D-0007Fb-PI
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id w17so36401008wrv.10
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gsdxrxIkLL008ui7WH6lPMx1hd/4ygkSIHUg3uTtLo=;
 b=k0Sz8yUMSYMZ/8xbOcsrvFMQprsY5D03rEsFNB2SQrgBVNb1hlFa+knUz/kDL9rLzB
 dfjHNMc/FhWae7ujFy7ax7mfJigJkTDMLq0tmSe81MQwosJj/BZh8wGeN4fA+w9eB87r
 O5pH97URLpbLocqAAsaP+HxILpmT/CZQKi5aKNLToB9ZGUlvmRaiaZchfmerR6jM7Dqd
 /WrfQS4z3bXJDxDE6tBbry22Ttayhx2Nota+dx/O0FkBjuz0nRq/pbwkOUin78OnU89P
 nAH+xJG10ZI2+/DJ+72z0Kq33KWyIJLtBBqwPEs9WEVyifLf/a4kec76NlmT5PtNA6a/
 0Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1gsdxrxIkLL008ui7WH6lPMx1hd/4ygkSIHUg3uTtLo=;
 b=IH1Sf1qN/TRLsLmm3r10gFbCvscz+pjqW6klOMjAbrcxrRiVvyZp48Y0j6UzEVhzzi
 IEBS5SAv3x3bQextnKBECEZ1tzc0tP0wlqJjZozJnSVoFVVxgs6gYMrpgzeTuUZHMu2S
 uzg5mlO+SFgtH/s+YhQlHQG9Wm0dLLmBtFBSc7MtI5GfWyp43G0KDl3N3ibC9K7GPji6
 bV+rbN4+2r7EjFVAJG0YUYao9Ijiz9EBCO1WOevcyIrbVHaXm+nDvqZ/zEBMEqtx08K2
 553v/28Efbkt3OuJMlXjuThEb1tlXzNMkfWpvXitFwORl/KAI6n4lJO0W3kF3GMPsVE1
 lJFg==
X-Gm-Message-State: AOAM531tSq1amerOkcLJ50kBvldbkYY4o7SMhGml7H0o2EcLHnSZaq/e
 Og+MPcj7CHfND2vl7zfW3gLt2KhtA0g=
X-Google-Smtp-Source: ABdhPJzPfotxBBSzEU+E5O4FEXBLyWmWJLpARs2ee9fo32q/153reG1jvVpj6DyJlVWk+Y5sHF6OwQ==
X-Received: by 2002:a05:6000:160c:: with SMTP id
 u12mr17585287wrb.128.1632581656243; 
 Sat, 25 Sep 2021 07:54:16 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 w5sm11286457wra.87.2021.09.25.07.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:54:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 37/40] target/tricore: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:15 +0200
Message-Id: <20210925145118.1361230-38-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
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


