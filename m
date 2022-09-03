Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071D5AC131
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:41:39 +0200 (CEST)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ1K-0000I5-Ua
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuX-0006Ia-2e; Sat, 03 Sep 2022 15:34:33 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:44638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuV-0005L8-Hb; Sat, 03 Sep 2022 15:34:32 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 q6-20020a4aa886000000b0044b06d0c453so909839oom.11; 
 Sat, 03 Sep 2022 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
 b=kWJbqmdTeAman2sZ9rgUvk25oAgs3vC7PsQ1ZRS6wZvy5NvBFreEwiLUJC3rtkugFl
 pd9+RURO12Zm72ZXgxNy84+G3uCvtIjVzQPXekkZEcugRtUc8+5yrs9K4DydeChLgvqN
 KVSo0YIB7UWVCebj51z6ZdQqS+Hpzdmq802RfBzGarDp19Y1tjjEgVJtZP3ywd2zxhRS
 S0JzlF5CVEYOpdKcqAXayBLAELdOekBhEXYyZ1C/WS2BT0lCB1VW0/I9wG6D9xjgKRRx
 Uw+bW0Q7P76pnIeTIUI7MdsjTyc1xpoVtyJ2C3/LrvOwDy1nP2K0RE1DAArpPHlo8BDR
 AZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
 b=IRZ4VlrqpRZSTbIj3zp4y+cjtm8sIoSUwzsAlcnRdQLrbrEyVzBhCRnHKqAG08Fg8y
 zWxJc2ZYsfCXJ92J77yjOY/VeAQokH3zcvPj+IsGt94vdPq8gZcH0Krk4Wde+dzG9x93
 yGxbzvgev5amfMAfLjAaQ0yBQPgYUHnwl8bA7IT7HZV+2xIEN7aPW3x3/46ZpPNdC1Ow
 9MDK3mDo2msxjVBmM5x6SmFzfG9zFJLRyUsSAzkfyNF1dg6VgZSCaz0bslmwkbedCbKj
 DWBRbTUbt/8DGf6uLjU84YaoQ8c0kc1edpFBkUXYTRDXSi6Xm+0m2/jlEeG+a0oSiOt1
 L8JQ==
X-Gm-Message-State: ACgBeo2hpCmZKbEsp8HWVwtWyDhSCTwoFRyEAMLWSmcz4tPucseq5uON
 XgmhtCF7dcCLLWUruT/qmqm1MjL562SfOg==
X-Google-Smtp-Source: AA6agR7z5aUtRgOuC80D8Zc/1wYRHCU/gJQFNXhnqtfyYdQyQXoeBm3c/I/yD9DXXAmNf3mg52P32g==
X-Received: by 2002:a4a:1787:0:b0:44d:f068:d0e2 with SMTP id
 129-20020a4a1787000000b0044df068d0e2mr11928560ooe.27.1662233669512; 
 Sat, 03 Sep 2022 12:34:29 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 01/14] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Sat,  3 Sep 2022 16:34:07 -0300
Message-Id: <20220903193420.115986-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
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
machine->fdt after arm_load_dtb(), but we're going to add a QMP/HMP
FDT command that will rely on machine->fdt being valid.

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
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..60bbfba37f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.37.2


