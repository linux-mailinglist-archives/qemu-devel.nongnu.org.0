Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7204004C8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:22:44 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDpr-0007ab-VS
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDiG-0006x8-19
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:14:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMDi4-0007Pw-CI
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:14:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so97298wmh.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 11:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A19B3XnYK5iosC8N3WaWzgfCc7f73/1fliTA2V4jk14=;
 b=gbvI5CNIvwVasuPa+ul2iPYuxkugpsQp9e2yvjHa6rTSV3cZm4ZqzzhcUFSqhd4Bg5
 qS/ysH592m9eL4tfCwMX1gC3fDjOxA0tzUeb7V7ikQUobTijXvAor/Phr5ZgvJRr4/5h
 9ZdWw5qowQu3quYKh4cbxiLmN6H1oEiVK3zyqKf1eiLVFc1/rsRZw2ciqif8w1QGRRF4
 IuauiFs+Ktr8Wfu/C2CESlwVjLXdhknsTeJGIBm+Kais5PZdY7OBJuFCtALIAADHJBzs
 +ERXsUxoyasCz2WigEt9Glrt8NcSgdhI8tkJHdoOl/oog8nQZeDqXLWXxvQPP//kRcbc
 HZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A19B3XnYK5iosC8N3WaWzgfCc7f73/1fliTA2V4jk14=;
 b=bloFDo93tyr9CjQzI2+UJ5zF6lLPTJy2b35HNZmRicI9GLBG+Y8f4aE3Ecw+o/llAk
 MMMtvAX/0Sy80qFUDIBGeBb/d+vmyfjoND+z9cwUJPoOhMD77y3XlD5pBexXDDL744xI
 ie+J9aQgVUIyN4OoJPrqHbzmxyBwdjZXQr9ylau/eQhG6nhd9EDH2aU4qTy4bbQWsHu/
 nHBvINze0XNizB+LvoyR5dUWqpMFXPvXtkzsIofNN+b7oMaweFmIlq94VrRcWZTz7jpF
 Kk/jLp90KOIougGmkmhOQqGV6Nz3uJsgycFUKTGf29/7KddP0J7Oer5Q54jzCwBcnMJl
 wNxg==
X-Gm-Message-State: AOAM530H5cE8UBhfUAjyMK8cv9w+fIHclXSpafxSHVGMS6FvNccz8hjj
 JlKHqMjqZEgKvVfxfuggJeMOh3ytLXs=
X-Google-Smtp-Source: ABdhPJwsMv5zKZYdPZ/ffk+o37IDLwD8z6dkFXcnv9z7z5vhbgak3Oe1Rhnt2NQGplQbzwhIB7v2Yw==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr122250wmj.63.1630692878580;
 Fri, 03 Sep 2021 11:14:38 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j18sm5584248wrd.56.2021.09.03.11.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 11:14:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/30] target/tricore: Restrict has_work() handler to
 sysemu and TCG
Date: Fri,  3 Sep 2021 20:14:35 +0200
Message-Id: <20210903181435.761585-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/tricore/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f04..728da5d4ee3 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -62,10 +62,12 @@ static void tricore_cpu_reset(DeviceState *dev)
     cpu_state_reset(env);
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool tricore_cpu_has_work(CPUState *cs)
 {
     return true;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
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


