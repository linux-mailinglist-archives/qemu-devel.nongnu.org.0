Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C546A7687
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:00:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUTo-0006vL-76; Wed, 01 Mar 2023 16:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXUTi-0006uq-T2
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:59:15 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXUTh-00070X-8M
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:59:14 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 t5-20020a4ac885000000b005251f70a740so2343302ooq.8
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677707951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xddQZXsMQgNfep+issh1RPxse75MMzvUlTlaBK+ELO4=;
 b=IJcUWnYXrELxuS2k3Fvkl0Ji2NZ3f3IBILxGKMRdiOhV6HEIkokr31xBrd98J95tjU
 BfMrAyWC0G78P4jElSCldh44Rndo9E/BzmjX649gpGl5eNUMzR4c/YHabYThf3aejNYT
 0amWMK4UZcJF1Yf+rDyGDC21O7Lh3US5yv2oKO7G880vjCiSnzONDBui7nnC5HcVq+fI
 wWR6fxifoeuAi+QmRCjTkYbA9mf6LTW33FC9d4IIPxMn0YONQV98V3PdCAXCaw1rgNTn
 tvoKMJa6MMBvnA0vYv3IekRm2l53JV0A3vSDCCJ8tZeZgzttV+iFDEgZBUmGybT0wBCM
 RTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xddQZXsMQgNfep+issh1RPxse75MMzvUlTlaBK+ELO4=;
 b=VXGTSItPaGbZ5hwDoTd/SDwL0+2uuch03Sym3hpFpVisufUkKky/mtKr9Gyljm6Y0F
 spJgNgtReIJR8h0TXiAlOaUr8Ul17h/nZIBKgPgyO6HfJuBYGBwAtOpF+Jqe9waT/fdn
 Lu7jDV/5KpRhLjZ5Wgdi/BVLQDF2I4qvbOgqGDvm+TuATrzJ32uSrkhklYetT1JRp30F
 wbBA4dNaJXDOEdwaPfItkyqpQ4GtUxYTs/+jWcqXcoC5LqRz0z6LmPdzBygANTMnoHjG
 8+sDdGe7uDpind/gh8MJz+0U7zyD7Xzxq2WPVtAkkdSxwf5eGDETS8HNPyBkw6h06X/6
 K1Tg==
X-Gm-Message-State: AO0yUKUFnjm7KWKUfeKPUJuH9taWZE+NueM697q/zIYvItkSvmqZn4CF
 u9pUtREg/+TduQEmpF+quAJ8Q7hG/NcdR4xD
X-Google-Smtp-Source: AK7set+HKPrTJxGiKswkB3yqA6U99gtfN5xX5cMWUq9B1flOZi/ax5KLaKcqKvJZ9TYRNJ6Wf+LcmQ==
X-Received: by 2002:a4a:ac8d:0:b0:525:2113:f1 with SMTP id
 b13-20020a4aac8d000000b00525211300f1mr3436742oon.6.1677707951190; 
 Wed, 01 Mar 2023 13:59:11 -0800 (PST)
Received: from grind.. ([177.189.55.88]) by smtp.gmail.com with ESMTPSA id
 zf40-20020a0568716aa800b001722c5625e2sm4850307oab.7.2023.03.01.13.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:59:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/1] hw/riscv/virt.c: add cbom-block-size fdt property
Date: Wed,  1 Mar 2023 18:59:02 -0300
Message-Id: <20230301215902.375217-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301215902.375217-1-dbarboza@ventanamicro.com>
References: <20230301215902.375217-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
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

From: Anup Patel <apatel@ventanamicro.com>

The cbom-block-size fdt property property is used to inform the OS about
the blocksize in bytes for the Zicbom cache operations.

Linux documents it in Documentation/devicetree/bindings/riscv/cpus.yaml
as:

  riscv,cbom-block-size:
    $ref: /schemas/types.yaml#/definitions/uint32
    description:
      The blocksize in bytes for the Zicbom cache operations.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 hw/riscv/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 49acb57da4..31b55cc62f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -244,6 +244,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         name = riscv_isa_string(cpu_ptr);
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
         g_free(name);
+
+        if (cpu_ptr->cfg.ext_icbom) {
+            qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-size",
+                                  cpu_ptr->cfg.cbom_blocksize);
+        }
+
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "compatible", "riscv");
         qemu_fdt_setprop_string(ms->fdt, cpu_name, "status", "okay");
         qemu_fdt_setprop_cell(ms->fdt, cpu_name, "reg",
-- 
2.39.2


