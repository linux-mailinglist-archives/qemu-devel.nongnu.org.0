Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440BF59618B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:54:29 +0200 (CEST)
Received: from localhost ([::1]:56856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0lo-0004Uq-CO
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sy-0005Ea-Oh; Tue, 16 Aug 2022 13:35:10 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sx-0002O0-8W; Tue, 16 Aug 2022 13:35:00 -0400
Received: by mail-vk1-xa31.google.com with SMTP id j11so5516603vkk.11;
 Tue, 16 Aug 2022 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+tgSxhNIGYEobQmCYPQhC6Jsb/JEojThXZIWNcaw8QA=;
 b=NMJlOMhGGsWal+5MCDocMbS+0R9gmmahaaMfSEOlJmY9sAEQR4x+ILglD5aZSR254c
 THJ91IhGdiXr8bC1y5bN1mRHdL00orLE/16bB3sd+d3TpBZpjJsMECPlmSkQ6L9OgNEi
 HZtQvcvRf6AZ41enalFgWUDeVR/mRK+lBf6MJPWQbG/URuEE6ZrKPpdzVM/fxIxUT6iB
 ElPi7U9Y9XAUHaIV6ADsDFUio96GtCJKGdZoOfOozRYpK0JG6fHvvoP9mQf2bAhJ4IGh
 HQfLikO8JOTaYWhwvjKhRL/g/7x3+HUJkVgASsblbIajCUTjvOEJ1AwdDmDwDuLUkAHT
 3FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+tgSxhNIGYEobQmCYPQhC6Jsb/JEojThXZIWNcaw8QA=;
 b=OsanPnVcU/XC6qAViYSxgdHbVyIdlGuLUHsc1GSCpAkvmIxhoFCwZiElATQe0c1B56
 X0ckwbbyJArQxri9cEjbTbhIFPG64jGpndf2BqUnL86i1BLXLR/c9xiWgYDP8+w/qQNE
 nFsbkpi7TIjBUVQLrUSdb9Agz2aXaH/8L5gtIVok7NhPteaNeZuad0w7twbSnyZKyzpT
 T3sRixMZ1CBUTHn0ETNSaOvwbLRX+OPKutYtz5YTLI9k6fWgyc80eoBMKB8J/5pzT9b4
 GPzGPwI68qn3Dm/J+trS2/b70Agqo4v1YMA3ceKmGcq5jYtu8MgtHTHxz0LoSd8cH2Pw
 i3rg==
X-Gm-Message-State: ACgBeo259wyM859hmxAan4CMIDPhoi/gistuMJUXHP95r9dJrO1z8qIJ
 Lp63Si102N2nVQGpzid2eM4rRSYLfs9P3A==
X-Google-Smtp-Source: AA6agR762/0460CKqkAAO4gIlTTfmMLwSHNG77DySbm5vDpRrgn7e4BLm8P7i41WxWzcksv2klt8RQ==
X-Received: by 2002:a1f:9013:0:b0:377:2b95:d7a5 with SMTP id
 s19-20020a1f9013000000b003772b95d7a5mr9570376vkd.24.1660671297938; 
 Tue, 16 Aug 2022 10:34:57 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH for-7.2 v3 09/20] hw/ppc: set machine->fdt in pnv_reset()
Date: Tue, 16 Aug 2022 14:34:17 -0300
Message-Id: <20220816173428.157304-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
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
all powernv machines.

Cc: Cédric Le Goater <clg@kaod.org>
Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d3f77c8367..296995a600 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -608,7 +608,13 @@ static void pnv_reset(MachineState *machine)
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
     cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
 
-    g_free(fdt);
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' commands. Free the existing
+     * machine->fdt to avoid leaking it during a reset.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 }
 
 static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
-- 
2.37.2


