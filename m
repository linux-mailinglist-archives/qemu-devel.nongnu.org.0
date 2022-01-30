Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38FF4A35DB
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 12:07:47 +0100 (CET)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE83d-0008Pz-UK
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 06:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zM-0006XU-E2; Sun, 30 Jan 2022 06:03:20 -0500
Received: from [2a00:1450:4864:20::12e] (port=36793
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zK-0008MZ-8g; Sun, 30 Jan 2022 06:03:19 -0500
Received: by mail-lf1-x12e.google.com with SMTP id z4so20976922lft.3;
 Sun, 30 Jan 2022 03:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x6yLIbYspJVYvRw9HXbfG9AYHgDE7MtZasbLFHtf3z4=;
 b=JT1q2QusY4OxtlPlg/hJKFVVnK/cZnCWfZM1zM70ODAgBW9Smg+loZWJBYsv9MtsIJ
 763q5I6RkisZjfYdusq5CZiP15uiImmk4qnm4A6sBHWjcZEZg6ofelFX1/r7a+E9jE36
 MYiMHi8hPiCFl1osh2xV/aROy8hORSTF76OZKuuQJUyv/9ty72WWRsHJNmXpmVS70cS0
 yWnOG6Wr7qorU1o7dVJfZk4Kfou4JsGJEpPmvdCm1q4YqcUQUNQpM9no1tML+3T43yJE
 EpN4YqiSNI3EKwYCQ3DHG5cC9j/lRvDsA1dSm0D8sctb4HNdMRyKp0yOEBpw95oZ9son
 nwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x6yLIbYspJVYvRw9HXbfG9AYHgDE7MtZasbLFHtf3z4=;
 b=No7WeGmEoBXLq/aQ3b86aUKsUD4dy3xntCV1tKnZEP4yP5hmFcidmXDwOmVq7e4Ogp
 lLHihn7oKDyj0Po99NNlh08ivPXpCn+AsHlhOW/tp+7doNWLrCreLMkejYwF/IbQ0MM7
 p8ClzyTR3yd46FTmpsONI8NREmAUQExPj+v1oBr53ALOgGm3C7HYvPl8iREOWH9GW6yD
 l6QDLG8sYZAUL9F7n5ag/k7CLpD/uUCr6VWzpSGGbqAOb0JlqdUU1lt/aFef9FgmiuR3
 B9De9TCMDlPS9BjALHcKRAwVb2lX8EiQ206lyVv9aC8t4KJI6cwF4GKpgwo/ABeTKJF+
 vLog==
X-Gm-Message-State: AOAM533JOWrbGu8ul758TYZD502/1qC/ipVIB7D7oiJOZps1MP64pdRH
 XPWCLTHT5hAcPvURS0244cfc2ql+QmBp4g==
X-Google-Smtp-Source: ABdhPJy2Ld5gHl6tq0BKUDR78Io7CPa/lgUSPhccRybC7qjtJ6sDthM4bpJcpJwGKYxxRB9i9jkz6A==
X-Received: by 2002:a05:6512:3b26:: with SMTP id
 f38mr6005958lfv.643.1643540595619; 
 Sun, 30 Jan 2022 03:03:15 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f22sm3232271lfj.261.2022.01.30.03.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 03:03:15 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] hw/arm: versal-virt: Always call arm_load_kernel()
Date: Sun, 30 Jan 2022 12:03:13 +0100
Message-Id: <20220130110313.4045351-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
References: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 luc@lmichel.fr, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Always call arm_load_kernel() regardless of kernel_filename being
set. This is needed because arm_load_kernel() sets up reset for
the CPUs.

Fixes: 6f16da53ff (hw/arm: versal: Add a virtual Xilinx Versal board)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index ef3231cdbb..7c7baff8b7 100644
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


