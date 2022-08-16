Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56653596150
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:41:41 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0ZP-0002qv-UH
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sd-0004fI-8J; Tue, 16 Aug 2022 13:34:39 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:40903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sb-0002Mw-QG; Tue, 16 Aug 2022 13:34:38 -0400
Received: by mail-vk1-xa30.google.com with SMTP id c22so5515653vko.7;
 Tue, 16 Aug 2022 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7nsBpd6U2T94rIp6E9694uNRx1OUw5ceVkhMbv8n9sQ=;
 b=P5o9N1gtOqJtIt+KVeAIcYFnY2axcZt+0PhRXcxvygsNuovbH/pb/vlmPsyB8KM7Td
 k8B2qMaUukKNlhXozmm0YmempqVIbdOOf5westKuSJlCh6rLH8cRkUSTIIx+vhIzSluu
 Iuaw6fkuZxy0ZbZzPlWl4E1eZCZ0o0/D2cHOb0ELRHvxNPd/hJ77hvjrlfsrnU6QliAt
 2g6hSLkXqskIWa0+upRSuBZUutQeXlp1cUDDk2eVwfMHZQvi8agGR+uT1rXwUy3KmyeY
 k35a47YaUiizrzJBYlv0YUvMsNX9BDzzB6gddTywWVYVAiXF0a583bNh51Uz3u3zaIyH
 mDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7nsBpd6U2T94rIp6E9694uNRx1OUw5ceVkhMbv8n9sQ=;
 b=xPHj6XebuPZz72PfkqOHXott5YtKdzjUEUVDGdy/kEyhN6IidN4psDUVkB5ziKyxD/
 3QjRFdsM/JccXD5T/GqSRw0QqQNYvbe0R6E+bI9YyC999hIfISXQJTN0ccqQ4RFV95NA
 GCWXaAEeM6U0wPfdo2wqj9em0a6UIyTdHVwwRFLsfl/ulBfpZ26cDXfIypLjsjhyXkss
 kVhSdr4YOqyUk9NqnMHC0Z4f5ZnRC6OEfJWU2v66FH/V/gmkDjNRS97/y9a7O3TBtNOv
 wjO2n3Ib76v3ilWmqy4MLiFXvRtCwg8t1DihhG2AEeP+SIxYf/hSYY6hDGD7gdgJWRlE
 q3wg==
X-Gm-Message-State: ACgBeo2TNRhRa4eVWbY4fsFHVbSTK4RLoK/hUrmyAAW5xhCFB/VWptmv
 yMJ4f9RjSr0s6JYNVMvMzXGe3EwiPxjiCA==
X-Google-Smtp-Source: AA6agR4S37L5yKKK7Rwyc8fURHzsM2BUUpgs+ZmbWqTc5buv8GT4Gcqiut2n+uW19djfRBToPbuu7g==
X-Received: by 2002:a1f:9007:0:b0:377:83a0:b9a1 with SMTP id
 s7-20020a1f9007000000b0037783a0b9a1mr9556987vkd.32.1660671275878; 
 Tue, 16 Aug 2022 10:34:35 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH for-7.2 v3 01/20] hw/arm: do not free machine->fdt in
 arm_load_dtb()
Date: Tue, 16 Aug 2022 14:34:09 -0300
Message-Id: <20220816173428.157304-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa30.google.com
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

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

This is not an issue right now because there's no code that access
machine->fdt after arm_load_dtb(), but we're going to add a couple do
FDT HMP commands that will rely on machine->fdt being valid.

Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
machine->fdt. This will allow the FDT of ARM machines that relies on
arm_load_dtb() to be accessed later on.

Since all ARM machines allocates the FDT only once, we don't need to
worry about leaking the existing FDT during a machine reset (which is
something that other machines have to look after, e.g. the ppc64 pSeries
machine).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..669a978157 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,11 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /*
+     * Update the ms->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.37.2


