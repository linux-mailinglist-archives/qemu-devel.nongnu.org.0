Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E56AD11D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:07:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIwe-0006Vl-F3; Mon, 06 Mar 2023 17:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwa-0006Sh-LU
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:32 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwX-0006of-AS
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:32 -0500
Received: by mail-pl1-x62d.google.com with SMTP id n6so12091252plf.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140268;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QloEwsr5BkemagEysCPfIB5DRHvIdaBMSjfI8BNJNQg=;
 b=ZnT0yRfLG2VAHrCgmtFMMrLB1ReFBo3enBxLnW2Ds8rubKYE83CCoNidh6IYzOCNmO
 QUxQ99JMuveCM0KZnqP1zRIYOE/fH59rF9vb4ska8j0tnr5XaUmY6tX6cs+TNlV92Bzb
 drGE33d4iGKuULOvhZ5J7A3hEoOxVNyGmnw7xTKTKd1H5oY7fy6ZrGNTDTTR4C4pzUiD
 XhYITs4NSIWMM1Vv/Aahs58WXFilPkwI6KpzJfiteD/0QRrMS1LDGk87FsZK9QK8CGTr
 G7r1fiOH96kYICsJBJFy5ZT81sDoDivlZodSWJQaEe3sSf9Dph04wHlghRTBh06Yo0LS
 22lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140268;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QloEwsr5BkemagEysCPfIB5DRHvIdaBMSjfI8BNJNQg=;
 b=R7q35W+yQle7Ki/B3VvT3TBdYbGZTvfQ+jM2Snrb59qi6PZ9ARDKic4qH1ZKCWakfM
 mKIgNZNp9RVlmx6HmskMvnREz/Kof5YaJ5eTbh+gTG2I4OcI2v+j2jrJY/RKzNn1hQNx
 mNSVK+wt6qOp8uNoYRI85Os64Nm1upMcArAct6MiBFJesZ2geTZ64k5tf1AZtnZa9Oh1
 NzGMOSqhJHE1dZfsO9psEgY/joajwY+/Pss9gTCTzKt8jHFnr3KBQA6Uu2T1v6D3DcKR
 jcJq7cTDcYvgJ9uHLx8rNHAamEmFKUfXVdDtsZKIRzjhjkeuOi+dAILO9qyX3Fu0Lnfh
 KcPQ==
X-Gm-Message-State: AO0yUKVdWqg0AEb6n9VSeiOqs5+LNolxyA3+KvwJ933ljQO2SDfRwBj+
 +s+d6j0mV0R9ds/wCICdNLgtyQ==
X-Google-Smtp-Source: AK7set8hGRfwLg4elq/ztg+OqJDi5YdHmKsUIndBuz4qFZcnz1FZceVxgHNd/MvF6gxOHz6kKfIgiw==
X-Received: by 2002:a17:903:2788:b0:19e:78b7:2f4e with SMTP id
 jw8-20020a170903278800b0019e78b72f4emr10942791plb.46.1678140267949; 
 Mon, 06 Mar 2023 14:04:27 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ky14-20020a170902f98e00b0019ee042602bsm56661plb.92.2023.03.06.14.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:27 -0800 (PST)
Subject: [PULL 04/22] hw/riscv/virt.c: add cbo[mz]-block-size fdt properties
Date: Mon,  6 Mar 2023 14:02:41 -0800
Message-Id: <20230306220259.7748-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-ID: <20230302091406.407824-2-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4f8191860b..7f70fa11a1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -249,6 +249,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
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


