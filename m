Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C885F27FC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 06:20:30 +0200 (CEST)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofCwP-0000D8-L6
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 00:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr8-0003YW-1w
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 00:15:03 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr5-0006Tq-Sk
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 00:15:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id b5so8724585pgb.6
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 21:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date;
 bh=F+mjQgSIAnozHseNrNKmVtq1cIhjeBBYAbGF2zpCiHk=;
 b=casen/B75ua/AN1X/YMfDM+FAcr5wke3RSjmNvTO3zcVlcjuixOQFb/vSQ+q3yU/6L
 4/4SR8gFEnnci5HXxPUp1qs0I1iBhZvG0YU/BiCYQbXw9Ks5hUYkyMhR3oQ9jeA9zn9z
 5yO0r6WHzd38+IMMr6foYTL1O4tPwZt86AP/bA6Bqm29oBbMsOzk3BZMcboWFTzDBKME
 CUXFxjiT9SMg+qdE3h+y8ZRXCmQAJzjZMRuDT2ZsWb+JxMjhDkWOn2qjfbZw0yqjRYxH
 B7HA/qCKFmFGbIYIbOkbX55OIJGlewufIg30yD3iTVHit/0zlr/I7i6U/lkRvzl1RhZ2
 zDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=F+mjQgSIAnozHseNrNKmVtq1cIhjeBBYAbGF2zpCiHk=;
 b=JSpq6gZO/lhZx0vz5bjzHwpYRAE40Nv6JFtjj4YxVzkzQNuqKMx4lzX5CRN+om0Zy4
 VQLv2C/rWEX1A7FpMZOGc2rFeuhGP3/31gF0eliMY1hSo+rU6kH48Nb37HkyERL+bATY
 6n6loMYZBPhKgENPkr6W6eswipzk4uNN3ExBJl8iYpdX7NgoBveze3Bkc56vN+XMVpcB
 LK2h44tuzGvSMnWL6Cx54vwTmcOcgE4lnogqrKJqU/3+5UYuXW6vNjpZl/80EfVBw0Us
 G80/dpdkNyUjWXTVaWj8qhrmFADJ5ytBN6c1uyplTeaB16nbkdD7FrlNh5W70S5FIV4/
 HOEg==
X-Gm-Message-State: ACrzQf2E673bBfkGcmrOpAuxaZ714YPI6lVsoKVePbuG7I9XhU9qO7+0
 Nbab3Ww1rDlGI1r1FYcItnLLHttAGKFcVcNJ6BFnBHVpaXd0Ojblfg+kUMl78rdficVKFqCMyT3
 s+gru3GHCkvVTzPIvAT8fzSTDNc+ILlAjG2zWmgtCi6OL30mSlhFSR3YhPpkyrKq2HJk=
X-Google-Smtp-Source: AMsMyM6igbQ0Se816vi8zq5Px9W2pNLp3EF0yiD9tCWpm/16qcmmUvr7272YseSfpbErnWy6qcXo5Q==
X-Received: by 2002:a05:6a00:24d2:b0:542:f6e3:e18d with SMTP id
 d18-20020a056a0024d200b00542f6e3e18dmr20397910pfv.36.1664770498221; 
 Sun, 02 Oct 2022 21:14:58 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b0017732e4003bsm6108596plg.141.2022.10.02.21.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 21:14:57 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
Date: Mon,  3 Oct 2022 04:14:40 +0000
Message-Id: <20221003041440.2320-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221003041440.2320-1-jim.shu@sifive.com>
References: <20221003041440.2320-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=jim.shu@sifive.com; helo=mail-pg1-x535.google.com
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
index f864efa761..c2dfacf028 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        if (value <= plic->num_priorities) {
+        if (((plic->num_priorities + 1) & plic->num_priorities) == 0) {
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
+            if (((plic->num_priorities + 1) & plic->num_priorities) == 0) {
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


