Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3A2AD579
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:41:54 +0100 (CET)
Received: from localhost ([::1]:56778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcS25-0003je-MX
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgZ-0002Gh-Dn
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:39 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgX-0006rb-L6
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id c9so2609906wml.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BEeTNdwwYMcXKSzVH6lUrJm19LvWtCWONokXJVBSspE=;
 b=QcMBbGaByr/PyndnutQ3lpn80ThkDZ3WQGOp5xCBGKa0e01RyJIFe0M2oKlWZL7sjY
 XAFgHs4PmDgVvNSJjNh/Bu4dBVdJmB1eDaW+flRqaTJr3A5lEgFnPAND7p3hKkX9WxcM
 GNx1LPcEFZev9vTsFocXQ9rCpZaRDdt9+3ch7cg+ggMdisVGWwq5XzwIdnl4dscidQzj
 MHj7/FAVa2uK6/FTzaDmrC2U+ohWGqGz6GePCcglDnibBeja9vLVQ2QzufQaubYXdd51
 8bS1HPkbabl3NtaiLIXzSLmHaUTpa2EYtrAGggZTG3RAPEjG11tcBKp9QieYcOh0Mm6o
 PqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEeTNdwwYMcXKSzVH6lUrJm19LvWtCWONokXJVBSspE=;
 b=on0sPj1qBgPGKby7c933wmky8OB/o97CqQxPzqZx0RYgQfLuNX59mvLZnHTu3GGg1u
 Opxa8mui4gAqZQ75Qbrwqu68hleLZSOLarmJXHTIQCU0Kzobh8GnLjhDTGeFaCZS4wnY
 I3eGD3yw5wXtnsti2DLSlha3waDcqg169TPUXV2zoQh0xXb7wsyliUXZLqN+aJABlb/q
 +oUiy7HuFJ4sg5Ir3TCGYREFF7sdaWOq6fwu+u6fcSNYXHr6L5LISQPEsdJDVZFPp7yQ
 a1dwXlNRilO7nPM2WCLbGJQ2mE6TIlb7wv7Mm7MmUlCRKFQP0rtqua8xJgcG/L8T8aR0
 Ullw==
X-Gm-Message-State: AOAM531KO+Jq9/cucGuRMo86MFaBGtunC5WV9t5lymWCNMzfJ4TrLRln
 dqbB+dP5tEbjYaPqlLPLhsb/BksYL6ogKg==
X-Google-Smtp-Source: ABdhPJzv0W8pCR4XIMBjudBzimziBxmofxv+C0L/Uxq0WT2i/KSqLZml2V3AVe18PW97xTOmioIHSg==
X-Received: by 2002:a1c:658b:: with SMTP id z133mr2748887wmb.1.1605007176065; 
 Tue, 10 Nov 2020 03:19:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] hw/arm/nseries: Check return value from
 load_image_targphys()
Date: Tue, 10 Nov 2020 11:19:15 +0000
Message-Id: <20201110111917.29539-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The nseries machines have a codepath that allows them to load a
secondary bootloader.  This code wasn't checking that the
load_image_targphys() succeeded.  Check the return value and report
the error to the user.

While we're in the vicinity, fix the comment style of the
comment documenting what this image load is doing.

Fixes: Coverity CID 1192904
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201103114918.11807-1-peter.maydell@linaro.org
---
 hw/arm/nseries.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 6215c18d627..387eea4d44c 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1369,7 +1369,8 @@ static void n8x0_init(MachineState *machine,
         /* No, wait, better start at the ROM.  */
         s->mpu->cpu->env.regs[15] = OMAP2_Q2_BASE + 0x400000;
 
-        /* This is intended for loading the `secondary.bin' program from
+        /*
+         * This is intended for loading the `secondary.bin' program from
          * Nokia images (the NOLO bootloader).  The entry point seems
          * to be at OMAP2_Q2_BASE + 0x400000.
          *
@@ -1377,9 +1378,15 @@ static void n8x0_init(MachineState *machine,
          * for them the entry point needs to be set to OMAP2_SRAM_BASE.
          *
          * The code above is for loading the `zImage' file from Nokia
-         * images.  */
-        load_image_targphys(option_rom[0].name, OMAP2_Q2_BASE + 0x400000,
-                            machine->ram_size - 0x400000);
+         * images.
+         */
+        if (load_image_targphys(option_rom[0].name,
+                                OMAP2_Q2_BASE + 0x400000,
+                                machine->ram_size - 0x400000) < 0) {
+            error_report("Failed to load secondary bootloader %s",
+                         option_rom[0].name);
+            exit(EXIT_FAILURE);
+        }
 
         n800_setup_nolo_tags(nolo_tags);
         cpu_physical_memory_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
-- 
2.20.1


