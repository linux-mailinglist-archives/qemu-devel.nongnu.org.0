Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A364658B0B4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 22:04:21 +0200 (CEST)
Received: from localhost ([::1]:51962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3YS-0001jI-Ds
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 16:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pq-0006ay-Si
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:26 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Po-0004WL-8l
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:26 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so3856495pjk.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXhVqFyj2uRqAwlXF7c/Ivc+Hg/JsHzuWch+Fk+p75k=;
 b=EBGvIJfA5Gyfc+E07cUyhypCHOY9RQOGqe3CrVFR855uUXSgeU94U9Tbai2TloGVP/
 K6wA5lZ6S+IeqlUe6TdLDQi0MGuZcbWwmbSZPmFQVCXq5julbuxqa94Yci+LTebphWW0
 0zCrbO/YsGL2bT4nZTaytu7FFTYwRd+TB99B0Fh5AM3QutoeSJ5OyUgaoxsRqeFxhlQu
 RgPYDeZHiudGlj1sRnU8hRJLY9RPekpvWLd6gRWb/LZ/e7ZzaP7bGA57a1VnStbe5cWj
 SEOT8tHEMezDIlgiFQCJk04VYzuGUa1m8r3v4j6p6zGswLNlH9UOVzIKcmMWL1GV4PLs
 Ocfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXhVqFyj2uRqAwlXF7c/Ivc+Hg/JsHzuWch+Fk+p75k=;
 b=0akCeIOe1CSkvjchbUWHDo81hrQFcBFg/tlJYznqDpeSfmQUcaY8esiQu62+QeghsO
 x5F3CkakixKvGeBE/8Ux3lJBqUf8gY0Lu1hFBnXcYHJJUfVLJ0wAOw4BWDsbQsnWeE6W
 jt4r1tdxOOQ1Pqb2ZA1ioIFcwsMFGNR7I7q8adNjTI/WK8C8LTavI9yHSfN/6ESZHLlw
 SUg4L07JEx+Hs8xdUI58/3tfKOdUfta+HDkQ0QEnyG+liEwFnrHRJ+pYTOUUH5WJdHmY
 Ao0hijvYPhzgCYryluxY5OWyrqbSCpfb7Ddy4sSKYkTMHEL/U4Ill9lir+luAiAp/LJQ
 p+Wg==
X-Gm-Message-State: ACgBeo1yKFTpe/pZspDhYQpAUoCi/3gsGbXPImhCUs9LubHacqGBtRfb
 xMEFTazi0WrpBf4SgnEK1Jm3BYBC08jt1Q==
X-Google-Smtp-Source: AA6agR4eErTt67grIFYsXaRaeFM9kIOWRYYK8ak20SDXfxdwArkzvGv5dQWV4DFw/OBwHWlJEVNpfA==
X-Received: by 2002:a17:902:8f91:b0:16c:151d:3e1b with SMTP id
 z17-20020a1709028f9100b0016c151d3e1bmr7976125plo.37.1659729322842; 
 Fri, 05 Aug 2022 12:55:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 4/7] target/loongarch: add gdb_arch_name()
Date: Fri,  5 Aug 2022 12:55:12 -0700
Message-Id: <20220805195515.349768-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
References: <20220805195515.349768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

Matches bfd/cpu-loongarch.c, bfd_loongarch_arch.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220805033523.1416837-3-gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d84ec38cf7..941e2772bc 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -661,6 +661,11 @@ static const struct SysemuCPUOps loongarch_sysemu_ops = {
 };
 #endif
 
+static gchar *loongarch_gdb_arch_name(CPUState *cs)
+{
+    return g_strdup("loongarch64");
+}
+
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
     LoongArchCPUClass *lacc = LOONGARCH_CPU_CLASS(c);
@@ -686,6 +691,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_stop_before_watchpoint = true;
+    cc->gdb_arch_name = loongarch_gdb_arch_name;
 
 #ifdef CONFIG_TCG
     cc->tcg_ops = &loongarch_tcg_ops;
-- 
2.34.1


