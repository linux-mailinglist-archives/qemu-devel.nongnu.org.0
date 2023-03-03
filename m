Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19EC6A9411
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:27:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zu-0001B3-1a; Fri, 03 Mar 2023 03:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0ze-0008Ri-50
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:22 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zc-000860-8v
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:21 -0500
Received: by mail-pj1-x1035.google.com with SMTP id oj5so1780806pjb.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832939;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTBqTOX66ilKzC7xCByUy9pfB1RZcSI16KtCXQgik/w=;
 b=H9hYXgKDq5dd2Jz0x0M6pigS/BK9EuBFi8sw+wbaj9S5Ai9CD35p5zOOpYqBjLY34G
 wOJm9IrPCUTO+doFVSt1HCeVkReJ/YSmvP9hWKFWnaAPct06Z7zgONh4HpoIO2UrovOR
 FzW6WGVXApQn7DaCC4XtZxc1p+J20CPxdCANtunG6NdNVnAMevJt3+a1DMxCuvXXnIv0
 izcTsIblZLHPyT7MYUt8a9CuWOZBJc7l239icadKaPt85eb5VrZW9B2BjhEXVehJhl+f
 A7/+I0DrbQbV8XZ5sGer8iXBUHRQr7vj6+R8Rye9QwOaG/mMGPnhfxZkN2sfUecz5Li3
 HM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832939;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTBqTOX66ilKzC7xCByUy9pfB1RZcSI16KtCXQgik/w=;
 b=Js4A6fUwo9mq9bEuCvGTq0nfAdLnK08Y3Z0tPO7g9ssXHZAvh/xsHs76IHXGsu+u0v
 w2iSL/4bpzQspYVTzqTGbKaBSqR1egsHrnqgYf3etlEa/D3m1tl3+fb1zaGJdFhIJ6us
 puHSRyixgvWduOXJpyLTWH2PKiuvU7nRk+IkMCX6hd5hp2y6uPx2bFfQcpKR3N8wDmCH
 ECQLbjq+c5ER4Mc6KOt2GRneXEA4FgMeYCaNb/O+3sYq7VwB6ToL8ARN0igLGBBCD1LC
 roV9MCfYDAWvqagL9jP/7MUIZy+WaIMD+vj0Ea85FRix7ybVSsfghgjcd8Tb5bBXVUB9
 Kppg==
X-Gm-Message-State: AO0yUKUnrm9UmJPDC6LIZ1+n34zCJFNf4QYE1tGFG4TS1jley//dJweN
 eQm3V9N7776Pd3uX2wFY4gYQ2Q==
X-Google-Smtp-Source: AK7set9QthMOGSe9jeUqpVue0nmX4FAhMN6Es1x89zQOAxgiE9xdACmE8hVgmR+8aNgkcOzPiC29vQ==
X-Received: by 2002:a05:6a20:258a:b0:cc:868f:37b3 with SMTP id
 k10-20020a056a20258a00b000cc868f37b3mr1287882pzd.58.1677832939061; 
 Fri, 03 Mar 2023 00:42:19 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 v10-20020aa7808a000000b005a8ae0c52cfsm1076799pff.16.2023.03.03.00.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:18 -0800 (PST)
Subject: [PULL 46/59] hw/riscv: Skip re-generating DT nodes for a given DTB
Date: Fri,  3 Mar 2023 00:37:27 -0800
Message-Id: <20230303083740.12817-47-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng@tinylab.org>

Launch qemu-system-riscv64 with a given dtb for 'sifive_u' and 'virt'
machines, QEMU complains:

  qemu_fdt_add_subnode: Failed to create subnode /soc: FDT_ERR_EXISTS

The whole DT generation logic should be skipped when a given DTB is
present.

Fixes: b1f19f238cae ("hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230228074522.1845007-1-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/sifive_u.c | 1 +
 hw/riscv/virt.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ad3bb35b34..76db5ed3dd 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -118,6 +118,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
+        return;
     } else {
         fdt = ms->fdt = create_device_tree(&fdt_size);
         if (!fdt) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 49f2c157f7..981392c0bb 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1015,6 +1015,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
             error_report("load_device_tree() failed");
             exit(1);
         }
+        return;
     } else {
         ms->fdt = create_device_tree(&s->fdt_size);
         if (!ms->fdt) {
-- 
2.39.2


