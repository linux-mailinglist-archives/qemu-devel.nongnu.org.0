Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1A6B12DE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 21:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa0Gt-0008L6-B9; Wed, 08 Mar 2023 15:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gs-0008Kp-7T
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:22 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pa0Gq-0002TN-PS
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 15:20:22 -0500
Received: by mail-oi1-x22f.google.com with SMTP id s41so13091118oiw.13
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 12:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678306819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/czgBHOiXNcAsTwIQvAKApd52rIzMfuuIKayIqgatA=;
 b=GhlrTJYZdDM9eFNmVMH+FfO2cnavbf8JpfO7Sp3sn2TSvBC7PHLAkI+czJcJaugILQ
 o+ImB/GH+/PL3nvkWJ6GXoBrPKCo9RlyIxbUPtf2LT8eFahkfil6ofPM6mA1D34W5tom
 MCAO+uciq/0s7sRLXATdlyh4Q8fociWl4w5Z3nP3Uu6pDdM3NugwUfx34yh8cbRlHQ0u
 dIn/K9AjFbY2vVmfUhUVvzfSqWy81OnEgIdlIALqBdPQZgsDtpQrY18sB3oejztfmYyN
 jEt4tleYcxWIqd4GbfuonGu3z9YlrnaYFWvPhARn0chx9bbkBhzrX2nM0szVxdLo91Pm
 wjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678306819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4/czgBHOiXNcAsTwIQvAKApd52rIzMfuuIKayIqgatA=;
 b=lwkc7bDzIOl5/xwf8QnRPiadgsYxhgXdmkE+MbDi4aHOorp6oj6Uvx1la7Iab2T0SS
 GuZvYCtEed99USgaucHHMHYs7l70JHlzykKesFNA0A9n3qG0lHsAhRFv+Cf9NPHMFxWM
 G+NgGWBFXbuUnEGGC21vTL/h5zOilcPzqjKYyWkaufwd9hPG0HC5kMdPxuvMmoXOFNO+
 WdmpQS5X7kxVTbFXlgj/ocLKxSUSGTFaHcMo/4e/n8c+S7LbWf50Snm17XJtZrZ0c2/z
 PSnM3UU8FrQ81g+9uELrT/uyRn3svNs/39Tzrq+f5/CNjlvbiZ4YkE+UAFlV14wNViYQ
 xdHw==
X-Gm-Message-State: AO0yUKXN9WHiKAQYSa5js4l5+JuRItAtWdqHruNDZHXdR/d15xtFZpUR
 W6nIaiF2CGQu4tPJ43tAyZHgt8OiM0OJ2lPaibc=
X-Google-Smtp-Source: AK7set8q5hMtmbh/FlOOIxOlX79ppnjxa/9GV8cq2+GRqcErjRWgFWpeAiFOdTy5xyhUBkYmUHOjoQ==
X-Received: by 2002:a54:4188:0:b0:364:9c99:f6cc with SMTP id
 8-20020a544188000000b003649c99f6ccmr8220726oiy.22.1678306819784; 
 Wed, 08 Mar 2023 12:20:19 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 i66-20020aca3b45000000b00383e9fa1eaasm6705790oia.43.2023.03.08.12.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 12:20:19 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 16/17] target/riscv: do not allow RVG in write_misa()
Date: Wed,  8 Mar 2023 17:19:24 -0300
Message-Id: <20230308201925.258223-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308201925.258223-1-dbarboza@ventanamicro.com>
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We're getting ready to use riscv_cpu_validate_set_extensions() to unify
the handling of write_misa() with the rest of the code base. But first
we need to deal with RVG.

The 'G' virtual extension enables a set of extensions in the CPU. At
this moment, this is done at the start of our validation step in
riscv_cpu_validate_set_extensions(). This means that enabling G will
enable other extensions in the CPU before resuming the validation.

This also means that, in case a write_misa() validation fails, we're
going to set cpu->cfg attributes that are unrelated to misa_ext bits
(icsr and ifencei). These would be 2 extra states that we would need to
store to fallback from a validation failure.

Since write_misa() is still on experimental state let's make our lives
easier for now and disable RVG updates.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ab566639e5..02a5c2a5ca 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1347,6 +1347,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+    /* Changing 'G' state is unsupported */
+    if (val & RVG) {
+        return RISCV_EXCP_NONE;
+    }
+
     /* 'I' or 'E' must be present */
     if (!(val & (RVI | RVE))) {
         /* It is not, drop write to misa */
-- 
2.39.2


