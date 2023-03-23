Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16E6C71C5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 21:45:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfRnT-0004Mk-Sl; Thu, 23 Mar 2023 16:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRnQ-0004MO-LO; Thu, 23 Mar 2023 16:44:28 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRnM-0006tL-HX; Thu, 23 Mar 2023 16:44:26 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17786581fe1so23887482fac.10; 
 Thu, 23 Mar 2023 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679604262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=znoAB/+DZD4lDjofu/rLoyYbQId/Knw6hOu3UZCCyXU=;
 b=WnmpbDaTpXjRq6UkDecPUfRJ7lA+5ZqQnHelK+7RLm32pSB8vJa+mTpuv0gRv3x7So
 BCgc7r6C0KUo/gEh72TGoFlTZV716S4O54Y60Wb4so5Nsu0nkt8UcJ5NJ9Am8enwa8Ff
 d3egojeklGq5z+Foiha6/hWjYN+iZ1HVjEyv7LivlsUnA0JJwsPWN+GPUuyxuyc05SKF
 CKDhboUjTdrC3E0H3C7AzqU9ewRyFudxa4VuXxzH0fFWMcNHmlyefAnjxMGtlyTGAbA8
 wauoR7Wm8dh/3bMVm32cs2GMfOYC5gnVTkv+QXnaLOyL92r9iMJX2YbnvbmRwNOq8w1H
 W9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679604262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=znoAB/+DZD4lDjofu/rLoyYbQId/Knw6hOu3UZCCyXU=;
 b=LSYZFJbvlrgHZexfa+G97jJUuMKauMwZr5bTK1TxHkf/JA2FiLo6Pn9nJeyvN0nazp
 JnEtodgw3Vo8wVi+DsqwTSfFIvWflT/ewbrMfjcDbbnTwpZIIKC+I0KoqzLhluAgcppP
 dO8Q/0RsYL9VHptNYxUMoMRiel3fpK9ISPqtTGZnUo2sP886jJ+w26bsGEBaXxBHPp6I
 Uz5TWzZP8QE5FOnhfveMr0NmlFcc8sVSnzhCCMurFmaGQEqGOTv2GwPnlXvIHF5Hm3Fg
 osHEzO9UjYpw5GEOIUL5wfW2Kmkn5QhFEw/A7vawOyU0vvJ3zCr64JZwBc3N9kyxitZf
 kHIg==
X-Gm-Message-State: AAQBX9e81zaN7hl/W2eDPECvOYPXzvRpDhvocd9B0ZCSzE8O7moYY/4G
 9/AzDiN7Cf1pHjQfhpk7l2CjOwgtMB8=
X-Google-Smtp-Source: AKy350ZgNLmq831lJUppKinTzQgonoU0jaZzHU5hlO5XnrzH18SminZAzbljBzSFN4ZjGSbzsSXSoA==
X-Received: by 2002:a05:6870:e88a:b0:17a:c7ff:ccf7 with SMTP id
 q10-20020a056870e88a00b0017ac7ffccf7mr519639oan.28.1679604262732; 
 Thu, 23 Mar 2023 13:44:22 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 vd21-20020a0568708f9500b0017ae1aede32sm6442081oab.46.2023.03.23.13.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 13:44:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v2 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Thu, 23 Mar 2023 17:44:14 -0300
Message-Id: <20230323204414.423412-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230323204414.423412-1-danielhb413@gmail.com>
References: <20230323204414.423412-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

After the command 'dumpdtb' were introduced a couple of releases ago,
running it with any ARM machine that uses arm_load_dtb() will crash
QEMU.

Let's enable all arm_load_dtb() callers to use dumpdtb properly. Instead
of freeing 'fdt', assign it back to ms->fdt.

Note that all current callers (sbsa-ref.c, virt.c, xlnx-versal-virt.c)
are assigning ms->fdt before arm_load_dtb() is called, regardless of
whether the user is inputting an external FDT via '-dtb'. To avoid
leaking the board FDT if '-dtb' is used (since we're assigning ms->fdt
in the end), free ms->fdt before load_device_tree().

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Fixes: bf353ad55590f ("qmp/hmp, device_tree.c: introduce dumpdtb")
Reported-by: Markus Armbruster <armbru@redhat.com>i
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 50e5141116..de18c0a969 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -549,6 +549,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
             goto fail;
         }
 
+        /*
+         * If we're here we won't be using the ms->fdt from the board.
+         * We'll assign a new ms->fdt at the end, so free it now to
+         * avoid leaking the board FDT.
+         */
+        g_free(ms->fdt);
+
         fdt = load_device_tree(filename, &size);
         if (!fdt) {
             fprintf(stderr, "Couldn't open dtb file %s\n", filename);
@@ -689,7 +696,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
-    g_free(fdt);
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.39.2


