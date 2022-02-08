Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C34AD9F1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:34:16 +0100 (CET)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQdL-00038j-2d
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:34:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqw-0000pT-R7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:10 -0500
Received: from [2a00:1450:4864:20::42a] (port=37433
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00029I-8I
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:10 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w11so30204436wra.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R+U0WlmEp4qPr7iVHCi2HAdqUU7KtQ2aWLdMsCHpUvE=;
 b=YuLWtESZ3JZAa3w0PmWcI0nb6zPuxQTusxeCnFRFKmhn7VJOO4LV9X5vKqvD4g3WhZ
 SWGFPTvBLhIzCeqXyRRy22ymcmb6w02F+ZhwuTqxrysHFVnRgsd1myXjopWP6WaxJFS3
 6P5oAYf77uQPYIXIexmAjU2cikALOhRVBD9tElT9+t/9oGICxAbYhaz5dNmhRcVF5pXb
 yXWn3FAPr62ILFd1yPv3sg95+UYc7myZS9iBvesfY1WQa8UskRyFPjIskUStluTNSmcg
 eadIIqVqnZQytZLkkPdYQLXKS5a+2fqRSiPJWeIGFGLDXLWIZLKZvIzdPpHINQZxti+w
 iW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+U0WlmEp4qPr7iVHCi2HAdqUU7KtQ2aWLdMsCHpUvE=;
 b=SA+9irU141FbV3RvFBGsrXCenyGCNqGj7NQz+HI3UEWCvjXD764vu34ROhFAYmA+im
 A7568OGXrFweu3KrfcS6qLHiHn0Iho2wfMxEF7/KHp969K1P2WQCtVWFPrd8FJkgFfMC
 3OpIEguB4a42JxdkYzcQG7/ZinlGCIcOkHfOsHFi65yI7H0iwFtHcVtlVWegsQgLJeL8
 SBgf2C/HycT9Ytz6DktdaCuSogZo7bd1NoEqy12J3mfvIwuy6lbB+6BvvOJJk4yXiiro
 k6J8yXsptldGTWCvaaylUtdvlhLTVXHuq98YqJ3ZGYB2eOHyxBSAjVOyLYgtbunpQYm1
 2Ybw==
X-Gm-Message-State: AOAM533LzbbsYJyrde+7LV0JXqaWEaSA1gLzSITG1+clo7N+QP/Qbr0M
 En1JyIgLRt0XjmuAO9yHDq0DnEDyxpvLzQ==
X-Google-Smtp-Source: ABdhPJxnaCEXnlhnt/Vd1dAgPDhqg/bWrjhnOwm4p/GM6UqxJSFVp4lVmFffz200RbyKyo+s381eDA==
X-Received: by 2002:a5d:6452:: with SMTP id d18mr3125089wrw.493.1644320404324; 
 Tue, 08 Feb 2022 03:40:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/39] hw/arm: versal-virt: Always call arm_load_kernel()
Date: Tue,  8 Feb 2022 11:39:31 +0000
Message-Id: <20220208113948.3217356-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Always call arm_load_kernel() regardless of kernel_filename being
set. This is needed because arm_load_kernel() sets up reset for
the CPUs.

Fixes: 6f16da53ff (hw/arm: versal: Add a virtual Xilinx Versal board)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20220130110313.4045351-2-edgar.iglesias@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-versal-virt.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index ef3231cdbb3..7c7baff8b7f 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -681,20 +681,13 @@ static void versal_virt_init(MachineState *machine)
     s->binfo.get_dtb = versal_virt_get_dtb;
     s->binfo.modify_dtb = versal_virt_modify_dtb;
     s->binfo.psci_conduit = psci_conduit;
-    if (machine->kernel_filename) {
-        arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
-    } else {
-        AddressSpace *as = arm_boot_address_space(&s->soc.fpd.apu.cpu[0],
-                                                  &s->binfo);
+    if (!machine->kernel_filename) {
         /* Some boot-loaders (e.g u-boot) don't like blobs at address 0 (NULL).
          * Offset things by 4K.  */
         s->binfo.loader_start = 0x1000;
         s->binfo.dtb_limit = 0x1000000;
-        if (arm_load_dtb(s->binfo.loader_start,
-                         &s->binfo, s->binfo.dtb_limit, as, machine) < 0) {
-            exit(EXIT_FAILURE);
-        }
     }
+    arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
 
     for (i = 0; i < XLNX_VERSAL_NUM_OSPI_FLASH; i++) {
         BusState *spi_bus;
-- 
2.25.1


