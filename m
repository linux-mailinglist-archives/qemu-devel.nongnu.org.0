Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26465E6B0B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:33:41 +0200 (CEST)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obR13-00027j-1B
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0002Df-J0
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB9-0005S9-QH
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id x18so10415941wrm.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=HVLDjT4fU1zPU/nL/+pXZz3AlOxWu0cbWVrJuViFf8w=;
 b=mT1icSoH9npd9mB/Lk4fzf68OXGKXKmlPueey7qtiS5WQ78MmrO5olF5+05uk5z8DH
 8ZS2p4pCXssQAOHaM32y45kLZ1vAgX1l3ro1gd3dEdBTfnzhX+QxhslOr/92yX9/zO7Z
 AuYvIZNrYhJs2Xa3tS/WxnzdbRarYqumuK75hFZO5h+vBTBie77t22FSU9GGIjoaWqzw
 L9BoVavWbZDR5+GwLzEGKc2BF3BOunH1aJHnaOSoxbqtZsSd/1mPXw5wb4O5HqNOIQ8Q
 oqcNaobfFyWKjy5SKa7k6SRR4DVGyFUjdTLsrtv+xnrNBpm5nP/GxDNJXLd2aDJlgC1Z
 bLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HVLDjT4fU1zPU/nL/+pXZz3AlOxWu0cbWVrJuViFf8w=;
 b=o0ZRPIrvJ3tlPmCC+Mqgw49FkjHsOOSle+tG3mRG6L7x8NXTh6lNeSHAwoM/K2sB4e
 S6dJqFt2aK9yzIJnT6hgycsJ124ht3IzD6m1trUer6hCPNWN7g/htrxu71OOMpSOhAsE
 JtH0VlyvoA/TWSWHd6CjOFsCigZ41JGtNMmkAnqbJjqlfzEhVWzKVVKcWw7HJBDs+DFn
 hzxYtopPoJ2QM+uV2vzLkFPnKZfIR4ZDXt4gtl4+9yTjR88TtTtaaIUph620cvr4FciS
 yLvX0+WX9ziEewzPBuw6MtnUzgMiPbaiUh+2KPxQbVk9h2Vqb6zIgaUQxtuekivxOtgH
 1s3Q==
X-Gm-Message-State: ACrzQf340BSll2K71/UGbQLlwf08xeBew93Y+xB4lwdmE8MTCeWVeu/Z
 eL5v5UWr8os2W1HzhjHtaiNgdjh5dN/dHA==
X-Google-Smtp-Source: AMsMyM48P/uJl7fnOvREGWfEg0PRQJMUxCtC8V5bbVNJD42Rw3X2t1Fmyd3qzPZp7guhiIDT3txJ0A==
X-Received: by 2002:a5d:6088:0:b0:228:e0c5:da5f with SMTP id
 w8-20020a5d6088000000b00228e0c5da5fmr2549947wrt.221.1663864557290; 
 Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/39] hw/i386/multiboot: Avoid dynamic stack allocation
Date: Thu, 22 Sep 2022 17:35:26 +0100
Message-Id: <20220922163536.1096175-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length array on
the stack. Replace the snprintf() call by g_strdup_printf().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-9-peter.maydell@linaro.org
---
 hw/i386/multiboot.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 0a10089f14b..963e29362e4 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -163,6 +163,7 @@ int load_multiboot(X86MachineState *x86ms,
     uint8_t *mb_bootinfo_data;
     uint32_t cmdline_len;
     GList *mods = NULL;
+    g_autofree char *kcmdline = NULL;
 
     /* Ok, let's see if it is a multiboot image.
        The header is 12x32bit long, so the latest entry may be 8192 - 48. */
@@ -362,9 +363,7 @@ int load_multiboot(X86MachineState *x86ms,
     }
 
     /* Commandline support */
-    char kcmdline[strlen(kernel_filename) + strlen(kernel_cmdline) + 2];
-    snprintf(kcmdline, sizeof(kcmdline), "%s %s",
-             kernel_filename, kernel_cmdline);
+    kcmdline = g_strdup_printf("%s %s", kernel_filename, kernel_cmdline);
     stl_p(bootinfo + MBI_CMDLINE, mb_add_cmdline(&mbs, kcmdline));
 
     stl_p(bootinfo + MBI_BOOTLOADER, mb_add_bootloader(&mbs, bootloader_name));
-- 
2.25.1


