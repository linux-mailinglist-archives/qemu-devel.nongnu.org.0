Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CCD6B9C36
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:52:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7rI-0005tc-0r; Tue, 14 Mar 2023 12:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rG-0005tA-FA
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:42 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rE-0002ti-O9
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:42 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 t10-20020a9d774a000000b00698d7d8d512so588982otl.10
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRdtt58Q8y4eJQCf9Cy8TeGZOFv7f1nClPt2O+Z3IH4=;
 b=iK3+dqRwxiKcRkgZ7IrbYS09Ibz5c50PY9hr/kbhaS/FHQuQJ7ln3ZDYoOSbtCyhjj
 deoj1BA+cbu/A6/fim5ayk+Anq9TXCslU+JYYfbU+ORzzZ3asOPzEwrqkiknlRYU0Yjl
 sOKoYy5+JPZyCNB10rsevj+m3iqcg0AiVfcIpq9Rc6W2iIluKFqPMx1iSMzetdGszhXX
 AsBpBwfWO8t7wjnaIB6vuADSuNizVInkMq6wKdsQDFlov2o1EoTE8AL/QYOjY7Wza+Vp
 jF8ZovbZmOzR6d3F4c6UlfaOjpTQptJvA/z4XtY/df9+uR9oDXLdlxVzTQ6rDfQxouZA
 e5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rRdtt58Q8y4eJQCf9Cy8TeGZOFv7f1nClPt2O+Z3IH4=;
 b=GV7dpEy/SMhnt7B1Hw7mWHQYmgsMHVpykxCPlBV3kb58XhQSz+PaLaGUdBXHwCYZuE
 vLvxKUvqvUjxrBvulGZrGuSJNk9aXvfVaSidad9JlVFVOVHRl0UZYGOZ/aKKFCAaRRwl
 RP9kswuZaqKWXAU+6FYDZ1glbVTxeFvYRDAYwDWvW6hXFA9ImkFCcji5eGcABdWmhCSv
 T2T/VSHIqRdXub4TgEgmiOMO7Ym2VQSfp2ZdAkgfgbcLmJr12xGs+rM+usZInMGPLrrA
 CM6BUyy6WFbD+0WVSGGg8DC/mMfH5qsPIJPsewhRee2wryR90MmUzyGaGa3qhQLzWlXc
 NfWQ==
X-Gm-Message-State: AO0yUKXOAA8+Ap/GUh/eSXAa1TIcPj3XlJo4j14Ptz2lOjLCT2JHbMKq
 LmAbV9nSm0Nxf01jVHPzomrYpW/CfZz7b7W1bSA=
X-Google-Smtp-Source: AK7set/VwUH5yq5mGmba7EsLFXvdbNP8I2mYzusbC4tq5QsKwj1ipdaCbgK+D+OAnYdz3zRhCJd9NQ==
X-Received: by 2002:a9d:4111:0:b0:694:3972:db96 with SMTP id
 o17-20020a9d4111000000b006943972db96mr19139427ote.0.1678812639784; 
 Tue, 14 Mar 2023 09:50:39 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:39 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 15/26] target/riscv: do not allow RVG in
 write_misa()
Date: Tue, 14 Mar 2023 13:49:37 -0300
Message-Id: <20230314164948.539135-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index d522efc0b6..918d442ebd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1348,6 +1348,11 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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


