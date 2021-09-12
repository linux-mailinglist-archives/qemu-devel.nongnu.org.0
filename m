Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522BD407F17
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:57:20 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTjD-0005Nh-Dd
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIf-0001nr-FC
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIc-0005ZT-4g
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:52 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so4966170wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zo8kftudnPOZgXxxzKZCu6JZDCUogG66dPAYCxpYeH4=;
 b=nDkBx0SE2JWOWic80sIZo+UWrCW+cSKt1Ly1bAzgQtgunxnbZEbKKIBiURMdUiuM/k
 OZ7Yn1K+Ii6BG7dP1kh0WC5CDmZu+t3NrerEFmbfuO03wDwNPsalCpQuqjzrs4HrpmU/
 0DeAdJWU19kH/zSANj/WEtsG+IQrruIPwj9pPYC9CO52nEuSGAMrh3U4Js8NFNTESluP
 OaHklBCu71pro5Pwlk+LCE0e9e93vh5HUQLnkpqZFhwxr+RL7YPOovkFhYzxIll3LEyx
 lXKbVduI4T/Bl2Uz5+yC6lUE0s4l31Jv6t8vvBcQKmpDRc6/uDEgcfiU2kO8wwD4pMeC
 b78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zo8kftudnPOZgXxxzKZCu6JZDCUogG66dPAYCxpYeH4=;
 b=p2nWmOa7+cumi37DEq5TzCi6lCCb2lFuKAhR6gOZ4+kjyB/Za4ZAwGKEndyXt4mvz6
 QnlEnI5vbuGvuMQ369YncMHaVcKUiAMXyeBtunl4IRfTubVqipfjBF5oNYY76dVllqyJ
 mc4/0DMZQay6llQSWQOZ4pvhnv1iiXqyvgSjydgAVE7A6iTX6bdQpEalQwKJPFUdhlMw
 6NlXKdJVcsFGWeKP/lHbbpnByLcQfJEsMuuBmdKRIntmqKVUFcus1S8bl71UL9ekDhxP
 S/CzUtVFZ+vHfEKoNvdp5ZHCOYrwm5Y2TtTlHzFPO//W9QU0qUV+g4r36NV5y2HRzhuS
 JbuQ==
X-Gm-Message-State: AOAM531j0Xmo4cs50yt8XlmvTeTLLMbiZ7eoAmMkiNftlzAnv3Lkxpcw
 aCAn9v32pwMOvIG0qIAATJkv0y2oN/0=
X-Google-Smtp-Source: ABdhPJwkUbT+jZV9DIoyS1BD13V7X7qv3lQ4N0BUO3k02DmuP5doAX5ZijLrTwTlOELZ8Z9MPLN5QA==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr3618329wms.16.1631467788676; 
 Sun, 12 Sep 2021 10:29:48 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o2sm5301135wrh.13.2021.09.12.10.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/30] target/tricore: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:29 +0200
Message-Id: <20210912172731.789788-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
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


