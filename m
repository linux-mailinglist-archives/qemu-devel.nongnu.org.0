Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E8F311674
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:16:20 +0100 (CET)
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AKp-0000Vh-BL
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A37-0002Wt-Dx
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:01 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2x-0003YB-2z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:00 -0500
Received: by mail-pg1-x534.google.com with SMTP id o7so5597433pgl.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4pfgRC/2OCn2LhfdCUNmf+gaeKXQD0DRrimp0qOuU4=;
 b=RlsehIMihC4mij/sg2ClFSH6VUUy0XrsX1W4hr7SJrFmRYsvFyOtN7y5UYplET/HsX
 m7AtZgbHTC9+FRhPFbWqqtPKXIsXrzlLPG6oZHCfCdKLHbVlnVb9iFnGkcF17Lx+e+Ga
 oHvNf0DT2+WtRXEPrKd+7YIQvy+heeCXuqLIjTbqfbJRiaSNmB1957DSgjiIgwQMMB68
 HE9JfMbVL67PUORIaXP6xX6VzH3YuOVpbBIPYVMzrXeG8iezdYlNJkUbtVPaz49W9k0W
 PRTvtR2vdjUIlwfyqi9iFbGh6Y7gebEO35IQwlkO5EAypMn1P2ieQEMOHCUcMomwJYtb
 aGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4pfgRC/2OCn2LhfdCUNmf+gaeKXQD0DRrimp0qOuU4=;
 b=BwpQOrMhAhL6evWASTiqYuEJF9PJpT//7UN6YC/nvIDyu3/6wte+QbGkrCFVVGRopN
 6G0JFquQMMxW3/xk12dTOjg5l0JOUlD4ZMQaq8K4Dbo5UC5xWsIspgfVNSDmUBbZO3j8
 O2Dyw2VVDMYR2b7kAAYLXDjySOF1igsYNGs0wZH1OS3yvNn3r3wuZdFmG8Wp7/vIuI0j
 D02suDcVOMYELLNvuOiCfWXLKtBlEl+li1LU/iiAp7oJ2IkgqXKjcGLghbE7eSVVtYAx
 3ew0dZ6fCU6xDskpEHMbnRS0U6lXnfhiictlVv00zBi7f61b/BiU8BRHs/Cly9rP4ebd
 aBLA==
X-Gm-Message-State: AOAM530nywq5RpkYDeChnAQmT9b7JHaCrA8zxEUJh/Y59RruITfk8CoZ
 8+K/Ha4tgawlcwjBbibFAk0TOpsveqW8xHFr
X-Google-Smtp-Source: ABdhPJyC/coGtJXVJgT/BOf6aMZVvZG82JoAv7EP38NxNn+fBF3KacuYhJMC8kw+EeoaVUtRxbvLTQ==
X-Received: by 2002:a63:150b:: with SMTP id v11mr6841818pgl.183.1612565869740; 
 Fri, 05 Feb 2021 14:57:49 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/46] target/riscv: remove CONFIG_TCG, as it is always TCG
Date: Fri,  5 Feb 2021 12:56:34 -1000
Message-Id: <20210205225650.1330794-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

for now only TCG is allowed as an accelerator for riscv,
so remove the CONFIG_TCG use.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210204163931.7358-3-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 567f6790a9..60d0b43153 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -617,10 +617,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
-#ifdef CONFIG_TCG
     cc->tcg_ops.initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
-#endif
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.25.1


