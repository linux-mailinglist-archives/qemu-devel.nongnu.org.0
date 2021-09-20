Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8BC4128F5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:35:20 +0200 (CEST)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRsd-0008Rj-RS
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7a-0005PR-3A
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7Y-00034F-FC
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id t7so321016wrw.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=INfXDIy50zeWCbDUiE9KJI2J1f2L/lAdM5VSF9ZNygCu1p7ZxeZdHThtlrh6DvLfXl
 parDm4Z38edBgf57p2kcND708sdJ3fmZLKJUssqbQety73c1xBiONSbj8IeYLbufZt2m
 +dEGyB1wvU90Dii1L2H7gvVyP777LU8CLvbKApHtw79Cpen1EqkjoI9AqWLtcHSQy8ke
 DxwsbU/pCPXgT2tPj6hsnQD/Cnno8C9+3MaMK0OjN984b4QffR1hOKLDzmpTlD49BbVI
 lzFB6eU1ZFG3zpdZLboPyGxWSXFzCEwlXcIXUjM88ff+ENB86qROYDGcKyYtg337XjuJ
 sJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o/vqGSMOnhzvKGrld2aIeHhcVaK006Y9gzP+FF74z+I=;
 b=T/h+dJ2SADyKNC6AOrPEuOO2e+C/x62RxA/yFHNM6pejd8CEhb9xn8U07V304bIsmX
 ytViVzZlyTCYMiUopB9bX91m56XY/ovW8kkGcIV6W58H7+qmJlngxR5M8alYkbNrktTC
 XkbwHf+67oN1PTrxChMBjgH20Cypu4yIqRUhyWJ/Cp9zL43l1KgUe3GUkCQbrcznbCvd
 0zoBp4/a+dObY8qsEM8lsSxNc63Rv6kpTa9FbjogSe145XHw1yyn2+18OZPIYw3pOLdV
 JIpiDUNyTqEYdRJGk31bGmx6z2xYnJm4V9r5sSAbYBjtegx8Yj/EBAUXwjh15U8VMrZx
 spsA==
X-Gm-Message-State: AOAM530RoAoXqOIVaOmr3bYIbVlNb+OSqHdcLHpO/Ru5Zj2YBQGJBRZ+
 JuFxUOq9IvOPij2NI3cBirWLpr4WHr8=
X-Google-Smtp-Source: ABdhPJwP12dcIWprUC5udVhPWEx8Mtd3Hx/4FVS8NihGSrEAmHQPbgo8XCMO64K3MptdvmpL0ozEOQ==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr1133421wmj.1.1632174398590; 
 Mon, 20 Sep 2021 14:46:38 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a75sm791659wmd.4.2021.09.20.14.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/31] target/rx: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:40 +0200
Message-Id: <20210920214447.2998623-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
 target/rx/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976d..ac6b40b2716 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -41,11 +41,13 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb->pc;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
         (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void rx_cpu_reset(DeviceState *dev)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps rx_tcg_ops = {
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = rx_cpu_has_work,
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -206,7 +209,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
                                   &rcc->parent_reset);
 
     cc->class_by_name = rx_cpu_class_by_name;
-    cc->has_work = rx_cpu_has_work;
     cc->dump_state = rx_cpu_dump_state;
     cc->set_pc = rx_cpu_set_pc;
 
-- 
2.31.1


