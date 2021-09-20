Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971914128C5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:21:23 +0200 (CEST)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRf8-0003L8-Kl
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6c-0003Wx-UX
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6U-00024R-77
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t7so314906wrw.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPh/K3P8lnOCu8w0iWaCapa14gPkR6lDKFebYBGUl3I=;
 b=RZbhYo5OWGdCLeGr5aYLwyXcr4gedjibwjNxpisukN9dGE5+4cs8LWcyCnvf4hhKMk
 7EM5SYlZ69x2vi1lk8tCbzUM2ObuvcmMLt4ew0i7Onz8Aa2/3PduPRf+hmC02wl2Qi4c
 6U+sq3zAQ+N/c5yf+PPGNwMNxLz443Hl+q9G088uQIZ9sPPK9ec5Oio7iEAQ2QV0mUmN
 m3YWUR98LY5CccmDVpnNOvufuOj6EY2o8HMII8tvDU/n+M8rqF3DGwNZbguCpnsnxAha
 WNqTh1TjYPLnUqy9dVJz4UxiDI+ACUZidRYZHXzqqREImMILyxAK6r5Ld4RInsxJuw6G
 4khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oPh/K3P8lnOCu8w0iWaCapa14gPkR6lDKFebYBGUl3I=;
 b=I688NKcwwAl07GVyiqIvwZ9oKJjN3rGpzfLSPSGLeNSO7KPicoOJGn9OW8VCGzyhb1
 RFpGSpASetjmRYaOyqVxkonL8TJkwyqi7rZvCS1ygYx9HoTwPT5tbrcqZw5yeGin+EU0
 W5C0tORE+bN6Xzu1B4EgHXD6YG/Evi8BAwd2frWPt0PTCq5iNQ60yrvk+Z12iwnSvctA
 hmPBCXHa9Phs/putupYDYxTLJD/y0tJ0cuxaVSuvaJYaZ01lv0Aap5OgxayKIMcvjm9Q
 t/ezmf58f0bO4jZRyt5uuhDSAErOItO+38YfM4sWCUoyHTe5jkTdzk9zZJTk+/pA8CGe
 utGQ==
X-Gm-Message-State: AOAM530rJAE3EIYOb+4bu69+gsOz73VZ/MTPS2kaM8CZ9DwSXIZoJ8Fn
 G51RjKcylmSN3dSubr5UPNSJsRrUCgg=
X-Google-Smtp-Source: ABdhPJzM0eU9RVh/uOnSl5hVDQ3CyKgvqJicO+VorVDA4RFTxqjOqq8Cpj7kBuV55exREr4Sx8f7gA==
X-Received: by 2002:a1c:2056:: with SMTP id g83mr1104582wmg.27.1632174330370; 
 Mon, 20 Sep 2021 14:45:30 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 u13sm621478wmq.33.2021.09.20.14.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/31] target/alpha: Restrict has_work() handler to sysemu
Date: Mon, 20 Sep 2021 23:44:25 +0200
Message-Id: <20210920214447.2998623-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
 target/alpha/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb4..1ca601cac5b 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -47,6 +48,7 @@ static bool alpha_cpu_has_work(CPUState *cs)
                                     | CPU_INTERRUPT_SMP
                                     | CPU_INTERRUPT_MCHK);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -221,6 +223,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = alpha_cpu_has_work,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
@@ -238,7 +241,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
-    cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
-- 
2.31.1


