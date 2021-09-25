Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDF41834A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:38:27 +0200 (CEST)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9kw-0000uW-8S
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU945-0003g0-E0
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU944-00076e-0W
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id w17so36400095wrv.10
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LjvVczq8n5tzr9drSBRznUr4y3SH1knsfynMe8Ogfbw=;
 b=QiljUGdm0PKQEXCkCNn340fVhtc5Zbn+wi8S6fwpUS0jh7tELuzVyXlWoJbZCo6vPO
 FMPH6IigiKzQZFC+/SDbfglQa7O8ORZ1dU8jOF+BVNJC4PAd0rYGT+uaWefVptQ6c9Eh
 69Oc9ZmcLbWWtiNMz1uLt5UJMvfiTVarOPR0ajuWKeHRNK3LmdFZ4O+sAtaizLelLuBT
 DM0SnQQJf3KTpJ5Yx+a6vLy1Yqzg8Eu+KS0gcT5d9zOjqpGfaURv472vW+ixzq4FnANf
 t0GxC9NvVCYgb2IC96nReE575U12b5Kc1OzGdtLCNIQjbZCvdOpyoeU6eNk2cjCW6vgQ
 n3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LjvVczq8n5tzr9drSBRznUr4y3SH1knsfynMe8Ogfbw=;
 b=Wqr1WtHwUbJvIaKaqg4AYwbKrDbA9XUZtVccvvuL8Xhxl3OvKOOyU0x97ldwAh9BvX
 u8agQfEvAO4Y6a3UKb778K3F8lqRSQreWGSrHJeaRtkxrMtwmgwNV2Z/1FyaSjrIDwug
 vAMORY+0TYQ1Zu0UkVt3Ppol0+PUfbzihIKqfGMecFNyD0bd+AWLTjxi+c+39cYojz8I
 S0iqRfD3wZHoAXcXW9TqTXLBQXS8f9q2IJaOeMNLZky8HvLO3bISK0l3KSpkoTgP+VLM
 LDxW5zyIHVHJQRcUS7u+T1z8fUwsFGebnOgu3V0BAEpPemcV9MkEySRa6KgaZ1cYB13X
 NEaA==
X-Gm-Message-State: AOAM532IX29g2mpvuoj8bCweFV5jHkimF1CPwUbjGnYI7kgl5ZwtMeBw
 L8184QYs1xptI0I8KfVdojLoHJCr0LQ=
X-Google-Smtp-Source: ABdhPJzTNnxPD6KolsrTO1Z3gTTabWnSOPpByyFJ7/q1/yTu3F2/RsCi2e5SEWuH4tvfEswqMj+FMQ==
X-Received: by 2002:a05:600c:3585:: with SMTP id
 p5mr7460106wmq.88.1632581646483; 
 Sat, 25 Sep 2021 07:54:06 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 x14sm11522211wmc.10.2021.09.25.07.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:54:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 35/40] target/sparc: Remove pointless use of CONFIG_TCG
 definition
Date: Sat, 25 Sep 2021 16:51:13 +0200
Message-Id: <20210925145118.1361230-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SPARC target only support TCG acceleration. Remove the CONFIG_TCG
definition introduced by mistake in commit 78271684719 ("cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 21dd27796d0..0d252cb5bdc 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -859,7 +859,6 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 };
 #endif
 
-#ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps sparc_tcg_ops = {
@@ -874,7 +873,6 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 {
-- 
2.31.1


