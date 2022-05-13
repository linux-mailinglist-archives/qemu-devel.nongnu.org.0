Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA655262BC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 15:16:29 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npV9g-0008WB-W9
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 09:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6l-0005hz-5b
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:13:28 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6g-0007d9-Rh
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:13:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id k126so4789040wme.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZOTl4ibDRdtOyEL212041ezVq+53TlvBxM0zJ1ux+kM=;
 b=zbOJocrG6BoZUx45clliWjLnWHF+QpDqgDWPeUQI4+JaPxD9eW8YbXBq3dikraLoh1
 TzoXvXSZPndFQDO85hKRu4HRhXV0FRVnwfXR545FU26S1xz5Ta97urawbiDMKt7AihJo
 OjcVe7xKeXsDQVAsc9H7KXCuK9OLy8dKdl7ELSnSBwPN7hiW+ing2JdKUSSSy3T3msxh
 tmGgvfVHVnbIRu6DDy8W9JkkWKoaNYid8QhpDzQ5SxfhXyd8NSGGLGfoGO2L7NTDslrd
 d4nk1aJPnmJju8CaDDWTyj1z6Pe0xbxQCLPArcDLg2sdXkW8YlTje7ultWCvZ0DIsr26
 u7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOTl4ibDRdtOyEL212041ezVq+53TlvBxM0zJ1ux+kM=;
 b=YKh/xFtkSOShEpl24u/Thm1MLgFhG3p+s5nIpBBypN4HCM0NEYQ/dEWCjM3z1SNE9W
 2uyWY3f0ctHNBI8g27jpjucBYTHSOBtrn66KnFwlQfzAxiAulgaQ0tCpLkHA2MoW5hS+
 JHR2lWeyGOtIBgLksY+6bJhfGU3F0gPIlvgcbNBjrXHtkQaabu02JNTeTRhcB5A/FeRk
 qNyb1EEk/Sm/wt1xJLotC1lFYlyhNINUTg+sav0xDAyuRO6l6jE/+3E3K8c1lTha+O4O
 tYaU6FYl3EjyOhv4NFSTDBapkd/1bvxqnTH3C1ZYU4dGvcUydxPwEc+pt5v/EhJUN+YT
 Q0jg==
X-Gm-Message-State: AOAM530DPi+HAZV74Sss5AjeiGHMXrQn1W0xbsJWXyY3rrkOsuUQvQIN
 +ESCgY091NsaRxTnUKgy3Gn0jQ==
X-Google-Smtp-Source: ABdhPJxNmfpW0Qou2b42pbPeK3sLYlB/QzmQVzw5AFpqLFy8WVi0ChJd4ZyBHiJces8nugV1kzXscA==
X-Received: by 2002:a05:600c:1986:b0:394:867f:984c with SMTP id
 t6-20020a05600c198600b00394867f984cmr15019881wmq.20.1652447599770; 
 Fri, 13 May 2022 06:13:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b0039456fb80b3sm5214887wmf.43.2022.05.13.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:13:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/virt: Fix incorrect non-secure flash dtb node name
Date: Fri, 13 May 2022 14:13:15 +0100
Message-Id: <20220513131316.4081539-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513131316.4081539-1-peter.maydell@linaro.org>
References: <20220513131316.4081539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

In the virt board with secure=on we put two nodes in the dtb
for flash devices: one for the secure-only flash, and one
for the non-secure flash. We get the reg properties for these
correct, but in the DT node name, which by convention includes
the base address of devices, we used the wrong address. Fix it.

Spotted by dtc, which will complain
Warning (unique_unit_address): /flash@0: duplicate unit-address (also used in node /secflash@0)
if you dump the dtb from QEMU with -machine dumpdtb=file.dtb
and then decompile it with dtc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a45f44435e..587e885a98c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1195,7 +1195,7 @@ static void virt_flash_fdt(VirtMachineState *vms,
         qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
         g_free(nodename);
 
-        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase + flashsize);
         qemu_fdt_add_subnode(ms->fdt, nodename);
         qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
         qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-- 
2.25.1


