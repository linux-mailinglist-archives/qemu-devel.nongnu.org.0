Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B78686C8B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 18:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNGer-0006bf-UQ; Wed, 01 Feb 2023 12:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGem-0006aP-BQ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:12:25 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNGek-0004Iy-Aq
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 12:12:24 -0500
Received: by mail-oi1-x22f.google.com with SMTP id dt8so13206114oib.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 09:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fz356eeLxSTB+G/CsOEbtTXiIQ9xiAjsdTiBBzA1hes=;
 b=IOOgNhSyEzVwn8El6htRoDacos1PsNk3pOr25gfrDJ/FauYhIaRGq2Gk+unzzPKedL
 dSAViVyVRJ3urVEeQZC+3FewbIZsyxJcSG5CLmZl1OUoPIMvStjf6Pjb+eeGP+gwtJYz
 wUpfF5rZZerYXUae70R2HcosAmEBCsrTakAgVrC2kntsgjZhFthFgwv/b5Mt36bSVJfi
 t+pQQl6L9UChfUlVPeVOR2jiAOlJY+fF3zPzotisZbYO+9swQSToIyA24PSEoa00qifO
 kRR+QLoTJ4TUJ9MuKZt+3+7LO8W0SydfgtlE8DK0EtkvcahRmp0nGRXarYHg3scuNKYS
 QbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fz356eeLxSTB+G/CsOEbtTXiIQ9xiAjsdTiBBzA1hes=;
 b=bcbqXxnRPatNr+bFMz3M7tY+6ZHNhW84JrNz0RSvCRM7FOO3geeLHe2JvhJNXeSI8s
 i6G9uV7P2/kpBrFA8kjXF9OWyjN35L7l6MCvkEix75duRiHg/bwYLQQH8v5TkXNljaYC
 2wgh5UXVTMZO4mBzG7L/EyQgDqDLdGR/+1JRvf0e+jJjqB4lbKHHGLaJ5Pxowi3b9EJS
 /o6wjLTxOTAahXMxTpE7WaZx5dvDj21OuhQTs5pbhTuvatU8f7ojvzf05rKC5uxvms1R
 rUL9gPWMG3UPB61Ac1B+zaH2iFJdqhrXeJb2CvvMnq+SAFQbahlBozKpUuhz+366sODv
 XKSA==
X-Gm-Message-State: AO0yUKXr8kDhZKMfkY4b0HPrEkO13vhzoqydv6skL7LcOXXQOo28RXc6
 0jXcqbvcG15uev14XK1sJZD6QxgxLDXrENL8bqk=
X-Google-Smtp-Source: AK7set93GmVyCVtHBo9k0o4Ge0qaT6/ae23s2jndQ3MgqqcyXFPRvrQh/qJuBPguJs7FuyGOcgsGNQ==
X-Received: by 2002:a05:6808:221b:b0:365:367:7c7a with SMTP id
 bd27-20020a056808221b00b0036503677c7amr2055225oib.11.1675271540883; 
 Wed, 01 Feb 2023 09:12:20 -0800 (PST)
Received: from grind.. ([177.102.69.207]) by smtp.gmail.com with ESMTPSA id
 k12-20020a056808068c00b003749e231db7sm7100627oig.30.2023.02.01.09.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:12:20 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 1/3] hw/riscv/boot.c: calculate fdt size after fdt_pack()
Date: Wed,  1 Feb 2023 14:12:10 -0300
Message-Id: <20230201171212.1219375-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
References: <20230201171212.1219375-1-dbarboza@ventanamicro.com>
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

fdt_pack() can change the fdt size, meaning that fdt_totalsize() can
contain a now deprecated (bigger) value.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/boot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index cb27798a25..2d03a9a921 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -253,8 +253,13 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
 {
     uint64_t temp, fdt_addr;
     hwaddr dram_end = dram_base + mem_size;
-    int ret, fdtsize = fdt_totalsize(fdt);
+    int ret = fdt_pack(fdt);
+    int fdtsize;
 
+    /* Should only fail if we've built a corrupted tree */
+    g_assert(ret == 0);
+
+    fdtsize = fdt_totalsize(fdt);
     if (fdtsize <= 0) {
         error_report("invalid device-tree");
         exit(1);
@@ -269,9 +274,6 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
     temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
     fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
 
-    ret = fdt_pack(fdt);
-    /* Should only fail if we've built a corrupted tree */
-    g_assert(ret == 0);
     /* copy in the device tree */
     qemu_fdt_dumpdtb(fdt, fdtsize);
 
-- 
2.39.1


