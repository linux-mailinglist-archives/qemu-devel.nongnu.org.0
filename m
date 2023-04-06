Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121EA6D9F71
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 20:05:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkTyt-0001Rw-8l; Thu, 06 Apr 2023 14:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyn-0001Ms-MK
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:05:01 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkTyj-0000bw-CY
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 14:04:59 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17aeb49429eso43239353fac.6
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680804295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Wyx1FHmxLdFtf+sn5xFAZ+OPtPshuj5d2U+hRYbEPU=;
 b=ndQ2X+kmw7UYP2zhjJqqooTLbEUUbWfBrKw9NbAXLWK9Iiace0HRsEoFeh5Mi0iAWS
 8FqJdzSrYpbmlMCTmq8hHQuhwHfxTylLigDSyUcb9PQu5eC9kGxxrK+JJhBU8HmI2s1n
 9UyEBToSFbpaQe3OhGoj5YBzYrFOOczE1Vw9hUGj47XnAZe6b5poDPpYPO5zV5ICCd5z
 1nQEv7hyltpeYQYjXg6v13l9QDiHv2gcy8x+pGNe1dUG+SgklkgwDmgN6XTnuDoXcGkQ
 zxziRtWCaVagpKtw2PqNkvXbpamaV6ts7NwNIT4SEhSxK32A6Xy6Hc/JK/EBeYUGhkld
 aFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680804295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Wyx1FHmxLdFtf+sn5xFAZ+OPtPshuj5d2U+hRYbEPU=;
 b=GPXyt0h31L3Hua6RjgGFS0C4sSUHHv/6wzu7DYlFZQq69PrnNF1Z6FY8vp3d8XRbz2
 KABM07FfNm7UCA6rwuGLtW6ZZmES+YILYeZSYzEgyMlw4KrLdrW6For+HtdmXcZw4pMM
 JtkkZ+CZCgg5aimTDRCxqRGSSa2HKlnuDtLbDkyjD+1irZ9gVFYi0KKkrYT5KYiBXAHU
 Vx/KgJt0jxmxmC6sDI4TxZha65jbCBhN1DyPOaOWErnEodiPvsXB26+KsvRjpIqlDAZh
 wzem+v5YvQxF0w51mfzfDsDc9sDSxN8dhgo5VtBNJIHAwsVMK+HhKQRORa4Mlfx/kHNb
 Xi0w==
X-Gm-Message-State: AAQBX9eSjnkh3h386JeT+2MGpfrHZFXpc5YBuPq0Dv9cgvMljoplM5Bv
 k62gxM+iI1kIe7qWGk4OkodPxnOLkRfY3z5hfes=
X-Google-Smtp-Source: AKy350YBor918awCNStMZ1zlzHp0MzyDIeSR9kuuQW3BNyaD1juNywcjPXBxBdnSK/VeetETpOYLfA==
X-Received: by 2002:a05:6870:d595:b0:177:a4d0:e389 with SMTP id
 u21-20020a056870d59500b00177a4d0e389mr110831oao.28.1680804295404; 
 Thu, 06 Apr 2023 11:04:55 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056870d20400b0018045663fc5sm906309oac.48.2023.04.06.11.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:04:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 18/20] target/riscv: remove cfg.ext_g setup from
 rv64_thead_c906_cpu_init()
Date: Thu,  6 Apr 2023 15:03:49 -0300
Message-Id: <20230406180351.570807-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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

This CPU is enabling G via cfg.ext_g and, at the same time, setting
IMAFD in set_misa() and cfg.ext_icsr.

riscv_cpu_validate_set_extensions() is already doing that, so there's no
need for cpu_init() setups to worry about setting G and its extensions.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1ecb82bb5d..b005bcb786 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -403,11 +403,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
-- 
2.39.2


