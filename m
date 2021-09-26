Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE1418CF2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:58:55 +0200 (CEST)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUd6k-000585-LI
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceG-0004y3-Bz
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceE-0006hP-NR
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id x20so1794485wrg.10
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=nkS/LYcg6s/akvHzRJmA5eDbGOYXvzR59XMuTYXRLEz16bltsJJUXLc7KHqruxgKuu
 YzlHL939T50KQNjrXH3fHV+0I2DYsHMmbudle1jZiyIRGgiVWnqwtbmNyZbOxQGNpAyh
 wAQPhqvxahZoqP9MY1SFlWlHdP7UnmA/JsmIoRx/s142flaFPrdyzGwtSzQT6EvZt1U1
 AHlf08Dsf1/mnxxS86veWEng21L4Qw0pYQe+sJJoqYb6SKr3baUsFO9oov5Ctwr5+upa
 bTx2cJNeGVEFGtQ+jZigcN8/QekGZxsPp7HLKH1BEAV8PCHNGVmAG2JZUTQgZocYl4gM
 eiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=kWvuzyx1ur4bmF/QVQuqt5DnxvOevw35IvJHMik+cVzBKHohgPy6yksgObwvHe7Id6
 Wfh6LO6uKVxGq92loS6/F7T5206m28tcqDz3UuG5eur4afNy9Ennzr2NM9ndvHtRpWZv
 yyj6hXmjGd9qWL2cepxxL86CRjJNHxf0NpF7g9gD/EGUbOAEYzTf49/bKoQ+BeVpSLG+
 HjSzUR8bQZoT5YbKBtuutjjODyRHmeNel+/MQu2GdsvMfzPxuGx/xXQ25mLg2KDGK2/8
 DpDHGwMyYgLHin6YUCLT60BRiJC6fDn389KcfDjCfjuV0yPFJCAfHVKdC7ppUujev9tU
 NrDg==
X-Gm-Message-State: AOAM531Ck+8xSFAQ2MaXbeMkRzI/AMEY7paXUEymIiiQakexYYGGVyTb
 p1w2+rDJVgcmU/TbpFLnrVxhS8gPtmY=
X-Google-Smtp-Source: ABdhPJyjL2QymzAMUKPhqHOn9hW5Jf7KI2SXIy40CCIE2uW4MrImB2CQbQVxZQdFY/XQHhtLJ/DOgg==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr24103741wrs.304.1632695365378; 
 Sun, 26 Sep 2021 15:29:25 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j19sm14800281wra.92.2021.09.26.15.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 27/40] target/nios2: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:27:03 +0200
Message-Id: <20210926222716.1732932-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1e..9938d7c2919 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     env->regs[R_PC] = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_reset(DeviceState *dev)
 {
@@ -223,6 +225,7 @@ static const struct TCGCPUOps nios2_tcg_ops = {
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = nios2_cpu_has_work,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
@@ -241,7 +244,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
-    cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-- 
2.31.1


