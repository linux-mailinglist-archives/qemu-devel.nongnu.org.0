Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F876CF111
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:30:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZdF-0005Y9-Rr; Wed, 29 Mar 2023 13:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcf-0005Dz-Cd
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:12 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcb-0001Kx-NA
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:08 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 i4-20020a056820138400b0053e3ccf739cso1660257oow.10
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680111003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JYStSkDL3BIwj/Sa4e8jSzJ+PxxhgxQWhrJhsht6xEY=;
 b=apB1jKUCV/blvTVdoHBNHWVHgKGQkTHFT1+Mkb7suxR27N+D9b+Br/f/LHLC9DneQI
 DHU+mkUgaTGG8O5PHRcdLEEH98imTXJTeQYSFmMmxRaZaykvkETgHGPwvac+ldLVgu4Z
 SgC+1C78Qau2/H6c/pzZfYzITROPVVVmpD9rThIBR0SozJ6/FCEjsUGCTgz1vkQ/KzoZ
 BiTT/JhAB7+OFN3vNGZulWiKYCp+bGfAYTq+1RHyBIt1tdrCtNSMZFSklUTSVgdJqIWs
 r8/aMCM2w9Jz2sN5i2ZnA8dsio/5R/xX3uQRqA/FZFJGm86gx8Z92fTzDZ6zUoD3pGWO
 e3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYStSkDL3BIwj/Sa4e8jSzJ+PxxhgxQWhrJhsht6xEY=;
 b=Az7SKVHZ3txbXEZV17vrVTnoX7py4UBMqCfOl3B1jVuLIzydzPOw9MNIpixpXMIXY4
 +Z9i4flx+TXonO/dtCD/3HEvdRdyhPNDuv8v9/7jQViFa/peO0lC1aM2hyNsuKc2so8K
 N1qxafff5Om8aHVnH+HumBE/dAC7UPmI+brIabAAki7LcSkpzAUT20WudFHPF7/4MB8N
 KxjyqNjt4iWyl7JlMWgDG0hPEhJLlUrW525/P5g8jwvYj0Lpk5CF4HgRkl661fvx3qoX
 BzfldVKSXFgtZPaez+29A0Ox3RcHhO+mwVaMcBiaoFSg8SBe3IOuKFmGKjO8KRBzHOyu
 IMGQ==
X-Gm-Message-State: AAQBX9e/K8dgfVNa9NMNM16jbM+I4m0RzbUKtrejZsBfsfDrTzOsKlhs
 31cq5yRVFhbnMAyoAYxuXBdrshU80Nifmr0xaz8=
X-Google-Smtp-Source: AKy350a15mykEF0iZn9I9gjfP5ZqkxPk34oJZLFSjT3Q4te7canzA5t52Op91bYO3LgYz4c1KoHsCg==
X-Received: by 2002:a4a:cb03:0:b0:53b:b277:1c6 with SMTP id
 r3-20020a4acb03000000b0053bb27701c6mr1630746ooq.1.1680111001576; 
 Wed, 29 Mar 2023 10:30:01 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:30:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 18/20] target/riscv: remove cfg.ext_g setup from
 rv64_thead_c906_cpu_init()
Date: Wed, 29 Mar 2023 14:29:01 -0300
Message-Id: <20230329172903.636383-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc33.google.com
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
---
 target/riscv/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3eb3b7dc59..036d6191ca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -396,11 +396,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
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


