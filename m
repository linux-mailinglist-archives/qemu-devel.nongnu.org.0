Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40CB58A916
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:56:51 +0200 (CEST)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJu4Y-00018N-Tp
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtog-0007Zf-Pa
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:28 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtob-0001g1-58
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:23 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id q190so1921781vsb.7
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LZCK1LNH2Rj6X2lYdtcZHY6VpwRx32I2PwlVD4SMxlk=;
 b=XoZUD7O4xvSOxrCRLxv+o9IXEcjt8dBoTgF6HIDIz5jyIVuR7dTZcN1qt8cD5MdxYX
 Urrlpg2hUMwV8pjTDJqGlWAXhhBe4Jiwq3wj+Hm2yF91oaHEo7gHsJNEXwirqAwmInh+
 7DRTzepMsbsdKPtuZROHr0p1nMR4VCQPT4L9ZXhuIToOEdjC3/LNYJu/rTyBhlgz68y5
 6ZP0mjR7XK3sP+wqeN2B6Yve2hZCDxhkjZ+lY3EnbJgL4t22PfExR3KoZ0DaaLcEYC91
 8TIPEe1LODGjlBj3ClxB6C1AkBP6tMiUzbp/IH+UCW0p4/bYb8nM1C1o7UREESwpMPKT
 756g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LZCK1LNH2Rj6X2lYdtcZHY6VpwRx32I2PwlVD4SMxlk=;
 b=YbjC6ADyMn0OouNocVJEVJQ+iZPrvPBuelBygJZ08AUqXfkdrL9Njefx5RylR9LVFi
 +D7rL5DKfEBCDlbPE0qwALaonTGgQzor7tOJzaUFW4UjL2/oEnHTU7GqITKvX6UoIjZH
 vDp9oW0CHP5nkjvIa6mUBKVe1sBiVb8wYPGLni3BkbpWKwcNMnCVuVTbFpviIFPs32Hq
 1c78x9QBqcv++T1lU7xbz0WM4oFiefLNuzjoTzxBUqhFnpzHP52EGCAPB66GpIuyT3Rk
 YBAa35uB9hrbC5hAVCPZ3G5UMCQSVFbMq6bYEBecO4Acko5iLcOrSOXpGbbQLTFu3tLK
 Blhw==
X-Gm-Message-State: ACgBeo35o4Jjg+UTVWIAa3kBVY2CRLRmUXz6yafuomAsGnvll3T1hDyC
 e2BX7hzKyucPhXziI9NepjsGxO2LfJY=
X-Google-Smtp-Source: AA6agR4x+oOfAJMTgrn2UF0WIksXVSM/Mq6HQ+vhLjLPLxU4oezy1cCtXC2vSamwc9bO/e7CYnvSkQ==
X-Received: by 2002:a67:c009:0:b0:357:92c6:77cc with SMTP id
 v9-20020a67c009000000b0035792c677ccmr2422917vsi.35.1659692417608; 
 Fri, 05 Aug 2022 02:40:17 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-7.2 v2 11/20] hw/riscv: set machine->fdt in
 sifive_u_machine_init()
Date: Fri,  5 Aug 2022 06:39:39 -0300
Message-Id: <20220805093948.82561-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the sifive_u machine.

Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/sifive_u.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4c814a3ea..10f5289966 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -634,6 +634,14 @@ static void sifive_u_machine_init(MachineState *machine)
         start_addr_hi32 = (uint64_t)start_addr >> 32;
     }
 
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Use fdt_pack() to shrink
+     * the blob size we're going to store.
+     */
+    fdt_pack(s->fdt);
+    machine->fdt = s->fdt;
+
     /* reset vector */
     uint32_t reset_vec[12] = {
         s->msel,                       /* MSEL pin state */
-- 
2.36.1


