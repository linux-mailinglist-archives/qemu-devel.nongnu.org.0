Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3BB5F0BE3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 14:45:07 +0200 (CEST)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFO3-0007A1-JH
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 08:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCO-0006XH-V0
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:33:01 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCN-0003Qh-7t
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:33:00 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s26so4052418pgv.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date;
 bh=19tiDMrMrp6otC4IABn8GhcIywk+2/OdxCJVUTJlxdE=;
 b=EMay5euiQ0loR6hJgLVz/1GmAyJibNWCiP8wVpkeIoqvjMX7EN0uHgRQYQU9VT1cGf
 AyXnht3Uw/dwzDPxY5/1Ds4Cf0ox6L59jSvRSz+BMgKjOAT9DZXoA2KvTKnagpfUp84l
 1FlO4oDIK6Ui7WwAORKqUcqkl5q91+oImSCwuEbr9yG47RfVnaNI4TdtIyPcNL4ZRG3f
 LKURMDUuegWLKqr2bShN9rPTRYZidWm7c4AOCFkw14oBspLI10tEjwhwJSu2RUxczSo3
 hr6xKgqBNRATG6JNnMxCNOFF+A4mj5UXlBgHxANO8+hRu3JEXE9c7HDt7bR06Sp2cJzR
 KZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=19tiDMrMrp6otC4IABn8GhcIywk+2/OdxCJVUTJlxdE=;
 b=GPQTR5Dgy+CCehdAYC7kaqEsfTBou17OBH+k+aV7hAEguVgMYfGjJMtMntIiF5J7Lw
 imlw+4UDen6Rt1yru9gyKYkEg80Jh4841soq5I90zbOKskm0tv9ALks4MJTqNNHnTVWT
 IXwAIe4ZnxelGf3Xka5AE5W8Ka4HUmsKUSjyh6ASfRXBOn5K/NPV83RqRpAggh05BbPl
 fUmMZ1Lbc2o464+tAnnxiULR3wwH8/sTUL8clP37Dc/GkYTzEHl3O4Hf8QZ0eA/aALLE
 0A7qpZvTSRN5zGc39J7fWVG2Dsapx7bq8eR9yWmG/zYB726+4Tu5xVBgcwRBdT7X5Vhx
 nSPQ==
X-Gm-Message-State: ACrzQf20jsX5jpJouaU3zd9xOwP3j887LdkwkJeIv/nSmDEV8jH5ud/8
 YQTm67iC6uJL91C/jFJAcxNg/XCBzaBF2J7jLpDqYRNn5y4GNVQTjc042LQJ5dwYOOWonrYBExt
 /7JEAX6hPvMHbqlZSG66KIE+Qya3Nn5z3TQDgmzPzgwthidcAiiLbSR8dCgA6PIN44gw=
X-Google-Smtp-Source: AMsMyM4BRq8ejC09Vhxd43OjSjlYK1kFL2deJcVLBG01g+VT9smHtvvID3sv8IspV1WbM3LMggyXCw==
X-Received: by 2002:a05:6a00:1253:b0:546:3d50:3284 with SMTP id
 u19-20020a056a00125300b005463d503284mr8684156pfi.72.1664541177409; 
 Fri, 30 Sep 2022 05:32:57 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a62d154000000b00537aa0fbb57sm1649880pfl.51.2022.09.30.05.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 05:32:57 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
Date: Fri, 30 Sep 2022 12:32:39 +0000
Message-Id: <20220930123239.15515-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220930123239.15515-1-jim.shu@sifive.com>
References: <20220930123239.15515-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=jim.shu@sifive.com; helo=mail-pg1-x52c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PLIC spec [1] requires interrupt source priority registers are WARL
field and the number of supported priority is power-of-2 to simplify SW
discovery.

Existing QEMU RISC-V machine (e.g. shakti_c) don't strictly follow PLIC
spec, whose number of supported priority is not power-of-2. Just change
each bit of interrupt priority register to WARL field when the number of
supported priority is power-of-2.

[1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#interrupt-priorities

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index f864efa761..218ccff8bd 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        if (value <= plic->num_priorities) {
+        if ((plic->num_priorities + 1) & (plic->num_priorities)) {
+            /*
+             * if "num_priorities + 1" is power-of-2, make each register bit of
+             * interrupt priority WARL (Write-Any-Read-Legal). Just filter
+             * out the access to unsupported priority bits.
+             */
+            plic->source_priority[irq] = value % (plic->num_priorities + 1);
+            sifive_plic_update(plic);
+        } else if (value <= plic->num_priorities) {
             plic->source_priority[irq] = value;
             sifive_plic_update(plic);
         }
@@ -207,7 +215,16 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
         uint32_t contextid = (addr & (plic->context_stride - 1));
 
         if (contextid == 0) {
-            if (value <= plic->num_priorities) {
+            if ((plic->num_priorities + 1) & (plic->num_priorities)) {
+                /*
+                 * if "num_priorities + 1" is power-of-2, each register bit of
+                 * interrupt priority is WARL (Write-Any-Read-Legal). Just
+                 * filter out the access to unsupported priority bits.
+                 */
+                plic->target_priority[addrid] = value %
+                                                (plic->num_priorities + 1);
+                sifive_plic_update(plic);
+            } else if (value <= plic->num_priorities) {
                 plic->target_priority[addrid] = value;
                 sifive_plic_update(plic);
             }
-- 
2.17.1


