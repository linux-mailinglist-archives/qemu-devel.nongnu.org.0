Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91CE5E6842
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:18:37 +0200 (CEST)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOuK-0007yD-Bg
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obObE-0007Pu-6k
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:58:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obObC-0004r1-KR
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:58:51 -0400
Received: by mail-pj1-x102b.google.com with SMTP id q3so10220243pjg.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=J0BC/3EcQfsXTNGyNkM9n7W9LXmca6FWQ/HgFM1ZtGY=;
 b=VAv4VudVwzy5mWJ8/oQavSd2k7QTkY8AD5BcyyJQjTfEBLaP+Rp6UuQC0+QJUarfKg
 mJdX6x5m79+9/21kIHza93c3HGvgd8ddkpKDxR3x0fI4PNzOO4XPuERBJR4YU+am+qD9
 XCNEljRPze13BQIii+2BflZa9cZFaxw0ad4eLpy3xwQZb2W16n9tD6z0kNMD9BqlssIJ
 4gYbVE1fbHei6SdwCsm/fAVNb47WY4peBlyxocxtX7vqg2kopS0kXqPz0Tr7O91zv18E
 LhSDnZXDoNvz8lWPTTsninP4L8Nv/gAC33yqoxH8x/ECgNZUgVHrbmov0cu3ekwe2W56
 HjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=J0BC/3EcQfsXTNGyNkM9n7W9LXmca6FWQ/HgFM1ZtGY=;
 b=6cY4pQnV7T8nzYYoAEocs2pvqXRWLDIbae4l5cs4VQemgHLx17jPi3KU7AURrgtX5G
 D3P1xlbUWza/mZJ0d0irFKMPUyeyAArGKIaNffonbme5hwb2UD6ZaSp8/XlLCShRbHjc
 8Y7GGNk8ElEzd+MYCl8LiDtV61AM8bQ3HatJtigm5/VD+D+Gz/c5APOKHTAU4kJ9B+2j
 gQp61lPLYBB/s0SoMNzHJci2tNTjB4YYy+7vHDJOxVvNqBvEgys/fD6ZNiLGwNoKTMEp
 I8thrSrqzLmuQhY7CWiW4x5xTsJ3YFag0mz28gqTHO7SiR6s1dChP8YGmyRYaUqfan2R
 mWKg==
X-Gm-Message-State: ACrzQf3qThs2/oBHcKtyQh9lYvXgeCiGmKRGZRR6jeK9HoevvMKGQRzH
 m/wtO/FXQC1HIPDOPvcLERHivFRjB6ZCpO2Nn6Brqw==
X-Google-Smtp-Source: AMsMyM5Ye+OppkVRJGGWe5WY0Vor8MEdgoYiHtCc2ypPPxR3/hAEQ4bvcIG/ihaR2oPla/ZvO/zGbu2iEnGUz1qBkk8=
X-Received: by 2002:a17:902:a517:b0:178:8bf4:c536 with SMTP id
 s23-20020a170902a51700b001788bf4c536mr4013727plq.62.1663862329399; Thu, 22
 Sep 2022 08:58:49 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 22 Sep 2022 08:58:38 -0700
Message-ID: <CAB88-qNFw_xOA0KB9rrr0pD30xFjFd6TRGX6M3TEEbZjVEEAwA@mail.gmail.com>
Subject: [PATCH v2 2/3] hw/intc: sifive_plic.c: Fix interrupt priority index.
To: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=tkng@rivosinc.com; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes a bug in which the index of the interrupt priority is off by 1.

For example, using an IRQ number of 3 with a priority of 1 is supposed to set
plic->source_priority[2] = 1, but instead it sets
plic->source_priority[3] = 1. When an interrupt is claimed to be
serviced, it checks the index 2 instead of 3.

Found when testing the OpenTitan Always-On watchdog bark interrupt on ZephyrOS.

Fixes: 0feb4a7129eb4f120c75849ddc9e50495c50cb63

Signed-off-by: Tyler Ng <tkng@rivosinc.com>
---
 hw/intc/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index af4ae3630e..1734e76aef 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -131,7 +131,7 @@ static uint64_t sifive_plic_read(void *opaque,
hwaddr addr, unsigned size)
     SiFivePLICState *plic = opaque;

     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
-        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;

         return plic->source_priority[irq];
     } else if (addr_between(addr, plic->pending_base,
plic->num_sources >> 3)) {
@@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
addr, uint64_t value,
     SiFivePLICState *plic = opaque;

     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
-        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;

         plic->source_priority[irq] = value & 7;
         sifive_plic_update(plic);
--
2.34.1

