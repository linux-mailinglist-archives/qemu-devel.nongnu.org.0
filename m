Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8476F59FF17
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:08:21 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQsvU-00088l-1r
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029O-AA
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf4-0002F3-58
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id bs25so21308065wrb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=t5fD4FpVwJ6lGJRoKb62Zn7TZwvFcPtyT/lOy3RUWs4=;
 b=J/aHVmrxk8eAm69nBlOxz/V3aaQXBU8p9yI/cyXpdcHaeRWuaCbu+lYMj5ezY54qsY
 nDk67kRe5XTKMeIoT8gG6T6yclI/rCoWCGorrWixmCFWOYS1YHzkzGE01woFQv7xgGAA
 adlFxsKC/7u/2fqGLvw7hqH2ibh6PajKKixRtkGrJz56FvGlmHcYhf+UgzsSbzv3muBi
 npKLoJUXqgHiaKBcouxE2euCMYxafmR79CXX8cVN4ezKbaAOh3be7MywRhzKB7PG7o1H
 hXpfHy0xpMzcVhBl0XLTgfsvle898wPn7a/AoYJQ0yiFeo2jYqKssJHipN3ZeIqH19eK
 iU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=t5fD4FpVwJ6lGJRoKb62Zn7TZwvFcPtyT/lOy3RUWs4=;
 b=m5j4SDwJWrKWVhME6JR0fes5DDM7xm15r+4AWmJ/uJslYfh5zsG+L5qPZWGBPZLuU8
 ybdZ5325UX5tKWGXnuUlq5fXZeRgTSl+XZenXLEVOB21zok26RGBiWkx+a1q8rQFmuqr
 76foN6udCD2mCTgoybqZYf9wF7BZRO7jFeB2yU+hyJkAfRECBXX1Pe7keDpff0JJidok
 48KyLIYhd1vU2tc/Qcv62OhAAkyWsRiMamwewUUDn04Ha2LfpKwMaN2KSAek7JrGqEse
 ZFRDjtT/WjXXhbUFg7Ozw3acWeH7fzYmu7xMDglxciIjaV0rfp2iAaKBI2Ahd+3XjKfU
 7JzQ==
X-Gm-Message-State: ACgBeo00buPEC8tH4bmMvMbqa81gkRjRyPlJMDmnt9lNkLGpCaDPMbri
 7UvNHkBu84eABDzJjj8+N63NCA==
X-Google-Smtp-Source: AA6agR7skeNK9t0jI8iVPPWw53qXjnvg4iZ8LZgoMBm0I8XISBdsGhrR3XA1cLBF7kVaDLDTumzHXw==
X-Received: by 2002:a5d:4882:0:b0:225:3148:9f85 with SMTP id
 g2-20020a5d4882000000b0022531489f85mr15612999wrq.224.1661356280850; 
 Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 04/10] hw/arm/virt: Use "msi-map" devicetree property for PCI
Date: Wed, 24 Aug 2022 16:51:08 +0100
Message-Id: <20220824155113.286730-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
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

The "msi-parent" property can be used on the PCI node when MSIs do not
contain sideband data (a device ID) [1]. In QEMU, MSI transactions
contain the requester ID, so the PCI node should use the "msi-map"
property instead of "msi-parent". In our case the property describes an
identity map between requester ID and sideband data.

This fixes a warning when passing the DTB generated by QEMU to dtc,
following a recent change to the GICv3 node:

  Warning (msi_parent_property): /pcie@10000000:msi-parent: property size (4) too small for cell size 1

[1] linux/Documentation/devicetree/bindings/pci/pci-msi.txt

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b6aa311d8c..ca5d213895 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1489,8 +1489,8 @@ static void create_pcie(VirtMachineState *vms)
     qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
 
     if (vms->msi_phandle) {
-        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-parent",
-                               vms->msi_phandle);
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-map",
+                               0, vms->msi_phandle, 0, 0x10000);
     }
 
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-- 
2.37.1


