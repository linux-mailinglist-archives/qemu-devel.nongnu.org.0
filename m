Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765B96A7D6C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXf1U-0006ug-Jb; Thu, 02 Mar 2023 04:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXf15-0006SA-Tc
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:14:24 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXf13-0007ZL-7U
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:14:23 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 v1-20020a9d6041000000b0068d4a8a8d2dso9110279otj.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677748457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R274/Vc5G4hcu19V0bNDe9Pycy+Is3/KvfH/HkOqwFY=;
 b=DSxhLKVWd3SKoPIIS0QAWR2IqJbwkvWRZtfMH9xGNPnGHGEr9v1x6ajYa6tjKXMiBU
 WvHfOc1y+cU7whT6heNFE4B6ed/xfnrOEduJjzJyzkO1xcdF5HodjUgkKGHulG51qb0B
 pgoF/XQI/jhgvRRQKsI0lUwrjod6twAyS0grJRrWM9wi2fbl0/m+F4qPkCf7CHPmA/bi
 55xPWlT4v1AdvFcIoGiB4X1vKVab0Mj52tn52AS+mUYBQ1Ipw6mI1FbCiLsZyxLJg/e6
 hKsYkMLWeaW+NchI0eYC7q6KfpMuq6CpceRaG37lb+aebxSbC/JQZe/layOM64V+/OtV
 J6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677748457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R274/Vc5G4hcu19V0bNDe9Pycy+Is3/KvfH/HkOqwFY=;
 b=PEXcCryBM71Lz6oUrEjFco4ydLKlkPArZKY84NGh6ZuSA+LkgqVs+M7qX/tJ7n2Yun
 ZNmTMrGDhF1zZ9FZVUPc7Cr8YE9eBibAUwwjCuFbxBTndYEJEjAtc05B45iaMG/0FI0b
 KalWlH646fg4kDf0fSctgDv4n+C1sfgAWXhFTYmkCiIj1PKnVODjfdWecyRtRJyV5D9v
 SOVt477uStXGW4jc6bcZ17Ov8DxzEep4poArR+LPyehhe8uZFtJSsxTHLCSL++BRmQ6f
 zBaB5V1hfoW5D6Nk8/kpzX37qLMqk/CmFIZ5ijN6GMVr6EjrnI7YYRWQgMonUNJh1mew
 nQCw==
X-Gm-Message-State: AO0yUKUR+U5ihU8XRmzfRo+RzxHedQ1JV8o2ouz5aDf9iHT7RK3uhXtt
 FWWwJWF9Y9d/mnnBgRBmqAlGxwiroMh6bV/j
X-Google-Smtp-Source: AK7set8X3WkLFuly/1S0jCA9Q19VuIjBKpkEM2ZEq9vK9tpNlOwF5KQNMDfMxQG4IqXBczn1dw6D9w==
X-Received: by 2002:a9d:17a7:0:b0:690:ee6c:5684 with SMTP id
 j36-20020a9d17a7000000b00690ee6c5684mr666398otj.16.1677748456958; 
 Thu, 02 Mar 2023 01:14:16 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 v15-20020a9d7d0f000000b006864c8043e0sm5641793otn.61.2023.03.02.01.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:14:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/1] hw/riscv/virt.c: add cbo[mz]-block-size fdt properties
Date: Thu,  2 Mar 2023 06:14:06 -0300
Message-Id: <20230302091406.407824-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302091406.407824-1-dbarboza@ventanamicro.com>
References: <20230302091406.407824-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
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

From: Anup Patel <apatel@ventanamicro.com>

The cbom-block-size fdt property property is used to inform the OS about
the blocksize in bytes for the Zicbom cache operations. Linux documents
it in Documentation/devicetree/bindings/riscv/cpus.yaml
as:

  riscv,cbom-block-size:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      The blocksize in bytes for the Zicbom cache operations.

cboz-block-size has the same role but for the Zicboz extension, i.e.
informs the size in bytes for Zicboz cache operations. Linux support
for it is under review/approval in [1]. Patch 3 of that series describes
cboz-block-size as:

  riscv,cboz-block-size:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      The blocksize in bytes for the Zicboz cache operations.

[1] https://lore.kernel.org/all/20230224162631.405473-1-ajones@ventanamicro.com/

Cc: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 49acb57da4..3799fab9e5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -244,6 +244,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         name = riscv_isa_string(cpu_ptr);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
+
+        if (cpu_ptr->cfg.ext_icbom) {
+            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
+                                  cpu_ptr->cfg.cbom_blocksize);
+        }
+
+        if (cpu_ptr->cfg.ext_icboz) {
+            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cboz-block-size",
+                                  cpu_ptr->cfg.cboz_blocksize);
+        }
+
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
         qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
-- 
2.39.2


